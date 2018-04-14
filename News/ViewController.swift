//
//  ViewController.swift
//  News
//
//  Created by 原田 礼朗 on 2018/04/14.
//  Copyright © 2018年 reo harada. All rights reserved.
//

import UIKit

// tableViewと相談する準備その1
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var newsTableView: UITableView!
    
    // ニュースのタイトルデータ
    var newsData: [String] = [
        "女子ラーメンの最強ラインナップが集結 「ラーメン女子博 2018」が東京で開催！",
        "熊本地震から2年　被災地の絆「たかが一杯のラーメン。たったそれだけ」",
        "平塚発『地獄の担担麺』カップラーメンに | 平塚 | タウンニュース",
        "映画まとめ4月13日公開　映画紹介＆予告編　「名探偵コナン ゼロの執行人」「パシフィック・リム：アップライジング」「映画クレヨンしんちゃん 爆盛！カンフーボーイズ ～拉麺大乱」",
        "栃木　中華歴45年の職人が打つ白河スタイルの手打ち麵！「白河ラーメン 小峰屋」",
        "＜映画クレヨンしんちゃん 爆盛！カンフーボーイズ ～拉麺大乱＞痛快なカンフーアクションに注目　マサオとの友情シーンも",
        "春日部がラーメンパニックに！「映画クレヨンしんちゃん」最新作を完全マンガ化",
        "【ロッテ】ボルシンガー“パワーの源”明かす「豚骨ラーメンが好き」",
        "栃木　飲んだあとのシメにもピッタリ！あっさりアサリラーメン",
        "日本橋の寿司屋がプロデュース！こだわりの鯛スープで作るラーメン店『麺屋ま石』",
        "インスタントラーメン人気1位はサッポロ一番みそ　不動のワケ〈週刊朝日〉",
        "バーミヤン「BM級グルメフェス」の『とんこつ焼きラーメン』が超美味ッ！　シェアじゃなくて独り占め必至 ｜ ガジェット通信 GetNews",
        "新横ラー博と映画クレヨンしんちゃんがコラボ　7種類のブラックパンダラーメン限定提供　／神奈川",
        "【ABC特集】ラーメンにハンバーガー…レアな自販機が勢揃い “ドライブインの聖地”は昭和レトロ満載だった",
        "2038年の牛丼店・ラーメン店のお客は高齢者だらけになる｜日刊ゲンダイDIGITAL",
        "女性に人気のGWイベントTOP5を発表！みんなが行きたいのはGINZA SIXの1周年イベントや、ラーメン・お肉などのグルメフェス",
        "「全日本うまいもの祭り」愛知で開催 - いかめしやラーメン、プリンなど全国の\"食\"が集結 - ファッションプレス",
        "横浜の名店の新たな試みが話題に！ 朝専用ラーメンでエネルギーをチャージ",
        "ラーメン好きに捧ぐ！千葉の日本一行きにくいラーメン屋「アリランラーメン」とは | RETRIP[リトリップ]",
        "ビジネスキャラじゃない！けやき坂46・齊藤京子が“ラーメン愛”を語る【前編】",
    ]
    
    // ニュースのURLデータ
    var newsURLData: [String] = [
        "https://netallica.yahoo.co.jp/news/20180414-77369107-crea",
        "https://headlines.yahoo.co.jp/videonews/fnn?a=20180414-00000685-fnn-soci",
        "https://www.townnews.co.jp/0605/2018/04/12/427706.html",
        "https://netallica.yahoo.co.jp/news/20180413-31698804-maidigitv",
        "https://headlines.yahoo.co.jp/article?a=20180413-00140340-tkwalk-life",
        "https://headlines.yahoo.co.jp/hl?a=20180413-00000015-mantan-ent",
        "https://headlines.yahoo.co.jp/hl?a=20180413-00000112-nataliec-ent",
        "https://headlines.yahoo.co.jp/hl?a=20180413-00000141-sph-base",
        "https://headlines.yahoo.co.jp/article?a=20180413-00140299-tkwalk-life",
        "https://netallica.yahoo.co.jp/news/20180413-90730303-ignite",
        "https://headlines.yahoo.co.jp/article?a=20180412-00000048-sasahi-life",
        "http://getnews.jp/archives/2035349",
        "https://headlines.yahoo.co.jp/hl?a=20180413-00000016-minkei-l14",
        "https://headlines.yahoo.co.jp/hl?a=20180413-00010000-asahibc-life",
        "https://www.nikkan-gendai.com/articles/view/life/227031",
        "https://netallica.yahoo.co.jp/news/20180413-52348381-ozmalla",
        "https://www.fashion-press.net/news/39017",
        "https://headlines.yahoo.co.jp/article?a=20180412-00143421-tkwalk-life",
        "https://retrip.jp/articles/101318/",
        "https://headlines.yahoo.co.jp/article?a=20180411-00143314-the_tv-ent",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tableViewと相談する準備その２
        self.newsTableView.delegate = self
        self.newsTableView.dataSource = self
        
        // xibを呼んでくる
        let xib = UINib(nibName: "NewsTableViewCell", bundle: nil)
        // tableViewに登録する
        self.newsTableView.register(xib, forCellReuseIdentifier: "newsCell")
    }
    
    // tableViewとの相談↓
    // セクションの数どうするぅ？
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // セルの数どうするぅ？
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    // 各行のセルの中身どうするぅ？
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // "newsCell"と名前つけたカスタムセルをちょうだい
        // カスタム部品の場合は、as!で正体を保証してあげる
        let cell = self.newsTableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        // データを入れる
        cell.titleLabel.text = self.newsData[indexPath.row]
        cell.newsImageView.image = UIImage(named: "pict\(indexPath.row)")
        return cell
    }
    
    // 各行のセルの高さどうするぅ？
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    // 各行のセルを選択したときどうするぅ？
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        nextVC.newsURL = self.newsURLData[indexPath.row]
        show(nextVC, sender: nil)
    }
    
    
    

}

