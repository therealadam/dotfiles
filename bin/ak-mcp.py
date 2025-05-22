#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.13"
# dependencies = [
#     "mcp[cli]",
# ]
# ///

from mcp.server.fastmcp import FastMCP
import sqlite3
import logging
import os


BEAR_PATH = os.path.expanduser("~/Library/Group Containers/9K33E3U3T4.net.shinyfrog.bear/Application Data/database.sqlite")

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
mcp = FastMCP("Demo")


@mcp.tool()
def bear(q: str) -> list[dict]:
    """Query notes in Bear for q"""

    logging.info(f"Querying Bear notes for: '{q}'")
    try:
        conn = sqlite3.connect(f'file:{BEAR_PATH}?mode=ro', uri=True)
        cur = conn.cursor()

        cur.execute("""
            SELECT 
                n.ZTITLE,
                n.ZTEXT,
                n.ZSUBTITLE,
                n.ZCREATIONDATE,
                n.ZMODIFICATIONDATE,
                n.ZUNIQUEIDENTIFIER,
                GROUP_CONCAT(t.ZTITLE) as tags
            FROM ZSFNOTE n
            LEFT JOIN Z_5TAGS nt ON n.Z_PK = nt.Z_5NOTES
            LEFT JOIN ZSFNOTETAG t ON nt.Z_13TAGS = t.Z_PK
            WHERE n.ZTRASHED = 0 AND n.ZARCHIVED = 0
            AND (n.ZTITLE LIKE ? OR n.ZTEXT LIKE ? OR n.ZSUBTITLE LIKE ? OR t.ZTITLE LIKE ?)
            GROUP BY n.Z_PK
            ORDER BY n.ZMODIFICATIONDATE DESC
            LIMIT 25
        """, (f'%{q}%', f'%{q}%', f'%{q}%', f'%{q}%'))
        notes = cur.fetchall()

        results = []
        for note in notes:
            result = {
                'title': note[0] or '',
                'text': note[1] or '',
                'subtitle': note[2] or '',
                'created': note[3],
                'modified': note[4],
                'id': note[5],
                'tags': note[6] or ''
            }
            results.append(result)

        conn.close()
    except Exception as e:
        logging.error(f"Error accessing Bear database: {e}")
        return []

    return results

if __name__ == "__main__":
    mcp.run()
