@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Interface Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZBOOKING_I_MAP
  as projection on ZBOOKING_R_MAP
{
  key BookingUUID,
      TravelUUID,
      BookingID,
      BookingDate,
      CustomerID,
      CarrierID,
      ConnectionID,
      FlightDate,
       @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      BookingStatus,
      
      //Local Etag Field --- ODATA Etag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      /* Associations */
      _BookingStatus,
      _BookingSupplement : redirected to composition child  ZBKSPPL_I_MAP,
      _Carrier,
      _Connection,
      _Customer,
      _Travel : redirected to parent ZTRAVEL_I_MAP
}
