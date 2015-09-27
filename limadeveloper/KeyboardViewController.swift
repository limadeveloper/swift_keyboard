//
//  KeyboardViewController.swift
//  limadeveloper
//
//  Created by John Lima on 9/27/15.
//  Copyright © 2015 John Lima. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    // MARK: - Properties
    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var deleteButton: UIButton!
    @IBOutlet var collection: UICollectionView!
    
    var data: NSArray = NSArray()

    // MARK: - View lifecycle
    override func updateViewConstraints() {
        super.updateViewConstraints()
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Perform custom UI setup here
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        self.deleteButton.addTarget(self, action: "deleteText:", forControlEvents: UIControlEvents.TouchUpInside)
        
        getData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }
    
    // MARK: - Actions
    func getData() {
        data = ["🍊", "🍏", "🍎", "🍐", "🍋", "🍌", "🍉", "🍇", "🍓", "🍈", "🍒", "🍑", "🌽", "🍠", "🍯", "🍞", "🍤", "🍗"]
        collection.reloadData()
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        
        cell.backgroundColor = UIColor.clearColor()
        cell.backgroundView?.backgroundColor = UIColor.clearColor()
        
        let button = UIButton(frame: CGRectMake(0, 0, 50, 50))
        button.setTitle(data.objectAtIndex(indexPath.item) as? String, forState: UIControlState.Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(50)
        button.titleLabel?.textAlignment = NSTextAlignment.Center
        button.backgroundColor = UIColor.clearColor()
        button.tag = indexPath.item
        button.addTarget(self, action: "addText:", forControlEvents: UIControlEvents.TouchUpInside)
        
        cell.addSubview(button)
        
        return cell
    }
    
    func addText(sender: UIButton) {
        let proxy = self.textDocumentProxy
        proxy.insertText(sender.titleForState(UIControlState.Normal)!)
    }
    
    func deleteText(sender: UIButton) {
        let proxy = self.textDocumentProxy
        proxy.deleteBackward()
    }

}
