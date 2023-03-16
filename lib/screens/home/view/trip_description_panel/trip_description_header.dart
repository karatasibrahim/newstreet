import 'package:flutter/material.dart';
import 'package:newstreet_app/core/components/image/project_svg_image.dart';
import 'package:newstreet_app/core/constants/images/image_constants.dart';

class TripDescriptionHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Center(
        child: ProjectSVGImage(
          imagePath: ImageConstants.SLIDING_UP_PANEL_ICON,
        ),
      ),
    ]);
  }
}
