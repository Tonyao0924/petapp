class ServerConfig{
  static const url = "http://140.125.207.230:8000";
  static String deviceUrl = "http://192.168.4.1";
  static String webSocketUrl = "ws://172.20.10.4:8000";

  static String getUrl(){
    return url;
  }

  String getDeviceUrl(){
    return deviceUrl;
  }

  static String getWebSocketUrl(){
    return webSocketUrl;
  }
}