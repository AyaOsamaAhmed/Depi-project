import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/messages_cubit.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/messages_state.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/widgets/chat_list_item.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/widgets/freelancer_text_field.dart';
import 'package:dipe_freelance/core/di/injection.dart';

class MessageView extends StatelessWidget {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MessagesCubit>()..fetchMessages(),
      child: Scaffold(
        backgroundColor: context.colorScheme.surface,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: FreelancerTextField(
                  hint: context.local.search,
                  prefixIcon: Icon(
                    Icons.search,
                    color: context.theme.disabledColor,
                    size: 24.sp,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: BlocBuilder<MessagesCubit, MessagesState>(
                  builder: (context, state) {
                    if (state is MessagesLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is MessagesSuccess) {
                      return ListView.separated(
                        itemCount: state.chats.length,
                        separatorBuilder: (context, index) => SizedBox(height: 8.h),
                        itemBuilder: (context, index) {
                          final chat = state.chats[index];
                          return ChatListItem(
                            name: chat['name']!,
                            lastMessage: chat['lastMessage']!,
                            time: chat['time']!,
                            imageUrl: chat['imageUrl']!,
                            onTap: () {
                              context.push(AppRoutes.chat);
                            },
                          );
                        },
                      );
                    } else if (state is MessagesError) {
                      return Center(child: Text(state.message));
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
