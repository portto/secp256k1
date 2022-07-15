Pod::Spec.new do |s|
  s.name = "secp256k1Wrapper"
  s.version = "0.0.5"
  s.summary = "Optimized C library for EC operations on curve secp256k1"
  s.homepage = "https://github.com/portto/secp256k1"
  s.license = { :type => "MIT", :file => "COPYING" }
  s.author = { "secp256k1 contributors" => "https://github.com/bitcoin-core/secp256k1/graphs/contributors" }
  s.source = { :git => "https://github.com/portto/secp256k1.git", :tag => s.version.to_s }
  s.ios.deployment_target = '13.0'
  s.osx.deployment_target = '10.15'
  s.tvos.deployment_target = '13.0'
  s.watchos.deployment_target = '6.0'
  s.public_header_files = "include/*.h"
  s.source_files = "src/*.c",
    "src/**/*.h",
    "include/*.h"
  s.exclude_files = "src/asm",
    "src/bench_ecmult.c",
    "src/bench_internal.c",
    "src/bench.c",
    "src/modules/**/bench_impl.h",
    "src/modules/**/tests_exhaustive_impl.h",
    "src/modules/**/tests_impl.h",
    "src/precompute_ecmult_gen.c",
    "src/precompute_ecmult.c",
    "src/tests_exhaustive.c",
    "src/tests.c",
    "src/valgrind_ctime_test.c"
  s.compiler_flags = "-DENABLE_MODULE_ECDH",
    "-DENABLE_MODULE_EXTRAKEYS",
    "-DENABLE_MODULE_RECOVERY",
    "-DENABLE_MODULE_SCHNORRSIG",
    "-DECMULT_GEN_PREC_BITS=4",
    "-DECMULT_WINDOW_SIZE=15"
  s.xcconfig = {
    "HEADER_SEARCH_PATHS" => "$(SRCROOT)/secp256k1Wrapper $(SRCROOT)/secp256k1Wrapper/src $(SRCROOT)/secp256k1Wrapper/include",
    "OTHER_CFLAGS" => "-pedantic -Wall -Wextra -Wcast-align -Wnested-externs -Wshadow -Wstrict-prototypes -Wno-shorten-64-to-32 -Wno-conditional-uninitialized -Wno-unused-function -Wno-long-long -Wno-overlength-strings -O3"
  }
end
