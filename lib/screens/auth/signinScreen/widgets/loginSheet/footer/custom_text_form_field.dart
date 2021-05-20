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
    return TextFormField(
      controller: widget._controller,
      autocorrect: false,
      keyboardType: widget._textInputType,
      textInputAction: widget._textInputAction,
      obscureText: widget._obscureText,
      cursorColor: Theme.of(context).accentColor,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        hintText: widget._hint,
        hintStyle: TextStyle(
          color: Colors.blueGrey.shade200,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          gapPadding: 0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          gapPadding: 0,
        ),
        suffix: const Icon(
          Icons.close_rounded,
          size: 16,
        ),
      ),
    );
  }
}
