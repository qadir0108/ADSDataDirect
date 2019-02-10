using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.parser;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADSDataDirect.Infrastructure.Pdf
{
    public static class PdfOrganizer
    {
        // Source : https://stackoverflow.com/questions/7246137/itextsharp-trimming-pdf-documents-pages
        public static void SelectPages(string inputPdf, string pageSelection, string outputPdf)
        {
            using (PdfReader reader = new PdfReader(inputPdf))
            {
                reader.SelectPages(pageSelection);

                using (PdfStamper stamper = new PdfStamper(reader, File.Create(outputPdf)))
                {
                    stamper.Close();
                }
            }
        }

        // Source : https://stackoverflow.com/questions/7246137/itextsharp-trimming-pdf-documents-pages
        public static void RemovePagesFromPdf(string sourceFile, string destinationFile, params int[] pagesToKeep)
        {
            //Used to pull individual pages from our source
            PdfReader r = new PdfReader(sourceFile);
            
            //Create our destination file
            using (FileStream fs = new FileStream(destinationFile, FileMode.Create, FileAccess.Write, FileShare.None))
            {
                using (Document doc = new Document())
                {
                    using (PdfWriter w = PdfWriter.GetInstance(doc, fs))
                    {
                        //Open the desitination for writing
                        doc.Open();
                        doc.SetPageSize(iTextSharp.text.PageSize.A5.Rotate());

                        w.PageEmpty = false;
                        
                        //Loop through each page that we want to keep
                        //foreach (int page in pagesToKeep)
                        for(int page = 1; page <= r.NumberOfPages; page++)
                        {
                            //Add a new blank page to destination document
                            doc.NewPage();
                            //Extract the given page from our reader and add it directly to the destination PDF
                            w.DirectContent.AddTemplate(w.GetImportedPage(r, page), 0, 0);
                        }
                        //Close our document
                        doc.Close();
                    }
                }
            }
        }
    }
}
