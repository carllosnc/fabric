import 'package:flutter/material.dart';

class FabricSnackbar extends StatelessWidget {
  const FabricSnackbar({super.key});

  void _showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {},
          ),
          showCloseIcon: true,
          content: Text('This is a snackbar message'),
          duration: Duration(seconds: 2),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: FilledButton(
        onPressed: () => _showSnackbar(context),
        child: const Text('Show Snackbar'),
      ),
    );
  }
}
