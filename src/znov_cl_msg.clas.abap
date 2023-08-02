CLASS znov_cl_msg DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_abap_behv_message .
    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    CONSTANTS:
      BEGIN OF empty_machine_id,
        msgid TYPE symsgid VALUE 'ZNOV_MSG',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_machine_id .
    CONSTANTS:
      BEGIN OF empty_machine_type,
        msgid TYPE symsgid VALUE 'ZNOV_MSG',
        msgno TYPE symsgno VALUE '002',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_machine_type.
    CONSTANTS:
      BEGIN OF empty_weight,
        msgid TYPE symsgid VALUE 'ZNOV_MSG',
        msgno TYPE symsgno VALUE '003',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_weight.
    CONSTANTS:
      BEGIN OF empty_height,
        msgid TYPE symsgid VALUE 'ZNOV_MSG',
        msgno TYPE symsgno VALUE '004',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_height.
    CONSTANTS:
      BEGIN OF empty_width,
        msgid TYPE symsgid VALUE 'ZNOV_MSG',
        msgno TYPE symsgno VALUE '005',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_width.
    CONSTANTS:
      BEGIN OF empty_depth,
        msgid TYPE symsgid VALUE 'ZNOV_MSG',
        msgno TYPE symsgno VALUE '006',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_depth.
    CONSTANTS:
      BEGIN OF empty_UOM,
        msgid TYPE symsgid VALUE 'ZNOV_MSG',
        msgno TYPE symsgno VALUE '007',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_UOM.
    CONSTANTS:
      BEGIN OF exist_machineId,
        msgid TYPE symsgid VALUE 'ZNOV_MSG',
        msgno TYPE symsgno VALUE '008',
        attr1 TYPE scx_attrname VALUE 'MACHINEID',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF exist_machineId.
    CONSTANTS:
      BEGIN OF empty_BearingId,
        msgid TYPE symsgid VALUE 'ZNOV_MSG',
        msgno TYPE symsgno VALUE '009',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_BearingId.
    CONSTANTS:
      BEGIN OF empty_BearingWeight,
        msgid TYPE symsgid VALUE 'ZNOV_MSG',
        msgno TYPE symsgno VALUE '010',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_BearingWeight.
    CONSTANTS:
      BEGIN OF empty_quantity,
        msgid TYPE symsgid VALUE 'ZNOV_MSG',
        msgno TYPE symsgno VALUE '011',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_quantity.
    CONSTANTS:
      BEGIN OF empty_dinside,
        msgid TYPE symsgid VALUE 'ZNOV_MSG',
        msgno TYPE symsgno VALUE '012',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_dinside.
    CONSTANTS:
      BEGIN OF empty_doutside,
        msgid TYPE symsgid VALUE 'ZNOV_MSG',
        msgno TYPE symsgno VALUE '013',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_doutside.
    CONSTANTS:
      BEGIN OF empty_B,
        msgid TYPE symsgid VALUE 'ZNOV_MSG',
        msgno TYPE symsgno VALUE '014',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_B.
    CONSTANTS:
      BEGIN OF empty_Pu,
        msgid TYPE symsgid VALUE 'ZNOV_MSG',
        msgno TYPE symsgno VALUE '015',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_Pu.
    CONSTANTS:
      BEGIN OF empty_Dinamic_C,
        msgid TYPE symsgid VALUE 'ZNOV_MSG',
        msgno TYPE symsgno VALUE '016',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_Dinamic_C.
    CONSTANTS:
      BEGIN OF empty_static_C0,
        msgid TYPE symsgid VALUE 'ZNOV_MSG',
        msgno TYPE symsgno VALUE '017',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_static_C0.
    CONSTANTS:
      BEGIN OF empty_NomRotFrequency,
        msgid TYPE symsgid VALUE 'ZNOV_MSG',
        msgno TYPE symsgno VALUE '018',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF EMPTY_NOMROTFREQUENCY.
    CONSTANTS:
      BEGIN OF empty_LimRotFrequency,
        msgid TYPE symsgid VALUE 'ZNOV_MSG',
        msgno TYPE symsgno VALUE '019',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_LimRotFrequency.
    CONSTANTS:
      BEGIN OF empty_d1inside,
        msgid TYPE symsgid VALUE 'ZNOV_MSG',
        msgno TYPE symsgno VALUE '020',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_d1inside.
    CONSTANTS:
      BEGIN OF empty_d1outside,
        msgid TYPE symsgid VALUE 'ZNOV_MSG',
        msgno TYPE symsgno VALUE '021',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_d1outside.
    CONSTANTS:
      BEGIN OF empty_r12,
        msgid TYPE symsgid VALUE 'ZNOV_MSG',
        msgno TYPE symsgno VALUE '022',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_r12.
    CONSTANTS:
      BEGIN OF empty_dainside,
        msgid TYPE symsgid VALUE 'ZNOV_MSG',
        msgno TYPE symsgno VALUE '023',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_dainside.
    CONSTANTS:
      BEGIN OF empty_daoutside,
        msgid TYPE symsgid VALUE 'ZNOV_MSG',
        msgno TYPE symsgno VALUE '024',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_daoutside.
    CONSTANTS:
      BEGIN OF empty_ra,
        msgid TYPE symsgid VALUE 'ZNOV_MSG',
        msgno TYPE symsgno VALUE '025',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_ra.
    CONSTANTS:
      BEGIN OF empty_Kr,
        msgid TYPE symsgid VALUE 'ZNOV_MSG',
        msgno TYPE symsgno VALUE '026',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_Kr.
    CONSTANTS:
      BEGIN OF empty_f0,
        msgid TYPE symsgid VALUE 'ZNOV_MSG',
        msgno TYPE symsgno VALUE '027',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_f0.
    CONSTANTS:
      BEGIN OF exit_BearingId,
        msgid TYPE symsgid VALUE 'ZNOV_MSG',
        msgno TYPE symsgno VALUE '028',
        attr1 TYPE scx_attrname VALUE 'BEARINGID',
        attr2 TYPE scx_attrname VALUE 'MACHINEID',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF exit_bearingId.
    METHODS constructor
      IMPORTING
        severity  TYPE if_abap_behv_message=>t_severity DEFAULT if_abap_behv_message=>severity-error
        textid    LIKE if_t100_message=>t100key OPTIONAL
        previous  TYPE REF TO cx_root OPTIONAL
        machineid TYPE znov_machine_id OPTIONAL
        bearingid type znov_bearing_id optional.
    DATA: machineid TYPE znov_machine_id READ-ONLY,
          bearingid type znov_bearing_id READ-ONLY.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS znov_cl_msg IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.

    me->if_abap_behv_message~m_severity = severity.
    me->machineid = |{ machineid ALPHA = OUT }|.
    me->bearingid = |{ bearingid ALPHA = OUT }|.
  ENDMETHOD.
ENDCLASS.
