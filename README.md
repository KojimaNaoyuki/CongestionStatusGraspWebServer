## 起動

docker-compose.prd.yml ファイルを使用する  
フロントとは混ぜずに、api 単体で一つの apache を使用する  
フロントはフロントで単体で apache を使用してサーバーを立てるようにする

```
docker-compose -f docker-compose.prd.yml up -d
```

立ち上げた後、apache の設定を行う [参考](https://qiita.com/NNKK1234/items/bcd88e030403215348a8)

## API 仕様

REST の設計指針のエンドポイント名

#### 計測地点を全取得する

```
GET /v1/place
```

#### 計測地点を設定する

- 計測地点名と面積を送信する

```
POST /v1/place?name={計測地点名}&area={面積}
```

#### 計測地点を削除する(紐づく混雑状況も同時に削除する)

```
DELETE /v1/place/{place_id}
```

#### 混雑状況を設定する(計測を開始する)

```
POST /v1/congestion_data?place_id={計測地点ID}
```

#### 人数を送信する(同時に密度の計算も行われる ログも記録される)

```
PUT /v1/congestion_data/{congestion_data_id}?people={現在の人数}
```

#### 混雑状況を取得する(congestion_data_id)

```
GET /v1/congestion_data/{congestion_data_id}
```

#### 混雑状況を取得する(計測地点名)

```
GET /v1/congestion_data/serach?name={計測地点名}
```

#### 混雑状況ログを確認する

```
GET /v1/congestion_data/log
```

##### 備考

- 計測地点は混雑状況を複数持つことができる  
  一つの大きな部屋だった場合、面積と場所は一つで複数地点で人数を計測することが考えられるため
