//
//  DetailViewController.swift
//  MyBountyList
//
//  Created by 이범준 on 2021/03/05.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imgView:UIImageView! //이미지뷰
    @IBOutlet weak var nameLabel:UILabel! //이름 표시
    @IBOutlet weak var bountyLabel:UILabel! //현상금 표시
    
    var name: String?
    var bounty: Int?
    
    //viewDidLoad는 아직 메모리만 전달받았고 화면에 뜨기 전 시점임
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()//화면에 뜨기전에 받은 메모리들을 이용해 ui컴포넌트들을 업데이트 시킴
    }
 
    func updateUI(){
        if let name=self.name, let bounty=self.bounty{
            let img=UIImage(named: "\(name).jpg")
            imgView.image = img
            nameLabel.text = name
            bountyLabel.text = "\(bounty)"
            
        }
       }
    //클릭시 효과주기
    @IBAction func close(_ sender: Any) { //버튼 클릭후 빈공간에 연결시키면 액션인지 뭔지 물어봄
        dismiss(animated: true, completion: nil) //dismiss - 클릭시 페이지를 없앤다 , completion은 페이지 닫히고 난 후에 뭐 할게 있냐 물어보는거
    }
    
    
}
/*
 레이아웃 부가 설명
 align trailing to safe area: 우측에서 얼마나 떨어트릴거냐
 aligh top to safe area: 상단에서 얼마나 떨어트릴거냐
 
 bountyviewcontroller를 ctrl한채로 detailviewcontroller와 연결 그러면 몇개 뜰텐데 어떤식으로 할건지에 대한 것들임. 뭐 위에서 나오게 아래서 나오게 할지
 
 그리고 연결된 그 선 클릭후에(세그웨이 - segue) id를 설정함(identifier)
 segue : 넘어가다 라는 뜻
 
 이렇게 되면 두개가 연결되게 됨
 
 데이터 넘기기
 셀 클릭 되었을 때 detailviewcontroller에 정보를 넘겨줘야 됨
 */


/*------------- 코드 회고 -------------------
 회고는 스스로에 대한 배움과 성장을 얻을 수 있음
 앱을 보면은 현상금들이 나와있는데 현상금이 사실 랭킹앱인데 랭킹을 보기가 힘듦 순서대로 정렬이 되어있지 않음 이 부분을 수정하기 위해서는 여러가지 복잡한 생각들이 들게 될것임.
 현재 루피에 대한 현상금을 바꾸고자 한다면 만약 사람 숫자가 많다면, 바꾸기 힘들것임 여러개가 있다면.
 어떤 놈의 데이터를 넣고자 한다면 그것도 힘든구조임.
 가장 큰 문제는 이름과 현상금이 서로 연결되어있지 않다는 점.
 순서가 같은 것 뿐이지 연결되어있지 않음. 그렇기 때문에 view에다가 세팅할때 namelist와 bountylist를 각각 제공했었음 힘들게
 이런부분에 대해서 많은 문제들이 존재함 지금.
 결과적으로 보면은 코드는 짰지만 코드가 나중에 추가적으로 고치기 어렵고 재사용하기 어려운 코드를 만들었음.
 이런것이 바로 기술 부채. 고쳐야 되는 것이 있지만 고치치 않은 상태
 기술 부채를 최소화시키는 것이 엔지니어들의 목적이자 목표
 9장 끝.
 */
