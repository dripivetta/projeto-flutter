import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tg/widgets/base_color/base_color.dart';

class CadastroCliente extends StatefulWidget {
  const CadastroCliente({Key? key}) : super(key: key);

  @override
  State<CadastroCliente> createState() => _CadastroClienteState();
}

class _CadastroClienteState extends State<CadastroCliente> {
  final CollectionReference _clientes =
      FirebaseFirestore.instance.collection('clientes');
  final TextEditingController _nomeRazaoController = TextEditingController();
  final TextEditingController _cpfCnpjController = TextEditingController();
  final TextEditingController _rgInscricaoController = TextEditingController();
  final TextEditingController _ruaController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _bairroController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _ufController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _nomeRazaoController.text = documentSnapshot['nomerazao'];
      _cpfCnpjController.text = documentSnapshot['cpfcnpj'].toString();
      _rgInscricaoController.text = documentSnapshot['rginscricao'].toString();
      _ruaController.text = documentSnapshot['rua'];
      _numeroController.text = documentSnapshot['numero'].toString();
      _bairroController.text = documentSnapshot['bairro'];
      _cidadeController.text = documentSnapshot['cidade'];
      _ufController.text = documentSnapshot['uf'];
      _telefoneController.text = documentSnapshot['telefone'].toString();
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
            //physics: NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nomeRazaoController,
                  decoration: InputDecoration(labelText: 'Nome / Razão Social'),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _cpfCnpjController,
                  decoration: InputDecoration(labelText: 'CPF / CNPJ'),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _rgInscricaoController,
                  decoration: InputDecoration(labelText: 'RG / Inscrição'),
                ),
                TextField(
                  controller: _ruaController,
                  decoration: InputDecoration(labelText: 'Rua'),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _numeroController,
                  decoration: InputDecoration(labelText: 'Número'),
                ),
                TextField(
                  controller: _bairroController,
                  decoration: InputDecoration(labelText: 'Bairro'),
                ),
                TextField(
                  controller: _cidadeController,
                  decoration: InputDecoration(labelText: 'Cidade'),
                ),
                TextField(
                  controller: _ufController,
                  decoration: InputDecoration(labelText: 'UF'),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _telefoneController,
                  decoration: InputDecoration(labelText: 'Telefone'),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final String nome_razao = _nomeRazaoController.text;
                    final double? cpf_cnpj =
                        double.tryParse(_cpfCnpjController.text);
                    final double? rg_inscricao =
                        double.tryParse(_rgInscricaoController.text);
                    final String rua = _ruaController.text;
                    final double? numero =
                        double.tryParse(_numeroController.text);
                    final String bairro = _bairroController.text;
                    final String cidade = _cidadeController.text;
                    final String uf = _ufController.text;
                    final double? telefone =
                        double.tryParse(_telefoneController.text);

                    if (cpf_cnpj != null) {
                      await _clientes.doc(documentSnapshot!.id).update({
                        "nomerazao": nome_razao,
                        "cpfcnpj": cpf_cnpj,
                        "rginscricao": rg_inscricao,
                        "rua": rua,
                        "numero": numero,
                        "bairro": bairro,
                        "cidade": cidade,
                        "uf": uf,
                        "telefone": telefone
                      });
                      _nomeRazaoController.text = '';
                      _cpfCnpjController.text = '';
                      _rgInscricaoController.text = '';
                      _ruaController.text = '';
                      _numeroController.text = '';
                      _bairroController.text = '';
                      _cidadeController.text = '';
                      _ufController.text = '';
                      _telefoneController.text = '';
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
      _nomeRazaoController.text = documentSnapshot['nomerazao'];
      _cpfCnpjController.text = documentSnapshot['cpfcnpj'].toString();
      _rgInscricaoController.text = documentSnapshot['rginscricao'].toString();
      _ruaController.text = documentSnapshot['rua'];
      _numeroController.text = documentSnapshot['numero'].toString();
      _bairroController.text = documentSnapshot['bairro'];
      _cidadeController.text = documentSnapshot['cidade'];
      _ufController.text = documentSnapshot['uf'];
      _telefoneController.text = documentSnapshot['telefone'].toString();
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
                  controller: _nomeRazaoController,
                  decoration: InputDecoration(labelText: 'Nome / Razão Social'),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _cpfCnpjController,
                  decoration: InputDecoration(labelText: 'CPF / CNPJ'),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _rgInscricaoController,
                  decoration: InputDecoration(labelText: 'RG / Inscrição'),
                ),
                TextField(
                  controller: _ruaController,
                  decoration: InputDecoration(labelText: 'Rua'),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _numeroController,
                  decoration: InputDecoration(labelText: 'Número'),
                ),
                TextField(
                  controller: _bairroController,
                  decoration: InputDecoration(labelText: 'Bairro'),
                ),
                TextField(
                  controller: _cidadeController,
                  decoration: InputDecoration(labelText: 'Cidade'),
                ),
                TextField(
                  controller: _ufController,
                  decoration: InputDecoration(labelText: 'UF'),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _telefoneController,
                  decoration: InputDecoration(labelText: 'Telefone'),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final String nome_razao = _nomeRazaoController.text;
                    final double? cpf_cnpj =
                        double.tryParse(_cpfCnpjController.text);
                    final double? rg_inscricao =
                        double.tryParse(_rgInscricaoController.text);
                    final String rua = _ruaController.text;
                    final double? numero =
                        double.tryParse(_numeroController.text);
                    final String bairro = _bairroController.text;
                    final String cidade = _cidadeController.text;
                    final String uf = _ufController.text;
                    final double? telefone =
                        double.tryParse(_telefoneController.text);

                    if (cpf_cnpj != null) {
                      await _clientes.add({
                        "nomerazao": nome_razao,
                        "cpfcnpj": cpf_cnpj,
                        "rginscricao": rg_inscricao,
                        "rua": rua,
                        "numero": numero,
                        "bairro": bairro,
                        "cidade": cidade,
                        "uf": uf,
                        "telefone": telefone
                      });
                      _nomeRazaoController.text = '';
                      _cpfCnpjController.text = '';
                      _rgInscricaoController.text = '';
                      _ruaController.text = '';
                      _numeroController.text = '';
                      _bairroController.text = '';
                      _cidadeController.text = '';
                      _ufController.text = '';
                      _telefoneController.text = '';
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

  Future<void> _delete(String vendedoresId) async {
    await _clientes.doc(vendedoresId).delete();
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
          stream: _clientes.snapshots(),
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
                      title: Text(documentSnapshot['nomerazao']),
                      subtitle: Text(documentSnapshot['cpfcnpj'].toString()),
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
