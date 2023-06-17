using Microsoft.EntityFrameworkCore;

namespace BL
{
    public class Producto
    {
        public static ML.Result Add(ML.Producto producto)
        {
            ML.Result result = new ML.Result();
            try
            {
                using (DL.PruebaProductoContext context = new DL.PruebaProductoContext())
                {
                    var query = context.Database.ExecuteSqlRaw($"ProductoAdd '{producto.Nombre}', {producto.Precio}, {producto.Categoria.IdCategoria}");
                    if (query > 0)
                    {
                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                    }
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
                result.Exception = ex;
            }
            return result;
        }

        public static ML.Result Update(ML.Producto producto)
        {
            ML.Result result = new ML.Result();
            try
            {
                using (DL.PruebaProductoContext context = new DL.PruebaProductoContext())
                {
                    var query = context.Database.ExecuteSqlRaw($"ProductoUpdate {producto.IdProducto}, '{producto.Nombre}', {producto.Precio}, {producto.Categoria.IdCategoria}");
                    if (query > 0)
                    {
                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                    }
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
                result.Exception = ex;
            }
            return result;
        }

        public static ML.Result Delete(int IdProducto)
        {
            ML.Result result = new ML.Result();
            try
            {
                using (DL.PruebaProductoContext context = new DL.PruebaProductoContext())
                {
                    var query = context.Database.ExecuteSqlRaw($"ProductoDelete {IdProducto}");
                    if (query > 0)
                    {
                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                    }
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
                result.Exception = ex;
            }
            return result;
        }

        public static ML.Result GetById(int IdProducto)
        {
            ML.Result result = new ML.Result();
            try
            {
                using (DL.PruebaProductoContext context = new DL.PruebaProductoContext())
                {
                    var query = context.Productos.FromSqlRaw($"ProductoGetById {IdProducto}").AsEnumerable().FirstOrDefault();
                    if (query != null)
                    {
                        ML.Producto producto = new ML.Producto();
                        producto.Categoria = new ML.Categoria();
                        producto.IdProducto = query.IdProducto;
                        producto.Nombre = query.Nombre;
                        producto.Precio = query.Precio.Value;
                        producto.Categoria.IdCategoria = query.IdCategoria.Value;
                        producto.Categoria.Nombre = query.NombreCategoria;

                        result.Object = producto;
                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                    }
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
                result.Exception = ex;
            }
            return result;
        }

        public static ML.Result GetAll()
        {
            ML.Result result = new ML.Result();
            try
            {
                using (DL.PruebaProductoContext context = new DL.PruebaProductoContext())
                {
                    var query = context.Productos.FromSqlRaw($"ProductoGetAll").ToList();
                    if (query.Count > 0)
                    {
                        result.Objects = new List<object>();
                        foreach (var item in query)
                        {
                            ML.Producto producto = new ML.Producto();
                            producto.Categoria = new ML.Categoria();

                            producto.IdProducto = item.IdProducto;
                            producto.Nombre = item.Nombre;
                            producto.Precio = item.Precio.Value;
                            producto.Categoria.IdCategoria = item.IdCategoria.Value;
                            producto.Categoria.Nombre = item.NombreCategoria;

                            result.Objects.Add(producto);
                        }

                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                    }
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
                result.Exception = ex;
            }
            return result;
        }

        public static ML.Result GetPaginado(int Siguiente)
        {
            ML.Result result = new ML.Result();
            int Tamaño = 5;
            try
            {
                using (DL.PruebaProductoContext context = new DL.PruebaProductoContext())
                {
                    var query = context.Productos.FromSqlRaw($"Paginacion {Siguiente},{Tamaño}").ToList();
                    if (query.Count >= 0)
                    {
                        result.Objects = new List<object>();
                        foreach (var item in query)
                        {
                            ML.Producto producto = new ML.Producto();
                            producto.Categoria = new ML.Categoria();

                            producto.IdProducto = item.IdProducto;
                            producto.Nombre = item.Nombre;
                            producto.Precio = item.Precio.Value;
                            producto.Categoria.IdCategoria = item.IdCategoria.Value;
                            producto.Categoria.Nombre = item.NombreCategoria;

                            result.Objects.Add(producto);
                        }

                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                    }
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
                result.Exception = ex;
            }
            return result;
        }
    }
}