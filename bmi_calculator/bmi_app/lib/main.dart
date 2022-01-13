import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BmiCalculator(),
    );
  }
}

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int currentIndex = 0;
  late String result = "";
  late String status = "";
  late String sex = "";
  late double h, w = 0;
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              "BMI Chỉ số",
              style: TextStyle(color: Colors.black),
            ),
            elevation: 0.0,
            backgroundColor: Color(0xfffafafa),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
              ),
            ]),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    radioButton("Man", Colors.blue, 0, "Nam"),
                    radioButton("Woman", Colors.pink, 1, "Nữ"),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Chiều cao của bạn (Cm) : ",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: heightController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "Chiều cao của bạn (Cm)",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide.none,
                      )),
                ),
                SizedBox(height: 20),
                Text(
                  "Cân nặng của bạn (Kg) : ",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: weightController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "Cân nặng của bạn (Kg)",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide.none)),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        h = double.parse(heightController.value.text);
                        w = double.parse(weightController.value.text);
                      });
                      calculatorBMI(h, w);
                    },
                    color: Colors.blue,
                    child: Text(
                      "Tính toán",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    "Chỉ số BMI của bạn là :",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    "$sex $result",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    "$status",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculatorBMI(double height, double weight) {
    double finalResult = weight / (height * height / 10000);
    String bmi = finalResult.toStringAsFixed(2);

    setState(() {
      this.result = bmi;
      if (finalResult > 30) {
        this.status = "Bạn béo phì";
      } else if (finalResult >= 25) {
        this.status = "Bạn thừa cân";
      } else if (finalResult > 18.5 || finalResult < 25) {
        this.status = "Bạn bình thường";
      } else {
        this.status = "Bạn gầy";
      }
    });
  }

  // declair a function to change the index value on bottom pressed
  void changeIndex(int index, String sex) {
    setState(() {
      this.currentIndex = index;
      this.sex = sex;
    });
  }

  // create a new custom widget
  Widget radioButton(String value, Color color, int index, String sex) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0),
      height: 100.0,
      child: FlatButton(
        color: currentIndex == index ? color : Colors.grey[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Text(
          value,
          style: TextStyle(
            color: currentIndex == index ? Colors.white : color,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          changeIndex(index, sex);
        },
      ),
    ));
  }
}
