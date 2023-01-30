import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';

class InterestButton extends StatefulWidget {
  const InterestButton({
    Key? key,
    required this.interest,
  }) : super(key: key);

  final String interest;

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  bool _isSelected = false;
  void _onSelected() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onSelected,
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size12,
          horizontal: Sizes.size24,
        ),
        decoration: BoxDecoration(
            color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(Sizes.size32),
            border: Border.all(
              color: Colors.black.withOpacity(0.1),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 5,
                spreadRadius: 5,
              )
            ]),
        child: Text(
          widget.interest,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: _isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
