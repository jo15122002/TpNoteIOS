//
//  UserAlbumsView.swift
//  TpFinalSwiftUI
//
//  Created by digital on 13/12/2022.
//

import SwiftUI

struct UserAlbumsView: View {
    @Binding var user:User
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct UserAlbumsView_Previews: PreviewProvider {
    @State static var user = User.defaultuser()
    static var previews: some View {
        UserAlbumsView(user: $user)
    }
}
