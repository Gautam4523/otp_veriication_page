import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldCard extends StatelessWidget {
  final TextEditingController textEditingController;

  Function(String) onChange;
  TextFieldCard({required this.onChange, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: TextFormField(
        controller: textEditingController,
        autofocus: true,
        onChanged: onChange,
        textAlign: TextAlign.center,
        cursorHeight: 15,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
