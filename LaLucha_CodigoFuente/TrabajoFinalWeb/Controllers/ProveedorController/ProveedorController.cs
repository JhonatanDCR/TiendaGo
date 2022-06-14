using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net.Http;
using TrabajoFinalWeb.Models;
using TrabajoFinalWeb.Models.Proveedor;
using Newtonsoft.Json;
using Hotel_UPC.Authorization;
using System.Text;

namespace TrabajoFinalWeb.Controllers.ProveedorController
{
    [UserLoggedOn]
    [AdminsOnly]
    public class ProveedorController : Controller
    {
        Uri baseAddress = new Uri("http://127.0.0.1:8000/api");
        HttpClient client;

        public ProveedorController()
        {
            client = new HttpClient();
            client.BaseAddress = baseAddress;
        }

        // GET: Proveedores
        public ActionResult Index()
        {
            List<ProveedorViewModel> modelList = new List<ProveedorViewModel>();
            HttpResponseMessage response = client.GetAsync(client.BaseAddress + "/proveedores").Result;
            if (response.IsSuccessStatusCode)
            {
                string data = response.Content.ReadAsStringAsync().Result;
                modelList = JsonConvert.DeserializeObject<List<ProveedorViewModel>>(data);
            }

            return View(modelList);
        }

        // GET: Proveedor/id
        public ActionResult Detail(int? id)
        {
            List<ProveedorViewModel> modelList = new List<ProveedorViewModel>();
            HttpResponseMessage response = client.GetAsync(client.BaseAddress + "/proveedor/"+id).Result;
            if (response.IsSuccessStatusCode)
            {
                string data = response.Content.ReadAsStringAsync().Result;
                modelList = JsonConvert.DeserializeObject<List<ProveedorViewModel>>(data);
                //return Json(response.Content);
            }

            return View(modelList);
        }

        //POST proveedor
        [HttpPost]
        public ActionResult Create(ProveedorViewModel model)
        {
            string data = JsonConvert.SerializeObject(model);
            StringContent content = new StringContent(data, Encoding.UTF8, "application/json");

            HttpResponseMessage response = client.PostAsync(client.BaseAddress+"/proveedor",content).Result;
            if(response.IsSuccessStatusCode){
                return RedirectToAction("Index");
            }

            return View();
        }

        public ActionResult Edit(int id)
        {
            ProveedorViewModel model = new ProveedorViewModel();
            HttpResponseMessage response = client.GetAsync(client.BaseAddress + "/proveedor/"+id).Result;
            if (response.IsSuccessStatusCode)
            {
                string data = response.Content.ReadAsStringAsync().Result;
                model = JsonConvert.DeserializeObject<ProveedorViewModel>(data);
            }

            return View();
        }

        //[HttpDelete]
        /*public ActionResult Delete(int id)
        {

            if (response.IsSuccessStatusCode)
            {
                return RedirectToAction("Index");
            }
        }*/

    }
}