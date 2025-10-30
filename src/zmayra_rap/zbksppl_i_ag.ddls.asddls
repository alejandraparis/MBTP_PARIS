@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement Interface Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZBKSPPL_I_AG  as projection on ZBKSPPL_R_AG
{
    key BooksupplUUID,
    TravelUUID,
    BookingUUID,
    BookingSupplementID,
    SupplementID,
    @Semantics.amount.currencyCode : 'CurrencyCode'
    Price,
    CurrencyCode,
    
    //Local Etag Field --- ODATA Etag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
    LocalLastChangedAt,
    /* Associations */
    _Booking : redirected to parent ZBOOKING_I_AG,
    _Product,
    _SupplementText,
    _Travel : redirected to ZTRAVEL_I_AG
}
