import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController _controller;
  final String _hint;
  final TextInputAction _textInputAction;
  final TextInputType _textInputType;
  final bool _obscureText;
  final String _validator;

  const CustomTextFormField({
    Key key,
    TextEditingController controller,
    String hint,
    TextInputAction textInputAction,
    TextInputType textInputType,
    bool obscureText,
    String validator,
  })  : _controller = controller,
        _hint = hint ?? '',
        _textInputAction = textInputAction ?? TextInputAction.next,
        _textInputType = textInputType ?? TextInputType.text,
        _obscureText = obscureText ?? false,
        _validator = validator,
        super(key: key);
  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  void _onListener() => setState(() {});

  @override
  void initState() {
    widget._controller.addListener(_onListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(width: 0.3, color: Colors.grey),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: TextFormField(
          controller: widget._controller,
          keyboardType: widget._textInputType,
          textInputAction: widget._textInputAction,
          obscureText: widget._obscureText,
          decoration: InputDecoration(
            hintText: widget._hint,
            hintStyle: TextStyle(color: Colors.blueGrey.shade200),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
