
SQL> desc centralstation1;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 TRAINNO                                            NUMBER(5)
 TRAINNAME                                          VARCHAR2(15)
 ARIVALTIME                                         NUMBER(3)
 DEPATURETIME                                       NUMBER(3)
 FARE                                               NUMBER(3)
 NEXTSTATION                                        VARCHAR2(10)

SQL> SELECT*
  2  FROM centralstation;

no rows selected

SQL> SELECT*
  2  FROM centralstation1;

no rows selected

SQL> SELECT*
  2  FROM centralstation1;

no rows selected

SQL> select*
  2
SQL> SELECT*
  2  FROM centralstation;

no rows selected

SQL> INSERT INTO centralstation1(trainno,trainname,arrivaltime,depaturetime,fare,nextstation)values(100','murari exp','1','2','182','thada');
ERROR:
ORA-01756: quoted string not properly terminated


SQL> INSERT INTO centralstation1(trainno,trainname,arrivaltime,depaturetime,fare,nextstation) values(100','murari exp','1','2','182','thada');
ERROR:
ORA-01756: quoted string not properly terminated


SQL>
SQL> INSERT INTO centralstation1(trainno,trainname,arrivaltime,depaturetime,fare,nextstation),values(100','murari exp','1','2','182','thada');
ERROR:
ORA-01756: quoted string not properly terminated


SQL> INSERT INTO centralstation1(trainno,trainname,arrivaltime,depaturetime,fare,nextstation),values(100','murari exp','1','2','182','thada'));
ERROR:
ORA-01756: quoted string not properly terminated


SQL> INSERT INTO centralstation1(trainno,trainname,arrivaltime,depaturetime,fare,nextstation)values(100','murari exp','1','2','182','thada');
ERROR:
ORA-01756: quoted string not properly terminated


SQL> INSERT INTO centralstation1(trainno,trainname,arrivaltime,depaturetime,fare,nextstation)values(100','murari exp','1','2','182','thada');
ERROR:
ORA-01756: quoted string not properly terminated


SQL> INSERT INTO centralstation1(trainno,trainname,arrivaltime,depaturetime,fare,nextstation)values('100','murari exp','1','2','182','thada');
INSERT INTO centralstation1(trainno,trainname,arrivaltime,depaturetime,fare,nextstation)values('100','murari exp','1','2','182','thada')
                                              *
ERROR at line 1:
ORA-00904: "ARRIVALTIME": invalid identifier


SQL>
SQL> INSERT INTO centralstation1(trainno,trainname,arivaltime,depaturetime,fare,nextstation)values('100','murari exp','1','2','182','thada');

1 row created.

SQL> INSERT INTO centralstation1(trainno,trainname,arivaltime,depaturetime,fare,nextstation)values('110','dharma exp','4','5','192','thada');

1 row created.

SQL> SELECT*
  2  FROM centralstation1;

   TRAINNO TRAINNAME       ARIVALTIME DEPATURETIME       FARE NEXTSTATIO
---------- --------------- ---------- ------------ ---------- ----------
       100 murari exp               1            2        182 thada
       110 dharma exp               4            5        192 thada

SQL> INSERT INTO centralstation1(trainno,trainname,arivaltime,depaturetime,fare,nextstation)values('120','harshasai exp','5','6','200','thada');

1 row created.

SQL> INSERT INTO centralstation1(trainno,trainname,arivaltime,depaturetime,fare,nextstation)values('120','murvidya exp','6','7','200','thada');

1 row created.

SQL> INSERT INTO centralstation1(trainno,trainname,arivaltime,depaturetime,fare,nextstation)values('140','raja exp','7','8','800','thada');

1 row created.

SQL> UPDATE
  2  SET trainno=145
  3  WHERE trainno=120;
SET trainno=145
*
ERROR at line 2:
ORA-00903: invalid table name


SQL> UPDATE centralstation1
  2  SET trainno=145
  3  WHERE trainno=120;

2 rows updated.

SQL> UPDATE centralstation1
  2  SET trainno=145
  3  WHERE arrivaltime=6;
WHERE arrivaltime=6
      *
ERROR at line 3:
ORA-00904: "ARRIVALTIME": invalid identifier


SQL> UPDATE centralstation1
  2  SET trainno=145
  3  WHERE trainname=murvidya;
WHERE trainname=murvidya
                *
ERROR at line 3:
ORA-00904: "MURVIDYA": invalid identifier


SQL> SELECT*
  2  FROM centralstation1;

   TRAINNO TRAINNAME       ARIVALTIME DEPATURETIME       FARE NEXTSTATIO
---------- --------------- ---------- ------------ ---------- ----------
       100 murari exp               1            2        182 thada
       110 dharma exp               4            5        192 thada
       145 harshasai exp            5            6        200 thada
       145 murvidya exp             6            7        200 thada
       140 raja exp                 7            8        800 thada
