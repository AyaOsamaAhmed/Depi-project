import 'package:flutter/material.dart';

class ClientHistoryItem {
  final String title;
  final String clientName;
  final String proposedDate;
  final String budget;
  final String lastUpdate;
  final String status;
  final IconData icon;

  const ClientHistoryItem({
    required this.title,
    required this.clientName,
    required this.proposedDate,
    required this.budget,
    required this.lastUpdate,
    required this.status,
    required this.icon,
  });
}

abstract class ClientHistoryState {}

class ClientHistoryInitial extends ClientHistoryState {}

class ClientHistoryLoading extends ClientHistoryState {}

class ClientHistorySuccess extends ClientHistoryState {
  final List<ClientHistoryItem> projects;

  ClientHistorySuccess(this.projects);
}

class ClientHistoryError extends ClientHistoryState {
  final String message;

  ClientHistoryError(this.message);
}
