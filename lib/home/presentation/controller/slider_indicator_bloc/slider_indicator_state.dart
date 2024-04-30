import 'package:equatable/equatable.dart';

class SliderIndicatorState extends Equatable {
  final int selectedIndex ;
  const SliderIndicatorState({required this.selectedIndex});


  @override
  // TODO: implement props
  List<Object?> get props => [selectedIndex];
}