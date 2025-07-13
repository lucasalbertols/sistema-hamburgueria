import 'package:flutter/material.dart';
import '../models/item.dart';
import '../models/order.dart';
import '../db/database_helper.dart';

class CartPage extends StatefulWidget {
  final List<Item> items;

  final VoidCallback? onOrderConfirmed; // ✅ nova função de callback

  const CartPage({
    Key? key,
    required this.items,
    this.onOrderConfirmed, // ✅ recebe função
  }) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final order = Order(
      customerName: _nameController.text,
      items: widget.items,
    );

    return Scaffold(
      appBar: AppBar(title: Text('Carrinho')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo para nome
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome do cliente',
                border: OutlineInputBorder(),
              ),
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 20),

            // Lista de itens em um Expanded (para permitir rolagem)
            Expanded(
              child: ListView.builder(
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  final Item item =
                      widget.items[index]; // 👈 força o Dart a tratar como Item

                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text('R\$ ${item.price.toStringAsFixed(2)}'),
                  );
                },
              ),
            ),

            // Totais
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total sem desconto: R\$ ${order.total.toStringAsFixed(2)}',
                  ),
                  Text('Desconto: ${order.discount * 100}%'),
                  Text(
                    'Total com desconto: R\$ ${order.totalWithDiscount.toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Botão
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_nameController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Por favor, informe o nome do cliente.'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  //salva o pedido no bando de dados
                  DatabaseHelper.instance.insertOrder(order);

                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Pedido Confirmado'),
                      content: Text(
                        'Obrigado, ${_nameController.text}!\n\n'
                        'Valor final: R\$ ${order.totalWithDiscount.toStringAsFixed(2)}',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            widget.onOrderConfirmed
                                ?.call(); // ✅ dispara a função de limpar carrinho
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text('Finalizar Pedido'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
