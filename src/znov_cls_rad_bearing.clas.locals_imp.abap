CLASS lhc_bearing DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS SetMachineId FOR DETERMINE ON SAVE
      IMPORTING keys FOR Bearing~SetMachineId.

    METHODS validateBearing FOR VALIDATE ON SAVE
      IMPORTING keys FOR Bearing~validateBearing.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Bearing RESULT result.

ENDCLASS.

CLASS lhc_bearing IMPLEMENTATION.

  METHOD SetMachineId.
    READ ENTITIES OF ZNOV_I_machine IN LOCAL MODE
          ENTITY Bearing
              FIELDS ( MachineUuid MachineId ) WITH CORRESPONDING #( keys )
      RESULT DATA(bearings).

    LOOP AT bearings ASSIGNING FIELD-SYMBOL(<bearings>).
      SELECT machineId
      FROM znov_i_machine
      WHERE machineUuid = @<bearings>-MachineUuid
      INTO @DATA(machId).
      ENDSELECT.
    ENDLOOP.

    MODIFY ENTITIES OF znov_i_machine IN LOCAL MODE
    ENTITY Bearing
    UPDATE FIELDS ( MachineId )
    WITH VALUE #( FOR bearing IN bearings
                    ( %tky = bearing-%tky
                      MachineId = machId ) )
    REPORTED DATA(update_reported).

    reported = CORRESPONDING #( DEEP update_reported ).
  ENDMETHOD.

  METHOD validateBearing.
    READ ENTITIES OF ZNOV_I_machine IN LOCAL MODE
         ENTITY Bearing
           FIELDS ( BearingId D1Inside D1Outside DaInside DaOutside DinamicLoadCapacityC f0 Kr LimRotFrequency LimitSettingStrenghtPu MainB MainDInside
   MainDOutside NomRotFrequency Quantity r12 Sizeuom Ra StaticLoadCapacityC0 Weight ) WITH CORRESPONDING #( keys )
         RESULT DATA(bearings).

    LOOP AT bearings INTO DATA(bear).

      APPEND VALUE #(  %tky        = bear-%tky
                       %state_area = 'VALIDATE_RADIAL_BEARING' )
        TO reported-bearing.

      IF bear-BearingId IS INITIAL.
        APPEND VALUE #(  %tky = bear-%tky ) TO failed-bearing.

        APPEND VALUE #(  %tky        = bear-%tky
                         %state_area = 'VALIDATE_RADIAL_BEARING'
                         %msg        = NEW znov_cl_msg(
                                           severity   = if_abap_behv_message=>severity-error
                                           textid     = znov_cl_msg=>empty_bearingid )
                      )
          TO reported-bearing.
      ENDIF.
      IF bear-D1Inside IS INITIAL.
        APPEND VALUE #(  %tky = bear-%tky ) TO failed-bearing.

        APPEND VALUE #(  %tky        = bear-%tky
                         %state_area = 'VALIDATE_RADIAL_BEARING'
                         %msg        = NEW znov_cl_msg(
                                           severity   = if_abap_behv_message=>severity-error
                                           textid     = znov_cl_msg=>empty_d1inside )
                      )
          TO reported-bearing.
      ENDIF.
      IF bear-D1Outside IS INITIAL.
        APPEND VALUE #(  %tky = bear-%tky ) TO failed-bearing.

        APPEND VALUE #(  %tky        = bear-%tky
                         %state_area = 'VALIDATE_RADIAL_BEARING'
                         %msg        = NEW znov_cl_msg(
                                           severity   = if_abap_behv_message=>severity-error
                                           textid     = znov_cl_msg=>empty_d1outside )
                      )
          TO reported-bearing.
      ENDIF.
      IF bear-DaInside IS INITIAL.
        APPEND VALUE #(  %tky = bear-%tky ) TO failed-bearing.

        APPEND VALUE #(  %tky        = bear-%tky
                         %state_area = 'VALIDATE_RADIAL_BEARING'
                         %msg        = NEW znov_cl_msg(
                                           severity   = if_abap_behv_message=>severity-error
                                           textid     = znov_cl_msg=>empty_dainside )
                      )
          TO reported-bearing.
      ENDIF.
      IF bear-DinamicLoadCapacityC IS INITIAL.
        APPEND VALUE #(  %tky = bear-%tky ) TO failed-bearing.

        APPEND VALUE #(  %tky        = bear-%tky
                         %state_area = 'VALIDATE_RADIAL_BEARING'
                         %msg        = NEW znov_cl_msg(
                                           severity   = if_abap_behv_message=>severity-error
                                           textid     = znov_cl_msg=>empty_dinamic_c )
                      )
          TO reported-bearing.
      ENDIF.
      IF bear-f0 IS INITIAL.
        APPEND VALUE #(  %tky = bear-%tky ) TO failed-bearing.

        APPEND VALUE #(  %tky        = bear-%tky
                         %state_area = 'VALIDATE_RADIAL_BEARING'
                         %msg        = NEW znov_cl_msg(
                                           severity   = if_abap_behv_message=>severity-error
                                           textid     = znov_cl_msg=>empty_f0 )
                      )
          TO reported-bearing.
      ENDIF.
      IF bear-Kr IS INITIAL.
        APPEND VALUE #(  %tky = bear-%tky ) TO failed-bearing.

        APPEND VALUE #(  %tky        = bear-%tky
                         %state_area = 'VALIDATE_RADIAL_BEARING'
                         %msg        = NEW znov_cl_msg(
                                           severity   = if_abap_behv_message=>severity-error
                                           textid     = znov_cl_msg=>empty_kr )
                      )
          TO reported-bearing.
      ENDIF.
      IF bear-LimRotFrequency IS INITIAL.
        APPEND VALUE #(  %tky = bear-%tky ) TO failed-bearing.

        APPEND VALUE #(  %tky        = bear-%tky
                         %state_area = 'VALIDATE_RADIAL_BEARING'
                         %msg        = NEW znov_cl_msg(
                                           severity   = if_abap_behv_message=>severity-error
                                           textid     = znov_cl_msg=>empty_limrotfrequency )
                      )
          TO reported-bearing.
      ENDIF.
      IF bear-LimitSettingStrenghtPu IS INITIAL.
        APPEND VALUE #(  %tky = bear-%tky ) TO failed-bearing.

        APPEND VALUE #(  %tky        = bear-%tky
                         %state_area = 'VALIDATE_RADIAL_BEARING'
                         %msg        = NEW znov_cl_msg(
                                           severity   = if_abap_behv_message=>severity-error
                                           textid     = znov_cl_msg=>empty_pu )
                      )
          TO reported-bearing.
      ENDIF.
      IF bear-MainB IS INITIAL.
        APPEND VALUE #(  %tky = bear-%tky ) TO failed-bearing.

        APPEND VALUE #(  %tky        = bear-%tky
                         %state_area = 'VALIDATE_RADIAL_BEARING'
                         %msg        = NEW znov_cl_msg(
                                           severity   = if_abap_behv_message=>severity-error
                                           textid     = znov_cl_msg=>empty_b )
                      )
          TO reported-bearing.
      ENDIF.
      IF bear-MainDInside IS INITIAL.
        APPEND VALUE #(  %tky = bear-%tky ) TO failed-bearing.

        APPEND VALUE #(  %tky        = bear-%tky
                         %state_area = 'VALIDATE_RADIAL_BEARING'
                         %msg        = NEW znov_cl_msg(
                                           severity   = if_abap_behv_message=>severity-error
                                           textid     = znov_cl_msg=>empty_dinside )
                      )
          TO reported-bearing.
      ENDIF.
      IF bear-MainDOutside IS INITIAL.
        APPEND VALUE #(  %tky = bear-%tky ) TO failed-bearing.

        APPEND VALUE #(  %tky        = bear-%tky
                         %state_area = 'VALIDATE_RADIAL_BEARING'
                         %msg        = NEW znov_cl_msg(
                                           severity   = if_abap_behv_message=>severity-error
                                           textid     = znov_cl_msg=>empty_doutside )
                      )
          TO reported-bearing.
      ENDIF.
      IF bear-NomRotFrequency IS INITIAL.
        APPEND VALUE #(  %tky = bear-%tky ) TO failed-bearing.

        APPEND VALUE #(  %tky        = bear-%tky
                         %state_area = 'VALIDATE_RADIAL_BEARING'
                         %msg        = NEW znov_cl_msg(
                                           severity   = if_abap_behv_message=>severity-error
                                           textid     = znov_cl_msg=>empty_nomrotfrequency )
                      )
          TO reported-bearing.
      ENDIF.
      IF bear-Quantity IS INITIAL.
        APPEND VALUE #(  %tky = bear-%tky ) TO failed-bearing.

        APPEND VALUE #(  %tky        = bear-%tky
                         %state_area = 'VALIDATE_RADIAL_BEARING'
                         %msg        = NEW znov_cl_msg(
                                           severity   = if_abap_behv_message=>severity-error
                                           textid     = znov_cl_msg=>empty_quantity )
                      )
          TO reported-bearing.
      ENDIF.
      IF bear-r12 IS INITIAL.
        APPEND VALUE #(  %tky = bear-%tky ) TO failed-bearing.

        APPEND VALUE #(  %tky        = bear-%tky
                         %state_area = 'VALIDATE_RADIAL_BEARING'
                         %msg        = NEW znov_cl_msg(
                                           severity   = if_abap_behv_message=>severity-error
                                           textid     = znov_cl_msg=>empty_r12 )
                      )
          TO reported-bearing.
      ENDIF.
      IF bear-Ra IS INITIAL.
        APPEND VALUE #(  %tky = bear-%tky ) TO failed-bearing.

        APPEND VALUE #(  %tky        = bear-%tky
                         %state_area = 'VALIDATE_RADIAL_BEARING'
                         %msg        = NEW znov_cl_msg(
                                           severity   = if_abap_behv_message=>severity-error
                                           textid     = znov_cl_msg=>empty_ra )
                      )
          TO reported-bearing.
      ENDIF.
      IF bear-Sizeuom IS INITIAL.
        APPEND VALUE #(  %tky = bear-%tky ) TO failed-bearing.

        APPEND VALUE #(  %tky        = bear-%tky
                         %state_area = 'VALIDATE_RADIAL_BEARING'
                         %msg        = NEW znov_cl_msg(
                                           severity   = if_abap_behv_message=>severity-error
                                           textid     = znov_cl_msg=>empty_uom )
                      )
          TO reported-bearing.
      ENDIF.
      IF bear-StaticLoadCapacityC0 IS INITIAL.
        APPEND VALUE #(  %tky = bear-%tky ) TO failed-bearing.

        APPEND VALUE #(  %tky        = bear-%tky
                         %state_area = 'VALIDATE_RADIAL_BEARING'
                         %msg        = NEW znov_cl_msg(
                                           severity   = if_abap_behv_message=>severity-error
                                           textid     = znov_cl_msg=>empty_static_c0 )
                      )
          TO reported-bearing.
      ENDIF.
      IF bear-Weight IS INITIAL.
        APPEND VALUE #(  %tky = bear-%tky ) TO failed-bearing.

        APPEND VALUE #(  %tky        = bear-%tky
                         %state_area = 'VALIDATE_RADIAL_BEARING'
                         %msg        = NEW znov_cl_msg(
                                           severity   = if_abap_behv_message=>severity-error
                                           textid     = znov_cl_msg=>empty_weight )
                      )
          TO reported-bearing.
      ENDIF.

      SELECT bearingId
      FROM ZNOV_C_RAD_bearing
      WHERE MachineUuid = @bear-MachineUuid AND BearingId = @bear-BearingId
      INTO @DATA(bearing).
      ENDSELECT.
      IF bearing IS NOT INITIAL.
        APPEND VALUE #(  %tky = bear-%tky ) TO failed-bearing.

        APPEND VALUE #(  %tky        = bear-%tky
                         %state_area = 'VALIDATE_RADIAL_BEARING'
                         %msg        = NEW znov_cl_msg(
                                           severity   = if_abap_behv_message=>severity-error
                                           textid     = znov_cl_msg=>exit_bearingid
                                           machineid = bear-MachineId
                                           bearingid = bear-BearingId )
                         %element-bearingId = if_abap_behv=>mk-on
                         %element-machineId = if_abap_behv=>mk-on
                      )
          TO reported-bearing.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD get_instance_features.
    READ ENTITIES OF ZNOV_I_machine IN LOCAL MODE
      ENTITY Bearing
        FIELDS ( MachineUuid ) WITH CORRESPONDING #( keys )
      RESULT DATA(bearings)
      FAILED failed.

    LOOP AT bearings ASSIGNING FIELD-SYMBOL(<bearings>).

      SELECT phase
      FROM ZNOV_C_machine
      WHERE MachineUuid = @<bearings>-MachineUuid
      INTO @DATA(MachinePhase).
      ENDSELECT.

      result =
        VALUE #(
          FOR bearing IN bearings
              ( %tky                 = bearing-%tky
                %update = COND #( WHEN MachinePhase = 'OUT'
                                            THEN if_abap_behv=>fc-o-disabled
                                            ELSE if_abap_behv=>fc-o-enabled )
                %delete = COND #( WHEN MachinePhase = 'OUT'
                                            THEN if_abap_behv=>fc-o-disabled
                                            ELSE if_abap_behv=>fc-o-enabled )
               ) ).
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.

*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
