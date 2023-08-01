//
//  CourseTile.swift
//  course view
//
//  Created by Daim Armaghan on 20/06/2023.
//

import SwiftUI

struct CourseTile: View {
    @State var item:Courses
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: item.image)){
                phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                default:
                    Image(systemName: "books.vertical")
                        .font(.system(size: 50))
                        .frame(maxWidth:.infinity)
                        .padding(80)
                        .background(Color.gray)
                }
            }
            VStack{
                Spacer()
                HStack{
                    Text(item.title).font(.system(size:12))
                        .foregroundColor(.white)
                        .bold()
                        .padding(.horizontal,5)
                        .padding(.vertical)
                    Spacer()
                }.background(Color.purple.opacity(0.8))
            }
        }
    }
}

struct CourseTile_Previews: PreviewProvider {
    static var previews: some View {
        CourseTile(item: Courses(id: 5, image: "https://zappycode.com/media/course_images/SwiftUI_Icon_HmeWqXJ.jpg", title: "Mastering Django - AJAX", subtitle: "Class Based Views"))
            .frame(maxHeight: 200)
    }
}
