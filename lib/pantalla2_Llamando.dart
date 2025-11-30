import 'package:flutter/material.dart';
import 'dart:async';

class Pantalla2Llamando extends StatefulWidget {
  const Pantalla2Llamando({super.key});

  @override
  State<Pantalla2Llamando> createState() => _Pantalla2LlamandoState();
}

class _Pantalla2LlamandoState extends State<Pantalla2Llamando> {
  late Timer _pulseTimer;
  bool _isPulsing = false;

  @override
  void initState() {
    super.initState();
    _startPulse();
  }

  void _startPulse() {
    _pulseTimer = Timer.periodic(Duration(milliseconds: 800), (timer) {
      if (mounted) {
        setState(() {
          _isPulsing = !_isPulsing;
        });
      }
    });
  }

  @override
  void dispose() {
    _pulseTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Servicio de Emergencia'),
        backgroundColor: Colors.red,
        elevation: 5,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Emergencia Activada',
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
              AnimatedScale(
                scale: _isPulsing ? 1.2 : 1.0,
                duration: Duration(milliseconds: 400),
                child: Icon(
                  Icons.check_circle,
                  size: 150,
                  color: Colors.green.shade600,
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Row(
            children: [
              Expanded(flex: 20, child: SizedBox()),
              Expanded(
                flex: 80,
                child: Column(
                  children: [
                    Text(
                      'Llamando a servicios de emergencia...',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Permanece en esta línea',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(flex: 20, child: SizedBox()),
            ],
          ),
          SizedBox(height: 60),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('¿Seguro que quieres cancelar?'),
                    content: Text('Se cancelará la llamada a emergencias.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'No',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Sí, cancelar',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Cancelar Llamada',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
