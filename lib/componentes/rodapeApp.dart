import 'package:bikes_frontend/componentes/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../features/register/registration_screen.dart';
import 'button.dart';

class rodapeApp extends StatelessWidget {
  const rodapeApp({Key? key}) : super(key: key);

  get emailController => null;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
          color: Colors.white,
          // height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              SvgPicture.asset(
                'site-sistema/Menu/Logo-bikes.svg',
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                          "/",
                          ModalRoute.withName('/'),
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
                          "/",
                          ModalRoute.withName('/'),
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
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 0)),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          "/login",
                          ModalRoute.withName('/login'),
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
                          "/login",
                          ModalRoute.withName('/login'),
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
                          "/login",
                          ModalRoute.withName('/login'),
                        );
                      },
                      child:
                          SvgPicture.asset('site-sistema/Menu/instagram.svg')),
                ],
              ),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 150, right: 150,),
                    child: MyButtonAgree(
                      text: "Assinar",
                      image: "site-sistema/Home/icone-seta.svg",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10)
                ],
              )
            ],
          )),
    );
  }
}
