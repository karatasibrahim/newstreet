import 'package:newstreet_app/screens/search_location/model/location_model.dart';
import 'package:newstreet_app/screens/search_location/model/place_model.dart';
import 'package:newstreet_app/screens/home/utils/google_map_provider.dart';
import 'package:newstreet_app/core/extensions/context/edge_insets_extension.dart';
import 'package:newstreet_app/widgets/list_tile/custom_list_tile.dart';
import 'package:newstreet_app/core/init/navigation/pages_import.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newstreet_app/core/extensions/context/project_context_extension.dart';

class PredictionsList extends StatelessWidget {
  final GlobalKey<SearchLocationState> searchLocationKey;
  final Function(LocationModel) onTap;

  const PredictionsList({Key key, this.searchLocationKey, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: context.lowEdgeInsetsVertical,
        child: Consumer<GoogleMapProvider>(
          builder: (context, mapModel, child) {
            List<PlaceModel> predictions = mapModel.placePredictions;
            return Visibility(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return CustomListTile(
                      title: predictions[index].mainText,
                      subtitle: predictions[index].secondaryText,
                      leadingIcon: Icon(Icons.add_location_sharp),
                      trailingIcon: null,
                      onTap: () async {
                        context.closeKeyboard();
                        LocationModel location = await mapModel
                            .getPlaceDetail(predictions[index].placeID);
                        mapModel.clearPlacePredictions();
                        searchLocationKey.currentState.controller.text =
                            location.name;
                        var scope = FocusScope.of(context);
                        if (scope.hasPrimaryFocus) scope.unfocus();
                        onTap(location);
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: mapModel.placePredictions.length),
              visible: predictions.isNotEmpty,
            );
          },
        ),
      ),
    );
  }
}
