import 'package:flutter/material.dart';
import '../widgets/login_datafield.dart';
import '../widgets/login_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return LoginWidget();
          }
        },
      ),
    );
  }
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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
                        signIn();
                      }),
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
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Signed In as',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              user.email!,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextButton(
              child: Text('return'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
