import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController dateOfBirth = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool isLoading = false;
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Column(

        children: [

          const SizedBox(height: 10),
        Text(
          "Please enter your personal "
              "information to create your own secure account",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 5),
        Text("Fields marked(*) are required",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,

          ),
          textAlign: TextAlign.left,


        ),
        const SizedBox(height: 24),
        _buildCustomTextField(
          controller: firstName,
          title: "First Name*",
          hintText: 'Enter your First Name',

        ),
        const SizedBox(height: 12),
        _buildCustomTextField(
          controller: lastName,
          title: "Last Name*",
          hintText: 'Enter your Last Name',
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildCustomTextField(
                controller: dateOfBirth,
                title: "Date Of Birth*",
                hintText: 'Date Of Birth',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildCustomTextField(
                controller: gender,
                title: "Gender*",
                hintText: 'Select Gender',
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildCustomTextField(
          controller: email,
          title: "Email*",
          hintText: 'Enter a valid email address',
        ),
        const SizedBox(height: 12),
        _buildCustomTextField(
          controller: password,
          title: "Password*",
          hintText: 'Enter a strong password',

        ),
        const SizedBox(height: 60),
        Container(
          height: 53,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                isLoading = true;
                // myController.registerFormValidator();
              });

              Future.delayed(Duration(seconds: 4), () {
                setState(() {
                  isLoading = false;
                });
              });
            },
            child: isLoading
                ? CircularProgressIndicator(
              color: Colors.white,
            )
                : Text(
              'Submit',
              style:
                 TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
              color: Colors.white
                ),

            ),

            //From Here
            style: ElevatedButton.styleFrom(
                primary: Colors.black,
                elevation: 0.0,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0))),
            //To here
          ),
        ),
      ],



      ),

    );


  }


  Widget _buildCustomTextField({
    required String title,
    required TextEditingController controller,
    required String hintText,
  }) {
    return Column(
      children: [
        Text(title),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(hintText: hintText),
        ),
      ],
    );
  }
}

