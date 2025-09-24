import 'package:burget_app_ui/features/home/data/repo/product_repo_impl.dart';
import 'package:burget_app_ui/features/view_item/presentation/bloc/event.dart';
import 'package:burget_app_ui/features/view_item/presentation/bloc/product_details_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class DetailProductBloc extends Bloc<Event, ProductDetailsState> {
  final List<ProductDetailsState> cartItems = [];
  DetailProductBloc() : super(InitState()) {
    on<GetProductEvent>((event, emit) async {
      emit(Loading());
      try {
        final product = await ProductRepoImpl().getproduct();
        emit(Loaded(product: product));
      } catch (e) {
        emit(Error());
      }
    });
    on<AddToCartEvent>((event, emit) {
      // cartItems.add(event.product);
      // emit(CartScreen( List.from(cartItems)));
    });
  }
}
