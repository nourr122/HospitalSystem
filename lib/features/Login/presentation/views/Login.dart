import 'package:flutter/material.dart';
import 'package:instant_project/features/home/presentation/views/homeDynamicScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/gradient_container.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
  final String specialist;

  const LoginPage({super.key, required this.specialist});
}

var size, height, width;

class _LoginScreenState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthRepository _authRepository = AuthRepository();

  
  void _validateAndLogin() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeDynamicScreen(
            id: 88,

  bool isLoading = false;
  UserModel? user;
  String? errorMessage;

  bool isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

  Future<void> login() async {
    setState(() => isLoading = true);

    try {
      if (!_formKey.currentState!.validate()) {
        setState(() => isLoading = false);
        return;
      }

      UserModel? user = await _authRepository.login(
        emailController.text,
        passwordController.text,
      );

      if (user != null && user.status != 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeDynamicScreen(
              userRole: widget.specialist,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed. Please try again.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }

    setState(() => isLoading = false);
  }


  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: GradientContainer(
                height: 280,
                width: 300,
                borderRadius: BorderRadius.only(topRight: Radius.circular(100)),
                colors: [AppColors.gradientColor1, AppColors.gradientColor2],
              ),
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: GradientContainer(
                height: 250,
                width: 280,
                borderRadius:
                BorderRadius.only(bottomLeft: Radius.circular(100)),
                colors: [AppColors.gradientColor1, AppColors.gradientColor2],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.8, // Adjust dynamically
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppAssets.logo2,
                              height: 180,
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Welcome back !',
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'To Continue, Login Now',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xfff828282),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Flexible(
                              child:
                              TextFormField(
                                controller: emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter an email';
                                  } else if (!isValidEmail(value)) {
                                    return 'Invalid email format';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.mail_outline, color: AppColors.primaryColor,),
                                  hintText: '  Email',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            const SizedBox(height: 30),
                            Flexible(
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon:
                                  Image.asset(AppAssets.lock, height: 50),
                                  suffixIcon:
                                  Image.asset(AppAssets.eye, height: 50),
                                  hintText: '  Password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                keyboardType: TextInputType.visiblePassword,
                                validator: (value) =>
                                value!.isEmpty ? 'Enter password' : null,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Forget Password?',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xfff000000),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        width: 380,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed:  isLoading ? null : login,
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 20),
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
      ),
    );
  }
}
