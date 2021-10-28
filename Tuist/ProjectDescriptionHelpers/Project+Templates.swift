import ProjectDescription

private let deploymentTarget = ProjectDescription.DeploymentTarget.iOS(targetVersion: "12.2", devices: [.iphone])

extension Project {

  public static let platform: Platform = .iOS

  public static func app(
    name: String,
    packages: [Package] = [],
    platform: Platform = platform,
    //resources: [FileElement]? = nil,
    resources: ResourceFileElements? = nil,
    features: [String] = [],
    dependencies: [TargetDependency] = [],
    testFolder: String? = nil,
    testDependencies: [TargetDependency] = []
  ) -> Project {
    return project(
      name: name,
      packages: packages,
      product: .app,
      platform: platform,
      resources: resources,
      dependencies: dependencies + features.map {
          .project(
            target: $0,
            path: .relativeToRoot("Projects/Features/\($0)")
          )
        },
      infoPlist: buildInfoPlist(),
      testFolder: testFolder
    )
  }

  private static func buildInfoPlist() -> [String : InfoPlist.Value] {
    return [
      "CFBundleShortVersionString": "1.0",
      "CFBundleVersion": "1",
      "UIMainStoryboardFile": "",
      "UILaunchStoryboardName": "LaunchScreen",
      "UIApplicationSceneManifest": [
        "UIApplicationSupportsMultipleScenes": false
      ]
    ]
  }

  public static func framework(
    name: String,
    product: Product = .staticLibrary,
    platform: Platform = platform,
    //resources: [FileElement]? = nil,
    resources: ResourceFileElements? = nil,
    dependencies: [TargetDependency] = [],
    interfaceFolder: String? = nil,
    interfaceDependencies: [TargetDependency] = [],
    testFolder: String? = nil,
    testDependencies: [TargetDependency] = []
  ) -> Project {
    return project(
      name: name,
      product: product,
      platform: platform,
      resources: resources,
      dependencies: dependencies,
      interfaceFolder: interfaceFolder,
      interfaceDependencies: interfaceDependencies,
      testFolder: testFolder,
      testDependencies: testDependencies
    )
  }

  public static func project(
    name: String,
    packages: [Package] = [],
    product: Product,
    platform: Platform = platform,
    //resources: [FileElement]? = nil, //??????
    resources: ResourceFileElements? = nil,
    dependencies: [TargetDependency] = [],
    infoPlist: [String: InfoPlist.Value] = [:],
    settings: Settings? = nil,
    interfaceFolder: String? = nil,
    interfaceDependencies: [TargetDependency] = [],
    testFolder: String? = nil,
    testDependencies: [TargetDependency] = []
  ) -> Project {

    let targets = buildAppTargets(name: name,
                                  platform: platform,
                                  product: product,
                                  infoPlist: infoPlist,
                                  settings: settings,
                                  resources: resources,
                                  dependencies: dependencies,
                                  interfaceFolder: interfaceFolder,
                                  interfaceDependencies: interfaceDependencies,
                                  testFolder: testFolder,
                                  testDependencies: testDependencies)
    return Project(
      name: name,
      packages: packages,
      settings: settings,
      targets: targets,
      // Don't generate Assets.swift
      resourceSynthesizers: []
    )
  }

  private static func buildAppTargets(name: String,
                                      platform: Platform,
                                      product: Product,
                                      infoPlist: [String: InfoPlist.Value] = [:],
                                      settings: Settings? = nil,
                                      resources: ResourceFileElements? = nil,
                                      dependencies: [TargetDependency] = [],
                                      interfaceFolder: String? = nil,
                                      interfaceDependencies: [TargetDependency] = [],
                                      testFolder: String? = nil,
                                      testDependencies: [TargetDependency] = []
  ) -> [Target] {
    var targets: [Target] = []

    var mainDependencies: [TargetDependency] = dependencies

    if let interfaceFolder = interfaceFolder {
      targets.append (
        Target(
          name: "\(name)Interface",
          platform: platform,
          product: product,
          bundleId: "com.globant.\(name.lowercased())",
          deploymentTarget: deploymentTarget,
          infoPlist: .extendingDefault(with: infoPlist),
          sources: ["\(interfaceFolder)/**"],
          resources: nil,  //???
          dependencies: interfaceDependencies
        )
      )

      mainDependencies.append(
        .target(name: "\(name)Interface")
      )
    }

    targets.append (
      Target(
        name: name,
        platform: platform,
        product: product,
        bundleId: "com.globant.\(name.lowercased())",
        deploymentTarget: deploymentTarget,
        infoPlist: .extendingDefault(with: infoPlist),
        sources: ["/**"],
        resources: resources,  //???
        //resources: ["Resources/**"],
        dependencies: mainDependencies,
        settings: settings
      )
    )

    if let testFolder = testFolder {
      targets.append (
        Target(
          name: "\(name)Tests",
          platform: platform,
          product: .unitTests,
          bundleId: "com.globant.\(name.lowercased())Tests",
          infoPlist: .default,
          //sources: "Tests/**",
          sources: "\(testFolder)/**",
          dependencies: [
            .target(name: "\(name)")
          ]
          + testDependencies
        )
      )
    }

    return targets
  }
}
