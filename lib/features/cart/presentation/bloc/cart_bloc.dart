import 'package:burget_app_ui/core/app_util/navigation_service.dart';
import 'package:burget_app_ui/features/cart/presentation/bloc/cart_event.dart';
import 'package:burget_app_ui/features/cart/presentation/bloc/cart_state.dart';
import 'package:burget_app_ui/features/cart/presentation/cart_screen.dart';

import 'package:burget_app_ui/features/check_out_page/presentation/check_out_screen.dart';
import 'package:burget_app_ui/features/home/data/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final List<ProductModel> cartItems = [];
  CartBloc() : super(InitState()) {
    on<GetCartProductEvent>((event, emit) {
      emit(Loading());
      try {
        final existingIndex = cartItems.indexWhere(
          (item) => item.productId == event.product.productId,
        );

        if (existingIndex == -1) {
          cartItems.add(event.product..quantity = 1);
        } else {
          cartItems[existingIndex].quantity++;
        }
        emit(Loaded(product: List.from(cartItems)));
      } catch (e) {
        emit(Error());
      }
    });
    on<IncrementQuantityEvent>((event, emit) {
      event.product.quantity++;
      emit(Loaded(product: List.from(cartItems)));
    });
    on<DecrementQuantityEvent>((event, emit) {
      if (event.product.quantity > 1) {
        event.product.quantity--;
      } else {
        cartItems.remove(event.product);
      }
      emit(Loaded(product: cartItems));
    });
    on<DeleteAllEvent>((event, emit) {
      cartItems.remove(event.product);
      emit(Loaded(product: cartItems));
    });
    on<CartCheckOut>((event, emit) {
      NavigationService.push(CheckOutScreen());
    });
    on<GoToCartEvent>((event, emit) {
      NavigationService.push(
        BlocProvider(create: (context) => CartBloc(), child: CartScreen()),
      );
    });
  }
}
