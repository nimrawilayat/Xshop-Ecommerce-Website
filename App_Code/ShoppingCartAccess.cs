using System;
using System.Collections.Generic;
using System.Web;
using System.Data.Common;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.SessionState;
/// <summary>
/// Summary description for ShoppingCartAccess
/// </summary>
/// // Create a new database provider factory

public class ShoppingCartAccess
{
	public ShoppingCartAccess()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    // Returns the number of days for shopping cart expiration
    
    private static string shoppingCartId
    {
        // returns the shopping cart ID for the current user

        get
        {
            // get the current HttpContext
            HttpContext context = HttpContext.Current;
            // try to retrieve the cart ID from the user cookie
            //string cartId = context.Request.Cookies["Database_CartID"].Value;
             // if the cart ID isn't in the cookie..

             // check if the cart ID exists as a cookie
          if (context.Request.Cookies["Database_CartID"] != null)
            {
               // return the id
                string cartId= context.Request.Cookies["Database_CartID"].Value;
             return cartId;
            }
          else
              // if the cart ID doesn't exist in the cookie as well, generate
               // a new ID
            {
             // generate a new GUID
    string cartId=Guid.NewGuid().ToString();
                // create the cookie object and set its value
                 HttpCookie cookie = new HttpCookie("Database_CartID", cartId);
                 // set the cookie's expiration date
                 int howManyDays = DatabaseConfiguration.CartPersistDays;
               DateTime currentDate = DateTime.Now;
              TimeSpan timeSpan = new TimeSpan(howManyDays, 0, 0, 0);
              DateTime expirationDate = currentDate.Add(timeSpan);
               cookie.Expires = expirationDate;
              // set the cookie on the client's browser
                context.Response.Cookies.Add(cookie);
               // return the CartID
             return cartId.ToString();
             }
         }

       

    }
    // Add a new shopping cart item
    public static bool AddItem(string productId)
    {
        string strConnectionString = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
        SqlConnection myConnect = new SqlConnection(strConnectionString);
        myConnect.Open();
        SqlCommand cmd = new SqlCommand("ShoppingCartAddItem", myConnect);
        cmd.CommandType = CommandType.StoredProcedure;
        
        
        DbParameter param = cmd.CreateParameter();
        param.ParameterName = "@CartID";
        param.Value = shoppingCartId;
        param.DbType = DbType.String;
        param.Size = 36;
        cmd.Parameters.Add(param);
        // create a new parameter
        param = cmd.CreateParameter();
        param.ParameterName = "@ProductID";
        param.Value = productId;
        param.DbType = DbType.Int32;
        cmd.Parameters.Add(param);
        int ra = cmd.ExecuteNonQuery();
        myConnect.Close();
        if (ra > 0)
            return true;
        else
            return false;

       
    }

    // Update the quantity of a shopping cart item
    public static bool UpdateItem(string productId, int quantity)
    {
        string strConnectionString = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
        SqlConnection myConnect = new SqlConnection(strConnectionString);
        myConnect.Open();
        SqlCommand cmd = new SqlCommand("ShoppingCartUpdateItem", myConnect);
        cmd.CommandType = CommandType.StoredProcedure;
        DbParameter param = cmd.CreateParameter();
        param.ParameterName = "@CartID";
        param.Value = shoppingCartId;
        param.DbType = DbType.String;
        param.Size = 36;
        cmd.Parameters.Add(param);
        // create a new parameter
        param = cmd.CreateParameter();
        param.ParameterName = "@ProductID";
        param.Value = productId;
        param.DbType = DbType.Int32;
        cmd.Parameters.Add(param);
        // create a new parameter
        param = cmd.CreateParameter();
        param.ParameterName = "@Quantity";
        param.Value = quantity;
        param.DbType = DbType.Int32;
        cmd.Parameters.Add(param);
        int ra = cmd.ExecuteNonQuery();
        myConnect.Close();
        if (ra > 0)
            return true;
        else
            return false;

    }
    // Remove a shopping cart item
    public static bool RemoveItem(string productId)
    {
        string strConnectionString = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
        SqlConnection myConnect = new SqlConnection(strConnectionString);
        myConnect.Open();
        SqlCommand cmd = new SqlCommand("ShoppingCartRemoveItem", myConnect);
        cmd.CommandType = CommandType.StoredProcedure;
        int ra=cmd.ExecuteNonQuery();
        DbParameter param = cmd.CreateParameter();
        param.ParameterName = "@CartID";
        param.Value = shoppingCartId;
        param.DbType = DbType.String;
        param.Size = 36;
        cmd.Parameters.Add(param);
        // create a new parameter
        param = cmd.CreateParameter();
        param.ParameterName = "@ProductID";
        param.Value = productId;
        param.DbType = DbType.Int32;
        cmd.Parameters.Add(param);
        myConnect.Close();
        if (ra > 0)
            return true;
        else
            return false;
    }
    // Retrieve shopping cart items
       public static DataTable GetItems()
       {
        string strConnectionString = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
        SqlConnection myConnect = new SqlConnection(strConnectionString);
        myConnect.Open();
        SqlCommand cmd = new SqlCommand("ShoppingCartGetItems", myConnect);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
           // create a new parameter
         DbParameter param = cmd.CreateParameter();
          param.ParameterName = "@CartID";
          param.Value = shoppingCartId;
          param.DbType = DbType.String;
          param.Size = 36;
          cmd.Parameters.Add(param);

                DataTable dt = new DataTable();
                da.Fill(dt);
                SqlDataReader reader = cmd.ExecuteReader();
                myConnect.Close();
                return dt;

       }
       // Retrieve shopping cart items
       public static decimal GetTotalAmount()
       {
           string strConnectionString = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
           SqlConnection myConnect = new SqlConnection(strConnectionString);
           myConnect.Open();
           SqlCommand cmd = new SqlCommand("ShoppingCartGetTotalAmount", myConnect);
           cmd.CommandType = CommandType.StoredProcedure;
          
           DbParameter param = cmd.CreateParameter();
           param.ParameterName = "@CartID";
           param.Value = shoppingCartId;
           param.DbType = DbType.String;
           param.Size = 36;
           cmd.Parameters.Add(param);
           // return the result table
           int countDis = Convert.ToInt32(cmd.ExecuteScalar());
           myConnect.Close();
           return countDis;
       }

       // Create a new order from the shopping cart
       public static int CreateOrder()
       {
           string strConnectionString = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
           SqlConnection myConnect = new SqlConnection(strConnectionString);
           myConnect.Open();
           SqlCommand cmd = new SqlCommand("CreateOrder", myConnect);
           cmd.CommandType = CommandType.StoredProcedure;
           // get a configured DbCommand object
           DbParameter param = cmd.CreateParameter();
           param.ParameterName = "@CartID";
           param.Value = shoppingCartId;
           param.DbType = DbType.String;
           param.Size = 36;
           cmd.Parameters.Add(param);
           // return the result table
           int countDis = Convert.ToInt32(cmd.ExecuteScalar());
           myConnect.Close();
           return countDis;
       }

}


