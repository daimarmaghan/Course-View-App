//
//  CourseListView.swift
//  course view
//
//  Created by Daim Armaghan on 15/06/2023.
//

import SwiftUI

struct CourseListView: View {
    @State var courses: [Courses]=[]
    var body: some View {
        if courses.count==0{
            VStack{
                ProgressView()
                    .padding()
                Text("Talking with interweb....")
                    .foregroundColor(.purple)
            }.onAppear(perform: getCourses)
        }
        else
        {
            ScrollView{
                VStack{
                    ForEach(courses){
                        item in
                        CourseTile(item: item)
                            .padding(.vertical,5)
                    }
                }
            }
        }
            
    }
    
    private func getCourses()
    {
        if let url = URL(string: "https://zappycode.com/api/courses?format=json") {
            var courseResponse = URLRequest(url: url)
            courseResponse.httpMethod="GET"
            URLSession.shared.dataTask(with: courseResponse){
                (data, response, error) in
                if error != nil {
                    print("There is error")
                    print(error!)
                }
                else if data != nil {
                    if let res = try? JSONDecoder().decode([Courses].self, from: data!)
                    {
                        print(res)
                        courses=res
                        print("Count of courses: ",courses.count)
                    }
                    else
                    {
                        print("Error..")
                    }
                }
            }.resume()
            
        }
        else {
            print("There is error 2")
        }
        
    }
}

//https://zappycode.com/api/courses?format=json

struct Courses: Codable, Identifiable {
    var id: Int
    var image: String
    var title: String
    var subtitle: String
}

struct TemplateView_Previews: PreviewProvider {
    static var previews: some View {
        Image(systemName: "books.vertical")
            .font(.system(size: 50))
            .frame(maxWidth:.infinity)
            .padding(80)
            .background(Color.gray)
    }
}


struct CourseListView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView()
    }
}
