using SistemaAcademico.Dto;
using SistemaAcademico.Entidades;
using SistemaAcademico.Infraestrutura;
using SistemaAcademico.ViewModels;
using System;
using System.Linq;

namespace SistemaAcademico.Servicos
{
    public class UsuarioService
    {
        public UsuarioService()
        {

        }

        public UsuarioViewModel EfetuarLogin(LoginDto dto)
        {
           
            using (var ctx = new AcademicoDbContext())
            {
                var usuarioDb = ctx.Usuarios.FirstOrDefault(u => u.Login == dto.Login && u.Senha == dto.Senha);

                if (usuarioDb != null)
                {
                    return UsuarioViewModel.From(usuarioDb);
                }

                return null;
            }
        }

        public bool CadastrarUsuario(UsuarioDto dto)
        {
            try
            {
                using (var ctx = new AcademicoDbContext())
                {
                    ctx.Usuarios.Add(Usuario.From(dto));

                    ctx.SaveChanges();

                    return true;
                }
            }
            catch (Exception ex)
            {

                return false;

            }
        }

    }
}
