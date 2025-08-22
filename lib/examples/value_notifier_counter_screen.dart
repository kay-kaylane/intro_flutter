//import 'dart:math';
import 'package:flutter/material.dart';



class CounterScreenValueNotifier extends StatefulWidget {
  const CounterScreenValueNotifier({super.key});

  @override
  State<CounterScreenValueNotifier> createState() => _CounterScreenValueNotifierState();
}

class _CounterScreenValueNotifierState extends State<CounterScreenValueNotifier> {
  // ValueNotifier para armazenar um número
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  String _message = 'Toque nos botões para alterar o contador';
  Color _counterColor = Colors.blue;

  @override
  void dispose() {
    // Importante: sempre dispose dos ValueNotifiers para evitar memory leaks
    _counter.dispose();
    super.dispose();
  }


  void _incrementCounter() {
    _counter.value++;
     _message = 'Contador aumentado';
  }

  void _decrementCounter() {
    _counter.value--;
     _message = 'Contador diminuido';
  }

  void _resetCounter() {
    _counter.value= 0;
    _message = 'Contador reiniciado';
  }
void _updateMessage() {
    setState(() {
      if (_counter.value == 0) {
        _message = 'Contador zerado';
        _counterColor = const Color.fromARGB(255, 76, 101, 175);
      } else if (_counter.value > 0) {
        _message = 'Contador positivo${_counter.value}';
        _counterColor = const Color.fromARGB(255, 10, 180, 27);
      } else {
        _message = 'Contador negativo${_counter.value}';
        _counterColor = const Color.fromARGB(255, 255, 6, 6);
      }
    });
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('Contador interativo'),
        backgroundColor: const Color.fromARGB(255, 137, 114, 164),
      ),
      body: Center(
        child: Padding(
          padding: const  EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const  EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: _counterColor. withAlpha(1),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black,width: 2,
                  )
                ),
                child: Column(
                 children: [
                  ValueListenableBuilder(valueListenable: _counter, 
                  builder: (context, message, child) {
                    return Text(
                      '${_counter.value}',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: _counterColor,
                      ),
                    );
                  })
                 ],
                ),
              ),
               const SizedBox(height: 20),
              Text(
                _message,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700

                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(onPressed: _decrementCounter, label: Text(
                    'Decrementar',

                  ),
                   
                  ),
                  ElevatedButton.icon(onPressed: _incrementCounter, label: Text(
                    'Incrementar',
                   
                  ),
                   
                  ),
                ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                   ElevatedButton.icon(onPressed: _resetCounter, label: Text(
                    'Resetar',
                  ),
                  )
                  ],
                )
                
            ],
          ),
        ),
      ),
    );
  }
}