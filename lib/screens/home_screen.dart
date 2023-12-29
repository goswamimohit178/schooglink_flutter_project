import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schooglink_flutter_project/bloc/productsbloc_bloc.dart';

import '../models/products_model.dart';

class DogListScreen extends StatefulWidget {
  @override
  _DogListScreenState createState() => _DogListScreenState();
}

class _DogListScreenState extends State<DogListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<ProductsblocBloc>().add(ProductsLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dog Breeds'),
      ),
      body: BlocBuilder<ProductsblocBloc, ProductsblocState>(
        builder: (context, state) {
          if (state is ProductsLoadingState) {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is ProductsLoadedState) {
            return ListView.builder(
              itemCount: state.dogModel.length,
              itemBuilder: (context, index) {
                DogModel dog = state.dogModel[index];
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "id: " + dog.id.toString(),
                                ),
                                Text(
                                  "name: " + dog.name.toString(),
                                ),
                                Text("breed_group: " +
                                    dog.breedGroup.toString()),
                                Text(
                                  "bred_for: " + dog.bredFor.toString(),
                                ),
                                Text(
                                  "life_span: " + dog.lifeSpan.toString(),
                                ),
                                Text("origin: " + dog.origin.toString()),
                                //
                                Text("temperament: " +
                                    dog.temperament.toString()),
                                Text(
                                  "country_code: " + dog.countryCode.toString(),
                                ),
                                Text("reference_image_id: " +
                                    dog.referenceImageId.toString()),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 0, right: 50),
                                  child: Container(
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 5,
                                          color: Colors.grey,
                                        )
                                      ],
                                      color: Colors.grey[100],
                                    ),
                                    child: Column(
                                      // crossAxisAlignment: CrossAxisAlignment.end,
                                      // mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Center(child: Text("Height")),
                                        Text("metric: " +
                                            dog.height!['metric'].toString()),
                                        Text("imperial: " +
                                            dog.height!['imperial'].toString()),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 0, right: 50),
                                  child: Container(
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 5,
                                          color: Colors.grey,
                                        )
                                      ],
                                      color: Colors.grey[100],
                                    ),
                                    child: Column(
                                      // crossAxisAlignment: CrossAxisAlignment.end,
                                      // mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Center(child: Text("Weight")),
                                        Text("metric: " +
                                            dog.weight!['metric'].toString()),
                                        Text("imperial: " +
                                            dog.weight!['imperial'].toString()),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is ProductsErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
