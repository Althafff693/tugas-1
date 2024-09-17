import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Sederhana',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final String username = 'althaf';
  final String password = '124210025';

  void _login() {
    if (_usernameController.text == username &&
        _passwordController.text == password) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text('Username atau Password salah!'),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Utama'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Penjumlahan dan Pengurangan'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalculatorPage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Cek Ganjil/Genap'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GanjilGenapPage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Data Mahasiswa'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DataMahasiswaPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _result = '';

  void _calculate(String operator) {
    int num1 = int.parse(_num1Controller.text);
    int num2 = int.parse(_num2Controller.text);
    int result = 0;

    if (operator == '+') {
      result = num1 + num2;
    } else if (operator == '-') {
      result = num1 - num2;
    }

    setState(() {
      _result = 'Hasil: $result';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Penjumlahan & Pengurangan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _num1Controller,
              decoration: const InputDecoration(labelText: 'Angka Pertama'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _num2Controller,
              decoration: const InputDecoration(labelText: 'Angka Kedua'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _calculate('+'),
                  child: const Text('Tambah'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('-'),
                  child: const Text('Kurang'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(_result),
          ],
        ),
      ),
    );
  }
}

class GanjilGenapPage extends StatefulWidget {
  const GanjilGenapPage({super.key});

  @override
  _GanjilGenapPageState createState() => _GanjilGenapPageState();
}

class _GanjilGenapPageState extends State<GanjilGenapPage> {
  final TextEditingController _numberController = TextEditingController();
  String _result = '';

  void _checkNumber() {
    int number = int.parse(_numberController.text);

    setState(() {
      if (number % 2 == 0) {
        _result = 'Bilangan Genap';
      } else {
        _result = 'Bilangan Ganjil';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cek Ganjil / Genap'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _numberController,
              decoration: const InputDecoration(labelText: 'Masukkan Angka'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkNumber,
              child: const Text('Cek'),
            ),
            const SizedBox(height: 20),
            Text(_result),
          ],
        ),
      ),
    );
  }
}

class DataMahasiswaPage extends StatelessWidget {
  const DataMahasiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Mahasiswa'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Nama: Althaf Prabaswara D', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('NIM: 124210025', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Kelas: Pemrograman Aplikasi Mobile SI-A', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
