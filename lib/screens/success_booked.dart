import 'package:flutter/material.dart';
import 'package:flutter_and_laravel/components/button.dart';
import 'package:lottie/lottie.dart';

class AppointmentBooked extends StatelessWidget {
  const AppointmentBooked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              // child: Lottie.asset('assets/lottie/success.json'),
              child: Lottie.asset('assets/success.json'),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                '予約が完了しました',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Button(
                width: double.infinity,
                title: 'ホームに戻る',
                onPressed: () {
                  Navigator.of(context).pushNamed('main');
                },
                disable: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
