import 'package:flutter/material.dart';
import 'package:tg/presentation/pages/login/login_page.dart';
import 'package:tg/widgets/base_color/base_color.dart';

class BotaoEntrar extends StatelessWidget {
  const BotaoEntrar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 280),
      child: SizedBox(
        width: 300,
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18))),
            padding:
                MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(16)),
            backgroundColor: MaterialStateProperty.all<Color>(
              BaseColors().getBrancoCinza(),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
          child: Text(
            'ENTRAR',
            style: TextStyle(
              color: BaseColors().getPreto(),
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
