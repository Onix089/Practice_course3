@AbapCatalog.sqlViewName: 'ZNOV_I_MACH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'basic cds for machine'
define root view ZNOV_I_machine
  as select from znov_machine as _Machine
  composition [0..*] of ZNOV_I_RAD_bearing as _Bearing
  association [0..1] to ZNOV_I_UOM         as _Uom on $projection.SizeUom = _Uom.Msehi
{
  key machine_uuid    as MachineUuid,
      machine_id      as MachineId,
      machine_type    as MachineType,
      machine_weight  as MachineWeight,
      machine_height  as MachineHeight,
      machine_width   as MachineWidth,
      machine_depth   as MachineDepth,
      sizeuom         as SizeUom,
      url             as Url,
      phase           as Phase,
      case phase
        when 'DEV' then 1
        when 'OUT' then 3
        else 0
      end             as Criticality,
      @Semantics.user.createdBy: true
      created_by      as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at      as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,
      _Uom,
      _Bearing
}
