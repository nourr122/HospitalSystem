import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instant_project/core/utils/app_assets.dart';

import '../../../../core/utils/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final String prefixIcon;
  final TextEditingController? controller;
  final bool obscureText;
  final bool isDate;
  final TextInputType keyboardType;
  final List<String>? dropdownItems;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.prefixIcon,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.dropdownItems,
    this.validator,
    this.isDate = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isObscured = true;

  void _togglePassword() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }
  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.primaryColor,
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        widget.controller?.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 15),
      child: DropdownButtonHideUnderline(
        child: TextFormField(
          controller: widget.controller,
          showCursor: false,
          obscureText: widget.obscureText ? _isObscured : false,
          keyboardType: widget.keyboardType,
          readOnly: widget.dropdownItems != null || widget.isDate,
          validator: widget.validator,
          decoration: InputDecoration(
            hintText: widget.label,hintStyle: GoogleFonts.poppins(color: AppColors.lightGray,fontWeight: FontWeight.w400,fontSize: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.0),
              borderSide: const BorderSide(
                color: Color(0x1F000000),
                width: 1.4,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.0),
              borderSide: const BorderSide(
                color: Color(0x1F000000),
                width: 1.4,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.0),
              borderSide: const BorderSide(color: AppColors.primaryColor, width: 2.0),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  widget.isDate ? const Icon(Icons.calendar_today_outlined,color: AppColors.primaryColor,) :
                    SvgPicture.asset(widget.prefixIcon, width: 24, height: 24),
                  const SizedBox(width: 10),
                  Container(
                    width: 1,
                    height: 30,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            suffixIcon: widget.isDate
                ? IconButton(
                onPressed: () => _selectDate(context),
                icon: SvgPicture.asset(AppAssets.dropList))
                : (widget.dropdownItems != null
                ? PopupMenuButton<String>(
              color: AppColors.white,
              icon: SvgPicture.asset(AppAssets.dropList),
              onSelected: (value) {
                widget.controller?.text = value;
              },
              itemBuilder: (context) => widget.dropdownItems!
                  .map((item) =>
                  PopupMenuItem(value: item, child: Text(item)))
                  .toList(),
            )
                : (widget.obscureText
                ? IconButton(
              icon: SvgPicture.asset(AppAssets.eyeIconShape),
              onPressed: _togglePassword,
            )
                : null)),
          ),
        ),
      ),
    );
  }
}
