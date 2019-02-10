using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Principal;
using System.Runtime.InteropServices;

namespace ADSDataDirect.Infrastructure.Pdf
{

    /// <summary>
    /// Summary description for Impersonate
    /// </summary>
    public class Impersonate
    {

        #region "Class Members"
        public const int LOGON32_LOGON_INTERACTIVE = 2;
        public const int LOGON32_PROVIDER_DEFAULT = 0;
        WindowsImpersonationContext impersonationContext;
        #endregion

        #region "Class Properties"
        public string domainName { get; set; }
        public string userName { get; set; }
        public string userPassword { get; set; }
        #endregion

        public Impersonate()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public Impersonate(string domainName, string userName, string userPassword)
        {
            this.domainName = domainName;
            this.userName = userName;
            this.userPassword = userPassword;
        }

        #region "Impersonation Code"
        [DllImport("advapi32.dll")]
        public static extern int LogonUserA(String lpszUserName,
            String lpszDomain,
            String lpszPassword,
            int dwLogonType,
            int dwLogonProvider,
            ref IntPtr phToken);

        [DllImport("advapi32.dll", CharSet = CharSet.Auto, SetLastError = true)]
        public static extern int DuplicateToken(IntPtr hToken,
            int impersonationLevel,
            ref IntPtr hNewToken);

        [DllImport("advapi32.dll", CharSet = CharSet.Auto, SetLastError = true)]
        public static extern bool RevertToSelf();

        [DllImport("kernel32.dll", CharSet = CharSet.Auto)]
        public static extern bool CloseHandle(IntPtr handle);
        public bool impersonateValidUser()
        {
            WindowsIdentity tempWindowsIdentity;
            IntPtr token = IntPtr.Zero;
            IntPtr tokenDuplicate = IntPtr.Zero;

            if (RevertToSelf())
            {
                if (LogonUserA(this.userName, this.domainName, this.userPassword, LOGON32_LOGON_INTERACTIVE,
                    LOGON32_PROVIDER_DEFAULT, ref token) != 0)
                {
                    if (DuplicateToken(token, 2, ref tokenDuplicate) != 0)
                    {
                        tempWindowsIdentity = new WindowsIdentity(tokenDuplicate);
                        impersonationContext = tempWindowsIdentity.Impersonate();
                        if (impersonationContext != null)
                        {
                            CloseHandle(token);
                            CloseHandle(tokenDuplicate);
                            return true;
                        }
                    }
                }
            }
            if (token != IntPtr.Zero)
                CloseHandle(token);
            if (tokenDuplicate != IntPtr.Zero)
                CloseHandle(tokenDuplicate);
            return false;
        }

        public void undoImpersonation()
        {
            impersonationContext.Undo();
        }
        #endregion
    }
}