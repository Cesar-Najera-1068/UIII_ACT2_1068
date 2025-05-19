import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'statistics_data.dart';

class TransactionItemDetail extends StatefulWidget {
  const TransactionItemDetail({super.key});

  @override
  State<TransactionItemDetail> createState() => _TransactionItemDetailState();
}

class _TransactionItemDetailState extends State<TransactionItemDetail> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // for back button
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
            ),
            // for icon menu
            sliderMenu(),
            const SizedBox(height: 40),
            totalIncomeExpanse(),
            const SizedBox(height: 40),
            Expanded( // Usamos Expanded para que el gráfico ocupe el espacio restante
              child: totalLineCharts(),
            ),
            const SizedBox(height: 20),
            // for Statistics
            const StatisticsData(),
          ],
        ),
      ),
    );
  }

  SizedBox totalLineCharts() {
    return SizedBox(
      // height: 240, // Ajusta la altura si es necesario
      child: LineChart(
        LineChartData(
          lineTouchData: const LineTouchData(enabled: false),
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32,
                getTitlesWidget: (double value, TitleMeta meta) {
                  const style = TextStyle(color: Colors.white60, fontSize: 15);
                  Widget text;
                  switch (value.toInt()) {
                    case 1:
                      text = const Text('Lun', style: style);
                      break;
                    case 2:
                      text = const Text('Mar', style: style);
                      break;
                    case 3:
                      text = const Text('Mie', style: style);
                      break;
                    case 4:
                      text = const Text('Jue', style: style);
                      break;
                    case 5:
                      text = const Text('Vie', style: style);
                      break;
                    case 6:
                      text = const Text('Sab', style: style);
                      break;
                    case 7:
                      text = const Text('Dom', style: style);
                      break;
                    default:
                      text = const Text("");
                  }
                  return SideTitleWidget(
                    space: 10,
                    meta: meta, // Aquí está la corrección
                    child: text,
                  );
                },
              ),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              curveSmoothness: 0.4,
              color: Colors.cyanAccent,
              barWidth: 6,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
              spots: const [
                FlSpot(1, 3),
                FlSpot(2, 1),
                FlSpot(3, 5),
                FlSpot(4, 2),
                FlSpot(5, 5),
                FlSpot(6, 6),
                FlSpot(7, 9),
              ],
            ),
          ],
          maxX: 8,
          maxY: 10,
          minX: 0,
          minY: 0,
        ),
      ),
    );
  }

  Padding totalIncomeExpanse() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20), // Reduce el padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "Total Gastado",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white60,
                ),
              ),
              FittedBox( // Usamos FittedBox para escalar el texto si es necesario
                child: Text(
                  "\$2,500",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 45, child: VerticalDivider(color: Colors.white54)),
          Column(
            children: [
              Text(
                "Total Gastado",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white60,
                ),
              ),
              FittedBox( // Usamos FittedBox para escalar el texto si es necesario
                child: Text(
                  "\$2,500",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  CarouselSlider sliderMenu() {
    return CarouselSlider(
      items: [
        crouselItems(
          index: 0,
          color: Colors.blueAccent,
          icon: Icons.flight_takeoff,
        ),
        crouselItems(index: 1, color: Colors.orange, icon: Icons.fastfood),
        crouselItems(index: 2, color: Colors.red, icon: Icons.man_outlined),
      ],
      options: CarouselOptions(
        autoPlay: false,
        height: 100,
        enlargeCenterPage: true,
        viewportFraction: 0.3,
        initialPage: currentIndex,
        onPageChanged: (index, reason) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }

  Container crouselItems({
    required int index,
    required Color color,
    required IconData icon,
  }) {
    Color backGroundColor = index == currentIndex ? color : Colors.transparent;
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          icon,
          color: backGroundColor == color ? Colors.white : color,
          size: 35,
        ),
      ),
    );
  }
}