import 'package:equatable/equatable.dart';

abstract class AiState extends Equatable {
  const AiState();

  @override
  List<Object?> get props => [];
}

class AiInitial extends AiState {}

class AiLoading extends AiState {}

class AiSuccess extends AiState {
  final String result;
  final String mode; // new

  const AiSuccess({required this.result, required this.mode});
}

class AiError extends AiState {
  final String message;

  const AiError(this.message);

  @override
  List<Object?> get props => [message];
}
