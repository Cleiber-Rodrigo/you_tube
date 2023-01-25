import 'package:flutter/material.dart';
import 'package:youtube2/telas/Biblioteca.dart';
import 'package:youtube2/telas/EmAlta.dart';
import 'package:youtube2/telas/Inicio.dart';
import 'package:youtube2/telas/Inscricao.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio(),
      EmAlta(),
      Inscricao(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "imagens/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: (){
              print("acao: videocam");
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              print("acao: pesquisa");
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){
              print("acao: conta");
            },
          )
        ],
      ),
      body: telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label: "Início"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.whatshot),
              label: "Em Alta"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions),
              label: "Inscrições"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.folder),
              label: "Biblioteca"
          ),
        ],
      ),
    );
  }
}
