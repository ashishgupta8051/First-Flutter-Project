import 'package:first_flutter_project/utils/HexColor.dart';
import 'package:flutter/material.dart';

class SplitCalculator extends StatefulWidget {
  const SplitCalculator({super.key});

  @override
  State<SplitCalculator> createState() => _SplitCalculatorState();
}

class _SplitCalculatorState extends State<SplitCalculator> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billamount = 0.0;
  final Color _purple = HexColor("#6908D6");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: false,
        title: const Text(
          "Tip Calculator",
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(20),
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.01),
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: _purple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Total per person",
                        style: TextStyle(
                            color: _purple.withOpacity(0.6),
                            fontSize: 14,
                            fontStyle: FontStyle.normal)),
                    Text(
                        "\$${calculateTotalBillAmount(_personCounter, _billamount, _tipPercentage)}",
                        style: TextStyle(
                          color: _purple,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                        )),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                      color: Colors.blueGrey.shade100,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  TextField(
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: _purple),
                    decoration: const InputDecoration(
                      hintText: "Bill Amount",
                      prefixIcon: Icon(Icons.attach_money),
                    ),
                    onChanged: (String value) {
                      try {
                        _billamount = double.parse(value);
                      } catch (exception) {
                        _billamount = 0.0;
                      }
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Split",
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_personCounter > 1) {
                                  _personCounter--;
                                }
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: _purple.withOpacity(0.1)),
                              child: const Text(
                                "-",
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                _personCounter.toString(),
                                style: TextStyle(
                                    color: _purple,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_personCounter < 20) {
                                  _personCounter++;
                                }
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: _purple.withOpacity(0.1)),
                              child: const Text(
                                "+",
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tip",
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\$${calculateTip(_tipPercentage, _billamount)}",
                        style: TextStyle(
                            color: _purple,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("$_tipPercentage%",
                          style: TextStyle(
                            color: _purple,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                          )),
                      Slider(
                          min: 0,
                          max: 100,
                          divisions: 10,
                          activeColor: _purple,
                          inactiveColor: Colors.grey,
                          value: _tipPercentage.toDouble(),
                          onChanged: (double value) {
                            if (_billamount == 0.0) {
                              const shackBar = SnackBar(
                                content: Text(
                                  "Bill amount can't be empty!!!",
                                  style: TextStyle(fontSize: 16),
                                ),
                                backgroundColor: Colors.grey,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(shackBar);
                            } else {
                              setState(() {
                                _tipPercentage = value.round();
                              });
                            }
                          })
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  calculateTotalBillAmount(int splitBy, double billAmount, int tipPercentage) {
    var totalBill =
        (calculateTip(tipPercentage, billAmount) + billAmount) / splitBy;
    return totalBill.toStringAsFixed(2);
  }

  calculateTip(int tipPercentage, double billAmount) {
    double tipAmount = 0.0;
    tipAmount = (billAmount * tipPercentage) / 100;
    return tipAmount;
  }
}
