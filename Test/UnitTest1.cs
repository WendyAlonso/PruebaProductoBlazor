namespace Test
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void PruebaProductoGetAll()
        {
            ML.Result result = BL.Producto.GetAll();

            Assert.IsTrue(result.Correct);
        }

        [TestMethod]
        public void PruebaCategoriaGetAll()
        {
            ML.Result result = BL.Categoria.GetAll();

            Assert.IsTrue(result.Correct);
        }

        [TestMethod]
        public void PruebaProductoAgregar()
        {
            ML.Producto producto = new ML.Producto();
            producto.Categoria= new ML.Categoria();

            producto.Nombre = "Doritos";
            producto.Precio = 18;
            producto.Categoria.IdCategoria = 2;

            ML.Result result = BL.Producto.Add(producto);

            Assert.IsTrue(result.Correct);
        }

        [TestMethod]
        public void PruebaProductoEliminar()
        {
            int IdProducto = 13;
            ML.Result result = BL.Producto.Delete(IdProducto);

            Assert.IsTrue(result.Correct);
        }

        [TestMethod]
        public void PruebaProductoActualizar()
        {
            ML.Producto producto = new ML.Producto();
            producto.Categoria = new ML.Categoria();

            producto.IdProducto = 12;
            producto.Nombre = "Acondicionador";
            producto.Precio = 25;
            producto.Categoria.IdCategoria = 5;

            ML.Result result = BL.Producto.Update(producto);

            Assert.IsTrue(result.Correct);
        }
    }
}