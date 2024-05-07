class ApiConstance{
static const String baseUrl = 'https://student.valuxapps.com/api/';
static const String loginPath = '${baseUrl}login';
static const String homePath = '${baseUrl}home';
static String products_details_Path ({required int id}) => '${baseUrl}products/$id';
static const String addAndRemoveFavoritesPath = '${baseUrl}favorites';
}