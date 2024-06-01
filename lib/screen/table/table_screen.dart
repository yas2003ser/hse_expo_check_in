import 'package:flutter/material.dart';

class TableScreen extends StatelessWidget {
  const TableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/logo.png", width: 100, height: 100),
                Image.asset("assets/circle.png"),
              ],
            ),
            const SizedBox(height: 50),
            const Text(
              "member Details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(3),
                  3: FlexColumnWidth(3),
                },
                border: TableBorder.all(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          height: 55,
                          color: const Color(0xffEBEBEB),
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(
                            child: Text(
                              'id',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          color: const Color(0xffEBEBEB),
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(
                            child: Text(
                              'Full Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: 55,
                          color: const Color(0xffEBEBEB),
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(
                            child: Text(
                              'Check in',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: 55,
                          color: const Color(0xffEBEBEB),
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(
                            child: Text(
                              'Check out',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  for (int i = 1; i < 10; i++)
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("$i"),
                          ),
                        ),
                        const TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('John Doe'),
                          ),
                        ),
                        const TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('09:00 AM'),
                          ),
                        ),
                        const TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('05:00 PM'),
                          ),
                        ),
                      ],
                    ),

                  // Add more rows as needed
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
