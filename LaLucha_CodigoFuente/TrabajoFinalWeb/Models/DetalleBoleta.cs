//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TrabajoFinalWeb.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class DetalleBoleta
    {
        public int ID { get; set; }
        public int IdPedido { get; set; }
        public decimal MontoTotal { get; set; }
        public int IdModoDePago { get; set; }
        public string ubicación_envio { get; set; }
        public string coordenadas_envio { get; set; }
    
        public virtual ModoDePago ModoDePago { get; set; }
        public virtual Pedido Pedido { get; set; }
    }
}
