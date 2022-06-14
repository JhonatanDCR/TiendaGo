using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TrabajoFinalWeb.Models.Proveedor
{
    public class ProveedorViewModel
    {
		[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
		public ProveedorViewModel()
		{
			this.Producto = new HashSet<Producto>();
		}

		public long id { get; set; }
		public string nombre { get; set; }
		public string rubro { get; set; }
		public string ubicacion { get; set; }
		public string celular { get; set; }
		public string telefono { get; set; }
		public Nullable<System.DateTime> created_at { get; set; }
		public Nullable<System.DateTime> updated_at { get; set; }

		[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
		public virtual ICollection<Producto> Producto { get; set; }
	}
}