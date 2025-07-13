// itens do cardápio: sanduíche, fritas ou refrigerante
enum ItemType { sandwich, fries, soda }

class Item {
  final String name;
  final double price;
  final ItemType type;

  Item({required this.name, required this.price, required this.type});
}
