import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final IconData icon;
  final String? Function(String?) validator;
  final TextEditingController controller;
  bool obscureText;
  final bool isPasswordField; // Add this flag to identify password field

  CustomTextFormField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    required this.icon,
    required this.validator,
    required this.controller,
    this.obscureText = false,
    this.isPasswordField = false, // Default to false
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: _obscureText,
        decoration: InputDecoration(
          fillColor: Theme.of(context).cardColor,
          filled: true,
          prefixIcon: Icon(
            widget.icon,
            size: 16,
          ),
          labelText: widget.hintText,
          hintText: widget.hintText,
          suffixIcon: widget.isPasswordField
              ? InkWell(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    size: 18,
                  ),
                )
              : null, // Only show visibility icon for password field
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22.0),
            borderSide: BorderSide(color: Colors.grey[200]!),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        ),
        validator: (value) => widget.validator(value),
      ),
    );
  }
}
