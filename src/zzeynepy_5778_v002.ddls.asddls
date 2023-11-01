@AbapCatalog.sqlViewName: 'ZZEYNEPY_V002'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ödev2 CDS1'
define view ZZEYNEPY_5778_V002 as select from vbrp as vp
inner join vbrk as vk on vp.vbeln = vk.vbeln
inner join mara as mr on vp.matnr = mr.matnr
left outer join vbak as vb on vp.aubel = vb.vbeln
left outer join kna1 as kn on vb.kunnr = kn.kunnr
left outer join makt as mk on mr.matnr = mk.matnr
{
    key vp.vbeln,
    key vp.posnr,
    vp.aubel,
    vp.aupos,
    vb.kunnr,
    concat_with_space(kn.name1, kn.name2, 1) as kunnrAd,
    currency_conversion(amount=>vp.netwr, source_currency=>vk.waerk, target_currency=>cast( 'EUR' as abap.cuky(5) ), exchange_rate_date=>vk.fkdat) as conversion_netwr,
    left(vb.kunnr,3 ) as left_kunnr,
    length(mr.matnr) as matnr_length,
    case vk.fkart 
    when 'FAS' then 'Peşinat Talebi İptali' 
    when 'FAZ' then 'Peşinat Talebi' 
    else 'Fatura' end as faturalama_turu,
    vk.fkdat
    
}

where mk.spras = $session.system_language
