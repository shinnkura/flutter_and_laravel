// import 'package:doctor_appointment_app/models/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_and_laravel/components/appointment_card.dart';
import 'package:flutter_and_laravel/components/teacher_card.dart';
import 'package:flutter_and_laravel/utils/config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> user = {};
  Map<String, dynamic> doctor = {};
  List<dynamic> favList = [];
  List<Map<String, dynamic>> medCat = [
    {
      "icon": FontAwesomeIcons.comments, // 相談を表すアイコン
      "category": "相談",
    },
    {
      "icon": FontAwesomeIcons.mobileAlt, // Flutterを表すアイコン
      "category": "Flutter",
    },
    {
      "icon": FontAwesomeIcons.code, // フロントを表すアイコン
      "category": "javaScript",
    },
    {
      "icon": FontAwesomeIcons.code, // PHPを表すアイコン
      "category": "PHP",
    },
    {
      "icon": FontAwesomeIcons.code, // Pythonを表すアイコン
      "category": "Python",
    },
    {
      "icon": FontAwesomeIcons.code, // Javaを表すアイコン
      "category": "Java",
    }
  ];

  @override
  Widget build(BuildContext context) {
    // Config().init(context);
    // user = Provider.of<AuthModel>(context, listen: false).getUser;
    // doctor = Provider.of<AuthModel>(context, listen: false).getAppointment;
    // favList = Provider.of<AuthModel>(context, listen: false).getFav;

    return Scaffold(
      //if user is empty, then return progress indicator
      // body: user.isEmpty
      //     ? const Center(
      //         child: CircularProgressIndicator(),
      //       )
      //     : Padding(
      //         padding: const EdgeInsets.symmetric(
      //           horizontal: 15,
      //           vertical: 15,
      //         ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      // user['name'],
                      'みさき',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/profile1.jpg'),
                      ),
                    )
                  ],
                ),
                Config.spaceMedium,
                const Text(
                  'カテゴリー',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                SizedBox(
                  height: Config.heightSize * 0.05,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List<Widget>.generate(medCat.length, (index) {
                      return Card(
                        margin: const EdgeInsets.only(right: 20),
                        color: Config.primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              FaIcon(
                                medCat[index]['icon'],
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                medCat[index]['category'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Config.spaceSmall,
                const Text(
                  '本日の予約',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                AppointmentCard(
                  color: Config.primaryColor,
                  doctor: {},
                ),
                Config.spaceSmall,
                const Text(
                  'おすすめの先生',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                Column(
                  children: List.generate(10, (index) => TeacherCard()),
                ),
                // doctor.isNotEmpty
                //     ? AppointmentCard(
                //         doctor: doctor,
                //         color: Config.primaryColor,
                //       )
                //     : Container(
                //         width: double.infinity,
                //         decoration: BoxDecoration(
                //           color: Colors.grey.shade300,
                //           borderRadius: BorderRadius.circular(10),
                //         ),
                //         child: const Center(
                //           child: Padding(
                //             padding: EdgeInsets.all(20),
                //             child: Text(
                //               'No Appointment Today',
                //               style: TextStyle(
                //                 fontSize: 16,
                //                 fontWeight: FontWeight.w600,
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                // Config.spaceSmall,
                // const Text(
                //   'Top Doctors',
                //   style: TextStyle(
                //     fontSize: 16,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // Config.spaceSmall,
                // Column(
                //   children: List.generate(user['doctor'].length, (index) {
                //     return DoctorCard(
                //       doctor: user['doctor'][index],
                //       //if lates fav list contains particular doctor id, then show fav icon
                //       isFav: favList
                //               .contains(user['doctor'][index]['doc_id'])
                //           ? true
                //           : false,
                //     );
                // }),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
