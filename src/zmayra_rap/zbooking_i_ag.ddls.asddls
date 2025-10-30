@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Interface Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZBOOKING_I_AG as projection on ZBOOKING_R_AG
{
  key BookingUUID,
      TravelUUID,
      BookingID,
      BookingDate,
      CustomerID,
      AirlineID,
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
      _BookingSupplement : redirected to composition child  ZBKSPPL_I_AG,
      _Carrier,
      _Connection,
      _Customer,
      _Travel : redirected to parent ZTRAVEL_I_AG
}
