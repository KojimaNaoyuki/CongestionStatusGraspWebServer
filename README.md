## API 仕様

REST の設計指針のエンドポイント名

#### 計測地点を取得する

```
GET /v1/place
```

#### 計測地点を設定する

- 計測地点名と面積を送信する

```
POST /v1/place?name={計測地点名}&area={面積}
```

#### 混雑状況を設定する

```
POST /v1/congestion_data?place_id={計測地点ID}
```

#### 人数を送信する(更新)

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
