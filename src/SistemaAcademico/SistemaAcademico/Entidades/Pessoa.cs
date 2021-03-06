using SistemaAcademico.Dto;
using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace SistemaAcademico.Entidades
{
    [Table("tblPessoa")]
    public class Pessoa : EntidadeBase
    {
        public string Nome { get; set; }
        public string Cpf { get; set; }
        public string Rg { get; set; }
        public string Email { get; set; }
        public string Telefone { get; set; }

        public static Pessoa From(UsuarioDto dto)
        {
            return new Pessoa()
            {
                Id  = Guid.NewGuid(),
                Nome = dto.Nome,
                Cpf = dto.Cpf,
                Email = dto.Email
            };
        }

    }
}
