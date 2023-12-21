import 'package:flutter/material.dart';

class Credentials {
  Credentials(this.username, this.password);

  final String username;

  final String password;
}

class SignInScreen extends StatefulWidget {
  const SignInScreen({
    required this.onSignIn,
    super.key,
  });

  final ValueChanged<Credentials> onSignIn;

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Card(
            child: Container(
              constraints: BoxConstraints.loose(const Size(600, 600)),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Sign in', style: Theme.of(context).textTheme.headlineMedium),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Username'),
                    controller: _usernameController,
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    controller: _passwordController,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextButton(
                      onPressed: () async {
                        widget.onSignIn(Credentials(_usernameController.value.text, _passwordController.value.text));
                      },
                      child: const Text('Sign in'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
