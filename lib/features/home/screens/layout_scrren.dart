import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:point_ease/core/themes/app_colors.dart';
import 'package:point_ease/core/themes/styles.dart';
import 'package:point_ease/features/home/screens/home_scrren.dart';
import 'package:point_ease/features/home/screens/profile_scrren.dart';
import 'package:point_ease/features/home/widget/CustomTextFild.dart';
import 'package:point_ease/features/home/widget/Custombutton.dart';

class MainLayout extends StatefulWidget {
  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [HomeScrren(), ProfileScrren()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void showBtmSheet(BuildContext context) {
    var Size = MediaQuery.sizeOf(context);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.backgroundWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            height: Size.height / 2,
            width: double.infinity,
          
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
               child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Add Task",
                   style: TextStyles.font25blak,
                  ),
                  SizedBox(height: 20),
                  Customtextfield(
                    heights: 60,
                    widths: double.infinity,
                    hintText: "Git ice",
                     keyboardType:  TextInputType.text,
                      cursorWidth1: 2.0,
                    
                       ),
                 SizedBox(height: 20.h,),
                     Customtextfield(
                      
                    heights: 120,
                    widths: double.infinity,
                    hintText: "Get ice at store",
                     keyboardType:  TextInputType.text,
                      cursorWidth1: 2.0,
                     
                       ),
                       SizedBox(height: 20.h,),
                       Custombutton(
                        text: "+ Add Task",
                         width: 200,
                          height: 60,
                           color: AppColors.buttonPrimary,
                            onPressed: (){},
                            ),
                ],
               ),
             ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: FloatingActionButton(
          onPressed: () {
            // Add action for floating button
            showBtmSheet(context);
          },
          child: Icon(Icons.add, size: 32, color: Colors.white),
          backgroundColor: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home,
                  size: 30,
                  color:
                      _selectedIndex == 0 ? Colors.purpleAccent : Colors.grey,
                ),
                onPressed: () => _onItemTapped(0),
              ),
              SizedBox(width: 40), // Space for the FAB
              IconButton(
                icon: Icon(
                  Icons.person,
                  size: 30,
                  color:
                      _selectedIndex == 1 ? Colors.purpleAccent : Colors.grey,
                ),
                onPressed: () => _onItemTapped(1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
