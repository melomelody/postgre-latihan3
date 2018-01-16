-- no1
insert into countries (country_id, country_name, region_id) values ('ID','Indonesia',3);

--no2
 insert into locations values
 (6232,'Cinunuk',40526,'Kab. Bandung', 'Jawa Barat', 'ID'),
 (6231,'Ujung Berung',40521,'Kota. Bandung', 'Jawa Barat', 'ID'),
 (6233,'Margahayu Raya',40525,'Kota. Bandung', 'Jawa Barat', 'ID'),
 (6230,'Blok M',40620,'Jakarta Selatan', 'DKI Jakarta', 'ID'),
 (6220,'Slipi',40521,'Jakarta Utara', 'DKI Jakarta', 'ID');
 
 --no3
 update employees set commission_pct = 0.1 where job_id = 'IT_PROG' and employee_id <> 104;
 
 --no4
 Create table karyawan_tdi (
 kode_karyawan integer primary key not null,
 nama_lengkap character varying(50) not null,
 alamat_rumah integer not null references locations (location_id),
 alamat_domisili integer not null references locations (location_id),
 jabatan character varying(10) not null references jobs (job_id),
 bagian integer not null references departments (department_id)
 )
 
 --no5
 insert into karyawan_tdi values (2, 'Dimas Maryanto', 6232, 6230, 'IT_PROG', 60),
(3, 'Hari Sapto Adi', 6233, 6233, 'IT_PROG', 60),
(4, 'Deni Sutisna', 6220, 6220, 'IT_PROG', 60),
(5, 'Arip Permana', 6233, 6233, 'AD_PRES', 90),
(6, 'Zara', 6233, 6233, 'HR_REP', 10)

--no6
select k.nama_lengkap as nama, 
		l.street_address ||' , '|| l.city as alamat_rumah,
		ldom.street_address ||' , '|| ldom.city as alamat_domisili,
        d.department_name as nama_divisi,
        j.job_title as sebagai
from karyawan_tdi k, locations l, locations ldom, departments d, jobs j        
where k.alamat_rumah = l.location_id AND
	  k.alamat_domisili = ldom.location_id AND
      k.bagian = d.department_id AND
      k.jabatan = j.job_id
	  
--no7
select k.nama_lengkap, l.street_address ||' , '|| l.city as concat,d.department_name, j.job_title
from karyawan_tdi k, locations l, departments d, jobs j
where k.alamat_rumah = l.location_id AND
		k.bagian = d.department_id AND
		k.jabatan = j.job_id AND job_id = 'IT_PROG'
UNION ALL
select e.first_name ||' , '|| e.last_name as nama_lengkap,
		lo.street_address ||' , '|| lo.city as concat,
        d.department_name, j.job_title
from employees e, locations lo, departments d, jobs j
where e.department_id = d.department_id AND
	  e.job_id = j.job_id AND
      d.location_id = lo.location_id AND
      j.job_id = 'IT_PROG'






