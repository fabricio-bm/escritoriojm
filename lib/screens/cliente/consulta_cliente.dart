import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ConsultaCliente extends StatelessWidget {
  TextEditingController _razaoSocialController = TextEditingController();
  TextEditingController _cnpjController = TextEditingController();
  TextEditingController _nomeFantasiaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _telefoneSocialController = TextEditingController();

  ConsultaCliente({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('clientes').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          default:
            return ListView(
              padding: const EdgeInsets.only(bottom: 80),
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  child: Card(
                    child: ListTile(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Atualizar Cliente"),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    const Text(
                                      "CNPJ: ",
                                      textAlign: TextAlign.start,
                                    ),
                                    TextField(
                                      controller: _cnpjController,
                                      decoration: InputDecoration(
                                        hintText: document['cnpj'],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text("Razão Social: "),
                                    ),
                                    TextField(
                                      controller: _razaoSocialController,
                                      decoration: InputDecoration(
                                        hintText: document['razao'],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text("Nome Fantasia: "),
                                    ),
                                    TextField(
                                      controller: _nomeFantasiaController,
                                      decoration: InputDecoration(
                                        hintText: document['fantasia'],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text("E-mail: "),
                                    ),
                                    TextField(
                                      controller: _emailController,
                                      decoration: InputDecoration(
                                        hintText: document['email'],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text("Telefone: "),
                                    ),

                                    TextField(
                                      controller: _telefoneSocialController,
                                      decoration: InputDecoration(
                                        hintText: document['telefone'],
                                      ),
                                    ),
                                  ],
                                ),
                                actions: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 10),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        FirebaseFirestore.instance
                                            .collection("clientes")
                                            .doc(document.id)
                                            .delete()
                                            .whenComplete(() =>
                                                Navigator.of(context).pop());
                                      },
                                      child: const Text(
                                        "Atualizar",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  // Update Button
                                  ElevatedButton(
                                      child: const Text("Atualizar",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      onPressed: () {
                                        Map<String, dynamic> updateCliente =
                                            Map<String, dynamic>();
                                        updateCliente["cnpj"] =
                                            _cnpjController.text;
                                        updateCliente["razao"] =
                                            _razaoSocialController.text;
                                        updateCliente["email"] =
                                            _emailController.text;
                                        updateCliente['fantasia'] =
                                            _nomeFantasiaController.text;
                                        updateCliente['telefone'] =
                                            _telefoneSocialController.text;

                                        FirebaseFirestore.instance
                                            .collection("clientes")
                                            .doc(document.id)
                                            .update(updateCliente)
                                            .whenComplete(() {
                                          Navigator.of(context).pop();
                                        });
                                      }),
                                ],
                              );
                            });
                      },
                      title: Text("CNPJ " + document['cnpj']),
                      subtitle: Text("Razão Social " + document['razao']),
                      trailing:
                          // Delete Button
                          InkWell(
                        onTap: () {
                          FirebaseFirestore.instance
                              .collection("clientes")
                              .doc(document.id)
                              .delete()
                              .catchError((e) {
                            print(e);
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Icon(Icons.delete),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
        }
      },
    );
  }
}
