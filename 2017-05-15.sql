`klfile``klfile_fileSize`
SELECT * FROM klfile
DELETE  klfile
SELECT *FROM klfile WHERE 1=1 AND klfile_documentClassification LIKE '%JAVA%' ORDER BY klfile_uploadingTime DESC LIMIT 0,20