//
//  ViewController.swift
//  ParsingJSON
//
//  Created by Дмитрий Рузайкин on 28.08.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView! //Аутлет для tableView
    var state = [StateJSON]() //создаем экземпляр класса в виде массива StateJSON
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Функция, которую прописываем ниже
        downloadJSON {
            self.tableView.reloadData() //Обновляем tableView
        }
        //подписываемся на протоколы, выше их наследуем
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //количество ячек будет зависеть от колиества записей в state (StateJSON)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return state.count
    }
    //что за ячейки будут...
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil) //стндартная запись с cell
        cell.textLabel?.text = state[indexPath.row].name.capitalized //стндартная запись с cell
        return cell //вовращаем cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self) //выбо ячейки, когда мы ее выбираем
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController{
            destination.state = state[tableView.indexPathForSelectedRow!.row]
        }
    }

    func downloadJSON(completed: @escaping () -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments") else{
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil{
                do{
                    self.state = try JSONDecoder().decode([StateJSON].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                    print("\(self.state)")
                } catch{
                    print("JSON Error")
                }
            }
        }.resume()
    }

}

