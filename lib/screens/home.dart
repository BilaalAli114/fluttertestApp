import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/Constants/app_constants.dart';
import 'package:bmi_calculator/widget/leftBar.dart';
import 'package:bmi_calculator/widget/rightbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _weightController = TextEditingController();
  TextEditingController _hightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI colculator",
          style: TextStyle(
            color: accentColor,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: maincolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  Container(
                    width: 90,
                    child: TextField(
                      controller: _hightController,
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentColor,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Height",
                          hintStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w300,
                              color: Colors.white)),
                    ),
                  ),
                  Container(
                    width: 80,
                    child: TextField(
                      controller: _weightController,
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentColor,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Weight',
                          hintStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w300,
                              color: Colors.white)),
                    ),
                  )
                ])),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
                onTap: () {
                  double _h = double.parse(_hightController.text);
                  double _w = double.parse(_weightController.text);
                  setState(() {
                    _bmiResult = _w / (_h * _h);
                    if (_bmiResult > 25) {
                      _textResult = "you\'re over Weight";
                      print(_textResult);
                    } else if (_bmiResult >= 18.5 && -_bmiResult <= 25) {
                      _textResult = "you\'ve Normal Weight";
                      print(_textResult);
                    } else {
                      _textResult = "you\'re Under Wight";
                    }
                  });
                },
                child: Container(
                  child: Text("Calculate",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: accentColor)),
                )),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text(_bmiResult.toStringAsFixed(2),
                  style: TextStyle(fontSize: 50, color: accentColor)),
            ),
            SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(_textResult,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        color: accentColor)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            leftBar1(barWidth: 40),
            SizedBox(
              height: 20,
            ),
            leftBar1(barWidth: 70),
            SizedBox(
              height: 20,
            ),
            leftBar1(barWidth: 40),
            SizedBox(
              height: 20,
            ),
            leftBar(barWidth: 40),
            SizedBox(
              height: 50,
            ),
            leftBar(barWidth: 40),
            SizedBox()
          ],
        ),
      ),
    );
  }
}
