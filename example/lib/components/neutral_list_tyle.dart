import 'package:flutter/material.dart';

class NeutralListTile extends StatelessWidget {
  const NeutralListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.shopping_cart_outlined),
          trailing: Icon(Icons.keyboard_arrow_right),
          title: Text('Shopping Cart'),
          subtitle: Text('View your cart items'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.favorite_border_outlined),
          trailing: Icon(Icons.keyboard_arrow_right),
          title: Text('Wishlist'),
          subtitle: Text('Your saved items'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.history),
          trailing: Icon(Icons.keyboard_arrow_right),
          title: Text('Order History'),
          subtitle: Text('View past orders'),
          onTap: () {},
        ),
      ],
    );
  }
}
