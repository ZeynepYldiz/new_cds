@AbapCatalog.sqlViewName: 'ZZEYNEPY_V003'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ödev2 CDS2'
define view ZZEYNEPY_5778_V003 as select from ZZEYNEPY_5778_V002 as cd
inner join vbrk as vk on cd.vbeln = vk.vbeln
{
    cd.vbeln,
    sum( cd.conversion_netwr ) as toplam_net_deger,
    cd.kunnrAd as musteri_ad_soyad,
    count( distinct cd.posnr ) as toplam_fatura_adedi,
    division( cast( sum( cd.conversion_netwr ) as abap.curr(10,3) ) , cast( count( distinct cd.posnr ) as abap.int1 ) ,3) as ortalama_miktar, 
    substring(cd.fkdat, 1, 4) as faturalama_yil,
    substring(cd.fkdat, 5, 2) as faturalama_ayi,
    substring(cd.fkdat, 7, 2) as faturalama_gun,
    substring(vk.inco2_l, 1, 3) as incoterm_yeri
} 

group by cd.vbeln, cd.kunnrAd, cd.fkdat, vk.inco2_l
