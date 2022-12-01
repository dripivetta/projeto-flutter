import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tg/widgets/base_color/base_color.dart';

class CadastroVendedor extends StatefulWidget {
  const CadastroVendedor({Key? key}) : super(key: key);

  @override
  State<CadastroVendedor> createState() => _CadastroVendedorState();
}

class _CadastroVendedorState extends State<CadastroVendedor> {
  final CollectionReference _vendedores =
      FirebaseFirestore.instance.collection('vendedores');
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _comissaoController = TextEditingController();

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _nomeController.text = documentSnapshot['nome'];
      _comissaoController.text = documentSnapshot['comissao'].toString();
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                controller: _comissaoController,
                decoration: InputDecoration(labelText: 'Comissao'),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  final String nome = _nomeController.text;
                  final double? comissao =
                      double.tryParse(_comissaoController.text);
                  if (comissao != null) {
                    await _vendedores
                        .doc(documentSnapshot!.id)
                        .update({"nome": nome, "comissao": comissao});
                    _nomeController.text = '';
                    _comissaoController.text = '';
                  }
                },
                child: Text('Atualizar'),
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _nomeController.text = documentSnapshot['nome'];
      _comissaoController.text = documentSnapshot['comissao'].toString();
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                controller: _comissaoController,
                decoration: InputDecoration(labelText: 'Comissao'),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  final String nome = _nomeController.text;
                  final double? comissao =
                      double.tryParse(_comissaoController.text);
                  if (comissao != null) {
                    await _vendedores.add({"nome": nome, "comissao": comissao});
                    _nomeController.text = '';
                    _comissaoController.text = '';
                  }
                },
                child: Text('Atualizar'),
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> _delete(String vendedoresId) async {
    await _vendedores.doc(vendedoresId).delete();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Vendendor deletado com sucesso')));
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
          stream: _vendedores.snapshots(),
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
                      title: Text(documentSnapshot['nome']),
                      subtitle: Text(documentSnapshot['comissao'].toString()),
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
