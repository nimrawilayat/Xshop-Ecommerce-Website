using System;
using System.Collections.Generic;
using System.Web;
using System.Configuration;
/// <summary>
/// Repository for BalloonShop configuration settings
/// </summary>
public static class DatabaseConfiguration
{
    // Caches the connection string
    private static string dbConnectionString;
    // Caches the data provider name
    private static string dbProviderName;
    static DatabaseConfiguration()
    {
        dbConnectionString = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
        dbProviderName = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ProviderName;
    }
    // Returns the connection string for the BalloonShop database
    public static string DbConnectionString
    {
        get
        {
            return dbConnectionString;
        }
    }
    // Returns the data provider name
    public static string DbProviderName
    {
        get
        {
            return dbProviderName;
        }
    }
    public static int CartPersistDays
    {
        get
        {
            return int.Parse(ConfigurationManager.AppSettings["CartPersistDays"]);
        }
    }
}