import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Config {

  static String home = 'http://192.168.43.233:5002/';
  static String signin = home + 'signin';
  static String signup = home + 'signup';
  static String factoris = home + 'factoris';
  static String createFactory = home + 'add/factory';
  static String allFactories = home + 'all/factories/1'; // most be dnmc
  static String deleteFactoryById = home + 'factory/delete/1'; // most be dnmc
  static String createPointOfSale = home + 'add/pointofsale';
  static String updatePointOfSale = home + 'pointofsale/update/1';
  static String allPointOfSales = home + 'all/pointofsale/1'; // most be dnmc
  static String deletePointOfSaleById = home + 'pointofsale/delete/1'; // most be dnmc
  static String createCategory = home + 'add/category';
  static String updateCategory = home + 'category/update/1';
  static String allCategories = home + 'all/pointofsale/1'; // most be dnmc
  static String deleteCategoryById = home + 'category/delete/1'; // most be dnmc

  static List<Map> images = [
    {'name': 'tab', 'iconPath': 'assets/images/logo.png'},
    {'name': 'tab', 'iconPath': 'assets/images/logo.png'},
    {'name': 'tab', 'iconPath': 'assets/images/logo.png'},
    {'name': 'tab', 'iconPath': 'assets/images/logo.png'},
    {'name': 'tab', 'iconPath': 'assets/images/logo.png'}
  ];

  static List<Map> listItems = [
    {'title': 'Dashboard', 'icon': FontAwesomeIcons.dashcube},
    {'title': 'Factory', 'icon': FontAwesomeIcons.fastForward},
    {'title': 'Lasts', 'icon': FontAwesomeIcons.lastfm},
    {'title': 'News', 'icon': FontAwesomeIcons.newspaper},
    {'title': 'About us', 'icon': FontAwesomeIcons.addressBook}
  ];

}