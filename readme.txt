Скрипт создания БД и ее наполнения информацией initDB.sql находится в папке resources/database.
 В mvc-dispetcher-servlet.xml закомментированы строки
 <jdbc:initialize-database data-source="dataSource">
   <jdbc:script location="classpath:database/initDB.sql"/>

   У меня в первоначальной программе они исполняются и БД подгружается при деплое
проекта в томкате. Но при загрузки проекта с Git-Hub почему то прогшрамма в упор не хочет видеть эти файлы.