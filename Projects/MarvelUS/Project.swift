import ProjectDescription
import ProjectDescriptionHelpers


let project = Project.app(
  name: "MarvelUS",
  packages: [
    .remote(
      url: "https://github.com/Alamofire/Alamofire.git",
      requirement: .upToNextMajor(
        from: Version(5, 4, 3)
      )
    ),
    .remote(
      url: "https://github.com/Alamofire/AlamofireImage.git",
      requirement: .upToNextMajor(
        from: Version(4, 2, 0)
      )
    )
  ],
  resources: [
    "Resources/**"
  ],
  features: [],
  dependencies: []
)
