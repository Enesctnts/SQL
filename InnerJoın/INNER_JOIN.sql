SELECT * FROM tb_Ogrenci WHERE numara=1;

SELECT tb_Ogrenci.ad,tb_Ogrenci.soyad,tb_Ogretmen.ad ogrretmenAd,
tb_Ogretmen.soyad as ogretmenSoyad
FROM tb_Ogrenci 
INNER JOIN tb_Ogretmen
ON tb_Ogretmen.ID=tb_Ogrenci.ogretmenID;

-- ��renci ad,soyad s�n�f ad�,kat� bilgilerini ekrana yazd�ran sorgu.

SELECT tb_Ogrenci.ad,tb_Ogrenci.soyad, tb_Sinif.ad,tb_Sinif.kat FROM tb_Ogrenci
INNER JOIN tb_Sinif ON tb_Ogrenci.sinifID=tb_Sinif.ID;


-- Her ��renciyi ad,soyad, s�n�fad� ve ��retmen ad soyad� ile birlikte listeleyin.
SELECT tb_Ogrenci.ad,tb_Ogrenci.soyad,tb_Ogretmen.ad as OgretmenAd�, 
tb_Sinif.ad as S�n�fAd� FROM  tb_Ogrenci
INNER JOIN tb_Ogretmen ON tb_Ogrenci.ogretmenID = tb_Ogretmen.ID
INNER JOIN tb_Sinif ON tb_Ogrenci.sinifID = tb_Sinif.ID;