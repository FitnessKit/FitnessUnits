import PackageDescription

let package = Package(
    name: "FitnessUnits"
)


#if swift(>=3.1)
package.swiftLanguageVersions = [3, 4]
#endif
