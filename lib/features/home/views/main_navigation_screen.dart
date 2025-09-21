import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../controllers/home_controller.dart';
import 'home_screen.dart';
import '../../doctors/views/doctor_list_screen.dart';
import '../../appointments/views/appointment_list_screen.dart';
import '../../chat/views/chat_list_screen.dart';
import '../../profile/views/profile_screen.dart';

class MainNavigationScreen extends GetView<HomeController> {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: IndexedStack(
            index: controller.selectedIndex.value,
            children: const [
              HomeScreen(),
              DoctorListScreen(),
              AppointmentListScreen(),
              ChatListScreen(),
              ProfileScreen(),
            ],
          ),
          bottomNavigationBar: Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: AppColors.glassLinearGradient,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryBlue.withOpacity(0.3),
                  blurRadius: 30,
                  offset: const Offset(0, 15),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.8),
                  blurRadius: 0,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: BottomNavigationBar(
                currentIndex: controller.selectedIndex.value,
                onTap: controller.changeTabIndex,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white.withOpacity(0.95),
                elevation: 0,
                selectedItemColor: AppColors.primaryBlue,
                unselectedItemColor: AppColors.textSecondary,
                selectedLabelStyle: AppTextStyles.tabLabel.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryBlue,
                ),
                unselectedLabelStyle: AppTextStyles.tabLabel,
                items: [
                  BottomNavigationBarItem(
                    icon: _buildNavIcon(Icons.home_outlined, 0),
                    activeIcon: _buildActiveNavIcon(Icons.home, 0),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: _buildNavIcon(Icons.local_hospital_outlined, 1),
                    activeIcon: _buildActiveNavIcon(Icons.local_hospital, 1),
                    label: 'Doctors',
                  ),
                  BottomNavigationBarItem(
                    icon: _buildNavIcon(Icons.calendar_today_outlined, 2),
                    activeIcon: _buildActiveNavIcon(Icons.calendar_today, 2),
                    label: 'Appointments',
                  ),
                  BottomNavigationBarItem(
                    icon: _buildNavIcon(Icons.chat_bubble_outline, 3),
                    activeIcon: _buildActiveNavIcon(Icons.chat_bubble, 3),
                    label: 'Chat',
                  ),
                  BottomNavigationBarItem(
                    icon: _buildNavIcon(Icons.person_outline, 4),
                    activeIcon: _buildActiveNavIcon(Icons.person, 4),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildNavIcon(IconData icon, int index) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Icon(
        icon,
        size: 24,
        color: AppColors.textSecondary,
      ),
    );
  }

  Widget _buildActiveNavIcon(IconData icon, int index) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: AppColors.primaryLinearGradient,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlue.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Icon(
        icon,
        size: 24,
        color: Colors.white,
      ),
    );
  }
}
