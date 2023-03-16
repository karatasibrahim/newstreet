import 'package:flutter_test/flutter_test.dart';
import 'package:newstreet_app/core/constants/enums/routes.dart';
import 'package:newstreet_app/core/constants/images/image_constants.dart';
import 'package:newstreet_app/screens/menu/model/menu_model.dart';

void main() {
  final MenuModel menu = MenuModel(
      title: "Menu Profile",
      image: ImageConstants.MENU_PROFILE,
      page: Pages.PROFILE);
  test('Is menu empty or not', () {
    expect(menu.title, "Menu Profile");
    expect(menu.image, ImageConstants.MENU_PROFILE);
    expect(menu.page, Pages.PROFILE);
  });

  test('Is menuList empty or not', () {
    expect(MenuModel.menuList.isEmpty, false);
  });
}
