@AbapCatalog.sqlViewName: 'ZZEYNEPY_V001'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds 01'
define view ZZEYNEPY_CDS_001 as select from ekko as ek
inner join ekpo as ep on ek.ebeln = ep.ebeln
inner join mara as mr on ep.matnr = mr.matnr
left outer join makt as mk on mr.matnr = mk.matnr
inner join lfa1 as lf on ek.lifnr = lf.lifnr
{
    key ep.ebeln,
    key ep.ebelp,
    ep.matnr,
    mk.maktx,
    ep.werks,
    ep.lgort,
    ep.meins,
    lf.lifnr,
    lf.adrnr,
    concat( lf.stras, lf.mcod3 ) as vendor_addr
    
}

where mk.spras = $session.system_language
