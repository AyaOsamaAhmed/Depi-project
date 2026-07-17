import 'package:dipe_freelance/features/client/present/states/list_chats_cubit.dart';
import 'package:dipe_freelance/features/client/present/states/list_chats_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/widgets/chat_list_item.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/widgets/freelancer_text_field.dart';
import 'package:dipe_freelance/core/di/injection.dart';

class ListChatsView extends StatelessWidget {
  const ListChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ListChatsCubit>()..fetchMessages(),
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
                child: BlocBuilder<ListChatsCubit, ListChatsState>(
                  builder: (context, state) {
                    if (state is ListChatsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ListChatsSuccess) {
                      return ListView.separated(
                        itemCount: state.chats.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 8.h),
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
                    } else if (state is ListChatsError) {
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
