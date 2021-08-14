import SwiftUI

struct ContentView: View {
	var body: some View {
		HStack {
			Image("GitHubMark")
				.resizable()
				.frame(width: 44, height: 44, alignment: .center)
			VStack(alignment: .leading) {
				Text("Owner Name")
					.font(.caption)
				Text("Repository Name")
					.fontWeight(.semibold)
					.font(.body)
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
