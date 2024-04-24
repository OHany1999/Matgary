import 'package:dartz/dartz.dart';
import 'package:matgary/core/error/failure.dart';
import 'package:matgary/home/domain/entities/home_entity.dart';

abstract class BaseHomeRepository{
  Future<Either<Failure,HomeEntity>>getHomeData();
}