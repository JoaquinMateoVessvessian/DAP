import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  final String username;
  final String password;
  final String mail;
  final String name;
  const RegisterScreen({
    super.key,
    required this.username,
    required this.password,
    required this.mail,
    required this.name,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20),
              Text(
                'Register',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 0, 0, 0),
              ),
              ),
              SizedBox(height: 50),
              SizedBox(
                width: 250,
                child: TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(labelText: 'username'),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 250,
                child: TextField(
                  controller: mailController,
                  decoration: const InputDecoration(labelText: 'mail'),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 250,
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'name'),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 170,
                    child: TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(labelText: 'password'),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(width: 10),
                  _(
                    onPressed: () {
                      String username = usernameController.text;
                      String password = passwordController.text;
                      String mail = mailController.text;
                      String name = nameController.text;

                      if (username.isEmpty || password.isEmpty || mail.isEmpty || name.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Tienes campos vacios', style: TextStyle(color: Colors.black)),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.yellow,
                          ),
                        );
                        return;
                      }
                    },
                  ),
                ],
              ),
              TextButton(
                      onPressed: () => context.go('/home'),
                      child: Text(
                        'Create Account',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}