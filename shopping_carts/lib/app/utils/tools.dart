import 'dart:async';

Map<String, Timer> _funcDebounce = {};
Map<String, bool> _funcThrottle = {};

/// 函数防抖
/// [func]: 要执行的方法
/// [milliseconds]: 要迟延的毫秒时间
Function handlerDebounce(Function func, [int milliseconds = 500]) {
  assert(func != null);
  void target () {
    String key = func.hashCode.toString();
    Timer? timer = _funcDebounce[key];
    if (timer == null) {
      func?.call();
      timer = Timer(Duration(milliseconds: milliseconds), () {
        Timer? t = _funcDebounce.remove(key);
        t?.cancel();
        t = null;
      });
      _funcDebounce[key] = timer;
    }
  }
  return target;
}



/// 函数节流
/// [func]: 要执行的方法
Function handlerThrottle(Future Function() func) {
  if (func == null) {
    return func;
  }
  void target  () {
    String key = func.hashCode.toString();
    bool enable = _funcThrottle[key] ?? true;
    if (enable) {
      _funcThrottle[key] = false;
      func().then((_) {
        _funcThrottle[key] = false;
      }).whenComplete(() {
        _funcThrottle.remove(key);
      });
    }
  }
  return target;
}