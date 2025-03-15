String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return "Campo obrigatório!";
  }

  if (value.length < 5) {
    return "Email inválido!";
  }

  if (!value.contains("@") || !value.contains(".")) {
    return "Email inválido!";
  }

  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return "Campo obrigatório!";
  }

  if (value.length < 6) {
    return "Senha inválida!";
  }

  return null;
}

String? validateString(String? value) {
  if (value == null || value.isEmpty) {
    return "Campo obrigatório!";
  }

  if (value.length < 3) {
    return "Campo inválido";
  }

  return null;
}
