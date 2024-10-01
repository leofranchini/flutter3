import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulário Dinâmico',
      home: FormularioScreen(),
    );
  }
}

class FormularioScreen extends StatefulWidget {
  @override
  _FormularioScreenState createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {
  final List<String> _itens = [];
  final TextEditingController _controller = TextEditingController();

  void _adicionarItem() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _itens.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário Dinâmico'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Digite algo',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _adicionarItem,
            child: Text('Adicionar'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _itens.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_itens[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
