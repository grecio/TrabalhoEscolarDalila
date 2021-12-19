using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace SistemaAcademico.Entidades
{
    [Table("tblUsuario")]
    public class Usuario : EntidadeBase
    {
        public Guid PessoaId { get; set; }

        [ForeignKey("PessoaId")]
        public virtual Pessoa Pessoa { get; set; }
        public string Login { get; set; }
        public string Senha { get; set; }

    }
}
