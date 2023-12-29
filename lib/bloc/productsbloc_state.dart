part of 'productsbloc_bloc.dart';

sealed class ProductsblocState extends Equatable {
  const ProductsblocState();

  @override
  List<Object> get props => [];
}

final class ProductsLoadingState extends ProductsblocState {}

final class ProductsLoadedState extends ProductsblocState {
  final List<DogModel> dogModel;
  ProductsLoadedState(this.dogModel);

  @override
  List<Object> get props => [dogModel];
}

final class ProductsErrorState extends ProductsblocState {
  final String errorMessage;
  const ProductsErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
