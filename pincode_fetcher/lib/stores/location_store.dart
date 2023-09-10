import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:pincode_fetcher/util/address_util.dart';

import '../api/location_api.dart';
import '../model/location_details.dart';

class LocationStore {
  final keysList = [
    'adminName2',
    'adminName1',
    'adminName3',
    'postalCode',
    'placeName'
  ];
  final _api = LocationApi();
  String searchQuery = '';
  int count = 0;

  final Observable<ObservableFuture<LocationData>?> addressData =
      Observable(null);

  LocationStore();

  Future<void> fetchAddress(String text) async {
    if (count < keysList.length) {
      runInAction(() {
        addressData.value = ObservableFuture(_api.getLocationDetails(
            keysList[count++], text.capitalizeFirstLetter()));
      });
    }
  }
}
