import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/core/utils/form_validation.dart';
import 'package:instant_project/core/utils/text_styles.dart';
import 'package:instant_project/core/components/custom_button.dart';
import 'package:instant_project/features/calls/specialist%20calls/Services/post_create_call_service.dart';
import 'package:instant_project/features/calls/specialist%20calls/presentation/views/widgets/custom_text_form_field.dart';
import 'package:instant_project/features/calls/specialist%20calls/presentation/views/widgets/select_doctor.dart';
import 'package:instant_project/features/calls/specialist%20calls/presentation/views/widgets/success.dart';

 class CreateCall extends StatefulWidget {
  const CreateCall({super.key});

  @override
  State<CreateCall> createState() => _CreateCallState();
}
class _CreateCallState extends State<CreateCall> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? selectedDoctorName;
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Create Call',
          style:
              TextStyles.stylePoppinsRegular16PageTitle.copyWith(fontSize: 22.sp),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Padding(
            padding: EdgeInsets.all(height / 101),
            child: Column(
              children: [
                CustomTextFormField(
                  hintText: 'Patient Name',
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    return FormValidation.emptyValueValidation(value);
                  },
                  hintStyle: TextStyles.stylePoppinsRegular14Hint,
                  controller: nameController,
                ),
                SizedBox(height: height / 67),
                CustomTextFormField(
                  hintText: 'Age',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    return FormValidation.emptyValueValidation(value);
                  },
                  hintStyle: TextStyles.stylePoppinsRegular14Hint,
                  controller: ageController,
                ),
                SizedBox(height: height / 67),
                CustomTextFormField(
                  hintText: 'Phone Number',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    return FormValidation.phoneNumberValidation(value);
                  },
                  hintStyle: TextStyles.stylePoppinsRegular14Hint,
                  controller: phoneController,
                ),
                SizedBox(height: height / 67),
                CustomTextFormField(
                  hintText: 'Select Doctor',
                  controller: TextEditingController(text: selectedDoctorName),
                  keyboardType: TextInputType.none,
                  readOnly: true,
                  widget: Icon(Icons.arrow_right, size: 45.sp),
                  validator: (value) {
                    return FormValidation.emptyValueValidation(value);
                  },
                  onTap: () async {
                    final selectedDoctor = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SelectDoctor(),
                      ),
                    );
                    if (selectedDoctor != null) {
                      setState(() {
                        selectedDoctorName = selectedDoctor;
                      });
                    }
                  },
                  hintStyle: TextStyles.stylePoppinsRegular14Hint,
                ),
                SizedBox(height: height / 67),
                CustomTextFormField(
                  hintText: 'Case Description',
                  keyboardType: TextInputType.text,
                  maxLines: 8,
                  validator: (value) {
                    return FormValidation.emptyValueValidation(value);
                  },
                  hintStyle: TextStyles.stylePoppinsRegular14Hint,
                  controller: descController,
                ),
                
                Padding(
                  padding: EdgeInsets.only(
                      left: width / 49,
                      bottom: height / 101,
                      right: width / 49,
                      top: height / 5),
                  child: CustomButton(
                    buttonBody: Text(
                      'Send Call',
                      style: TextStyles.stylePoppinsRegular14Hint
                          .copyWith(color: Colors.white, fontSize: 16.sp),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        PostCreateCallService().addCall(
                          patientName: nameController.text, 
                          doctorId: '2', 
                          description: descController.text, 
                          phone: phoneController.text, 
                          age: ageController.text, 
                          context: context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Success(),
                          ),
                        );
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                    width: double.infinity,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
