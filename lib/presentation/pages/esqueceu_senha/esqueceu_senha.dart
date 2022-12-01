import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tg/widgets/base_color/base_color.dart';

class EsqueceuSenhaPage extends StatefulWidget {
  const EsqueceuSenhaPage({Key? key}) : super(key: key);

  @override
  State<EsqueceuSenhaPage> createState() => _EsqueceuSenhaPageState();
}

class _EsqueceuSenhaPageState extends State<EsqueceuSenhaPage> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(icon: Icon(Icons.keyboard_arrow_left), onPressed: () { 
            Navigator.pop(context);
         },),
      ),
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
                    'ESQUEÇEU \n A SENHA?',
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
                    'Recuperar senha',
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
                        FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text).then((value) => Navigator.of(context).pop());
                      },
                      child: Text(
                        'ENVIAR',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}