use bank_loan;
select * from Finance_1;
-- KPI -1 year wise loan amount stats
select YEAR(issue_d)as year , sum(loan_amnt)as loan_amt from Finance_1 group by YEAR(issue_d) order by YEAR(issue_d);

-- KPI -2 grade and sub-grade wise revol_balance
select grade,sub_grade,sum(revol_bal)as revol_balance from Finance_1 inner join Finance_2 on Finance_1.id = Finance_2.id group by grade,sub_grade order by grade,
sub_grade;

-- KPI -3 total payment for verified status vs total payment for non verified status
select verification_status,round(sum(total_pymnt),2)as total_pymnt from Finance_1 
inner join Finance_2 on Finance_1.id = Finance_2.id group by verification_status;

-- KPI - 4 state wise and month wise loan stats
select addr_state as state,MONTH(issue_d) as month_,loan_status from Finance_1 inner join Finance_2 on Finance_1.id = Finance_2.id
order by state,month_;

-- KPI - 5 home ownership vs last payment date stats
select home_ownership,count(last_pymnt_d)as last_pymnt_d from Finance_1 inner join Finance_2 on Finance_1.id = Finance_2.id 
group by home_ownership;