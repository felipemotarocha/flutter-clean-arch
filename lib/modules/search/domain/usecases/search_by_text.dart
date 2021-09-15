import 'package:flutter_clean_arch/modules/search/domain/entities/result_search.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arch/modules/search/domain/errors/errors.dart';
import 'package:flutter_clean_arch/modules/search/domain/repositories/search_repository.dart';

abstract class SearchByText {
  Future<Either<FailureSearch, List<ResultSearch>>> call(String searchText);
}

class SearchByTextImpl extends SearchByText {
  final SearchRepository repository;

  SearchByTextImpl(this.repository);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> call(String searchText) {
    if (searchText == '') {
      return Future.value(Left(InvalidTextError()));
    }

    return repository.search(searchText);
  }
}
