using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace SistemaAcademico.Entidades
{
    [Table("tblUsuario")]
    public class Aluno : EntidadeBase
    {
        public Guid PessoaId { get; set; }

        [ForeignKey("PessoaId")]
        public virtual Pessoa Pessoa { get; set; }

        public string Matricula { get; set; }

        public int CursoId { get; set; }

        [ForeignKey("CursoId")]
        public virtual Curso Curso { get; set; }

        public int PeriodoId { get; set; }

        [ForeignKey("PeriodoId")]
        public virtual Periodo Periodo { get; set; }

        public int MatriculaStatus { get; set; }
    }
}
