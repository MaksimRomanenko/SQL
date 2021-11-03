--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employee_name, monthly_salary from employees
join employee_salary on employee_id = employees.id
join salary on salary.id = salary_id;

--2. Вывести всех работников у которых ЗП меньше 2000.
select employee_name, monthly_salary from employees
join employee_salary on employee_id = employees.id
join salary on salary_id = salary.id
where salary.monthly_salary < 2000
order by monthly_salary;

--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select monthly_salary, employee_name from salary s 
join employee_salary es on salary_id = s.id
left join employees e on e.id = employee_id
where employee_name is null;

--4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select monthly_salary, employee_name from salary s 
join employee_salary es on salary_id = s.id
left join employees e on e.id = employee_id
where s.monthly_salary < 2000 and employee_name is null;

--5. Найти всех работников кому не начислена ЗП.
select employee_name, monthly_salary from employees e 
left join employee_salary on employee_id = e.id
left join salary on salary.id = salary_id
where monthly_salary is null;

--6. Вывести всех работников с названиями их должности.
select employee_name, role_name from employees e 
join roles_employee re on re.employee_id = e.id
join roles r on r.id= re.role_id;

--7. Вывести имена и должность только Java разработчиков.
select employee_name, role_name from employees e 
join roles_employee re on employee_id = e.id 
join roles r on r.id = role_id
where role_name like '%Java dev%';

--8. Вывести имена и должность только Python разработчиков.
select employee_name, role_name from employees e
join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id
where role_name like '%Python%';

-- 9. Вывести имена и должность всех QA инженеров.
select employee_name, role_name from employees e
join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id
where role_name like '%QA%';

--10. Вывести имена и должность ручных QA инженеров.
select employee_name, role_name from employees e
join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id
where role_name like '%Manual%';

--11. Вывести имена и должность автоматизаторов QA
select employee_name, role_name from employees e
join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id
where role_name like '%Auto%';

--12. Вывести имена и зарплаты Junior специалистов
select employee_name, role_name, monthly_salary from employees e
join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id
left join employee_salary es on es.employee_id =e.id 
left join salary s on s.id = es.salary_id 
where role_name like '%Junior%';

--13. Вывести имена и зарплаты Middle специалистов
select employee_name, role_name, monthly_salary from employees e
join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id
left join employee_salary es on es.employee_id =e.id 
left join salary s on s.id = es.salary_id 
where role_name like '%Middle%';

--14. Вывести имена и зарплаты Senior специалистов
select employee_name, role_name, monthly_salary from employees e
join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id
left join employee_salary es on es.employee_id =e.id 
left join salary s on s.id = es.salary_id 
where role_name like '%Senior%';

--15. Вывести зарплаты Java разработчиков
select employee_name, role_name, monthly_salary from employees e
join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id
left join employee_salary es on es.employee_id =e.id 
left join salary s on s.id = es.salary_id 
where role_name like '%Java dev%';

--16. Вывести зарплаты Python разработчиков
select employee_name, role_name, monthly_salary from employees e
join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id
left join employee_salary es on es.employee_id =e.id 
left join salary s on s.id = es.salary_id 
where role_name like '%Python%'; 

--17. Вывести имена и зарплаты Junior Python разработчиков
select employee_name, role_name, monthly_salary from employees e
join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id
full join employee_salary es on es.employee_id =e.id 
full join salary s on s.id = es.salary_id 
where role_name like '%Junior Python%';

--18. Вывести имена и зарплаты Middle JS разработчиков
select employee_name, role_name, monthly_salary from employees e
join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id
left join employee_salary es on es.employee_id =e.id 
left join salary s on s.id = es.salary_id 
where role_name like '%Middle JavaScript%';

--19. Вывести имена и зарплаты Senior Java разработчиков
select employee_name, role_name, monthly_salary from employees e
join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id
left join employee_salary es on es.employee_id =e.id 
left join salary s on s.id = es.salary_id 
where role_name like '%Senior Java dev%';

--20. Вывести зарплаты Junior QA инженеров
select employee_name, role_name, monthly_salary from employees e
join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id
left join employee_salary es on es.employee_id =e.id 
left join salary s on s.id = es.salary_id 
where role_name like 'Junior Manual%' or role_name like 'Junior Auto%'; 

--21. Вывести среднюю зарплату всех Junior специалистов
select avg (monthly_salary) as "Cредняя ЗП всех Junior" from employees e
join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id
join employee_salary es on es.employee_id =e.id 
join salary s on s.id = es.salary_id 
where role_name like '%Junior%';

--22. Вывести сумму зарплат JS разработчиков
select sum (monthly_salary) as "Cумма ЗП всех JavaScript Dev" from employees e
join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id
join employee_salary es on es.employee_id =e.id 
join salary s on s.id = es.salary_id 
where role_name like '%JavaS%';

--23. Вывести минимальную ЗП QA инженеров
select min (monthly_salary) as "Минимальная ЗП QA" from employees e
join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id
join employee_salary es on es.employee_id =e.id 
join salary s on s.id = es.salary_id 
where role_name like '%QA%';

--24. Вывести максимальную ЗП QA инженеров
select max (monthly_salary) as "Максимальная ЗП QA" from employees e
join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id
join employee_salary es on es.employee_id =e.id 
join salary s on s.id = es.salary_id 
where role_name like '%QA%';

--25. Вывести количество QA инженеров
select count(role_name) as "Количество QA инженеров" from employees e
join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id
where role_name like '%QA%';
 

--26. Вывести количество Middle специалистов.
select count(role_name) as "Количество Middle специалистов" from employees e
join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id
where role_name like '%Middle%';

--27. Вывести количество разработчиков
select count(role_name) as "Количество всех разработчиков" from employees e
join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id
where role_name like '%dev%'; 

--28. Вывести фонд (сумму) зарплаты разработчиков.
select sum (monthly_salary) as "Cумма ЗП всех разработчиков" from employees e
join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id
join employee_salary es on es.employee_id =e.id 
join salary s on s.id = es.salary_id 
where role_name like '%dev%'; 

--29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employee_name, role_name, monthly_salary from employees e
join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id
left join employee_salary es on es.employee_id =e.id 
left join salary s on s.id = es.salary_id
order by monthly_salary; 

--30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employee_name, role_name, monthly_salary from employees e
join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id
join employee_salary es on es.employee_id =e.id 
join salary s on s.id = es.salary_id
where monthly_salary >= 1700 and monthly_salary <= 2300
order by monthly_salary; 

--31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employee_name, role_name, monthly_salary from employees e
join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id
join employee_salary es on es.employee_id =e.id 
join salary s on s.id = es.salary_id
where monthly_salary < 2300
order by monthly_salary;

--32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employee_name, role_name, monthly_salary from employees e
join roles_employee re on re.employee_id = e.id
join roles r on r.id = re.role_id
join employee_salary es on es.employee_id =e.id 
join salary s on s.id = es.salary_id
where monthly_salary = 1100 or monthly_salary = 1500 or monthly_salary = 2000
order by monthly_salary;
