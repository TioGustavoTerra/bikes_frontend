import 'package:bikes_frontend/componentes/textfield.dart';
import 'package:bikes_frontend/views/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

// import '../views/bemvindo.dart';
import 'button.dart';

class Rodape2 extends StatelessWidget {
  const Rodape2({Key? key}) : super(key: key);

  get confirmPasswordController => null;

  get emailController => null;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child:

      Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              SvgPicture.asset(
                'site-sistema/Menu/Logo-bikes.svg',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 200),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 0)),
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text(
                          'Política de troca',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 0)),
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text(
                          'Perguntas frequentes',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 0)),
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text(
                          'Política de privacidade',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 0)),
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: const Text(
                          'Crie sua conta',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 0)),
                        onPressed: () {
                          Navigator.pushNamed(context, '/registration');
                        },
                        child: const Text(
                          'Trabalhe conosco',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 0)),
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text(
                          'Anuncie na Bikes.com.br',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 290),
                  TextButton(
                    style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: SvgPicture.asset(
                      'site-sistema/Menu/botao-whatsapp.svg',
                    ),
                  ),

                  TextButton(
                    style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: SvgPicture.asset(
                      'site-sistema/Menu/botao-facebook.svg',
                    ),
                  ),

                  TextButton(
                    style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: SvgPicture.asset(
                      'site-sistema/Menu/botao-instagram.svg',
                    ),
                  ),

                  const SizedBox(width: 400),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10, right: 10),
                        child: Text(
                          "Assine nossa Newsletter",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, right: 10),
                        child: SizedBox(
                          width: 200,
                          child: MyTextField(
                            hintText: 'Email',
                            controller: emailController,
                            obscureText: false,
                            inputFormatter: const [],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 50, right: 50, bottom: 20),
                        child: MyButtonAgree(
                          text: "Assinar",
                          image: "site-sistema/Home/icone-seta.svg",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Signup()),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }
}
