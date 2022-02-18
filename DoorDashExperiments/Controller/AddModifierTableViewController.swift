//
//  AddOptionTableViewController.swift
//  DoorDashExperiments
//
//  Created by Yi Wang on 2/17/22.
//

import UIKit

class AddModifierTableViewController: UITableViewController {
    
    var modifier: Modifier?
        
    @IBAction func didTapSave(_ sender: Any) {
        didSaveModifier?(modifier)
    }
    
    @IBAction func didTapAddModifier(_ sender: Any) {
        handleAddModifier()
    }
    
    var didSaveModifier: ((Modifier?)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        if section == 1 {
            return modifier?.options.count ?? 0
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: TextEntryTableViewCell.reuseIdentifer, for: indexPath) as! TextEntryTableViewCell

            if let modifier = modifier {
                cell.textField.text = modifier.name
            } else {
                cell.textField.text = nil
            }

            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
            if let option = self.modifier?.options[indexPath.row] {
                cell.textLabel?.text = "\(option.name) $\(option.price)"
            }
            
            return cell
        default:
            fatalError("Cant dequeue proper cell")
        }
       
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AddModifierTableViewController {
    private func handleAddModifier() {
        let alert = UIAlertController(title: "Add an Option", message: nil, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { action in
            
        }
        alert.addAction(cancel)
        
        let ok = UIAlertAction(title: "Ok", style: .default) { [weak alert, weak self] action in
            guard let alert = alert,
            let titleTextField = alert.textFields?.first,
            let priceTextField = alert.textFields?.last,
            let modiferTitle = titleTextField.text,
            let priceStr = priceTextField.text,
            let price = Double(priceStr) else { return }
            print("title:\(modiferTitle) price:\(price)")
            let option = ModifierOption(name: modiferTitle, price: price)
            if self?.modifier == nil {
                self?.modifier = Modifier(name: "")
            }
            self?.modifier?.options.append(option)
            
            self?.tableView.reloadData()
        }
        
        alert.addAction(ok)
        
        alert.addTextField { textfield in
            textfield.placeholder = "Option"
        }
        alert.addTextField { textfield in
            textfield.placeholder = "Price"
        }
        
        
        self.present(alert, animated: true)
    }
}
