//
//  ProfileView.swift
//  Follow-App-Data-Flow
//
//  Created by Alfeu Panzo Bena on 24/12/24.
//

import SwiftUI

// MARK: - VIEW
struct ProfileView: View {
    
    @EnvironmentObject var viewModel: ProfileViewModel

    var body: some View {
        VStack {
            ProfileDataView()
            ActionView()
        }
        .animation(.easeInOut, value: viewModel.isFollowing)
    }
}

struct ProfileDataView: View {
    
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
        Image(viewModel.user.picture)
            .resizable()
            .frame(width: 250, height: 250)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            .shadow(radius: 10)
            .padding(.bottom, 10)
        
        Text(viewModel.user.name)
            .font(.system(size: 50, weight: .bold))
        
        Text(viewModel.user.nick)
            .font(.system(size: 23, weight: .regular))
            .foregroundColor(.gray)
        
        Text(viewModel.user.job)
            .font(.system(size: 23, weight: .regular))
        
        Text(viewModel.userFollowers)
            .font(.system(size: 80, weight: .light))
            .padding(viewModel.isFollowing ? 40 : 25)
    }
}

struct ActionView: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack{
            
            //Seguir ---
            Button{ viewModel.followToggle() } label: {
                Label(!viewModel.isFollowing ? "Follow" : "unFollow", systemImage: "arrow.right.circle")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(!viewModel.isFollowing ? .blue : .black)
            
            //Seguir ---
            Button{} label: {
                Label("Enviar mensagem", systemImage: "envelope")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .disabled(!viewModel.isFollowing)
            
        }
        .padding(20)
    }
}


struct ProfileView_previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(ProfileViewModel())
    }
}
