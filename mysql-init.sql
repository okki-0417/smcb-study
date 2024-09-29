-- ユーザーの作成 (必要に応じて)
CREATE USER IF NOT EXISTS 'app'@'%' IDENTIFIED BY 'aespaKarina0411';

-- 全てのデータベースに対して全権限を付与
GRANT ALL PRIVILEGES ON *.* TO 'app'@'%';
FLUSH PRIVILEGES;
