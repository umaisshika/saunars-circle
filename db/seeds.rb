User.create!(
  name: 'タカハシタカシ',
  email: 'admin@example.com',
  password: 'admin123',
  admin: true
)

# 20.times do |n|
#   name     = Faker::Name.name
#   email    = "sample#{n+1}@example.com"
#   password = '123password'
#   User.create!(
#     name: name,
#     email: email,
#     password: password,
#   )
# end

# User
User.create!( 
  name: "まみ", 
  email: "sample1@example.com",
  password: 'password',
  avatar: File.open("./app/assets/images/user_image1")
  sauna_career: "2018-01-01", 
  home_sauna: '草加健康ランド', 
  prefecture_id: 11,
  description: 'テレビ無し、湿度高め、90℃、水風呂18℃', 
  profile: '週末サウナーです'
)
User.create!( 
  name: "ふじこ湯", 
  email: "sample2@example.com",
  password: 'password',
  avatar: File.open("./app/assets/images/user_image2")
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
  avatar: File.open("./app/assets/images/user_image3")
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
  avatar: File.open("./app/assets/images/user_image4")
  sauna_career: "2019-02-01", 
  home_sauna: '大黒湯', 
  prefecture_id: 13,
  description: '静かなサウナ', 
  profile: '休日や合間を利用してサウナ探訪してます。'
)

# Food
Food.create!(
  name: "カレーうどん",
  visited_sauna: "スパ ラクーア",
  prefecture_id: 13,
  description: "ラクーアに行ったら毎回これ",
  image: File.open('./public/seeds_image/ラクーア_カレーうどん.jpg'),
  user_id: 1
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
  user_id: 3
)
Food.create!(
  name: "スンドゥブ",
  visited_sauna: "スパロイヤル川口",
  prefecture_id: 11,
  description: "熱いのが好きな人、辛いのが好きな人、いつもと違うサ飯を味わいたい人にスンドゥブはおすすめ",
  image: File.open('./public/seeds_image/スパロイヤル川口_スンドゥブ.jpg'),
  user_id: 4
)
Food.create!(
  name: "パワーアップ豚焼き",
  visited_sauna: "草加健康センター",
  prefecture_id: 11,
  description: "ガツンと効いたニンニクが五臓六腑に染み渡ります。",
  image: File.open('./public/seeds_image/草加健康センター_パワーアップ豚焼き.jpg'),
  user_id: 4
)
Food.create!(
  name: "酸辣湯麺",
  visited_sauna: "草加健康センター",
  prefecture_id: 11,
  description: "テレビドラマ『サ道』でも取り上げられた酸辣湯麺。餡が麺に絡んでやみつきな旨さ。旨辛！",
  image: File.open('./public/seeds_image/草加健康センター_酸辣湯麺.jpg'),
  user_id: 5
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
  description: "ご飯がとても進むので、おなかがすいている人はおすすめ。",
  image: File.open('./public/seeds_image/草加健康センター_マグロ納豆.jpg'),
  user_id: 7
)
Food.create!(
  name: "カレーライス",
  visited_sauna: "天空のアジト マルシンスパ",
  prefecture_id: 13,
  description: "スタンダードなカレー。サウナに行ったら大体カレーかラーメンを食べます。",
  image: File.open('./public/seeds_image/天空のアジト マルシンスパ_カレーライス.jpg'),
  user_id: 8
)
Food.create!(
  name: "笹塚チャーシューセット",
  visited_sauna: "天空のアジト マルシンスパ",
  prefecture_id: 13,
  description: "マルシンスパといえばこれ。甘辛くとろとろに煮込まれたチャーシューとメンマに、カラシをつけて食べると最高です。",
  image: File.open('./public/seeds_image/天空のアジト マルシンスパ_笹塚チャーシューセット.jpg'),
  user_id: 9
)
Food.create!(
  name: "唐揚定食",
  visited_sauna: "かるまる",
  prefecture_id: 13,
  description: "定食人気NO.1の唐揚定食。ニンニクゴマ醤油味でご飯とビールに合いまくり",
  image: File.open('./public/seeds_image/かるまる_唐揚定食.jpg'),
  user_id: 10
)
Food.create!(
  name: "親子丼",
  visited_sauna: "かるまる",
  prefecture_id: 13,
  description: "鶏肉１つ１つがめちゃくちゃ大きくカットされていて、ボリュームが半端じゃない",
  image: File.open('./public/seeds_image/かるまる_親子丼.jpg'),
  user_id: 11
)
Food.create!(
  name: "十勝豚ロースカツカレー",
  visited_sauna: "かるまる",
  prefecture_id: 13,
  description: "辛さがマイルドで、ちょっと甘さが目立つ仕上がり",
  image: File.open('./public/seeds_image/かるまる_十勝豚ロースカツカレー.jpg'),
  user_id: 12
)

Food.create!(
  name: "カレイの唐揚げ定食",
  visited_sauna: "武蔵野温泉 なごみの湯",
  prefecture_id: 13,
  description: "身がふっくらとしたカレイに、舞茸・えのき・しめじなどきのこたっぷりのあんが絡んでおいしかったです",
  image: File.open('./public/seeds_image/武蔵野温泉 なごみの湯_カレイの唐揚げ定食.jpg'),
  user_id: 13
)

Food.create!(
  name: "四川風麻婆豆腐",
  visited_sauna: "サウナと天然温泉 湯らっくす",
  prefecture_id: 43,
  description: "痺れる大人の辛さ。さすが人気メニュー。うまい。",
  image: File.open('./public/seeds_image/サウナと天然温泉 湯らっくす_四川風麻婆豆腐.jpg'),
  user_id: 14
)

Food.create!(
  name: "酸辣湯",
  visited_sauna: "サウナと天然温泉 湯らっくす",
  prefecture_id: 43,
  description: "鶏ガラスープをベースにあっさり、ピリ辛に仕上げてあり食欲倍増",
  image: File.open('./public/seeds_image/サウナと天然温泉 湯らっくす_酸辣湯.jpg'),
  user_id: 15
)

Food.create!(
  name: "カツ丼",
  visited_sauna: "サウナと天然温泉 湯らっくす",
  prefecture_id: 43,
  description: "湯らっくすのカツ丼の美味さを日本中に知ってほしい",
  image: File.open('./public/seeds_image/サウナと天然温泉 湯らっくす_カツ丼.jpg'),
  user_id: 16
)

Food.create!(
  name: "キムチチゲ鍋",
  visited_sauna: "スカイスパYOKOHAMA",
  prefecture_id: 14,
  description: "鶏ガラスープをベースにあっさり、ピリ辛に仕上げてあり食欲倍増",
  image: File.open('./public/seeds_image/スカイスパYOKOHAMA_キムチチゲ鍋.jpg'),
  user_id: 17
)

Food.create!(
  name: "フランスパンのアンチョビチーズ焼き",
  visited_sauna: "スカイスパYOKOHAMA",
  prefecture_id: 14,
  description: "まろやかなチーズ、トマトの酸味、アンチョビの塩気…いろんな味がフランスパンに染み込んでいる。",
  image: File.open('./public/seeds_image/スカイスパYOKOHAMA_フランスパンのアンチョビチーズ焼き.jpg'),
  user_id: 18
)

Food.create!(
  name: "台湾もやしタワー",
  visited_sauna: "ウェルビー栄",
  prefecture_id: 23,
  description: "もやし・ニラ・ひき肉がピリ辛で炒められており、酒がとにかくススムススム！",
  image: File.open('./public/seeds_image/ウェルビー栄_台湾もやしタワー.jpg'),
  user_id: 19
)

Food.create!(
  name: "手羽先",
  visited_sauna: "ウェルビー栄",
  prefecture_id: 23,
  description: "ウェルビーに行ってサウナ後はとりあえず手羽先とビール",
  image: File.open('./public/seeds_image/ウェルビー栄_手羽先.jpg'),
  user_id: 20
)

Food.create!(
  name: "朝食（無料）",
  visited_sauna: "ウェルビー栄",
  prefecture_id: 23,
  description: "宿泊だとこれが7時〜10時の間無料でいただけます。しかもご飯と味噌汁はおかわり自由",
  image: File.open('./public/seeds_image/ウェルビー栄_朝食（無料）.jpg'),
  user_id: 21
)

Food.create!(
  name: "ソーセージマッカラ",
  visited_sauna: "サウナラボ",
  prefecture_id: 23,
  description: "表面はパリッと焼き上げられており、スパイスの良い香りが漂う。普通のソーセージよりも、スパイスの味が濃厚で、サウナ後の塩分補給にもぴったりです！",
  image: File.open('./public/seeds_image/サウナラボ_ソーセージマッカラ.jpg'),
  user_id: 22
)

Food.create!(
  name: "ラム麻婆ご飯",
  visited_sauna: "The Sauna",
  prefecture_id: 20,
  description: "味が濃くて、サウナの後にピッタリ。ビールと一緒に",
  image: File.open('./public/seeds_image/The Sauna_ラム麻婆ご飯.jpg'),
  user_id: 23
)

Food.create!(
  name: "ちゃんこ鍋",
  visited_sauna: "スパ&カプセル ニューウイング",
  prefecture_id: 13,
  description: "塩スープに各具材のダシが染み出て、何と言えない美味しさ",
  image: File.open('./public/seeds_image/スパ&カプセル ニューウイング_ちゃんこ鍋.jpg'),
  user_id: 24
)

Food.create!(
  name: "味噌ラーメン",
  visited_sauna: "ニコーリフレ SAPPORO",
  prefecture_id: 1,
  description: "サウナ後の塩分補給を兼ねて",
  image: File.open('./public/seeds_image/ニコーリフレ SAPPORO_味噌ラーメン.jpg'),
  user_id: 25
)

Food.create!(
  name: "麻婆カツライス",
  visited_sauna: "ニコーリフレ SAPPORO",
  prefecture_id: 1,
  description: "トンカツと麻婆豆腐の組み合わせが何とも不思議な感じですが、とっても美味しいです。",
  image: File.open('./public/seeds_image/ニコーリフレ SAPPORO_麻婆カツライス.jpg'),
  user_id: 26
)

Food.create!(
  name: "五目焼きそば",
  visited_sauna: "神戸サウナ&スパ",
  prefecture_id: 28,
  description: "一口食べると旨味が爆裂。上質なオイスターソースが香る逸品です。",
  image: File.open('./public/seeds_image/神戸サウナ&スパ_五目焼きそば.jpg'),
  user_id: 27
)

Food.create!(
  name: "どて焼き",
  visited_sauna: "サウナ&スパ カプセルホテル 大東洋",
  prefecture_id: 27,
  description: "食事何処で漫画が読めるので、ビール飲みながら漫画を読むときのツマミによく頼みます",
  image: File.open('./public/seeds_image/サウナ&スパ カプセルホテル 大東洋_どて焼き.jpg'),
  user_id: 28
)

Food.create!(
  name: "無料朝ごはん",
  visited_sauna: "ウェルビー福岡",
  prefecture_id: 40,
  description: "どうですか、無料なのにこのボリューム。",
  image: File.open('./public/seeds_image/ウェルビー福岡_無料朝ごはん.jpg'),
  user_id: 29
)

Food.create!(
  name: "白ゴマ坦々麺",
  visited_sauna: "タイムズ スパ・レスタ",
  prefecture_id: 40,
  description: "濃厚でまろやかな白ごまペーストに、ピリッとしたラー油の辛さが効いています",
  image: File.open('./public/seeds_image/タイムズ スパ・レスタ_坦々麺.jpg'),
  user_id: 30
)

# like
1.upto(18) do |n|
  user = User.find(n)
  food = Food.order("RAND()").limit(20)
  food.each { |food| food.like(user) }
end

# comment

# relationship
users = User.all.to_a
users.permutation(2) do |user1, user2|
  user1.follow(user2)
end

# notification
Notification.create!(
  visitor_id:1, 
  visited_id:2, 
  action: 'follow'
)

Notification.create!(
  visitor_id:2, 
  visited_id:1, 
  food_id: 1,
  action: 'like'
)

