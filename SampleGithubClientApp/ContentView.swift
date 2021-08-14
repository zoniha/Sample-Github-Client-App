import SwiftUI

struct ContentView: View {
	private let mockRepos = [
		Repo(id: 1, name: "Test Repo1", owner: User(name: "User1")),
		Repo(id: 2, name: "Test Repo2", owner: User(name: "User2")),
		Repo(id: 3, name: "Test Repo3", owner: User(name: "User3")),
		Repo(id: 4, name: "Test Repo4", owner: User(name: "User4")),
		Repo(id: 5, name: "Test Repo5", owner: User(name: "User5")),
		Repo(id: 6, name: "Test Repo6", owner: User(name: "User6")),
	]

	var body: some View {
		List(mockRepos) { repo in
			RepoRow(repo: repo)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
