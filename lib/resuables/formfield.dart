import 'package:flutter/material.dart';

class form extends StatelessWidget {
  final IconData Icon1;
  final String text;
  final bool obscuretext;
  final VoidCallback onpressed;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const form({
    super.key,
    required this.Icon1,
    required this.obscuretext,
    required this.onpressed,
    required this.text,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(2),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.deepPurple, width: 2),
          ),
          child: Icon(Icon1, size: 30, color: Colors.deepPurple),
        ),
        Expanded(
          child: TextFormField(
            validator: validator,
            controller: controller,
            obscureText: obscuretext,

            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              suffixIcon: IconButton(
                onPressed: onpressed,
                icon: Icon(
                  obscuretext ? Icons.visibility_off : Icons.visibility,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              hintText: text,
              hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
