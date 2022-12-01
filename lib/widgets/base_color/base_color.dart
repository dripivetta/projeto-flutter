import 'package:flutter/material.dart';

class BaseColors {
  // ignore: prefer_const_constructors
  final Color _azulEscuro = Color.fromRGBO(24, 64, 79, 1);
  // ignore: prefer_const_constructors
  final Color _azulMaisClaro = Color.fromRGBO(169, 215, 232, 1);
  // ignore: prefer_const_constructors
  final Color _azulTomClaro2 = Color.fromRGBO(62, 168, 207, 1);
  // ignore: prefer_const_constructors
  final Color _azulTomClaro3 = Color.fromRGBO(47, 127, 156, 1);
  // ignore: prefer_const_constructors
  final Color _cinza = Color.fromRGBO(47, 71, 79, 1);
  // ignore: prefer_const_constructors
  final Color _branco = Color.fromRGBO(255, 255, 255, 1);
  // ignore: prefer_const_constructors
  final Color _brancoCinza = Color.fromRGBO(217,	217,	217, 1);
  // ignore: prefer_const_constructors
  final Color _preto = Color.fromRGBO(0, 0, 0, 1);

  Color getAzulEscuro() {
    return _azulEscuro;
  }

  Color getAzulMaisClaro() {
    return _azulMaisClaro;
  }

  Color getAzulTomClaro2() {
    return _azulTomClaro2;
  }

  Color getAzulTomClaro3() {
    return _azulTomClaro3;
  }

  Color getCinza() {
    return _cinza;
  }

  Color getBranco() {
    return _branco;
  }

  Color getBrancoCinza() {
    return _brancoCinza;
  }

  Color getPreto() {
    return _preto;
  }
}