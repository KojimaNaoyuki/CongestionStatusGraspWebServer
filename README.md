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

#### 人数を送信する

```
POST /v1/congestion_data/number_of_people?people={現在の人数}
```

#### 混雑状況を取得する(congestion_data_id)

```
GET /v1/congestion_data/{congestion_data_id}
```

#### 混雑状況を取得する(計測地点名)

```
GET /v1/congestion_data?place_name={計測地点名}
```
