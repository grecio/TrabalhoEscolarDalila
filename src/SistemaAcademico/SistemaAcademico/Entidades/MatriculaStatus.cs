using System.ComponentModel.DataAnnotations.Schema;

namespace SistemaAcademico.Entidades
{
    [Table("tblMatriculastatus")]
    public class MatriculaStatus
    {
        public int Id { get; set; }
        public string Status { get; set; }
    }
}
