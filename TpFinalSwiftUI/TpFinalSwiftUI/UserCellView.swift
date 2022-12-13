//
//  UserCellView.swift
//  UserList
//
//  Created by digital on 01/12/2022.
//

import SwiftUI

struct UserCellView: View {
    @Binding var user:User
    var body: some View {
        VStack{
            HStack{
                VStack{
                    HStack{
                        Text(user.name)
                        Text(user.username)
                    }.fontWeight(.bold)
                    Text(user.phone)
                    Spacer()
                    Text(user.company.name)
                    Text(user.company.catchPhrase)
                    Text(user.company.bs)
                }
                Spacer()
                Spacer()
                //AsyncImage(url: URL(string: "https://st2.depositphotos.com/7813472/12360/v/950/depositphotos_123602044-stock-illustration-rainbow-flower-logo-and-placeholder.jpg")).frame(width: CGFloat(30))
                Image(systemName: "globe")
                }
            HStack{
                Spacer()
                Text(user.website)
            }
        }.fontWidth(.condensed)
            .font(.callout)
    }
}

struct UserCellView_Previews: PreviewProvider {
    
    @State static var user = User.defaultuser()

    static var previews: some View {
        UserCellView(user: $user)
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/400.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/101.0/*@END_MENU_TOKEN@*/))
    }
}
