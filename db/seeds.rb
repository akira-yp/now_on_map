Category.create!([
  {name: "お祭り", icon: nil},
  {name: "音楽", icon: nil},
  {name: "フード", icon: nil},
  {name: "アート", icon: nil},
  {name: "花火", icon: nil},
  {name: "スポーツ", icon: nil},
  {name: "サブカル", icon: nil},
  {name: "教養", icon: nil},
  {name: "自然", icon: nil},
  {name: "ショッピング", icon: nil}
])

User.create!([
  {name: "testuser", image: open("./db/image/avatar18.png"), email: "testuser@test.com", password: "password", provider: "", uid: "4fcae10e-a584-4619-b86e-4a22721779df", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, admin: false},
  {name: "test2", image: open("./db/image/avatar25.png"), email: "test2@test.com", password: "password", provider: "", uid: "167a8762-0edd-4dc7-b9d7-a69e77e361d8", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, admin: false},
  {name: "guest_admin", image: open("./db/image/avatar0.png"), email: "guest_admin@guest.com", password: "password", provider: "", uid: "0896af91-2c2c-47af-a8a8-935af4f64800", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, admin: true},
  {name: "guest", image: open("./db/image/avatar24.png"), email: "guest@guest.com", password: "password", provider: "", uid: "bc7d7170-6c35-4ad5-9aaa-38287942f58a", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, admin: false},
  {name: "test", image: open("./db/image/avatar27.png"), email: "test@test.com", password: "password", provider: "", uid: "cc2a3e60-f70b-4fba-9c1a-08ded555839d", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, admin: true}
])
Event.create!([
  {title: "テスト", description: "テスト", start_date: "2021-06-24 00:00:00", end_date: "2021-06-25 00:00:00", official_page: "", image: nil, location: "テスト", latitude: 35.68308, longitude: 139.685805, user_id: 4},
  {title: "test", description: "test", start_date: "2021-06-25 00:00:00", end_date: "2021-06-26 00:00:00", official_page: "", image: nil, location: "test", latitude: 35.526924, longitude: 139.713736, user_id: 4},
  {title: "geggee", description: "gegeeg", start_date: "2021-07-10 15:00:00", end_date: "2021-07-17 15:00:00", official_page: "", image: nil, location: "gegegeeg", latitude: 34.569765, longitude: 132.561378, user_id: 4},
  {title: "画像テスト", description: "test", start_date: "2021-06-21 15:00:00", end_date: "2021-06-23 15:00:00", official_page: "https://railsguides.jp/i18n.html", image: "bicycle-1868162_640.jpg", location: "test", latitude: 35.634761, longitude: 139.912652, user_id: 4},
  {title: "catecoryテスト", description: "テスト", start_date: "2021-06-25 15:00:00", end_date: "2021-07-01 15:00:00", official_page: "https://railsguides.jp/i18n.html", image: nil, location: "テスト", latitude: 35.685961, longitude: 139.707699, user_id: 4},
  {title: "ハッシュタグテスト", description: "アジア各国の料理と音楽が楽しめるフェス\r\n#インド料理", start_date: "2021-07-01 15:00:00", end_date: "2021-08-27 15:00:00", official_page: "", image: nil, location: "テスト", latitude: 40.259944, longitude: 140.646157, user_id: 4},
  {title: "ハッシュテスト", description: "#越前蟹　#福井県　＃蟹サイコー！　\r\n食べられるイベントだよ！", start_date: "2021-07-02 15:00:00", end_date: "2021-08-20 15:00:00", official_page: "", image: nil, location: "越前", latitude: 35.984465, longitude: 136.66666, user_id: 4},
  {title: "GENKYO　横尾忠則　原郷から幻境へ、そして現況は？", description: "1960年代からつねに第一線で活躍し、日本を、そして世界を魅了し続けてきた、アート界のレジェンド、横尾忠則。その横尾の、60年以上にわたる創造の全貌を目の当たりにすることができる集大成の展覧会が実現します。横尾自身の総監修により、去年から今年にかけて描かれた新作を含めて、500点以上の作品が出品されます。横尾芸術のダイナミックな展開を、心うちふるえるまでに体感することができる、まさに画期的な展覧会となるでしょう。［公式サイトより］", start_date: "2021-07-16 15:00:00", end_date: "2021-10-16 15:00:00", official_page: "https://genkyo-tadanoriyokoo.exhibit.jp/", image: nil, location: "東京都江東区三好4-1-1 東京都現代美術館", latitude: 35.679762, longitude: 139.808722, user_id: 1},
  {title: "THE モンスター展Ⅱ", description: "生物が生き残るために繰り広げている「攻撃と防御」をテーマに、絶滅してしまった種から現生種までの生物を幅広く展示し、生物が生き残るための多様な工夫を知っていただきたいと思います。ゲームの世界にあるようなシンプルな「攻撃と防御」だけではなく、生物が進化の中で獲得した驚くような機能や行動にもぜひご注目ください。（公式サイトより）", start_date: "2021-07-31 15:00:00", end_date: "2021-08-07 15:00:00", official_page: "https://monster2.jp/", image: nil, location: "福岡県北九州市八幡東区東田2-4-1　北九州市立いのちのたび博物館", latitude: 33.869133, longitude: 130.808274, user_id: 1},
  {title: "hoge", description: "gagaga", start_date: "2021-07-10 15:00:00", end_date: "2021-07-17 15:00:00", official_page: "", image: nil, location: "gagagga", latitude: 35.426245, longitude: 139.279985, user_id: 4},
  {title: "八丈島ダイビングフェス", description: "＃PADI #ダイビング　#イルカ　＃DIVING #diving", start_date: "2021-07-01 15:00:00", end_date: "2021-09-09 15:00:00", official_page: "https://railsguides.jp/i18n.html", image: "ocean01.png", location: "八丈島", latitude: 33.101734, longitude: 139.800403, user_id: 4},
  {title: "test", description: " fdafagfagaga", start_date: "2021-07-15 15:00:00", end_date: "2021-09-02 15:00:00", official_page: "", image: nil, location: "ggagfagaga", latitude: 35.667258, longitude: 139.730439, user_id: 4},
  {title: "ホゲ", description: "ホゲ", start_date: "2021-07-03 15:00:00", end_date: "2021-07-10 15:00:00", official_page: "https://railsguides.jp/i18n.html", image: nil, location: "ホゲ", latitude: 35.668155, longitude: 139.714041, user_id: 4},
  {title: "hoge", description: "dsdsa", start_date: "2021-07-05 15:00:00", end_date: "2021-07-12 15:00:00", official_page: "", image: nil, location: "sadsasa", latitude: 35.67744391775446, longitude: 139.7213262319565, user_id: 4},
  {title: "tttt", description: "ttttt", start_date: "2021-07-22 15:00:00", end_date: "2021-07-30 15:00:00", official_page: "", image: nil, location: "ttttt", latitude: 35.665630713165335, longitude: 139.6453085093843, user_id: 4},
  {title: "テスト", description: "テスト", start_date: "2021-07-06 15:00:00", end_date: "2021-07-13 15:00:00", official_page: "", image: nil, location: "テスト", latitude: 36.366408, longitude: 139.010439, user_id: 4},
  {title: "linkテスト", description: "hogehoge", start_date: "2021-07-06 15:00:00", end_date: "2021-07-13 15:00:00", official_page: "https://railsguides.jp/i18n.html", image: "bicycle-1868162_640.jpg", location: "hogehoge", latitude: 35.729028, longitude: 139.934025, user_id: 4},
  {title: "image", description: "image", start_date: "2021-07-14 15:00:00", end_date: "2021-07-21 15:00:00", official_page: "", image: "bicycle-1868162_640.jpg", location: "image", latitude: 34.819855, longitude: 138.293539, user_id: 4},
  {title: "ffff", description: "ffff", start_date: "2021-07-07 15:00:00", end_date: "2021-07-26 15:00:00", official_page: "", image: nil, location: "fffff", latitude: 39.000376, longitude: 139.893036, user_id: 4},
  {title: "gagagagag", description: "gagagagag", start_date: "2021-07-08 15:00:00", end_date: "2021-08-30 15:00:00", official_page: "", image: "omid-armin-Zfgzp4RNryk-unsplash.jpg", location: "gagagaga", latitude: 35.576917, longitude: 137.763277, user_id: 4},
  {title: "tete", description: "tette", start_date: "2021-07-08 15:00:00", end_date: "2021-07-15 15:00:00", official_page: "", image: nil, location: "tetet", latitude: 34.847353, longitude: 136.50186, user_id: 4},
  {title: "hhh", description: "hhh", start_date: "2021-07-09 15:00:00", end_date: "2021-08-27 15:00:00", official_page: "", image: nil, location: "hhhh", latitude: 35.81118, longitude: 137.040716, user_id: 4},
  {title: "ffff", description: "fffff", start_date: "2021-07-09 15:00:00", end_date: "2021-09-10 15:00:00", official_page: "", image: nil, location: "ffff", latitude: 34.994004, longitude: 139.015953, user_id: 4},
  {title: "tttt", description: "ttttt", start_date: "2021-07-09 15:00:00", end_date: "2021-07-16 15:00:00", official_page: "", image: nil, location: "tttt", latitude: 35.706707, longitude: 139.696573, user_id: 4},
  {title: "夜のすいぞくかん", description: "暗くなった水槽で、生きものたちの様子をじっくり観察できる。さらに、博多湾のきれいな夜景をバックにジャンプする「夜のイルカショー」も。\r\n\r\n営業時間 9時30分〜21時まで（最終入館20時まで）", start_date: "2021-07-28 15:00:00", end_date: "2021-08-30 15:00:00", official_page: "https://marine-world.jp/whats-new/events/event_66/", image: nil, location: "福岡市東区西戸崎18-28　マリンワールド海の中道", latitude: 33.661212, longitude: 130.363365, user_id: 1},
  {title: "gggg", description: "gggg\r\n#テスト", start_date: "2021-07-21 15:00:00", end_date: "2021-07-28 15:00:00", official_page: "", image: nil, location: "gggg", latitude: 35.672866, longitude: 139.652817, user_id: 4},
  {title: "大人のかき氷", description: "表参道ヒルズのお店が「TRIP」をテーマに、様々な国や街をイメージしたかき氷を揃えた、毎年恒例「大人のかき氷」を開催！\r\n#かき氷", start_date: "2021-08-03 15:00:00", end_date: "2021-08-10 15:00:00", official_page: "https://www.omotesandohills.com/sp/shavedice/", image: open("./db/image/d72321-3-342862-20.jpg"), location: "表参道ヒルズ", latitude: 35.667225, longitude: 139.708796, user_id: 1},
  {title: "マリー・アントワネット ～シークレット サマーフルーツ ガーデン", description: "マリー・アントワネットに献上したケーキを忠実に再現したケーキが登場！王妃が愛した最高級の紅茶と旬のフルーツ満載のスイーツを楽しむアフタヌーンティー。\r\n#スイーツ\r\n\r\n平日5,280円、土日祝　6,380円", start_date: "2021-06-30 15:00:00", end_date: "2021-08-30 15:00:00", official_page: "https://www.tokyo.grand.hyatt.co.jp/restaurants/recommended/french-kitchen-sweetsfesta-afternoontea/?utm_source=google&utm_medium=cpc&utm_campaign=sitelink&gclid=CjwKCAjw0qOIBhBhEiwAyvVcfwcynfdkYbytq0qJa7H5xEKIvKYtDkCC6YIp41_J-A8jwIrXeHUJuRoCvNEQAvD_BwE&gclsrc=aw.ds", image: nil, location: "グランド ハイアット 東京", latitude: 35.659776, longitude: 139.728353, user_id: 1},
  {title: "テスト", description: "テスト", start_date: "2021-07-24 15:00:00", end_date: "2021-07-31 15:00:00", official_page: "https://railsguides.jp/i18n.html", image: nil, location: "テスト", latitude: 36.452218, longitude: 136.545917, user_id: 4},
  {title: "hoge", description: "gegeegggeg\r\n#huga", start_date: "2021-07-24 15:00:00", end_date: "2021-07-31 15:00:00", official_page: "https://railsguides.jp/i18n.html", image: "blogging01.png", location: "fz  ggzfzg zg z", latitude: 36.21236, longitude: 139.559175, user_id: 4},
  {title: "hoge", description: "hoge", start_date: "2021-07-24 15:00:00", end_date: "2021-07-31 15:00:00", official_page: "", image: nil, location: "hoge", latitude: 35.436198, longitude: 140.196362, user_id: 4},
  {title: "e", description: "e", start_date: "2021-07-26 15:00:00", end_date: "2021-08-02 15:00:00", official_page: "", image: nil, location: "e", latitude: 37.453875, longitude: 137.201349, user_id: 4},
  {title: "d", description: "d", start_date: "2021-07-28 15:00:00", end_date: "2021-08-04 15:00:00", official_page: "https://railsguides.jp/i18n.html", image: nil, location: "d", latitude: 43.090203, longitude: 141.589768, user_id: 4},
  {title: "自転車祭り2021", description: "佐渡島一周４０キロメートルを自転車で走破するレース。#ロードバイク", start_date: "2021-07-28 15:00:00", end_date: "2021-08-04 15:00:00", official_page: "", image: "bicycle-1868162_640.jpg", location: "佐渡島1-1", latitude: 37.996372, longitude: 138.272791, user_id: 4},
  {title: "わくわく！ウォーターガーデン", description: "障害物のあるアスレチックアトラクション「ホエールアドベンチャー」をはじめ、大好評のストレートとカーブのウォータースライダー「ざぶ～んダブルスライダー」､ふわふわの泡で遊ぶ「あわあわホイップ」など、ミストシャワーが湧きでる涼しい空間で、水に濡れながら楽しく元気に遊ぶことのできる4つのアトラクションを展開！\r\n\r\n", start_date: "2021-07-16 15:00:00", end_date: "2021-09-11 15:00:00", official_page: "https://at-raku.com/event/wakuwaku_watergarden/", image: nil, location: "東京ドームシティアトラクションズ", latitude: 35.704278, longitude: 139.754268, user_id: 1},
  {title: "イケセイアイスパーク", description: "デパ地下の特設会場にて「イケセイアイスパーク」を開設、かき氷やジェラートなどが週替わりで登場。初登場のイタリアンかき氷や老舗肉問屋が作る102年の歴史が生んだかき氷など、のべ15店舗の味が楽しめる。\r\n#かき氷", start_date: "2021-08-28 15:00:00", end_date: "2021-08-30 15:00:00", official_page: "https://ignite.jp/2021/07/287637/", image: nil, location: "西武池袋本店", latitude: 35.728825, longitude: 139.711664, user_id: 1}
])

Categorizing.create!([
  {event_id: 1, category_id: 3},
  {event_id: 2, category_id: 4},
  {event_id: 3, category_id: 3},
  {event_id: 4, category_id: 6},
  {event_id: 5, category_id: 2},
  {event_id: 5, category_id: 3},
  {event_id: 6, category_id: 1},
  {event_id: 6, category_id: 3},
  {event_id: 8, category_id: 1},
  {event_id: 8, category_id: 6},
  {event_id: 8, category_id: 7},
  {event_id: 9, category_id: 3},
  {event_id: 10, category_id: 1},
  {event_id: 10, category_id: 5},
  {event_id: 10, category_id: 7},
  {event_id: 11, category_id: 3},
  {event_id: 11, category_id: 5},
  {event_id: 11, category_id: 7},
  {event_id: 12, category_id: 1},
  {event_id: 12, category_id: 2},
  {event_id: 12, category_id: 3},
  {event_id: 12, category_id: 4},
  {event_id: 12, category_id: 5},
  {event_id: 12, category_id: 6},
  {event_id: 12, category_id: 7},
  {event_id: 13, category_id: 2},
  {event_id: 13, category_id: 3},
  {event_id: 13, category_id: 4},
  {event_id: 13, category_id: 5},
  {event_id: 14, category_id: 2},
  {event_id: 14, category_id: 3},
  {event_id: 15, category_id: 3},
  {event_id: 16, category_id: 4},
  {event_id: 17, category_id: 2},
  {event_id: 17, category_id: 4},
  {event_id: 18, category_id: 2},
  {event_id: 18, category_id: 5},
  {event_id: 19, category_id: 4},
  {event_id: 19, category_id: 5},
  {event_id: 19, category_id: 7},
  {event_id: 20, category_id: 2},
  {event_id: 20, category_id: 4},
  {event_id: 20, category_id: 7},
  {event_id: 21, category_id: 4},
  {event_id: 22, category_id: 4},
  {event_id: 25, category_id: 2},
  {event_id: 25, category_id: 3},
  {event_id: 23, category_id: 3},
  {event_id: 24, category_id: 1},
  {event_id: 25, category_id: 4},
  {event_id: 21, category_id: 3},
  {event_id: 26, category_id: 6},
  {event_id: 26, category_id: 7},
  {event_id: 26, category_id: 1},
  {event_id: 27, category_id: 4},
  {event_id: 1, category_id: 7},
  {event_id: 28, category_id: 1},
  {event_id: 29, category_id: 1},
  {event_id: 30, category_id: 4},
  {event_id: 30, category_id: 9},
  {event_id: 31, category_id: 9},
  {event_id: 31, category_id: 10},
  {event_id: 32, category_id: 10},
  {event_id: 33, category_id: 3},
  {event_id: 33, category_id: 5},
  {event_id: 34, category_id: 3},
  {event_id: 35, category_id: 7},
  {event_id: 36, category_id: 3}
])

Mylocation.create!([
  {name: "テスト", my_address: "テスト", my_latitude: 35.348736, my_longitude: 139.505028, user_id: 4},
  {name: "テスト2", my_address: "テスト2", my_latitude: 35.173808, my_longitude: 140.021509, user_id: 4},
  {name: "札幌", my_address: "", my_latitude: 43.058603, my_longitude: 141.357316, user_id: 4},
  {name: "テスト", my_address: "", my_latitude: 35.715298, my_longitude: 140.423457, user_id: 4},
  {name: "自宅", my_address: "尾道市土堂町", my_latitude: 34.405945, my_longitude: 133.204402, user_id: 4},
  {name: "テスト", my_address: "テストテストテストテストテストテストテストテスト", my_latitude: 36.328403, my_longitude: 140.48119, user_id: 4},
  {name: "出張先", my_address: "西日本シティ銀行", my_latitude: 33.589085, my_longitude: 130.418181, user_id: 1}
])
