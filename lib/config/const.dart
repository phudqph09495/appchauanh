import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:ChauAnh/config/path/share_pref_path.dart';
import 'package:time_elapsed/time_elapsed.dart';



import 'share_pref.dart';

class Const {
  static final ConvertPrice = NumberFormat("#,##0.##", "vi");

  static const image_host = '';

  static const api_host = 'http://chauanh.sotavn.com';

  static const domain = "";

  static const key = '';

  static const int debug = 1;

  static checkLogin(BuildContext context, {required Function nextPage}) async {
    bool isLogin = await SharedPrefs.readBool(SharePrefsKeys.login);
    if (isLogin) {
      nextPage();
    } else {
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => const LoginScreen(),
      //     ));
    }
  }

  static formatTime(int time, {String? format}) {
    if (time == 0) {
      return "";
    }
    var check = isNumeric(time.toString());
    if (check) {
      return DateFormat(format ?? 'dd/MM/yyyy   HH:mm', 'en_US')
          .format(DateTime.fromMillisecondsSinceEpoch(time));
    }
    return '';
  }

  static formatTimeString(time, {String? format}) {
    return DateFormat(format ?? 'dd/MM/yyyy  HH:mm:ss', 'en_US')
        .format(DateTime.parse(time));
  }
 static String convertDateFormat(String inputDate) {
    // Define the input and output date formats
    final inputFormat = DateFormat("yyyy-MM-ddTHH:mm:ss.SSSSSSZ");
    final outputFormat = DateFormat("dd/MM/yyyy");

    // Parse the input date string
    final date = inputFormat.parse(inputDate);

    // Format the date to the desired output format
    final outputDate = outputFormat.format(date);

    // Return the converted date string
    return outputDate;
  }



  static checkStatusOrder(int index) {
    List status = [
      "Tạo mới",
      "Hủy",
      "Đã lấy hàng",
      "Đang vận chuyển",
      "Đang giao hàng",
      "Đang chuyển hoàn",
      "Đã giao hàng",
      "Đã trả hàng",
      "Kiện vấn đề",
    ];

    return status[index > 0 ? index - 1 : 0];
  }

  static convertPrice(
    dynamic price,
  ) {
    var res = isNumeric(price.toString());
    if (res) {
      return ConvertPrice.format(double.parse(price.toString())).toString();
    }
    return "0";
  }

  static String formatPrice(
    dynamic price,
  ) {
    double key = 0;
    var check = isNumeric(price.toString());
    if (check) {
      key = double.parse(price.toString());
    }
    var formatCurrency = NumberFormat("#,##0.##", "en_US");
    String format = formatCurrency.format(key);
    var formatCurrency2 = '';
    if (1000000 > key) {
      formatCurrency2 = '${formatCurrency.format(key / 1000)} K';
    } else if (1000000000 > key) {
      formatCurrency2 = '${formatCurrency.format(key / 1000000)} M';
    } else if (1000000000000 > key) {
      formatCurrency2 = '${formatCurrency.format(key / 1000000000)} B';
    } else {
      formatCurrency2 = '${formatCurrency.format(key / 1000000000000)} KB';
    }

    if (key == 0) {
      formatCurrency2 = format;
    }
    // return format.substring(1, format.length);
    return formatCurrency2;
  }

  static convertPhone(String? phone,
      {bool check = false, bool isHint = false}) {
    if (phone == "null" || phone == "" || phone == null) {
      if (check) {
        return "";
      }
      return "Chưa cập nhật";
    }

    if (isHint) {
      return "${phone.substring(0, 4)}***${phone.substring(7, 10)}";
    }

    return "${phone.substring(0, 4)} ${phone.substring(4, 7)} ${phone.substring(7, 10)}";
  }

  static convertContact(
    String? value,
  ) {
    if (value != null) {
      String data = value.replaceAll(" ", '');
      String data1 = data.replaceAll("-", '');
      String data2 = data1.replaceAll("+", '');
      if (data2.startsWith("84")) {
        return "0${data2.substring(2, data2.length)}";
      }
      return data2;
    }
    return "";
  }

  static checkStringNull(String? text,
      {bool checkReturn = false,
      bool checkAddress = false,
      bool checkPrice = false}) {
    if (text == "null" || text == null || text == "") {
      if (!checkReturn) {
        if (checkAddress) {
          return "";
        }
        if (checkPrice) {
          return "Liên hệ";
        }
        return "Chưa cập nhật";
      }

      return "Lỗi dữ liệu";
    }
    if (checkAddress) {
      return "$text  ";
    }
    return text;
  }

  static double convertNumber(dynamic data) {
    var res = isNumeric(data.toString());
    if (res) {
      return double.parse(data.toString());
    }
    return 0;
  }

  static convertSale({dynamic price, dynamic priceMarket}) {
    var res = isNumeric(price.toString());
    var res1 = isNumeric(priceMarket.toString());
    if (res && res1) {
      double price1 = double.parse(price.toString());
      double price2 = double.parse(priceMarket.toString());
      if (price2 > price1) {
        double priceSale = price2 - price1;
        double sale = (priceSale / price2);
        return (sale * 100).round();
      }
      return 0;
    }
    return 0;
  }

  static bool isNumeric(String result) {
    if (result.toString() == "null") {
      return false;
    }
    try {
      double.parse(result.toString());
      return true;
    } catch (e) {
      return false;
    }
  }

  static checkTime(int timestamp) {
    if (timestamp == 0) {
      return "";
    }
    DateTime _timeDate = DateTime.fromMillisecondsSinceEpoch(timestamp);

    String timestr = "";
    final customDate = CustomTimeElapsed(
      minutes: 'phút trước',
      hours: 'giờ trước',
      days: 'ngày trước',
      now: 'vừa xong',
      seconds: 'giây trước',
      weeks: 'tuần trước',
    );
    //.toCustomTimeElapsed(customDate)

    timestr = TimeElapsed.fromDateTime(_timeDate);
    if (timestr == "Now") {
      return "vừa xong";
    }
    String key = timestr.substring(timestr.length - 1, timestr.length);
    String text = timestr.substring(0, timestr.length - 1);

    switch (key) {
      case "s":
        return "$text giây trước";
      case "m":
        return "$text phút trước";
      case "h":
        return "$text giờ trước";
      case "d":
        return "$text ngày trước";
      case "w":
        if (int.parse(text) >= 52) {
          return "${(int.parse(text) / 52).round()} năm trước";
        }
        if (int.parse(text) >= 4) {
          return "${(int.parse(text) / 4).round()} tháng trước";
        }
        return "$text tuần trước";
      default:
        return "vừa xong";
    }
  }


}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

