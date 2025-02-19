import 'package:flutter/material.dart';
import 'package:group_system_app/common/constants/app_colors.dart';
import 'package:group_system_app/common/constants/app_input_decoration.dart';
import 'package:group_system_app/common/constants/app_text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login",
                  style: AppTextStyles.title,
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: AppInputDecoration.primaryInput.copyWith(
                    labelText: "Email",
                    hintText: "Insira o seu email!",
                  ),
                  validator: (value) {
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
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: AppInputDecoration.primaryInput.copyWith(
                    labelText: "Senha",
                    hintText: "Insira a sua senha!",
                    suffixIcon: _obscureText
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            icon: Icon(Icons.visibility_off),
                          )
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            icon: Icon(Icons.visibility),
                          ),
                  ),
                  obscureText: _obscureText,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Campo obrigatório!";
                    }

                    if (value.length < 6) {
                      return "Senha inválida!";
                    }

                    return null;
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: AppColors.primary,
                          padding: EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Text(
                          "Entrar",
                          style: AppTextStyles.button.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
