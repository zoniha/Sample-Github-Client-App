import SwiftUI

struct RepoListView: View {
	@State private var mockRepos: [Repo] = []

	var body: some View {
		NavigationView {
			if mockRepos.isEmpty {
				ProgressView("loading...")
			} else {
				List(mockRepos) { repo in
					NavigationLink(
						destination: RepoDetailView(repo: repo)
					) {
						RepoRow(repo: repo)
					}
				}
				.navigationTitle("Repositories")
			}
		}
		.onAppear() {
			loadRepos()
		}
	}

	private func loadRepos() {
		DispatchQueue.main.asyncAfter(deadline: .now() + 1){
			mockRepos = [
				.mock1, .mock2, .mock3, .mock4, .mock5, .mock6
			]
		}
	}
}

struct RepoListView_Previews: PreviewProvider {
	static var previews: some View {
		RepoListView()
	}
}
