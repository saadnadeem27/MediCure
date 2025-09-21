import 'package:get/get.dart';
import 'package:medi_cure/features/splash/splash_screen.dart';
import 'package:medi_cure/features/auth/views/login_screen.dart';
import 'package:medi_cure/features/auth/views/signup_screen.dart';
import 'package:medi_cure/features/auth/views/forgot_password_screen.dart';
import 'package:medi_cure/features/auth/views/otp_verification_screen.dart';
import 'package:medi_cure/features/home/views/main_navigation_screen.dart';
import 'package:medi_cure/features/home/views/home_screen.dart';
import 'package:medi_cure/features/doctors/views/doctor_list_screen.dart';
import 'package:medi_cure/features/doctors/views/doctor_detail_screen.dart';
import 'package:medi_cure/features/appointments/views/book_appointment_screen.dart';
import 'package:medi_cure/features/appointments/views/appointment_list_screen.dart';
import 'package:medi_cure/features/chat/views/chat_list_screen.dart';
import 'package:medi_cure/features/chat/views/chat_detail_screen.dart';
import 'package:medi_cure/features/records/views/medical_records_screen.dart';
import 'package:medi_cure/features/profile/views/profile_screen.dart';
import 'app_routes.dart';

// Import controllers
import 'package:medi_cure/features/splash/splash_controller.dart';
import 'package:medi_cure/features/auth/controllers/auth_controller.dart';
import 'package:medi_cure/features/home/controllers/home_controller.dart';
import 'package:medi_cure/features/doctors/controllers/doctor_controller.dart';
import 'package:medi_cure/features/appointments/controllers/appointment_controller.dart';
import 'package:medi_cure/features/chat/controllers/chat_controller.dart';
import 'package:medi_cure/features/records/controllers/records_controller.dart';
import 'package:medi_cure/features/profile/controllers/profile_controller.dart';

class AppPages {
  static final routes = [
    // Splash & Onboarding
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SplashController>(() => SplashController());
      }),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // Authentication Routes
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AuthController>(() => AuthController());
      }),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AuthController>(() => AuthController());
      }),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AuthController>(() => AuthController());
      }),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    GetPage(
      name: AppRoutes.otpVerification,
      page: () => const OtpVerificationScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AuthController>(() => AuthController());
      }),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // Main Navigation
    GetPage(
      name: AppRoutes.mainNavigation,
      page: () => const MainNavigationScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<HomeController>(() => HomeController());
        Get.lazyPut<DoctorController>(() => DoctorController());
        Get.lazyPut<AppointmentController>(() => AppointmentController());
        Get.lazyPut<ChatController>(() => ChatController());
        Get.lazyPut<RecordsController>(() => RecordsController());
        Get.lazyPut<ProfileController>(() => ProfileController());
      }),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),

    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<HomeController>(() => HomeController());
      }),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // Doctor Routes
    GetPage(
      name: AppRoutes.doctorList,
      page: () => const DoctorListScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<DoctorController>(() => DoctorController());
      }),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    GetPage(
      name: AppRoutes.doctorDetail,
      page: () => const DoctorDetailScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<DoctorController>(() => DoctorController());
      }),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // Appointment Routes
    GetPage(
      name: AppRoutes.bookAppointment,
      page: () => const BookAppointmentScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AppointmentController>(() => AppointmentController());
      }),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    GetPage(
      name: AppRoutes.appointmentList,
      page: () => const AppointmentListScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AppointmentController>(() => AppointmentController());
      }),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // Chat Routes
    GetPage(
      name: AppRoutes.chatList,
      page: () => const ChatListScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ChatController>(() => ChatController());
      }),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    GetPage(
      name: AppRoutes.chatDetail,
      page: () => const ChatDetailScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ChatController>(() => ChatController());
      }),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // Medical Records Routes
    GetPage(
      name: AppRoutes.medicalRecords,
      page: () => const MedicalRecordsScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<RecordsController>(() => RecordsController());
      }),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // Profile Routes
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ProfileController>(() => ProfileController());
      }),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];

  static const String initial = AppRoutes.splash;
}
