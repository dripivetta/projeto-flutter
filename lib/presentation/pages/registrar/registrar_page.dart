import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tg/presentation/pages/home/home_page.dart';
import 'package:tg/widgets/base_color/base_color.dart';

class RegistrarPage extends StatefulWidget {
  const RegistrarPage({Key? key}) : super(key: key);

  @override
  State<RegistrarPage> createState() => _RegistrarPageState();
}

class _RegistrarPageState extends State<RegistrarPage> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmarSenhaController = TextEditingController();

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
                    'REGISTRE-SE',
                    style: TextStyle(
                      color: BaseColors().getAzulMaisClaro(),
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 18,
                    bottom: 50,
                  ),
                  child: Text(
                    'Criar uma conta, é gratuito',
                    style: TextStyle(
                      color: BaseColors().getAzulMaisClaro(),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
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
                const SizedBox(height: 18),
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
                const SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: TextField(
                    controller: _confirmarSenhaController,
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
                      hintText: 'Confirmar senha',
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
                            .createUserWithEmailAndPassword(
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
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Já tem uma conta? Entrar',
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
