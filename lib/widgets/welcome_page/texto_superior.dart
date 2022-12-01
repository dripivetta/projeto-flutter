import 'package:flutter/material.dart';
import 'package:tg/widgets/base_color/base_color.dart';

class TextoSuperior extends StatelessWidget {
  const TextoSuperior({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120),
      child: Text(
        'BEM-VINDO',
        style: TextStyle(
          color: BaseColors().getAzulMaisClaro(),
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
