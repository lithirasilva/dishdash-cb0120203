import 'package:flutter/material.dart';
import '../components/my_button.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  // text editing controllers
  final EmailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneNumberController = TextEditingController();

  // register user method
  void registerUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 81),

                  // logo
                  SizedBox(
                    width: 230,
                    height: 220,
                    child: Column(
                      children: [
                        Image.asset('images/Logo2.png'),
                        const SizedBox(height: 10),
                        const Text(
                          'Welcome to DishDash!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Email textfield
                  TextField(
                    controller: EmailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your Email',
                    ),
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  // phone number textfield
                  TextField(
                    controller: phoneNumberController,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      hintText: 'Enter your phone number',
                    ),
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  // password textfield
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                    ),
                    obscureText: true,
                  ),

                  const SizedBox(height: 10),

                  // confirm password textfield
                  TextField(
                    controller: confirmPasswordController,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      hintText: 'Re-enter your password',
                    ),
                    obscureText: true,
                  ),

                  const SizedBox(height: 50),

                  // register button
                  MyButton(
                    onTap: registerUser,
                    text: 'Sign Up',
                  ),

                  const SizedBox(height: 40),

                  // already a member? sign in now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a member?',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Sign in now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
