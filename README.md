This is an example project to determine how to support source_map and
source_map_stack_trace.

The goal is to get a human-readable stack trace in both Dartium and non-Dartium browsers.

## Output in Dartium

```
packages/$sdk/lib/_internal/js_runtime/lib/js_array.dart 373:13  _CustomZone.runGuarded
packages/$sdk/lib/_internal/js_runtime/lib/js_array.dart 373:13  _CustomZone.runGuarded
../packages/stack_trace/src/trace.dart 56:21                     _ScheduleImmediateHelper._handleMutation
../packages/stack_trace/src/trace.dart 56:21
```

```
main.dart 46:3       _doMoreStuff.<async>
dart:async           _Completer.completeError
main.dart 48:2       _doMoreStuff.<async>
dart:async           Future.Future.microtask
main.dart            _doMoreStuff
main.dart 41:22      _doStuff.<async>
dart:async           Future.Future.microtask
main.dart            _doStuff
main.dart 36:21      throwAsyncException.<async>
dart:async           Future.Future.microtask
main.dart            throwAsyncException
main.dart 15:13      main.<async>.<fn>.<async>
package:stack_trace  Chain.capture
main.dart 13:9       main.<async>
dart:async           _SyncCompleter.complete
main.dart 32:3       getMapping.<async>
```

## Output in Chrome

```
packages/$sdk/lib/_internal/js_runtime/lib/js_helper.dart 1699:17   wrapException
../packages/source_maps/parser.dart 28:46                           <fn>
packages/$sdk/lib/_internal/js_runtime/lib/async_patch.dart 199:19  _wrapJsFunctionForAsync.closure.$protected
packages/$sdk/lib/_internal/js_runtime/lib/async_patch.dart 222:5   _wrapJsFunctionForAsync.<fn>
../packages/stack_trace/src/stack_zone_specification.dart 146:25    StackZoneSpecification.registerBinaryCallback.<fn>.<fn>
../packages/stack_trace/src/stack_zone_specification.dart 206:14    StackZoneSpecification._run
../packages/stack_trace/src/stack_zone_specification.dart 146:14    StackZoneSpecification.registerBinaryCallback.<fn>
packages/$sdk/lib/_internal/js_runtime/lib/async_patch.dart 173:19  _awaitOnObject.<fn>
packages/$sdk/lib/async/zone.dart 902:37                            _rootRunUnary
packages/$sdk/lib/async/zone.dart 798:12                            _CustomZone.runUnary
```

```
main.dart.js 2522:17   dart.wrapException
main.dart.js 12028:23  <fn>
main.dart.js 4932:15   _wrapJsFunctionForAsync_closure.$protected
main.dart.js 5298:14   _wrapJsFunctionForAsync_closure.dart._wrapJsFunctionForAsync_closure.call$2
main.dart.js 13724:23  StackZoneSpecification_registerBinaryCallback__closure.dart.StackZoneSpecification_registerBinaryCallback__closure.call$0
main.dart.js 13685:18  StackZoneSpecification.dart.StackZoneSpecification._run$2
main.dart.js 13718:27  StackZoneSpecification_registerBinaryCallback_closure.dart.StackZoneSpecification_registerBinaryCallback_closure.call$2
main.dart.js 5286:34   _awaitOnObject_closure.dart._awaitOnObject_closure.call$1
main.dart.js 5131:18   dart._rootRunUnary
main.dart.js 6751:41   _CustomZone.dart._CustomZone.runUnary$2
main.dart.js 6788:41   _CustomZone.dart._CustomZone.errorCallback$2
main.dart.js 5311:39   _SyncCompleter.completeError$2
main.dart.js 4905:19   dart._asyncHelper
main.dart.js 12033:24  <fn>
main.dart.js 4932:15   _wrapJsFunctionForAsync_closure.$protected
main.dart.js 5298:14   _wrapJsFunctionForAsync_closure.dart._wrapJsFunctionForAsync_closure.call$2
main.dart.js 2839:14   eval
main.dart.js 6779:41   _CustomZone.dart._CustomZone.registerBinaryCallback$1
main.dart.js 4940:30   dart._wrapJsFunctionForAsync
main.dart.js 12019:35  dart._doMoreStuff
main.dart.js 12000:39  <fn>
main.dart.js 4932:15   _wrapJsFunctionForAsync_closure.$protected
main.dart.js 5298:14   _wrapJsFunctionForAsync_closure.dart._wrapJsFunctionForAsync_closure.call$2
main.dart.js 2839:14   eval
main.dart.js 6779:41   _CustomZone.dart._CustomZone.registerBinaryCallback$1
main.dart.js 4940:30   dart._wrapJsFunctionForAsync
main.dart.js 11989:31  dart._doStuff
main.dart.js 11974:39  <fn>
main.dart.js 4932:15   _wrapJsFunctionForAsync_closure.$protected
main.dart.js 5298:14   _wrapJsFunctionForAsync_closure.dart._wrapJsFunctionForAsync_closure.call$2
main.dart.js 2839:14   eval
main.dart.js 6779:41   _CustomZone.dart._CustomZone.registerBinaryCallback$1
main.dart.js 4940:30   dart._wrapJsFunctionForAsync
main.dart.js 11962:42  dart.throwAsyncException
main.dart.js 12053:41  <fn>
main.dart.js 4932:15   _wrapJsFunctionForAsync_closure.$protected
main.dart.js 5298:14   _wrapJsFunctionForAsync_closure.dart._wrapJsFunctionForAsync_closure.call$2
main.dart.js 2839:14   eval
main.dart.js 6779:41   _CustomZone.dart._CustomZone.registerBinaryCallback$1
main.dart.js 4940:30   dart._wrapJsFunctionForAsync
main.dart.js 12042:31  main_closure.dart.main_closure.call$0
main.dart.js 4347:30   Chain_capture_closure.dart.Chain_capture_closure.call$0
main.dart.js 5122:16   dart._rootRun
main.dart.js 6744:41   _CustomZone.dart._CustomZone.run$1
```

