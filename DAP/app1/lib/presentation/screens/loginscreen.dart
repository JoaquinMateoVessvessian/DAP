import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app1/entities/usuarios.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final List<Usuarios> usuarios = [
    Usuarios(name: 'Octaviano', username: 'octa', mail: 'octa@gmail.com', password: '2934'),
    Usuarios(name: 'Joaquin', username: 'joaquito', mail: 'joaco@gmail.com', password: '9213'),
    Usuarios(name: 'Pedro', username: 'pedrito', mail: 'pedro@gmail.com', password: '5324'),
    Usuarios(name: 'Maria', username: 'maria123', mail: 'maria@gmail.com', password: '9234'),
    Usuarios(name: 'Ana', username: 'ana456', mail: 'ana@gmail.com', password: '0242'),
    Usuarios(name: 'Luis', username: 'luis789', mail: 'luis@gmail.com', password: '9423'),
    Usuarios(name: 'Carlos', username: 'carlos101', mail: 'carlos@gmail.com', password: '5682'),
    ];

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
                'Login',
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
                  TextButton(
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
                      
                        Usuarios? usuario;
                        try {
                          usuario = usuarios.firstWhere(
                            (u) => u.mail == mail,
                          );
                        } catch (e) {
                          usuario = null;
                        }

                      if (usuario == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('El mail no tiene una cuenta registrada'),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }
                      if (usuario.username == username &&
                          usuario.password == password &&
                          usuario.name == name) {
                        context.go('/home', extra: {'name': name, 'mail': mail});
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Algún campo es incorrecto'),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: Text('login', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
              SizedBox(height: 50),
                  Text('if you dont have an account you can register here:'),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () => context.go('/register'),
                    child: Text('Register', style: TextStyle(fontSize: 20)),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}