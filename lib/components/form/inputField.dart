import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String placeholder;
  final TextEditingController model;
  final Function validator;
  final Function onSaved;
  final String type;
  final int maxLength;
  final int maxLines;
  final bool isEnabled;
  
  InputField({ this.placeholder, this.model, this.type, this.validator, this.onSaved, this.maxLength, this.maxLines, this.isEnabled });

  TextInputType checkKeyboardType(String type) {
    switch (type) {
      case 'email':
        return TextInputType.emailAddress;
        break;
      case 'number':
        return TextInputType.number;
        break;
      case 'multiline':
        return TextInputType.multiline;
        break;
      default:
        return TextInputType.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(child:
        TextFormField(
            keyboardType: checkKeyboardType(type),
            obscureText: type == 'password',
            controller: model,
            validator: validator,
            maxLength: maxLength,
            enabled: isEnabled,
            maxLines: type == 'password' ? 1 : maxLines,
            onSaved: onSaved,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                labelText: placeholder,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
          ),
      ),
    );
  }
}