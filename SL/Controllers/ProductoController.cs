using Microsoft.AspNetCore.Mvc;

namespace SL.Controllers
{
    public class ProductoController : Controller
    {
        [HttpGet]
        [Route("api/Producto/GetAll")]
        public ActionResult GetAll()
        {
            ML.Result result = BL.Producto.GetAll();

            if (result.Correct)
            {
                ML.Producto producto = new ML.Producto();
                producto.Productos = result.Objects;
                return Ok(producto.Productos);
            }
            else
            {
                return NotFound(result);
            }
        }

        [HttpGet]
        [Route("api/Producto/GetPaginado")]
        public ActionResult GetPaginado(int Siguiente)
        {
            ML.Result result = BL.Producto.GetPaginado(Siguiente);

            if (result.Correct)
            {
                ML.Producto producto = new ML.Producto();
                producto.Productos = result.Objects;
                return Ok(producto.Productos);
            }
            else
            {
                return NotFound(result);
            }
        }

        [HttpPost]
        [Route("api/Producto/Add")]
        public ActionResult Add([FromBody] ML.Producto producto)
        {
            ML.Result result = BL.Producto.Add(producto);

            if (result.Correct)
            {
                return Ok(result);
            }
            else
            {
                return NotFound(result);
            }
        }

        [HttpPut]
        [Route("api/Producto/Update")]
        public ActionResult Update([FromBody] ML.Producto producto)
        {
            ML.Result result = BL.Producto.Update(producto);
            if (result.Correct)
            {
                return Ok(result);
            }
            else
            {
                return NotFound(result);
            }
        }

        [HttpDelete]
        [Route("api/Producto/Delete")]
        public ActionResult Delete(int IdProducto)
        {
            ML.Result result = BL.Producto.Delete(IdProducto);
            if (result.Correct)
            {
                return Ok(result);
            }
            else
            {
                return NotFound(result);
            }
        }

        [HttpGet]
        [Route("api/Producto/GetById")]
        public ActionResult GetById(int IdProducto)
        {
            ML.Result result = BL.Producto.GetById(IdProducto);
            if (result.Correct)
            {
                ML.Producto producto = new ML.Producto();
                producto = (ML.Producto)result.Object;
                return Ok(producto);
            }
            else
            {
                return NotFound(result);
            }
        }


        [HttpGet]
        [Route("api/Categoria/GetAll")]
        public ActionResult GetAllCategorias()
        {
            ML.Result result = BL.Categoria.GetAll();

            if (result.Correct)
            {
                ML.Categoria categoria = new ML.Categoria();
                categoria.Categorias = result.Objects;
                return Ok(categoria.Categorias);
            }
            else
            {
                return NotFound(result);
            }
        }
    }
}
