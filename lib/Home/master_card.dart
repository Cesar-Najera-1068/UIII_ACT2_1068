import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MesterCard extends StatelessWidget {
  String id;
  Color color;
  String balance;
  MesterCard({
    super.key,
    required this.balance,
    required this.color,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: screenHeight * 0.05, left: 10),
          width: screenWidth - 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Stack(
            children: [
              cardBackground(size: 50, pTop: 70, pLeft: 200),
              cardBackground(size: 160, pBottom: -50),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        masterCardLogo(size: 25),
                        Text(
                          id,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Mastercard",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              balance,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: -screenHeight * 0.055, // Ajusta la posición vertical si es necesario después de cambiar el tamaño
          child: Image.network(
            "https://raw.githubusercontent.com/Cesar-Najera-1068/Central_Camionera_imagenes_appflutter/refs/heads/main/monito.png",
            width: screenWidth * 0.25, // Reducimos el ancho de la imagen
          ),
        ),
      ],
    );
  }

  Positioned cardBackground({
    double size = 40,
    double? pTop,
    double? pBottom,
    double? pLeft,
    double? pRight,
  }) =>
      Positioned(
        left: pLeft,
        top: pTop,
        bottom: pBottom,
        right: pRight,
        child: Transform.rotate(
          angle: 1,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(size / 6),
            ),
            height: size,
            width: size,
          ),
        ),
      );

  SizedBox masterCardLogo({double size = 30}) {
    return SizedBox(
      width: size * 3.33,
      height: size,
      child: Stack(
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(size / 2),
            ),
          ),
          Positioned(
            left: size * 0.66,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(size / 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}