import 'package:burget_app_ui/features/home/data/product_model.dart';
import 'package:burget_app_ui/features/home/data/repo/product_repo.dart';

class ProductRepoImpl extends ProductRepo {
  @override
  Future<List<ProductModel>> getproduct() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      ProductModel(
        pName: "Classic Burger",
        imageUrl:
            "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YnVyZ2VyfGVufDB8fDB8fHww",
        productId: 1,
        details:
            "A timeless favorite with a juicy beef patty, fresh lettuce, tomato, onion, and creamy mayo in a soft sesame bun.",
      ),
      ProductModel(
        pName: "Cheese Burst Burger",
        imageUrl:
            "https://images.unsplash.com/photo-1572802419224-296b0aeee0d9?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8YnVyZ2VyfGVufDB8fDB8fHww",
        productId: 2,
        details:
            "Loaded with gooey melted cheese, crisp lettuce, and a double layer of cheddar — cheese lovers’ dream come true.",
      ),
      ProductModel(
        pName: "Grilled Chicken Burger",
        imageUrl:
            "https://plus.unsplash.com/premium_photo-1675252369719-dd52bc69c3df?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8YnVyZ2VyfGVufDB8fDB8fHww",
        productId: 3,
        details:
            "Tender grilled chicken breast seasoned with spices, topped with fresh veggies and smoky sauce for a healthy delight.",
      ),
      ProductModel(
        pName: "BBQ Bacon Burger",
        imageUrl:
            "https://images.unsplash.com/photo-1550547660-d9450f859349?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YnVyZ2VyfGVufDB8fDB8fHww",
        productId: 4,
        details:
            "Smoky BBQ sauce, crispy bacon, cheddar cheese, and a juicy beef patty packed into a grilled sesame bun.",
      ),
      ProductModel(
        pName: "Double Decker Burger",
        imageUrl:
            "https://plus.unsplash.com/premium_photo-1675252369719-dd52bc69c3df?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8YnVyZ2VyfGVufDB8fDB8fHww",
        productId: 5,
        details:
            "Two layers of tender patties stacked with lettuce, cheese, onions, and house special sauce — made for big appetites.",
      ),
      ProductModel(
        pName: "Mexican Salsa Burger",
        imageUrl:
            "https://plus.unsplash.com/premium_photo-1683655058728-415f4f2674bf?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGJ1cmdlcnxlbnwwfHwwfHx8MA%3D%3D",
        productId: 6,
        details:
            "A spicy twist with tangy salsa, jalapeños, and pepper jack cheese — a fiesta in every bite!",
      ),
    ];
  }
}
