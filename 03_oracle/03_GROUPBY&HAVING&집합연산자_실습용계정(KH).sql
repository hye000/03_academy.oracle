/*
    GROUP BY��
    : �׷� ������ ������ �� �ִ� ����
    : ���� ���� ������ �ϳ��� �׷����� ��� ó���ϴ� �������� ���
*/
-- ��ü ��� �� �޿� ��ȸ
SELECT SUM(SALARY)
FROM EMPLOYEE;

-- �μ��� �� �޿�
SELECT DEPT_CODE, SUM(SALARY) -- 3
FROM EMPLOYEE                 -- 1
GROUP BY DEPT_CODE;           -- 2

-- �μ� �� ��� ��
SELECT DEPT_CODE, COUNT(*)      -- 3
FROM EMPLOYEE                   -- 1
GROUP BY DEPT_CODE;             -- 2

-- D6, D1, D9 �� �޿�
SELECT DEPT_CODE, SUM(SALARY), COUNT(*) -- 4
FROM EMPLOYEE                           -- 1
WHERE DEPT_CODE IN ('D1', 'D6', 'D9')   -- 2
GROUP BY DEPT_CODE                      -- 3
ORDER BY DEPT_CODE;                     -- 5

-- �� ���޺� �� �����, ���ʽ��� �޴� �����, �޿���, ��ձ޿�, ���� �޿�, �ְ� �޿�
-- ��, �����ڵ� ������������ ����
SELECT JOB_CODE, COUNT(*), COUNT(BONUS)"���ʽ� �޴� ��� ��", 
        SUM(SALARY) "�޿� ��", ROUND(AVG(SALARY)) "��� �޿�", 
        MIN(SALARY) "���� �޿�", MAX(SALARY) "�ְ� �޿�"
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY JOB_CODE;

-- ���� �����, ���� ����� ��ȸ -> �ֹι�ȣ �÷�
SELECT DECODE(SUBSTR(EMP_NO, 8, 1), '1', '��', '2', '��') ���� , COUNT(*) "��� ��"
FROM EMPLOYEE
GROUP BY SUBSTR(EMP_NO, 8, 1);

-- �μ� ���� ���޺� �����, �޿� ����
SELECT DEPT_CODE, JOB_CODE, COUNT(*) "��� ��", SUM(SALARY) "�޿� ����"
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE    -- �μ� �ڵ� �������� �׷�ȭ�� �ϰ�, �׷� ������ �����ڵ� �������� ���α׷�ȭ ��
ORDER BY DEPT_CODE;

-------------------------------------------------------------------------------
/*
    HAVING�� : �׷쿡 ���� ������ ������ �� ����ϴ� ����
    (����, �׷��Լ����� ����Ͽ� ������ �ۼ���)
*/
-- �μ��� ��� �޿� ��ȸ
SELECT ROUND(AVG(SALARY)) "��� �޿�"
FROM EMPLOYEE
GROUP BY DPET_CODE;

-- �� �μ��� ��� �޿��� 300���� �̻��� �μ��� ��ȸ
SELECT DEPT_CODE, ROUND(AVG(SALARY)) "��� �޿�"    -- 4
FROM EMPLOYEE                       -- 1
WHERE SALARY >= 3000000             -- 2 => ����� �޿��� 300���� �̻�
GROUP BY DEPT_CODE;                 -- 3

SELECT DEPT_CODE, ROUND(AVG(SALARY)) "��� �޿�"    -- 4
FROM EMPLOYEE                       -- 1
GROUP BY DEPT_CODE                  -- 2
HAVING AVG(SALARY) >= 3000000;      -- 3 => �μ��� ��� �޿��� 300���� �̻�r

-- �μ��� ���ʽ��� �޴� ����� ���� �μ��� �μ��ڵ� ��ȸ
SELECT DEPT_CODE
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING COUNT(BONUS) = 0;

SELECT BONUS FROM EMPLOYEE WHERE DEPT_CODE = 'D2';










