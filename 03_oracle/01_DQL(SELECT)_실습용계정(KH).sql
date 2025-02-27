/*
    SELECT : ������ ��ȸ(����)
    [ǥ����]
    
        SELECT ��ȸ�ϰ��� �ϴ� ���� FROM ���̺��;
        
        SELECT �÷���1, �÷���2, ... �Ǵ� * FROM ���̺��;
*/

-- ��� ����� ������ ��ȸ
SELECT * FROM EMPLOYEE;

-- ��� ����� �̸�, �ֹι�ȣ, ����ó�� ��ȸ
SELECT EMP_NAME, EMP_NO, PHONE
FROM EMPLOYEE;                  -- FROM������ ��ȸ��

SELECT EMP_NAME AS "�̸�", EMP_NO AS "�ֹι�ȣ", PHONE AS "����ó" FROM EMPLOYEE;

-- ��� ������ ������ ��ȸ
SELECT * FROM JOB;

-- ���� ���� �� ���޸� ��ȸ
SELECT JOB_NAME FROM JOB;

-- ��� ���̺��� �����, �̸���, ����ó, �Ի���, �޿�
SELECT EMP_NAME, EMAIL, PHONE, HIRE_DATE, SALARY FROM EMPLOYEE;



/*
    �÷��� ��� ���� �߰��ϱ�
    => SELECT���� �÷��� �ۼ��κп� ��� ������ �� �� ����
*/
-- �����, ���� ���� ��ȸ
SELECT EMP_NAME, SALARY*12 AS "����" FROM EMPLOYEE;

-- �����, �޿�, ���ʽ�, ����, ���ʽ� ���� ����
SELECT EMP_NAME, SALARY, BONUS, SALARY*12,(SALARY+(SALARY*BONUS))*12
FROM EMPLOYEE;


/*
    �÷��� ��Ī �ο��ϱ�
    : ������� ����� ��� �ǹ̸� �ľ��ϱ� ��Ʊ� ������
      ��Ī�� �ο��Ͽ� ��Ȯ�ϰ� ����ϰ� ��ȸ�� �� ����
      
      1) �÷��� ��Ī
      2) �÷��� AS ��Ī
      3) �÷��� "��Ī"
      4) �÷��� AS "��Ī"
*/

SELECT EMP_NAME �����, SALARY AS �޿�, BONUS "���ʽ�", (SALARY*12) AS "����", (SALARY+(SALARY*BONUS))*12 AS "���ʽ� ���� ����"
FROM EMPLOYEE;

-- ���� ���νð� ���� : SYSDATE
-- ���� ���̺�(�ӽ� ���̺�) : DUAL
-- �⺻������ ������ ��
SELECT SYSDATE FROM DUAL;   --YY/MM/DD �������� ��ȸ

-- ��� ����� �����, �Ի���, �ٹ��ϼ� ��ȸ
-- �ٹ��ϼ� = ���糯¥ - �Ի��� +1
SELECT EMP_NAME, HIRE_DATE, SYSDATE - HIRE_DATE+1 "�ٹ��ϼ�"
FROM EMPLOYEE;
-- DATEŸ�� - DATEŸ�� => �� ������ ǥ�õ�


/*
    ���ͷ�(�� ��ü) : ���Ƿ� ������ ���� '���ڿ�' �Ǵ� ���ڷ� ǥ��
    -> SELECT ���� ����ϴ� ��� ��ȸ�� ���(Result Set)�� �ݺ������� ǥ�õ�
*/

-- �����, �޿�, '��' ��ȸ
SELECT EMP_NAME �����, SALARY �޿�, '��' ��
FROM EMPLOYEE;

/*
    ���� ������ : ||
    �� ���� �÷� �Ǵ� ���� �÷��� �������ִ� ������
*/

-- XXX�� �������� �޿� ���� ��ȸ
SELECT EMP_NAME �����, SALARY || '��' �޿�
FROM EMPLOYEE;

-- ���, �̸�, �޿��� �� ���� ��ȸ
SELECT EMP_ID || EMP_NAME || SALARY "��� ����"
FROM EMPLOYEE;

-- XXX�� �޿��� XXX���Դϴ�. �������� ��ȸ
SELECT EMP_NAME || '�� �޿��� ' || SALARY || '���Դϴ�.' "�޿� ����" 
FROM EMPLOYEE;


/*
    �ߺ� ���� : DISTINCT
    �ߺ��� ������� ���� ��� ��ȸ ����� �ϳ��� ǥ���� ��
*/
-- ������̺��� �����ڵ� ��ȸ
SELECT JOB_CODE FROM EMPLOYEE;

-- ������̺��� �ߺ� �����Ͽ� �����ڵ� ��ȸ
SELECT DISTINCT JOB_CODE FROM EMPLOYEE;

-- ������̺��� �μ��ڵ� ��ȸ(�ߺ� ����)
SELECT DISTINCT DEPT_CODE FROM EMPLOYEE;

-- *SELECT������ DISTINCT�� �� ���� ��� ������
SELECT DISTINCT DEPT_CODE, JOB_CODE FROM EMPLOYEE;
-- => �� ������ ���� �ߺ� ��������
------------------------------------------------------------------------------

/*
    WHERE�� : ��ȸ�ϰ��� �ϴ� �����͸� Ư�� ���ǿ� ���� �����ϰ��� �� �� ���
    
    [ǥ����]
        SELECT �÷���, �÷� �Ǵ� ������ ���� �����
        FROM ���̺��
        WHERE ����;
        
    - �� ������
        ��� �� : > < >= <=
        ���� ��
            - ���� �� �� : =
            - �ٸ� �� �� : != <> ^=
*/

-- ������̺��� �μ��ڵ尡 'D9'�� ������� ������ ��ȸ
SELECT *                    -- 3) ��ü �÷��� �����͸� ��ȸ
FROM EMPLOYEE               -- 1) EMPLOYEE ���̺���
WHERE DEPT_CODE = 'D9';     -- 2) DEPT_CODE �÷��� ���� D9��

-- ��� ���� �� �μ��ڵ尡 D1�� ������� �����, �޿�, �μ��ڵ带 ��ȸ
SELECT EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D1';

-- ��� ���� �� �μ��ڵ尡 'D1'�� �ƴ� ������� �����, �޿�, �μ��ڵ带 ��ȸ
SELECT EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE != 'D1';
-- WHRER DEPT_CODE <> 'D1';
-- WHERE DEPT_CODE ^= 'D1';

-- �޿��� 400���� �̻��� ������� �����, �μ��ڵ�, �޿� ������ ��ȸ
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY >= 4000000;

-- �޿��� 400���� �̸��� ������� �����, �μ��ڵ� �޿� ������ ��ȸ
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY < 4000000;

--------------------------------------------------------------------------------
-- �ǽ�����
-- [1]�޿��� 300���� �̻��� ������� �����, �޿�, �Ի���, ���� ��ȸ
SELECT EMP_NAME �����, SALARY �޿�, HIRE_DATE �Ի���, SALARY*12 ����
FROM EMPLOYEE
WHERE SALARY >= 3000000;

-- [2]������ 5õ���� �̻��� ������� �����, �޿�, ����, �μ��ڵ� ��ȸ
SELECT EMP_NAME �����, SALARY �޿�, SALARY*12 ����, DEPT_CODE �μ��ڵ�
FROM EMPLOYEE
WHERE SALARY*12 >= 50000000;

-- [3]���� �ڵ尡 'J5'�� �ƴ� ������� ���, �����, �����ڵ�, ��翩�� ��ȸ
SELECT EMP_ID ���, EMP_NAME �����, JOB_CODE �����ڵ�, ENT_yn ��翩��
FROM EMPLOYEE
WHERE JOB_CODE <> 'J5';
-- != ^=

-- [4]�޿��� 350���� �̻� 600���� ������ ��� ����� �����, ���, �޿� ��ȸ
SELECT EMP_NAME �����, EMP_ID ���, SALARY �޿�
FROM EMPLOYEE
WHERE SALARY BETWEEN 3500000 AND 6000000;
-- WHERE SALARY >= 3500000 AND SALARY <= 6000000;

/*
    BETWEEN AND : ���ǽĿ��� ���Ǵ� ����
    ~�̻� ~������ ������ ���� ������ �����ϴ� ����
    
    �÷��� BETWEEN A AND B
    �ش� �÷��� ���� A�̻� B������ ���
*/

-- �޿��� 350���� �̸� �Ǵ� 600���� �ʰ��� ����� �����, ���, �޿�
SELECT EMP_NAME �����, EMP_ID ���, SALARY �޿�
FROM EMPLOYEE
WHERE SALARY < 3500000 OR SALARY > 6000000;

-- -- �޿��� 350���� �̸� �Ǵ� 600���� �ʰ��� ����� �����, ���, �޿� (NOT ���)
SELECT EMP_NAME �����, EMP_ID ���, SALARY �޿�
FROM EMPLOYEE
WHERE NOT SALARY BETWEEN 3500000 AND 6000000;
-- WHERE SALARY (NOT) BETWEEN 3500000 AND 6000000;�� ���������� ���� �ڵ� ��õ

/*
    IN : ������ ���� �߿� ��ġ�ϴ� ���� �ִ� ��츦 ��ȸ�ϴ� ����
    
    [ǥ����]
        �÷��� IN (��1, ��2, ��3, ...)
        
        �Ʒ��� ������
        �÷��� = ��1 OR �÷��� = ��2 OR �÷��� = ��3 ...
*/

-- �μ��ڵ尡 D6�̰ų� D8�̰ų� D5�� ������� �����, �μ��ڵ�, �޿��� ��ȸ
-- IN ��� �� �� �ڵ�
SELECT EMP_NAME �����, DEPT_CODE �μ��ڵ�, SALARY �޿�
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6' OR DEPT_CODE = 'D8' OR DEPT_CODE = 'D5';

-- IN ����� �ڵ�
SELECT EMP_NAME �����, DEPT_CODE �μ��ڵ�, SALARY �޿�
FROM EMPLOYEE
WHERE DEPT_CODE IN ('D6', 'D8', 'D5');







