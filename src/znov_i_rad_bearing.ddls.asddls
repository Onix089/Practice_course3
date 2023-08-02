@AbapCatalog.sqlViewName: 'ZNOV_I_RAD_BEAR'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'basic cds for radial bearing'
define view ZNOV_I_RAD_bearing
  as select from znov_rad_bearing as Bearing
  association [0..1] to ZNOV_I_UOM            as _Uom     on $projection.Sizeuom = _Uom.Msehi
  association        to parent ZNOV_I_machine as _Machine on $projection.MachineUuid = _Machine.MachineUuid
{

  key  bearing_uuid                                                        as BearingUuid,
       machine_uuid                                                        as MachineUuid,
       bearing_id                                                          as BearingId,
       machine_id                                                          as MachineId,
       weight                                                              as Weight,
       quantity                                                            as Quantity,
       main_d_inside                                                       as MainDInside,
       main_d_outside                                                      as MainDOutside,
       main_b                                                              as MainB,
       dinamic_load_capacity_c                                             as DinamicLoadCapacityC,
       static_load_capacity_c0                                             as StaticLoadCapacityC0,
       limit_setting_strenght_pu                                           as LimitSettingStrenghtPu,
       nom_rot_frequency                                                   as NomRotFrequency,
       lim_rot_frequency                                                   as LimRotFrequency,
       d1_inside                                                           as D1Inside,
       d1_outside                                                          as D1Outside,
       r12                                                                 as R12,
       da_inside                                                           as DaInside,
       da_outside                                                          as DaOutside,
       ra                                                                  as Ra,
       kr                                                                  as Kr,
       f0                                                                  as F0,
       sizeuom                                                             as Sizeuom,
       'https://cdn2.iconfinder.com/data/icons/auto-7/32/aauto-16-512.png' as Url,
       @Semantics.user.createdBy: true
       created_by                                                          as CreatedBy,
       @Semantics.systemDateTime.createdAt: true
       created_at                                                          as CreatedAt,
       @Semantics.user.lastChangedBy: true
       last_changed_by                                                     as LastChangedBy,
       @Semantics.systemDateTime.lastChangedAt: true
       last_changed_at                                                     as LastChangedAt,

       _Machine,
       _Uom
}
