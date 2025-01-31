import 'package:flutter/material.dart';

import '../../../widgets/custom_btn.dart';
import '../../../widgets/custom_textform_widget.dart';
import '../helper/validator_helper.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
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
                _buildSignUpTitle(),
                SizedBox(height: 20),
                _buildEmailField(),
                SizedBox(height: 5),
                _buildUsernameField(),
                SizedBox(height: 5),
                _buildPasswordField(),
                SizedBox(height: 5),
                _buildConfirmPasswordField(),
                SizedBox(height: 5),
                _buildPolicyRow(context),
                SizedBox(height: 15),
                _buildSignUpButton(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                _buildLoginPrompt(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpTitle() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        "Sign Up",
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

  Widget _buildEmailField() {
    return CustomTextFormField(
      hintText: "Email",
      keyboardType: TextInputType.emailAddress,
      icon: Icons.mail_rounded,
      validator: (String? value) => validateName(value ?? ""),
      controller: emailController,
    );
  }

  Widget _buildPasswordField() {
    return CustomTextFormField(
      hintText: "Password",
      keyboardType: TextInputType.text,
      icon: Icons.lock_rounded,
      validator: (String? value) => validatePassword(value ?? ""),
      obscureText: true,
      controller: passwordController,
      isPasswordField: true,
    );
  }

  Widget _buildConfirmPasswordField() {
    return CustomTextFormField(
      hintText: "Confirm Password",
      keyboardType: TextInputType.name,
      icon: Icons.lock_rounded,
      validator: (String? value) => validatePassword(value ?? ""),
      obscureText: true,
      controller: confirmPasswordController,
      isPasswordField: true,
    );
  }

  Widget _buildPolicyRow(BuildContext context) {
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
        Text("I Agree with "),
        Text(
          "privacy",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Text(" and "),
        Text(
          "policy",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton() {
    return CustomBtn(name: "SignUp", function: () {});
  }

  Widget _buildLoginPrompt(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Have an account? ",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            TextSpan(
              text: "Login",
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
