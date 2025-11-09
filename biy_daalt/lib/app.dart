import 'package:flutter/material.dart';
import 'components/card.dart';
import 'components/input_field.dart';
import 'components/button.dart';
import 'screens/dashboard.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: {'/dashboard': (context) => DashboardScreen()},
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // ✅ pure white background
      body: Center(
        child: CardWidget(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'lib/assets/SHUTIS_logo.svg.png',
                  height: 150,
                ),
                const SizedBox(height: 10),
                const Text(
                  'MUST STUDENT APP',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                InputField(label: 'Оюутны код', suffixText: 'ABC'),
                const SizedBox(height: 20),
                InputField(
                  label: 'Нууц үг',
                  obscureText: true,
                  suffixIcon: Icons.visibility_off,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (value) {}),
                        const Text('Намайг сана'),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Нууц үг сэргээх'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: 'Нэвтрэх',
                        onPressed: () {
                          Navigator.pushNamed(context, '/dashboard');
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(Icons.fingerprint),
                      onPressed: () {},
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
