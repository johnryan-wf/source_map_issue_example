library main;

import 'dart:html';
import 'dart:async';

import 'package:stack_trace/stack_trace.dart';
import 'package:source_map_stack_trace/source_map_stack_trace.dart';
import 'package:source_maps/source_maps.dart';

main() async {
  var map = await getMapping();

  Chain.capture(() async {
    try {
      await throwAsyncException();
    } catch(e, stackTrace) {
      var mapped = mapStackTrace(map, stackTrace);
      print(mapped);
      rethrow;
    }
  }, onError: (err, Chain chain) {
    var cleaned = new Trace.from(chain);
    cleaned = cleaned.foldFrames(
        (frame) => frame.isCore,
        terse: true);
    print(cleaned);
  });
}

Future<Mapping> getMapping() async {
  var sourceMap = await HttpRequest.getString('main.dart.js.map');
  return parse(sourceMap);
}

Future throwAsyncException() async {
  var value = await _doStuff();
  print('done! $value');
}

Future<int> _doStuff() async {
  var result = await _doMoreStuff();
  return result * 2;
}

Future<int> _doMoreStuff() async {
  throw(new Exception('async exception'));
  return 5;
}