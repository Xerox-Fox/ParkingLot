import 'package:flutter/material.dart';
import 'package:onboarding_screen_app/pages/home_screen.dart';
import 'package:onboarding_screen_app/widgets/reusable_widget.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(child: Padding(
          padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.2, 20, 0),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Username", Icons.person_outline, false, _userNameTextController),
              const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email", Icons.person_outline, false,
                    _emailTextController),
              const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Username", Icons.lock_outline, false,
                    _passwordTextController),
              const SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, false, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                })
            ],
          ),
          ),),
      ),
    );
  }

}
