import 'dart:html';

import 'package:flutter/material.dart';

class Argumentos {
  int acertos = 0;
  Argumentos(this.acertos);
}

class Resultado extends StatelessWidget {
  static const routeName = 'Resultados';

  const Resultado({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final argumentos = ModalRoute.of(context).settings.arguments as Argumentos;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Pergunta e resposta do Othon')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Resultado', style: TextStyle(fontSize: 20)),
                Text('Você acertou\n${argumentos.acertos} de 10 =\nperguntas',
                    style: TextStyle(fontSize: 20)),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      print('Pressionado');

                      Navigator.pushNamed(context, 'Quiz');
                    },
                    child:
                        Text('Jogar novamente', style: TextStyle(fontSize: 30)),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
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
