import 'package:flutter/material.dart';

class StatisticsData extends StatelessWidget {
  const StatisticsData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08, vertical: screenHeight * 0.01), // Padding proporcional
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Estadisticas",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.08, // Tamaño de fuente proporcional
                  color: Colors.white,
                ),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Icon(
                  Icons.tune,
                  size: screenWidth * 0.08, // Tamaño de icono proporcional
                  color: Colors.white54,
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: screenHeight * 0.02), // Margen superior proporcional
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenWidth * 0.06), // Radio de borde proporcional
              color: Colors.orange,
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(screenWidth * 0.08), // Margen proporcional
                  padding: EdgeInsets.all(screenWidth * 0.03), // Padding proporcional
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth * 0.25), // Radio de borde proporcional
                    color: Colors.black12,
                  ),
                  child: Container(
                    height: screenWidth * 0.3, // Altura proporcional
                    width: screenWidth * 0.3, // Ancho proporcional
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenWidth * 0.25), // Radio de borde proporcional
                      color: const Color(0xFFE9AA4E),
                    ),
                    child: Center(
                      child: Text(
                        "55%",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.07, // Tamaño de fuente proporcional
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03), // Padding vertical proporcional
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Promedio gastado",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: screenWidth * 0.04, // Tamaño de fuente proporcional
                          ),
                        ),
                        Text(
                          "\$4,100",
                          style: TextStyle(
                            fontSize: screenWidth * 0.07, // Tamaño de fuente proporcional
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.01, // Espacio proporcional
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.file_open,
                              color: Colors.white,
                              size: screenWidth * 0.04, // Tamaño de icono proporcional
                            ),
                            SizedBox(
                              width: screenWidth * 0.02, // Espacio proporcional
                            ),
                            Text(
                              "Reportar",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: screenWidth * 0.04, // Tamaño de fuente proporcional
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}