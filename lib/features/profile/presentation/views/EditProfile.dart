import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:instant_project/features/profile/data/model/user_model.dart';
import 'package:instant_project/features/profile/presentation/views/customTextField.dart';

import '../../../../core/utils/app_colors.dart';
import 'editProfileBG.dart';

class EditProfile extends StatefulWidget {
  final UserModel? user;
  const EditProfile({super.key, this.user});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController genderController;
  late TextEditingController dateController;
  late TextEditingController specialistController;
  late TextEditingController statusController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController addressController;
  final TextEditingController passwordController = TextEditingController();


  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController(text: widget.user?.firstName ?? "");
    lastNameController = TextEditingController(text: widget.user?.lastName ?? "");
    genderController = TextEditingController(text: widget.user?.gender ?? "");
    specialistController = TextEditingController(text: widget.user?.specialist ?? "");
    dateController = TextEditingController(text: widget.user?.dateOfBirth ?? "");
    statusController = TextEditingController(text: widget.user?.statues ?? "");
    phoneController = TextEditingController(text: widget.user?.phone ?? "");
    emailController = TextEditingController(text: widget.user?.email ?? "");
    addressController = TextEditingController(text: widget.user?.address ?? "");
  }
  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    genderController.dispose();
    dateController.dispose();
    specialistController.dispose();
    statusController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    passwordController.dispose();
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
        dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double appBarHeight = MediaQuery.of(context).size.height * 0.09;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Stack(
            children:[
              const EditProfileBG(),
              CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 20),
                  ),
                  SliverAppBar(
                    leading: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        size: 25,
                        color: AppColors.textDarkGrayColor,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    title: Text(
                      "New user",
                      style: GoogleFonts.poppins(fontSize: 20, color: AppColors.textDarkGrayColor, fontWeight: FontWeight.w400),
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    pinned: false,
                    expandedHeight: appBarHeight,
                    flexibleSpace: const FlexibleSpaceBar(
                      background: SizedBox(),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    sliver: Form(
                      key: _formKey,
                      child: SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            CustomTextFormField(label: "First Name", prefixIcon: AppAssets.personIconShape, controller: firstNameController),
                            const SizedBox(height: 15),
                            CustomTextFormField(label: "Last Name", prefixIcon: AppAssets.personIconShape, controller: lastNameController),
                            const SizedBox(height: 15),
                            CustomTextFormField(
                              label: "Gender",
                              prefixIcon: AppAssets.genderIconShape,
                              controller: genderController,
                              dropdownItems: const ["Male", "Female", "Other"],
                            ),
                            const SizedBox(height: 15),
                            CustomTextFormField(
                              label: "Specialist",
                              prefixIcon: AppAssets.specialistIconShape,
                              controller: specialistController,
                              dropdownItems: const ["Doctor", "HR", "Nurse", "Manger", "Receptionist", "Analysis Employee"],
                            ),
                            const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: DropdownButtonHideUnderline(
                              child: TextFormField(
                                controller: dateController,
                                readOnly: true,
                                showCursor: false,
                                decoration: InputDecoration(
                                  hintText: 'Date of birth',hintStyle: GoogleFonts.poppins(color: AppColors.lightGray,fontWeight: FontWeight.w400,fontSize: 14),
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
                                        const Icon(Icons.date_range_outlined,color: AppColors.primaryColor,size: 22),
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
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                    child: InkWell(
                                      onTap: () => _selectDate(context),
                                      child: SvgPicture.asset(AppAssets.dropList),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                            const SizedBox(height: 15),
                            CustomTextFormField(
                              label: "Status",
                              prefixIcon: AppAssets.statuesIconShape,
                              controller: statusController,
                              dropdownItems: const ["Single", "Married", "Divorced"],
                            ),
                            const SizedBox(height: 15),
                            CustomTextFormField(label: "Phone number", prefixIcon: AppAssets.phoneIconShape, controller: phoneController),
                            const SizedBox(height: 15),
                            CustomTextFormField(label: "E-mail", prefixIcon: AppAssets.emailIconShape, controller: emailController),
                            const SizedBox(height: 15),
                            CustomTextFormField(label: "Address", prefixIcon: AppAssets.locationIconShape, controller: addressController),
                            const SizedBox(height: 15),
                            CustomTextFormField(
                              label: "Password",
                              prefixIcon: AppAssets.passwordIconShape,
                              obscureText: true,
                              controller: passwordController,
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                minimumSize: const Size(double.infinity, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {},
                              child: Center(
                                child: Text(
                                  widget.user == null ? "Create User" : "Update User",
                                  style: GoogleFonts.poppins(fontWeight: FontWeight.w300, color: AppColors.white,fontSize: 13),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]
        ),
      ),
    );
  }
}
