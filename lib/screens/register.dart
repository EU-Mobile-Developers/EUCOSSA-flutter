import 'package:eu_mobile/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController _firstNameController,
      _lastNameController,
      _emailController,
      _phoneNumberController,
      _admissionYearController,
      _passwordController,
      _confirmPasswordController;
  @override
  void initState() {
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _admissionYearController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('Personal details for identification'),
          Card(
            elevation: 1.0,
            shape: const RoundedRectangleBorder(),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    hintText: 'First Name',
                    hintStyle: const TextStyle(color: Colors.black),
                    labelText: 'First Name',
                    labelStyle: const TextStyle(color: AppTheme.gradientColor),
                    focusColor: AppTheme.gradientColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                    hintStyle: const TextStyle(color: Colors.black),
                    labelText: 'Last Name',
                    labelStyle: const TextStyle(color: AppTheme.gradientColor),
                    focusColor: AppTheme.gradientColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: const TextStyle(color: Colors.black),
                    labelText: 'Email',
                    labelStyle: const TextStyle(color: AppTheme.gradientColor),
                    focusColor: AppTheme.gradientColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                TextFormField(
                  controller: _phoneNumberController,
                  initialValue: '+254',
                  maxLength: 9,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.flag_circle_rounded),
                    hintText: '700 000 000',
                    hintStyle: const TextStyle(color: Colors.black),
                    labelText: 'Phone Number',
                    labelStyle: const TextStyle(color: AppTheme.gradientColor),
                    focusColor: AppTheme.gradientColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                TextFormField(
                  controller: _admissionYearController,
                  initialValue: '+254',
                  maxLength: 4,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.flag_circle_rounded),
                    counterText: '',
                    hintText: '700 000 000',
                    hintStyle: const TextStyle(color: Colors.black),
                    labelText: 'Phone Number',
                    labelStyle: const TextStyle(color: AppTheme.gradientColor),
                    focusColor: AppTheme.gradientColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    //todo: route to login page
                  },
                  child: const Text('I HAVE AN ACCOUNT'),
                )
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              //todo: route to the next screen
            },
            child: const Text(
              'NEXT',
              style: TextStyle(
                color: AppTheme.gradientColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
