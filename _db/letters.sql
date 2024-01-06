INSERT INTO public.main_letter (id, typel, subject, body, dt, count_open, count_send, shop_id) VALUES
  (1, 1, 'Тема1', 'Текст письма 1', '2019-11-02 21:19:05.655288+03', 10, 1, NULL),
  (2, 1, 'Тема2', 'Текст письма 2', '2019-11-02 21:19:59.621375+03', 15, 1, 345),
  (3, 2, 'Тема3', 'Текст письма 3', '2019-11-02 21:21:34.914826+03', 20, 2, 26),
  (4, 3, 'Тема4', 'Текст письма 4', '2019-11-02 23:49:44.754295+03', 25, 2, NULL);

ALTER SEQUENCE public.main_letter_id_seq RESTART 5;  -- оно выполняет setval с параметром is_called = false, поэтому 5, а не 4

