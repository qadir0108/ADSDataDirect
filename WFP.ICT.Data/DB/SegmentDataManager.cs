using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Configuration;
using WFP.ICT.Data.DB;

namespace WFP.ICT.Data
{
    public static class SegmentDataManager
    {
        public static readonly string CustomerCode = "greatlakehonda";
        public static List<SegmentResponse> FetchSegmentsData(SegmentParameters parameters)
        {
            List<SegmentResponse> data = new List<SegmentResponse>();
            string connectionString = WebConfigurationManager.ConnectionStrings["SegmentsConnection"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("[dbo].[OneLocationData]", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@DataQuantity", SqlDbType.BigInt).Value = parameters.DataQuantity;
                    command.Parameters.Add("@CustomerCode", SqlDbType.VarChar).Value = parameters.CustomerCode;
                    SqlParameter parameter = command.Parameters
                              .AddWithValue("@Zips", parameters.Zips);
                    parameter.SqlDbType = SqlDbType.Structured;
                    parameter.TypeName = "dbo.ZipCodeFilters";

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    try
                    {
                        long index = 1;
                        while (reader.Read())
                        {
                            data.Add(new SegmentResponse()
                            {
                                Index = index++,
                                // = , //"",
                                SalesMasterId = reader.GetInt32(0), //reader["SalesMasterId"] as string,
                                FirstName = reader["FirstName"] as string,
                                LastName = reader["LastName"] as string,
                                Address = reader["Address"] as string,
                                City = reader["City"] as string,
                                State = reader["State"] as string,
                                Zip = reader["Zip"] as string,
                                Apt = reader["Apt"] as string,
                                Zip4 = reader.GetInt16(8), //reader["Zip4"] as string,
                                Dealership_ID = reader["Dealership_ID"] as string,
                            });
                        }
                    }
                    finally
                    {
                        // Always call Close when done reading.
                        reader.Close();
                    }
                }
            }
            return data;
        }
    }
}
