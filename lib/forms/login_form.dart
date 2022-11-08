import 'package:flutter/material.dart';
import 'package:socialx/widgets/icon_widgets.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                label: Text('Email'),
                suffixIcon: FormIcon(icon: Icons.email)
              ),
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return 'email is required';
                }
                else if(value.length<3)
                {
                  return 'email must have atleast 3 ';
                }
                else if(!value.contains(RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')))
                {
                  return 'email should be look like : example@domain.com';
                }
                  return null;                        
              },
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                label: Text('password'),
                suffixIcon: FormIcon(icon: Icons.lock_outline)
              ),
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return 'Password is required';
                }
                else if(value.length<8)
                {
                  return 'Password must have atleast 8 ';
                }
                else if(value.length>16)
                {
                  return 'Password must have atmost 16 ';
                }
                else if(!value.contains(RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')))
                {
                  return 'Password must contain: atleast one alphabet, \n atleast one number and atleast one special character';
                }
                return null;
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}