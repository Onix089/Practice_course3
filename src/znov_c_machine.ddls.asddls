@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection cds for machines'
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZNOV_C_machine
  as projection on ZNOV_I_machine
{
  key MachineUuid,
      @Search.defaultSearchElement: true
      MachineId,
      @Consumption.valueHelpDefinition: [{entity: {name: 'znov_i_vh_machine', element: 'MachineType'} }]
      MachineType,
      MachineWeight,
      @Semantics.quantity.unitOfMeasure: 'SizeUom'
      MachineHeight,
      @Semantics.quantity.unitOfMeasure: 'SizeUom'
      MachineWidth,
      @Semantics.quantity.unitOfMeasure: 'SizeUom'
      MachineDepth,
      @Semantics.unitOfMeasure: true
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZNOV_I_UOM', element: 'Msehi'}}]
      SizeUom,
      @Consumption.valueHelpDefinition: [{entity: {name: 'znov_i_vh_phase', element: 'Phase'} }]
      Phase,
      Criticality,
      Url,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      /* Associations */
      _Bearing : redirected to composition child ZNOV_C_RAD_bearing
}
