import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tg/widgets/base_color/base_color.dart';

class CadastroProduto extends StatefulWidget {
  const CadastroProduto({Key? key}) : super(key: key);

  @override
  State<CadastroProduto> createState() => _CadastroProdutoState();
}

class _CadastroProdutoState extends State<CadastroProduto> {
  final CollectionReference _produtos =
      FirebaseFirestore.instance.collection('produtos');
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _custoController = TextEditingController();
  final TextEditingController _larguratecidoController =
      TextEditingController();
  final TextEditingController _margemController = TextEditingController();
  final TextEditingController _tecidoController = TextEditingController();
  final TextEditingController _unidadeController = TextEditingController();
  final TextEditingController _valorvendaController = TextEditingController();

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _descricaoController.text = documentSnapshot['descricao'];
      _custoController.text = documentSnapshot['custo'].toString();
      _larguratecidoController.text =
          documentSnapshot['larguratecido'].toString();
      _margemController.text = documentSnapshot['margem'].toString();
      _tecidoController.text = documentSnapshot['tecido'].toString();
      _unidadeController.text = documentSnapshot['unidade'];
      _valorvendaController.text = documentSnapshot['valorvenda'].toString();
    }
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx) {
        return Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _descricaoController,
                  decoration: InputDecoration(labelText: 'Descrição produto'),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _custoController,
                  decoration: InputDecoration(labelText: 'Custo unitário'),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _larguratecidoController,
                  decoration: InputDecoration(labelText: 'Largura do tecido'),
                ),
                TextField(
                  controller: _margemController,
                  decoration: InputDecoration(labelText: 'Margem'),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _tecidoController,
                  decoration:
                      InputDecoration(labelText: 'É tecido? TRUE / FALSE'),
                ),
                TextField(
                  controller: _unidadeController,
                  decoration: InputDecoration(labelText: 'Unidade'),
                ),
                TextField(
                  controller: _valorvendaController,
                  decoration: InputDecoration(labelText: 'Valor venda'),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final String descricao = _descricaoController.text;
                    final double? custo =
                        double.tryParse(_custoController.text);
                    final double? larguratecido =
                        double.tryParse(_larguratecidoController.text);
                    final double? margem =
                        double.tryParse(_margemController.text);
                    final String tecido = _tecidoController.text;
                    final double? unidade =
                        double.tryParse(_unidadeController.text);
                    final double? valor =
                        double.tryParse(_valorvendaController.text);

                    if (descricao != null) {
                      await _produtos.add({
                        "descricao": descricao,
                        "custo": custo,
                        "larguratecido": larguratecido,
                        "margem": margem,
                        "tecido": tecido,
                        "unidade": unidade,
                        "valor": valor,
                      });
                      _descricaoController.text = '';
                      _custoController.text = '';
                      _larguratecidoController.text = '';
                      _margemController.text = '';
                      _tecidoController.text = '';
                      _unidadeController.text = '';
                      _valorvendaController.text = '';
                    }
                  },
                  child: Text('Atualizar'),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _descricaoController.text = documentSnapshot['descricao'];
      _custoController.text = documentSnapshot['custo'].toString();
      _larguratecidoController.text =
          documentSnapshot['larguratecido'].toString();
      _margemController.text = documentSnapshot['margem'].toString();
      _tecidoController.text = documentSnapshot['tecido'].toString();
      _unidadeController.text = documentSnapshot['unidade'];
      _valorvendaController.text = documentSnapshot['valorvenda'].toString();
    }
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx) {
        return Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _descricaoController,
                  decoration: InputDecoration(labelText: 'Descrição produto'),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _custoController,
                  decoration: InputDecoration(labelText: 'Custo unitário'),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _larguratecidoController,
                  decoration: InputDecoration(labelText: 'Largura do tecido'),
                ),
                TextField(
                  controller: _margemController,
                  decoration: InputDecoration(labelText: 'Margem'),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _tecidoController,
                  decoration:
                      InputDecoration(labelText: 'É tecido? TRUE / FALSE'),
                ),
                TextField(
                  controller: _unidadeController,
                  decoration: InputDecoration(labelText: 'Unidade'),
                ),
                TextField(
                  controller: _valorvendaController,
                  decoration: InputDecoration(labelText: 'Valor venda'),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final String descricao = _descricaoController.text;
                    final double? custo =
                        double.tryParse(_custoController.text);
                    final double? larguratecido =
                        double.tryParse(_larguratecidoController.text);
                    final double? margem =
                        double.tryParse(_margemController.text);
                    final String tecido = _tecidoController.text;
                    final double? unidade =
                        double.tryParse(_unidadeController.text);
                    final double? valor =
                        double.tryParse(_valorvendaController.text);

                    if (descricao != null) {
                      await _produtos.add({
                        "descricao": descricao,
                        "custo": custo,
                        "larguratecido": larguratecido,
                        "margem": margem,
                        "tecido": tecido,
                        "unidade": unidade,
                        "valor": valor,
                      });
                      _descricaoController.text = '';
                      _custoController.text = '';
                      _larguratecidoController.text = '';
                      _margemController.text = '';
                      _tecidoController.text = '';
                      _unidadeController.text = '';
                      _valorvendaController.text = '';
                    }
                  },
                  child: Text('Atualizar'),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _delete(String produtosId) async {
    await _produtos.doc(produtosId).delete();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Cliente deletado com sucesso')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _create(),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
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
        child: StreamBuilder(
          stream: _produtos.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(documentSnapshot['descricao']),
                      //subtitle: Text(documentSnapshot['cpfcnpj'].toString()),
                      trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () => _update(documentSnapshot),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () => _delete(documentSnapshot.id),
                              )
                            ],
                          )),
                    ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
