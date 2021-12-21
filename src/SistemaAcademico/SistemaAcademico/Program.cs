using SistemaAcademico.Dto;
using SistemaAcademico.Servicos;
using SistemaAcademico.ViewModels;
using System;

namespace SistemaAcademico
{
    public class Program
    {
        public static UsuarioViewModel UsuarioLogado { get; set; } = new UsuarioViewModel();
        public static UsuarioService UsuarioService { get; set; } = new UsuarioService();

        private static int OpcaoMenu = 0;
        
        static void Main(string[] args)
        {
            
            do
            {

                Console.Clear();

                if (UsuarioLogado.Id != Guid.Empty)
                {
                    ExibirTitulo($"USUARIO LOGADO: {UsuarioLogado.Nome}");
                }
                else
                {
                    ExibirTitulo($"USUARIO LOGADO: N/A - NENHUM USUARIO AUTENTICADO");
                }

                ExibirMenu();

                int.TryParse(Console.ReadLine(), out OpcaoMenu);

                switch (OpcaoMenu)
                {
                    case 1:
                        EfetuarLogin();
                        break;
                    case 2:
                        CadastrarUsuario();
                        break;

                    default:
                        break;
                }

            } while (OpcaoMenu != 4);

            Console.WriteLine("Programa finalizado! DIgite Qualquer Tecla Para Sair.");
            Console.ReadKey();

        }

        private static void CadastrarUsuario()
        {
            Console.Clear();

            ExibirTitulo("CADASTRAR USUARIO >>>");

            var usuarioDto = new UsuarioDto();

            Console.WriteLine("Informe o Nome:");
            usuarioDto.Nome = Console.ReadLine();

            Console.WriteLine("Informe o CPF:");
            usuarioDto.Cpf = Console.ReadLine();

            Console.WriteLine("Informe o E-mail:");
            usuarioDto.Email = Console.ReadLine();

            Console.WriteLine("Informe o Login:");
            usuarioDto.Login = Console.ReadLine();

            Console.WriteLine("Informe a Senha:");
            usuarioDto.Senha = Console.ReadLine();

            UsuarioService.CadastrarUsuario(usuarioDto);

        }

        private static void EfetuarLogin()
        {

            Console.Clear();

            ExibirTitulo("LOGIN >>>");

            var loginDto = new LoginDto();

            Console.WriteLine("Informe o Login:");
            loginDto.Login = Console.ReadLine();

            Console.WriteLine("Informe a senha:");
            loginDto.Senha = Console.ReadLine();

            UsuarioLogado = UsuarioService.EfetuarLogin(loginDto);

        }

        public static void ExibirTitulo(string tela)
        {
            Console.WriteLine("===================SISTEMA ACADEMICO==================");
            Console.WriteLine($"{tela}");
            Console.WriteLine("======================================================");

        }

        public static void ExibirMenu()
        {
            Console.WriteLine("");
            Console.WriteLine("[Digite uma opção do MENU]");
            Console.WriteLine("[1] - Efetuar Login");

            if (UsuarioLogado.Id != Guid.Empty)
            {
                Console.WriteLine("[2] - Cadastrar Usuário");
                Console.WriteLine("[3] - Lançar Notas");
            }

            Console.WriteLine("[4] - Sair");
            
            Console.WriteLine("");

        }
    }
}
