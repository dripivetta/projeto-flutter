import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tg/presentation/pages/cadastro_cliente/cadastro_cliente.dart';
import 'package:tg/presentation/pages/cadastro_produto/cadastro_produto.dart';
import 'package:tg/presentation/pages/orcamento_page/orcamento_page.dart';
import 'package:tg/presentation/pages/cadastro_vendedor/cadastro_vendedor.dart';
import 'package:tg/presentation/pages/welcome/welcome_page.dart';
import 'package:tg/widgets/base_color/base_color.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                  padding: const EdgeInsets.only(top: 60, left: 60, right: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'FLEX-COR',
                        style: TextStyle(
                          color: BaseColors().getAzulMaisClaro(),
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        iconSize: 30,
                        color: BaseColors().getBranco(),
                        icon: Icon(Icons.logout_outlined),
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut().then((value) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (_) => const WelcomePage(),
                                ),
                                (route) => true);
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    width: 300,
                    height: 100,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CadastroVendedor()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: SizedBox(
                              child:
                                  Image.asset("assets/home_page/vendedor.png"),
                              height: 80,
                              width: 80,
                            ),
                          ),
                          Text(
                            'CADASTRAR \n VENDEDOR',
                            style: TextStyle(
                              color: BaseColors().getPreto(),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    width: 300,
                    height: 100,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CadastroCliente()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: SizedBox(
                              child:
                                  Image.asset("assets/home_page/clientes.png"),
                              height: 80,
                              width: 80,
                            ),
                          ),
                          Text(
                            'CADASTRAR \n CLIENTES',
                            style: TextStyle(
                              color: BaseColors().getPreto(),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    width: 300,
                    height: 100,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CadastroProduto()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: SizedBox(
                              child:
                                  Image.asset("assets/home_page/produtos.png"),
                              height: 80,
                              width: 80,
                            ),
                          ),
                          Text(
                            'CADASTRAR \n PRODUTOS',
                            style: TextStyle(
                              color: BaseColors().getPreto(),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    width: 300,
                    height: 100,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OrcamentoPage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: SizedBox(
                              child:
                                  Image.asset("assets/home_page/orcamento.png"),
                              height: 80,
                              width: 80,
                            ),
                          ),
                          Text(
                            'REALIZAR \n ORÇAMENTO',
                            style: TextStyle(
                              color: BaseColors().getPreto(),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
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
