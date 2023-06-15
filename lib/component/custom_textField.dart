import 'package:app_api/Constant/colors.dart';
import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {
  TextFieldCustom(
      {super.key,
      required this.hint,
      required this.label,
      required this.icon,
      this.isPassword = false,
      this.controller,
      this.onchanged,
      this.onSaved,
      this.obscureText = false,
      this.maxLines,
      this.validator,
      this.minLines});

  final String hint;
  final String label;
  final IconData icon;
  final bool? isPassword;
  final TextEditingController? controller;
  final Function(String)? onchanged;
  final Function(String?)? onSaved;
  final bool obscureText;
  final int? maxLines;
  final int? minLines;
  String? Function(String?)? validator;

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  var isVisible = false;
  @override
  void initState() {
    super.initState();
    isVisible = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          validator: widget.validator,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          enabled: true,
          controller: widget.controller,
          
          obscureText: isVisible,
          obscuringCharacter: "*",
          cursorColor: Colors.teal,
          cursorWidth: 5,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: widget.hint,
              labelText: widget.label,
              prefixIcon: Icon(
                widget.icon,
                color: btnColor,
              ),
              suffixIcon: widget.isPassword!
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      child: Icon(
                        isVisible
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye,
                        color: btnColor,
                      ))
                  : null,
              labelStyle: const TextStyle(
                  color: btnColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: btnColor),
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide:
                      BorderSide(color: btnColor))),
        ));
  }
}
