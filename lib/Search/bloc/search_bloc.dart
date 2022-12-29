import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/Product/data/models/product.dart';
import 'package:restaurant_app/Search/data/repositories/search_repository.dart';
import 'package:restaurant_app/utils/locator.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    final Connectivity connectivity = locator.get<Connectivity>();
    final SearchRepository searchRepository = locator.get<SearchRepository>();

    on<FetchSearchData>((event, emit) async {
      if (event.searchTxt.isEmpty)
        emit(SearchLoaded([]));
      else {
        if (await connectivity.checkConnectivity() != ConnectivityResult.none) {
          emit(SearchLoading());
          await searchRepository
              .fetchSearchResult(event.searchTxt, event.startPrice,
                  event.endPrice, event.categories)
              .then((values) => emit(SearchLoaded(values)));
        } else {
          emit(SearchNoInternet());
        }
      }
    });
  }
}
