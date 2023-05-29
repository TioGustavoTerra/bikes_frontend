import 'package:bikes_frontend/models/register_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import '../services/registerUser_service.dart';
import 'login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: RegistrationForm(),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nomeCompleto = TextEditingController();
  final _cpf = TextEditingController();
  final _dataNascimento = TextEditingController();
  final _telefone = TextEditingController();
  final _email = TextEditingController();
  final RegisterUserService _registerUserService = RegisterUserService();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nomeCompleto.dispose();
    _cpf.dispose();
    _dataNascimento.dispose();
    _telefone.dispose();
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _nomeCompleto,
            decoration: InputDecoration(
              labelText: 'Nome Completo',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, insira seu nome completo';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _cpf,
            decoration: InputDecoration(
              labelText: 'CPF',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, insira seu CPF';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _dataNascimento,
            decoration: InputDecoration(
              labelText: 'Data de Nascimento',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, insira sua data de nascimento';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _telefone,
            decoration: InputDecoration(
              labelText: 'Telefone',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, insira seu telefone';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _email,
            decoration: InputDecoration(
              labelText: 'Email',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, insira seu email';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Senha',
            ),
            controller: _passwordController,
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, insira uma senha';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Confirmação de Senha',
            ),
            controller: _confirmPasswordController,
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, confirme sua senha';
              } else if (value != _passwordController.text) {
                return 'As senhas não coincidem';
              }
              return null;
            },
          ),
          SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Processar os dados de cadastro
                _registrar(_nomeCompleto.text, _cpf.text, _dataNascimento.text,
                    _telefone.text, _email.text, _passwordController.text);
              }
            },
            child: Text('Cadastrar'),
          ),
        ],
      ),
    );
  }

  Future<void> _registrar(String nome, String cpf, String dataNascimento,
      String telefone, String email, String senha) async {
    if (await SessionManager().containsKey('user')) {
      //ja logado ?
    } else {
      User user = User(
          name: nome,
          cpfCnpj: cpf,
          birthDate: dataNascimento,
          phoneNumber: telefone,
          email: email,
          password: senha,
          passwordConfirmation: senha);

      User? userResponse = await _registerUserService.registrar(user);
      print(userResponse);
      if (userResponse != null) {
        print('setando sessão');
        await SessionManager().set('user', userResponse);
      } else {
        print('CAIU AQUI sessão');
        // _showToast(context);
      }
    }
    setState(() {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return LoginPage();
      }), (r) {
        return false;
      });
    });
  }
}
