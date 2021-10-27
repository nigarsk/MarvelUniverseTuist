import ProjectDescription

extension Project {
  public static func featureFramework(name: String, dependencies: [TargetDependency] = []) -> Project {
    return Project(
        name: name,
        targets: [
            Target(
                name: name,
                platform: .iOS,
                product: .framework,
                bundleId: "com.globant.\(name)",
                infoPlist: "\(name)/info.plist",
                sources: ["\(name)/Sources/**"],
                resources: ["\(name)/Resources/**",],
                dependencies: dependencies
            ),
            Target(
                name: "\(name)Tests",
                platform: .iOS,
                product: .unitTests,
                bundleId: "com.globant.\(name)Tests",
                infoPlist: "\(name)Tests/info.plist",
                sources: ["\(name)Tests/Sources/**"],
                resources: ["\(name)Tests/Resources/**",],
                dependencies: [.target(name: name)]
            )
        ]
    )
  }
}
