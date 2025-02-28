/*
    [�Լ� FUNCTION]
     : ���޵� �÷����� �о �Լ��� ������ ����� ��ȯ
     
     - ������ �Լ� : ���� ���� ���� �о ���� ���� ������� ���� (=> �ึ�� �Լ��� ������ ����� ��ȯ)
     - �׷� �Լ� : ���� ���� ���� �о �� ���� ������� ���� (=>�׷��� ���� �׷캰�� �Լ��� ������ ����� ��ȯ)
     
     * SELECT���� ������ �Լ��� �׷� �Լ��� ���ÿ� ����� �� ����
        => ��� ���� ������ �ٸ��� ������
        
     * �Լ����� ����ϴ� ��ġ : SELECT��, WHERE��, ORDER BY��, GROUP BY��, HAVING�� (FROM�� �����ϰ� ��� ����)
     
*/

--------------------------------- [������ �Լ�] ---------------------------------
/*
    ���� Ÿ���� ������ ó�� �Լ�
    -> VARCHAR2(n), CHAR(n)
    
    * LENGTH(�÷��� �Ǵ� '���ڿ�') : �ش� ���ڿ��� ���ڼ��� ��ȯ
    * LENGTHB(�÷��� �Ǵ� '���ڿ�') : �ش� ���ڿ��� ����Ʈ���� ��ȯ
    
    => ������, ����, Ư������ : ���ڴ� 1byte
       �ѱ� : ���ڴ� 3byte               / '��' '��' '��' '��' -> ��� 3byte
*/

-- '����Ŭ' �ܾ��� ���ڼ��� ����Ʈ ���� Ȯ��
SELECT LENGTH('����Ŭ') ���ڼ�, LENGTHB('����Ŭ') ����Ʈ��
FROM DUAL; -- �ӽ����̺� ���

-- 'ORACLE'�ܾ��� ���ڼ��� ����Ʈ ���� Ȯ��
SELECT LENGTH('ORACLE') ���ڼ�, LENGTHB('ORACLE') ����Ʈ��
FROM DUAL;

-- ��� �������� �����, �����(���ڼ�), �����(����Ʈ��)
--              �̸���, �̸���(���ڼ�), �̸���(����Ʈ��)
SELECT EMP_NAME �����, LENGTH(EMP_NAME) ���ڼ�, LENGTHB(EMP_NAME) ����Ʈ��,
        EMAIL �̸���, LENGTH(EMAIL) ���ڼ�, LENGTHB(EMAIL) ����Ʈ��
FROM EMPLOYEE;


/*
    [INSTR] : ���ڿ��κ��� Ư�� ������ ���� ��ġ�� ��ȯ
    
    [ǥ����]
        INSTR(�÷� �Ǵ� '���ڿ�', 'ã���� �ϴ� ����' [, ã�� ��ġ�� ���۰�, ����])
        => �Լ� ���� ������� ����Ÿ��(NUMBER)
*/

SELECT INSTR('AABAACAABBAA', 'B') FROM DUAL; -- �տ������� ù��° B�� ��ġ : 3
SELECT INSTR('AABAACAABBAA', 'B', 1) FROM DUAL; -- ���� ��ġ : 1 (�⺻��)
SELECT INSTR('AABAACAABBAA', 'B', -1) FROM DUAL; 
-- ���� ��ġ�� �������� �����ϸ�, �ڿ������� ���ڸ� ã�� ��

SELECT INSTR('AABAACAABBAA', 'B', 1, 2) FROM DUAL; 
-- �տ������� �ι�° B�� ��ġ : 9

-- ��� ���� �� �̸���, �̸����� '_'�� ù��° ��ġ, �̸����� '@'�� ù��° ��ġ
SELECT EMAIL, INSTR(EMAIL, '_', 1, 1) "_��ġ" , INSTR (EMAIL, '@', 1, 1) "@��ġ"
FROM EMPLOYEE;


/*
    [SUBSTR] : ���ڿ����� Ư�� ���ڿ��� �����ؼ� ��ȯ
    
    [ǥ����]
        SUBSTR('���ڿ�' �Ǵ� �÷�, ���� ��ġ [, ����(����)])
        => ���̸� �����ϸ� ������ġ���� ���ڿ� ������ ����
*/

SELECT SUBSTR('ORACLE SQL DEVELOPER', 12) FROM DUAL;    -- 12��° ��ġ���� ������ ����

-- �� ���ڿ����� SQL�� ����
SELECT SUBSTR('ORACLE SQL DEVELOPER', 8, 3) FROM DUAL;  -- 8��° ��ġ���� 3���ڸ� ����

SELECT SUBSTR('ORACLE SQL DEVELOPER', -3) FROM DUAL;    -- �ڿ��� 3��° ��ġ���� ������ ����

SELECT SUBSTR('ORACLE SQL DEVELOPER', -9) FROM DUAL;    -- �ڿ��� 9��° ��ġ���� ������ ����

SELECT SUBSTR('ORACLE SQL DEVELOPER', -9, 3) FROM DUAL; -- �ڿ������� 9��° ��ġ���� 3���ڸ� ����    



-- ����� �� ��������� �̸�, �ֹι�ȣ ��ȸ
SELECT EMP_NAME �̸�, EMP_NO �ֹι�ȣ
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8,1) IN ('2','4');
-- EMP_NO �÷��� �����Ϳ��� 8��° ��ġ�� �� ���ڸ� �����Ͽ� ���� ��

-- ����� �� ��������� �̸�, �ֹι�ȣ ��ȸ (��� �̸� �������� �������� ����)
SELECT EMP_NAME �̸�, EMP_NO �ֹι�ȣ
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) IN ('1', '3')
ORDER BY EMP_NAME ASC;  -- ASC�� ������ ����


-- �Լ����� ��ø�ؼ� ����� ������

-- ��� ���� �� �����, �̸���, ���̵� ��ȸ
-- ���̵� : �̸��Ͽ��� @�ձ����� ������
-- 1] �̸��Ͽ��� '@' ��ġ ã��
-- 2] �̸��� ������ 1��° ��ġ���� @��ġ ������ ����
SELECT EMP_NAME "�����", EMAIL "�̸���", SUBSTR(EMAIL, 1, INSTR(EMAIL, '@')-1) "���̵�"
FROM EMPLOYEE;


/*
    [LPAD / RPAD] : ���ڿ��� ��ȸ�� �� ���ϰ� �ְ� ��ȸ�ϰ��� �� �� ���(���ĵ� ��ó�� ���̰�)
    
    [ǥ����]
        LPAD('���ڿ�' �Ǵ� �÷�, �� ���� [, '������ ����']) -- ���ʿ� ������ ���ڸ� ä��
        RPAD('���ڿ�' �Ǵ� �÷�, �� ���� [, '������ ����']) -- �����ʿ� ������ ���ڸ� ä��
        => ������ ���ڸ� ������ ��� �������� ä����
*/

-- ��� ���� �� ������� ���ʿ� ������ ä���� 20(����)�� ��ȸ
SELECT EMP_NAME, LPAD(EMP_NAME, 20) "�����"
FROM EMPLOYEE;

-- ������� �����ʿ� ������ ä�� 20(����)�� ��ȸ
SELECT EMP_NAME, RPAD(EMP_NAME, 20) "�����"
FROM EMPLOYEE;

-- ��� ���� �� �����, �̸��� ��ȸ (�̸��� ������ ����)
SELECT EMP_NAME "�����", LPAD(EMAIL, 20) "�̸���"
FROM EMPLOYEE;

SELECT EMP_NAME "�����", RPAD(EMAIL, 20) "�̸���"
FROM EMPLOYEE;

SELECT EMP_NAME "�����", RPAD(EMAIL, 20, '#') "�̸���"
FROM EMPLOYEE;

-- �ֹι�ȣ ���� ���� ���ڸ��� * ó��
SELECT '000201-1', RPAD('000201-1', 14, '*') FROM DUAL;

-- ��� ���� �� �����, �ֹι�ȣ
-- ��, �ֹι�ȣ�� 'XXXXXX-X******' ����
-- 1] �ֹι�ȣ ������ 8�ڸ��� ����
-- 2] �������� *�� ä��
SELECT EMP_NAME �����, RPAD(SUBSTR(EMP_NO, 1, 8), 14, '*') �ֹι�ȣ
FROM EMPLOYEE;

SELECT EMP_NAME, SUBSTR(EMP_NO, 1, 8)|| '******'
FROM EMPLOYEE;


/*
    [LTRIM/ RTRIM] : ���ڿ����� Ư�� ���ڸ� ������ �� �������� ��ȯ
    
    [ǥ����]
        LTRIM('���ڿ�' �Ǵ� �÷� [, '������ ���ڵ�')
        RTRIM('���ڿ�' �Ǵ� �÷� [, '������ ���ڵ�')
        => ������ ���� �������� ���� ��� ������ ��������
*/

SELECT LTRIM('     H I') FROM DUAL; -- ���ʺ��� �ٸ� ���ڰ� ���� ������ ���� ����
SELECT RTRIM('H I     ') FROM DUAL; -- �����ʺ��� �ٸ����ڰ� ���� ������ ���� ����

SELECT LTRIM('123123H123', '123') FROM DUAL; 
SELECT LTRIM('123123H123', '321') FROM DUAL;
SELECT RTRIM('123123H123', '321') FROM DUAL;

--SELECT LTRIM('KKHHII, 123) FROM DUAL;


/*
    - TRIM : ���ڿ� ��, ��, ���ʿ� �ִ� ������ ���ڵ��� ������ �� ������ ���� ��ȯ
    
    [ǥ����]
        TRIM ([LEADING | TRAVELING | BOTH | [������ ���� FROM] ���ڿ� �Ǵ� �÷�)
        * ù��° �ɼ� ���� �� �⺻��
        * ������ ���� ���� �� ���� ����
*/

SELECT TRIM('     H  I    ') FROM DUAL; -- ���� ������� ���ŵ�

SELECT TRIM('L' FROM 'LLLLLHLLLLL') FROM DUAL;

SELECT TRIM(BOTH 'L' FROM 'LLLLLHLLLLL') "��" FROM DUAL; -- �⺻�� Ȯ��
SELECT TRIM(LEADING 'L' FROM 'LLLLLHLLLLL') "��" FROM DUAL; -- LTRIM �� ����
SELECT TRIM(TRAILING 'L' FROM 'LLLLLHLLLLL') "��" FROM DUAL; -- RTRIM �� ����


/*
    - LOWER / UPPER / INITCAP
     - LOWER : ���ڿ��� ��� �ҹ��ڷ� �����Ͽ� ��� ��ȯ
     - UPPER : ���ڿ��� ��� �빮�ڷ� �����Ͽ� ��� ��ȯ
     - INITCAP : ���⸦ �������� ù ���ڸ��� �빮�ڷ� �����Ͽ� ��� ��ȯ
*/

-- Oh my god
SELECT LOWER('Oh my god') FROM DUAL;
SELECT UPPER('Oh my god') FROM DUAL;
SELECT INITCAP('Oh my god') FROM DUAL;


/*
    - CONCAT : ���ڿ� �� ���� �ϳ��� ���ڿ��� ��ģ �� ��ȯ
    
    [ǥ����] 
        CONCAT(���ڿ�1, ���ڿ�2)
*/

SELECT 'KH' || ' A������' FROM DUAL;
SELECT CONCAT('KH', ' A������') FROM DUAL;

-- ��� ���� �� ����� ��ȸ ( {�����}�� �������� ��ȸ)
SELECT CONCAT(EMP_NAME, '��') "�����"
FROM EMPLOYEE;

SELECT EMP_NAME || '��' "�����"
FROM EMPLOYEE;

-- 200 �����ϴ� �������� ��ȸ CONCAT ���
SELECT CONCAT(EMP_ID, CONCAT(EMP_NAME, '��')) "�����"
FROM EMPLOYEE;


/*
    - REPLACE : ���ڿ����� Ư�� �κ��� ������ ���ڿ��� ��ü�Ͽ� ��ȯ
                *���� �����ʹ� ������� ����
    [ǥ����]
        REPLACE(���ڿ� �Ǵ� �÷�, ã�� ���ڿ�, ������ ���ڿ�)
*/

SELECT REPLACE('����� ������', '������', '���α�') FROM DUAL;

-- ��� ���� �� �̸��� �������� '@kh.or.kr' �κ��� '@gmail.com'���� �����Ͽ� ��ȸ
SELECT EMAIL �̸���, REPLACE(EMAIL, '@kh.or.kr', '@gmail.com') "����� �̸���"
FROM EMPLOYEE;

// ============================================================================

/*
    [���� Ÿ���� �Լ�]
    
    - ABS : ������ ������ �����ִ� �Լ�
*/

SELECT ABS(-100) FROM DUAL;

SELECT ABS(-12.34) FROM DUAL;


/*
    - MOD : �� ���� ���� ������ ���� �����ִ� �Լ�
    
    MOD(����1, ����2) ---> ����1 % ����2
*/

SELECT MOD(10, 3) FROM DUAL;
SELECT MOD(10.9, 3) FROM DUAL;


/*
    - ROUND : �ݿø��� ���� �����ִ� �Լ�
    
    ROUND(���� [,�ݿø��� ��ġ]) : �Ҽ��� ��ġ���� �ݿø��� ���� ������
                                ���� �� ù��° ��ġ���� �ݿø�
*/

SELECT ROUND(123.456) FROM DUAL;        -- .4 ��ġ���� �ݿø�
SELECT ROUND(123.456, 1) FROM DUAL;     -- .x5 ��ġ���� �ݿø�
SELECT ROUND(123.456, 2) FROM DUAL;     -- .xx6 ��ġ���� �ݿø�
SELECT ROUND(123.456, 2) FROM DUAL;

SELECT ROUND(123.456, -1) FROM DUAL; 
SELECT ROUND(123.456, -2) FROM DUAL;
-- ��ġ���� ����� ������ ���� �Ҽ��� �ڷ� ��ĭ�� �̵�,
--         ������ ������ ���� �Ҽ��� ������ ��ĭ�� �̵�(1�� �ڸ�, 10�� �ڸ�, ...)


/*
    - CEIL   : �ø� ó���� �� ����� ��ȯ���ִ� �Լ�
    - FLOOR  : ���� ó���� �� ����� ��ȯ���ִ� �Լ�
        * �� �Լ� �� ��ġ�� ������ �� ����
        
    - TRUNC : ����ó�� �� ����� ��ȯ���ִ� �Լ� (��ġ ���� ����)
*/

SELECT CEIL(123.456) FROM DUAL;
SELECT FLOOR(123.456) FROM DUAL;
SELECT TRUNC(123.456) FROM DUAL;    -- FLOOR �Լ��� ����
SELECT TRUNC(123.456, 1) FROM DUAL; -- �Ҽ��� ù°�ڸ����� ����ó��
SELECT TRUNC(123.456, -1) FROM DUAL;-- 1�� �ڸ����� ����ó��


// ============================================================================

/*
    [��¥ Ÿ�� ���� �Լ�]
    - SYSDATE : �ý����� ���� ��¥ �� �ð��� ��ȯ
    - MONTHS_BETWEEN : �� ��¥ ������ ���� ���� ��ȯ
            MONTHS_BETWEEN(��¥A, ��¥B) : ��¥A - ��¥B ���� �� ��ȯ
            ��¥ : YY/MM/DD �������� �ۼ�
*/
SELECT SYSDATE FROM DUAL;

-- ���� ������ �� �� ���� ������
SELECT MONTHS_BETWEEN(SYSDATE, '24/12/31')||'������' FROM DUAL;
SELECT MONTHS_BETWEEN(SYSDATE, '24/12/01')||'������' FROM DUAL;    -- ������ �Ҽ��� ���·� ����
SELECT CEIL(MONTHS_BETWEEN(SYSDATE, '24/12/01'))||'������' FROM DUAL;  -- �Ҽ��� �ø� �ϱ�

SELECT MONTHS_BETWEEN('25/06/18', SYSDATE) || '���� ���ҽ��ϴ�' FROM DUAL;
SELECT FLOOR(MONTHS_BETWEEN('25/06/18', SYSDATE)) || '���� ���ҽ��ϴ�' "~�������..." FROM DUAL;


-- ��� ���� �� �����, �Ի���, �ټӰ�����
SELECT EMP_NAME �����, HIRE_DATE �Ի���,
        CEIL(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) "�ټ� ���� ��"
FROM EMPLOYEE
WHERE ENT_YN = 'N';
-- WHERE ENT_DATE IS NULL;


/*
    - ADD_MONTHS : Ư�� ��¥�� n���� ���� ���ؼ� ��ȯ
                ADD_MONTHS(��¥, ���Ұ�����)
*/

-- ���� ��¥ ���� 3���� ��
SELECT SYSDATE ����, ADD_MONTHS(SYSDATE, 3) "3���� ��" FROM DUAL;

-- ��� ���� �� �����, �Ի���, ���������� ��ȸ
SELECT EMP_NAME "�����", HIRE_DATE "�Ի���", ADD_MONTHS(HIRE_DATE, 3) "���� ������"
FROM EMPLOYEE;


/*
    - NEXT_DAY : Ư�� ��¥ ���� ������ ������ ���� ����� ��¥�� ��ȯ
                NEXT_DAY(��¥, ����)
                ���� => ���� �Ǵ� ����
                1: ��, 2: ��, ... 7: ��
*/

-- ���� ��¥ ���� ���� ����� �Ͽ����� ��¥ ��ȸ
ALTER SESSION SET NLS_LANGUAGE = KOREAN;
SELECT NEXT_DAY(SYSDATE, 1) FROM DUAL;
-- ���� Ÿ���� ��� ���� ���� �����

SELECT NEXT_DAY(SYSDATE, '��') FROM DUAL;
SELECT NEXT_DAY(SYSDATE, '�Ͽ���') FROM DUAL;
-- ��� ���� : KOREAN
-- ���� Ÿ������ ���� �� ��� ������ ���� ����� �� ����

-- ��� ���� : AMERICAN
ALTER SESSION SET NLS_LANGUAGE = AMERICAN;
SELECT NEXT_DAY(SYSDATE, 'SUN') FROM DUAL;
SELECT NEXT_DAY(SYSDATE, 'SUNDAY') FROM DUAL;
SELECT NEXT_DAY(SYSDATE, '��') FROM DUAL;


/*
    - LAST_DAY : �ش� ���� ������ ��¥�� ��ȯ���ִ� �Լ�
*/

SELECT LAST_DAY(SYSDATE) FROM DUAL;

-- ��� ���� �� �����, �Ի���, �Ի��� ���� ������ ��¥, �Ի��� ���� �ٹ��ϼ� ��ȸ
SELECT EMP_NAME �����, HIRE_DATE �Ի���, LAST_DAY(HIRE_DATE) "�Ի��� ���� ������ ��",
        LAST_DAY(HIRE_DATE) - HIRE_DATE +1 "�Ի� ���� �ٹ��ϼ�"
FROM EMPLOYEE;


/*
    - EXTRACT : Ư�� ��¥�κ��� ����/��/�� ���� �����Ͽ� ��ȯ�ϴ� �Լ�
    
                EXTRACT(YEAR FROM ��¥)  : �ش� ������ ������ ����
                EXTRACT(MONTH FROM ��¥) : �ش� ��¥�� ���� ����
                EXTRACT(DAY FROM ��¥)   : �ش� ��¥�� �ϸ� ����
*/

-- ���� ��¥�� ����/ ��/ ���� ���� �����Ͽ� ��ȸ
SELECT SYSDATE,
        EXTRACT(YEAR FROM SYSDATE) "����",
        EXTRACT(MONTH FROM SYSDATE) "��",
        EXTRACT(DAY FROM SYSDATE) "��"
FROM DUAL;

-- ��� ���� �� �����, �Ի�⵵, �Ի��, �Ի��� ��ȸ 
--             (* ���� : �Ի�⵵->�Ի��->�Ի��� ������ ��������=> ASC)
SELECT EMP_NAME, 
        EXTRACT(YEAR FROM HIRE_DATE) "�Ի�⵵",
        EXTRACT(MONTH FROM HIRE_DATE) "�Ի��",
        EXTRACT(DAY FROM HIRE_DATE) "�Ի���"
FROM EMPLOYEE
-- ORDER BY EXTRACT(YEAR FROM HIRE_DATE), EXTRACT(MONTH FROM HIRE_DATE), EXTRACT(DAY FROM HIRE_DATE);
-- ORDER BY "�Ի�⵵", "�Ի��", "�Ի���";
ORDER BY 2, 3, 4;


/*
    * ����ȯ �Լ� : ������ Ÿ���� �������ִ� �Լ�
                   -> ���� / ���� / ��¥
*/

/*
    TO_CHAR : ���� �Ǵ� ���� Ÿ���� ���� ���� Ÿ������ �������ִ� �Լ�
            TO_CHAR(���� �Ǵ� ��¥ [, ����])
*/

-- ����Ÿ�� -> ����Ÿ��
SELECT 1234 "����Ÿ���� ������", TO_CHAR(1234) "����Ÿ������ ����� ����" FROM DUAL;

SELECT TO_CHAR(1234) "Ÿ�� ���游 �� ������", TO_CHAR(1234, '999999') "��������������" FROM DUAL;
-- => 9 : ������ŭ �ڸ����� Ȯ��. ����������. ���ڸ��� �������� ä��.

SELECT TO_CHAR(1234) "Ÿ�� ���游 �� ������", TO_CHAR(1234, '000000') "��������������" FROM DUAL;
-- => 0 : ������ŭ �ڸ����� Ȯ��. ����������. ���ڸ��� 0���� ä��.

SELECT TO_CHAR(1234, 'L999999') "���˵�����" FROM DUAL;
-- => L : ���� ������ ����(���)�� ���� ȭ������� ǥ��. KOREAN -> \(��ȭ), AMERICAN -> $

SELECT TO_CHAR(1234, '$999999') "���˵�����" FROM DUAL;


SELECT 1000000, TO_CHAR(1000000, 'L9,999,999') FROM DUAL;

-- ������� �����, ����, ������ ��ȸ (����, ������ ȭ����� ǥ��. 3�ڸ��� �����Ͽ� ǥ��.)
SELECT EMP_NAME, TO_CHAR(SALARY, 'L9,999,999') ����
                , TO_CHAR(SALARY*12, 'L999,999,999') ����
FROM EMPLOYEE;


// ================================= 20250303 =================================

