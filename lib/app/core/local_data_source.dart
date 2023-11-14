abstract interface class LocalDataSource {
  void setSid(String id);
  String getSid();

  void setUserProfile(
    String email,
    String password,
    String firstName,
    String lastName,
    String phone,
  );

  bool getAuthUser();
}
