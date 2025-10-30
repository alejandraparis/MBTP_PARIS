@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking root Entity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZBOOKING_R_MAP
  as select from ztb_booking_mp_a

  association        to parent ZTRAVEL_R_MAP     as _Travel        on $projection.TravelUUID = _Travel.TravelUUID
  composition [0..*] of ZBKSPPL_R_MAP            as _BookingSupplement

  association [1..1] to /DMO/I_Customer          as _Customer      on $projection.CustomerID = _Customer.CustomerID
  association [1..1] to /DMO/I_Carrier           as _Carrier       on $projection.CarrierID = _Carrier.AirlineID
  association [1..*] to /DMO/I_Connection        as _Connection    on $projection.ConnectionID = _Connection.ConnectionID
  association [1..1] to /DMO/I_Booking_Status_VH as _BookingStatus on $projection.BookingStatus = _BookingStatus.BookingStatus
{
  key booking_uuid          as BookingUUID,
      parent_uuid           as TravelUUID,
      booking_id            as BookingID,
      booking_date          as BookingDate,
      customer_id           as CustomerID,
      carrier_id            as CarrierID,
      connection_id         as ConnectionID,
      flight_date           as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price          as FlightPrice,
      currency_code         as CurrencyCode,
      booking_status        as BookingStatus,

      //Local Etag Field --- ODATA Etag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      _Travel,
      _BookingSupplement,
      _Customer,
      _Carrier,
      _Connection,
      _BookingStatus

}
