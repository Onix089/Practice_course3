@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection cds for radial bearing'
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity ZNOV_C_RAD_bearing
  as projection on ZNOV_I_RAD_bearing
{
  key      BearingUuid,
           MachineUuid,
           @Search.defaultSearchElement: true
           @Consumption.valueHelpDefinition: [{entity: {name: 'ZNOV_I_RAD_bearing', element: 'BearingId'},
                                          additionalBinding: [{localElement: 'Weight', element: 'Weight' },
                                                              {localElement: 'D1Inside', element: 'D1Inside'},
                                                              {localElement: 'D1Outside', element: 'D1Outside'},
                                                              {localElement: 'DaInside', element: 'DaInside'},
                                                              {localElement: 'DaOutside', element: 'DaOutside'},
                                                              {localElement: 'DinamicLoadCapacityC', element: 'DinamicLoadCapacityC'},
                                                              {localElement: 'F0', element: 'F0'},
                                                              {localElement: 'Kr', element: 'Kr'},
                                                              {localElement: 'LimitSettingStrenghtPu', element: 'LimitSettingStrenghtPu'},
                                                              {localElement: 'LimRotFrequency', element: 'LimRotFrequency'},
                                                              {localElement: 'MainB', element: 'MainB'},
                                                              {localElement: 'MainDInside', element: 'MainDInside'},
                                                              {localElement: 'MainDOutside', element: 'MainDOutside'},
                                                              {localElement: 'NomRotFrequency', element: 'NomRotFrequency'},
                                                              {localElement: 'R12', element: 'R12'},
                                                              {localElement: 'Ra', element: 'Ra'},
                                                              {localElement: 'Sizeuom', element: 'Sizeuom'},
                                                              {localElement: 'StaticLoadCapacityC0', element: 'StaticLoadCapacityC0'}] }]
           BearingId,
           @Search.defaultSearchElement: true
           @Consumption.valueHelpDefinition: [{entity: {name: 'ZNOV_C_machine', element: 'MachineId'}}]
           MachineId, 
           Weight,
           Quantity,
           @Semantics.quantity.unitOfMeasure: 'Sizeuom'
           MainDInside,
           @Semantics.quantity.unitOfMeasure: 'Sizeuom'
           MainDOutside,
           @Semantics.quantity.unitOfMeasure: 'Sizeuom'
           MainB,
           DinamicLoadCapacityC,
           StaticLoadCapacityC0,
           LimitSettingStrenghtPu,
           NomRotFrequency,
           LimRotFrequency,
           @Semantics.quantity.unitOfMeasure: 'Sizeuom'
           D1Inside,
           @Semantics.quantity.unitOfMeasure: 'Sizeuom'
           D1Outside,
           @Semantics.quantity.unitOfMeasure: 'Sizeuom'
           R12,
           @Semantics.quantity.unitOfMeasure: 'Sizeuom'
           DaInside,
           @Semantics.quantity.unitOfMeasure: 'Sizeuom'
           DaOutside,
           @Semantics.quantity.unitOfMeasure: 'Sizeuom'
           Ra,
           Kr,
           F0,
           @Semantics.unitOfMeasure: true
           @Consumption.valueHelpDefinition: [{ entity: { name: 'ZNOV_I_UOM', element: 'Msehi'}}]
           Sizeuom,
           Url,
           CreatedBy,
           CreatedAt,
           LastChangedBy,
           LastChangedAt,
           /* Associations */
           _Machine : redirected to parent ZNOV_C_machine,
           _Uom
}
