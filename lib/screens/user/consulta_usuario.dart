import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ConsultaUsuario extends StatelessWidget {
   TextEditingController _nomeController = TextEditingController();
   TextEditingController _emailController = TextEditingController();
   TextEditingController _senhaController = TextEditingController();
   TextEditingController _telefoneController = TextEditingController();
   TextEditingController _cargoController = TextEditingController();

  ConsultaUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Usuários').snapshots(),
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
                                title: const Text("Atualizar Usuário"),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    const Text(
                                      "Nome: ",
                                      textAlign: TextAlign.start,
                                    ),
                                    TextField(
                                      controller: _nomeController,
                                      decoration: InputDecoration(
                                        hintText: document['nome'],
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
                                      child: Text("Senha: "),
                                    ),
                                    TextField(
                                      controller: _senhaController,
                                      decoration: InputDecoration(
                                        hintText: document['senha'],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text("Cargo: "),
                                    ),
                                      TextField(
                                        controller: _emailController,
                                        decoration: InputDecoration(
                                          hintText: document['cargo'],
                                        ),

                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text("Telefone: "),
                                    ),
                                    TextField(
                                      controller: _telefoneController,
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
                                            .collection("usuario")
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
                                        Map<String, dynamic> updateUser =
                                        Map<String, dynamic>();
                                        updateUser["nome"] =
                                            _nomeController.text;
                                        updateUser["email"] =
                                            _emailController.text;
                                        updateUser["senha"] =
                                            _senhaController.text;
                                        updateUser['cargo'] =
                                            _cargoController.text;
                                        FirebaseFirestore.instance
                                            .collection("clientes")
                                            .doc(document.id)
                                            .update(updateUser)
                                            .whenComplete(() {
                                          Navigator.of(context).pop();
                                        });
                                      }),
                                ],
                              );
                            });
                      },
                      title: Text("Nome " + document['nome']),
                      subtitle: Text("Cargo" + document['cargo']),
                      trailing:
                      // Delete Button
                      InkWell(
                        onTap: () {
                          FirebaseFirestore.instance
                              .collection("usuario")
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
