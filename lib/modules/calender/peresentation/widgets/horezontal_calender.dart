import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import 'package:smart_operation/utils/theme/appColors.dart';


class HorizontalCalendar extends StatefulWidget {
  const HorizontalCalendar({Key? key}) : super(key: key);

  @override
  State<HorizontalCalendar> createState() => _HorizontalCalendarState();
}

class _HorizontalCalendarState extends State<HorizontalCalendar> {
  late DateTime startDate;
  late DateTime endDate;
  DateTime? selectedDate;
  DateTime currentMonth = DateTime.now();

  @override
  void initState() {
    super.initState();
    _setMonthRange(currentMonth);
    selectedDate = DateTime.now();
  }

  void _setMonthRange(DateTime date) {
    startDate = DateTime(date.year, date.month, 1);
    endDate = DateTime(date.year, date.month + 1, 0);
  }

  void _changeMonth(int offset) {
    setState(() {
      currentMonth = DateTime(currentMonth.year, currentMonth.month + offset);
      _setMonthRange(currentMonth);
      selectedDate = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final days = List.generate(
      endDate.difference(startDate).inDays + 1,
          (index) => startDate.add(Duration(days: index)),
    );

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: 180.h,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffEEEEF0),
            width: 1.w),
            borderRadius: BorderRadius.circular(16.r)
          ),
        ).paddingSymmetric(horizontal: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// ===== Header (Month + Year + Arrows) =====
            SizedBox(
              width: MediaQuery.of(context).size.width,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppCustomColors.colorGrey5,
                        borderRadius: BorderRadius.circular(12.r)
                      ),
                      child: IconButton(
                        onPressed: () => _changeMonth(-1),
                        icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                      ),
                    ),

                    Text(
                      DateFormat('MMMM yyyy').format(currentMonth),
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppCustomColors.colorGrey5,
                          borderRadius: BorderRadius.circular(12.r)
                      ),
                      child: IconButton(
                        onPressed: () => _changeMonth(1),
                        icon: const Icon(Icons.arrow_forward_ios, size: 18),
                      ),
                    ),
                  ],
                ).paddingSymmetric(horizontal: 24),
            ),

            /// ===== Horizontal Calendar =====
            SizedBox(
              height: 120.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                itemBuilder: (context, index) {
                  final day = days[index];
                  final isSelected = selectedDate?.day == day.day &&
                      selectedDate?.month == day.month &&
                      selectedDate?.year == day.year;

                  return GestureDetector(
                    onTap: () => setState(() => selectedDate = day),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                      padding:
                      const EdgeInsets.symmetric(horizontal: 8.5, vertical: 8),
                      width: 60,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppCustomColors.appPrimaryColor
                            : const Color(0xffF7F9FB),
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: isSelected
                              ? AppCustomColors.appPrimaryColor
                              : const Color(0xffE0E0E0),
                          width: 1.2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat('E').format(day).toUpperCase().substring(0, 2),
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: isSelected ? Colors.white : Colors.black87,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '${day.day}',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                          const Spacer(),
                          if (isSelected)
                            Container(
                              width: 8.w,
                              height: 8.h,
                              margin: const EdgeInsets.only(top: 4),
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    ).paddingSymmetric(vertical: 8);
  }
}

