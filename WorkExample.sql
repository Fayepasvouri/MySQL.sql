USE xxxxxxxxxxxxx;

SELECT CONCAT(USER.FIRST_NAME, USER.LAST_NAME) AS "Username", USER.USER_LOGIN AS "EMAIL", ALBUM.ALBUM_CREATED, 
ALBUM.ALBUM_UPDATED, ALBUM.ALBUM_NAME, ALBUM.USER_ID, ALBUM.ALBUM_READ_CODE
FROM ALBUM
LEFT JOIN USER 
ON USER.USER_ID=ALBUM.USER_ID
WHERE ALBUM.ALBUM_CREATED >= "2020-06-01"; 
