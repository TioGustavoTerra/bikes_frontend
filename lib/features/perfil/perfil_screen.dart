import 'package:bikes_frontend/componentes/DrawerApp.dart';
import 'package:bikes_frontend/componentes/button.dart';
import 'package:bikes_frontend/componentes/cabecalho.dart';
import 'package:bikes_frontend/componentes/cabecalhoapp.dart';
import 'package:bikes_frontend/componentes/cpfTextField.dart';
import 'package:bikes_frontend/componentes/textfield.dart';
import 'package:bikes_frontend/utils/responsive.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
            appBar: Responsive.isMobile(context)
                ? const PreferredSize(
                    child: CabecalhoApp(),
                    preferredSize: Size(double.infinity, 56),
                  )
                : const PreferredSize(
                    child: Cabecalho(),
                    preferredSize: Size(double.infinity, 72)),
            drawer: Responsive.isMobile(context)
                ? const Drawer(child: DrawerApp())
                : null,
            body: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width / 2),
                  child: ListView(
                    children: [
                      ProfileCard(),
                      ProfileFormScreen(),
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
            backgroundImage: AssetImage('assets/profile_picture.jpg'),
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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Aqui, você pode salvar os dados do perfil em algum lugar, como um banco de dados ou serviço.

      // Exemplo: Enviar os dados para um serviço.
      // _sendDataToService(_name, _email, _dateOfBirth);

      // Exemplo: Navegar para a próxima tela após o envio bem-sucedido.
      // Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen()));
    }
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
              Column(
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
                  MyButtonAgree(
                    text: "Salavar",
                    image: "site-sistema/Home/icone-seta.svg",
                    onTap: () {
                      registrar(
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
            ],
          ),
        ),
      ),
    );
  }

    Future<void> registrar(
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

        // var usuario = User(
        //     cpfCnpj: UtilBrasilFields.removeCaracteres(cpf),
        //     email: email,
        //     name: nome,
        //     birthDate: '${dateNasc[2]}-${dateNasc[1]}-${dateNasc[0]}',
        //     password: senha,
        //     passwordConfirmation: confirmarSenha,
        //     phoneNumber:
        //         UtilBrasilFields.obterTelefone(telefone, mascara: false));

        // User? user = await _registerUserService.registrar(usuario);

        // if (user != null) {
        //   _showToastInfo(context, 'Cadastro realizado com Sucesso!');
        //   Navigator.pushNamed(context, "/login");
        // } else {
        //   _showToastErro(context, 'Ops, algo deu errado!');
        // }
      } else {
        // _showToastErro(context, 'Favor preencher todos os campos!');
      }
    } catch (e) {
      print(e);
      // _showToastErro(context, 'Ops, algo deu errado! ${e}');
    }
  }
}


