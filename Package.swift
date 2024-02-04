
// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "piper_phonemize",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "piper_phonemize",
            targets: ["piper_phonemize"]),
    ],
    dependencies: [
        .package(url: "https://github.com/IhorShevchuk/espeak-ng-spm",
                 revision: "15b87671e3c7486b6a4404f997b1ae59a7eae441"),
        .package(url: "https://github.com/microsoft/onnxruntime-swift-package-manager", .upToNextMajor(from: "1.16.0"))
    ],
    targets: [
        .target(name: "piper_phonemize",
                dependencies: [
                    .product(name: "libespeak-ng", package: "espeak-ng-spm"),
                    .product(name: "onnxruntime", package: "onnxruntime-swift-package-manager"),
                ],
                path: "",
                sources:[
                    "src/phonemize.cpp",
                    "src/phoneme_ids.cpp",
                    "src/tashkeel.cpp",
                    "src/shared.cpp",
                ],
                publicHeadersPath:"src"
               )
    ],
    cxxLanguageStandard: .cxx17
)
