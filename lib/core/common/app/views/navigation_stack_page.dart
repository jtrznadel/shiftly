import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shiftly/core/routing/app_router.dart';
import 'package:shiftly/core/styles/app_colors.dart';

@RoutePage()
class NavigationStackPage extends StatelessWidget {
  const NavigationStackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = context.tabsRouter;
        return Scaffold(
          backgroundColor: AppColors.surfaceColor,
          body: child,
          bottomNavigationBar: AppNavigationBottomBar(
            tabsRouter: tabsRouter,
          ),
        );
      },
    );
  }
}

class AppNavigationBottomBar extends StatelessWidget {
  const AppNavigationBottomBar({super.key, required this.tabsRouter});

  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        color: AppColors.surfaceColor,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavigationBarItem(
              iconData: LucideIcons.house,
              onPressed: () => tabsRouter.setActiveIndex(0),
              iconColor: tabsRouter.activeIndex == 0
                  ? AppColors.primaryColor
                  : AppColors.textPrimary,
            ),
            NavigationBarItem(
              iconData: LucideIcons.calendar,
              onPressed: () => tabsRouter.setActiveIndex(1),
              iconColor: tabsRouter.activeIndex == 1
                  ? AppColors.primaryColor
                  : AppColors.textPrimary,
            ),
            NavigationBarItem(
              iconData: LucideIcons.userRound,
              onPressed: () => tabsRouter.setActiveIndex(2),
              iconColor: tabsRouter.activeIndex == 2
                  ? AppColors.primaryColor
                  : AppColors.textPrimary,
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.iconData,
    required this.onPressed,
    required this.iconColor,
  });

  final IconData iconData;
  final VoidCallback onPressed;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 64,
          maxWidth: 64,
        ),
        child: AspectRatio(
          aspectRatio: 1,
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              iconData,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
