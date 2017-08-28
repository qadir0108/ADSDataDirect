using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WFP.ICT.Data.Entities;

namespace WFP.ICT.Data.Repository
{
    public class UnitOfWork : IDisposable
    {
        private readonly WfpictContext _context = new WfpictContext();
        private GenericRepository<Campaign> _campaignRepository;

        public GenericRepository<Campaign> CampaignRepository
        {
            get
            {
                if (this._campaignRepository == null)
                {
                    this._campaignRepository = new GenericRepository<Campaign>(_context);
                }
                return _campaignRepository;
            }
        }

        public void Save()
        {
            _context.SaveChanges();
        }

        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed && disposing)
                _context?.Dispose();
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}
