import 'package:flutter/material.dart';
import 'package:newstreet_app/core/constants/images/image_constants.dart';
import 'package:newstreet_app/core/extensions/context/project_context_extension.dart';

class FacebookLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicWidth(50),
      height: context.dynamicWidth(50),
      child: Image.asset(
        ImageConstants.FACEBOOK_LOGIN_IMAGE,
        fit: BoxFit.fill,
      ),
    );
  }
}
