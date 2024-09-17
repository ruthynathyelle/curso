import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Tarefas'),
          ),
        body: ListView(
          children: [
            Task('Aprender Flutter'),
            Task('Andar de Bike'),
            Task('Meditar'),
            Task('Correr'),
            Task('Ler'),
            
          ],

        ),

      ),
    );
  }
}


class Task extends StatefulWidget {
  final String nome;
  const Task (this.nome, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
            child: Stack(
              children: [
                Container(color: Colors.blue, height: 140,),
                Column(
                  children: [
                    Container(color: Colors.white, height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: Colors.black26,
                          width: 72,
                          height: 100,
                        ),
                        Container(
                          width: 100,
                          child:
                           Text(widget.nome, style: 
                           TextStyle(
                            fontSize: 24,
                            overflow: TextOverflow.ellipsis,
                            ),
                            )
                            ),
                            
                        ElevatedButton(onPressed: (){
                          setState(() {
                            nivel++;
                          });

                          
                          }, 

                          child: Icon(Icons.arrow_drop_up))
                    ],
                    ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            child: LinearProgressIndicator(
                              color: Colors.white,
                              value: nivel/10,
                              
                              ),
                              width: 200,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text('Nivel: $nivel', style: TextStyle(color: Colors.white, fontSize: 16,)
                          ),
                        ),

                      ],
                    ),
                  ],

                )
              ],
              )
            
          ),
    );

  }
}