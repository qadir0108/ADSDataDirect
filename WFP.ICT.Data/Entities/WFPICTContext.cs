using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Data.Entity.Validation;
using System.Text;
using Microsoft.AspNet.Identity.EntityFramework;
using WFP.ICT.Data.Migrations;

namespace WFP.ICT.Data.Entities
{
    public class WFPICTContext : IdentityDbContext<WFPUser>
    {
        public WFPICTContext() : base("WFPICTContext")
        {
            Configuration.LazyLoadingEnabled = true;
            Configuration.ProxyCreationEnabled = false;

            Database.SetInitializer(new MigrateDatabaseToLatestVersion<WFPICTContext, Configuration>());
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            // The rest should not be needed - it should be done by conventions
            //modelBuilder.Entity<StationeryRequest>()
            //            .HasMany(s => s.RequestedItems)
            //            .WithRequired(si => si.Request)
            //            .HasForeignKey(si => si.StationeryRequestID);
            //modelBuilder.Entity<StationeryItem>()
            //            .HasMany(s => s.Requests)
            //            .WithRequired(si => si.Item)
            //            .HasForeignKey(si => si.StationeryItemID);

            base.OnModelCreating(modelBuilder);
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }

        public DbSet<AspNetClaims> Claims { get; set; }
        public DbSet<AspNetRoleClaims> RoleClaims { get; set; }

        public DbSet<Campaign> Campaigns { get; set; }
        public DbSet<ProData> ProDatas { get; set; }
        public DbSet<Vendor> Vendors { get; set; }

        public DbSet<APIRequest> ApiRequests { get; set; }

        public static WFPICTContext Create()
        {
            return new WFPICTContext();
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

        private Exception HandleDbUpdateException(DbUpdateException dbu)
        {
            var builder = new StringBuilder("A DbUpdateException was caught while saving changes. ");

            try
            {
                foreach (var result in dbu.Entries)
                {
                    builder.AppendFormat("Type: {0} was part of the problem. ", result.Entity.GetType().Name);
                }
            }
            catch (Exception e)
            {
                builder.Append("Error parsing DbUpdateException: " + e.ToString());
            }

            string message = builder.ToString();
            return new Exception(message, dbu);
        }
        #endregion
    }
}
