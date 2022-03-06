import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Minus Scroll Sample'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = ScrollController();
  final _centerKey = const ValueKey('center');

  final _data = <List<String>>[
    [
      'Dart',
      'Java',
      'Ruby',
      'Python',
      'JavaScript',
      'C',
      'Swift',
    ],
  ];

  void _addData() {
    setState(() {
      _data.insert(0, [
        'Kotlin',
        'C++',
        'F#',
        'Cobol',
        'Go',
        'C#',
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: CustomScrollView(
          center: _centerKey,
          slivers: _data
              .map(
                (section) => SliverList(
                  key: _data.last == section ? _centerKey : null,
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 32,
                        ),
                        child: Text(
                          section[index],
                          style: const TextStyle(fontSize: 32),
                        ),
                      );
                    },
                    childCount: section.length,
                  ),
                ),
              )
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addData,
        tooltip: 'Add Data',
        child: const Icon(Icons.add),
      ),
    );
  }
}
