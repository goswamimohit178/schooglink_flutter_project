part of 'productsbloc_bloc.dart';

sealed class ProductsblocEvent extends Equatable {
  const ProductsblocEvent();

  @override
  List<Object> get props => [];
}

class ProductsLoadedEvent extends Equatable {
  @override
  List<Object> get props => [];
}
