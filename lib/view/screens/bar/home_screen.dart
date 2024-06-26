import 'package:anu_app/view/screens/details/library_screen.dart';
import 'package:anu_app/view/screens/home/e_learning_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants.dart';
import '../home/calculator_screen.dart';
import '../home/doctors_screen.dart';
import '../home/faq_screen.dart';
import '../home/gpa_screen.dart';
import '../home/record_screen.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri facebookPage = Uri.parse('https://web.facebook.com/Ajloun.un');

class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});

   @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  String getGreeting() {
    DateTime now = DateTime.now();
    int currentHour = now.hour;
    if (currentHour >= 0 && currentHour < 18) {
      return 'صباح الخير';
    } else {
      return 'مساء الخير';
    }
  }

  @override
  Widget build(BuildContext context) {
    String greeting = getGreeting();

    return Scaffold(
      backgroundColor: Get.isDarkMode ? bColor : wColor,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
              ),
            ),
            child:  Column(
              children: [
                const SizedBox(height: 75),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: const Text(
                    textAlign: TextAlign.right,
                    '!مرحبا بك',
                    style: TextStyle(
                        fontFamily: 'DGNemr',
                        color: Colors.white,
                        fontSize: 24,
                    ),
                  ),
                  subtitle: Text(
                    textAlign: TextAlign.right,
                    greeting,
                    style: const TextStyle(
                        fontFamily: 'DGNemr',
                        color: Colors.white54,
                        fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                  color: Get.isDarkMode ? bColor : wColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(200),
                  )),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  itemDashboard(
                    'التسجيل',
                    Image.asset(
                      'assets/images/record.jpeg',
                      height: 55,
                    ),
                    Colors.deepOrange,
                    () => Get.to(() => RecordScreen(), transition: Transition.fade, duration: Duration(milliseconds: 400,),),
                  ),
                  itemDashboard(
                    'الدكاترة',
                    Image.asset(
                      'assets/images/doctor.jpg',
                      height: 55,
                    ),
                    Colors.deepOrange,
                    () => Get.to(() => const DoctorsScreen(), transition: Transition.fade, duration: Duration(milliseconds: 400,),),
                  ),
                  itemDashboard(
                    'التعليم الالكتروني',
                    Image.asset(
                      'assets/images/elearn.png',
                      height: 55,
                    ),
                    Colors.deepOrange,
                    () => Get.to(() => ELearningScreen(), transition: Transition.fade, duration: Duration(milliseconds: 400,),),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => CalculatorScreen(), transition: Transition.fade, duration: Duration(milliseconds: 400,),);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 5),
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(.2),
                                spreadRadius: 2,
                                blurRadius: 5)
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/calculator.png',
                            height: 55,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text(
                            'الآلة الحاسبة',
                            style: TextStyle(
                              fontFamily: 'DGNemr',
                              color: Colors.black,
                              fontSize: 12.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  itemDashboard(
                    'حساب المعدل التراكمي',
                    Image.asset(
                      'assets/images/gpa.png',
                      height: 55,
                    ),
                    Colors.green,
                    () => Get.to(() => const GPACalculatorPage(), transition: Transition.fade, duration: Duration(milliseconds: 400,),),
                  ),
                  itemDashboard(
                    'الأسئلة الأكثر شيوعاً',
                    Image.asset(
                      'assets/images/faq.png',
                      height: 55,
                    ),
                    Colors.purple,
                    () => Get.to(() =>const FaqScreen(), transition: Transition.fade, duration: Duration(milliseconds: 400,),),
                  ),
                  itemDashboard(
                      'صفحة الجامعة',
                      Image.asset(
                        'assets/images/facebook.png',
                        height: 55,
                      ),
                      Colors.blue,
                      () => Get.to(launchUrl(facebookPage), transition: Transition.fade, duration: Duration(milliseconds: 400,),), ),
                  itemDashboard(
                      'المكتبة الإلكترونية',
                      Image.asset(
                        'assets/images/library.png',
                        height: 55,
                      ),
                      Colors.indigo,
                      () => Get.to(() =>  LibraryScreen(), transition: Transition.fade, duration: Duration(milliseconds: 400,),)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  itemDashboard(String title, Widget widget, Color background,
          Function() onPressed) =>
      InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 5),
                color: Theme.of(context).primaryColor.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget,
              const SizedBox(height: 8),
              Text(
                textAlign: TextAlign.center,
                title.toUpperCase(),
                style: const TextStyle(
                  fontFamily: 'DGNemr',
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      );
}
