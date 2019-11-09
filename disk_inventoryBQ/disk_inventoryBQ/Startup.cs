using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(disk_inventoryBQ.Startup))]
namespace disk_inventoryBQ
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
