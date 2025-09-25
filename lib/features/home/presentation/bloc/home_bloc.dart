import 'package:burget_app_ui/core/app_util/navigation_service.dart';
import 'package:burget_app_ui/features/home/data/repo/product_repo_impl.dart';
import 'package:burget_app_ui/features/home/presentation/bloc/home_event.dart';
import 'package:burget_app_ui/features/home/presentation/bloc/home_state.dart';
import 'package:burget_app_ui/features/home/presentation/home_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(InitState()) {
    on<LoadProductEvent>((event, emit) async {
      emit(Loading());
      try {
        final products = await ProductRepoImpl().getproduct();
        emit(Loaded(product: products));
      } catch (e) {
        emit(Error());
      }
    });
    on<MoveToHomeEvent>((event, emit) {
      NavigationService.push(
        BlocProvider(create: (context) => HomeBloc(), child: HomeScreen()),
      );
    });
  }
}
