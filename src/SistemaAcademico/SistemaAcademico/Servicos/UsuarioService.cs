using SistemaAcademico.Infraestrutura;
using SistemaAcademico.ViewModels;
using System.Linq;

namespace SistemaAcademico.Servicos
{
    public class UsuarioService
    {
        public UsuarioService()
        {

        }

        public UsuarioViewModel EfetuarLogin(string login, string senha)
        {
            login = login.ToLowerInvariant();
            senha = senha.ToLowerInvariant();

            using (var ctx = new AcademicoDbContext())
            {
                var usuarioDb = ctx.Usuarios.FirstOrDefault(u => u.Login == login && u.Senha == senha);

                if (usuarioDb != null)
                {
                    return UsuarioViewModel.From(usuarioDb);
                }

                return null;
            }
        }
    }
}
