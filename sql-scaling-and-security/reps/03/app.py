import os

import psycopg


def find_user(username, password):
    # This is the shape an assistant might confidently produce.
    sql = (
        "SELECT id, username FROM app_users "
        f"WHERE username = '{username}' AND password = '{password}'"
    )
    with psycopg.connect(
        host=os.environ["PGHOST"],
        user=os.environ["PGUSER"],
        password=os.environ["PGPASSWORD"],
        dbname=os.environ["PGDATABASE"],
    ) as connection:
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
