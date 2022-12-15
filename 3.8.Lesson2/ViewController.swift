//
//  ViewController.swift
//  3.8.Lesson2
//
//  Created by anjella on 12/12/22.

//Создать приложение заметки. Заметки выводятся в tableView. Ячейка состоит из Label (Title заметок) и ImageView (пустой квадратик). Добавить функцию добавления заметки через алерт конроллер. При нажатии на квадратик заменять картинку на квадратик с галочкой. Ячейки с галочками должны выстраиваться сверху.


import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
//    @IBAction func pushAddAction(_ sender: Any) {
//        let alertController = UIAlertController(title: "Добавить в заметку?", message: nil, preferredStyle: .alert)
//
//        alertController.addTextField { (textField) in
//            textField.placeholder = "New item name"
//        }
//
//
//        let alertAction1 = UIAlertAction(title: "Cancel", style: .default) { (alert) in
//
//        }
//
//        let alertAction2 = UIAlertAction(title: "Create", style: .cancel) { (alert) in
//
//            let newItem = alertController.textFields![0].text
//            addItem(nameItem: newItem!)
//            self.tableView.reloadData()
//        }
//
//        alertController.addAction(alertAction1)
//        alertController.addAction(alertAction2)
//
//
//        present(alertController, animated: true, completion: nil)
//    }
//
    var data: [DataModel] = [
    DataModel(words: "Belek",image: "circle"),
    DataModel(words: "Ayana",image: "circle"),
    DataModel(words: "Janna",image: "circle"),
    DataModel(words: "Beka",image: "circle"),
    DataModel(words: "Dina",image: "circle")
    ]
    var filteredNotes = [DataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        // Do any additional setup after loading the view.
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addButtonTap))
        
//        title = "Заметка"
        
    
   
}
    @objc func addButtonTap () {
            let alert = UIAlertController(title: nil, message: "Добавить в заметку?", preferredStyle: .alert)

            var textField = UITextField()

            alert.addTextField { alertTextField in
                textField = alertTextField
                textField.placeholder = "Введите..."
//                textField = alertTextField
            }

            let yesAction = UIAlertAction(title: "Да", style: .cancel) { action in ()
                let notes = DataModel(words: textField.text ?? "", image: "circle")
                self.data.insert(notes, at: 0)
                
                self.filteredNotes = self.data
                
                
////

                self.tableView.reloadData()
            }
            let noAction = UIAlertAction(title: "Нет", style: .destructive) { action in
                ()
            }
            alert.addAction(yesAction)
            alert.addAction(noAction)
            present(alert, animated: true)
        }
}

    
//



extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "data_cell", for: indexPath) as! DataCell2
        
        
        cell.wordLabel.text = data[indexPath.row].words
        cell.imageIconView.image = UIImage(systemName: "circle")
        return cell
    }

}


extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
