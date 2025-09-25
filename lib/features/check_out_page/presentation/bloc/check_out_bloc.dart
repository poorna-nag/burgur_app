import 'package:burget_app_ui/features/check_out_page/presentation/bloc/check_out_event.dart';
import 'package:burget_app_ui/features/check_out_page/presentation/bloc/check_out_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutBloc extends Bloc<CheckOutEvent, CheckOutState> {
  CheckOutBloc() : super(InitState()) {
    on<LoadingEvent>((event, emit) async {
      emit(Loading());
      await Future.delayed(Duration(seconds: 2));
      emit(Loaded());
    });
  }
}
