import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zbooma_to_do_app/core/theme/colors.dart';

class ExperienceDropDownList extends StatefulWidget {
  final Function(String) onSelected;

  const ExperienceDropDownList({super.key, required this.onSelected});

  @override
  _ExperienceDropDownListState createState() => _ExperienceDropDownListState();
}

class _ExperienceDropDownListState extends State<ExperienceDropDownList> {
  String? selectedValue;
  final List<String> items = ['fresh', 'junior', 'intermediate', 'senior'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: ColorsManager.appBoardersColor),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 7.5.h),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),
          value: selectedValue,
          hint: Text(
            'Choose experience level',
            style: TextStyle(color: Colors.black),
          ),
          items:
              items
                  .map(
                    (String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item.toLowerCase()),
                    ),
                  )
                  .toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue;
            });
            widget.onSelected(newValue!);
          },
        ),
      ),
    );
  }
}
