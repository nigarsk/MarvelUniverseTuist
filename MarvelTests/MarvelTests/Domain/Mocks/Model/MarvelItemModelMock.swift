@testable import MarvelIndia

extension MarvelItemModel {
    static func dummyModel() -> MarvelItemModel {
        return MarvelItemModel(marvelId: 14,
                               marvelName: "Doctor Stranger",
                               marvelURL: nil)
    }
}
