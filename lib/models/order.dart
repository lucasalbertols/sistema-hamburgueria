import 'item.dart';

// Representa um pedido completo com cliente e itens
class Order {
  final String customerName;
  final List<Item> items;

  Order({required this.customerName, required this.items});

  // Calcula o valor total antes do desconto
  double get total => items.fold(0, (sum, item) => sum + item.price);

  // Verifica regras e aplica o desconto correto
  double get discount {
    bool hasSandwich = items.any((item) => item.type == ItemType.sandwich);
    bool hasFries = items.any((item) => item.type == ItemType.fries);
    bool hasSoda = items.any((item) => item.type == ItemType.soda);

    if (hasSandwich && hasFries && hasSoda) {
      return 0.20;
    } else if (hasSandwich && hasSoda) {
      return 0.15;
    } else if (hasSandwich && hasFries) {
      return 0.10;
    }
    return 0.0;
  }

  // Valor com desconto aplicado
  double get totalWithDiscount => total * (1 - discount);
}
