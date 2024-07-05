import 'package:flutter/material.dart';
import 'package:insta/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    TextEditingController idcontroller = TextEditingController();
    TextEditingController passcontroller = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Instagram',
                      style: TextStyle(
                        fontFamily: 'Lobster',
                        color: Color(0xFF2A0253),
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            TextFormField(
                              autovalidateMode:AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Phone no is required!';
                                } else if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                                    .hasMatch(value)) {
                                  return 'Enter a valid phone number';
                                }
                              },
                              controller: idcontroller,
                              decoration: deco(hintText: 'Phone Number, username or email'),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              validator: (value){
                                if (value!.isEmpty){
                                  return 'Password is Required';
                                }
                              },
                              controller: passcontroller,
                              decoration: deco(hintText: 'Password'),
                            ),
                          ],
                        ),
                      ),
                    ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Forgot Password?",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                            SizedBox(height: 50),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextButton(
                                      onPressed: ()
                                {
                                if(formKey.currentState!.validate()){
                                  String username = '1234567890';
                                  String pass = 'luha123';
                                if (username == idcontroller.text &&
                                pass == passcontroller.text) {
                                Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HomePage()));
                                }
                                else {
                                  // Show snackbar for invalid credentials
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                      Text('Invalid username or password'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                }
                                }
                                },
                                      style: TextButton.styleFrom(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(2)),
                                        ),
                                        backgroundColor: const Color(0xFF31C1FF), // foreground
                                      ),
                                      child: Text(
                                        'Log In',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

InputDecoration deco({required String hintText}) {
  return InputDecoration(
    filled: true,
    fillColor: const Color(0xFFE8E8E8),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: Color(0xFF3E3E3E), width: .8),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: Color(0xFF3E3E3E), width: .8),
    ),
    contentPadding: const EdgeInsets.all(20),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: Color(0xFF3E3E3E), width: .8),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: Color(0xFF3E3E3E), width: .8),
    ),
    hintText: hintText,
    hintStyle: const TextStyle(
      fontSize: 14,
      fontFamily: 'Montserrat SemiBold',
      color: Colors.grey,
    ),
  );
}
