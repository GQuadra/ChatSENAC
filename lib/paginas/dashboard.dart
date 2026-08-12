import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key, required this.nomeUsuario});

  final String nomeUsuario;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ChatSENAC")),
      body: Center(child: Text("Boas Vindas, $nomeUsuario")),
    );
  }
}
