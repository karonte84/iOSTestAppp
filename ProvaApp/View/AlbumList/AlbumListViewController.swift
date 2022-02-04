//
//  AlbumListViewController.swift
//  ProvaApp
//
//  Created by michael.sanelli on 03/02/22.
//

import UIKit

class AlbumListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let data : [Artist] = [
        Artist(artistName: "AC/DC", albums: [
            Album(nameAlbum: "Highway to Hell", publishedYear: "1979"),
            Album(nameAlbum: "Back in Black", publishedYear: "1980"),
        ]),
        Artist(artistName: "Queen", albums: [
            Album(nameAlbum: "Queen", publishedYear: "1973"),
            Album(nameAlbum: "Queen II", publishedYear: "1974"),
        ]),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AlbumListViewController : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumTableViewCell") as? AlbumTableViewCell
        let item = data[indexPath.section].albums[indexPath.item]
        cell?.setData(albumName: item.nameAlbum, publishedYear: item.publishedYear)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = data[section].artistName
        return label
    }
}


struct Album {
    let nameAlbum : String, publishedYear : String
}

struct Artist {
    let artistName : String
    let albums : [Album]
}
