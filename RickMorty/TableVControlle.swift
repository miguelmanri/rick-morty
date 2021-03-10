//
//  TableVControlle.swift
//  RickMorty
//
//  Created by Miguel Manrique on 05/03/2021.
//

import UIKit
import rick_morty_swift_api

class TableVController: UITableViewController {

    var ch = [CharacterModel]()
    var valueToPass: CharacterModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let rmClient = Client()
        rmClient.character().getAllCharacters() {
                switch $0 {
                case .success(let characters):
                    self.ch = characters
                    self.tableView.reloadData()
                case.failure(let error):
                    print(error)
                    }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return ch.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var Cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        Cell.textLabel?.text = ch[indexPath.row].name
        let url = URL(string: ch[indexPath.row].image)!
        let data = try? Data(contentsOf: url)
        if let imageData = data {
            Cell.imageView?.image = UIImage(data: imageData)
        }
        
        return Cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "View" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! DetailViewController
                let value = ch[indexPath.row]
                controller.character = value
            }
        }
    }
}




