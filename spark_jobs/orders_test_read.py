from pyspark.sql import SparkSession
import os

POSTGRES_URL = "jdbc:postgresql://postgres:5432/app_db"
POSTGRES_USER = os.getenv("POSTGRES_USER", "app")
POSTGRES_PASSWORD = os.getenv("POSTGRES_PASSWORD", "app_password")

def main():
    spark = (
        SparkSession.builder
        .appName("orders_test_read")
        .getOrCreate()
    )

    # Postgres から orders テーブルを読み込む
    df = (
        spark.read
        .format("jdbc")
        .option("url", POSTGRES_URL)
        .option("dbtable", "raw.olist_orders")
        .option("user", POSTGRES_USER)
        .option("password", POSTGRES_PASSWORD)
        .option("driver", "org.postgresql.Driver")
        .load()
    )

    print("=== スキーマ ===")
    df.printSchema()

    print("=== 先頭 5 行 ===")
    df.show(5, truncate=False)

    print("=== 件数カウント ===")
    print(df.count())

    spark.stop()

if __name__ == "__main__":
    main()
