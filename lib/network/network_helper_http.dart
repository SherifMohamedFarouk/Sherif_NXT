import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:sherif_nxt_assessment/core/utilities/constants.dart';

class NetworkHelperHttp {
  static NetworkHelperHttp? _instance;
  final accessToken =
      'eyJhbGciOiJSUzI1NiJ9.eyJpZCI6MzAzLCJ0eXBlIjoidXNlciIsInJhbiI6IkJORU5WSVBOTlFUWVBMS0tVQ0JWIiwic3RhdHVzIjoxfQ.YGV-jGKZj1Lp4SqlM3aiF6Aov6YVF6lZRMpKvx_Zdrpjj4C1zE-JSTKtjVboQ9de58TUViyVOc4JwiktjF_4yxnYzIrw449s584j2GiqUpxfp6OPmfAj8BAbfN_M4RoU5PXEjhcNVh5uNRtxtvxZtpECrl72_22T4he3LbqISMNHzVh5eprIKIFLt_pM7cyRKt3Njf8I89CLnq5nUpiDHnMMForamKq9jubmiYPOHpFvijEE3-jusRk0F1T32zMY_0AELXnpqhbbx6HtmMdxBahnrUNyznacdVwaSrNus8vX01N8zEcfRvkRzYuqjnZXr9jrm2iriHq80iicUG99GQ';

  NetworkHelperHttp._internal();
  factory NetworkHelperHttp() {
    _instance ??= NetworkHelperHttp._internal();
    return _instance!;
  }

  // to check if internet is available
  Future<bool> checkConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
          msg: "Prioritize cached data in offline mode:",
          toastLength: Toast.LENGTH_SHORT,
          fontSize: 16.0);
      return true;
    }else{
      return false ;
    }
  }
// call http get RESt to collect all the data from teh api
  Future<dynamic> get(String url) async {
    var myHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    var response =  await http.get(Uri.parse("${Constants.API}/$url"),headers: myHeaders);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw "Error Acquired";
    }
  }
}
