import 'package:flutter/material.dart';
import '../api/api_service.dart';
import 'products_screen.dart';

class ConfirmEmailScreen extends StatefulWidget {
  final String email;

  ConfirmEmailScreen({required this.email});

  @override
  _ConfirmEmailScreenState createState() => _ConfirmEmailScreenState();
}

class _ConfirmEmailScreenState extends State<ConfirmEmailScreen> {
  final TextEditingController _codeController = TextEditingController();
  bool _isLoading = false;

  void _confirmEmail() async {
    setState(() => _isLoading = true);

    bool success = await ApiService().confirmEmail(widget.email, _codeController.text.trim());

    setState(() => _isLoading = false);

    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProductsScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Código incorrecto")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Confirmar Email")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Ingresa el código de confirmación enviado a ${widget.email}"),
            TextField(
              controller: _codeController,
              decoration: InputDecoration(labelText: "Código"),
            ),
            SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: _confirmEmail,
              child: Text("Confirmar"),
            ),
          ],
        ),
      ),
    );
  }
}
