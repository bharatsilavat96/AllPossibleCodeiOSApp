//
//  AllUIIementsListViewController.swift
//  AllInOneiOSProjectApp
//
//  Created by Apple on 18/04/23.
//

import UIKit

class AllUIIementsListViewController: UIViewController {

    @IBOutlet weak var allElementTableView: UITableView!
    
    let uiElementsArray = ["UIView", "UIWindow", "UIControl", "UILabel", "UITextField", "UITextView", "UIButton", "UIImageView", "UITableView", "UITableViewCell", "UICollectionView", "UICollectionViewCell", "UISegmentedControl", "UISlider", "UIProgressView", "UIActivityIndicatorView", "UIStepper", "UISwitch", "UIDatePicker", "UIPickerView", "UIPageControl", "UINavigationBar", "UIBarButtonItem", "UIToolbar", "UITabBar", "UITabBarItem", "UISearchBar", "UIWebView", "UIStackView", "UIActivityIndicatorView", "UIRefreshControl", "UIActionSheet (Deprecated in iOS 8)", "UIAlertController", "UIAlertView (Deprecated in iOS 9)", "UIPopoverController (Deprecated in iOS 9)", "UIPopoverPresentationController", "UIActivityViewController", "UIImagePickerController (Deprecated in iOS 14)", "UIMenu", "UIMenuController", "UIContextMenuInteraction", "UIDragInteraction", "UIDropInteraction", "UIHoverInteraction", "UIImpactFeedbackGenerator", "UINotificationFeedbackGenerator", "UISelectionFeedbackGenerator", "UIPointerInteraction", "UIPointerStyle", "UILargeContentViewerInteraction"]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        allElementTableView.dataSource = self
        allElementTableView.delegate = self
    }
    
}
extension AllUIIementsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return uiElementsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllElementTableViewCell", for: indexPath) as! AllElementTableViewCell
        cell.selectionStyle = .none
        cell.elementNameLabel.textColor = UIColor.white
        cell.backgroundColor = .random()
        cell.elementNameLabel.text = uiElementsArray[indexPath.row]
        return cell
    }
    
    
}
extension AllUIIementsListViewController: UITableViewDelegate {
    
}
