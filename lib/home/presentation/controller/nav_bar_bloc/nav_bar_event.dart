abstract class BaseTabChangeEvent {}

class TabChangeEvent extends BaseTabChangeEvent{
  final int tabIndex;
  TabChangeEvent({required this.tabIndex});

}
