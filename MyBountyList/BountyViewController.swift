//
//  BountyViewController.swift
//  MyBountyList
//
//  Created by 이범준 on 2021/03/03.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let nameList = ["brook","chopper","franky","luffy","nami","robin","sanji","zoro"]
    let bountyList=[33000000,50,44000000,300000000,16000000,77000000,120000000]
    
//UITableViewDataSource (프로토콜1): 테이블뷰 셀 몇개? 테이블 뷰 어떻게 보여줄까?
    //UITableViewDelegate (프로토콜2): 테이블 뷰 클릭하면 어떡해?
    //이렇게 하는게 뷰컨트롤러가 물어보는 질문에 답할거라는 것을 명시하는 단계임
    
    
    
    //performSegue를 수행되기 전에 준비하는 세션 준비할 때 데이터를 넘겨주고 싶다 , 그 데이터에 대한 힌트는 sender에 있음 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //detailviewcontroller 한테 데이터를 줄것임
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                vc?.name = nameList[index]
                vc?.bounty = bountyList[index]
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //아래는 프로토콜에 대한 대답 부분
    //UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {  //몇개니?
        return bountyList.count  //array 개수만큼
    }
    //tableView랑 이 코드를 연결 시키기 위해서 tableview ctrl+viewcontroller 하고 datasource , delegate 활성화 그러면 이 테이블 뷰를 클릭하고 커넥션 인스펙터 보면 연결된것이 확인 가능
    //mainstroryboard의 tableview의 identifier를 cell로 바꿔줘야 함
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {//어떻게 표현할거니
/*        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell",  for: indexPath) as? ListCell else{
            return UITableViewCell() //listcell을 사용하기 위해, 캐스팅이 안되어있으면 그냥 uitablecell을 사용한다
        }//nil이 아니면 밑에 return cell을 실행
        
        
        return cell*/
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell{
            let img=UIImage(named: "\(nameList[indexPath.row]).jpg")
            cell.imgView.image=img
            cell.nameLabel.text=nameList[indexPath.row]
            cell.bountyLabel.text="\(bountyList[indexPath.row])"
            return cell
        }else{
            return UITableViewCell()
        }
        //이거랑 바로 위에 가드 문이랑 똑같은 거임
    }
    
    //UITableViewDelegate 대답 부분, 클릭시에 일어나는 이벤트들
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("-->\(indexPath.row)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.row) //세그웨이를 실행해라, 여러개의 세그웨이중 하나 선택. sender에 셀에 대한 정보를 줌= indexpath.row
        //이거를 딱 수행하라고 했을 때 prepare가 딱 준비를 한데
    }
}

//custom cell 만들기
//애플에서는 다양한 스타일의 셀을 제공하고 있으나 실제 앱을 만들때는 제공해주는 셀보다는 직접 custom cell을 만들어서 표현을 함
class ListCell: UITableViewCell{ //UItableViewCell을 상속받음
    @IBOutlet weak var imgView:UIImageView! //이미지뷰
    @IBOutlet weak var nameLabel:UILabel! //이름 표시
    @IBOutlet weak var bountyLabel:UILabel! //현상금 표시
}
//cell에 listcell을 연관짓기 위해서는 cell클릭 후 custom class의 class이름을 listcell로 바꿔주면 된다.



/*
 오토 레이아웃을 할 때 컨트롤 누르면서 테이블뷰를 클릭하고 view와 연결시킴 그 후 쉬프트 누른 상태로
 여러개(4가지)를 클릭하고 엔터 누르면 완료(오토레이아웃 첫앱에서 배웠긴함)
 

 viewcontroller의 역할: 페이지 하나를 관리하는 녀석
 viewcontroller하나당 페이지 하나임 처음 만든 앱같은 경우는 하나의 화면 밖에 없었기 때문에 viewcontroller가
 하나만 필요했었음
 만약 뉴스리스트가 있고 뉴스를 클릭하면 해당 페이지로 이동되는 앱을 만들경우 viewcontroller가 두개 필요할 것임
 나중에 복잡한 기능을 할 때는 한 페이지에 여러 viewcontroller가 필요할 수도 있음
 
 viewcontroller 통상적으로 2가지 파트로 구성될 수 있음
 1. storyboard를 통해 디자인을 구성하는 파트
 
 2. storyboard와 연결되어있는 코드를 구성하는 코드 파트
 
 mainstoryboard에서 어시스턴트 누르면 연결되어있는 viewcontroller가 밑에 나오게 됨
 
 테이블뷰 왜 써?
 여러 아이템을 리스트 형태로 보여주고 싶을 때 사용
 
 1.테이블뷰 셀 몇개?
 2.테일블 뷰 어떻게 보여줄까?
 3.테이블 뷰 클릭하면 어떡해?
 
 이런것들을 물어보게 됨
 
 필수로 2번까지는 답해주어야 함
 
 protocol - 어떤 서비스를 사용하기 위해서 해야 할 일들의 목록
 테이블 뷰 서비스를 쓰기 위해 해야 할 일
 
 우리는 앞으로 수많은 프로토콜을 마주하게 될 것임 이번 시간에는 테이블뷰라는 서비스를 이용하기 위한
 프로토콜에 마주하게 됨
 
***tip
 라벨 같은 걸 메인 스토리보드에서 복사할때 option누르면서 끌어당기면 복사가 완료됨
*/

/* segue에 대한 설명
 우리가 bountyviewcontrooller에서 tableview셀이 클릭 되었을 때 세그웨이를 수행하라고 했음
 performsegue 센더라는 파라메터에 정보를 넣어서 보낼수가 있음 그리고 그 정보를 통해서 세그웨이를 준비하는 시점에 그 정보를 가지고 몇번 째 셀이다라는 것을 확인하고 그 숫자를 찾아서 namelist , bountylist에 해당하는 숫자를 찾아서 정보를 가져오고 그리고 결국 property에 저장을 한다 이해 안될거여 그냥 원피스 현상금 앱 ch09 다시 봐라
 
 */
