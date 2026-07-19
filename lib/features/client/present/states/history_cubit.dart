import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'history_state.dart';

@injectable
class ClientHistoryCubit extends Cubit<ClientHistoryState> {
  ClientHistoryCubit() : super(ClientHistoryInitial());

  Future<void> loadHistory() async {
    emit(ClientHistoryLoading());
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 500));
    emit(
      ClientHistorySuccess([
        const ClientHistoryItem(
          title: 'E-commerce Website',
          clientName: 'Startup Hub',
          proposedDate: 'May 10, 2026',
          budget: r'$1,202',
          lastUpdate: '4 days ago',
          status: 'In Progress',
          icon: Icons.shopping_cart_outlined,
        ),
        const ClientHistoryItem(
          title: 'Mobile App design',
          clientName: 'Startup Hub',
          proposedDate: 'May 10, 2028',
          budget: r'$1,202',
          lastUpdate: '4 days ago',
          status: 'Rejected',
          icon: Icons.smartphone_rounded,
        ),
        const ClientHistoryItem(
          title: 'Dashboard UI/UX design',
          clientName: 'Startup Hub',
          proposedDate: 'May 10, 2026',
          budget: r'$1,202',
          lastUpdate: '4 days ago',
          status: 'Accepted',
          icon: Icons.desktop_mac_outlined,
        ),
        const ClientHistoryItem(
          title: 'E-commerce Website',
          clientName: 'Startup Hub',
          proposedDate: 'May 10, 2026',
          budget: r'$1,202',
          lastUpdate: '4 days ago',
          status: 'In Progress',
          icon: Icons.shopping_cart_outlined,
        ),
        const ClientHistoryItem(
          title: 'Dashboard UI/UX design',
          clientName: 'Startup Hub',
          proposedDate: 'May 10, 2028',
          budget: r'$1,202',
          lastUpdate: '4 days ago',
          status: 'Invited',
          icon: Icons.desktop_mac_outlined,
        ),
        const ClientHistoryItem(
          title: 'Website Development',
          clientName: 'Startup Hub',
          proposedDate: 'Apr 28, 2026',
          budget: r'$2,500',
          lastUpdate: '1 week ago',
          status: 'Completed',
          icon: Icons.web_rounded,
        ),
        const ClientHistoryItem(
          title: 'Brand Identity Design',
          clientName: 'Startup Hub',
          proposedDate: 'Apr 20, 2026',
          budget: r'$800',
          lastUpdate: '2 weeks ago',
          status: 'Completed',
          icon: Icons.brush_outlined,
        ),
        const ClientHistoryItem(
          title: 'SEO & App Marketing',
          clientName: 'Startup Hub',
          proposedDate: 'Apr 15, 2026',
          budget: r'$1,500',
          lastUpdate: '3 weeks ago',
          status: 'Completed',
          icon: Icons.trending_up_rounded,
        ),
      ]),
    );
  }

  @override
  void emit(ClientHistoryState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
