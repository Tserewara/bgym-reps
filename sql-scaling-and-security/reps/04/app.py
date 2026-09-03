import os

import psycopg


def search_rides(fragment):
    # The input is data, but this query lets it become SQL syntax.
    sql = (
        "SELECT id, origin, destination FROM rides "
        f"WHERE origin LIKE '%{fragment}%' ORDER BY id"
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
    fragment = "%' OR 1=1 --"
    rows = search_rides(fragment)
    print(f"returned={len(rows)}")
    for ride_id, origin, destination in rows:
        print(ride_id, origin, destination)


if __name__ == "__main__":
    main()
