@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption - Booking Approval'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity Z_C_ABOOKING_MAP
  as projection on Z_I_BOOKING_MAP
{
  key travel_id       as TravelID,
  key booking_id      as BookingID,
      booking_date    as BookingDate,
      customer_id     as CustomerID,
      @ObjectModel.text.element: [ 'CarrierNAme' ]
      carrier_id      as CarrierID,
      _Carrier.Name as CarrierName,
      connection_id   as ConnectionID,
      flight_date     as FlightDate,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      flight_price    as FlightPrice,
      @Semantics.currencyCode: true
      currency_code   as CurrencyCode,
      booking_status  as BookingStatus,
      last_changed_at as LastChangedAT,
      /* Associations */
      _Travel   : redirected to parent Z_C_ATRAVEL_MAP,    
      _Customer,
      _Carrier



}
