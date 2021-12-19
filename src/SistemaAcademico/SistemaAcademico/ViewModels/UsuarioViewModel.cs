using SistemaAcademico.Entidades;
using System;

namespace SistemaAcademico.ViewModels
{
    public class UsuarioViewModel
    {
        public Guid Id { get; set; }
        public Guid PessoaId { get; set; }
        public string Nome { get; set; }
        public string Login { get; set; }

        public static UsuarioViewModel From(Usuario entidade)
        {
            return new UsuarioViewModel()
            {
                Id = entidade.Id,
                PessoaId = entidade.Pessoa.Id,
                Nome = entidade.Pessoa.Nome,
                Login = entidade.Login
            };
        }

    }
}
