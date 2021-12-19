using SistemaAcademico.Entidades;
using System.Data.Entity;

namespace SistemaAcademico.Infraestrutura
{
    public class AcademicoDbContext : DbContext
    {
        public DbSet<Aluno> Alunos { get; set; }
        public DbSet<Curso> Cursos { get; set; }
        public DbSet<Usuario> Usuarios { get; set; }


        public AcademicoDbContext() : base("DbContextConnection")
        {

        }
    }
}
