// <auto-generated />

using System.CodeDom.Compiler;
using System.Data.Entity.Migrations.Infrastructure;
using System.Resources;

namespace ADSDataDirect.Core.Migrations
{
    [GeneratedCode("EntityFramework.Migrations", "6.1.3-40302")]
    public sealed partial class MailChimp : IMigrationMetadata
    {
        private readonly ResourceManager Resources = new ResourceManager(typeof(MailChimp));
        
        string IMigrationMetadata.Id
        {
            get { return "201705300431369_MailChimp"; }
        }
        
        string IMigrationMetadata.Source
        {
            get { return null; }
        }
        
        string IMigrationMetadata.Target
        {
            get { return Resources.GetString("Target"); }
        }
    }
}