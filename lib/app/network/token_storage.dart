class TokenStorage{
  static String? accessToken;
  static String? refreshToken;

  static void saveTokens(String access,String refresh){
    accessToken= access;
    refreshToken= refresh;

  }
  static void clear(){
    accessToken = null;
    refreshToken = null;
  }
}