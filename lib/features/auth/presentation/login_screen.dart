import 'package:flutter/material.dart';

import '../../../widgets/custom_btn.dart';
import '../../../widgets/custom_textform_widget.dart';
import '../../main_page.dart';
import '../helper/validator_helper.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool? rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 70.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildLoginTitle(),
                SizedBox(height: 20),
                _buildUsernameField(),
                SizedBox(height: 10),
                _buildPasswordField(),
                SizedBox(height: 10),
                _buildRememberMeRow(context),
                SizedBox(height: 15),
                _buildLoginButton(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.25),
                _buildSocialLoginOptions(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginTitle() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        "Log In",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      ),
    );
  }

  Widget _buildUsernameField() {
    return CustomTextFormField(
      hintText: "Username",
      keyboardType: TextInputType.name,
      icon: Icons.person_rounded,
      validator: (String? value) => validateName(value ?? ""),
      controller: usernameController,
    );
  }

  Widget _buildPasswordField() {
    return CustomTextFormField(
      hintText: "Password",
      keyboardType: TextInputType.name,
      icon: Icons.lock_rounded,
      validator: (String? value) => validatePassword(value ?? ""),
      obscureText: true,
      controller: passwordController,
      isPasswordField: true,
    );
  }

  Widget _buildRememberMeRow(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: rememberMe,
          onChanged: (value) {
            setState(() {
              rememberMe = value;
            });
          },
        ),
        SizedBox(width: 4),
        Text("Remember me"),
        Spacer(),
        Text(
          "Forgot Password",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return CustomBtn(name: "Log In", function: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
    });
  }

  Widget _buildSocialLoginOptions(BuildContext context) {
    return Column(
      children: [
        Text("Or Sign in with"),
        SizedBox(height: 8),
        _buildSocialMediaIcons(),
        SizedBox(height: 8),
        _buildSignUpPrompt(context),
      ],
    );
  }

  Widget _buildSocialMediaIcons() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 5,
      children: [
        _socialMediaIcon("assets/icons/fb.png"),
        _socialMediaIcon("assets/icons/x.png"),
        _socialMediaIcon("assets/icons/google.png"),
        _socialMediaIcon("assets/icons/ig.png"),
      ],
    );
  }

  Widget _socialMediaIcon(String assetPath) {
    return Image.asset(
      assetPath,
      width: 20,
    );
  }

  Widget _buildSignUpPrompt(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignupScreen(),
          ),
        );
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Don't have an account? ",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            TextSpan(
              text: "Sign Up",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
