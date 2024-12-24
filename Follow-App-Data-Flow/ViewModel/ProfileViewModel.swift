//
//  ProfileViewModel.swift
//  Follow-App-Data-Flow
//
//  Created by Alfeu Panzo Bena on 24/12/24.
//

import Foundation

// MARK: - VIEWMODEL
class ProfileViewModel: ObservableObject {
    
    //Processed Data -----
    @Published var isFollowing = false
    @Published var userFollowers = String()
    
    var user = User(picture: "profile_alfeu",
                    name: "Alfeu Bena",
                    nick: "@alfeubena",
                    job: "Software Engineer",
                    followers: 22643)
    
    init() {
        loadFollowers()
    }
    
    func loadFollowers() {
        self.userFollowers = customizeNumber(value: user.followers)
    }
    
    func customizeNumber(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "pt_AO")
        let shorten = formatter.string(for: value) ?? "0"
        return "\(shorten)K"
    }
    
    func followToggle() {
        self.isFollowing.toggle()
        self.isFollowing ? (self.user.followers += 1) : (self.user.followers -= 1)
        loadFollowers()
    }
    
    
}
