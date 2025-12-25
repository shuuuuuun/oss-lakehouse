from pyspark.sql import SparkSession

def main():
    # Spark セッションの作成
    spark = (
        SparkSession.builder
        .appName("OlistOrdersSampleRead")
        .getOrCreate()
    )
    
    # JDBC 接続情報
    jdbc_url = "jdbc:postgresql://postgres:5432/app_db"
    db_properties = {
        "user": "app",
        "password": "app_password",
        "driver": "org.postgresql.Driver"
    }
    
    # Postgres から olist_orders テーブルを読み込む
    df = (
        spark.read
        .format("jdbc")
        .option("url", jdbc_url)
        .option("dbtable", "raw.olist_orders")
        .option("user", db_properties["user"])
        .option("password", db_properties["password"])
        .option("driver", db_properties["driver"])
        .load()
    )

    # スキーマの確認
    print("=== スキーマ ===")
    df.printSchema()
    
    # 件数の確認
    count = df.count()
    print(f'=== 件数カウント ===\n{count}')
    
    # 先頭 5 行の表示
    print("=== 先頭 5 行 ===")
    df.show(5, truncate=False)
    
    # Spark セッションの停止
    spark.stop()
    
if __name__ == "__main__":
    main()