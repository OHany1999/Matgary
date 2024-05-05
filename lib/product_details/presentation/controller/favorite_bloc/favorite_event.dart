abstract class BaseFavoriteEvent {}

class FavoriteEvent extends BaseFavoriteEvent{
  final bool isFav;

  FavoriteEvent({required this.isFav});
}
