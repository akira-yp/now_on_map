Category.create!([
  { id:1, name: "お祭り", icon: nil },
  { id:2, name: "音楽", icon: nil},
  { id:3, name: "フード", icon: nil},
  { id:4, name: "アート", icon: nil},
  { id:5, name: "花火", icon: nil},
  { id:6, name: "スポーツ", icon: nil},
  { id:7, name: "サブカル", icon: nil},
  { id:8, name: "教養", icon: nil},
  { id:9, name: "自然", icon: nil},
  { id:10, name: "ショッピング", icon: nil}
])

user1 = User.create!(
  id:1, name: "testuser", image: open("#{Rails.root}/db/image/avatar18.png"), email: "testuser@test.com", password: "password", provider: "", uid: "4fcae10e-a584-4619-b86e-4a22721779df", admin: false
)

user2 = User.create!(
  id:2, name: "guest_admin", image: open("#{Rails.root}/db/image/avatar0.png"), email: "guest_admin@guest.com", password: "password", provider: "", uid: "0896af91-2c2c-47af-a8a8-935af4f64800", admin: true
)

user3 = User.create!(
  id:3, name: "guest", image: open("#{Rails.root}/db/image/avatar24.png"), email: "guest@guest.com", password: "password", provider: "", uid: "bc7d7170-6c35-4ad5-9aaa-38287942f58a", admin: false
)

user4 = User.create!(
  id:4, name: "testuser4", image: open("#{Rails.root}/db/image/avatar25.png"), email: "testuser4@test.com", password: "password", provider: "", uid: "703fd425-e909-4d74-b092-98db3d14d61e", admin: false
)

user5 = User.create!(
  id:5, name: "testuser5", image: open("#{Rails.root}/db/image/avatar27.png"), email: "testuser5@test.com", password: "password", provider: "", uid: "9365f2a0-9988-4161-80f0-635ae483ce8c", admin: false
)

user1.events.create([
  {title: "テスト", description: "テスト", start_date: "2021-06-24 00:00:00", end_date: "2021-09-25 00:00:00", official_page: "", image: nil, location: "テスト", latitude: 35.68308, longitude: 139.685805, category_ids:[1,2]},

  {title: "GENKYO　横尾忠則　原郷から幻境へ、そして現況は？", description: "1960年代からつねに第一線で活躍し、日本を、そして世界を魅了し続けてきた、アート界のレジェンド、横尾忠則。その横尾の、60年以上にわたる創造の全貌を目の当たりにすることができる集大成の展覧会が実現します。横尾自身の総監修により、去年から今年にかけて描かれた新作を含めて、500点以上の作品が出品されます。横尾芸術のダイナミックな展開を、心うちふるえるまでに体感することができる、まさに画期的な展覧会となるでしょう。［公式サイトより］", start_date: "2021-07-16 15:00:00", end_date: "2021-10-16 15:00:00", official_page: "https://genkyo-tadanoriyokoo.exhibit.jp/", image: nil, location: "東京都江東区三好4-1-1 東京都現代美術館", latitude: 35.679762, longitude: 139.808722, category_ids:[4,8]},

  {title: "THE モンスター展Ⅱ", description: "生物が生き残るために繰り広げている「攻撃と防御」をテーマに、絶滅してしまった種から現生種までの生物を幅広く展示し、生物が生き残るための多様な工夫を知っていただきたいと思います。ゲームの世界にあるようなシンプルな「攻撃と防御」だけではなく、生物が進化の中で獲得した驚くような機能や行動にもぜひご注目ください。（公式サイトより）", start_date: "2021-07-17 15:00:00", end_date: "2021-09-26 15:00:00", official_page: "https://monster2.jp/", image: nil, location: "福岡県北九州市八幡東区東田2-4-1　北九州市立いのちのたび博物館", latitude: 33.869133, longitude: 130.808274, category_ids:[8,9]},

  {title: "夜のすいぞくかん", description: "暗くなった水槽で、生きものたちの様子をじっくり観察できる。さらに、博多湾のきれいな夜景をバックにジャンプする「夜のイルカショー」も。\r\n\r\n営業時間 9時30分〜21時まで（最終入館20時まで）", start_date: "2021-07-28 15:00:00", end_date: "2021-08-31 15:00:00", official_page: "https://marine-world.jp/whats-new/events/event_66/", image: nil, location: "福岡市東区西戸崎18-28　マリンワールド海の中道", latitude: 33.661212, longitude: 130.363365, category_ids:[4,6,9]},

  {title: "大人のかき氷", description: "表参道ヒルズのお店が「TRIP」をテーマに、様々な国や街をイメージしたかき氷を揃えた、毎年恒例「大人のかき氷」を開催！\r\n#かき氷", start_date: "2021-06-24 15:00:00", end_date: "2021-08-31 15:00:00", official_page: "https://www.omotesandohills.com/sp/shavedice/", image: open("./db/image/d72321-3-342862-20.jpg"), location: "表参道ヒルズ", latitude: 35.667225, longitude: 139.708796, category_ids:[3,10]},

  {title: "マリー・アントワネット ～シークレット サマーフルーツ ガーデン", description: "マリー・アントワネットに献上したケーキを忠実に再現したケーキが登場！王妃が愛した最高級の紅茶と旬のフルーツ満載のスイーツを楽しむアフタヌーンティー。\r\n#スイーツ\r\n\r\n平日5,280円、土日祝　6,380円", start_date: "2021-07-01 15:00:00", end_date: "2021-08-31 15:00:00", official_page: "https://www.tokyo.grand.hyatt.co.jp/restaurants/recommended/french-kitchen-sweetsfesta-afternoontea/?utm_source=google&utm_medium=cpc&utm_campaign=sitelink&gclid=CjwKCAjw0qOIBhBhEiwAyvVcfwcynfdkYbytq0qJa7H5xEKIvKYtDkCC6YIp41_J-A8jwIrXeHUJuRoCvNEQAvD_BwE&gclsrc=aw.ds", image: nil, location: "グランド ハイアット 東京", latitude: 35.659776, longitude: 139.728353, category_ids:[3,4,8]},

  {title: "わくわく！ウォーターガーデン", description: "障害物のあるアスレチックアトラクション「ホエールアドベンチャー」をはじめ、大好評のストレートとカーブのウォータースライダー「ざぶ～んダブルスライダー」､ふわふわの泡で遊ぶ「あわあわホイップ」など、ミストシャワーが湧きでる涼しい空間で、水に濡れながら楽しく元気に遊ぶことのできる4つのアトラクションを展開！\r\n\r\n", start_date: "2021-07-17 15:00:00", end_date: "2021-09-12 15:00:00", official_page: "https://at-raku.com/event/wakuwaku_watergarden/", image: nil, location: "東京ドームシティアトラクションズ", latitude: 35.704278, longitude: 139.754268, category_ids:[6,9]},

  {title: "イケセイアイスパーク", description: "デパ地下の特設会場にて「イケセイアイスパーク」を開設、かき氷やジェラートなどが週替わりで登場。初登場のイタリアンかき氷や老舗肉問屋が作る102年の歴史が生んだかき氷など、のべ15店舗の味が楽しめる。\r\n#かき氷", start_date: "2021-07-29 15:00:00", end_date: "2021-08-31 15:00:00", official_page: "https://ignite.jp/2021/07/287637/", image: nil, location: "西武池袋本店", latitude: 35.728825, longitude: 139.711664, category_ids:[3,10] }
])

Mylocation.create!([
  {name: "実家", my_address: "札幌", my_latitude: 43.058603, my_longitude: 141.357316, user_id: 1},
  {name: "自宅", my_address: "尾道市土堂町", my_latitude: 34.405945, my_longitude: 133.204402, user_id: 3},
  {name: "自宅", my_address: "東京都千代田区千代田1-1", my_latitude:35.685607, my_longitude: 139.752881, user_id: 1},
  {name: "出張先", my_address: "西日本シティ銀行", my_latitude: 33.589085, my_longitude: 130.418181, user_id: 1},
  {name: "職場", my_address: "福山市役所", my_latitude: 34.485855, my_longitude: 133.362397, user_id: 3}
])

Favorite.create!([
  {user_id: 3, event_id: 2},
  {user_id: 3, event_id: 6},
  {user_id: 3, event_id: 7},
  {user_id: 3, event_id: 4},
  {user_id: 3, event_id: 8},
  ])

Comment.create!([
  {user_id: 3, event_id: 8, content: "もものカルボナーラ食べたいです！" },
  {user_id: 3, event_id: 8, content: "かき氷のための氷「生氷Ⓡ」とは？" },
  {user_id: 3, event_id: 8, content: "1日３店舗回れば５日で制覇できる" },
  {user_id: 3, event_id: 8, content: "表参道でやってる「大人のかき氷」もオススメ！" },
  {user_id: 3, event_id: 8, content: "大丈夫。腹はもう壊れ済み。" }
  ])
