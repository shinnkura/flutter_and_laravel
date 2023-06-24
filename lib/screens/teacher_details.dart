import 'package:flutter/material.dart';
import 'package:flutter_and_laravel/components/custom_appbar.dart';
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
    );
  }
}
