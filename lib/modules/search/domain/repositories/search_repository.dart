import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arch/modules/search/domain/entities/result_search.dart';
import 'package:flutter_clean_arch/modules/search/domain/errors/errors.dart';

abstract class SearchRepository {
  Future<Either<FailureSearch, List<ResultSearch>>> search(String searchText);
}
