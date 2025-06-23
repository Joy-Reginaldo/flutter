import 'package:flutter/material.dart';

void main() => runApp(const BMICalculatorApp());

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const BMIScreen(),
    );
  }
}

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  double? _bmi;
  String _bmiResult = '';
  bool _isMaleSelected = true;

  void _calculateBMI() {
    final double? weight = double.tryParse(_weightController.text);
    final double? heightCm = double.tryParse(_heightController.text);

    if (weight == null || heightCm == null || heightCm == 0) {
      setState(() {
        _bmiResult = "Preencha os campos corretamente.";
        _bmi = null;
      });
      return;
    }

    final heightM = heightCm / 100;
    final bmi = weight / (heightM * heightM);

    setState(() {
      _bmi = double.parse(bmi.toStringAsFixed(1));
      if (_bmi! < 18.5) {
        _bmiResult = 'Underweight';
      } else if (_bmi! < 25) {
        _bmiResult = 'Normal';
      } else if (_bmi! < 30) {
        _bmiResult = 'Overweight';
      } else {
        _bmiResult = 'Obesity';
      }
    });
  }

  void _reset() {
    _weightController.clear();
    _heightController.clear();
    setState(() {
      _bmi = null;
      _bmiResult = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your body'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'BMI Calculator',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _genderCard("Male", _isMaleSelected),
                _genderCard("Female", !_isMaleSelected),
              ],
            ),
            const SizedBox(height: 20),
            _inputField("Your weight (kg)", _weightController),
            const SizedBox(height: 10),
            _inputField("Your height (cm)", _heightController),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: const Text('Calculate your BMI'),
            ),
            const SizedBox(height: 20),
            if (_bmi != null)
              Column(
                children: [
                  Text(
                    'Your BMI',
                    style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                  ),
                  Text(
                    '$_bmi',
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _bmiResult,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: _reset,
                    child: const Text(
                      'Calculate BMI again',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 30),
            _bmiCategoriesCard(),
          ],
        ),
      ),
    );
  }

  Widget _genderCard(String gender, bool isSelected) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: isSelected ? Colors.blue : Colors.grey[300],
          child: Icon(
            gender == "Male" ? Icons.man : Icons.woman,
            color: Colors.white,
            size: 30,
          ),
        ),
        Text(
          gender,
          style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
        ),
      ],
    );
  }

  Widget _inputField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _bmiCategoriesCard() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('BMI categories', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Less than 18.5 — you're underweight.'),
            Text('18.5 to 24.9 — you're normal.'),
            Text('25 to 29.9 — you're overweight.'),
            Text('30 or more — obesity.'),
          ],
        ),
      ),
    );
  }
}
