class API {
  static const server = "http://192.168.1.202:3000";

  static String Function() get temperaturaValue =>
      () => "$server/temperatura/get";

  static String Function() get alcoholValue => () => "$server/alcohol/get";

  static String Function() get aguaValue => () => "$server/agua/get";

  static String Function() get presenciaValue => () => "$server/presencia/get";

  static String Function() get gasValue => () => "$server/gas/get";
}
