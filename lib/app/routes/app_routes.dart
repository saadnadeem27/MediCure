class AppRoutes {
  // Authentication Routes
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';
  static const String otpVerification = '/otp-verification';
  static const String resetPassword = '/reset-password';

  // Main Routes
  static const String home = '/home';
  static const String mainNavigation = '/main-navigation';

  // Doctor Routes
  static const String doctorList = '/doctors';
  static const String doctorDetail = '/doctor-detail';
  static const String doctorSearch = '/doctor-search';
  static const String doctorFilter = '/doctor-filter';

  // Appointment Routes
  static const String bookAppointment = '/book-appointment';
  static const String appointmentList = '/appointments';
  static const String appointmentDetail = '/appointment-detail';
  static const String rescheduleAppointment = '/reschedule-appointment';

  // Chat Routes
  static const String chatList = '/chat-list';
  static const String chatDetail = '/chat-detail';
  static const String videoCall = '/video-call';

  // Medical Records Routes
  static const String medicalRecords = '/medical-records';
  static const String recordDetail = '/record-detail';
  static const String uploadRecord = '/upload-record';
  static const String prescription = '/prescription';

  // Profile Routes
  static const String profile = '/profile';
  static const String editProfile = '/edit-profile';
  static const String settings = '/settings';
  static const String notifications = '/notifications';

  // Payment Routes
  static const String payment = '/payment';
  static const String paymentHistory = '/payment-history';
  static const String paymentSuccess = '/payment-success';
  static const String paymentFailed = '/payment-failed';

  // Emergency Routes
  static const String emergency = '/emergency';
  static const String nearbyHospitals = '/nearby-hospitals';

  // Admin Routes (for admin users)
  static const String adminDashboard = '/admin-dashboard';
  static const String manageUsers = '/manage-users';
  static const String manageDoctors = '/manage-doctors';
  static const String analytics = '/analytics';

  // Common Routes
  static const String search = '/search';
  static const String help = '/help';
  static const String about = '/about';
  static const String termsAndConditions = '/terms-and-conditions';
  static const String privacyPolicy = '/privacy-policy';
}
