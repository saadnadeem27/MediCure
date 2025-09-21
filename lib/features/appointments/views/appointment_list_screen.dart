import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../app/widgets/premium_cards.dart';
import '../../../app/widgets/premium_gradient_button.dart';
import '../controllers/appointment_controller.dart';

class Appointment {
  final String id;
  final String doctorName;
  final String specialty;
  final String hospital;
  final DateTime dateTime;
  final String status; // scheduled, completed, cancelled, rescheduled
  final String type; // consultation, checkup, surgery
  final String fees;
  final String image;

  Appointment({
    required this.id,
    required this.doctorName,
    required this.specialty,
    required this.hospital,
    required this.dateTime,
    required this.status,
    required this.type,
    required this.fees,
    required this.image,
  });
}

class AppointmentListScreen extends GetView<AppointmentController> {
  const AppointmentListScreen({super.key});

  List<Appointment> get _appointments => [
        Appointment(
          id: '1',
          doctorName: 'Dr. Sarah Johnson',
          specialty: 'Cardiologist',
          hospital: 'City Heart Center',
          dateTime: DateTime.now().add(const Duration(days: 1, hours: 2)),
          status: 'scheduled',
          type: 'consultation',
          fees: '\$150',
          image: '',
        ),
        Appointment(
          id: '2',
          doctorName: 'Dr. Michael Chen',
          specialty: 'Dermatologist',
          hospital: 'Skin Care Clinic',
          dateTime: DateTime.now().add(const Duration(days: 3, hours: 4)),
          status: 'scheduled',
          type: 'checkup',
          fees: '\$120',
          image: '',
        ),
        Appointment(
          id: '3',
          doctorName: 'Dr. Emily Davis',
          specialty: 'Pediatrician',
          hospital: 'Children\'s Hospital',
          dateTime: DateTime.now().subtract(const Duration(days: 2)),
          status: 'completed',
          type: 'consultation',
          fees: '\$100',
          image: '',
        ),
        Appointment(
          id: '4',
          doctorName: 'Dr. James Wilson',
          specialty: 'Orthopedic',
          hospital: 'Bone & Joint Center',
          dateTime: DateTime.now().add(const Duration(days: 7, hours: 1)),
          status: 'scheduled',
          type: 'surgery',
          fees: '\$500',
          image: '',
        ),
        Appointment(
          id: '5',
          doctorName: 'Dr. Lisa Thompson',
          specialty: 'Neurologist',
          hospital: 'Brain Institute',
          dateTime: DateTime.now().subtract(const Duration(days: 5)),
          status: 'cancelled',
          type: 'consultation',
          fees: '\$180',
          image: '',
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.backgroundLinearGradient,
        ),
        child: CustomScrollView(
          slivers: [
            // Premium App Bar
            SliverAppBar(
              expandedHeight: 120,
              floating: false,
              pinned: true,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Appointments',
                  style: AppTextStyles.h5.copyWith(
                    color: AppColors.textWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                background: Container(
                  decoration: BoxDecoration(
                    gradient: AppColors.ultraLinearGradient,
                  ),
                ),
              ),
              actions: [
                PremiumIconButton(
                  icon: Icons.calendar_month,
                  onPressed: () => _showCalendarDialog(context),
                  size: 45,
                ),
                const SizedBox(width: 8),
                PremiumIconButton(
                  icon: Icons.filter_list,
                  onPressed: () => _showFilterDialog(context),
                  size: 45,
                ),
                const SizedBox(width: 16),
              ],
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    // Quick Stats
                    FadeInDown(
                      duration: const Duration(milliseconds: 800),
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildStatCard(
                              'Total',
                              _appointments.length.toString(),
                              AppColors.primaryBlue,
                              Icons.event_note,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildStatCard(
                              'Upcoming',
                              _appointments
                                  .where((a) =>
                                      a.status == 'scheduled' &&
                                      a.dateTime.isAfter(DateTime.now()))
                                  .length
                                  .toString(),
                              AppColors.primaryGreen,
                              Icons.schedule,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildStatCard(
                              'Completed',
                              _appointments
                                  .where((a) => a.status == 'completed')
                                  .length
                                  .toString(),
                              AppColors.medicalGreen,
                              Icons.check_circle,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Filter Tabs
                    FadeInLeft(
                      duration: const Duration(milliseconds: 800),
                      delay: const Duration(milliseconds: 200),
                      child: _buildFilterTabs(),
                    ),

                    const SizedBox(height: 24),

                    // Appointments List
                    ...List.generate(_appointments.length, (index) {
                      final appointment = _appointments[index];
                      return FadeInUp(
                        duration: const Duration(milliseconds: 800),
                        delay: Duration(milliseconds: 400 + (index * 100)),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          child: _buildAppointmentCard(appointment),
                        ),
                      );
                    }),

                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingCard(
        width: 70,
        height: 70,
        onTap: () => Get.snackbar('Doctors', 'Opening doctors list...'),
        child: const Icon(
          Icons.add,
          color: AppColors.textWhite,
          size: 30,
        ),
      ),
    );
  }

  Widget _buildStatCard(
      String title, String value, Color color, IconData icon) {
    return GlassCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color, color.withOpacity(0.7)],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.textWhite, size: 24),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: AppTextStyles.h5.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: AppTextStyles.caption.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTabs() {
    final filters = ['All', 'Upcoming', 'Completed', 'Cancelled'];
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final isSelected = index == 0;
          return Container(
            margin: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  gradient: isSelected ? AppColors.primaryLinearGradient : null,
                  color: isSelected ? null : AppColors.surface,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: isSelected
                        ? Colors.transparent
                        : AppColors.textSecondary.withOpacity(0.2),
                  ),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: AppColors.primaryBlue.withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ]
                      : null,
                ),
                child: Text(
                  filters[index],
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: isSelected
                        ? AppColors.textWhite
                        : AppColors.textPrimary,
                    fontWeight:
                        isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAppointmentCard(Appointment appointment) {
    final isUpcoming = appointment.dateTime.isAfter(DateTime.now()) &&
        appointment.status == 'scheduled';
    final statusColor = _getStatusColor(appointment.status);

    return PremiumCard(
      onTap: () => _showAppointmentDetails(appointment),
      child: Column(
        children: [
          Row(
            children: [
              // Doctor Avatar
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [statusColor, statusColor.withOpacity(0.7)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.person,
                  color: AppColors.textWhite,
                  size: 35,
                ),
              ),

              const SizedBox(width: 16),

              // Appointment Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            appointment.doctorName,
                            style: AppTextStyles.doctorName.copyWith(
                              color: AppColors.textPrimary,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: statusColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: statusColor.withOpacity(0.3),
                            ),
                          ),
                          child: Text(
                            appointment.status.toUpperCase(),
                            style: AppTextStyles.caption.copyWith(
                              color: statusColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${appointment.specialty} • ${appointment.type}',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      appointment.hospital,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Date, Time & Actions
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 16,
                          color: AppColors.textSecondary,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          _formatDate(appointment.dateTime),
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 16,
                          color: AppColors.textSecondary,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          _formatTime(appointment.dateTime),
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (isUpcoming) ...[
                PremiumGradientButton(
                  text: 'Reschedule',
                  onPressed: () => _rescheduleAppointment(appointment),
                  width: 100,
                  height: 36,
                  gradientColors: AppColors.healingGradient,
                  borderRadius: 18,
                  textStyle: AppTextStyles.caption.copyWith(
                    color: AppColors.textWhite,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8),
                PremiumGradientButton(
                  text: 'Cancel',
                  onPressed: () => _cancelAppointment(appointment),
                  width: 80,
                  height: 36,
                  gradientColors: [
                    AppColors.error,
                    AppColors.error.withOpacity(0.7)
                  ],
                  borderRadius: 18,
                  textStyle: AppTextStyles.caption.copyWith(
                    color: AppColors.textWhite,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ] else if (appointment.status == 'completed') ...[
                PremiumGradientButton(
                  text: 'View Report',
                  onPressed: () {},
                  width: 120,
                  height: 36,
                  gradientColors: AppColors.medicalGradient,
                  borderRadius: 18,
                  textStyle: AppTextStyles.caption.copyWith(
                    color: AppColors.textWhite,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'scheduled':
        return AppColors.primaryBlue;
      case 'completed':
        return AppColors.success;
      case 'cancelled':
        return AppColors.error;
      case 'rescheduled':
        return AppColors.warning;
      default:
        return AppColors.textSecondary;
    }
  }

  String _formatDate(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final appointmentDate =
        DateTime(dateTime.year, dateTime.month, dateTime.day);

    if (appointmentDate == today) {
      return 'Today';
    } else if (appointmentDate == today.add(const Duration(days: 1))) {
      return 'Tomorrow';
    } else if (appointmentDate == today.subtract(const Duration(days: 1))) {
      return 'Yesterday';
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }

  String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour;
    final minute = dateTime.minute;
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '${displayHour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';
  }

  void _showCalendarDialog(BuildContext context) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        child: GlassCard(
          margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Calendar View',
                style: AppTextStyles.h6.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TableCalendar(
                firstDay: DateTime.utc(2024, 1, 1),
                lastDay: DateTime.utc(2025, 12, 31),
                focusedDay: DateTime.now(),
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                ),
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                    gradient: AppColors.primaryLinearGradient,
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: AppColors.primaryBlue.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              PremiumGradientButton(
                text: 'Close',
                onPressed: () => Get.back(),
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    // Filter dialog implementation
  }

  void _showAppointmentDetails(Appointment appointment) {
    // Show appointment details
  }

  void _rescheduleAppointment(Appointment appointment) {
    // Reschedule appointment
  }

  void _cancelAppointment(Appointment appointment) {
    // Cancel appointment
  }
}
