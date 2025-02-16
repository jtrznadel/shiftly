import 'dart:ui';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shiftly/core/common/app/widgets/heading.dart';
import 'package:shiftly/core/common/constants/app_paddings.dart';
import 'package:shiftly/core/common/extensions/context_extension.dart';
import 'package:shiftly/core/styles/app_colors.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.pagePadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Witaj, ',
                        style: context.textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: 'Jakub!',
                            style: context.textTheme.labelLarge?.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {}, icon: Icon(LucideIcons.bellRing))
                  ],
                ),
                Heading(title: 'Dzisiejsza zmiana'),
                ShiftTile(
                  hours: '6:00-14:00',
                  position: 'Frezarka',
                  shiftType: 'Dzienny',
                  color: AppColors.dayShiftColor,
                  icon: Icon(
                    LucideIcons.bird,
                    color: AppColors.surfaceColor,
                    size: 48,
                  ),
                ),
                ShiftTile(
                  hours: '14:00-22:00',
                  position: 'Wtryskarka',
                  shiftType: 'Dzienny',
                  color: AppColors.eveningShiftColor,
                  icon: Icon(
                    LucideIcons.sunMedium,
                    color: AppColors.surfaceColor,
                    size: 48,
                  ),
                ),
                ShiftTile(
                  hours: '22:00-6:00',
                  position: 'Spawarka',
                  shiftType: 'Dzienny',
                  color: AppColors.nightShiftColor,
                  icon: Icon(
                    LucideIcons.moon,
                    color: AppColors.surfaceColor,
                    size: 48,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShiftTile extends StatelessWidget {
  final String shiftType;
  final String hours;
  final String position;
  final Color color;
  final Icon icon;

  const ShiftTile({
    required this.shiftType,
    required this.hours,
    required this.position,
    super.key,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.surfaceColor, color.withValues(alpha: 0.9)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                spacing: 6,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(hours, style: context.textTheme.headlineLarge),
                      icon,
                    ],
                  ),
                  Text(position, style: context.textTheme.titleLarge),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Współpracownicy:',
                          style: context.textTheme.titleLarge),
                      Row(
                        spacing: 6,
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.secondaryColor,
                            radius: 20,
                            child: Text('GR'),
                          ),
                          CircleAvatar(
                            backgroundColor: AppColors.secondaryColor,
                            radius: 20,
                            child: Text('MI'),
                          ),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Stack(
                    children: [
                      Container(
                        height: 16,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.backgroundColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        height: 16,
                        width: 100,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
