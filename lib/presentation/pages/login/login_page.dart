// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tg/presentation/pages/esqueceu_senha/esqueceu_senha.dart';
import 'package:tg/presentation/pages/home/home_page.dart';
import 'package:tg/presentation/pages/registrar/registrar_page.dart';
import 'package:tg/widgets/base_color/base_color.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                BaseColors().getAzulEscuro(),
                BaseColors().getAzulMaisClaro(),
              ],
            ),
          ),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: Text(
                    'ENTRAR',
                    style: TextStyle(
                      color: BaseColors().getAzulMaisClaro(),
                      fontSize: 65,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 18,
                    bottom: 80,
                  ),
                  child: Text(
                    'Entrar em sua conta',
                    style: TextStyle(
                      color: BaseColors().getAzulMaisClaro(),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide:
                            BorderSide(color: BaseColors().getBrancoCinza()),
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                          color: BaseColors().getAzulEscuro(),
                          fontWeight: FontWeight.bold),
                      fillColor: BaseColors().getBrancoCinza(),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: BaseColors().getAzulEscuro(),
                      ),
                    ),
                    //onChanged: onChanged,
                    obscureText: false,
                  ),
                ),
                SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: TextField(
                    controller: _senhaController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide:
                            BorderSide(color: BaseColors().getBrancoCinza()),
                      ),
                      hintText: 'Senha',
                      hintStyle: TextStyle(
                          color: BaseColors().getAzulEscuro(),
                          fontWeight: FontWeight.bold),
                      fillColor: BaseColors().getBrancoCinza(),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.lock_outlined,
                        color: BaseColors().getAzulEscuro(),
                      ),
                    ),
                    //onChanged: onChanged,
                    obscureText: true,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EsqueceuSenhaPage()),
                    );
                  },
                  child: Text(
                    'Esqueçeu a senha',
                    style: TextStyle(
                      color: BaseColors().getBranco(),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18))),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(16)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          BaseColors().getBrancoCinza(),
                        ),
                      ),
                      onPressed: () {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: _emailController.text,
                                password: _senhaController.text)
                            .then((value) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        });
                      },
                      child: Text(
                        'ENTRAR',
                        style: TextStyle(
                          color: BaseColors().getPreto(),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegistrarPage()),
                    );
                  },
                  child: Text(
                    'Novo usuário? Criar conta',
                    style: TextStyle(
                      color: BaseColors().getPreto(),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
