//
//  LocationChildTableViewController.swift
//  Plapick
//
//  Created by 서원영 on 2020/12/17.
//

import UIKit


class LocationChildTableViewController: UITableViewController {
    
    let childLocationList: [[String]] = [
        [ // 서울[0]
            "강남/역삼/삼성/논현", "서초/신사/방배", "잠실/신천(잠실새내)",
            "영등포/여의도", "신림/서울대/사당/동작", "천호/길동/둔촌",
            "화곡/까치산/양천/목동", "구로/금천/오류/신도림", "신촌/홍대/합정",
            "연신내/불광/응암", "종로/대학로/동묘앞역", "성신여대/성북/월곡",
            "이태원/용산/서울역/명동/회현", "동대문/을지로/충무로/신당/약수",
            "회기/고려대/청량리/신설동", "장안동/답십리", "건대/군자/구의",
            "왕십리/성수/금호", "수유/미아", "상봉/중랑/면목", "태릉/노원/도봉/창동"
        ],
        [ // 경기[1]
            "수원 인계/권선/영통", "수원역/구운/장안/세류", "안양/평촌/인덕원/과천",
            "성남/분당/위례", "용인", "동탄/화성/오산/병점", "하남/광주/여주/이천",
            "안산", "군포/의왕/금정/산본", "시흥", "광명", "평택/송탄/안성", "부천",
            "일산/고양", "파주", "김포", "의정부", "구리", "남양주", "포천",
            "양주/동두천/연천", "양평", "가평/청평", "제부도/대부도"
        ],
        [ // 인천[2]
            "부평", "구월", "서구(석남/서구청/검단)", "계양(작전/경인교대)", "주안",
            "송도/연수", "인천공항/을왕리", "중구(월미도/차이나타운/신포/동인천)",
            "강화/옹진", "동암/간석", "남동구(소래/만수)", "용현/숭의/도화/동구"
        ],
        [ // 강원[3]
            "춘천/강촌", "원주", "경포대/사천/주문진/정동진", "강릉역/교동/옥계",
            "영월/정선", "속초/양양/고성", "동해/삼척/태백", "평창", "홍천/횡성",
            "화천/철원/인제/양구"
        ],
        [ // 제주[4]
            "제주시", "서귀포시", "하귀/애월/한림/협재"
        ],
        [ // 대전[5]
            "유성구", "중구(은행/대흥/선화/유천)", "동구(용전/복합터미널)",
            "서구(둔산/용문/월평)", "대덕구(중리/신탄진)"
        ],
        [ // 충북[6]
            "청주 흥덕구/서원구(청주 터미널)", "청주 상당구/청원구(청주국제공항)",
            "충주/수안보", "제천/진천/음성/단양", "보은/옥천/괴산/증평/영동"
        ],
        [ // 충남/세종[7]
            "천안 서북구", "천안 동남구", "아산", "공주/동학사/세종", "계룡/금산/논산/청양",
            "예산/홍성", "태안/안면도/서산", "당진", "보령/대천해수욕장", "서천/부여"
        ],
        [ // 부산[8]
            "해운대/센텀시티/재송", "송정/기장/정관", "광안리/수영", "경성대/대연/용호동/문현",
            "서면/양정/초읍/부산시민공원", "남포동/중앙동/태종대/송도/영도", "부산역/범일동/부산진역",
            "연산/토곡", "동래/사직/온천장/부산대/구서",  "사상(경전철)/엄궁/학장",
            "덕천/화명/만덕/구포(구포역/KTX역)", "하단/명지/김해공항/다대포/강서/신호/괴정/지사"
        ],
        [ // 울산[9]
            "남구/중구(삼산/성남/무거/신정)", "동구/북구/울주군(일산/진장/진하/KTX역/영남알프스)"
        ],
        [ // 경남[10]
            "창원 상남동/용호동/중앙동/창원시청", "창원 명서동/봉곡동/팔용동/북면온천/창원종합버스터미널",
            "마산/진해", "김해/장유", "양산/밀양", "진주", "거제/통영/고성", "사천/남해",
            "하동/산청/함양", "거창/함안/창녕/합천/의령"
        ],
        [ // 대구[11]
            "동성로/서문시장/대구시청/삼덕동/교동/종로", "대구역/칠성시장/경북대/엑스코/칠곡지구/태전동/금호지구",
            "동대구역/고속버스터미널/신천동/신암동", "대구공항/혁신도시/동촌유원지/팔공산",
            "수성못/범어/라이온즈파크/월드컵경기장/앞산공원/대명동/봉덕동",
            "북부정류장/이현공단/평리동/내당동/비산동/원대동", "두류공원/이월드/광장코아/서부정류장/본리동/죽전동",
            "성서/계명대/성서공단/상인동/달성군/가창/현풍/논공"
        ],
        [ // 경북[12]
            "포항/남구(시청/시외버스터미널/구룡포/쌍사/문덕/오천)", "포항/북구(영일대/죽도시장/여객터미널/송도)",
            "경주(보문단지/황리단길/불국사/양남/감포/안강)", "구미", "경산(영남대/대구대/갓바위/하양/진량/자인)",
            "안동(경북도청/하회마을)", "영천/청도", "김천/칠곡/성주", "문경/상주/영주/예천/군위/의성/봉화",
            "울진/영덕/청송", "울릉도"
        ],
        [ // 광주[13]
            "상무지구/금호지구/유스퀘어/서구", "첨단지구/하남지구/송정역/광산구",
            "충장로/대인시장/국립아시아문화전당/동구/남구", "광주역/기아챔피언스필드/전대사거리/북구"
        ],
        [ // 전남[14]
            "여수", "순천", "광양", "목포/무안/영암/신안", "나주/함평/영광/장성",
            "담양/곡성/화순/구례", "해남/완도/진도/강진/장흥/보성/고흥"
        ],
        [ // 전주/전북[15]
            "전주/완주", "군산", "익산", "남원/임실/순창/무주/진안/장수", "정읍/부안/김제/고창"
        ]
    ]
    
    
    var selectedLocationList: [String]?
    var selectedParentIndex: Int? {
        didSet {
            selectedLocationList = childLocationList[selectedParentIndex!]
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(LocationChildCell.self, forCellReuseIdentifier: "childCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let selectedLocationList = self.selectedLocationList else { return 0 }
        
        return selectedLocationList.count
    }
    
    // 셀에 아이템 전달
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "childCell", for: indexPath) as! LocationChildCell
        cell.selectionStyle = .none
        guard let selectedLocationList = self.selectedLocationList else { return cell }
        cell.name = selectedLocationList[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(selectedParentIndex, indexPath.row)
    }
    
}
