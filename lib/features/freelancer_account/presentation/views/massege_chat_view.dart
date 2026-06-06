import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/inbox_cubit.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/inbox_state.dart';

class MessageChatView extends StatefulWidget {
  const MessageChatView({super.key});

  @override
  State<MessageChatView> createState() => _MessageChatViewState();
}

class _MessageChatViewState extends State<MessageChatView> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> _messages = [
    {
      'text': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
      'isSender': false,
    },
    {
      'text': 'lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dumt',
      'isSender': true,
    },
    {
      'text': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dumt',
      'isSender': false,
    },
    {
      'text': 'lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dumt',
      'isSender': true,
    },
    {
      'text': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dumt',
      'isSender': false,
    },
    {
      'text': 'lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dumt',
      'isSender': true,
    },
  ];

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      context.read<InboxCubit>().sendMessage(_messageController.text.trim());
      setState(() {
        _messages.add({
          'text': _messageController.text.trim(),
          'isSender': true,
        });
        _messageController.clear();
      });
      // Scroll to bottom
      Future.delayed(const Duration(milliseconds: 100), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InboxCubit, InboxState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.colorScheme.surface,
          appBar: AppBar(
            backgroundColor: context.colorScheme.surface,
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            title: Row(
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundImage: const AssetImage('assets/images/client_profile.png'),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Manuella Beshara',
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      context.local.online,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final message = _messages[index];
                    return _ChatBubble(
                      text: message['text'],
                      isSender: message['isSender'],
                    );
                  },
                ),
              ),
              _buildInputArea(state),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInputArea(InboxState state) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 24.h),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: context.colorScheme.onSurface.withOpacity(0.2),
                ),
              ),
              child: TextField(
                controller: _messageController,
                enabled: state is! MessageSending,
                decoration: InputDecoration(
                  hintText: context.local.typeMessage,
                  hintStyle: TextStyle(
                    color: context.colorScheme.onSurface.withOpacity(0.3),
                  ),
                  border: InputBorder.none,
                ),
                onSubmitted: (_) => _sendMessage(),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: state is MessageSending ? null : _sendMessage,
            child: Container(
              padding: EdgeInsets.all(12.r),
              decoration: const BoxDecoration(
                color: AppColors.primary700,
                shape: BoxShape.circle,
              ),
              child: state is MessageSending
                  ? SizedBox(
                      width: 24.r,
                      height: 24.r,
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : Icon(
                      Icons.send_rounded,
                      color: Colors.white,
                      size: 24.r,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final String text;
  final bool isSender;

  const _ChatBubble({required this.text, required this.isSender});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: 24.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        constraints: BoxConstraints(maxWidth: 0.75.sw),
        decoration: BoxDecoration(
          color: isSender ? AppColors.primary700 : const Color(0xFFE5E7EB),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
            bottomLeft: isSender ? Radius.circular(12.r) : Radius.zero,
            bottomRight: isSender ? Radius.zero : Radius.circular(12.r),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSender ? Colors.white : Colors.black,
            fontSize: 14.sp,
            height: 1.4,
          ),
        ),
      ),
    );
  }
}
