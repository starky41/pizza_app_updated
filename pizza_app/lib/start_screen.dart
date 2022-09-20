import 'package:flutter/material.dart';
import './widgets/login_datafield.dart';
import './widgets/login_button.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 100.0, horizontal: 100.0),
              child: Container(
                // color: Colors.grey.shade200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Добро пожаловать!',
                          style: TextStyle(
                            fontSize: 36.0,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'Добро пожаловать! Введите ваши данные для входа',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: 100.0),
                    LoginDataField(
                      controller: _emailController,
                      text: 'Email',
                      hinttext: 'Введите ваш адрес эл. почты',
                      obscureText: false,
                    ),
                    SizedBox(height: 20.0),
                    LoginDataField(
                      controller: _passwordController,
                      text: 'Пароль',
                      hinttext: 'Введите ваш пароль',
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    LoginButton(
                      buttonColor: Colors.orangeAccent,
                      textColor: Colors.white,
                      text: 'Войти',
                      onPressed: () {
                        print('hello');
                      },
                    ),
                    SizedBox(height: 10.0),
                    LoginButton(
                      buttonColor: Colors.white,
                      textColor: Colors.black,
                      text: 'Регистрация',
                      onPressed: () {
                        print('hello');
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.orange,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/pizza_logo.png',
                    height: 150.0,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Пиццерия',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36.0,
                      fontFamily: 'Lobster',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
