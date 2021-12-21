using MySql.Data.EntityFramework;
using SistemaAcademico.Entidades;
using System.Data.Entity;

namespace SistemaAcademico.Infraestrutura
{
    [DbConfigurationType(typeof(MySqlEFConfiguration))]
    public class AcademicoDbContext : DbContext
    {
        public DbSet<Matricula> Alunos { get; set; }
        public DbSet<Curso> Cursos { get; set; }
        public DbSet<Usuario> Usuarios { get; set; }


        public AcademicoDbContext() : base("DbContextConnection")
        {

        }
    }
}
