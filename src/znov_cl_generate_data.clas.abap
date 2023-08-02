CLASS znov_cl_generate_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS Znov_CL_GENERATE_DATA IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: lt_uom       TYPE TABLE OF znov_uom.
    DATA: lt_MACH_type TYPE TABLE OF znov_vh_machine.
    Data: lt_phase type table of znov_vh_phase.

    lt_uom = VALUE #(
        ( msehi = 'CM'  dimid = 'LENGTH' isocode = 'CMT')
        ( msehi = 'DM'  dimid = 'LENGTH' isocode = 'DMT')
        ( msehi = 'FT'  dimid = 'LENGTH' isocode = 'FOT')
        ( msehi = 'IN'  dimid = 'LENGTH' isocode = 'INH')
        ( msehi = 'KM'  dimid = 'LENGTH' isocode = 'KMT')
        ( msehi = 'M'   dimid = 'LENGTH' isocode = 'MTR')
        ( msehi = 'MI'  dimid = 'LENGTH' isocode = 'SMI')
        ( msehi = 'MIM' dimid = 'LENGTH' isocode = '4H')
        ( msehi = 'MM'  dimid = 'LENGTH' isocode = 'MMT')
        ( msehi = 'NAM' dimid = 'LENGTH' isocode = 'C45')
        ( msehi = 'YD'  dimid = 'LENGTH' isocode = 'YRD')
     ).

    DELETE FROM znov_uom.

    INSERT znov_uom FROM TABLE @lt_uom.

    lt_mach_type = VALUE #(
        ( machine_type = 'Lathe' )
        ( machine_type = 'Cutting' )
        ( machine_type = 'Miller' )
        ( machine_type = 'Driller' )
        ( machine_type = 'Grinder' )
        ( machine_type = 'Bending Machine' )
        ( machine_type = 'Welder' )
    ).

    DELETE FROM znov_vh_machine.

    INSERT znov_vh_machine FROM TABLE @lt_mach_type.

    lt_phase = VALUE #(
        ( phase = 'DEV')
        ( phase = 'OUT')
    ).
    delete from znov_vh_phase.

    insert znov_vh_phase from table @lt_phase.

    SELECT * FROM znov_uom INTO TABLE @lt_uom.
    out->write( sy-dbcnt ).
    out->write( ' data inserted successfully!').

  ENDMETHOD.
ENDCLASS.
