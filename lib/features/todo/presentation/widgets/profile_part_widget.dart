import 'package:flutter/material.dart';
class ProfilePartWidget extends StatelessWidget {
  const ProfilePartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: MediaQuery.sizeOf(context).height / 2.30,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          color: Colors.amber,
        ),
        child: const Column(
          children: [],
        ),
      ),
      const Positioned(
        left: -5,
        top: -90,
        child: CircleAvatar(
          radius: 90,
          backgroundColor: Colors.black26,
        ),
      ),
      const Positioned(
        left: -90,
        top: -5,
        child: CircleAvatar(
          radius: 90,
          backgroundColor: Colors.black26,
        ),
      )
    ]);
  }
}
