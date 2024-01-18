/// @author Emre Deniz
/// @date Jan 26, 2024

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

  // Define initial output result texts
  String regularPayOutput = "regular pay:";
  String overtimePayOutput = "overtime pay:";
  String totalPayOutput = "total pay:";
  String taxOutput = "tax:";

  @override
  Widget build(BuildContext context) {
    // Build a form widget using the _formKey
    return Container(
        color: const Color.fromRGBO(38, 38, 38, 0.4),
        child: Column(children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                // Text input: "Number of hours"
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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
                Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid
                        if (_formKey.currentState!.validate()) {
                          // Define regularPay, overtimePay, totalPay and tax
                          var numberOfHoursInput =
                              int.parse(numberOfHours.text);
                          var hourlyRateInput = double.parse(hourlyRate.text);
                          var regularPay = 0.0;
                          var overtimePay = 0.0;
                          var totalPay = 0.0;
                          var tax = 0.0;

                          // Calculate regularPay, overtimePay, totalPay and tax
                          if (numberOfHoursInput <= 40) {
                            regularPay = numberOfHoursInput * hourlyRateInput;
                            totalPay = regularPay;
                            tax = totalPay * 0.18;
                          } else {
                            regularPay = 40 * hourlyRateInput;
                            overtimePay = (numberOfHoursInput - 40) *
                                hourlyRateInput *
                                1.5;
                            totalPay = regularPay + overtimePay;
                            tax = totalPay * 0.18;
                          }

                          // Set output texts
                          setState(() {
                            regularPayOutput =
                                "regular pay:${regularPay.toStringAsFixed(2)}";
                            overtimePayOutput =
                                "overtime pay: ${overtimePay.toStringAsFixed(2)}";
                            totalPayOutput =
                                "total pay:${totalPay.toStringAsFixed(2)}";
                            taxOutput = "tax:${tax.toStringAsFixed(2)}";
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      child: const Text('Calculate'),
                    ))
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
              margin: const EdgeInsets.only(top: 40),
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
