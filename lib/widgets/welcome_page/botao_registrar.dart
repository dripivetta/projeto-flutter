import 'package:flutter/material.dart';
import 'package:tg/presentation/pages/registrar/registrar_page.dart';
import 'package:tg/widgets/base_color/base_color.dart';

class BotaoRegistrar extends StatelessWidget {
  const BotaoRegistrar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
          padding:
              MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(16)),
          backgroundColor: MaterialStateProperty.all<Color>(
            BaseColors().getBrancoCinza(),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RegistrarPage()),
          );
        },
        child: Text(
          'REGISTRAR',
          style: TextStyle(
            color: BaseColors().getPreto(),
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
