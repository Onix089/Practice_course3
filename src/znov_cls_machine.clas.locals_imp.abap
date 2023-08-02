CLASS lhc_machine DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS setIconUrl FOR DETERMINE ON SAVE
      IMPORTING keys FOR Machine~setIconUrl.
    METHODS setStartPhase FOR DETERMINE ON SAVE
      IMPORTING keys FOR Machine~setStartPhase.

    METHODS acceptMachine FOR MODIFY
      IMPORTING keys FOR ACTION Machine~acceptMachine RESULT result.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Machine RESULT result.

    METHODS rejectMachine FOR MODIFY
      IMPORTING keys FOR ACTION Machine~rejectMachine RESULT result.
    METHODS validateCharacteristics FOR VALIDATE ON SAVE
      IMPORTING keys FOR Machine~validateCharacteristics.

    METHODS validateMachine FOR VALIDATE ON SAVE
      IMPORTING keys FOR Machine~validateMachine.

ENDCLASS.

CLASS lhc_machine IMPLEMENTATION.

  METHOD setIconUrl.
    READ ENTITIES OF ZNOV_I_machine IN LOCAL MODE
        ENTITY Machine
            FIELDS ( Url MachineType ) WITH CORRESPONDING #( keys )
    RESULT DATA(machines).

    LOOP AT machines INTO DATA(mach).
      CASE mach-MachineType.
        WHEN 'Lathe'.
          mach-Url = 'https://cdn-icons-png.flaticon.com/128/313/313674.png'.
        WHEN 'Cutting'.
          mach-Url = 'https://cdn-icons-png.flaticon.com/128/3306/3306000.png'.
        WHEN 'Miller'.
          mach-Url = 'https://cdn-icons-png.flaticon.com/128/2162/2162466.png'.
        WHEN 'Driller'.
          mach-Url = 'https://cdn-icons-png.flaticon.com/128/924/924668.png'.
        WHEN 'Grinder'.
          mach-Url = 'https://cdn-icons-png.flaticon.com/128/6670/6670071.png'.
        WHEN 'Bending Machine'.
          mach-Url = 'https://cdn-icons-png.flaticon.com/128/7709/7709469.png'.
        WHEN 'Welder'.
          mach-Url = 'https://cdn-icons-png.flaticon.com/128/7927/7927001.png'.
        WHEN OTHERS.
          mach-url = 'https://cdn-icons-png.flaticon.com/128/3079/3079165.png'.
      ENDCASE.

    ENDLOOP.

    MODIFY ENTITIES OF znov_i_machine IN LOCAL MODE
    ENTITY Machine
    UPDATE FIELDS ( Url )
    WITH VALUE #( FOR machine IN machines
                    ( %tky = machine-%tky
                      Url = mach-url ) )
    REPORTED DATA(update_reported).

    reported = CORRESPONDING #( DEEP update_reported ).

  ENDMETHOD.

  METHOD setStartPhase.
    READ ENTITIES OF ZNOV_I_machine IN LOCAL MODE
        ENTITY Machine
            FIELDS ( Phase ) WITH CORRESPONDING #( keys )
    RESULT DATA(machines).

    MODIFY ENTITIES OF znov_i_machine IN LOCAL MODE
    ENTITY Machine
    UPDATE FIELDS ( Phase )
    WITH VALUE #( FOR machine IN machines
                    ( %tky = machine-%tky
                      Phase = 'DEV' ) )
    REPORTED DATA(update_reported).

    reported = CORRESPONDING #( DEEP update_reported ).
  ENDMETHOD.

  METHOD acceptMachine.
    MODIFY ENTITIES OF ZNOV_I_machine IN LOCAL MODE
      ENTITY Machine
         UPDATE
           FIELDS ( Phase )
           WITH VALUE #( FOR key IN keys
                           ( %tky         = key-%tky
                             Phase = 'OUT' ) )
      FAILED failed
      REPORTED reported.
    READ ENTITIES OF ZNOV_I_machine IN LOCAL MODE
ENTITY Machine
  ALL FIELDS WITH CORRESPONDING #( keys )
RESULT DATA(machines).

    result = VALUE #( FOR machine IN machines
                        ( %tky   = machine-%tky
                          %param = machine ) ).
  ENDMETHOD.

  METHOD get_instance_features.
    READ ENTITIES OF ZNOV_I_machine IN LOCAL MODE
    ENTITY Machine
      FIELDS ( Phase ) WITH CORRESPONDING #( keys )
    RESULT DATA(machines)
    FAILED failed.

    result =
      VALUE #(
        FOR machine IN machines
          LET is_accepted =   COND #( WHEN machine-phase = 'OUT'
                                      THEN if_abap_behv=>fc-o-disabled
                                      ELSE if_abap_behv=>fc-o-enabled  )
              is_rejected =   COND #( WHEN machine-phase = 'DEV'
                                      THEN if_abap_behv=>fc-o-disabled
                                      ELSE if_abap_behv=>fc-o-enabled )
          IN
            ( %tky                 = machine-%tky
              %action-acceptMachine = is_accepted
              %action-rejectMachine = is_rejected
              %features-%update = cond #( when machine-phase = 'OUT'
                                          then if_abap_behv=>fc-o-disabled
                                          else if_abap_behv=>fc-o-enabled )
              %features-%assoc-_Bearing = cond #( when machine-phase = 'OUT'
                                          then if_abap_behv=>fc-o-disabled
                                          else if_abap_behv=>fc-o-enabled )
             ) ).
  ENDMETHOD.

  METHOD rejectMachine.
    MODIFY ENTITIES OF ZNOV_I_machine IN LOCAL MODE
    ENTITY Machine
       UPDATE
         FIELDS ( Phase )
         WITH VALUE #( FOR key IN keys
                         ( %tky         = key-%tky
                           Phase = 'DEV' ) )
    FAILED failed
    REPORTED reported.
    READ ENTITIES OF ZNOV_I_machine IN LOCAL MODE
ENTITY Machine
  ALL FIELDS WITH CORRESPONDING #( keys )
RESULT DATA(machines).

    result = VALUE #( FOR machine IN machines
                        ( %tky   = machine-%tky
                          %param = machine ) ).
  ENDMETHOD.

  METHOD validateCharacteristics.
    READ ENTITIES OF ZNOV_I_machine IN LOCAL MODE
        ENTITY Machine
          FIELDS ( MachineDepth MachineHeight MachineWeight MachineWidth MachineUuid ) WITH CORRESPONDING #( keys )
        RESULT DATA(machines).

    LOOP AT machines INTO DATA(mach).

      APPEND VALUE #(  %tky        = mach-%tky
                       %state_area = 'VALIDATE_MACHINE_CHARACTERISTICS' )
        TO reported-machine.

      IF mach-MachineDepth IS INITIAL.
        APPEND VALUE #(  %tky = mach-%tky ) TO failed-machine.

        APPEND VALUE #(  %tky        = mach-%tky
                         %state_area = 'VALIDATE_MACHINE_CHARACTERISTICS'
                         %msg        = NEW znov_cl_msg(
                                           severity   = if_abap_behv_message=>severity-error
                                           textid     = znov_cl_msg=>empty_depth )
                      )
          TO reported-machine.
      ENDIF.
      IF mach-MachineHeight IS INITIAL.
        APPEND VALUE #(  %tky = mach-%tky ) TO failed-machine.

        APPEND VALUE #(  %tky        = mach-%tky
                         %state_area = 'VALIDATE_MACHINE_CHARACTERISTICS'
                         %msg        = NEW znov_cl_msg(
                                           severity   = if_abap_behv_message=>severity-error
                                           textid     = znov_cl_msg=>empty_height
                                            )
                          )
          TO reported-machine.
      ENDIF.
      IF mach-SizeUom IS INITIAL.
        APPEND VALUE #(  %tky = mach-%tky ) TO failed-machine.

        APPEND VALUE #(  %tky        = mach-%tky
                         %state_area = 'VALIDATE_MACHINE_CHARACTERISTICS'
                         %msg        = NEW znov_cl_msg(
                                           severity   = if_abap_behv_message=>severity-error
                                           textid     = znov_cl_msg=>empty_uom
                                            )
                      )
          TO reported-machine.
      ENDIF.
      IF mach-MachineWeight IS INITIAL.
        APPEND VALUE #(  %tky = mach-%tky ) TO failed-machine.

        APPEND VALUE #(  %tky        = mach-%tky
                         %state_area = 'VALIDATE_MACHINE_CHARACTERISTICS'
                         %msg        = NEW znov_cl_msg(
                                           severity   = if_abap_behv_message=>severity-error
                                           textid     = znov_cl_msg=>empty_weight
                                            )
                      )
          TO reported-machine.
      ENDIF.
      IF mach-MachineWidth IS INITIAL.
        APPEND VALUE #(  %tky = mach-%tky ) TO failed-machine.

        APPEND VALUE #(  %tky        = mach-%tky
                         %state_area = 'VALIDATE_MACHINE_CHARACTERISTICS'
                         %msg        = NEW znov_cl_msg(
                                           severity   = if_abap_behv_message=>severity-error
                                           textid     = znov_cl_msg=>empty_width
                                            )
                      )
          TO reported-machine.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateMachine.

    READ ENTITIES OF ZNOV_I_machine IN LOCAL MODE
      ENTITY Machine
        FIELDS ( MachineId MachineType ) WITH CORRESPONDING #( keys )
      RESULT DATA(machines).

    LOOP AT machines INTO DATA(mach).
      IF mach-MachineId IS NOT INITIAL.
        " Check if customer ID exist
        SELECT machineId
        FROM ZNOV_I_machine
          WHERE MachineId = @mach-MachineId
          INTO TABLE @DATA(dm_machines).
      ENDIF.
      " Clear state messages that might exist
      APPEND VALUE #(  %tky        = mach-%tky
                       %state_area = 'VALIDATE_MACHINE' )
        TO reported-machine.

      IF mach-MachineId IS INITIAL.
        APPEND VALUE #(  %tky = mach-%tky ) TO failed-machine.

        APPEND VALUE #(  %tky        = mach-%tky
                         %state_area = 'VALIDATE_MACHINE'
                         %msg        = NEW znov_cl_msg(
                                           severity   = if_abap_behv_message=>severity-error
                                           textid     = znov_cl_msg=>empty_machine_id )
                      )
          TO reported-machine.
      ENDIF.
      IF dm_machines IS NOT INITIAL.
        APPEND VALUE #(  %tky = mach-%tky ) TO failed-machine.

        APPEND VALUE #(  %tky        = mach-%tky
                         %state_area = 'VALIDATE_MACHINE'
                         %msg        = NEW znov_cl_msg(
                                           severity   = if_abap_behv_message=>severity-error
                                           textid     = znov_cl_msg=>exist_machineid
                                           machineid = mach-MachineId )
                         %element-machineId = if_abap_behv=>mk-on
                      )
          TO reported-machine.
      ENDIF.
      IF mach-MachineType IS INITIAL.
        APPEND VALUE #(  %tky = mach-%tky ) TO failed-machine.

        APPEND VALUE #(  %tky        = mach-%tky
                         %state_area = 'VALIDATE_MACHINE'
                         %msg        = NEW znov_cl_msg(
                                           severity   = if_abap_behv_message=>severity-error
                                           textid     = znov_cl_msg=>empty_machine_type
                                            )
                      )
          TO reported-machine.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
