class AppEndPoint {
  static const String baseUrlStripe = 'https://api.stripe.com/v1/';
  static const String stripe = 'payment_intents';
  static const String ephemeral = 'ephemeral_keys';

  ////////////////////////////////////////////////////////////
  static const String baseUrlBooks = 'https://www.googleapis.com/books/v1/';
  static const String similarBooks = 'volumes?Sorting=newest&q=subject=';
  static const String customBooks =
      'volumes?Sorting=newest&Filtering=full&q=Novels';
  static const String listBooksView =
      'volumes?Sorting=newest &q=computer science';
  static const String search = 'volumes?q=intitle=';
}
