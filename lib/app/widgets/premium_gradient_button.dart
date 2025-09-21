import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class PremiumGradientButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final List<Color>? gradientColors;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? icon;
  final bool isLoading;
  final bool isDisabled;
  final TextStyle? textStyle;
  final bool hasGlow;
  final bool hasPulse;

  const PremiumGradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.gradientColors,
    this.borderRadius = 16.0,
    this.padding,
    this.margin,
    this.icon,
    this.isLoading = false,
    this.isDisabled = false,
    this.textStyle,
    this.hasGlow = true,
    this.hasPulse = false,
  });

  @override
  State<PremiumGradientButton> createState() => _PremiumGradientButtonState();
}

class _PremiumGradientButtonState extends State<PremiumGradientButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _pulseAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    if (widget.hasPulse) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    if (!widget.isDisabled && !widget.isLoading) {
      setState(() => _isPressed = true);
      if (!widget.hasPulse) _controller.forward();
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (!widget.isDisabled && !widget.isLoading) {
      setState(() => _isPressed = false);
      if (!widget.hasPulse) _controller.reverse();
    }
  }

  void _onTapCancel() {
    if (!widget.isDisabled && !widget.isLoading) {
      setState(() => _isPressed = false);
      if (!widget.hasPulse) _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = widget.gradientColors ?? AppColors.premiumGradient;
    final isInteractive = !widget.isDisabled && !widget.isLoading;

    Widget buttonChild = AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final scale =
            widget.hasPulse ? _pulseAnimation.value : _scaleAnimation.value;

        return Transform.scale(
          scale: scale,
          child: Container(
            width: widget.width,
            height: widget.height ?? 56,
            margin: widget.margin,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: widget.isDisabled
                    ? [Colors.grey.shade300, Colors.grey.shade400]
                    : colors,
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius),
              boxShadow: widget.hasGlow && isInteractive
                  ? [
                      BoxShadow(
                        color: colors.first.withOpacity(0.4),
                        blurRadius: _isPressed ? 10 : 20,
                        offset: Offset(0, _isPressed ? 5 : 10),
                        spreadRadius: _isPressed ? 0 : 2,
                      ),
                      BoxShadow(
                        color: colors.last.withOpacity(0.2),
                        blurRadius: _isPressed ? 5 : 15,
                        offset: Offset(0, _isPressed ? 2 : 5),
                      ),
                    ]
                  : [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: isInteractive ? widget.onPressed : null,
                borderRadius: BorderRadius.circular(widget.borderRadius),
                child: Container(
                  padding: widget.padding ??
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.isLoading)
                        Container(
                          width: 20,
                          height: 20,
                          margin: const EdgeInsets.only(right: 12),
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.textWhite,
                            ),
                          ),
                        )
                      else if (widget.icon != null) ...[
                        widget.icon!,
                        const SizedBox(width: 12),
                      ],
                      Text(
                        widget.text,
                        style: widget.textStyle ??
                            AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.textWhite,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: buttonChild,
    );
  }
}
