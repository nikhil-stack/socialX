import 'package:flutter/material.dart';
import 'package:socialx/widgets/icon_widgets.dart';
import 'package:flag/flag.dart';

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController numberController = TextEditingController();
TextEditingController passwordController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                label: Text('name'),
                suffixIcon: FormIcon(icon: Icons.person)
              ),
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return 'First Name is required';
                }
                return null;
              },  
            ),
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
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text('Contact no',
                style: TextStyle(
                  fontSize: 16
                ),
              )
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Flag.fromCode(
                  FlagsCode.IN,
                  height: 30,
                  width: 40,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 6),
                const Text('IN  +91',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16
                  ),
                ),
                const SizedBox(width: 6),
                InkWell(
                  onTap: (){},
                  child: const Icon(
                    Icons.arrow_drop_down_sharp,
                   color: Colors.grey
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: TextFormField(
                    controller: numberController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      suffixIcon: FormIcon(icon: Icons.phone),
                    ),
                    validator: (value) {  
                      if(value!.length != 10)
                      {
                        return 'Phone number should be of length 10';
                      }
                      else if(value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
                        return 'Phone number can\'t contain special character';
                      }
                      else if(value.contains(RegExp('[a-zA-Z]')))
                      {
                        return 'Phone number can\'t contain alphabets';
                      }
                        return null;                        
                    },
                  ),
                ),
              ],
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              obscuringCharacter: '*',
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
          ],
        ),
      ),
    );
  }
}