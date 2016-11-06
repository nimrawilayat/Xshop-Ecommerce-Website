using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.Common;
using System.Web.SessionState;
using System.Web.Configuration;

public partial class productdetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.Count != 0)
        {

            int ProductID = Convert.ToInt32(Request.QueryString["pid"]);
            if (!IsPostBack)
            {

                string strConnectionString = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
                SqlConnection myConnect = new SqlConnection(strConnectionString);
                myConnect.Open();
                SqlCommand cmd = new SqlCommand("SELECT pid, pname, price, description,image FROM product WHERE pid=" + ProductID, myConnect);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);


                SqlDataReader reader = cmd.ExecuteReader();
                DataList1.DataSource = reader;
                DataList1.DataBind();


            }

        }




        else
        {
            Response.Redirect("Default.aspx");
        }

    }

    protected void AddToCart_Click(object sender, EventArgs e)
    {
        // Retrieve ProductID from the query string
        string productId = Request.QueryString["pid"];
        // Retrieve the selected product options
       // string options = "";
       /* foreach (Control cnt in attrPlaceHolder.Controls)
        {
            if (cnt is Label)
            {
                Label attrLabel = (Label)cnt;
                options += attrLabel.Text;
            }
            if (cnt is DropDownList)
            {
                DropDownList attrDropDown = (DropDownList)cnt;
                options += attrDropDown.Items[attrDropDown.SelectedIndex] + "; ";
            }
        }*/
        // Add the product to the shopping cart
        ShoppingCartAccess.AddItem(productId);
    }

    protected void ViewCart_Click(object sender, EventArgs e)
    {
        Response.Redirect("ShoppingCart.aspx");
    }
    
}