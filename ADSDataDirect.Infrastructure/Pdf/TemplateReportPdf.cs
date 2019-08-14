using ADSDataDirect.Enums;
using ADSDataDirect.Infrastructure.Db;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace ADSDataDirect.Infrastructure.TemplateReports
{
    public class TemplateReportPdf
    {
        readonly string DownloadPath = HttpContext.Current.Server.MapPath($"~/Downloads");
        readonly string BootstrapPath = HttpContext.Current.Server.MapPath($"~/css/bootstrap.min.css");

        public void Generate(CampaignTrackingVm model, string outputFilePath, string companyLogo, string screenshotFilePath)
        {
            string ImagesPath = HttpContext.Current.Server.MapPath($"~/images");
            string LogoFilePath = string.IsNullOrEmpty(companyLogo)
                        ? $"{ImagesPath}\\logoResized.png" : $"{ImagesPath}\\{companyLogo}";

            StringBuilder html = new StringBuilder();

            //html.Append(System.IO.File.ReadAllText(HttpContext.Current.Server.MapPath("~/Templates/ReportTemplate.html")));

            html.AppendFormat(@"<!DOCTYPE html><html><head>
<link rel='stylesheet' href='{0}'>
    <style>
        .body {
            font-family: 'Calibri, Helvetica Neue, Helvetica, Arial, sans-serif';
        }
        
        .top {
            height: 60px !important
        }

        .header {
            font-size: x-large;
            font-weight:bolder;
            color: #FFF;
            background-color: #57C1E8;
        }

        .grey_bg {
            background-color: #808080;
        }

        .blue_bg {
            background-color: #57C1E8;
        }

        .header1 {
            font-size: larger;
            font-weight: bolder;
        }

        .blue_color {
            color: #2F5497;
        }

        .grey_color {
            color: #808080;
        }

        .white_color {
            color: #FFF;
        }

        .black {
            color: #000;
        }

        .img {
            width: 500px !important;
            height: 65px !important;
        }

        table > tbody > tr > td {
            padding: 0px !important;
            height: 40px !important
        }

        table, tr, td, th, tbody, thead, tfoot {
            page-break-inside: avoid !important;
        }

        table {
            table-layout: fixed;
            padding: 5px;
            border-collapse:collapse;
            width: 100%;
            border-spacing: 0px
        }

        .round {
            border-radius: 15px;
            color: #FFF;
            padding-left: 25px !important;
            padding-top: 10px !important;
            width: 50px;
            height: 50px;
        }

        .new-page {
            page-break-before: always;
        }

        .center {
            display: block;
            margin: 0 auto;
        }

    </style>
</head>
                     <body>", BootstrapPath);

            html.AppendFormat(@"
                        <table class='table'>
                             <tr>
                                 <td colspan='8' class='top header'>Campaign Results</td>
                                 <td colspan='2' class='top header'>Report Date</td>
                                 <td colspan='2' class='top header'>{0}</td>
                             </tr>
                             <tr>
                                 <td colspan='8' rowspan='2'>
                                     <img class='img' src='{1}' />
                                 </td>
                                 <td colspan='2' class='header'>Sent</td>
                                 <td colspan='2' class='header'>{2}</td>
                             </tr>

                             <tr>
                                 <td colspan='2' class='header grey_bg'>Opened %</td>
                                 <td colspan='2' class='header grey_bg'>{3}</td>
                             </tr>
                             <tr>
                                 <td colspan='2' class='header1 blue_color'>Send Time:</td>
                                 <td colspan='6'>{4}</td>
                                 <td colspan='2' class='header'>Clicked%</td>
                                 <td colspan='2' class='header'>{5}</td>
                             </tr>", DateTime.Now.ToString(StringConstants.DateFormatSlashes), LogoFilePath, 
                             model.Quantity, model.OpenedPercentage,model.StartDate, model.ClickedPercentage);

            html.AppendFormat(@"<tr>
                                 <td colspan='2' class='header1 blue_color'>Subject Line:</td>
                                 <td colspan='6'>{0}</td>
                                 <td colspan='2' class='header grey_bg'>HTML CTR %</td>
                                 <td colspan='2' class='header grey_bg'>{1}</td>
                             </tr>
                             <tr>
                                 <td colspan='2' class='header1 blue_color'>From:</td>
                                 <td colspan='5'>{2}</td>
                                 <td colspan='5' rowspan='7' style='vertical-align:bottom'>
                                     <img align='right' src='D:/GitHub/ADSDataDirect/ADSDataDirect.Web/images/chart.png' />
                                 </td>
                             </tr>
                             <tr>
                                 <td colspan='2' class='header1 blue_color'>User:</td>
                                 <td colspan='5'>{3}</td>
                             </tr>
                             <tr>
                                 <td colspan='2' class='header1 blue_color'>Order Number:</td>
                                 <td colspan='5'>{4}</td>
                             </tr>
                             <tr>
                                 <td colspan='2' class='header1 blue_color'>Campaign Name:</td>
                                 <td colspan='5'>{5}</td>
                             </tr>
                             <tr>
                                 <td colspan='2' class='header1 blue_color'>Data Files:</td>
                                 <td colspan='5'>N/A</td>
                             </tr>", model.SubjectLine, model.ClickToOpenPercentage, 
                             model.FromLine, model.WhiteLabel, model.IoNumber, model.CampaignName);

            html.AppendFormat(@"<tr>
                                 <td colspan='2' class='header1 white_color grey_bg'>Retargeting Impressions</td>
                                 <td colspan='5' class='header1 white_color grey_bg'>{0}</td>
                             </tr>
                             <tr>
                                 <td colspan='2' class='header1 white_color grey_bg'>Retargeting Clicks</td>
                                 <td colspan='5' class='header1 white_color grey_bg'>{1}</td>
                             </tr>
                             <tr>
                                 <td colspan='4' class='header1 blue_color'>Key statistics for this compaign:</td>
                                 <td colspan='8'></td>
                             </tr>
                             <tr style='margin-top:15px'>
                                 <td colspan='1' class='header1 blue_bg round'>Sent</td>
                                 <td colspan='1'></td>
                                 <td colspan='2' class='header1'>{2}</td>
                                 <td colspan='7'></td>
                             </tr>
                             <tr style='margin-top:15px'>
                                 <td colspan='1' class='header1 grey_bg round'>Opened</td>
                                 <td colspan='1'></td>
                                 <td colspan='2' class='header1'>{3}</td>
                                 <td colspan='3'></td>
                                 <td colspan='1'>Desktop</td>
                                 <td colspan='1' class='header1'>{4}</td>
                                 <td colspan='1'></td>
                                 <td colspan='1'>Mobile</td>
                                 <td colspan='1' class='header1'>{5}</td>
                             </tr>
                             <tr>
                                 <td colspan='1' class='header1 blue_bg round'>Clicked</td>
                                 <td colspan='1'></td>
                                 <td colspan='2' class='header1'>{6}</td>
                                 <td colspan='3'></td>
                                 <td colspan='1'>Click %</td>
                                 <td colspan='1' class='header1'>{7}</td>
                                 <td colspan='1'></td>
                                 <td colspan='1'>HTML CTR%</td>
                                 <td colspan='1' class='header1'>{8}</td>
                             </tr>
                             <tr style='margin-top:15px'>
                                 <td colspan='1' class='header1 grey_bg round'>Bounce</td>
                                 <td colspan='1'></td>
                                 <td colspan='10' class='header1'>{9}</td>
                             </tr>
                             <tr style='margin-top:15px'>
                                 <td colspan='1' class='header1 blue_bg round'>Opt Outs</td>
                                 <td colspan='1'></td>
                                 <td colspan='10' class='header1'>{10}</td>
                             </tr>
                         </table>

                         <table class='new-page table'>
                             <tr>
                                 <td colspan='11' class='top header'>Links</td>
                                 <td colspan='1' class='top header'>Quantity</td>
                             </tr>", 
                             model.RetargetingImpressions, model.RetargetingClicks,
                             model.Quantity, model.Opened, model.Desktop, model.Mobile,
                             model.Clicked, model.ClickedPercentage, model.ClickToOpenPercentage,
                             model.Bounce, model.Opt
                             );

            foreach (var item in model.PerLink)
            {
                html.AppendFormat(@"
                             <tr>
                                 <td colspan='11'>{0}</td>
                                 <td colspan='1'>{1}</td>
                             </tr>", item.Link, item.ClickCount);
            }

            html.AppendFormat(@"
                         </table>

                         <table class='new-page table'>
                             <tr>
                                 <td colspan='12' class='top header'>Creative Design</td>
                             </tr>
                             <tr>
                                 <td colspan='12'></td>
                             </tr>
                             <tr>
                                 <td colspan='12'>
                                     <img class='center' src='{0}' />
                                 </td>
                             </tr>
                         </table>
                     </body>
</html>", screenshotFilePath);

            string htmlString = html.ToString();

            HtmlToPdf(htmlString, outputFilePath, true);

        }

        public void HtmlToPdf(string html, string filePath, bool isLandscape)
        {
            try
            {
                var htmlToPdf = new NReco.PdfGenerator.HtmlToPdfConverter()
                {
                    Quiet = false,
                };
                //htmlToPdf.WkHtmlToPdfExeName = "wkhtmltopdf.exe";
                htmlToPdf.CustomWkHtmlArgs = " --load-media-error-handling ignore ";
                if(isLandscape)
                    htmlToPdf.CustomWkHtmlArgs += " -O landscape ";

                htmlToPdf.LogReceived += HtmlToPdf_LogReceived;
                var pdfBytes = htmlToPdf.GeneratePdf(html);

                using (var fileStream = System.IO.File.Create(filePath))
                {
                    fileStream.Write(pdfBytes, 0, pdfBytes.Length);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void HtmlToPdf_LogReceived(object sender, System.Diagnostics.DataReceivedEventArgs e)
        {
            string PDFLogPath = DownloadPath + "\\pdf_log.txt";
            try {
                System.IO.File.AppendAllText(PDFLogPath, e.Data);
            }
            catch
            {
                //
            }
        }
    }
}
