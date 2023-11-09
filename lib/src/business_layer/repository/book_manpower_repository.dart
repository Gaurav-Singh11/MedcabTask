/// The [BookManpowerRepository] class handles login and user details for your app.
class BookManpowerRepository {
  /// Private constructor for singleton
  BookManpowerRepository._privateConstructor();

  /// Singleton instance creation
  static final _instance = BookManpowerRepository._privateConstructor();

  /// Get the singleton instance
  static BookManpowerRepository get instance => _instance;

  /// A private tag used for logging within the [BookManpowerRepository] class.
  /// final String _tag = "AuthRepository: ";
}
