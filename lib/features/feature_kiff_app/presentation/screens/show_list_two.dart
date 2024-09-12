import 'package:flutter/material.dart';

class ShowListTwo extends StatelessWidget {
  const ShowListTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (canPop) {
        Navigator.pop(context);
      },
      canPop: false,
      child: const Center(
        child: Text('show list 2',style: TextStyle(color: Colors.white,fontSize: 20),),
      ),
    );
  }
}
