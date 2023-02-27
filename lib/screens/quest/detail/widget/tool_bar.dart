import 'package:flutter/material.dart';

class ToolBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 30),
        ElevatedButton.icon(
          onPressed: () => navigateToStatus(context),
          icon: const Icon(Icons.all_inbox, color: Colors.black, size: 20),
          label: const Text(
            'Status',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: "Nunito",
              fontWeight: FontWeight.w700,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        const SizedBox(width: 100),
        FloatingActionButton.small(
          backgroundColor: Colors.white,
          onPressed: () => {},
          child: const Icon(Icons.search, color: Colors.black, size: 20),
        ),
        FloatingActionButton.small(
          backgroundColor: Colors.white,
          onPressed: () => {},
          child: const Icon(Icons.sort, color: Colors.black, size: 20),
        ),
        FloatingActionButton.small(
          backgroundColor: Colors.white,
          onPressed: () => {},
          child: const Icon(Icons.alarm, color: Colors.black, size: 20),
        ),
      ],
    );
  }
}

Future<void> navigateToStatus(context) async {
  Navigator.pushNamed(context, '/quest/status');
}
