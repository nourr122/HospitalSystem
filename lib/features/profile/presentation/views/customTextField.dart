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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: DropdownButtonHideUnderline(
        child: TextFormField(
          controller: widget.controller,
          showCursor: false,
          obscureText: widget.obscureText ? _isObscured : false,
          keyboardType: widget.keyboardType,
          readOnly: widget.dropdownItems != null,
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
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.dropdownItems != null)
                  PopupMenuButton<String>(
                    color: AppColors.white,
                    icon: SvgPicture.asset(AppAssets.dropList),
                    onSelected: (value) {
                      widget.controller?.text = value;
                    },
                    itemBuilder: (context) => widget.dropdownItems!
                        .map((item) => PopupMenuItem(value: item, child: Text(item)))
                        .toList(),
                  ),
                if (widget.obscureText)
                  IconButton(
                    icon: SvgPicture.asset(AppAssets.eyeIconShape),
                    onPressed: _togglePassword,
                  ),
                const SizedBox(width: 5,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
