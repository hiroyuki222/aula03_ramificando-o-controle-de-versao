using Microsoft.EntityFrameworkCore;

namespace Aula_29.Models
{
    public class Catalogo : DbContext
    {
        public Catalogo(DbContextOptions options) : base(options)
        {

        }
        public DbSet<Filme> Filmes { get; set; }
        public DbSet<Ator> Ator { get; set; }
    }
}
