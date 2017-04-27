<%@ Page Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewPage<ReportModel>" %>
<%@ Import Namespace="WFP.ICT.Web.Reports"%>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=14.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
        <title></title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    </head>

    <body>
        <div>
            <script runat="server">
                private void Page_Load(object sender, EventArgs e)
                {
                    ReportViewer1.ProcessingMode = ProcessingMode.Local;
                    ReportViewer1.LocalReport.EnableExternalImages = true;
                    ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Reports/Campaign.rdlc");
                    ReportDataSource datasource = new ReportDataSource("CampaignDataset", Model.DataSet.Tables[0]);
                    ReportViewer1.LocalReport.DataSources.Clear();
                    ReportViewer1.LocalReport.DataSources.Add(datasource);

                    var parametersCollection = new List<ReportParameter>();
                    parametersCollection.Add(new ReportParameter("pLogoUrl", Model.Parameters["pLogoUrl"].ToString(), false));
                    ReportViewer1.LocalReport.SetParameters(parametersCollection);

                    ReportViewer1.LocalReport.Refresh();
                    ReportViewer1.DataBind();
                }
            </script>
            <form id="Form1" runat="server">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <rsweb:reportviewer id="ReportViewer1" runat="server" height="95%" width="100%" 
                    SizeToReportContent="true" AsyncRendering="false" ProcessingMode="Local">
                </rsweb:reportviewer>
            </form>        
        </div>
    </body>
</html>
