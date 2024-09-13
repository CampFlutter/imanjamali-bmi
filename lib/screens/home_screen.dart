import 'package:flutter_application_bmi_kamp/widgets/background_shape_left.dart';
import 'package:flutter_application_bmi_kamp/widgets/background_shape_right.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_bmi_kamp/Variables/variable.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  void nextpage(BuildContext context, Widget page) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'تو چنده ؟ BMI',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 130,
                    child: TextField(
                      controller: weightController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.orangeAccent),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'وزن',
                        hintStyle: TextStyle(
                            color: Colors.orangeAccent.withOpacity(0.5)),
                      ),
                    ),
                  ),
                  Container(
                    width: 130,
                    child: TextField(
                      controller: heightController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.orangeAccent),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'قد',
                        hintStyle: TextStyle(
                            color: Colors.orangeAccent.withOpacity(0.5)),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  final weight = double.parse(weightController.text);
                  final height = double.parse(heightController.text);

                  setState(() {
                    resultBMI = weight / (height * height);
                    re = 25 * (height * height);
                    ezaf = weight - re;
                    ezafvazn = ' وزن دارید$ezaf شما ';

                    if (resultBMI > 25) {
                      wightbad = 270;
                      wightgood = 50;
                      reslutText = 'شما اضافه وزن دارید:$ezafکیلو';
                    } else if (resultBMI >= 18.5 && resultBMI <= 25) {
                      wightbad = 50;
                      wightgood = 270;
                      reslutText = 'وزن شما نرمال است';
                    } else {
                      wightbad = 10;
                      wightgood = 10;
                      reslutText = 'وزن شما کم‌تر از حد نرمال است';
                    }
                  });
                },
                child: Text(
                  '! محاسبه کن',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                '${resultBMI.toStringAsFixed(2)}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 64),
              ),
              Column(children: [
                Text(
                  '$reslutText',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
              ]),
              SizedBox(
                height: 80,
              ),
              SizedBox(
                height: 80,
              ),
              RightShape(
                widht: wightbad,
              ),
              SizedBox(
                height: 15,
              ),
              LeftShape(
                width: wightgood,
              ),
              SizedBox(
                height: 25,
              ),

              //   ElevatedButton(
              //   onPressed: () {
              //     showDialog(
              //       context: context,
              //       builder: (BuildContext context) {
              //         return AlertDialog(
              //           title: Text('اطلاعات بیشتر'),
              //           content: Text('$ezafvazn'),
              //           actions: <Widget>[
              //             TextButton(
              //               child: Text('بستن'),
              //               onPressed: () {
              //                 Navigator.of(context).pop(); // بستن پیام باکس
              //               },
              //             ),
              //           ],
              //         );
              //       },
              //     );
              //   },
              //   child: Text('اطلاعات بیشتر'),
              // ),

              TextButton(
                  onPressed: () {
                    weightController.clear();
                    heightController.clear();
                  },
                  child: Text(
                    'clear',
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
