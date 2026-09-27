import os

import psycopg


def search_rides(fragment):
    sql = (
        "SELECT id, origin, destination FROM rides "
        f"WHERE origin LIKE '%{fragment}%' ORDER BY id"
    )
    with psycopg.connect(os.environ["DATABASE_URL"]) as connection:
        with connection.cursor() as cursor:
            cursor.execute(sql)
            return cursor.fetchall()


def main():
    fragment = "%' OR 1=1 --"
    rows = search_rides(fragment)
    print(f"returned={len(rows)}")
    for ride_id, origin, destination in rows:
        print(ride_id, origin, destination)


if __name__ == "__main__":
    main()
