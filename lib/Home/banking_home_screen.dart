import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Detail/transaction_item_detail.dart';
import 'master_card.dart';
import 'transaction_items.dart';

class BankingHomeScreen extends StatefulWidget {
  const BankingHomeScreen({super.key});

  @override
  State<BankingHomeScreen> createState() => _BankingHomeScreenState();
}

class _BankingHomeScreenState extends State<BankingHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        top: true,
        minimum: EdgeInsets.only(top: screenHeight * 0.08), // Ajuste del padding superior
        child: Column(
          children: [
            // for custom appbar
            customAppBar(context),
            // for master card
            SizedBox(
              height: screenHeight * 0.3,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                children: [
                  MesterCard(
                    id: "**********34567",
                    balance: '\$600',
                    color: Colors.deepPurple,
                  ),
                  MesterCard(
                    id: "**********54970",
                    balance: '\$60',
                    color: Colors.blueAccent,
                  ),
                  MesterCard(
                    id: "**********50970",
                    balance: '\$300',
                    color: Colors.pinkAccent,
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Transacciones",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                ),
                child: ListView(
                  children: [
                    TransactionItems(
                        icon: Icons.bus_alert,
                        onTab: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TransactionItemDetail()));
                        },
                        color: Colors.blue,
                        date: "24 feb",
                        remark: "Viajes",
                        time: "Hace 3 Dias",
                        total: "\$445.000"),
                    TransactionItems(
                        icon: Icons.fastfood,
                        onTab: () {},
                        color: Colors.orange,
                        date: "27 feb",
                        remark: "Comida",
                        time: "Hoy",
                        total: "\$45.000"),
                    TransactionItems(
                        icon: Icons.man_outlined,
                        onTab: () {},
                        color: Colors.deepOrange,
                        date: "24 ene",
                        remark: "Yoga",
                        time: "Hace un 1 mes",
                        total: "\$445.000"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding customAppBar(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mi Tarjeta",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Text(
                "27 Feb",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Container(
            height: screenHeight * 0.07,
            width: screenWidth * 0.13,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFFFF8B66),
            ),
            child: const Text(
              "😝",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28),
            ),
          ),
        ],
      ),
    );
  }
}