import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

enum GradientCardType { primary, secondary, accent, glass }

class GradientCard extends StatelessWidget {
  final Widget child;
  final GradientCardType type;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double borderRadius;
  final VoidCallback? onTap;
  final bool showShadow;
  final double elevation;

  const GradientCard({
    super.key,
    required this.child,
    this.type = GradientCardType.primary,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius = 16,
    this.onTap,
    this.showShadow = true,
    this.elevation = 8,
  });

  @override
  Widget build(BuildContext context) {
    BoxDecoration decoration;

    switch (type) {
      case GradientCardType.primary:
        decoration = BoxDecoration(
          gradient: AppColors.cardLinearGradient,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: showShadow
              ? [
                  BoxShadow(
                    color: AppColors.shadowLight,
                    blurRadius: elevation,
                    offset: Offset(0, elevation / 2),
                  ),
                ]
              : null,
        );
        break;
      case GradientCardType.secondary:
        decoration = BoxDecoration(
          gradient: AppColors.secondaryLinearGradient,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: showShadow
              ? [
                  BoxShadow(
                    color: AppColors.shadowMedium,
                    blurRadius: elevation,
                    offset: Offset(0, elevation / 2),
                  ),
                ]
              : null,
        );
        break;
      case GradientCardType.accent:
        decoration = BoxDecoration(
          gradient: AppColors.accentLinearGradient,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: showShadow
              ? [
                  BoxShadow(
                    color: AppColors.shadowMedium,
                    blurRadius: elevation,
                    offset: Offset(0, elevation / 2),
                  ),
                ]
              : null,
        );
        break;
      case GradientCardType.glass:
        decoration = BoxDecoration(
          color: AppColors.glassPrimary,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: AppColors.glassSecondary,
            width: 1,
          ),
          boxShadow: showShadow
              ? [
                  BoxShadow(
                    color: AppColors.shadowLight,
                    blurRadius: elevation * 2,
                    offset: Offset(0, elevation),
                  ),
                ]
              : null,
        );
        break;
    }

    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: decoration,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            padding: padding ?? const EdgeInsets.all(16),
            child: child,
          ),
        ),
      ),
    );
  }
}

class HealthStatsCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final IconData icon;
  final Color iconColor;
  final VoidCallback? onTap;
  final String? subtitle;
  final Widget? trailing;

  const HealthStatsCard({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    required this.icon,
    required this.iconColor,
    this.onTap,
    this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GradientCard(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.cardSubtitle.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      value,
                      style: AppTextStyles.h4.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      unit,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle!,
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.textLight,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}

class QuickActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onTap;
  final GradientCardType type;

  const QuickActionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.onTap,
    this.type = GradientCardType.primary,
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = type != GradientCardType.primary
        ? AppColors.textWhite
        : AppColors.textPrimary;

    Color subtitleColor = type != GradientCardType.primary
        ? AppColors.textWhite.withOpacity(0.8)
        : AppColors.textSecondary;

    return GradientCard(
      type: type,
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: type != GradientCardType.primary
                  ? Colors.white.withOpacity(0.2)
                  : AppColors.primaryBlue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              icon,
              color: type != GradientCardType.primary
                  ? AppColors.textWhite
                  : AppColors.primaryBlue,
              size: 32,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: AppTextStyles.cardTitle.copyWith(
              color: textColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: AppTextStyles.cardSubtitle.copyWith(
              color: subtitleColor,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
