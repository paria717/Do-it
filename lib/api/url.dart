class ApiUrl {
  static final String baseurl = ' http://restapi.adequateshop.com';

  static _Apilist apilist = _Apilist();
}

class _Apilist {
  final String registerEmail =
      'http://restapi.adequateshop.com/api/authaccount/registration';
  final String loginEmail =
      'http://restapi.adequateshop.com/api/authaccount/login';
}
