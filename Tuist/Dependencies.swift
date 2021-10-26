import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: [
        .remote(url: "https://github.com/Alamofire/Alamofire.git",
                requirement: .upToNextMajor(from: "5.4.3")),
        .remote(url: "https://github.com/Alamofire/AlamofireImage.git",
                requirement: .upToNextMajor(from: "4.2.0")),
    ],
    platforms: [.iOS]
)

