//
//  SelectTestTableViewController.swift
//  Beaker2
//
//  Created by Christopher Robison on 7/2/15.
//  Copyright (c) 2015 Christopher Robison. All rights reserved.
//

import UIKit

class SelectTestTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var CellIdentifier: UITableViewCell!
    @IBOutlet var testTableList: UITableView!
    var testList = core.data.config["tests"].arrayValue
    var collapseDetailViewController: Bool  = true
    var names = [String]()
    
    func getNameList() -> Array<String> {
        var names = [String]()
        for i in 0...testList.count - 1 {
            names.append(testList[i]["name"].stringValue)
        }
        return names
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.names.count == 0 {
            self.names = getNameList()
        }
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "CellIdentifier")
        self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count(testList)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->   UITableViewCell {
        var cell:UITableViewCell? = self.tableView.dequeueReusableCellWithIdentifier("CellIdentifier") as? UITableViewCell
        var details = split(self.names[indexPath.row]) { $0 == "-" }
        var detailTxt = (count(details) > 1) ? details[1] : ""
        
        if (cell != nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "CellIdentifier")
        }
        
        println("details: \(details) [\(count(details))]")
        
        cell!.textLabel?.text = details[0]
        cell!.detailTextLabel?.text = detailTxt
        return cell!
        
        /* var cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("CellIdentifier") as! UITableViewCell
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle,reuseIdentifier:"CellIdentifier")
        }
        
        let label = UILabel(frame: CGRect(x:0, y:0, width:200, height:50))
        label.text = testList[indexPath.row]["name"].stringValue
        cell.contentView.addSubview(label)

        return cell
        */
    }
    
    
    // UITableViewDelegate Functions
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showDetailSegue", sender: self)
        collapseDetailViewController = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("in prepareForSegue in SelectTestTableViewController \(segue.identifier)")
        
        if segue.identifier == "showDetailSegue" {
            
            // BeakerViewController should never be assigned to nil !!!
            var beakerViewController: BeakerViewController!
            
            // with help of adaptive segue we can support all devices
            if let BeakerNavigationController = segue.destinationViewController as? UINavigationController {
                
                // works on devices where UISplitViewController is implemented
                beakerViewController = BeakerNavigationController.topViewController as! BeakerViewController
                beakerViewController.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                beakerViewController.navigationItem.leftItemsSupplementBackButton = true
            } else {
                
                // works for iPhone on ios7, where UISplitViewController is not implemented
                beakerViewController = segue.destinationViewController as! BeakerViewController
            }
            // this is common part, where one can configure detail view
            // segue provides a new instance of detail view everytime
            if let selectedRowIndexPath = tableView.indexPathForSelectedRow() {
                let test = testList[selectedRowIndexPath.row].dictionaryValue
                beakerViewController.test = test
            }
        }
    }
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
