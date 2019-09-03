//
//  DetailKegiatanViewController.swift
//  BelajarAnimasiDenganSpriteKit
//
//  Created by Muhammad Rajab Priharsanto on 02/09/19.
//  Copyright © 2019 Muhammad Rajab Priharsanto. All rights reserved.
//

import UIKit
import CoreData

class DetailKegiatanViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var tanggalTableView: UITableView!
    
//    var nameArray = ["02-10-2019","03-10-2019","04-10-2019"]
//    var numberArray = [12345,12356,32142]
//
//    var contact = [Contact]()
//
//    var names: [String] = []
    
    var detailAgendaKegiatan: [NSManagedObject] = []
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundPelangi.png")!)
        // Do any additional setup after loading the view.
        
        //bisa error Could not cast value of type 'UITableViewCell' (0x21a9358b0) to 'BelajarAnimasiDenganSpriteKit.TanggalTableViewCell'
        //guarantees your table view will return a cell of the correct type when the TanggalCell reuseIdentifier is provided to the dequeue method.
        //tanggalTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TanggalCell")
        
//        for i in 0..<nameArray.count
//        {
//            let data = Contact(name:nameArray[i], number:numberArray[i])
//
//            contact.append(data)
//        }
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        //1
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else
        {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "AgendaKegiatanHarian")
        
        //3
        do {
            detailAgendaKegiatan = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    @IBAction func addTanggal(_ sender: UIButton)
    {
        let alert = UIAlertController(title: "New Name",
                                      message: "Add a new name",
                                      preferredStyle: .alert)
        
//        let saveAction = UIAlertAction(title: "Save",
//                                       style: .default) {
//                                        [unowned self] action in
//
//                                        guard let textField = alert.textFields?.first,
//                                            let nameToSave = textField.text else {
//                                                return
//                                        }
//
//                                        self.names.append(nameToSave)
//                                        self.tanggalTableView.reloadData()
//        }
        
        let saveAction = UIAlertAction(title: "Save", style: .default) {
            [unowned self] action in
            
            guard let textField = alert.textFields?.first,
                let nameToSave = textField.text else {
                    return
            }
            
            self.save(name: nameToSave)
            self.tanggalTableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel)
        
        alert.addTextField()
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    //untuk return baris dalam tableview sesuai dengan isi arraynya
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //return contact.count
        //return names.count
        return detailAgendaKegiatan.count
    }
    
    //untuk memasukkan data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let agendaKegiatanHarian = detailAgendaKegiatan[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TanggalCell", for: indexPath) as! TanggalTableViewCell
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "TanggalCell", for: indexPath)
        
        //Note how you grab the tanggal attribute from the NSManagedObject. It happens here:
        cell.tanggalLabel.text = agendaKegiatanHarian.value(forKeyPath: "tanggal") as? String
        
        //cell.tanggalLabel.text = names[indexPath.row]
        
        //cell?.tanggalLabel.text = contact[indexPath.row].name
        //cell?.nameLabel.text = contact[indexPath.row].name
        //cell?.numberLabel.text = "\(contact[indexPath.row].number)"
        
        return cell
    }
    
    func save(name: String)
    {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else
        {
                return
        }
        
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 2
        let entity =
            NSEntityDescription.entity(forEntityName: "AgendaKegiatanHarian",
                                       in: managedContext)!
        
        let agendaKegiatanHarian = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        // 3
        agendaKegiatanHarian.setValue(name, forKeyPath: "tanggal")
        
        // 4
        do
        {
            try managedContext.save()
            detailAgendaKegiatan.append(agendaKegiatanHarian)
        }
        catch let error as NSError
        {
            print("Could not save. \(error), \(error.userInfo)")
        }
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
