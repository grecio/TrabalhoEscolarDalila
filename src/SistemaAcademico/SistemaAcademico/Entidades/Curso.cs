using System.ComponentModel.DataAnnotations.Schema;

namespace SistemaAcademico.Entidades
{
    [Table("tblCurso")]
    public class Curso
    {
        public int Id { get; set; }
        public string Nome { get; set; }
    }
}
