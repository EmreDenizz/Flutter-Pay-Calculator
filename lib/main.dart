import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Pay Calculator';

    return MaterialApp(
        title: appTitle,
        home: Scaffold(
            appBar: AppBar(
              title: const Text(appTitle),
            ),
            body: const MyForm(),
            resizeToAvoidBottomInset: false));
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  MyFormState createState() {
    return MyFormState();
  }
}

class MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController numberOfHours = TextEditingController();
  TextEditingController hourlyRate = TextEditingController();

  // Define output result texts
  String regularPayOutput = "regular pay: ";
  String overtimePayOutput = "overtime pay: ";
  String totalPayOutput = "total pay: ";
  String taxOutput = "tax: ";

  @override
  Widget build(BuildContext context) {
    // Build a form widget using the _formKey
    return Container(
        color: const Color.fromRGBO(38, 38, 38, 0.4),
        child: Column(children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text input: "Number of hours"
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: TextFormField(
                    controller: numberOfHours,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Number of hours',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value';
                      }
                      return null;
                    },
                  ),
                ),
                // Text input: "Hourly rate"
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: TextFormField(
                    controller: hourlyRate,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Hourly rate',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value';
                      }
                      return null;
                    },
                  ),
                ),
                // Button: "Calculate"
              ],
            ),
          ),
          // Output report
          Container(
              margin: const EdgeInsets.only(top: 20),
              padding:
                  const EdgeInsets.symmetric(vertical: 30, horizontal: 110),
              decoration: BoxDecoration(
                  color: Colors.white, border: Border.all(color: Colors.white)),
              child: Column(children: [
                const Text('Report',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                Text(regularPayOutput, style: const TextStyle(fontSize: 16)),
                Text(overtimePayOutput, style: const TextStyle(fontSize: 16)),
                Text(totalPayOutput, style: const TextStyle(fontSize: 16)),
                Text(taxOutput, style: const TextStyle(fontSize: 16))
              ])),
          // About part
          Container(
              margin: const EdgeInsets.only(top: 20),
              padding:
                  const EdgeInsets.symmetric(vertical: 50, horizontal: 130),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(38, 38, 38, 0.5),
                  border: Border.all(color: Colors.white)),
              child: const Column(children: [
                Text('Emre Deniz',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                Text('301371047',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ]))
        ]));
  }
}
