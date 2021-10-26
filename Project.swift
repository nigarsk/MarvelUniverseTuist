import ProjectDescription

let project = Project(
  name: "MarvelUniverse",
  organizationName: "Globant",
  packages: [
    Package.remote(
      url: "https://github.com/Alamofire/Alamofire.git",
      requirement: .upToNextMajor(
        from: Version(5, 4, 3)
      )
    ),
    Package.remote(
      url: "https://github.com/Alamofire/AlamofireImage.git",
      requirement: .upToNextMajor(
        from: Version(4, 2, 0)
      )
    )
  ],
  settings: nil,
  targets: [
    Target(
      name: "MarvelIndia",
      platform: .iOS,
      product: .app,
      bundleId: "com.globant.marvelin",
      infoPlist: "MarvelIndia/Info.plist",
      sources: ["Base/Source/**", "Base/Application/**"],
      resources: ["MarvelIndia/Resources/**","Base/Source/Feature/UI/**"],
      dependencies: [
        .package(product: "Alamofire"),
        .package(product: "AlamofireImage")
      ],
      settings: nil),
    Target(
      name: "MarvelUS",
      platform: .iOS,
      product: .app,
      bundleId: "com.globant.marvelus",
      infoPlist: "MarvelUS/Info.plist",
      sources: ["MarvelUS/Source/**", "Base/Application/**"],
      resources: ["MarvelUS/Resources/**","MarvelUS/Source/Feature/UI/**"],
      dependencies: [
        .package(product: "Alamofire"),
        .package(product: "AlamofireImage")
      ],
      settings: nil),
    Target(
      name: "MarvelTests",
      platform: .iOS,
      product: .unitTests,
      bundleId: "com.globant.marveltests",
      infoPlist: "MarvelTests/Info.plist",
      sources: ["MarvelTests/MarvelTests/**"],
      resources: ["MarvelTests/MarvelTests/Data/Mocks/JSON/**"],
      dependencies: [
        .target(name: "MarvelIndia")
      ]
    )
])
