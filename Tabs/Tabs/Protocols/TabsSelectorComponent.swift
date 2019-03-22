import UIKit
import Foundation

protocol TabsSelectorComponent {

    var height: CGFloat { get }
    var viewController: UIViewController { get }
    var delegate: TabsSelectorDelegate? { get set }
}
