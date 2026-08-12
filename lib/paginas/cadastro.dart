import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../utilitarios/tipografia.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final nomeControlador = TextEditingController();
  final emailControlador = TextEditingController();
  final senhaControlador = TextEditingController();
  final confirmarSenhaControlador = TextEditingController();

  Future<void> fazerCadastro() async {
    if (senhaControlador.text != confirmarSenhaControlador.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("As senhas não são iguais")));
      return;
    }

    var url = Uri.http(String.fromEnvironment("API_URL"), "api/cadastro");
    var resposta = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'nome': nomeControlador.text,
        'email': emailControlador.text,
        'senha': senhaControlador.text,
      }),
    );

    if(!mounted) return;

    if (resposta.statusCode != 201) {
      var dados = jsonDecode(resposta.body);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("${dados["message"]}")));
      return;
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                ),
                SizedBox(height: 32),

                // Titulos
                Text("Cadastre-se", style: Tipografia.h1),
                SizedBox(height: 12),
                Text("Crie uma conta e continue!", style: Tipografia.subtitulo),
                SizedBox(height: 32),

                // Campos
                Text("Nome Completo", style: Tipografia.subtitulo),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text("Email", style: Tipografia.subtitulo),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text("Senha", style: Tipografia.subtitulo),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: Icon(Icons.visibility_off),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 16),
                Text("Confirmar Senha", style: Tipografia.subtitulo),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: Icon(Icons.visibility_off),
                  ),
                  obscureText: true,
                ),

                // Botões
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text("Cadastrar", style: Tipografia.subtitulo),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
