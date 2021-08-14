import SwiftUI

struct RepoListView: View {
	private let mockRepos = [
		Repo(id: 1, name: "Test Repo1", owner: User(name: "User1"), description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", stargazersCount: 10),
		Repo(id: 2, name: "Test Repo2", owner: User(name: "User2"), description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", stargazersCount: 10),
		Repo(id: 3, name: "Test Repo3", owner: User(name: "User3"), description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", stargazersCount: 10),
		Repo(id: 4, name: "Test Repo4", owner: User(name: "User4"), description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", stargazersCount: 10),
		Repo(id: 5, name: "Test Repo5", owner: User(name: "User5"), description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", stargazersCount: 10),
		Repo(id: 6, name: "Test Repo6", owner: User(name: "User6"), description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", stargazersCount: 10),
	]

	var body: some View {
		List(mockRepos) { repo in
			RepoRow(repo: repo)
		}
	}
}

struct RepoListView_Previews: PreviewProvider {
	static var previews: some View {
		RepoListView()
	}
}
