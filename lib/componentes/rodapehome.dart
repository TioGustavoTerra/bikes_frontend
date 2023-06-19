import 'package:bikes_frontend/componentes/textfield.dart';
import 'package:bikes_frontend/views/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../views/bemvindo.dart';
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
      child: Container(
        color: Colors.white,
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'site-sistema/Menu/Logo-bikes.svg',
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
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
                      style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
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
                      style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
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
                      style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
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
                      style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
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
              ],
            ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 20),
            SvgPicture.asset(
              'site-sistema/Menu/botao-whatsapp.svg',
            ),
            const SizedBox(width: 20),
            SvgPicture.asset(
              'site-sistema/Menu/botao-facebook.svg',
            ),
            const SizedBox(width: 20),
            SvgPicture.asset(
              'site-sistema/Menu/botao-instagram.svg',
            ),
          ],
            ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:
          CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 10.0),
              child: Text(
                "Assine nossa Newsletter",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                textAlign: TextAlign.start,
              ),
            ),

              MyTextField(
                hintText: 'Email',
                controller: emailController,
                obscureText: false, inputFormatter: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(
                  left: 850, right: 850),
              child: MyButtonAgree(
                text: "Assinar",
                image: "site-sistema/Home/icone-seta.svg",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          Signup()));
                },
              ),
            ),
          ],
        ),
        ],
      )
      ),
    );
  }
}