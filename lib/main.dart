// ignore_for_file: prefer_const_constructors, use_super_parameters, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: TimeDown(),
    );
  }
}

class TimeDown extends StatefulWidget {
  const TimeDown({super.key});

  @override
  State<TimeDown> createState() => _TimeDownState();
}

class _TimeDownState extends State<TimeDown> {
  int numberSeconds = 7;
  Timer? repeatedTimer;
  startTimer() {
    repeatedTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (numberSeconds > 0) {
          numberSeconds--;
        } else {
          numberSeconds = 0;
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 23, 13, 32),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              numberSeconds == 0
                  ? "done"
                  : numberSeconds.toString().padLeft(2, "0"),
              style: numberSeconds == 0
                  ? TextStyle(
                      color: const Color.fromARGB(255, 87, 0, 0), fontSize: 55)
                  : TextStyle(color: Colors.white, fontSize: 80),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Seconds",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      startTimer();
                      if (numberSeconds == 0) {
                        setState(() {
                          numberSeconds = 7;
                        });
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            const Color.fromARGB(255, 12, 2, 107)),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11))),
                        padding: WidgetStatePropertyAll(
                            EdgeInsets.fromLTRB(30, 8, 30, 8))),
                    child: Text(
                      "Start Timer",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )),
                SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                    onPressed: () {
                      repeatedTimer!.cancel();
                    },
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            const Color.fromARGB(255, 107, 14, 2)),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11))),
                        padding: WidgetStatePropertyAll(
                            EdgeInsets.fromLTRB(30, 8, 30, 8))),
                    child: Text(
                      "Stop Timer",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
