-- 코드를 입력하세요
SELECT apnt_no, p.pt_name, p.pt_no, a.mcdp_cd, dr_name, apnt_ymd
from patient as p
left join appointment as a
on p.pt_no = a.pt_no
join doctor as dc
on a.mddr_id = dc.dr_id
where a.mcdp_cd = 'CS' and apnt_ymd like '2022-04-13%' and APNT_CNCL_YN='N'
ORDER BY APNT_YMD