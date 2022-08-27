import 'package:flutter/material.dart';
import 'package:pluralsight_course_1/shared/menu_bottom_nav.dart';
import 'package:pluralsight_course_1/shared/menu_drawer.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  double? height;
  double? weight;
  late List<bool> isSelected;
  String heightMessage = '';
  String weightMessage = '';

  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isSelected = [
      isMetric,
      isImperial,
    ];
  }

  @override
  Widget build(BuildContext context) {
    heightMessage =
        'Please insert your height in ${(isMetric) ? 'meters' : 'inches'}';
    weightMessage =
        'Please insert your weight in ${(isMetric) ? 'kilos' : 'pounds'}';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'BMI Calculator',
        ),
      ),
      drawer: const MenuDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                ),
                child: ToggleButtons(
                  isSelected: isSelected,
                  onPressed: toggleMethod,
                  children: toggleChildren,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: heightMessage,
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: weightMessage,
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: calcBMI,
              child: const Text(
                'Calculate',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  result,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const MenuBottomNav(),
    );
  }

  void calcBMI() {
    double bmi = 0;
    height = double.tryParse(heightController.text) ?? 0;
    weight = double.tryParse(weightController.text) ?? 0;
    if (isMetric) {
      bmi = weight! / (height! * height!);
    } else {
      bmi = (weight! * 703 / (height! * height!));
    }
    setState(() {
      result = 'Your BMI is: $bmi';
    });
  }

  List<Widget> get toggleChildren {
    return const [
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Text(
          'Metric',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Text(
          'Imperial',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
    ];
  }

  void toggleMethod(int index) {
    switch (index) {
      case 0:
        isMetric = true;
        isImperial = false;
        setState(() {
          isSelected = [
            isMetric,
            isImperial,
          ];
        });
        break;
      case 1:
        isMetric = false;
        isImperial = true;
        setState(() {
          isSelected = [
            isMetric,
            isImperial,
          ];
        });
        break;
    }
  }
}
