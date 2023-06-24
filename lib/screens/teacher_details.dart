import 'package:flutter/material.dart';
import 'package:flutter_and_laravel/components/button.dart';
import 'package:flutter_and_laravel/components/custom_appbar.dart';
import 'package:flutter_and_laravel/utils/config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TeacherDetails extends StatefulWidget {
  const TeacherDetails({super.key});

  @override
  State<TeacherDetails> createState() => _TeacherDetailsState();
}

class _TeacherDetailsState extends State<TeacherDetails> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        appTitle: '先生の詳細',
        icon: const FaIcon(
          FontAwesomeIcons.arrowLeft,
          size: 16,
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFav = !isFav;
              });
            },
            icon: FaIcon(
              isFav ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
              size: 16,
              color: isFav ? Colors.red : Colors.red.withOpacity(0.5),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            AboutDoctor(),
            DetailBody(),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Button(
                width: double.infinity,
                title: 'レッスンを予約する',
                onPressed: () {
                  Navigator.of(context).pushNamed('booking_page');
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

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          CircleAvatar(
            radius: 65.0,
            backgroundImage: AssetImage('assets/teacher.png'),
            backgroundColor: Colors.white,
          ),
          Config.spaceMedium,
          Text(
            'みさき先生',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: Text(
              'みさき先生は、Javascriptの経験が豊富です。みさき先生は、Javascriptの経験が豊富です。みさき先生は、Javascriptの経験が豊富です。',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: Text(
              'みさき教室',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Config.spaceSmall,
          TeacherInfo(),
          Config.spaceMedium,
          Text(
            '先生について',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Config.spaceSmall,
          Text(
            'みさき先生は、Javascriptの経験が豊富です。みさき先生は、Javascriptの経験が豊富です。みさき先生は、Javascriptの経験が豊富です。',
            style: TextStyle(
              height: 1.5,
              fontWeight: FontWeight.w400,
            ),
            softWrap: true,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class TeacherInfo extends StatelessWidget {
  const TeacherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        infoCard(
          label: '年齢',
          value: '25歳',
        ),
        SizedBox(
          width: 15,
        ),
        infoCard(
          label: '性別',
          value: '女性',
        ),
        SizedBox(
          width: 15,
        ),
        infoCard(
          label: '経験年数',
          value: '3年',
        ),
      ],
    );
  }
}

class infoCard extends StatelessWidget {
  const infoCard({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Config.primaryColor,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        child: Column(
          children: <Widget>[
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
