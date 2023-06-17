using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Categoria
    {
        public static ML.Result GetAll()
        {
            ML.Result result = new ML.Result();
            try
            {
                using (DL.PruebaProductoContext context = new DL.PruebaProductoContext())
                {
                    var query = context.Categoria.FromSqlRaw($"CategoriaGetAll").ToList();
                    if(query.Count> 0)
                    {
                        result.Objects = new List<object>();
                        foreach(var item in query)
                        {
                            ML.Categoria categoria = new ML.Categoria();

                            categoria.IdCategoria = item.IdCategoria;
                            categoria.Nombre = item.Nombre;

                            result.Objects.Add(categoria);
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
