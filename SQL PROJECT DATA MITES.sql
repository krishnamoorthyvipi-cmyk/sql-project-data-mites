select * from patients where gender ='m';

select first_name,last_name from patients where allergies is null;

select first_name from patients where first_name like 'c%';

select first_name,last_name from patients where weight between 100 and 120;

update patients set allergies = 'NKA' where allergies is null;

select concat(first_name,last_name) as full_name from patients;

select * from patients where birth_date like '%2010%';

select first_name,last_name,height from patients where height = ( select max(height) from patients);

select * from patients where patient_id in (1,45,534,879,1000);

select count(patient_id) from admissions;

select * from admissions where  admission_date = discharge_date ;

select count(patient_id) from admissions where patient_id = 579;

select distinct(city) from patients where province_id = 'NS';

select first_name,last_name,birth_date from patients where height >= 160 and  weight >= 70;

select distinct(birth_date) from patients order by birth_date asc ;

select first_name from patients group by first_name having count(*) =1;

select first_name,patient_id from patients where first_name like 's%s' and length(first_name) = 6;

select p.patient_id ,p.first_name,p.last_name from patients p join 	admissions a on p.patient_id = a.patient_id WHERE a.diagnosis = 'Dementia';

select first_name from patients order by  length(first_name) asc, first_name  ;

select patient_id,diagnosis from admissions group by patient_id,diagnosis having count(*) >1;

select city,count(*) as total_patients from  patients group by city order by total_patients desc , city asc;

select first_name,last_name from patients union select first_name,last_name from doctors ;

select allergies , count(*) as total_patients from patients where allergies is not null group by allergies order by total_patients desc ;

select first_name,last_name,birth_date from patients where birth_date  between '1970-01-01' and  '1979-12-31' order by birth_date asc ;

select concat(upper(last_name),',',first_name) as full_name from patients order by first_name desc;

select province_id,sum(height) as total_height from patients group by province_id having sum(height) >=7000;

select max(weight)-min(weight) as weight_difference from patients where last_name = 'Maroni';

select admission_date,count(*) as total_admission from admissions group by admission_date order by total_admission desc;

select floor(weight/10)*10 as weight_group,count(*) as total_patient from patients group by floor(weight/10)*10  order by weight_group desc ;

select patient_id, weight, height, case when weight / power(height / 100, 2) >= 30 then 1 else 0 end as isobese from patients;

select p.patient_id, p.first_name, p.last_name, d.specialty
from patients p
join admissions a on p.patient_id = a.patient_id
join doctors d on a.attending_doctor_id = d.doctor_id
where a.diagnosis = 'Epilepsy'
and d.first_name = 'Lisa';








