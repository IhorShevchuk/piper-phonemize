
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
                 revision: "15b87671e3c7486b6a4404f997b1ae59a7eae441")
    ],
    targets: [
        .target(name: "piper_phonemize",
                dependencies: [
                    .product(name: "libespeak-ng", package: "espeak-ng-spm"),
                    .target(name: "onnxruntime"),
                ],
                path: "",
                sources:[
                    "src/phonemize.cpp",
                    "src/phoneme_ids.cpp",
                    "src/tashkeel.cpp",
                    "src/shared.cpp",
                ],
                publicHeadersPath:"src"
               ),
        .binaryTarget(name: "onnxruntime",
                      url: "https://onnxruntimepackages.z14.web.core.windows.net/pod-archive-onnxruntime-c-1.16.0.zip",
                      checksum: "684f317081d6795e5fd619972bc5dd9a648156ba9d3e0fb2292314582a216d8e")
    ],
    cxxLanguageStandard: .cxx17
)
