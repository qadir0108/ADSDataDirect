using System;
using ADSDataDirect.Core.Entities;

namespace ADSDataDirect.Core.Repository
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

        private bool _disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this._disposed && disposing)
                _context?.Dispose();
            this._disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}
