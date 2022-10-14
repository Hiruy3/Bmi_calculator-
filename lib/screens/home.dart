import 'package:bmi_calccc/constants/app_constants.dart';
import 'package:bmi_calccc/widgets/left_bar.dart';
import 'package:bmi_calccc/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
            style:
                TextStyle(color: accentblueColor, fontWeight: FontWeight.w300),
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
                    width: 130,
                    child: TextField(
                      controller: _heightController,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentblueColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "ቁመት",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8)),
                      ),
                    ),
                  ),
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _weightController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentblueColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "ክብደት",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  double _h = double.parse(_heightController.text);
                  double _w = double.parse(_weightController.text);
                  setState(() {
                    _bmiResult = _w / (_h * _h);
                    if(_bmiResult > 25){
                      _textResult = "ከመጠን በላይ ክብደት አለዎት ";
                    } else if(_bmiResult >= 18.5 && _bmiResult <= 25){
                      _textResult = "መደበኛ ክብደት አለዎት";
                    }else{
                      _textResult = "ከክብደት በታች ነዎት";
                    }
                  });
                },
                child: Container(
                  child: Text(
                    "አስላ",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: accentblueColor),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                child: Text(
                  _bmiResult.toStringAsFixed(2),
                  style: TextStyle(fontSize: 90, color: accentblueColor),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Visibility(
                visible: _textResult.isNotEmpty,
                  child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: accentblueColor),
                ),
              )),
             
            ],),
            
          ),
        );
  }
}
