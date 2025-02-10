import 'package:flutter/material.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

String formateDate(DateTime date, {String format = 'dd . MM . yyyy'}) {
  return DateFormat(format).format(date);
}

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({
    super.key,
    this.selectedDate,
    required this.onDateChanged,
  });

  final DateTime? selectedDate;
  final ValueChanged<DateTime> onDateChanged;

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();

    _selectedDate = widget.selectedDate ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerEnd,
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsetsDirectional.only(start: 18),
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.gray,
              width: 0.3,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            formateDate(_selectedDate),
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        IconButton(
          padding: const EdgeInsets.all(0),
          icon: Image.asset(AppAssets.calender),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              clipBehavior: Clip.antiAlias,
              builder: (context) {
                return SizedBox(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(13),
                        color: AppColors.gray.withAlpha(50),
                        height: 3,
                        width: 80,
                      ),
                      SizedBox(
                        height: 400,
                        child: SfDateRangePicker(
                          selectionColor: AppColors.blue.withAlpha(50),
                          selectionTextStyle: const TextStyle(
                            color: AppColors.blue,
                            fontSize: 16,
                          ),
                          backgroundColor: AppColors.white,
                          headerHeight: 50,
                          headerStyle: const DateRangePickerHeaderStyle(
                            textAlign: TextAlign.center,
                            backgroundColor: AppColors.white,
                            textStyle: TextStyle(
                              color: AppColors.black,
                              fontSize: 16,
                            ),
                          ),
                          monthViewSettings:
                              const DateRangePickerMonthViewSettings(
                            viewHeaderStyle: DateRangePickerViewHeaderStyle(
                              textStyle: TextStyle(
                                color: AppColors.gray,
                                fontSize: 16,
                              ),
                            ),
                            dayFormat: 'EEE',
                          ),
                          monthCellStyle: const DateRangePickerMonthCellStyle(
                            todayTextStyle: TextStyle(
                              color: AppColors.blue,
                              fontSize: 16,
                            ),
                            todayCellDecoration: BoxDecoration(),
                          ),
                          initialDisplayDate:
                              widget.selectedDate ?? DateTime.now(),
                          showNavigationArrow: true,
                          onSelectionChanged: (selectedDate) {
                            setState(() {
                              _selectedDate = selectedDate.value;
                            });
                            widget.onDateChanged(selectedDate.value);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
