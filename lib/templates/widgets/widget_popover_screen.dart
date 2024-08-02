import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:provider/provider.dart';

import '../../core/constants/enums/type_enums.dart';
import '../../core/themes/app_theme.dart';
import '../../core/widgets/button_widget.dart';
import '../../core/widgets/card_widget.dart';
import '../../core/widgets/popover_widget.dart';
import '../../routes/base/icon_profile_widget.dart';
import '../../routes/items/profile_item.dart';
import '../../screens/auth/providers/auth_app_provider.dart';

class WidgetPopoverScreen extends StatelessWidget {
  const WidgetPopoverScreen({super.key});

  static const String path = '/widgets/widget-popover';
  static const String name = 'Popover Widget';
  static const String category = 'Widgets';
  static const IconData icon = Icons.info_rounded;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: AppTheme.geometry.medium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Popover Widgets",
              style: AppTheme.typography.displayMedium,
            ),
            AppTheme.spacing.customY(24),
            CardWidget.basic(
              title: "Popover Sample",
              children: [
                Builder(builder: (context) {
                  return Wrap(
                    spacing: 24,
                    runSpacing: 8,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      ButtonWidget.ractangle(
                        text: "Popover Info",
                        type: ButtonType.primary,
                        onPressed: () {
                          PopoverWidget.cardInfo(
                            context: context,
                            title: "Help information",
                            contentHeight: 140,
                            direction: PopoverDirection.right,
                            description: "This is a sample description for the popover widget.",
                          );
                        },
                      ),
                      Consumer<AuthAppProvider>(builder: (_, auth, __) {
                        return IconProfileWidget(
                          heightItemMenu: 225,
                          profileIcon: Container(
                            padding: AppTheme.geometry.small,
                            decoration: BoxDecoration(
                              color: AppTheme.colors.primary,
                              borderRadius: AppTheme.radius.circle,
                            ),
                            child: const Icon(
                              Icons.person,
                              size: 32,
                              color: Colors.white,
                            ),
                          ),
                          items: [
                            ProfileItem(
                              icon: Icons.person_outline_rounded,
                              name: 'Profile',
                              onTap: () {},
                            ),
                            ProfileItem(
                              icon: Icons.contact_phone_outlined,
                              name: 'My Contacts',
                              onTap: () {},
                            ),
                            ProfileItem(
                              icon: Icons.settings_outlined,
                              name: 'Settings',
                              onTap: () {},
                            ),
                            ProfileItem(
                              icon: Icons.logout_outlined,
                              name: 'Logout',
                              onTap: () {},
                            ),
                          ],
                        );
                      }),
                    ],
                  );
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
