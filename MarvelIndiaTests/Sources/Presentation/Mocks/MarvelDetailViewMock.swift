@testable import MarvelIndia

final class MarvelDetailViewMock: MarvelDetailViewContract {
    var presenter: MarvelDetailPresenterContract!
    var state: MarvelDetailViewState?

    func changeViewState(_ state: MarvelDetailViewState) {
        self.state = state
    }
}
