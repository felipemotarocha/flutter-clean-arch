import 'package:dartz/dartz.dart';

abstract class FailureSearch implements Exception {}

class InvalidTextError implements FailureSearch {}
