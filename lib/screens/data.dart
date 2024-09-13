import 'package:flutter/material.dart';



class Moredata extends StatelessWidget {
  const Moredata({super.key});

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('more data'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('اطلاعات بیشتر'),
                    content: Text(''),
                    actions: <Widget>[
                      TextButton(
                        child: Text('بستن'),
                        onPressed: () {
                          Navigator.of(context).pop(); // بستن پیام باکس
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('اطلاعات بیشتر'),
          ),
        ),
      ),
    ));
  }
}
