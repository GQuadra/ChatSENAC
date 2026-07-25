import 'package:flutter/material.dart';
import 'package:primeiro_app/utilitarios/tipografia.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: Login()),
      ),
    );
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(children: [FlutterLogo(size: 18), Text("ChatSENAC")]),
        SizedBox(height: 32,),

        // Titulos
        Text("Entre na sua Conta", style: Tipografia.h1),
        Text(
          "Coloque o seu email e senha para logar",
          style: Tipografia.subtitulo,
        ),

        // Campos
        Text("Email", style: Tipografia.subtitulo),
        TextField(),
        Text("Senha", style: Tipografia.subtitulo),
        TextField(),
        InkWell(
          child: Text(
            "Esqueceu a senha?",
            textAlign: TextAlign.right,
            style: Tipografia.link,
          ),
        ),

        // Botões
        ElevatedButton(onPressed: null, child: Text("Entrar")),
        Text("Ou", textAlign: TextAlign.center),
        ElevatedButton(onPressed: null, child: Text("Continuar com Google")),
        ElevatedButton(onPressed: null, child: Text("Continuar com Facebook")),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Não tem uma conta?", style: Tipografia.subtitulo),
            InkWell(child: Text("Cadastre-se", style: Tipografia.link)),
          ],
        ),
      ],
    );
  }
}
