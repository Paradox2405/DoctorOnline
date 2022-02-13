import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class EmergencyCall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        height: 400,
                      ),
                      Text(
                        "1990",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 100),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        child: Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.orange,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "CALL NOW",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          _callNumber();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _callNumber() async {
    const number = '1990';
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}
