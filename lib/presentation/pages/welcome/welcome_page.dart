import 'package:flutter/material.dart';
import 'package:tg/widgets/welcome_page/botao_entrar.dart';
import 'package:tg/widgets/welcome_page/botao_registrar.dart';
import 'package:tg/widgets/base_color/base_color.dart';
import 'package:tg/widgets/welcome_page/texto_superior.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

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
                TextoSuperior(),
                BotaoEntrar(),
                const SizedBox(
                  height: 18,
                ),
                BotaoRegistrar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
