import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
  name: "Marvel",
  dependencies: [
    .project(
      target: "Data",
      path: .relativeToRoot("Projects/Features/Data")
    ),
    .project(
      target: "Domain",
      path: .relativeToRoot("Projects/Features/Domain")
    ),
    .package(product: "Alamofire"),
    .package(product: "AlamofireImage"),
  ],
  testFolder: "Tests",
  testDependencies: [
    .package(product: "Alamofire"),
    .package(product: "AlamofireImage"),
  ]
)
