import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialx/forms/register_form.dart';
import 'package:socialx/services/auth-services.dart';
import 'package:socialx/views/landing_view.dart';
import 'package:socialx/widgets/container_widgets.dart';
import 'package:socialx/widgets/text_widgets.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? errorMessage = '';
  bool checkValue = false;
  bool isLoading = false;

  Future<void> createUserWithEmailAndPassword() async {
    setState(() {
      isLoading = true;
    });
    try {
      await Auth().createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  void validate() {
    if (formKey.currentState!.validate()) {
      createUserWithEmailAndPassword();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainContainer(
            column: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RedTextTitle(title: 'Create an'),
            const RedTextTitle(title: ' Account'),
            const RegisterForm(),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 12, bottom: 30),
              child: const RedTextnormal(title: 'Forgot Password ?'),
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: checkValue,
                        onChanged: (value) {
                          setState(() {
                            checkValue = value!;
                          });
                        },
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'I agree with ',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          'term & condition',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an Account ? ',
                        style: TextStyle(fontSize: 14),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LandingView(index: 0)),
                          );
                        },
                        child: const RedTextnormal(title: ' Sign In!'),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        )),
        const Spacer(),
        BottomContainer(
          inkwell: InkWell(
            onTap: (() {
              validate();
            }),
            child: isLoading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : const BottomText(
                    title: 'REGISTER',
                  ),
          ),
        )
      ],
    );
  }
}
