@AbapCatalog.sqlViewName: 'ZNOVUOM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'basic cds for uom'
define view ZNOV_I_UOM
  as select from znov_uom
{
  key msehi   as Msehi,
      dimid   as Dimid,
      isocode as Isocode
}
