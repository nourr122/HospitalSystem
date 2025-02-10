import 'package:flutter/material.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:instant_project/core/utils/text_styles.dart';
import 'package:instant_project/features/calls/specialist%20calls/presentation/views/widgets/create_call.dart';
import 'package:instant_project/features/calls/specialist%20calls/presentation/views/widgets/show_calender.dart';
import 'package:intl/intl.dart';

class DatePickerField extends StatefulWidget {
  const DatePickerField({super.key});

   @override
  _DatePickerFieldState createState() => _DatePickerFieldState();
}
 
class _DatePickerFieldState extends State<DatePickerField> {
  DateTime? _selectedDate;
  final TextEditingController _dateController = TextEditingController();

  Future<void> _pickDate(BuildContext context) async {
    DateTime? pickedDate = await showModalBottomSheet<DateTime>(
      context: context,
      isScrollControlled: true,
    
      builder: (context) {
        return ShowCalender(
          initialDate: _selectedDate ?? DateTime.now(),
        );
      },
    );
    
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = DateFormat('dd.MM.yyyy').format(pickedDate);
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    print(height);
    print(width);
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: width/26, vertical: height/32),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: height/16,
              child: TextField(
                
                controller: _dateController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "Select Date",
                  hintStyle: TextStyles.stylePoppinsRegular14Hint,
                  border:  OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(height/201)),
                    borderSide: const BorderSide(color: Colors.grey)
                    
                  ),
                  
                    focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(height/201)),
                    borderSide: const BorderSide(color: Colors.grey),),
                  suffixIcon: Container(
                    width: width/8,
                    height: height/16,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(height/201),
                        bottomRight: Radius.circular(height/201),
                      ),
                    ),
                    child: Image.asset(
                      AppAssets.calender,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                onTap: () => _pickDate(context),
              ),
            ),
          ),
          SizedBox(width: width/50),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const CreateCall()));
            },
            child: SizedBox(
              height: height/16,
              width: width/8,
              child: Image.asset(
                AppAssets.add,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
