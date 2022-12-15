import 'package:restaurant_app/Shared/Location/data/models/address_location.dart';
import 'package:restaurant_app/utils/locator.dart';
import 'package:restaurant_app/utils/services/api_service.dart';
import 'package:restaurant_app/utils/services/database_service.dart';
import '../Models/branch.dart';

class BranchRepository {
  late final ApiService _apiService;
  late final DatabaseService _databaseService;

  BranchRepository() {
    this._apiService = locator.get<ApiService>();
    this._databaseService = locator.get<DatabaseService>();
  }

  Future<Branch?> fetchBranchData(AddressLocation addressLocation) async {
    return Branch.fromJson(
        await _apiService.getBranchData(addressLocation.position));
  }

  Future<List<Branch>?> fetchBranchAddresses() async {
    final result = await _apiService.getBranchAddresses();
    return result!.map((e) => Branch.fromJson(e)).toList();
  }
}
