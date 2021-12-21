using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace SistemaAcademico.Entidades
{
    [Table("tblMatricula")]
    public class Matricula : EntidadeBase
    {
        public Guid PessoaId { get; set; }
        [ForeignKey("PessoaId")]
        public virtual Pessoa Pessoa { get; set; }

        public string Numero { get; set; }

        public int CursoId { get; set; }
        [ForeignKey("CursoId")]
        public virtual Curso Curso { get; set; }

        public int PeriodoId { get; set; }
        [ForeignKey("PeriodoId")]
        public virtual Periodo Periodo { get; set; }

        [ForeignKey("MatriculaStatusId")]
        public virtual MatriculaStatus MatriculaStatus { get; set; }

        public int MatriculaStatusId { get; set; }
    }
}
