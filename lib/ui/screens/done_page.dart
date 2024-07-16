import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DonePage extends StatefulWidget {
  const DonePage({super.key});

  @override
  State<DonePage> createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> {
  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/lottie.json');
  }
}