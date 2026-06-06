import '../../domain/entities/contract_entity.dart';

abstract class ContractState {}

class ContractInitial extends ContractState {}

class ContractLoading extends ContractState {}

class ContractLoaded extends ContractState {
  final ContractEntity contract;
  ContractLoaded(this.contract);
}

class ContractError extends ContractState {
  final String message;
  ContractError(this.message);
}

class PaymentReleased extends ContractState {
  final String freelancerName;
  final double amount;
  final String milestoneTitle;
  final String date;
  final String transactionId;

  PaymentReleased({
    required this.freelancerName,
    required this.amount,
    required this.milestoneTitle,
    required this.date,
    required this.transactionId,
  });
}
