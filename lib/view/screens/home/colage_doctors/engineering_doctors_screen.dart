import 'package:anu_app/data/model/college_of_engineering.dart';
import 'package:anu_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../details/doctor_details_screen.dart';

class EngineeringDoctorsScreen extends StatelessWidget {
  const EngineeringDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<CollegeOfEngineering> softDoc = softDocs;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: const Text(
          'كلية الهندسة',
          style: TextStyle(fontFamily: 'DGEnab', color: wColor, fontSize: 18),
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final softDoc = softDocs[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 5,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: primaryColor,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 5),
                    color: Theme.of(context).primaryColor.withOpacity(.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.to(() => DoctorDetailsScreen(
                            softwareDocsModel: softDoc), transition: Transition.fade, duration: Duration(milliseconds: 400,),);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      )),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        softDoc.title,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          fontFamily: 'DGNemr',
                          color: wColor,
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        softDoc.education,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          fontFamily: 'DGNemr',
                          color: wColor,
                          fontSize: 13.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(softDoc.image),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: softDoc.length,
      ),

    );
  }
}
