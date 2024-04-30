abstract class BaseSliderIndicatorEvent {}

class SliderIndicatorEvent extends BaseSliderIndicatorEvent{
  final int tabIndex;
  SliderIndicatorEvent({required this.tabIndex});

}
