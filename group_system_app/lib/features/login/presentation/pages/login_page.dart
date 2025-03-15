import 'package:flutter/material.dart';
import 'package:group_system_app/common/constants/app_colors.dart';
import 'package:group_system_app/common/constants/app_input_decoration.dart';
import 'package:group_system_app/common/constants/app_input_validators.dart';
import 'package:group_system_app/common/constants/app_text_styles.dart';
import 'package:group_system_app/common/widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void validateForm() {
    if (_formKey.currentState!.validate()) {
      handleForm();
    }
  }

  void handleForm() {
    print("Email: ${_emailController.text}");
    print("Password: ${_passwordController.text}");
  }

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
                  height: 8,
                ),
                Text(
                  "Faça login para acessar todos os recursos",
                  style: AppTextStyles.body,
                ),
                SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: AppInputDecoration.primaryInput.copyWith(
                    labelText: "Email",
                    hintText: "Insira o seu email!",
                  ),
                  validator: validateEmail,
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _passwordController,
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
                  validator: validatePassword,
                ),
                SizedBox(
                  height: 24,
                ),
                CustomButton(
                  child: Text(
                    "Entrar",
                    style: AppTextStyles.button.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    validateForm();
                    // Navigator.pushNamed(context, "/home");
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/register");
                    // print("Tela de Criar Conta!");
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Não tem uma conta? ",
                      style: AppTextStyles.body
                          .copyWith(color: AppColors.lightGray),
                      children: [
                        TextSpan(
                          text: "Cadastre-se",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
