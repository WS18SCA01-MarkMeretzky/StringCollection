//
//  StringCollectionViewController.swift
//  StringCollection
//
//  Created by Mark Meretzky on 4/5/19.
//  Copyright © 2019 New York University School of Professional Studies. All rights reserved.
//

import UIKit;

private let reuseIdentifier = "Cell";

class StringCollectionViewController: UICollectionViewController {
    let strings: [String] = (0 ... 31).map {String($0)}

    override func viewDidLoad() {
        super.viewDidLoad();

        // Uncomment the following line to preserve selection between presentations
        // clearsSelectionOnViewWillAppear = false;

        // Register cell classes
        //collectionView!.register(StringCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier);

        // Do any additional setup after loading the view.
        collectionView.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        print("viewDidLoad(), collectionView.frame = \(collectionView.frame)");
    }
    
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews(), collectionView.frame = \(collectionView.frame)");
        collectionViewLayout.prepare();
        
        for row in (0 ..< strings.count) {
            let indexPath: IndexPath = IndexPath(row: row, section: 0);
            if let attributes: UICollectionViewLayoutAttributes = collectionViewLayout.layoutAttributesForItem(at: indexPath) {
                print("\(row) \"\(strings[row])\" \(attributes.frame)");
            }
        }
        print();
        
        print("type(of: collectionViewLayout) = \(type(of: collectionViewLayout))");
        guard let collectionViewFlowLayout: UICollectionViewFlowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return;
        }

        print("""
            collectionViewFlowLayout.itemSize = \(collectionViewFlowLayout.itemSize)
            collectionViewFlowLayout.minimumLineSpacing = \(collectionViewFlowLayout.minimumLineSpacing)
            collectionViewFlowLayout.minimumInteritemSpacing = \(collectionViewFlowLayout.minimumInteritemSpacing)
            
            """);
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return strings.count;
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: StringCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! StringCollectionViewCell;
    
        // Configure the cell.
        cell.label.text = strings[indexPath.row];
        return cell;
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

extension StringCollectionViewController: UICollectionViewDelegateFlowLayout {
/*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = indexPath.row == 30 ? 50 + 11 + 50 : 50
        return CGSize(width: width, height: 50);
    }
*/
    
/*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 100;
    }
*/

/*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 100;
    }
*/
}
