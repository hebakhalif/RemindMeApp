import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskTabs extends StatefulWidget {
  final Function(int) onTabSelected; // دالة لاستقبال التغيير عند الضغط

  const TaskTabs({Key? key, required this.onTabSelected}) : super(key: key);

  @override
  _TaskTabsState createState() => _TaskTabsState();
}

class _TaskTabsState extends State<TaskTabs> {
  int _selectedIndex = 0; // المؤشر لتحديد التبويب النشط

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTab("completedbotton".tr(), 0),
        SizedBox(width: 40.w),
        _buildTab("deleted".tr(), 1),
      ],
    );
  }

  Widget _buildTab(String title, int index) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        widget.onTabSelected(index);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300), // مسئوله تحدد مده الانيميشن الي بيتغير  تدرج ناعم عند التغيير
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: isSelected // هل التبويب الحالي محدد ام لا؟
              ? LinearGradient(colors: [const Color.fromARGB(255, 59, 174, 53), const Color.fromARGB(255, 193, 213, 223)]) // لو محددبيطبق الالوان دي
              : LinearGradient(colors: [Colors.grey[300]!, Colors.grey[400]!]), // لو مش محدد بيطبق الالوان دي
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,    // هنا ستايل التيكست لو محدد ابيض لو مش محدد اسود
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}