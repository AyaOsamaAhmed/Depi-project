import 'package:dipe_freelance/features/client/domain/entities/contract_entity.dart';
import 'package:dipe_freelance/features/client/domain/entities/milestone_entity.dart';
import 'package:dipe_freelance/features/client/presentation%20/states/contract_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContractCubit extends Cubit<ContractState> {
  ContractCubit() : super(ContractInitial());

  void loadContract() {
    emit(ContractLoading());
    // Dummy data — هتتبدل بـ API call
    final contract = ContractEntity(
      id: '1',
      projectTitle: 'E-commerce Website',
      projectType: 'Fixed Prices',
      budget: 3000,
      durationDays: 30,
      overallProgress: 0.65,
      freelancerName: 'Sarah Ahmed',
      milestones: [
        MilestoneEntity(
          id: '1',
          title: 'Design & UIUX',
          amount: 1500,
          dueDate: 'Due 7 day',
          status: 3,
          progress: 1.0,
        ),
        MilestoneEntity(
          id: '2',
          title: 'Frontend Development',
          amount: 750,
          dueDate: 'Due 7 day',
          status: 2,
          progress: 0.60,
        ),
        MilestoneEntity(
          id: '3',
          title: 'Backend Development',
          amount: 1500,
          dueDate: 'Due 7 day',
          status: 2,
          progress: 0.0,
        ),
      ],
    );
    emit(ContractLoaded(contract));
  }

  void releasePayment({
    required String freelancerName,
    required double amount,
    required String milestoneTitle,
  }) {
    emit(
      PaymentReleased(
        freelancerName: freelancerName,
        amount: amount,
        milestoneTitle: milestoneTitle,
        date: 'May 16, 2026',
        transactionId: '9999945648448469',
      ),
    );
  }
}
