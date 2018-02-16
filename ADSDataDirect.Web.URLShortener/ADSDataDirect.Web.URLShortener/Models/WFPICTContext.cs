using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Data.Entity.Validation;
using System.Text;
using ADSDataDirect.Web.URLShortener.Models;

namespace ADSDataDirect.Core.Entities
{
    public class WfpictContext : DbContext
    {
        public WfpictContext() : base("WFPICTContext")
        {
            Configuration.LazyLoadingEnabled = true;
            Configuration.ProxyCreationEnabled = false;

            Database.SetInitializer<WfpictContext>(null);
            //Database.SetInitializer(new MigrateDatabaseToLatestVersion<WfpictContext, Configuration>());
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }

        public DbSet<DynamicCodingLink> DynamicCodingLinks { get; set; }

        public static WfpictContext Create()
        {
            return new WfpictContext();
        }
    }
}
