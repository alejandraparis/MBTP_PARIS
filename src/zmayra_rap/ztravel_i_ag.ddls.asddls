@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Interface Entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZTRAVEL_I_AG  provider contract transactional_interface
  as projection on ZTRAVEL_R_AG
 
{
  key TravelUUID,
      TravelID,
      AgencyID,
      CustomerID,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      Description,
      OverallStatus,

      //Local Etag Field --- ODATA Etag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,

      //Total Etag Field
      @Semantics.systemDateTime.lastChangedAt: true
      LastChangedAt,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZBOOKING_I_AG,
      _Currency,
      _Customer,
      _OverallStatus
}
