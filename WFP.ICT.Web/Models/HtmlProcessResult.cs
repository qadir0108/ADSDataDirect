﻿using WFP.ICT.Enum;

namespace WFP.ICT.Web.Models
{
    public class HtmlProcessResult
    {
        public string filePathLive { get; set; }
        public UploadFileStatusEnum Status { get; set; }
    }
}