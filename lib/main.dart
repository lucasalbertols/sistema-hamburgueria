import 'pages/cart_page.dart';
import 'models/item.dart';
import 'models/order.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MenuPage(), debugShowCheckedModeBanner: false);
  }
}

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final List<Item> menu = [
    Item(name: 'X-Burger', price: 5.00, type: ItemType.sandwich),
    Item(name: 'X-Egg', price: 4.50, type: ItemType.sandwich),
    Item(name: 'X-Bacon', price: 7.00, type: ItemType.sandwich),
    Item(name: 'Batata Frita', price: 2.00, type: ItemType.fries),
    Item(name: 'Refrigerante', price: 2.50, type: ItemType.soda),
  ];

  List<Item> selectedItems = [];

  // Esta função tenta adicionar um item ao carrinho
  void addItem(Item item) {
    // Verifica se já existe um item do mesmo tipo (sanduíche, fritas ou refrigerante)
    bool alreadyExists = selectedItems.any((i) => i.type == item.type);

    if (alreadyExists) {
      // Se já tiver um item do mesmo tipo, exibe uma mensagem de erro na parte inferior da tela
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Você só pode adicionar um item de cada tipo!'),
          backgroundColor: Colors.red,
        ),
      );
      return; // Sai da função sem adicionar o item
    }

    // Se não tiver item do mesmo tipo, adiciona ao carrinho
    setState(() {
      selectedItems.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu')),
      body: ListView(
        children: menu.map((item) {
          return ListTile(
            title: Text(item.name),
            subtitle: Text('R\$ ${item.price.toStringAsFixed(2)}'),
            onTap: () => addItem(item),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(
                items: selectedItems,
                onOrderConfirmed: () {
                  setState(() {
                    selectedItems.clear(); // Limpa o carrinho
                  });
                },
              ),
            ),
          );
        },

        icon: Icon(Icons.shopping_cart),
        label: Text('${selectedItems.length}'), // apenas o número visível
      ),
    );
  }
}
