import 'package:flutter_application_1/app_constants.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double CountingResult = 0;
  String TextResult = "";

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
            style:
                TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: mainHexColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 170,
                    child: TextField(
                      controller: heightController,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Height:",
                        labelStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: accentHexColor),
                        hintText: "(m)",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8)),
                      ),
                    ),
                  ),
                  Container(
                    width: 170,
                    child: TextField(
                      controller: weightController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Weight:",
                        labelStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: accentHexColor),
                        hintText: "(kg)",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8)),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  double h = double.parse(heightController.text);
                  double w = double.parse(weightController.text);
                  setState(() {
                    CountingResult = w / (h * h);
                    if (CountingResult >= 18.5 && CountingResult < 24) {
                      TextResult = "Normal Weight";
                    } else if (CountingResult >= 24) {
                      TextResult = "Over Weight";
                    } else {
                      TextResult = "Under Ｗeight";
                    }
                  });
                },
                child: Text(
                  "Calculate",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: accentHexColor),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                child: Text(
                  CountingResult.toStringAsFixed(2),
                  style: TextStyle(fontSize: 90, color: accentHexColor),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Visibility(
                  visible: TextResult.isNotEmpty,
                  child: Container(
                    child: Text(
                      TextResult,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w400,
                          color: accentHexColor),
                    ),
                  )),
            ],
          ),
        ));
  }
}
