import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arch/modules/search/domain/entities/result_search.dart';
import 'package:flutter_clean_arch/modules/search/domain/errors/errors.dart';
import 'package:flutter_clean_arch/modules/search/infra/datasources/search_datasource.dart';
import 'package:flutter_clean_arch/modules/search/infra/models/result_search_model.dart';
import 'package:flutter_clean_arch/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_repository_impl_test.mocks.dart';

@GenerateMocks([SearchDatasource])
main() {
  final datasource = MockSearchDatasource();
  final repository = SearchRepositoryImpl(datasource);

  test('should return a list of ResultSearch', () async {
    when(datasource.getSearch(any))
        .thenAnswer((realInvocation) async => <ResultSearchModel>[]);

    final result = await repository.search("Jacob");

    expect(result | [], isA<List<ResultSearch>>());
  });

  test('should return an DatasourceError if the datasource fails', () async {
    when(datasource.getSearch(any)).thenThrow(Exception());

    final result = await repository.search("Jacob");

    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
