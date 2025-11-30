import 'package:flutter/material.dart';
import 'dart:async';
import 'pantalla2_Llamando.dart';

class pantalla1 extends StatefulWidget {
  const pantalla1({super.key});

  @override
  State<pantalla1> createState() => _pantalla1State();
}

class _pantalla1State extends State<pantalla1> {
  bool isPressed = false;
  int countdown = 3;
  Timer? timer;
  bool timerActive = false;
  bool countdownFinished = false;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startCountdown() {
    countdown = 3;
    timerActive = true;

    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        countdown--;
      });

      if (countdown <= 0) {
        timer?.cancel();
        timerActive = false;
        setState(() {
          countdownFinished = true;
        });
        
        Future.delayed(Duration(milliseconds: 500), () {
          if (mounted) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Pantalla2Llamando()),
            );
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Botón de Pánico - SOS'),
        backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 5,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sistema de Emergencia',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onLongPressStart: (details) {
                  setState(() {
                    isPressed = true;
                  });
                  startCountdown();
                },
                onLongPressEnd: (details) {
                  setState(() {
                    isPressed = false;
                    countdownFinished = false;
                  });
                  timer?.cancel();
                  timerActive = false;
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
          SizedBox(height: 30),
          if (timerActive)
            Text(
              countdown.toString(),
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          if (timerActive) SizedBox(height: 20),
          Row(
            children: [
              Expanded(flex: 20, child: SizedBox()),
              Expanded(
                flex: 80,
                child: Text(
                  'Mantén presionado por 3 segundos para llamar a emergencias',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(flex: 20, child: SizedBox()),
            ],
          ),
          if (countdownFinished)
            SizedBox(height: 30),
          if (countdownFinished)
            Text(
              '¡LLAMANDO A EMERGENCIAS!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
        ],
      ),
    );
  }
}

