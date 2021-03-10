//
//  DetailViewController.swift
//  RickMorty
//
//  Created by Miguel Manrique on 09/03/2021.
//

import Foundation

import UIKit
import rick_morty_swift_api

class DetailViewController: UIViewController {
    //var username: String = "M"
    var character : CharacterModel?
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var specie: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        name.text = character?.name
        let url = URL(string: character!.image)!
        let data = try? Data(contentsOf: url)
        if let imageData = data {
            image.image = UIImage(data: imageData)
        }
        specie.text = character?.species
    }
}
