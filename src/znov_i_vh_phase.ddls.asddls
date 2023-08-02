@AbapCatalog.sqlViewName: 'ZNOV_I_VH_PH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'basic cds for vh for ohase'
define view znov_i_vh_phase as select from znov_vh_phase
{
    key phase as Phase
}
