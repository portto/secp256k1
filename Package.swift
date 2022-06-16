// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "secp256k1Wrapper",
    products: [
        .library(
            name: "secp256k1Wrapper",
            targets: [
                "secp256k1Wrapper"
            ]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "secp256k1Wrapper",
            path: ".",
            exclude: [
                "autogen.sh",
                "build-aux",
                "ci",
                "configure.ac",
                "contrib",
                "COPYING",
                "doc",
                "examples",
                "libsecp256k1.pc.in",
                "Makefile.am",
                "README.md",
                "sage",
                "SECURITY.md",
                "src/asm",
                "src/bench_ecmult.c",
                "src/bench_internal.c",
                "src/bench.c",
                "src/modules",
                "src/precompute_ecmult_gen.c",
                "src/precompute_ecmult.c",
                "src/tests_exhaustive.c",
                "src/tests.c",
                "src/valgrind_ctime_test.c",
            ],
            sources: [
                "src/precomputed_ecmult_gen.c",
                "src/precomputed_ecmult.c",
                "src/secp256k1.c",
                "src/utility.c"
            ],
            cSettings: [
                // Basic config values that are universal and require no dependencies.
                // https://github.com/bitcoin-core/secp256k1/blob/master/src/basic-config.h#L12-L13
                .define("ECMULT_GEN_PREC_BITS", to: "4"),
                .define("ECMULT_WINDOW_SIZE", to: "15"),
                // Enabling additional secp256k1 modules.
                .define("ENABLE_MODULE_ECDH"),
                .define("ENABLE_MODULE_EXTRAKEYS"),
                .define("ENABLE_MODULE_RECOVERY"),
                .define("ENABLE_MODULE_SCHNORRSIG")
            ]
        )
    ],
    swiftLanguageVersions: [.v5],
    cLanguageStandard: .c89
)
