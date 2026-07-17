import 'package:flutter/material.dart';

class Formfield extends StatelessWidget {
  final IconData prefixicon;
  final String hinttext;
  final bool obscuretext;
  final VoidCallback onpressed;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const Formfield({
    super.key,
    required this.prefixicon,
    required this.obscuretext,
    required this.onpressed,
    required this.hinttext,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscuretext,

      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.deepPurple, width: 2),
          ),
          child: Icon(Icons.lock, size: 30, color: Colors.deepPurple),
        ),
        contentPadding: EdgeInsets.only(left: 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
        suffixIcon: IconButton(
          onPressed: onpressed,
          icon: Icon(
            obscuretext ? Icons.visibility_off : Icons.visibility,
            size: 20,
            color: Colors.white,
          ),
        ),
        hintText: hinttext,
        hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
      ),
    );
  }
}
