import 'package:flutter/material.dart';

class pantalla1 extends StatefulWidget {
  const pantalla1({super.key});

  @override
  State<pantalla1> createState() => _pantalla1State();
}

class _pantalla1State extends State<pantalla1> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplicación Básica: Botón de Pánico'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 100, height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Botón de Pánico',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(width: 100, height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onLongPressStart: (details) {
                  setState(() {
                    isPressed = true;
                  });
                  print('inicio');
                },
                onLongPressEnd: (details) {
                  setState(() {
                    isPressed = false;
                  });
                  print('fin');
                },
                child: AnimatedScale(
                  duration: Duration(milliseconds: 200),
                  scale: isPressed ? 1.3 : 1.0,
                  child: Image.asset(
                    'assets/img/botoncito.png',
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Row(
            children: [
              Expanded(
                flex: 20,
                child: SizedBox(),
              ),
              Expanded(
                flex: 80,
                child: Text(
                  'Mantén presionado por 3 segundos para llamar a emergencias',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 20,
                child: SizedBox(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}