import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arch/modules/search/domain/entities/result_search.dart';
import 'package:flutter_clean_arch/modules/search/domain/errors/errors.dart';
import 'package:flutter_clean_arch/modules/search/domain/repositories/search_repository.dart';
import 'package:flutter_clean_arch/modules/search/domain/usecases/search_by_text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_by_text_test.mocks.dart';

@GenerateMocks([SearchRepository])
main() {
  final repository = MockSearchRepository();
  final usecase = SearchByTextImpl(repository);

  test('should return a list of result search', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));

    final result = await usecase.call('Jacob');

    expect(result, isA<Right>());
    expect(result | [], isA<List<ResultSearch>>());
  });

  test('should return a list of result search', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));

    final result = await usecase.call('');

    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}
