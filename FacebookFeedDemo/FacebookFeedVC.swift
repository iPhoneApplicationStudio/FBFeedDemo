//
//  FacebookFeedVC.swift
//  FacebookFeedDemo
//
//  Created by Abhinay on 03/08/18.
//  Copyright © 2018 ONS. All rights reserved.
//

import UIKit

struct Record
{
    let title:String!
    let date:String!
    let place:String!
    let des:String!
    let profilePicName:String!
    let feedPic:String!
    let likes:String!
    let comments:String!
}

class FacebookFeedVC:UICollectionViewController, UICollectionViewDelegateFlowLayout
{
    fileprivate let cellId = "cellId"
    fileprivate var dataSource = [Record]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        initialSetting()
        pageAppearance()
    }
    
    fileprivate func initialSetting()
    {
        navigationItem.title = "Facebook Feed Demo"
        setDummyData()
        collectionView?.register(FacebookFeedCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    fileprivate func pageAppearance()
    {
        collectionView?.backgroundColor = UIColor(white: 0.96, alpha: 1)
    }
    
    fileprivate func setDummyData()
    {
        dataSource.append(Record(title: "Cool Deer", date: "22June 2018", place: "Varanasi", des: "Cool Deer is waiting for you", profilePicName: "deerSmile", feedPic: "recipe1", likes: "450Likes", comments: "3.2k Comments"))
        dataSource.append(Record(title: "Ice Cream", date: "28June 2018", place: "Kanpur", des: "Do you need it?", profilePicName: "iceCream", feedPic: "recipe2", likes: "40Likes", comments: "4Comments"))
        dataSource.append(Record(title: "Pretty Joker", date: "22July 2018", place: "New Delhi", des: "Fun is here", profilePicName: "joker", feedPic: "recipe3", likes: "44Likes", comments: "100Comments"))
        dataSource.append(Record(title: "Woops!!", date: "28July 2018", place: "Goa", des: "Feeling bad!!", profilePicName: "iceCreamAngry", feedPic: "recipe4", likes: "5Likes", comments: "9Comments"))
        dataSource.append(Record(title: "Santa", date: "3Aug 2018", place: "Agra", des: "Waiting for 25Dec", profilePicName: "santa", feedPic: "recipe5", likes: "12Like", comments: "12Comments"))
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FacebookFeedCell
        cell.record = dataSource[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 344)
    }
}


class FacebookFeedCell:UICollectionViewCell
{
    
    var record:Record!{
        didSet{
            //Text
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 5.0
            
            let attributedString = NSMutableAttributedString(string: record.title, attributes: [NSAttributedStringKey.foregroundColor:UIColor.darkGray, NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 17.0), NSAttributedStringKey.paragraphStyle:paragraphStyle])
            
            let attributedStringDate = NSAttributedString(string: "\n\(record.date!)  º  ", attributes: [NSAttributedStringKey.foregroundColor:UIColor.gray, NSAttributedStringKey.font:UIFont.systemFont(ofSize: 12.0)])
            let attributedStringLoc = NSAttributedString(string: "\(record.place!)  º  ", attributes: [NSAttributedStringKey.foregroundColor:UIColor.gray, NSAttributedStringKey.font:UIFont.systemFont(ofSize: 12.0)])

            let textAttachment = NSTextAttachment()
            textAttachment.image = #imageLiteral(resourceName: "loc")
            textAttachment.bounds = CGRect(x: 0, y: 0, width: 12, height: 12)
            
            let attributedStringAttachment = NSAttributedString(attachment: textAttachment)
            
            attributedString.append(attributedStringDate)
            attributedString.append(attributedStringLoc)
            attributedString.append(attributedStringAttachment)
            
            titleLabel.attributedText = attributedString
            desText.text = record.des!
            likeCommentLabel.text = "\(record.likes!)  \(record.comments!)"
            
            //Image
            profilePic.image = UIImage(named:record.profilePicName!)
            imgFeed.image = UIImage(named:record.feedPic!)
        }
    }
    
    fileprivate let profilePic:UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = AppConstant.Color.blueColor
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    fileprivate let titleLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        return label
    }()
    
    fileprivate let desText:UITextView = {
        let textview = UITextView()
        textview.textColor = .darkGray
        textview.isUserInteractionEnabled = false
        textview.font = UIFont.systemFont(ofSize: 16.0)
        return textview
    }()
    
    fileprivate let imgFeed:UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        return iv
    }()
    
    fileprivate let likeCommentLabel:UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        return label
    }()
    
    fileprivate let dividerView:UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(white: 0.96, alpha: 1)
        return view
    }()
    
    fileprivate var stackView:UIStackView!
    
    fileprivate let likeButton = FacebookFeedCell.getButtonWithTitle(title: "Like", image: #imageLiteral(resourceName: "like"))
    fileprivate let commentButton = FacebookFeedCell.getButtonWithTitle(title: "Comment", image: #imageLiteral(resourceName: "comment"))
    fileprivate let shareButton = FacebookFeedCell.getButtonWithTitle(title: "Share", image: #imageLiteral(resourceName: "share"))

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setUpViews()
    {
        backgroundColor = .white
        addSubview(profilePic)
        addSubview(titleLabel)
        addSubview(desText)
        addSubview(imgFeed)
        addSubview(likeCommentLabel)
        addSubview(dividerView)
        
        stackView = UIStackView(arrangedSubviews: [likeButton, commentButton, shareButton])
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        addSubview(stackView)
    }
    
    fileprivate func setLayout()
    {
        addConstraint(visualFormat: "H:|-8-[v0(44)]-8-[v1]|", forViews: profilePic, titleLabel)
        addConstraint(visualFormat: "H:|-4-[v0]-8-|", forViews: desText)
        addConstraint(visualFormat: "H:|[v0]|", forViews: imgFeed)
        addConstraint(visualFormat: "H:|-8-[v0]-8-|", forViews: likeCommentLabel)
        addConstraint(visualFormat: "H:|-8-[v0]-8-|", forViews: dividerView)
        addConstraint(visualFormat: "H:|-8-[v0]-8-|", forViews: stackView)
        
        addConstraint(visualFormat: "V:|-8-[v0(44)]", forViews: profilePic)
        addConstraint(visualFormat: "V:|-8-[v0(44)]-4-[v1(27)]-12-[v2]-0-[v3(44)]-0-[v4(1)]-0-[v5(44)]-0-|", forViews: titleLabel, desText, imgFeed,likeCommentLabel,dividerView, stackView)
    }
    
    fileprivate static func getButtonWithTitle(title:String, image:UIImage) -> UIButton
    {
        let button = UIButton(type: .system)
        button.tintColor = .lightGray
        button.setTitle(title, for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        button.setImage(image, for: .normal)
        return button
    }
}

extension UIView
{
    func addConstraint(visualFormat format:String, forViews: UIView...)
    {
        var dict = [String:UIView]()
        for (index, view) in forViews.enumerated()
        {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            dict[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: [], metrics: nil, views: dict))
    }
}

