@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Consumption Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZBOOKING_C_MAP
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
      LocalLastChangedAt,
      /* Associations */
      _BookingStatus,
      _BookingSupplement : redirected to composition child ZBKSPPL_C_MAP,
      _Carrier,
      _Connection,
      _Customer,
      _Travel : redirected to parent ZTRAVEL_C_MAP
}
