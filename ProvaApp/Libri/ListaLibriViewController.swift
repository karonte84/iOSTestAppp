//
//  ListaLibriViewController.swift
//  ProvaApp
//
//  Created by michael.sanelli on 03/02/22.
//

import UIKit

class ListaLibriViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    private let data: [Libro] = [Libro(titolo: "Una cosa da nascondere", autore: "Elizabeth George", anno: "2022", sinossi: "Un percorso a ostacoli tra omissioni, pressioni indebite e falsi indizi, le menzogne e i segreti di una comunità solo in apparenza unita e solidale, che nasconde sotto la superficie terribili verità e consuetudini crudeli.", copertina: "https://www.ibs.it/images/9788830455238_0_536_0_75.jpg"),
                                 Libro(titolo: "Una cosa da nascondere", autore: "Elizabeth George", anno: "2022", sinossi: "Un percorso a ostacoli tra omissioni, pressioni indebite e falsi indizi, le menzogne e i segreti di una comunità solo in apparenza unita e solidale, che nasconde sotto la superficie terribili verità e consuetudini crudeli.", copertina: "https://www.ibs.it/images/9788830455238_0_536_0_75.jpg"),
                                 Libro(titolo: "Una cosa da nascondere", autore: "Elizabeth George", anno: "2022", sinossi: "Un percorso a ostacoli tra omissioni, pressioni indebite e falsi indizi, le menzogne e i segreti di una comunità solo in apparenza unita e solidale, che nasconde sotto la superficie terribili verità e consuetudini crudeli.", copertina: "https://www.ibs.it/images/9788830455238_0_536_0_75.jpg")]
    
    private var libroSelected : Libro? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let vc = segue.destination as? DettaglioLibroViewController
        
        vc?.libro = libroSelected
    }
    

}

extension ListaLibriViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LibriCollectionViewCell", for: indexPath) as? LibriCollectionViewCell
        cell?.setData(data[indexPath.row])
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        libroSelected = data[indexPath.row]
        
        self.performSegue(withIdentifier: "showLibro", sender: self)
    }
}

struct Libro {
    let titolo: String
    let autore : String
    let anno: String
    let sinossi: String
    let copertina: String
}
