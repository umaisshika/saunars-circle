User.create!(
  name: 'タカハシタカシ',
  email: 'admin@example.com',
  password: 'admin123',
  admin: true
)

User.create!(
  name: 'ゲストユーザー',
  email: 'guest@example.com',
  password: SecureRandom.urlsafe_base64,
)

# User
User.create!( 
  name: "まみ", 
  email: "sample1@example.com",
  password: 'password',
  avatar: File.open("./public/seeds_image/user_image1.jpg"),
  sauna_career: '2018-01-01', 
  home_sauna: '草加健康ランド', 
  prefecture_id: 11,
  description: 'テレビ無し、湿度高め、90℃、水風呂18℃', 
  profile: '週末サウナーです'
)
User.create!( 
  name: "ふじこ湯", 
  email: "sample2@example.com",
  password: 'password',
  avatar: File.open("./public/seeds_image/user_image2.jpg"),
  sauna_career: "2017-06-01", 
  home_sauna: '妙法湯', 
  prefecture_id: 13,
  description: 'ドライサウナ90℃、水風呂18℃/湿度高め80℃、水風呂20℃(バイブラ)/妙法湯、スカイスパ、しきじ', 
  profile: '仕事の合間にサ活をねじ込むくらいサウナが好き。'
)
User.create!( 
  name: "ハリー", 
  email: "sample3@example.com",
  password: 'password',
  avatar: File.open("./public/seeds_image/user_image3.jpg"),
  sauna_career: "2013-01-01", 
  home_sauna: 'あかねの湯 姫路南店', 
  prefecture_id: 28,
  description: 'サウナ室:湿度高めのオートロウリュウ付きサウナ 水風呂:冷ため(9度～12度)/神戸サウナ&スパ、神戸クアハウス、センチュリオンホテル ヴィンテージ神戸', 
  profile: '自己流でととのいを体得してサウナに通うようになりました。'
)
User.create!( 
  name: "3度のメシよりサウナメシ", 
  email: "sample4@example.com",
  password: 'password',
  avatar: File.open("./public/seeds_image/user_image4.jpg"),
  sauna_career: "2019-02-01", 
  home_sauna: '大黒湯', 
  prefecture_id: 13,
  description: '静かなサウナ', 
  profile: '休日や合間を利用してサウナ探訪してます。'
)
User.create!( 
  name: "山田", 
  email: "sample5@example.com",
  password: 'password',
  avatar: File.open("./public/seeds_image/user_image5.png"),
  sauna_career: "2018-11-01", 
  home_sauna: '観音湯', 
  prefecture_id: 13,
  description: '熱いお風呂。/ 狭くて暗くて静かなサウナ。/ なめらかな水風呂。/ 風が抜ける外気浴。', 
  profile: '休日や合間を利用してサウナ探訪してます。'
)
User.create!( 
  name: "ノリ", 
  email: "sample6@example.com",
  password: 'password',
  avatar: File.open("./public/seeds_image/user_image6.jpg"),
  sauna_career: "2018-11-01", 
  home_sauna: 'サウナと天然温泉 湯らっくす', 
  prefecture_id: 43,
  description: 'テレビなし。湿度高め。塩があれば尚良き。', 
  profile: 'ホームサウナ「湯らっくす」までは車で１０分。 サウナも好きだが、水風呂も好き。'
)

User.create!( 
  name: "大道", 
  email: "sample7@example.com",
  password: 'password',
  avatar: File.open("./public/seeds_image/user_image7.jpg"),
  sauna_career: "2015-11-01", 
  home_sauna: 'ウェルビー栄', 
  prefecture_id: 23,
  description: '人が少ない静かなサウナが好みです', 
  profile: 'スパプラザに通ってましたが，無くなってからはサウナジプシーです'
)

User.create!( 
  name: "登人", 
  email: "sample8@example.com",
  password: 'password',
  avatar: File.open("./public/seeds_image/user_image8.jpg"),
  sauna_career: "2001-07-01", 
  home_sauna: 'ニコーリフレ SAPPORO', 
  prefecture_id: 1,
  description: 'ロウリュ(アウフグース)が大好物!', 
  profile: '主にボルダリング後、出張時にととのえています。'
)

User.create!( 
  name: "焼石に水", 
  email: "sample9@example.com",
  password: 'password',
  avatar: File.open("./public/seeds_image/user_image9.jpg"),
  sauna_career: "2020-02-01", 
  home_sauna: 'スカイスパYOKOHAMA', 
  prefecture_id: 14,
  description: 'テレビ無し、90℃前後の湿度高め、サ室の香りは非常に重要。', 
  profile: 'マナーのある良き施設利用者、サウナーで在りたい。'
)

User.create!( 
  name: "ちゃんあや", 
  email: "sample10@example.com",
  password: 'password',
  avatar: File.open("./public/seeds_image/user_image10.jpg"),
  sauna_career: "2020-02-01", 
  home_sauna: 'スカイスパYOKOHAMA', 
  prefecture_id: 14,
  description: 'スカイスパYOKOHAMA/しきじ/稲村ヶ崎温泉/野田の湯', 
  profile: 'ゆるサウナー'
)

User.create!( 
  name: "サ腕", 
  email: "sample11@example.com",
  password: 'password',
  avatar: File.open("./public/seeds_image/user_image11.jpg"),
  sauna_career: "2018-02-01", 
  home_sauna: '草加健康センター', 
  prefecture_id: 11,
  description: '地元周辺でリーズナブルなところ中心。あまみが出る温度差があればなお良し。', 
  profile: '草野球の疲労回復目的で積極的にサウナ／水風呂利用はしていましたが、2020年から野球できる機会がほぼ無くなり、サウナそのものが目的になってます。'
)
User.create!( 
  name: "サウナース", 
  email: "sample12@example.com",
  password: 'password',
  avatar: File.open("./public/seeds_image/user_image12.jpg"),
  sauna_career: "2019-10-01", 
  home_sauna: '名古屋ビーズホテル らくだの湯', 
  prefecture_id: 23,
  description: 'The Sauna(長野)、養心薬湯(岐阜)、ume,sauna(奈良)、臥龍の郷(岐阜)', 
  profile: '週に2回は、サウナ巡りをしています。夜勤明けのサウナにはまっています。'
)

User.create!( 
  name: "ふぐ", 
  email: "sample13@example.com",
  password: 'password',
  avatar: File.open("./public/seeds_image/user_image13.jpg"),
  sauna_career: "2020-08-01", 
  home_sauna: '名古屋ビーズホテル らくだの湯', 
  prefecture_id: 18,
  description: 'The Sauna(長野)、養心薬湯(岐阜)、ume,sauna(奈良)、臥龍の郷(岐阜)', 
  profile: '週に2回は、サウナ巡りをしています。夜勤明けのサウナにはまっています。'
)
User.create!( 
  name: "ナツイ・フェスタ・ダーヤマ", 
  email: "sample14@example.com",
  password: 'password',
  avatar: File.open("./public/seeds_image/user_image14.jpg"),
  sauna_career: "2020-12-01", 
  home_sauna: 'SPA専♨太平のゆ', 
  prefecture_id: 18,
  description: 'TV無、100度超', 
  profile: 'しきじに魅せられたビギナーです。'
)
User.create!( 
  name: "midori", 
  email: "sample15@example.com",
  password: 'password',
  avatar: File.open("./public/seeds_image/user_image15.jpg"),
  sauna_career: "2020-12-01", 
  home_sauna: '天空のアジト マルシンスパ', 
  prefecture_id: 18,
  description: '仙川湯けむりの里＆よみうりランド丘の湯', 
  profile: '100℃越えのサウナ室、ロウリュ・アウフグース大好きですが、顔面熱に弱いので通常はサウナハットとフェイスタオルで防備しています。'
)

# Food
Food.create!(
  name: "カレーうどん",
  visited_sauna: "スパ ラクーア",
  prefecture_id: 13,
  description: "ラクーアに行ったら毎回これ",
  image: File.open("./public/seeds_image/ラクーア_カレーうどん.jpg"),
  user_id: 2
)
Food.create!(
  name: "焼肉定食",
  visited_sauna: "サウナしきじ",
  prefecture_id: 22,
  description: "サウナで癒された後、サウナ飯でも癒される。最高の一日でした。",
  image: File.open('./public/seeds_image/しきじ_焼肉定食.jpg'),
  user_id: 2
)
Food.create!(
  name: "唐揚げ",
  visited_sauna: "サウナ・カプセル 北欧",
  prefecture_id: 13,
  description: "今年初サウナの後は唐揚げにしました。汗を流した後は揚げ物がやたらと美味しく感じます。",
  image: File.open('./public/seeds_image/北欧_唐揚げ.jpg'),
  user_id: 2
)
Food.create!(
  name: "スンドゥブ",
  visited_sauna: "スパロイヤル川口",
  prefecture_id: 11,
  description: "熱いのが好きな人、辛いのが好きな人、いつもと違うサ飯を味わいたい人にスンドゥブはおすすめ",
  image: File.open('./public/seeds_image/スパロイヤル川口_スンドゥブ.jpg'),
  user_id: 3
)
Food.create!(
  name: "パワーアップ豚焼き",
  visited_sauna: "草加健康センター",
  prefecture_id: 11,
  description: "ガツンと効いたニンニクが五臓六腑に染み渡ります。",
  image: File.open('./public/seeds_image/草加健康センター_パワーアップ豚焼き.jpeg'),
  user_id: 2
)
Food.create!(
  name: "酸辣湯麺",
  visited_sauna: "草加健康センター",
  prefecture_id: 2,
  description: "テレビドラマ『サ道』でも取り上げられた酸辣湯麺。餡が麺に絡んでやみつきな旨さ。旨辛！",
  image: File.open('./public/seeds_image/草加健康センター_酸辣湯麺.jpg'),
  user_id: 4
)
Food.create!(
  name: "麻婆豆腐定食",
  visited_sauna: "草加健康センター",
  prefecture_id: 11,
  description: "ご飯がとても進むので、おなかがすいている人はおすすめ。",
  image: File.open('./public/seeds_image/草加健康センター_麻婆豆腐定食.jpg'),
  user_id: 6
)
Food.create!(
  name: "マグロ納豆",
  visited_sauna: "草加健康センター",
  prefecture_id: 11,
  description: "納豆のネバっとしたコクと、スッキリとしたくどさがないマグロがベストマッチしています",
  image: File.open('./public/seeds_image/草加健康センター_マグロ納豆.jpg'),
  user_id: 3
)
Food.create!(
  name: "カレーライス",
  visited_sauna: "天空のアジト マルシンスパ",
  prefecture_id: 13,
  description: "スタンダードなカレー。サウナに行ったら大体カレーかラーメンを食べます。",
  image: File.open('./public/seeds_image/天空のアジト マルシンスパ_カレーライス.jpg'),
  user_id: 14
)
Food.create!(
  name: "笹塚チャーシューセット",
  visited_sauna: "天空のアジト マルシンスパ",
  prefecture_id: 13,
  description: "マルシンスパといえばこれ。甘辛くとろとろに煮込まれたチャーシューとメンマに、カラシをつけて食べると最高です。",
  image: File.open('./public/seeds_image/天空のアジト マルシンスパ_笹塚チャーシューセット.jpg'),
  user_id: 7
)
Food.create!(
  name: "唐揚定食",
  visited_sauna: "かるまる",
  prefecture_id: 13,
  description: "定食人気NO.1の唐揚定食。ニンニクゴマ醤油味でご飯とビールに合いまくり",
  image: File.open('./public/seeds_image/かるまる_唐揚定食.jpg'),
  user_id: 11
)
Food.create!(
  name: "親子丼",
  visited_sauna: "かるまる",
  prefecture_id: 13,
  description: "鶏肉１つ１つがめちゃくちゃ大きくカットされていて、ボリュームが半端じゃない",
  image: File.open('./public/seeds_image/かるまる_親子丼.jpg'),
  user_id: 2
)
Food.create!(
  name: "十勝豚ロースカツカレー",
  visited_sauna: "かるまる",
  prefecture_id: 13,
  description: "辛さがマイルドで、ちょっと甘さが目立つ仕上がり",
  image: File.open('./public/seeds_image/かるまる_十勝豚ロースカツカレー.jpg'),
  user_id: 11
)

Food.create!(
  name: "カレイの唐揚げ定食",
  visited_sauna: "武蔵野温泉 なごみの湯",
  prefecture_id: 13,
  description: "身がふっくらとしたカレイに、舞茸・えのき・しめじなどきのこたっぷりのあんが絡んでおいしかったです",
  image: File.open('./public/seeds_image/武蔵野温泉 なごみの湯_カレイの唐揚げ定食.jpg'),
  user_id: 4
)

Food.create!(
  name: "四川風麻婆豆腐",
  visited_sauna: "サウナと天然温泉 湯らっくす",
  prefecture_id: 43,
  description: "痺れる大人の辛さ。さすが人気メニュー。うまい。",
  image: File.open('./public/seeds_image/サウナと天然温泉 湯らっくす_四川風麻婆豆腐.jpg'),
  user_id: 2
)

Food.create!(
  name: "酸辣湯",
  visited_sauna: "サウナと天然温泉 湯らっくす",
  prefecture_id: 43,
  description: "鶏ガラスープをベースにあっさり、ピリ辛に仕上げてあり食欲倍増",
  image: File.open('./public/seeds_image/サウナと天然温泉 湯らっくす_酸辣湯.jpg'),
  user_id: 8
)

Food.create!(
  name: "カツ丼",
  visited_sauna: "サウナと天然温泉 湯らっくす",
  prefecture_id: 43,
  description: "湯らっくすのカツ丼の美味さを日本中に知ってほしい",
  image: File.open('./public/seeds_image/サウナと天然温泉 湯らっくす_カツ丼.jpeg'),
  user_id: 8
)

Food.create!(
  name: "キムチチゲ鍋",
  visited_sauna: "スカイスパYOKOHAMA",
  prefecture_id: 14,
  description: "鶏ガラスープをベースにあっさり、ピリ辛に仕上げてあり食欲倍増",
  image: File.open('./public/seeds_image/スカイスパYOKOHAMA_キムチチゲ鍋.jpg'),
  user_id: 11
)

Food.create!(
  name: "フランスパンのアンチョビチーズ焼き",
  visited_sauna: "スカイスパYOKOHAMA",
  prefecture_id: 14,
  description: "まろやかなチーズ、トマトの酸味、アンチョビの塩気…いろんな味がフランスパンに染み込んでいる。",
  image: File.open('./public/seeds_image/スカイスパYOKOHAMA_フランスパンのアンチョビチーズ焼き.jpg'),
  user_id: 11
)

Food.create!(
  name: "台湾もやしタワー",
  visited_sauna: "ウェルビー栄",
  prefecture_id: 23,
  description: "もやし・ニラ・ひき肉がピリ辛で炒められており、酒がとにかくススムススム！",
  image: File.open('./public/seeds_image/ウェルビー栄_台湾もやしタワー.jpeg'),
  user_id: 2
)

Food.create!(
  name: "手羽先",
  visited_sauna: "ウェルビー栄",
  prefecture_id: 23,
  description: "ウェルビーに行ってサウナ後はとりあえず手羽先とビール",
  image: File.open('./public/seeds_image/ウェルビー栄_手羽先.jpeg'),
  user_id: 9
)

Food.create!(
  name: "朝食（無料）",
  visited_sauna: "ウェルビー栄",
  prefecture_id: 23,
  description: "宿泊だとこれが7時〜10時の間無料でいただけます。しかもご飯と味噌汁はおかわり自由",
  image: File.open('./public/seeds_image/ウェルビー栄_朝食（無料）.jpeg'),
  user_id: 9
)

Food.create!(
  name: "ソーセージマッカラ",
  visited_sauna: "サウナラボ",
  prefecture_id: 23,
  description: "表面はパリッと焼き上げられており、スパイスの良い香りが漂う。普通のソーセージよりも、スパイスの味が濃厚で、サウナ後の塩分補給にもぴったりです！",
  image: File.open('./public/seeds_image/サウナラボ_ソーセージマッカラ.jpg'),
  user_id: 14
)

Food.create!(
  name: "ラム麻婆ご飯",
  visited_sauna: "The Sauna",
  prefecture_id: 20,
  description: "味が濃くて、サウナの後にピッタリ。ビールと一緒に",
  image: File.open('./public/seeds_image/The Sauna_ラム麻婆ご飯.jpg'),
  user_id: 6
)

Food.create!(
  name: "ちゃんこ鍋",
  visited_sauna: "スパ&カプセル ニューウイング",
  prefecture_id: 13,
  description: "塩スープに各具材のダシが染み出て、何と言えない美味しさ",
  image: File.open('./public/seeds_image/スパ&カプセル ニューウイング_ちゃんこ鍋.jpg'),
  user_id: 6
)

Food.create!(
  name: "味噌ラーメン",
  visited_sauna: "ニコーリフレ SAPPORO",
  prefecture_id: 1,
  description: "サウナ後の塩分補給を兼ねて",
  image: File.open('./public/seeds_image/ニコーリフレ SAPPORO_味噌ラーメン.jpg'),
  user_id: 10
)

Food.create!(
  name: "麻婆カツライス",
  visited_sauna: "ニコーリフレ SAPPORO",
  prefecture_id: 1,
  description: "トンカツと麻婆豆腐の組み合わせが何とも不思議な感じですが、とっても美味しいです。",
  image: File.open('./public/seeds_image/ニコーリフレ SAPPORO_麻婆カツライス.jpg'),
  user_id: 10
)

Food.create!(
  name: "五目焼きそば",
  visited_sauna: "神戸サウナ&スパ",
  prefecture_id: 28,
  description: "一口食べると旨味が爆裂。上質なオイスターソースが香る逸品です。",
  image: File.open('./public/seeds_image/神戸サウナ&スパ_五目焼きそば.jpg'),
  user_id: 5
)

Food.create!(
  name: "どて焼き",
  visited_sauna: "サウナ&スパ カプセルホテル 大東洋",
  prefecture_id: 27,
  description: "食事何処で漫画が読めるので、ビール飲みながら漫画を読むときのツマミによく頼みます",
  image: File.open('./public/seeds_image/サウナ&スパ カプセルホテル 大東洋_どて焼き.jpg'),
  user_id: 5
)

Food.create!(
  name: "無料朝ごはん",
  visited_sauna: "ウェルビー福岡",
  prefecture_id: 40,
  description: "どうですか、無料なのにこのボリューム。",
  image: File.open('./public/seeds_image/ウェルビー福岡_無料朝ごはん.jpeg'),
  user_id: 2
)

Food.create!(
  name: "白ゴマ坦々麺",
  visited_sauna: "タイムズ スパ・レスタ",
  prefecture_id: 40,
  description: "濃厚でまろやかな白ごまペーストに、ピリッとしたラー油の辛さが効いています",
  image: File.open('./public/seeds_image/タイムズ スパ・レスタ_坦々麺.jpg'),
  user_id: 13
)
Food.create!(
  name: "ぶりしゃぶ",
  visited_sauna: "スパ ラクーア",
  prefecture_id: 13,
  description: "ラクーアでお酒を飲むときはこれを頼みます",
  image: File.open('./public/seeds_image/スパ ラクーア_ぶりしゃぶ.jpg'),
  user_id: 3
)
# like
1.upto(17) do |n|
  user = User.find(n)
  food = Food.order("RAND()").limit(20)
  food.each { |food| food.like(user) }
end

# comment
Comment.create!(
  content: '辛そう、でも美味しそう', 
  user_id:3, 
  food_id: 15
)

Comment.create!(
  content: '野菜もとれていいですね', 
  user_id:4, 
  food_id: 32
)

Comment.create!(
  content: '深夜に見たらだめなやつだw', 
  user_id:5, 
  food_id: 31
)

Comment.create!(
  content: '名古屋飯だ', 
  user_id:6, 
  food_id: 21
)

Comment.create!(
  content: '無料でこれはいいですね', 
  user_id:7, 
  food_id: 22
)

Comment.create!(
  content: 'ラム肉の麻婆、そそられる', 
  user_id:8, 
  food_id: 24
)

Comment.create!(
  content: 'オサレ', 
  user_id:9, 
  food_id: 19
)

Comment.create!(
  content: '野菜がたくさん', 
  user_id:10, 
  food_id: 1
)

Comment.create!(
  content: '野菜がたくさん', 
  user_id:11, 
  food_id: 1
)
# relationship
users = User.all.to_a
users.permutation(2) do |user1, user2|
  user1.follow(user2)
end

# notification
Notification.create!(
  visitor_id:3, 
  visited_id:2, 
  action: 'follow'
)

Notification.create!(
  visitor_id:4, 
  visited_id:2, 
  food_id: 1,
  action: 'like'
)

Notification.create!(
  visitor_id:3, 
  visited_id:2, 
  comment_id: 1,
  food_id: 15,
  action: 'comment'
)

