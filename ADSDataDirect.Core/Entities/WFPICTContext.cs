using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Data.Entity.Validation;
using System.Text;
using ADSDataDirect.Core.Migrations;
using Microsoft.AspNet.Identity.EntityFramework;

namespace ADSDataDirect.Core.Entities
{
    public class WfpictContext : IdentityDbContext<WfpUser>
    {
        public WfpictContext() : base("WFPICTContext")
        {
            Configuration.LazyLoadingEnabled = true;
            Configuration.ProxyCreationEnabled = false;

            Database.SetInitializer(new MigrateDatabaseToLatestVersion<WfpictContext, Configuration>());
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }

        public DbSet<AspNetClaims> Claims { get; set; }
        public DbSet<AspNetRoleClaims> RoleClaims { get; set; }

        public DbSet<Campaign> Campaigns { get; set; }
        public DbSet<CampaignAsset> CampaignAssets { get; set; }
        public DbSet<CampaignTesting> CampaignsTesting { get; set; }
        public DbSet<CampaignSegment> CampaignSegments { get; set; }
        public DbSet<CampaignCreative> CampaignCreatives { get; set; }
        public DbSet<CampaignApproved> CampaignsApproved { get; set; }
        public DbSet<CampaignTracking> CampaignTrackings { get; set; }
        public DbSet<ProData> ProDatas { get; set; }
        public DbSet<Vendor> Vendors { get; set; }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<Notification> Notifications { get; set; }
        public DbSet<ApiRequest> ApiRequests { get; set; }
        public DbSet<SystemLog> SystemLogs { get; set; }
        public DbSet<Settings> Settings { get; set; }
        public DbSet<DynamicCodingLookup> DynamicCodingLookups { get; set; }
        public DbSet<DynamicCodingLink> DynamicCodingLinks { get; set; }

        public static WfpictContext Create()
        {
            return new WfpictContext();
        }

        #region Overrided
        public override int SaveChanges()
        {
            try
            {
                base.SaveChanges();
            }
            catch (DbEntityValidationException ex)
            {
                StringBuilder sb = new StringBuilder();

                foreach (var failure in ex.EntityValidationErrors)
                {
                    sb.AppendFormat("{0} failed validation\n", failure.Entry.Entity.GetType());
                    foreach (var error in failure.ValidationErrors)
                    {
                        sb.AppendFormat("- {0} : {1}", error.PropertyName, error.ErrorMessage);
                        sb.AppendLine();
                    }
                }

                throw new DbEntityValidationException(
                    "Entity Validation Failed - errors follow:\n" +
                    sb.ToString(), ex
                ); // Add the original exception as the innerException
            }
            return -1;
        }
        #endregion
    }
}
