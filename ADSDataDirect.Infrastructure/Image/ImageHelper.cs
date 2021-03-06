﻿using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Net;
using System.Threading;
using System.Windows.Forms;

namespace ADSDataDirect.Infrastructure.Image
{
    public class ImageHelper
    {
        private readonly string _url;
        private readonly string _filePath;
        public ImageHelper(string url, string filePath)
        {
            _url = url;
            _filePath = filePath;
        }

        public void Capture()
        {
            Thread thread = new Thread(delegate ()
            {
                using (WebBrowser browser = new WebBrowser())
                {
                    browser.ScrollBarsEnabled = false;
                    browser.AllowNavigation = true;
                    browser.ScriptErrorsSuppressed = true;
                    browser.Navigate(_url);
                    //browser.Width = 800;
                    //browser.Height = 3000;
                    browser.DocumentCompleted += new WebBrowserDocumentCompletedEventHandler(DocumentCompleted);
                    while (browser.ReadyState != WebBrowserReadyState.Complete)
                    {
                        System.Windows.Forms.Application.DoEvents();
                    }
                }
            });
            thread.SetApartmentState(ApartmentState.STA);
            thread.Start();
            thread.Join();
        }

        private void DocumentCompleted(object sender, WebBrowserDocumentCompletedEventArgs e)
        {
            WebBrowser wb = sender as WebBrowser;
            if (!wb.Document.Title.Equals("HTTP 404 Not Found"))
            {
                int scrollWidth = 0;
                int scrollHeight = 0;

                scrollHeight = wb.Document.Body.ScrollRectangle.Height;
                scrollWidth = wb.Document.Body.ScrollRectangle.Width;
                wb.Size = new Size(scrollWidth, scrollHeight);


                Bitmap bitmap = new Bitmap(wb.Width, wb.Height);
                for (int xcount = 0; xcount < bitmap.Width; xcount++)
                    for (int ycount = 0; ycount < bitmap.Height; ycount++)
                        bitmap.SetPixel(xcount, ycount, Color.Black);
                wb.DrawToBitmap(bitmap, new Rectangle(0, 0, wb.Width, wb.Height));
                bitmap.Save(_filePath, ImageFormat.Png);
            }
        }
        public static string GetCapturedImage(string url, string filePath)
        {
            try
            {
                HttpWebRequest request = HttpWebRequest.Create(url) as HttpWebRequest;
                Bitmap bitmap;
                using (Stream stream = request.GetResponse().GetResponseStream())
                {
                    bitmap = new Bitmap(stream);
                    bitmap.Save(filePath);
                }
            }
            catch (Exception ex)
            {
                //
            }
            return filePath;
        }
    }
}