
abstract class SplashEvent {}

class SplashCheckAuthentication extends SplashEvent {
  final int userId; // Add user ID parameter

  SplashCheckAuthentication({required this.userId});
}