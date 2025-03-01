import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:instant_project/features/profile/data/model/user_model.dart';
import 'package:instant_project/features/profile/presentation/views/customTextField.dart';

import '../../../../core/helper/validators.dart';
import '../../../../core/utils/app_colors.dart';
import '../viewModel/authenticationCubit/authentication_cubit.dart';
import 'editProfileBG.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController specialistController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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

  void clearTextFields() {
    firstNameController.clear();
    lastNameController.clear();
    genderController.clear();
    dateController.clear();
    specialistController.clear();
    statusController.clear();
    phoneController.clear();
    emailController.clear();
    addressController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    double appBarHeight = MediaQuery.of(context).size.height * 0.09;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Stack(
          children: [
            const EditProfileBG(),
            BlocConsumer<AuthenticationCubit, AuthenticationState>(
              listener: (context, state) {
                if (state is RegisterSuccess) {
                  Fluttertoast.showToast(
                    msg: 'User registered successfully!',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  clearTextFields();
                  Navigator.pop(context);
                } else if (state is RegisterFailure) {
                  Fluttertoast.showToast(
                    msg: state.error,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.redAccent,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
              },
              builder: (context, state) {
                return CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(child: SizedBox(height: 20)),
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
                        "New User",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: AppColors.textDarkGrayColor,
                          fontWeight: FontWeight.w400,
                        ),
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
                      padding: const EdgeInsets.only(top: 10, bottom: 40),
                      sliver: Form(
                        key: _formKey,
                        child: SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              CustomTextFormField(
                                label: "First Name",
                                prefixIcon: AppAssets.personIconShape,
                                controller: firstNameController,
                                validator: (value) => Validators.requiredField(value, "First Name"),
                              ),
                              CustomTextFormField(
                                label: "Last Name",
                                prefixIcon: AppAssets.personIconShape,
                                controller: lastNameController,
                                validator: (value) => Validators.requiredField(value, "Last Name"),
                              ),
                              CustomTextFormField(
                                label: "Gender",
                                prefixIcon: AppAssets.genderIconShape,
                                controller: genderController,
                                dropdownItems: const ["Male", "Female", "Other"],
                                validator: (value) => Validators.requiredField(value, "Gender"),
                              ),
                              CustomTextFormField(
                                label: "Specialist",
                                prefixIcon: AppAssets.specialistIconShape,
                                controller: specialistController,
                                dropdownItems: const ["Doctor", "HR", "Nurse", "Manager", "Receptionist", "Analysis"],
                                validator: (value) => Validators.requiredField(value, "Specialist"),
                              ),
                              CustomTextFormField(
                                label: "Date of Birth",
                                prefixIcon: AppAssets.dateIcon,
                                controller: dateController,
                                isDate: true,
                                validator: (value) => Validators.requiredField(value, "Date of Birth"),
                              ),
                              CustomTextFormField(
                                label: "Status",
                                prefixIcon: AppAssets.statuesIconShape,
                                controller: statusController,
                                dropdownItems: const ["Single", "Married", "Divorced"],
                                validator: (value) => Validators.requiredField(value, "Status"),
                              ),
                              CustomTextFormField(
                                label: "Phone number",
                                prefixIcon: AppAssets.phoneIconShape,
                                controller: phoneController,
                                validator: (value) => Validators.phoneValidator(value),
                              ),
                              CustomTextFormField(
                                label: "E-mail",
                                prefixIcon: AppAssets.emailIconShape,
                                controller: emailController,
                                validator: (value) => Validators.emailValidator(value),
                              ),
                              CustomTextFormField(
                                label: "Address",
                                prefixIcon: AppAssets.locationIconShape,
                                controller: addressController,
                                validator: (value) => Validators.requiredField(value, "Address"),
                              ),
                              CustomTextFormField(
                                label: "Password",
                                prefixIcon: AppAssets.passwordIconShape,
                                obscureText: true,
                                controller: passwordController,
                                validator: (value) => Validators.passwordValidator(value),
                              ),
                              const SizedBox(height: 5),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  minimumSize: const Size(double.infinity, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: state is RegisterLoading
                                    ? null
                                    : () {
                                  if (_formKey.currentState!.validate()) {
                                    final cubit = context.read<AuthenticationCubit>();
                                    cubit.register(
                                      firstName: firstNameController.text,
                                      lastName: lastNameController.text,
                                      gender: genderController.text,
                                      specialist: specialistController.text,
                                      birthday: dateController.text,
                                      status: statusController.text,
                                      mobile: phoneController.text,
                                      email: emailController.text,
                                      address: addressController.text,
                                      password: passwordController.text,
                                      type: UserType.values.firstWhere(
                                            (e) => e.name.toLowerCase() == specialistController.text.toLowerCase(),
                                        orElse: () => UserType.receptionist,
                                      ),
                                    );
                                  }
                                },
                                child: Center(
                                  child: state is RegisterLoading
                                      ? const CircularProgressIndicator(color: Colors.white)
                                      : Text(
                                    "Create User",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}