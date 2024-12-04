class AppUrl {
  static var baseUrl = 'https://reqres.in';

  static var loginEndPoint = '$baseUrl/api/login';

  static var registerEndPoint = '$baseUrl/api/register';

  // get api


  //Movie API
  static var movieBaseUrl = 'https://dea91516-1da3-444b-ad94-c6d0c4dfab81.mock.pstmn.io';
  static var movieEndPoint =  '$movieBaseUrl/movies_list';


  //Meal API
  static var mealBaseUrl = 'https://www.themealdb.com/api/json/v1/1/filter.php?i=';
  static var mealEndPoint =  '${mealBaseUrl}chicken_breast';


}
