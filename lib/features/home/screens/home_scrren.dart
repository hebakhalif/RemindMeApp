import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:point_ease/core/themes/styles.dart';
import 'package:point_ease/features/home/screens/tasks.dart';

class HomeScrren extends StatelessWidget {
  const HomeScrren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Tasks",
              style: TextStyles.font26bold,
              ),
              SizedBox(height: 30.h,),
              Row(
                children: [
                  Tasks(colors: const Color.fromARGB(230, 233, 195, 251),
                   title: "personal",
                   icons: Icons.person_rounded,
                   ),

                    SizedBox(width: 10,),
                    Tasks(colors: const Color.fromARGB(212, 241, 204, 144),
                   title: "Work",
                   icons:Icons.work,
                   ),
                ],
              )  
            ],
           ),
         ),
    );
  }
}



