@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement Interface Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZBKSPPL_I_MAP as projection on ZBKSPPL_R_MAP
{
    key BooksupplUUID,
    TravelUUID,
    BookingUUID,
    BookingSupplementID,
    SupplementID,
    @Semantics.amount.currencyCode : 'Currency'
    Price,
    Currency,
    
    //Local Etag Field --- ODATA Etag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
    LocalLastChangedAt,
    /* Associations */
    _Booking : redirected to parent ZBOOKING_I_MAP,
    _Product,
    _SupplementText,
    _Travel : redirected to ZTRAVEL_I_MAP
}
