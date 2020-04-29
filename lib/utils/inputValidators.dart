
String validateEmail(String value, _formKey) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Please enter a valid email.';
  }
  _formKey.currentState.save();
  return null;
}

String validateRequired(String value, _formKey) {
  if (value.isEmpty) {
    return 'This field is required';
  }
  _formKey.currentState.save();
  return null;
}

String validatePassword(String value, _formKey) {
  if (value.length < 5) {
    return 'Password should contains more than 6 character';
  } else
  _formKey.currentState.save();
  return null;
}