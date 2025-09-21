import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../app/widgets/premium_cards.dart';
import '../../../app/widgets/premium_gradient_button.dart';
import '../../../app/routes/app_routes.dart';
import '../controllers/chat_controller.dart';

class ChatMessage {
  final String id;
  final String senderId;
  final String senderName;
  final String message;
  final DateTime timestamp;
  final bool isRead;
  final String type; // text, image, voice, video
  final String? attachmentUrl;

  ChatMessage({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.message,
    required this.timestamp,
    required this.isRead,
    required this.type,
    this.attachmentUrl,
  });
}

class ChatConversation {
  final String id;
  final String doctorName;
  final String specialty;
  final String hospital;
  final String lastMessage;
  final DateTime lastMessageTime;
  final int unreadCount;
  final bool isOnline;
  final String status; // available, busy, offline
  final String avatar;

  ChatConversation({
    required this.id,
    required this.doctorName,
    required this.specialty,
    required this.hospital,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.unreadCount,
    required this.isOnline,
    required this.status,
    required this.avatar,
  });
}

class ChatListScreen extends GetView<ChatController> {
  const ChatListScreen({super.key});

  List<ChatConversation> get _conversations => [
        ChatConversation(
          id: '1',
          doctorName: 'Dr. Sarah Johnson',
          specialty: 'Cardiologist',
          hospital: 'City Heart Center',
          lastMessage:
              'Your test results look normal. Please continue with your medication.',
          lastMessageTime: DateTime.now().subtract(const Duration(minutes: 5)),
          unreadCount: 2,
          isOnline: true,
          status: 'available',
          avatar: '',
        ),
        ChatConversation(
          id: '2',
          doctorName: 'Dr. Michael Chen',
          specialty: 'Dermatologist',
          hospital: 'Skin Care Clinic',
          lastMessage:
              'I\'ve reviewed your photos. Let\'s schedule a follow-up.',
          lastMessageTime: DateTime.now().subtract(const Duration(hours: 2)),
          unreadCount: 0,
          isOnline: false,
          status: 'busy',
          avatar: '',
        ),
        ChatConversation(
          id: '3',
          doctorName: 'Dr. Emily Davis',
          specialty: 'Pediatrician',
          hospital: 'Children\'s Hospital',
          lastMessage:
              'The fever should subside with the prescribed medication.',
          lastMessageTime: DateTime.now().subtract(const Duration(hours: 4)),
          unreadCount: 1,
          isOnline: true,
          status: 'available',
          avatar: '',
        ),
        ChatConversation(
          id: '4',
          doctorName: 'Dr. James Wilson',
          specialty: 'Orthopedic',
          hospital: 'Bone & Joint Center',
          lastMessage:
              'Your recovery is progressing well. Keep doing the exercises.',
          lastMessageTime: DateTime.now().subtract(const Duration(days: 1)),
          unreadCount: 0,
          isOnline: false,
          status: 'offline',
          avatar: '',
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
            // Premium App Bar with Search
            SliverAppBar(
              expandedHeight: 120,
              floating: false,
              pinned: true,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Messages',
                  style: AppTextStyles.h5.copyWith(
                    color: AppColors.textWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                background: Container(
                  decoration: BoxDecoration(
                    gradient: AppColors.cosmicLinearGradient,
                  ),
                ),
              ),
              actions: [
                PremiumIconButton(
                  icon: Icons.search,
                  onPressed: () => _showSearchDialog(context),
                  size: 45,
                ),
                const SizedBox(width: 8),
                PremiumIconButton(
                  icon: Icons.video_call,
                  onPressed: () => _startVideoCall(),
                  size: 45,
                  gradientColors: AppColors.healingGradient,
                ),
                const SizedBox(width: 16),
              ],
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    // Quick Actions
                    FadeInDown(
                      duration: const Duration(milliseconds: 800),
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildQuickAction(
                              'Emergency Call',
                              Icons.emergency,
                              AppColors.error,
                              () => _emergencyCall(),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildQuickAction(
                              'Find Doctor',
                              Icons.search,
                              AppColors.primaryBlue,
                              () => Get.toNamed(AppRoutes.doctorList),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Active Doctors (Online)
                    FadeInLeft(
                      duration: const Duration(milliseconds: 800),
                      delay: const Duration(milliseconds: 200),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Active Doctors',
                            style: AppTextStyles.h6.copyWith(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _conversations
                                  .where((c) => c.isOnline)
                                  .length,
                              itemBuilder: (context, index) {
                                final onlineDoctors = _conversations
                                    .where((c) => c.isOnline)
                                    .toList();
                                return Container(
                                  margin: const EdgeInsets.only(right: 16),
                                  child: _buildActiveDoctorCard(
                                      onlineDoctors[index]),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Recent Conversations
                    FadeInRight(
                      duration: const Duration(milliseconds: 800),
                      delay: const Duration(milliseconds: 400),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recent Conversations',
                            style: AppTextStyles.h6.copyWith(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'See All',
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.primaryBlue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Conversations List
                    ...List.generate(_conversations.length, (index) {
                      final conversation = _conversations[index];
                      return FadeInUp(
                        duration: const Duration(milliseconds: 800),
                        delay: Duration(milliseconds: 600 + (index * 100)),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          child: _buildConversationCard(conversation),
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
        onTap: () => _startNewChat(),
        child: const Icon(
          Icons.chat,
          color: AppColors.textWhite,
          size: 30,
        ),
      ),
    );
  }

  Widget _buildQuickAction(
      String title, IconData icon, Color color, VoidCallback onTap) {
    return GlassCard(
      onTap: onTap,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color, color.withOpacity(0.7)],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: AppColors.textWhite, size: 24),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildActiveDoctorCard(ChatConversation conversation) {
    return GestureDetector(
      onTap: () => _openChat(conversation),
      child: SizedBox(
        width: 80,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryLinearGradient,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryBlue.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.person,
                    color: AppColors.textWhite,
                    size: 30,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: conversation.status == 'available'
                          ? AppColors.success
                          : AppColors.warning,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.textWhite, width: 2),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              conversation.doctorName.split(' ').last,
              style: AppTextStyles.caption.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConversationCard(ChatConversation conversation) {
    return PremiumCard(
      onTap: () => _openChat(conversation),
      child: Row(
        children: [
          // Doctor Avatar with Status
          Stack(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  gradient: AppColors.secondaryLinearGradient,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(
                  Icons.person,
                  color: AppColors.textWhite,
                  size: 30,
                ),
              ),
              if (conversation.isOnline)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: conversation.status == 'available'
                          ? AppColors.success
                          : AppColors.warning,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.textWhite, width: 2),
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(width: 16),

          // Conversation Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        conversation.doctorName,
                        style: AppTextStyles.cardTitle.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      _formatTime(conversation.lastMessageTime),
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  conversation.specialty,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        conversation.lastMessage,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (conversation.unreadCount > 0)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryLinearGradient,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          conversation.unreadCount.toString(),
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.textWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // Action Buttons
          Column(
            children: [
              PremiumIconButton(
                icon: Icons.video_call,
                onPressed: () => _startVideoCall(),
                size: 40,
                gradientColors: AppColors.healingGradient,
              ),
              const SizedBox(height: 8),
              PremiumIconButton(
                icon: Icons.call,
                onPressed: () => _startVoiceCall(),
                size: 40,
                gradientColors: AppColors.secondaryLinearGradient.colors,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h';
    } else {
      return '${difference.inDays}d';
    }
  }

  void _showSearchDialog(BuildContext context) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        child: GlassCard(
          margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Search Doctors',
                style: AppTextStyles.h6.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search by name or specialty...',
                    prefixIcon: const Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              PremiumGradientButton(
                text: 'Search',
                onPressed: () => Get.back(),
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _startVideoCall() {
    // Navigate to video call screen
    Get.toNamed(AppRoutes.videoCall);
  }

  void _startVoiceCall() {
    // Start voice call
  }

  void _emergencyCall() {
    // Start emergency call
  }

  void _startNewChat() {
    // Navigate to doctor selection for new chat
    Get.toNamed(AppRoutes.doctorList);
  }

  void _openChat(ChatConversation conversation) {
    // Navigate to chat screen
    Get.toNamed(AppRoutes.chatDetail, arguments: conversation);
  }
}
