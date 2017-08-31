using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;

namespace ADSDataDirect.Core.DB
{
    public static class SegmentDataManager
    {
        public static readonly string CustomerCode = "greatlakehonda";
        public static List<SegmentResponse> FetchSegmentsData(WfpictContext db, SegmentParameters parameters)
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
                    //LogHelper.AddLog(db, LogType.DataProcessing, "TT", $"Connection open sucessfully.");
                    SqlDataReader reader = command.ExecuteReader();
                    try
                    {
                        long index = 1;
                        while (reader.Read())
                        {
                            //LogHelper.AddLog(db, LogType.DataProcessing, "TTT", $"Fetched record {index} sucessfully. ");
                            var segmentData = new SegmentResponse()
                            {
                                Index = index++,
                            };
                              
                            if (reader["SalesMasterId"] != DBNull.Value)
                                segmentData.SalesMasterId = reader.GetInt32(0); //reader["SalesMasterId"]

                            if (reader["FirstName"] != DBNull.Value)
                                segmentData.FirstName = reader["FirstName"] as string;

                            if (reader["LastName"] != DBNull.Value)
                                segmentData.LastName = reader["LastName"] as string;

                            if (reader["Address"] != DBNull.Value)
                                segmentData.Address = reader["Address"] as string;

                            if (reader["City"] != DBNull.Value)
                                segmentData.City = reader["City"] as string;

                            if (reader["State"] != DBNull.Value)
                                segmentData.State = reader["State"] as string;

                            if (reader["Zip"] != DBNull.Value)
                                segmentData.Zip = reader["Zip"] as string;
                            
                            if (reader["Apt"] != DBNull.Value)
                                segmentData.Apt = reader["Apt"] as string;

                            if (reader["Zip4"] != DBNull.Value)
                                segmentData.Zip4 = reader.GetInt16(8);

                            if (reader["Dealership_ID"] != DBNull.Value)
                                segmentData.State = reader["Dealership_ID"] as string;

                            //LogHelper.AddLog(db, LogType.DataProcessing, "TTT", $"Record {index} loaded sucessfully. ");

                            data.Add(segmentData);
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
