String? validateText(value) {
  value = value!.trim();
  if (value.isEmpty) {
    return "Required*";
  }
  return null;
}

String? validateEmail(value) {
  value = value!.trim();
  bool validEmail = RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(value);
  if (value.isEmpty) {
    return "Required*";
  }
  if (!validEmail) {
    return "Please enter a valid email";
  }
  return null;
}
