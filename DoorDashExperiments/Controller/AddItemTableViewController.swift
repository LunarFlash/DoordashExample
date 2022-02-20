//
//  AddItemTableViewController.swift
//  DoorDashExperiments
//
//  Created by Yi Wang on 2/17/22.
//

import UIKit

class AddItemTableViewController: UITableViewController {
  
  @IBSegueAction func toAddModSegue(_ coder: NSCoder) -> AddModifierTableViewController? {
    let vc = AddModifierTableViewController(coder: coder)
    vc?.didSaveModifier = { [weak self] mod in
      guard let mod = mod else { return }
      self?.item?.modifiers.append(mod)
      self?.tableView.reloadData()
    }
    return vc
  }
  
  @IBAction func didTapCancel(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  var item: MenuItem? = MenuItem(name: "", description: "", price: 0)
  
  var didAddItem: ((MenuItem) -> Void)?
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 4
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 3:
      return item?.modifiers.count ?? 0
    default:
      return 1
    }
  }
  
  
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
     switch indexPath.section {
     case 0:
       let cell = tableView.dequeueReusableCell(withIdentifier: "TextEntryCell", for: indexPath) as! TextEntryTableViewCell
       cell.textField.placeholder = "item name"
       cell.didEndEditing = { [weak self] text in
         guard let text = text else { return }
         self?.item?.name = text
       }
       return cell
     case 1:
       let cell = tableView.dequeueReusableCell(withIdentifier: "TextEntryCell", for: indexPath) as! TextEntryTableViewCell
       cell.textField.placeholder = "description"
       cell.didEndEditing = { [weak self] text in
         guard let text = text else { return }
         self?.item?.description = text
       }
       return cell
     case 2:
       let cell = tableView.dequeueReusableCell(withIdentifier: "TextEntryCell", for: indexPath) as! TextEntryTableViewCell
       cell.textField.placeholder = "price"
       cell.didEndEditing = { [weak self] text in
         guard let text = text,
                let price = Double(text) else { return }
         self?.item?.price = price
       }
       return cell
     default:
       let cell = tableView.dequeueReusableCell(withIdentifier: "ModifierCell", for: indexPath)
       let modifier = item?.modifiers[indexPath.row]
       guard let name = modifier?.name else { return cell }
       cell.textLabel?.text = "\(name) \(String(describing: modifier?.options.count)) options"
       return cell
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
