using System;
using System.Collections.Generic;
using System.Data.Entity.Core;
using System.Data.Entity.Validation;
using System.Data.SqlClient;
using System.Linq;
using System.Security;
using System.Text;

namespace ADSDataDirect
{
    public static partial class ExceptionHelper
    {
        public static string GetExceptionMessage(this Exception ex, string customMessage = "")
        {
            var message = (customMessage != "")
                ? customMessage + " " + ex.GetBaseException().Message
                : ex.GetBaseException().Message;

            message += "</br><pre>" + ex.StackTrace+ "</pre>";

            if (ex is SqlException)
            {
                return "Could not connect to database" + message;
            }
            else if (ex is IndexOutOfRangeException)
            {
                return "IndexOutOfRangeException" + message;
            }
            else if (ex is DbEntityValidationException)
            {
                var exception = (DbEntityValidationException)ex;
                var errorMessages = exception.EntityValidationErrors
                    .SelectMany(x => x.ValidationErrors)
                    .Select(x => x.ErrorMessage);
                var messages = errorMessages.Aggregate("",
                    (current, errorMessage) => current + ("<li>" + errorMessage + "</li>"));
                return message + "<br/>" + messages;
            }
            else if (ex is EntityCommandExecutionException)
            {
                return "Failed to query the DB. Trying again." + message;
            }
            else if (ex is SecurityException)
            {
                return "SecurityException" + message;
            }
            else if (ex is SystemException)
            {
                return message;
            }
            else if (ex is ApplicationException)
            {
                return message;
            }
            else
            {
                return message;
            }
        }
        public static void HandleException(this Exception ex, string customMessage = "")
        {
            var message = (customMessage != "")
                ? customMessage + " " + ex.GetBaseException().Message
                : ex.GetBaseException().Message;
            if (ex is SqlException)
            {
                //return "Could not connect to database" + message;
            }
            else if (ex is IndexOutOfRangeException)
            {
                //return "IndexOutOfRangeException" + message;
            }
            else if (ex is DbEntityValidationException)
            {
                var exception = (DbEntityValidationException)ex;
                var errorMessages = exception.EntityValidationErrors
                    .SelectMany(x => x.ValidationErrors)
                    .Select(x => x.ErrorMessage);
                var messages = errorMessages.Aggregate("",
                    (current, errorMessage) => current + ("<li>" + errorMessage + "</li>"));
                //return message + "<br/>" + messages;
            }
            else if (ex is EntityCommandExecutionException)
            {
                //return "Failed to query the DB. Trying again." + message;
            }
            else if (ex is SecurityException)
            {
                //return "SecurityException" + message;
            }
            else if (ex is SystemException)
            {
                //return message;
            }
            else if (ex is ApplicationException)
            {
                //return message;
            }
            else
            {
                //return message;
            }
        }
    }
}