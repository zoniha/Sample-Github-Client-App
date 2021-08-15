import SwiftUI
import Combine

class ReposLoader: ObservableObject {
	@Published private(set) var repos = [Repo]()
	@Published private(set) var error: Error? = nil
	@Published private(set) var isLoading = false

	private var cancellables = Set<AnyCancellable>()

	func call() {
		let url = URL(string: "https://api.github.com/users/zoniha/repos")!

		var urlRequest = URLRequest(url: url)
		urlRequest.httpMethod = "GET"
		urlRequest.allHTTPHeaderFields = [
			"Accept": "application/vnd.github.v3+json"
		]

		let reposPublisher = URLSession.shared.dataTaskPublisher(for: urlRequest)
			.tryMap() { element -> Data in
				guard let httpResponse = element.response as? HTTPURLResponse,
					  httpResponse.statusCode == 200 else {
					throw URLError(.badServerResponse)
				}
				return element.data
			}
			.decode(type: [Repo].self, decoder: JSONDecoder())

		reposPublisher
			.handleEvents(receiveSubscription: {
				[weak self] _ in self?.isLoading = true
			})
			.receive(on: DispatchQueue.main)
			.sink(receiveCompletion: { [weak self] completion in
				switch completion {
				case .failure(let error):
					print("Error: \(error)")
					self?.error = error
				case .finished:
					print("Finished")
				}
			}, receiveValue: { [weak self] repos in
				self?.repos = repos
			}
			).store(in: &cancellables)
	}
}

struct RepoListView: View {
	@StateObject private var reposLoader = ReposLoader()
	var body: some View {
		NavigationView {
			if reposLoader.error != nil {
				VStack {
					Group {
						Image("GitHubMark")
						Text("Failed to load repositories")
							.padding(.top, 4)
					}
					.foregroundColor(.black)
					.opacity(0.4)
					Button(
						action: {
							reposLoader.call()
						},
						label: {
							Text("Retry")
								.fontWeight(.bold)
						}
					)
					.padding(.top, 8)
				}
			} else {
				if reposLoader.repos.isEmpty {
					ProgressView("loading...")
				} else {
					List(reposLoader.repos) { repo in
						NavigationLink(
							destination: RepoDetailView(repo: repo)) {
							RepoRow(repo: repo)
						}
					}
					.navigationTitle("Repositories")
				}
			}
		}
		.onAppear {
			reposLoader.call()
		}
	}
}

struct RepoListView_Previews: PreviewProvider {
	static var previews: some View {
		RepoListView()
	}
}
