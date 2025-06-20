//
//  CategoryItemView.swift
//  BOmooder
//
//  Created by warbo on 11/6/25.
//

import SwiftUI

struct CategoryItemView: View {
    var iconName: String
    var categoryTitle: String
    var amount: String
    var iconColor: Color
    var body: some View {
        VStack(alignment:.leading){

                Image(systemName: iconName)
                .fontWeight(.medium)
                .foregroundColor(iconColor)
                .font(.system(size: 28))
                .padding(.top,5)
                
                
            Spacer()
                Text(categoryTitle)
                .font(.system(size: 18 ))
                .fontWeight(.medium)

                
                Text(amount)
                .font(.system(size: 15))
                .offset(y:10)
                

            Spacer()
                
        }//VSTACK
        .frame(width: 112,height: 112, alignment: .leading)
        .padding(.leading,12)
            .background(Color("ColorCategory"))
            .cornerRadius(18)
            
            
            
            
    }
}

#Preview {
    CategoryItemView(iconName: "heart", categoryTitle: "Favorite", amount: "2", iconColor: Color.teal)
}
