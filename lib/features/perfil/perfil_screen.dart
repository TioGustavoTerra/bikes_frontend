import 'package:bikes_frontend/componentes/DrawerApp.dart';
import 'package:bikes_frontend/componentes/button.dart';
import 'package:bikes_frontend/componentes/cabecalho.dart';
import 'package:bikes_frontend/componentes/cabecalhoapp.dart';
import 'package:bikes_frontend/componentes/cpfTextField.dart';
import 'package:bikes_frontend/componentes/messages.dart';
import 'package:bikes_frontend/componentes/textfield.dart';
import 'package:bikes_frontend/models/user.dart';
import 'package:bikes_frontend/utils/responsive.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../componentes/rodape.dart';
import '../../componentes/rodapeApp.dart';
import '../../services/user_service.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
            appBar: Responsive.isMobile(context)
                ? const PreferredSize(
                    preferredSize: Size(double.infinity, 56),
                    child: CabecalhoApp(),
                  )
                : const PreferredSize(
                    preferredSize: Size(double.infinity, 72),
                    child: Cabecalho()),
            drawer: Responsive.isMobile(context)
                ? const Drawer(child: DrawerApp())
                : null,
            body: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width / 2
                          : MediaQuery.of(context).size.width),
                  child: ListView(
                    children: [
                      ProfileCard(),
                      ProfileFormScreen(),
                      Expanded(
                          child: Column(
                        children: [
                          Center(
                            child: Stack(
                              children: [
                                
                                if (Responsive.isMobile(context))
                                  const PreferredSize(
                                    preferredSize: Size(double.infinity, 56),
                                    child: rodapeApp(),
                                  )
                                else
                                  (PreferredSize(
                                    preferredSize:
                                        const Size(double.infinity, 72),
                                    child: Rodape(),
                                  )),
                              ],
                            ),
                          )
                        ],
                      ))

                    ],
                  )),
            ));
      },
    );
  }
}

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            // backgroundImage: AssetImage('assets/profile_picture.jpg'),
            radius: 60.0,
          ),
          SizedBox(height: 20.0),
          Text(
            'Nome de Usuário',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileFormScreen extends StatefulWidget {
  @override
  _ProfileFormScreenState createState() => _ProfileFormScreenState();
}

class _ProfileFormScreenState extends State<ProfileFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final cpfController = TextEditingController();
  final dataNascimentoController = TextEditingController();
  final emailController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final telController = TextEditingController();
  final oldPasswordController = TextEditingController();

  final UserService _registerUserService = UserService();
  bool trocarSenha = false;

  @override
  void initState() {
    // TODO: implement initState
    _buscarDados();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text("Dados pessoais",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  textAlign: TextAlign.start),
              MyTextField(
                hintText: 'Nome completo',
                controller: usernameController,
                obscureText: false,
                inputFormatter: [],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: CpfTextField(
                      hintText: 'CPF',
                      controller: cpfController,
                      obscureText: false,
                      readOnly: true,
                      inputFormatter: [
                        FilteringTextInputFormatter.digitsOnly,
                        CpfInputFormatter(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: MyTextField(
                      hintText: 'Data de nascimento',
                      controller: dataNascimentoController,
                      obscureText: false,
                      inputFormatter: [
                        FilteringTextInputFormatter.digitsOnly,
                        DataInputFormatter(),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: MyTextField(
                      hintText: 'Telefone',
                      controller: telController,
                      obscureText: false,
                      inputFormatter: [
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(width: 10),
                  Expanded(
                    child: MyTextField(
                      hintText: 'Email',
                      controller: emailController,
                      obscureText: false,
                      inputFormatter: [],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextButton(
                  onPressed: () {
                    setState(() {
                      trocarSenha = !trocarSenha;
                    });
                  },
                  child: const Text(
                    "Mudar a senha",
                    style: TextStyle(color: Colors.red),
                  )),
              trocarSenha
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          "Alterar a senha",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: 5),
                        MyPasswordTextField(
                          obscureText: true,
                          controller: oldPasswordController,
                          hintText: 'Senha Atual',
                        ),
                        const SizedBox(height: 15),
                        MyPasswordTextField(
                          obscureText: true,
                          controller: passwordController,
                          hintText: 'Senha',
                        ),
                        const SizedBox(height: 15),
                        MyPasswordTextField(
                          obscureText: true,
                          controller: confirmPasswordController,
                          hintText: 'Confirmar senha',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    )
                  : const SizedBox(
                      height: 40,
                    ),
              MyButtonAgree(
                text: "Salvar",
                image: "site-sistema/Home/icone-seta.svg",
                onTap: () {
                  _salvar(
                      cpfController.text,
                      emailController.text,
                      usernameController.text,
                      dataNascimentoController.text,
                      passwordController.text,
                      confirmPasswordController.text,
                      telController.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _salvar(
      String cpf,
      String email,
      String nome,
      String dataNascimento,
      String senha,
      String confirmarSenha,
      String telefone) async {
    try {
      if (_formKey.currentState!.validate()) {
        var dateNasc = dataNascimento.split('/');

        var usuario = User(
            cpfCnpj: UtilBrasilFields.removeCaracteres(cpf),
            email: email,
            name: nome,
            birthDate: '${dateNasc[2]}-${dateNasc[1]}-${dateNasc[0]}',
            imageProfile: "https://t.ctcdn.com.br/essK16aBUDd_65hp5umT3aMn_i8=/400x400/smart/filters:format(webp)/i606944.png",
            phoneNumber:
                UtilBrasilFields.obterTelefone(telefone, mascara: false));

        User? user = await _registerUserService.atualizar(usuario);

        if (user != null) {
          _showToastInfo(context, 'Cadastro realizado com Sucesso!');
          Navigator.pushNamed(context, "/login");
        } else {
          _showToastErro(context, 'Ops, algo deu errado!');
        }
      } else {
        _showToastErro(context, 'Favor preencher todos os campos!');
      }
    } catch (e) {
      print(e);
      _showToastErro(context, 'Ops, algo deu errado! ${e}');
    }
  }

  _buscarDados() async {
    User? user;

    try {
      await _registerUserService.getDadosUsuario().then((value) {
        user = value;
      });
      usernameController.text = user!.name;
      cpfController.text = UtilBrasilFields.obterCpf(user!.cpfCnpj);
      dataNascimentoController.text =
          UtilData.obterDataDDMMAAAA(DateTime.parse(user!.birthDate));
      telController.text = UtilBrasilFields.obterTelefone(user!.phoneNumber);
      emailController.text = user!.email;
    } catch (e) {
      print(e);
      _showToastErro(context, 'Ops, algo deu errado! ${e}');
    }
  }

  void _showToastErro(BuildContext context, msg) {
    Messages.of(context).showError(msg);
  }

  void _showToastInfo(BuildContext context, msg) {
    Messages.of(context).showInfo(msg);
  }
}
