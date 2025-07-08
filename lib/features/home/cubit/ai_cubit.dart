import 'package:flutter_bloc/flutter_bloc.dart';
import 'ai_state.dart';

class AiCubit extends Cubit<AiState> {
  AiCubit() : super(AiInitial());

  Future<void> sendRequest(String input, String mode) async {
    emit(AiLoading());

    try {
      // simulate request
      await Future.delayed(Duration(seconds: 2));
      final response = "This is a $mode result of: $input";

      emit(AiSuccess(result: response, mode: mode));
    } catch (e) {
      emit(AiError("Something went wrong"));
    }
  }
}
