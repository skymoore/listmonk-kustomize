CREATE USER listmonk WITH PASSWORD '';
CREATE DATABASE listmonk;
\c listmonk
GRANT ALL PRIVILEGES ON SCHEMA public TO listmonk;