class ApiConstance{
static const String baseUrl = 'https://student.valuxapps.com/api/';
static const String loginPath = '${baseUrl}login';
static const String registerPath = '${baseUrl}register';
static const String homePath = '${baseUrl}home';
static String products_details_Path ({required int id}) => '${baseUrl}products/$id';
static const String addAndRemoveFavoritesPath = '${baseUrl}favorites';
static const String favoriteListPath = '${baseUrl}favorites';
static const String add_or_remove_cart_Path = '${baseUrl}carts';
static const String getCartsPath = '${baseUrl}carts';
static String update_cart_Path ({required int id}) => '${baseUrl}carts/$id';
static String delete_cart_Path ({required int id}) => '${baseUrl}carts/$id';
static const String addOrderPath = '${baseUrl}orders';
}