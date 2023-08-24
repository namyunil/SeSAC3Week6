//
//  CustomTableViewController.swift
//  SeSAC3Week6
//
//  Created by NAM on 2023/08/24.
//

import UIKit
import SnapKit


struct Sample {
    let text: String
    var isExpand: Bool
}


class CustomTableViewController: UIViewController {

    let tableView = {
        let view = UITableView()
        view.rowHeight = UITableView.automaticDimension //1. Automatic Dimension (컨텐츠 양에 맞는 유동적인 셀의 높이 조절)
        return view
    }()
    
    //var isExpand = false // false -> 2, true -> 0
    
    var list = [Sample(text: "안녕하세요", isExpand: false), Sample(text: "000011112222333반갑습니다44445556667777", isExpand: false), Sample(text: "테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트", isExpand: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //uinib - xib
        //xib 파일이 없기에 uinib파일을 더이상 사용할필요는 없다. systemcell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "customCell")

    }
    


}

extension CustomTableViewController: UITableViewDelegate, UITableViewDataSource {
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //화면에 보이는 셀의 수만큼 해당 함수는 실행된다. -> 스크롤을 하게되면 생성되는 셀의 갯수만큼 해당 함수가 실행..!
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell")!
        cell.textLabel?.text = list[indexPath.row].text
//        cell.textLabel?.numberOfLines = isExpand ? 0 : 1 // 2. numberOfLines -> 텍스트 양에 따른 높이 조절
        cell.textLabel?.numberOfLines = list[indexPath.row].isExpand ? 0 : 1
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //false -> lines : 1
        //true -> lines: 0
        //뷰와 데이터는 항상 따로 논다..! -> 데이터가 변한다면 갱신을 무조건 해줘야한다..!
        
       
        list[indexPath.row].isExpand.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
        //tableView.reloadRows(at: [indexPath, IndexPath(row: 3, section: 0)], with: .automatic) // 0번 섹션의 3번째 열도 특정할 수 있다.
        
        
        //isExpand.toggle()
        //tableView.reloadData() // 기존에 함수들을 모두 재실행하기때문에 cellforrowat에서 분기처리를..!
    }
    
}
