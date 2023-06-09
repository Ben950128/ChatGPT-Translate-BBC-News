# ChatGPT-Translate-BBC-News

## ENV設定
* DATABASE_CONFIG=""
* CHATGPT_KEY=""
* AWS_ACCESS_KEY_ID=""
* AWS_SECRET_ACCESS_KEY=""
* S3_BUCKET=""

## 爬取BBC News
* 用apscheduler設定每天早上爬取BBC新聞。

## 串接gpt-3.5-turbo API
* 翻譯成繁體中文。
* 將BBC新聞依照多益程度進行改寫(ex: 將文章以多益500、700分程度進行改寫)。

## 新增資料進資料庫
* main.py 最後是將資料INSERT進PostgreSQL，以下為table的schema。
```
CREATE TABLE IF NOT EXISTS bbc_news.bbc_news
(
    news_id uuid NOT NULL,
    type CHARACTER VARYING(50) NOT NULL,
    title CHARACTER VARYING(255) NOT NULL,
    news_origin TEXT NOT NULL,
    news_tw TEXT,
    toeic_500 TEXT,
    toeic_700 TEXT,
    news_url CHARACTER VARYING(255),
    image_path CHARACTER VARYING(255),
    news_time timestamp without time zone NOT NULL,
    CONSTRAINT bbc_news_pkey PRIMARY KEY (news_id)
)
```
* main.ipynb 有將資料新增至Elasticsearch的範例。

## 啟動容器
```
docker compose up -d
```