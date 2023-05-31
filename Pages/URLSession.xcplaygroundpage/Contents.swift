import Foundation

//configuration -> urlSession -> urlSessionTask

let configuration = URLSessionConfiguration.default
let session = URLSession(configuration: configuration)

let url = URL(string: "http://api.github.com/users/torinunna")!
let task = session.dataTask(with: url) { data, response, error in
    guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
        print("--> resoponse \(response)")
        return
    }
    
    guard let data = data else { return }
    
    let result = String(data: data, encoding: .utf8)
    print(result)
}

task.resume()
