import os

import psycopg


def find_user(username, password):
    sql = (
        "SELECT id, username FROM app_users "
        f"WHERE username = '{username}' AND password = '{password}'"
    )
    with psycopg.connect(os.environ["DATABASE_URL"]) as connection:
        with connection.cursor() as cursor:
            cursor.execute(sql)
            return cursor.fetchall()


def main():
    username = "alice"
    password = "' OR 1=1 --"
    rows = find_user(username, password)
    print(f"returned={len(rows)}")
    for row in rows:
        print(row)


if __name__ == "__main__":
    main()
