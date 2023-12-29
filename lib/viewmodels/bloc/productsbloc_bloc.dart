import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/products_model.dart';
import '../../repo/products_repo.dart';

part 'productsbloc_event.dart';
part 'productsbloc_state.dart';

class ProductsblocBloc extends Bloc<ProductsLoadedEvent, ProductsblocState> {
// repo use here for real time data

  final DogRepository dogRepo;

  ProductsblocBloc(this.dogRepo) : super(ProductsLoadingState()) {
    on<ProductsLoadedEvent>((event, emit) async {
      // TODO: implement event handler

      try {
        emit(ProductsLoadingState());
        var data = await dogRepo.fetchDogs();
        emit(ProductsLoadedState(data));
      } catch (e) {
        emit(ProductsErrorState(e.toString()));
      }
    });
  }
}
