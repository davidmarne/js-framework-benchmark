// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library fasta.translate_uri;

import 'dart:async' show Future;

import 'package:package_config/packages_file.dart' as packages_file show parse;

import 'errors.dart' show inputError;

import 'io.dart' show readBytesFromFile;

class TranslateUri {
  final Map<String, Uri> packages;
  final Map<String, Uri> dartLibraries;

  TranslateUri(this.packages, this.dartLibraries);

  Uri translate(Uri uri) {
    if (uri.scheme == "dart") return translateDartUri(uri);
    if (uri.scheme == "package") return translatePackageUri(uri);
    return null;
  }

  Uri translateDartUri(Uri uri) => dartLibraries[uri.path];

  Uri translatePackageUri(Uri uri) {
    int index = uri.path.indexOf("/");
    if (index == -1) return null;
    String name = uri.path.substring(0, index);
    String path = uri.path.substring(index + 1);
    Uri root = packages[name];
    if (root == null) return null;
    return root.resolve(path);
  }

  static Future<TranslateUri> parse(Uri sdk, [Uri uri]) async {
    // This list below is generated with [bin/generate_dart_libraries.dart] and
    // additional entries for _builtin, _vmservice, profiler, and vmservice_io.
    //
    // TODO(ahe): This is only used with the option --compile-sdk, and
    // currently doesn't work outside the SDK source tree.
    Map<String, Uri> dartLibraries = <String, Uri>{};
    if (sdk != null) {
      dartLibraries = <String, Uri>{
        "_async_await_error_codes": sdk.resolve(
            "lib/_internal/js_runtime/lib/shared/async_await_error_codes.dart"),
        "_blink": sdk.resolve("lib/_blink/dartium/_blink_dartium.dart"),
        "_builtin": sdk.resolve("lib/_builtin/_builtin.dart"),
        "_chrome": sdk.resolve("lib/_chrome/dart2js/chrome_dart2js.dart"),
        "_foreign_helper":
            sdk.resolve("lib/_internal/js_runtime/lib/foreign_helper.dart"),
        "_interceptors":
            sdk.resolve("lib/_internal/js_runtime/lib/interceptors.dart"),
        "_internal": sdk.resolve("lib/internal/internal.dart"),
        "_isolate_helper":
            sdk.resolve("lib/_internal/js_runtime/lib/isolate_helper.dart"),
        "_js_embedded_names": sdk
            .resolve("lib/_internal/js_runtime/lib/shared/embedded_names.dart"),
        "_js_helper":
            sdk.resolve("lib/_internal/js_runtime/lib/js_helper.dart"),
        "_js_mirrors":
            sdk.resolve("lib/_internal/js_runtime/lib/js_mirrors.dart"),
        "_js_names": sdk.resolve("lib/_internal/js_runtime/lib/js_names.dart"),
        "_js_primitives":
            sdk.resolve("lib/_internal/js_runtime/lib/js_primitives.dart"),
        "_metadata": sdk.resolve("lib/html/html_common/metadata.dart"),
        "_native_typed_data":
            sdk.resolve("lib/_internal/js_runtime/lib/native_typed_data.dart"),
        "_vmservice": sdk.resolve("lib/vmservice/vmservice.dart"),
        "async": sdk.resolve("lib/async/async.dart"),
        "collection": sdk.resolve("lib/collection/collection.dart"),
        "convert": sdk.resolve("lib/convert/convert.dart"),
        "core": sdk.resolve("lib/core/core.dart"),
        "developer": sdk.resolve("lib/developer/developer.dart"),
        "html": sdk.resolve("lib/html/dartium/html_dartium.dart"),
        "html_common": sdk.resolve("lib/html/html_common/html_common.dart"),
        "indexed_db":
            sdk.resolve("lib/indexed_db/dartium/indexed_db_dartium.dart"),
        "io": sdk.resolve("lib/io/io.dart"),
        "isolate": sdk.resolve("lib/isolate/isolate.dart"),
        "js": sdk.resolve("lib/js/dartium/js_dartium.dart"),
        "js_util": sdk.resolve("lib/js_util/dartium/js_util_dartium.dart"),
        "math": sdk.resolve("lib/math/math.dart"),
        "mirrors": sdk.resolve("lib/mirrors/mirrors.dart"),
        "nativewrappers": sdk.resolve("lib/html/dartium/nativewrappers.dart"),
        "profiler": sdk.resolve("lib/profiler/profiler.dart"),
        "svg": sdk.resolve("lib/svg/dartium/svg_dartium.dart"),
        "typed_data": sdk.resolve("lib/typed_data/typed_data.dart"),
        "vmservice_io": sdk.resolve("lib/vmservice_io/vmservice_io.dart"),
        "web_audio":
            sdk.resolve("lib/web_audio/dartium/web_audio_dartium.dart"),
        "web_gl": sdk.resolve("lib/web_gl/dartium/web_gl_dartium.dart"),
        "web_sql": sdk.resolve("lib/web_sql/dartium/web_sql_dartium.dart"),
      };
    }
    uri ??= Uri.base.resolve(".packages");
    List<int> bytes =
        await readBytesFromFile(uri, ensureZeroTermination: false);
    Map<String, Uri> packages = const <String, Uri>{};
    try {
      packages = packages_file.parse(bytes, uri);
    } on FormatException catch (e) {
      return inputError(uri, e.offset, e.message);
    }
    return new TranslateUri(packages, dartLibraries);
  }
}
