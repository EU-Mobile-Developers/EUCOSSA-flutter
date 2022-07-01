import 'package:eu_mobile/screens/login.dart';
import 'package:eu_mobile/utils/theme.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _admissionYearController;
  late TextEditingController _residenceController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  @override
  void initState() {
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _admissionYearController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _residenceController = TextEditingController();
    super.initState();
  }

  @override
  void deactivate() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _admissionYearController.dispose();
    _emailController.dispose();
    _residenceController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.deactivate();
  }

  bool _isTextObscured = true;
  IconData _visibilityIcon = Icons.visibility_off;

  IconData _changePasswordSuffixIcon(IconData visibleIcon) {
    if (visibleIcon == Icons.visibility) {
      return visibleIcon = Icons.visibility_off;
    } else {
      return visibleIcon = Icons.visibility;
    }
  }

  String? _emailValidator(String? textFieldValue) {
    if (textFieldValue == null || textFieldValue.isEmpty) {
      return 'This value is required';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(textFieldValue)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  String? _nameFieldValidator(String? nameFieldValue) {
    if (nameFieldValue == null || nameFieldValue.isEmpty) {
      return 'This field must contain a value';
    } else {
      return null;
    }
  }

  String? _phoneNumberValidator(String? phoneNumberValue) {
    if (phoneNumberValue!.length < 9) {
      return 'Your number must contain 9 digits';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text('Personal details for identification'),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 1.0,
                  shape: const RoundedRectangleBorder(),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _firstNameController,
                        validator: _nameFieldValidator,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: 'First Name',
                          hintStyle: const TextStyle(color: Colors.black),
                          labelText: 'First Name',
                          labelStyle:
                              const TextStyle(color: AppTheme.gradientColor),
                          focusColor: AppTheme.gradientColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _lastNameController,
                        validator: _nameFieldValidator,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: 'Last Name',
                          hintStyle: const TextStyle(color: Colors.black),
                          labelText: 'Last Name',
                          labelStyle:
                              const TextStyle(color: AppTheme.gradientColor),
                          focusColor: AppTheme.gradientColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: _emailValidator,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: const TextStyle(color: Colors.black),
                          labelText: 'Email',
                          labelStyle:
                              const TextStyle(color: AppTheme.gradientColor),
                          focusColor: AppTheme.gradientColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _phoneNumberController,
                        keyboardType: TextInputType.number,
                        // initialValue: '+254',
                        validator: _phoneNumberValidator,
                        maxLength: 9,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.contact_phone_rounded),
                          hintText: '700 000 000',
                          hintStyle: const TextStyle(color: Colors.black),
                          labelText: 'Phone Number',
                          labelStyle:
                              const TextStyle(color: AppTheme.gradientColor),
                          focusColor: AppTheme.gradientColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _admissionYearController,
                        maxLength: 4,
                        keyboardType: TextInputType.number,
                        onTap: () async {
                          final pickedYear = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2072),
                              currentDate: DateTime.now(),
                              helpText: 'Year Of Admission',
                              cancelText: 'Cancel',
                              confirmText: 'Choose',
                              errorFormatText: 'Choose the correct year',
                              errorInvalidText: 'Invalid choice',
                              keyboardType: TextInputType.number);
                          _admissionYearController.text =
                              pickedYear!.year.toString();
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.contact_phone_rounded),
                          counterText: '',
                          hintText: 'Year Of Admission',
                          hintStyle: const TextStyle(color: Colors.black),
                          labelText: 'Year of Admission',
                          labelStyle:
                              const TextStyle(color: AppTheme.gradientColor),
                          focusColor: AppTheme.gradientColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _residenceController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: 'Where do you stay?',
                          hintStyle: const TextStyle(color: Colors.black),
                          labelText: 'Residence',
                          labelStyle:
                              const TextStyle(color: AppTheme.gradientColor),
                          focusColor: AppTheme.gradientColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: _isTextObscured,
                        controller: _passwordController,
                        keyboardType: TextInputType.name,
                        //todo: set obscure text and icon setting
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: const TextStyle(color: Colors.black),
                          labelText: 'Password',
                          labelStyle:
                              const TextStyle(color: AppTheme.gradientColor),
                          focusColor: AppTheme.gradientColor,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isTextObscured = !_isTextObscured;
                                _visibilityIcon =
                                    _changePasswordSuffixIcon(_visibilityIcon);
                              });
                            },
                            child: Icon(
                              _visibilityIcon,
                              color: Colors.black,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _confirmPasswordController,
                        keyboardType: TextInputType.name,
                        obscureText: _isTextObscured,
                        //todo: set obscure text and icon setting
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          hintStyle: const TextStyle(color: Colors.black),
                          labelText: 'Confirm Password',
                          labelStyle:
                              const TextStyle(color: AppTheme.gradientColor),
                          focusColor: AppTheme.gradientColor,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isTextObscured = !_isTextObscured;
                                _visibilityIcon =
                                    _changePasswordSuffixIcon(_visibilityIcon);
                              });
                            },
                            child: Icon(
                              _visibilityIcon,
                              color: Colors.black,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: const Text('I HAVE AN ACCOUNT'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
