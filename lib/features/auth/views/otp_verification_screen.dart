import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../app/widgets/gradient_button.dart';
import '../../../app/widgets/custom_text_field.dart';
import '../controllers/auth_controller.dart';

class OtpVerificationScreen extends GetView<AuthController> {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    final email = Get.arguments as String? ?? '';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.backgroundLinearGradient,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                // Back Button
                FadeInLeft(
                  duration: const Duration(milliseconds: 600),
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),

                const SizedBox(height: 60),

                // Header
                FadeInDown(
                  duration: const Duration(milliseconds: 800),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            gradient: AppColors.primaryLinearGradient,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: const [
                              BoxShadow(
                                color: AppColors.shadowMedium,
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.mail_outline,
                            color: AppColors.textWhite,
                            size: 50,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Verify Your Email',
                          style: AppTextStyles.h2.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: AppTextStyles.bodyLarge.copyWith(
                                color: AppColors.textSecondary,
                              ),
                              children: [
                                const TextSpan(
                                  text: 'We\'ve sent a verification code to\n',
                                ),
                                TextSpan(
                                  text: email,
                                  style: AppTextStyles.bodyLarge.copyWith(
                                    color: AppColors.primaryBlue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 60),

                // OTP Input
                FadeInUp(
                  duration: const Duration(milliseconds: 800),
                  delay: const Duration(milliseconds: 400),
                  child: OTPTextField(
                    length: 6,
                    onCompleted: (otp) {
                      controller.verifyOTP(otp);
                    },
                    onChanged: (otp) {
                      // Handle OTP change if needed
                    },
                  ),
                ),

                const SizedBox(height: 40),

                // Verify Button
                FadeInUp(
                  duration: const Duration(milliseconds: 800),
                  delay: const Duration(milliseconds: 600),
                  child: Obx(() => GradientButton(
                        text: 'Verify Code',
                        onPressed: controller.isLoading.value
                            ? null
                            : () {
                                // This will be handled by OTPTextField onCompleted
                              },
                        isLoading: controller.isLoading.value,
                        width: double.infinity,
                      )),
                ),

                const SizedBox(height: 30),

                // Resend Code
                FadeInUp(
                  duration: const Duration(milliseconds: 800),
                  delay: const Duration(milliseconds: 800),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Didn\'t receive the code?',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextButton(
                          onPressed: () {
                            // Implement resend functionality
                            Get.snackbar(
                              'Code Sent',
                              'Verification code has been resent to your email.',
                              backgroundColor: AppColors.success,
                              colorText: AppColors.textWhite,
                              snackPosition: SnackPosition.TOP,
                            );
                          },
                          child: Text(
                            'Resend Code',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.primaryBlue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Timer (Optional)
                FadeInUp(
                  duration: const Duration(milliseconds: 800),
                  delay: const Duration(milliseconds: 1000),
                  child: Center(
                    child: Text(
                      'Code expires in 05:00',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.textLight,
                      ),
                    ),
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
