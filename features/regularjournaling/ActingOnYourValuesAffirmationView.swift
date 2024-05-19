//
//  ActingOnYourValues - Affirmation.swift
//  actapp
//
//  Created by Pedro Nicolas Cristiansen Hutabarat on 15/05/24.
//

import SwiftUI

struct ActingOnYourValuesAffirmationView: View {
    var body: some View {
        NavigationStack{
            
            VStack {
                Spacer()
                Spacer()
                VStack{
                    Text("Today, you demonstrated your values of:")
                        .font(.body).fontWeight(.regular).foregroundColor(Color.black)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                Spacer()
                VStack {
                    Text("Kindness, Hard work, Cooperative")
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.leading)
                        .font(.custom("Helvetica Neue Italic", size: 20))
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                Spacer()
                VStack{
                    Text("Here is prove of that:")
                        .font(.body).fontWeight(.regular).foregroundColor(Color.black)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                Spacer()
                VStack{
                    Text("This morning, I finished the proposal that my manager asked and got praised for my meticulous writing")
                        .fontWeight(.semibold).foregroundColor(Color.black).font(.system(size: 20))
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                Spacer()
                
                VStack{
                    Text("Tomorrow, you will focus on your values of:")
                        .font(.body).fontWeight(.regular).foregroundColor(Color.black)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                Spacer()
                VStack {
                    Text("Kindness, Hard work, Cooperative")
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.leading)
                        .font(.custom("Helvetica Neue Italic", size: 20))
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                Spacer()
                VStack{
                    Text("Here is prove of that:")
                        .font(.body).fontWeight(.regular).foregroundColor(Color.black)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                Spacer()
                VStack{
                    Text("This morning, I finished the proposal that my manager asked and got praised for my meticulous writing")
                        .fontWeight(.semibold).foregroundColor(Color.black).font(.system(size: 20))
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                Spacer()
                Spacer()
                Spacer()
                //                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                //                VStack{
                //                    Rectangle()
                //                        .stroke(.black, lineWidth: 2)
                //                        .fill(.gray)
                //                        .frame(width: 393, height: 425)
                //                        .frame(maxWidth: .infinity, alignment: .center)
                //                }
                Spacer()
                VStack{
                    Text("You have done great! Even tiny little actions of kindness can make a difference. Be kind to yourself and be present. ")
                        .font(.body).fontWeight(.semibold).foregroundColor(Color.black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                //            HStack {
                //                Button("Back") {
                //                    print("Button pressed!")
                //                }
                //                .buttonStyle(GrayButton())
                //
                //                .frame(width: 80)
                //
                //                Button("Finish") {
                //                    print("Button pressed!")
                //                }
                //                .buttonStyle(BlackButton())
                //
                //            }
                
                HStack {
                    NavigationLink( destination: ActingOnYourValuesReflectView()){
                        Text("Finish")
                            .modifier(ButtonGreen())
                    }
                }
                
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ActingOnYourValuesAffirmationView()
}
