import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
  name: "Data",
  dependencies: [
    .package(product: "Alamofire"),
    .package(product: "AlamofireImage"),
  ],
  testFolder: "Tests",
  testDependencies: [
    .package(product: "Alamofire"),
    .package(product: "AlamofireImage"),
  ]
)
