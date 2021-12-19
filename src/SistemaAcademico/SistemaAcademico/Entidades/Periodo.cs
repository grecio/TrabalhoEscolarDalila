using System.ComponentModel.DataAnnotations.Schema;

namespace SistemaAcademico.Entidades
{
    [Table("tblPeriodo")]
    public class Periodo
    {
        public int Id { get; set; }
        public int Ano { get; set; }
        public int Ciclo { get; set; }
    }
}
