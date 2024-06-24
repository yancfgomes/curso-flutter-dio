import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _buildThemeData(),
      home: const MyHomePage(title: 'Yan Project'),
    );
  }

  ThemeData _buildThemeData() {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.blue,
      ).copyWith(
        secondary: Colors.red,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
      useMaterial3: true,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Center(
        child: _buildCounterColumn(context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Column _buildCounterColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'O botão foi pressionado essa quantidade de vezes:',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          '$_counter',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Theme.of(context).colorScheme.secondary),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _incrementCounter,
          style: ElevatedButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 5, 5, 5), backgroundColor: Theme.of(context).colorScheme.primary,
            textStyle: const TextStyle(fontSize: 16),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: const Text('Incrementar'), )
      ],
    );
  }
}
