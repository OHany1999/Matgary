abstract class LandingPageEvent {}

class TabChangeEvent extends LandingPageEvent{
  final int tabIndex;

  TabChangeEvent({required this.tabIndex});

}
