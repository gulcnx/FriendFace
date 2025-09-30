//
//  ContentView.swift
//  FriendFace
//
//  Created by gülçin çetin on 22.09.2025.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Query var users: [User]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List(users, id: \.id) { user in
                VStack(alignment: .leading) {
                    NavigationLink("", value: user)
                    Text(user.name)
                        .font(.headline)
                    Text(user.isActive == true ? "🟢 Active" : "🔴 Offline")
                }
            }
            .navigationDestination(for: User.self) { user in
                DetailView(user: user)
            }
            .task {
                await loadData()
            }
            .navigationTitle("FriendFace")
        }
    }
    func loadData() async {
        if users.isEmpty{
            guard let url = URL(string:"https://www.hackingwithswift.com/samples/friendface.json") else {
                print("Invalid URL")
                return
            }
            do {
                let(data, _) = try await URLSession.shared.data(from: url)
                if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                    for user in decodedResponse {
                        modelContext.insert(user)
                    }
                }
            }
            catch { print("Invalid data")}
        }
    }
}

#Preview {
    ContentView()
}
