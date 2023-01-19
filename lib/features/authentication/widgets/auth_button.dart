import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final FaIcon icon;
  final Widget button;
  const AuthButton({
    super.key,
    required this.text,
    required this.icon,
    required this.button,
  });
  //  this는 이 메소드  (text) 가 포함된 object (AuthButton) 를 가리킨다.
  //  https://velog.io/@zinukk/%EB%B0%94%EC%9D%B8%EB%94%A9

  void buttonClick(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => button,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => buttonClick(context),
      child: FractionallySizedBox(
        widthFactor: 1,
        // widthFactor 1 = father 100%, 0.5 = father 50%
        child: Container(
          padding: const EdgeInsets.all(
            Sizes.size14,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade200,
              width: Sizes.size1,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: icon,
              ),
              Text(
                text,
                style: const TextStyle(
                  fontSize: Sizes.size14,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
