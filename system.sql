alter session set "_ORACLE_SCRIPT" = true;

-- 비밀번호 변경
alter user hr IDENTIFIED BY hr;

--새로운 사용자 생성
create user scott IDENTIFIED BY tiger
default tablespace users
TEMPORARY TABLESPACE temp;

--새로운 사용자에게 권한 부여
grant connect, RESOURCE, dba to scott;

