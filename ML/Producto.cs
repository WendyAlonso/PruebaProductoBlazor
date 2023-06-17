namespace ML
{
    public class Producto
    {
        public int IdProducto { get; set; }
        public string Nombre { get; set; }
        public decimal Precio { get; set; }
        public ML.Categoria Categoria { get; set; }

        public List<object> Productos { get; set; }
    }
}