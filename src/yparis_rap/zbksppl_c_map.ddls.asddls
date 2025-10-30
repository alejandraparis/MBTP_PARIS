@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement Consumption Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZBKSPPL_C_MAP
  as projection on ZBKSPPL_R_MAP
{
  key BooksupplUUID,
      TravelUUID,
      BookingUUID,
      BookingSupplementID,
      SupplementID,
      @Semantics.amount.currencyCode : 'Currency'
      Price,
      Currency,
      LocalLastChangedAt,
      /* Associations */
      _Booking : redirected to parent ZBOOKING_C_MAP,
      _Product,
      _SupplementText,
      _Travel : redirected to ZTRAVEL_C_MAP
}
