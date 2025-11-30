-- orders テーブル作成
DROP TABLE IF EXISTS public.orders;

CREATE TABLE public.orders (
    id           SERIAL PRIMARY KEY,
    customer_id  INTEGER NOT NULL,
    order_date   DATE    NOT NULL,
    amount       NUMERIC(10,2) NOT NULL,
    status       VARCHAR(20)   NOT NULL
);

-- ダミーデータ投入（COMPLETED / CANCELLED などを混在させる）
INSERT INTO public.orders (customer_id, order_date, amount, status) VALUES
  (1, '2025-11-20', 1200.00, 'COMPLETED'),
  (2, '2025-11-20',  800.00, 'COMPLETED'),
  (1, '2025-11-21',  500.00, 'CANCELLED'),
  (3, '2025-11-21', 2200.00, 'COMPLETED'),
  (4, '2025-11-22',  900.00, 'COMPLETED'),
  (5, '2025-11-22', 1500.50, 'COMPLETED'),
  (2, '2025-11-23',  700.00, 'PENDING'),
  (3, '2025-11-23', 1300.00, 'COMPLETED'),
  (1, '2025-11-24',  650.00, 'COMPLETED'),
  (4, '2025-11-24',  400.00, 'COMPLETED');
