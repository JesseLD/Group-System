import 'package:flutter/material.dart';
import 'package:group_system_app/common/constants/app_colors.dart';
import 'package:group_system_app/common/constants/app_input_decoration.dart';
import 'package:group_system_app/common/constants/app_input_validators.dart';
import 'package:group_system_app/common/constants/app_text_styles.dart';
import 'package:group_system_app/common/widgets/custom_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void validateForm() {
    if (_formKey.currentState!.validate()) {
      handleForm();
    }
  }

  void handleForm() {
    print("Name: ${_nameController.text}");
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
                  "Registro",
                  style: AppTextStyles.title,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Crie uma conta para acessar todos os recursos",
                  style: AppTextStyles.body,
                ),
                SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: AppInputDecoration.primaryInput.copyWith(
                    labelText: "Nome",
                    hintText: "Insira o seu nome!",
                  ),
                  validator: validateString,
                ),
                SizedBox(
                  height: 16,
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
                    "Cadastre-se",
                    style: AppTextStyles.button.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    validateForm();
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, "/register");
                    // print("Tela de Criar Conta!");
                    Navigator.pop(context);
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Já tem uma conta? ",
                      style: AppTextStyles.body
                          .copyWith(color: AppColors.lightGray),
                      children: [
                        TextSpan(
                          text: "Faça Login",
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
