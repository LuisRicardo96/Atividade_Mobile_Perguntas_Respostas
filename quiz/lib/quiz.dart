import 'package:flutter/material.dart';
import 'package:quiz/resultados.dart';

final List quiz = [
  {
    "pergunta": "Qual é o sobrenome de Othon ?",
    "respostas": [
      "Sousa",
      "Silva",
      "Batista",
      "Lima",
    ],
    "alternativa_correta": 3,
  },
  {
    "pergunta": "Othon começou na programação com quantos anos?",
    "respostas": [
      "13",
      "16",
      "15",
      "19",
    ],
    "alternativa_correta": 1,
  },
  {
    "pergunta": "O primeiro computador de Othon foi um?",
    "respostas": [
      "Macbook",
      "ChromeBook",
      "MSX Hotbit",
      "ENIAC",
    ],
    "alternativa_correta": 3,
  },
  {
    "pergunta": "Em que ano Othon entrou na sua 1° graduação ?",
    "respostas": [
      "1992",
      "1994",
      "1998",
      "1990",
    ],
    "alternativa_correta": 4,
  },
  {
    "pergunta": "Em que ano Othon começou a lecionar?",
    "respostas": [
      "1991",
      "1995",
      "1992",
      "2000",
    ],
    "alternativa_correta": 3,
  },
  {
    "pergunta": "Em qual estado Othon nasceu?",
    "respostas": [
      "Bahia",
      "Rio grande do sul",
      "RIo grande do norte",
      "São Paulo",
    ],
    "alternativa_correta": 3,
  },
  {
    "pergunta": "Qual pais Othon foi no ano  2000?",
    "respostas": [
      "Suiça",
      "Russia",
      "Uruguai",
      "China",
    ],
    "alternativa_correta": 1,
  },
  {
    "pergunta": "Para onde Othon foi morar em 2010?",
    "respostas": [
      "Feira de Santana",
      "Lauro de Freitas",
      "Barreiras",
      "Alagoinhas",
    ],
    "alternativa_correta": 2,
  },
  {
    "pergunta": "Desde quando Othon usa Linux",
    "respostas": [
      "1991",
      "1996",
      "1989",
      "1994",
    ],
    "alternativa_correta": 4,
  },
  {
    "pergunta": "Qual abreviação da empresa de Othon",
    "respostas": [
      "OCP",
      "OPC",
      "DPC",
      "SWD",
    ],
    "alternativa_correta": 1,
  }
];

class Quiz extends StatefulWidget {
  Quiz({Key key, this.quiz}) : super(key: key);

  final List quiz;

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int perguntaNumero = 1;
  int acertos = 0;
  int erros = 0;

  @override
  Widget build(BuildContext context) {
    void respondeu(int respostaNumero) {
      setState(() {
        if (quiz[perguntaNumero - 1]['alternativa_correta'] == respostaNumero) {
          print('Você acertou');
          acertos++;
        } else {
          print('Você errou');
          erros++;
        }
        print('acertos totais: $acertos erros totais: $erros');

        if (perguntaNumero == 10) {
          print('Terminou o QUiz');
          Navigator.pushNamed(context, 'Resultado',
              arguments: Argumentos(acertos));
        } else {
          perguntaNumero++;
        }
      });
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Quiz curso de flutter & dart')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: Text('Pergunta $perguntaNumero de 10',
                      style: TextStyle(fontSize: 20))),
              Text('Pergunta:\n\n' + quiz[perguntaNumero - 1]['pergunta'],
                  style: TextStyle(fontSize: 20)),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print('Pressionado 1');
                    respondeu(1);
                  },
                  child: Text(quiz[perguntaNumero - 1]['respostas'][0],
                      style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print('Pressionado 2');
                    respondeu(2);
                  },
                  child: Text(quiz[perguntaNumero - 1]['respostas'][1],
                      style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print('Pressionado 3');
                    respondeu(3);
                  },
                  child: Text(quiz[perguntaNumero - 1]['respostas'][2],
                      style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print('Pressionado 4');
                    respondeu(4);
                  },
                  child: Text(quiz[perguntaNumero - 1]['respostas'][3],
                      style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
