@AbapCatalog.sqlViewName: 'ZNOV_VH_MACH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'basic cds for vh for machinetype'
define view znov_i_vh_machine
  as select from znov_vh_machine
{
  key machine_type as MachineType
}
