import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../app/widgets/gradient_card.dart';
import '../../../app/widgets/search_text_field.dart';
import '../../../app/routes/app_routes.dart';
import '../controllers/doctor_controller.dart';

class Doctor {
  final String id;
  final String name;
  final String specialty;
  final String hospital;
  final double rating;
  final int experience;
  final String fees;
  final String image;
  final bool isAvailable;
  final String nextSlot;

  Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.hospital,
    required this.rating,
    required this.experience,
    required this.fees,
    required this.image,
    required this.isAvailable,
    required this.nextSlot,
  });
}

class DoctorListScreen extends GetView<DoctorController> {
  const DoctorListScreen({super.key});

  List<Doctor> get _doctors => [
        Doctor(
          id: '1',
          name: 'Dr. Sarah Johnson',
          specialty: 'Cardiologist',
          hospital: 'City Heart Center',
          rating: 4.9,
          experience: 12,
          fees: '\$150',
          image: '',
          isAvailable: true,
          nextSlot: '2:00 PM Today',
        ),
        Doctor(
          id: '2',
          name: 'Dr. Michael Chen',
          specialty: 'Dermatologist',
          hospital: 'Skin Care Clinic',
          rating: 4.8,
          experience: 8,
          fees: '\$120',
          image: '',
          isAvailable: true,
          nextSlot: '4:30 PM Today',
        ),
        Doctor(
          id: '3',
          name: 'Dr. Emily Davis',
          specialty: 'Pediatrician',
          hospital: 'Children\'s Hospital',
          rating: 4.9,
          experience: 15,
          fees: '\$100',
          image: '',
          isAvailable: false,
          nextSlot: '10:00 AM Tomorrow',
        ),
        Doctor(
          id: '4',
          name: 'Dr. James Wilson',
          specialty: 'Orthopedic',
          hospital: 'Bone & Joint Center',
          rating: 4.7,
          experience: 20,
          fees: '\$200',
          image: '',
          isAvailable: true,
          nextSlot: '11:15 AM Today',
        ),
        Doctor(
          id: '5',
          name: 'Dr. Lisa Thompson',
          specialty: 'Neurologist',
          hospital: 'Brain Institute',
          rating: 4.8,
          experience: 18,
          fees: '\$180',
          image: '',
          isAvailable: true,
          nextSlot: '3:45 PM Today',
        ),
      ];

  List<String> get _specialties => [
        'All',
        'Cardiologist',
        'Dermatologist',
        'Pediatrician',
        'Orthopedic',
        'Neurologist',
        'Dentist',
        'Gynecologist',
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Find Doctors',
          style: AppTextStyles.h5.copyWith(color: AppColors.textPrimary),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list),
            color: AppColors.textPrimary,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.backgroundLinearGradient,
        ),
        child: Column(
          children: [
            // Search Bar
            FadeInDown(
              duration: const Duration(milliseconds: 800),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SearchTextField(
                  hint: 'Search doctors, specialties...',
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mic, color: AppColors.primaryBlue),
                  ),
                ),
              ),
            ),

            // Specialties Filter
            FadeInLeft(
              duration: const Duration(milliseconds: 800),
              delay: const Duration(milliseconds: 200),
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _specialties.length,
                  itemBuilder: (context, index) {
                    final isSelected = index == 0;
                    return Container(
                      margin: const EdgeInsets.only(right: 12),
                      child: FilterChip(
                        selected: isSelected,
                        label: Text(_specialties[index]),
                        onSelected: (selected) {},
                        backgroundColor: AppColors.surface,
                        selectedColor: AppColors.primaryBlue,
                        labelStyle: AppTextStyles.chipText.copyWith(
                          color: isSelected
                              ? AppColors.textWhite
                              : AppColors.textPrimary,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Doctor List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: _doctors.length,
                itemBuilder: (context, index) {
                  final doctor = _doctors[index];
                  return FadeInUp(
                    duration: const Duration(milliseconds: 800),
                    delay: Duration(milliseconds: 400 + (index * 100)),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: GradientCard(
                        onTap: () => Get.toNamed(
                          AppRoutes.doctorDetail,
                          arguments: doctor,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                // Doctor Avatar
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    gradient: AppColors.primaryLinearGradient,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Icon(
                                    Icons.person,
                                    color: AppColors.textWhite,
                                    size: 40,
                                  ),
                                ),

                                const SizedBox(width: 16),

                                // Doctor Info
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              doctor.name,
                                              style: AppTextStyles.doctorName
                                                  .copyWith(
                                                color: AppColors.textPrimary,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: doctor.isAvailable
                                                  ? AppColors.success
                                                      .withOpacity(0.1)
                                                  : AppColors.warning
                                                      .withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Text(
                                              doctor.isAvailable
                                                  ? 'Available'
                                                  : 'Busy',
                                              style: AppTextStyles.caption
                                                  .copyWith(
                                                color: doctor.isAvailable
                                                    ? AppColors.success
                                                    : AppColors.warning,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        doctor.specialty,
                                        style: AppTextStyles.doctorSpecialty
                                            .copyWith(
                                          color: AppColors.primaryBlue,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        doctor.hospital,
                                        style: AppTextStyles.bodySmall.copyWith(
                                          color: AppColors.textSecondary,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: AppColors.warning,
                                            size: 16,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            doctor.rating.toString(),
                                            style:
                                                AppTextStyles.rating.copyWith(
                                              color: AppColors.textPrimary,
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          Icon(
                                            Icons.work_outline,
                                            color: AppColors.textSecondary,
                                            size: 16,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            '${doctor.experience} years',
                                            style:
                                                AppTextStyles.rating.copyWith(
                                              color: AppColors.textSecondary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 16),

                            // Bottom Info
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Next Available',
                                        style: AppTextStyles.caption.copyWith(
                                          color: AppColors.textSecondary,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        doctor.nextSlot,
                                        style: AppTextStyles.appointmentTime
                                            .copyWith(
                                          color: AppColors.primaryBlue,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Consultation Fee',
                                      style: AppTextStyles.caption.copyWith(
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      doctor.fees,
                                      style: AppTextStyles.price.copyWith(
                                        color: AppColors.primaryGreen,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
