import 'package:bikes_frontend/componentes/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../features/register/registration_screen.dart';
import 'button.dart';

class Rodape extends StatefulWidget {
  Rodape({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Rodape> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [
                SvgPicture.asset(
                  'site-sistema/Menu/Logo-bikes.svg',
                  width: 60,
                  height: 60,
                ),
                Row(
                  children: [
                    //Primeira coluna
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 14)),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              "/",
                              ModalRoute.withName('/'),
                            );
                          },
                          child: const Text(
                            'Política de troca',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 14)),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              "/",
                              ModalRoute.withName('/'),
                            );
                          },
                          child: const Text(
                            'Perguntas frequentes',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 14)),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              "/",
                              ModalRoute.withName('/'),
                            );
                          },
                          child: const Text(
                            'Política de privacidade',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    //Segunda coluna
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 14)),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              "/registro",
                              ModalRoute.withName('/registro'),
                            );
                          },
                          child: const Text(
                            'Crie sua conta',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 14)),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              "/",
                              ModalRoute.withName('/'),
                            );
                          },
                          child: const Text(
                            'Trabalhe conosco',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 14)),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              "/vender",
                              ModalRoute.withName('/vender'),
                            );
                          },
                          child: const Text(
                            'Anuncie na Bikes.com.br',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 0)),
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            "/",
                            ModalRoute.withName('/'),
                          );
                        },
                        child:
                            SvgPicture.asset('site-sistema/Menu/whatsapp.svg')),
                    TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 0)),
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            "/",
                            ModalRoute.withName('/'),
                          );
                        },
                        child:
                            SvgPicture.asset('site-sistema/Menu/facebook.svg')),
                    TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 0)),
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            "/",
                            ModalRoute.withName('/'),
                          );
                        },
                        child: SvgPicture.asset(
                            'site-sistema/Menu/instagram.svg')),

                    Column(
                      children: [
                        const Text(
                          "Assine nossa Newsletter",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          width: 200,
                          child: MyTextField(
                            hintText: 'Email',
                            controller: emailController,
                            obscureText: false,
                            inputFormatter: const [],
                          ),
                        ),
                        const SizedBox(height: 10),
                        MyButtonAgree(
                          text: "Assinar",
                          image: "site-sistema/Home/icone-seta.svg",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Signup()),
                            );
                          },
                        ),
                      ],
                    ),
                    const Divider(color: Colors.black54),
                  ],
                ),
              ])
            ],
          )),
    );
  }
}
