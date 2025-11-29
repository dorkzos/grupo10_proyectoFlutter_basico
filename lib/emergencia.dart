import 'package:flutter/material.dart';

class PantallaEmergencia extends StatelessWidget {
  const PantallaEmergencia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Servicio de Emergencia'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Emergencia Activada',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ],
          ),
          SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, size: 300, color: Colors.green),
            ],
          ),
          SizedBox(height: 50),
          Row(
            children: [
              Expanded(flex: 20, child: SizedBox()),
              Expanded(
                flex: 80,
                child: Text(
                  'Llamando a servicios de emergencia...\nPermanece en esta línea',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(flex: 20, child: SizedBox()),
            ],
          ),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('¿Seguro que quieres cancelar la llamada?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);  // Cierra el diálogo
                        },
                        child: Text('No'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);  // Cierra el diálogo
                          Navigator.pop(context);  // Vuelve a la pantalla anterior
                        },
                        child: Text('Sí'),
                      ),
                    ],
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
            ),
            child: Text(
              'Cancelar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
