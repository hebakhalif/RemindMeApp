import 'package:flutter/material.dart';
import 'package:point_ease/core/themes/styles.dart';

class Tasks extends StatelessWidget {
  
final Color colors;
final String? title;
final IconData icons;

 Tasks({required this.colors, required this.title, required this.icons});

  @override
  Widget build(BuildContext context ) {
    return Column(
      children: [
        Row(
          children: [
            Stack(
              children: [
                GestureDetector(
                  
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: colors,
                    ),
                    width: 170,
                    height: 180,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                         icons,
                            size: 35,
                            color: const Color.fromARGB(230, 238, 252, 249),
                          ),
                          SizedBox(height: 20),
                          Text(title!, style: TextStyles.font21blac87bold),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color.fromARGB(234, 248, 250, 250),
                                ),
                                height: 40,
                                width: 75,
                                child: Text(
                                  '   3 lift',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: const Color.fromARGB(124, 18, 18, 18),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                height: 40,
                                width: 75,
                                child: Text(
                                  '   Done',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: const Color.fromARGB(124, 18, 18, 18),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
           
          /*  Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(212, 241, 204, 144),
              ),
              width: 190,
              height: 200,
            ),*/
          ],
        ),
      ],
    );
  }
}
