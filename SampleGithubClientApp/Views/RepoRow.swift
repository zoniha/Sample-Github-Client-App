import SwiftUI

struct RepoRow: View {
	let repo: Repo

	var body: some View {
		HStack {
			Image("GitHubMark")
				.resizable()
				.frame(width: 44, height: 44, alignment: .center)
			VStack(alignment: .leading) {
				Text(repo.owner.name)
					.font(.caption)
				Text(repo.name)
					.fontWeight(.semibold)
					.font(.body)
			}
		}
	}
}

struct RepoRow_Previews: PreviewProvider {
	static var previews: some View {
		RepoRow(repo: .mock1)
	}
}
