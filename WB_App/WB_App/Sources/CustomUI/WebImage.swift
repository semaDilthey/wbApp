import SwiftUI

fileprivate enum LoadingState {
    case loading
    case success(image: UIImage)
    case error(desctiption: String)
}

struct WebImage: View {
    
    private let imageLoader = ImageLoaderManager()
    private let urlString: String?

    @State private var loadingState : LoadingState = .loading
    
    init(urlString: String?) {
        self.urlString = urlString
    }

    var body: some View {
        Group {
            switch loadingState {
            case .loading:
                ProgressView()
            case .success(let image):
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            case .error:
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .onAppear {
            loadImage()
        }
    }
}

extension WebImage {
    
    private func loadImage() {
        guard let urlString = urlString else { return }

        imageLoader.loadImage(urlString: urlString) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    self.loadingState = .success(image: image)
                case .failure(let error):
                    self.loadingState = .error(desctiption: error.localizedDescription)
                }
            }
        }
    }

}

#Preview {
    WebImage(urlString: "https://sun9-58.userapi.com/impg/Dju4VUcTBsLOzWBkCphMkEBd4n_fuix1NOBaMA/CiGJ_70-Z9E.jpg?size=1000x1000&quality=95&sign=368ceb8d3efee5ba3f6ccb9006141e8b&type=album")
}
