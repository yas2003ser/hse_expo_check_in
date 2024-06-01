import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hse_expo_check/screen/table/table_screen.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List data = [];
  bool isLoading = true;

  Future<void> getData() async {
    final Response response = await get(
        Uri.parse('https://checkhh-5ceedbe08c3c.herokuapp.com/members'));
    final List<dynamic> memberList = jsonDecode(response.body) as List;
    setState(() {
      data = memberList;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/logo.png", width: 100, height: 100),
              Image.asset("assets/circle.png"),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(width: 10),
                    _buildSummaryCard('${data.length}\nTOTAL \n PARTICIPANTS',
                        Icons.public, const Color(0xff3851A7)),
                    const SizedBox(width: 30),
                    _buildSummaryCard(
                        '${data.where((item) => item['check_in'] != null).length}\nTOTAL\nCHECK-IN',
                        Icons.person,
                        const Color(0xff0E8C87)),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Last 5 check-in participants",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const TableScreen();
                  }));
                },
                child: const Row(
                  children: [
                    Icon(Icons.arrow_forward, color: Color(0xff0E8C87)),
                    Text("View All",
                        style: TextStyle(color: Color(0xff0E8C87))),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Table(
                    columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(2),
                      2: FlexColumnWidth(2),
                      3: FlexColumnWidth(3),
                      4: FlexColumnWidth(3),
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
                              height: 55,
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
                                  'Team Name',
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
                      for (int i = 0; i < 5; i++)
                        TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                height: 55,
                                color: i % 2 == 0
                                    ? const Color(0xffEBEBEB)
                                    : Colors.white,
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    data[i]['id'].toString(),
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                height: 55,
                                color: i % 2 == 0
                                    ? const Color(0xffEBEBEB)
                                    : Colors.white,
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    data[i]['full_name'].toString(),
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                height: 55,
                                color: i % 2 == 0
                                    ? const Color(0xffEBEBEB)
                                    : Colors.white,
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    data[i]['team_name'].toString(),
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                height: 55,
                                color: i % 2 == 0
                                    ? const Color(0xffEBEBEB)
                                    : Colors.white,
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    data[i]['check_in'].toString(),
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                height: 55,
                                color: i % 2 == 0
                                    ? const Color(0xffEBEBEB)
                                    : Colors.white,
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    data[i]['check_out'].toString(),
                                  ),
                                ),
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
    );
  }
}

Widget _buildSummaryCard(String title, IconData icon, Color color) {
  return Container(
    width: 160,
    height: 130,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                ),
                child: Image.asset("assets/dot.png", width: 50, height: 50),
              ),
              const SizedBox(width: 40),
              Icon(icon, color: Colors.white),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Column(
                children: [
                  const SizedBox(height: 5),
                  Text(
                    title,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Image.asset("assets/dot.png", width: 50, height: 50)),
            ],
          ),
        ],
      ),
    ),
  );
}
