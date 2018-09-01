using System;
using System.Collections.Generic;
using System.Data.Entity.Core;
using System.Data.Entity.Validation;
using System.Data.SqlClient;
using System.Linq;
using System.Security;
using System.Text;
using System.Web.Mvc;

namespace ADSDataDirect.Web.Helpers
{
    /// <summary>
    /// GetModelStateErrors loops all model errors and return HTML list
    /// </summary>
    public static class ControllerExceptionHelper
    {
        public static string GetModelStateErrors(this ICollection<ModelState> values)
        {
            var sb = new StringBuilder();
            foreach (var modelState in values)
            {
                foreach (var error in modelState.Errors)
                {
                    var li = new TagBuilder("li");
                    li.SetInnerText(error.ErrorMessage);
                    sb.Append(li);
                }
            }
            return sb.ToString();
        }
    }
}