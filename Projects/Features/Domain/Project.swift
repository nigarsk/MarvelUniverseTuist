import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
  name: "Domain",
  dependencies: [
    .project(
      target: "Data",
      path: .relativeToRoot("Projects/Features/Data")
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
