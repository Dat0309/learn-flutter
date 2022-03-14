import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:homme_service_app/animation/fadeanimation.dart';
import 'package:homme_service_app/models/service.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int selectedService = 4;

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        selectedService = Random().nextInt(services.length);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.0,
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              physics: NeverScrollableScrollPhysics(),
              itemCount: services.length,
              itemBuilder: (BuildContext context, int index) {
                return FadeAnimation(
                    delay: (1.0 + index) / 4,
                    child: serviceContainer(
                        services[index].imgUrl, services[index].name, index));
              },
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80),
                  topRight: Radius.circular(80),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  FadeAnimation(
                    delay: 1.5,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Center(
                        child: Text(
                          'Easy, reliable way take \ncare of yoour home',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade900,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                    delay: 1.5,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 60),
                      child: Center(
                        child: Text(
                          'We provide yoou with the best people to help take of your home.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  FadeAnimation(
                    delay: 1.5,
                    child: Padding(
                      padding: EdgeInsets.all(50.0),
                      child: MaterialButton(
                        elevation: 0,
                        color: Colors.black,
                        onPressed: () {},
                        height: 55,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  serviceContainer(String image, String name, int index) {
    return GestureDetector(
      onTap: () {},
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: selectedService == index ? Colors.white : Colors.grey.shade100,
          border: Border.all(
            color: selectedService == index
                ? Color.fromARGB(255, 94, 95, 95)
                : Color.fromARGB(255, 44, 44, 44).withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                image,
                height: 30,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 14),
              )
            ]),
      ),
    );
  }
}
