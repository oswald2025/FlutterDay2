import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wallet',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 13, 13, 13),
          ),
        ),
        centerTitle: true, // Centre le titre dans l'AppBar
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ajouter un élément')),
              );
            },
            icon: const CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
      body: const Center(child: Text('Bienvenue dans votre Wallet!')),
    );
  }
}
