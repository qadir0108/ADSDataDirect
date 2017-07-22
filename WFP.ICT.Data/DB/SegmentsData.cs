using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Configuration;

namespace WFP.ICT.Data
{
    public class SegmentsData
    {
        public static void FetchSegmentsData()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["SegmentsConnection"].ConnectionString;
            string queryString = "SELECT tPatCulIntPatIDPk, tPatSFirstname, tPatSName, tPatDBirthday  FROM  [dbo].[TPatientRaw] WHERE tPatSName = @tPatSName";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(queryString, connection))
                {
                    command.Parameters.AddWithValue("@tPatSName", "Your-Parm-Value");
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    try
                    {
                        while (reader.Read())
                        {
                            Console.WriteLine(string.Format("{0}, {1}", reader["tPatCulIntPatIDPk"], reader["tPatSFirstname"]));// etc
                        }
                    }
                    finally
                    {
                        // Always call Close when done reading.
                        reader.Close();
                    }
                }
            }
        }
    }
}
