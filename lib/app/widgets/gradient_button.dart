import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

enum GradientButtonType { primary, secondary, accent }

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final GradientButtonType type;
  final double? width;
  final double? height;
  final IconData? icon;
  final bool isLoading;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;

  const GradientButton({
    super.key,
    required this.text,
    this.onPressed,
    this.type = GradientButtonType.primary,
    this.width,
    this.height,
    this.icon,
    this.isLoading = false,
    this.borderRadius = 12,
    this.padding,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    LinearGradient gradient;

    switch (type) {
      case GradientButtonType.primary:
        gradient = AppColors.primaryLinearGradient;
        break;
      case GradientButtonType.secondary:
        gradient = AppColors.secondaryLinearGradient;
        break;
      case GradientButtonType.accent:
        gradient = AppColors.accentLinearGradient;
        break;
    }

    return Container(
      width: width,
      height: height ?? 56,
      decoration: BoxDecoration(
        gradient: onPressed != null ? gradient : null,
        color: onPressed == null ? AppColors.grey300 : null,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: onPressed != null
            ? [
                BoxShadow(
                  color: AppColors.shadowMedium,
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isLoading ? null : onPressed,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            padding: padding ??
                const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Center(
              child: isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: AppColors.textWhite,
                        strokeWidth: 2,
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (icon != null) ...[
                          Icon(
                            icon,
                            color: AppColors.textWhite,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                        ],
                        Text(
                          text,
                          style: textStyle ??
                              AppTextStyles.buttonMedium.copyWith(
                                color: onPressed != null
                                    ? AppColors.textWhite
                                    : AppColors.textSecondary,
                              ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class OutlineGradientButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final GradientButtonType type;
  final double? width;
  final double? height;
  final IconData? icon;
  final bool isLoading;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final double borderWidth;

  const OutlineGradientButton({
    super.key,
    required this.text,
    this.onPressed,
    this.type = GradientButtonType.primary,
    this.width,
    this.height,
    this.icon,
    this.isLoading = false,
    this.borderRadius = 12,
    this.padding,
    this.textStyle,
    this.borderWidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor;
    Color textColor;

    switch (type) {
      case GradientButtonType.primary:
        borderColor = AppColors.primaryBlue;
        textColor = AppColors.primaryBlue;
        break;
      case GradientButtonType.secondary:
        borderColor = AppColors.primaryGreen;
        textColor = AppColors.primaryGreen;
        break;
      case GradientButtonType.accent:
        borderColor = AppColors.primaryPurple;
        textColor = AppColors.primaryPurple;
        break;
    }

    return Container(
      width: width,
      height: height ?? 56,
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(
          color: onPressed != null ? borderColor : AppColors.grey300,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: onPressed != null
            ? [
                BoxShadow(
                  color: AppColors.shadowLight,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isLoading ? null : onPressed,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            padding: padding ??
                const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Center(
              child: isLoading
                  ? SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: textColor,
                        strokeWidth: 2,
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (icon != null) ...[
                          Icon(
                            icon,
                            color: onPressed != null
                                ? textColor
                                : AppColors.textSecondary,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                        ],
                        Text(
                          text,
                          style: textStyle ??
                              AppTextStyles.buttonMedium.copyWith(
                                color: onPressed != null
                                    ? textColor
                                    : AppColors.textSecondary,
                              ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
