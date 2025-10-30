@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Consumption Entity'
@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true
@Search.searchable: true

define root view entity ZTRAVEL_C_MAP
  provider contract transactional_query
  as projection on ZTRAVEL_R_MAP
{
  key TravelUUID,
      @Search.defaultSearchElement: true  
      TravelID,
      
      @Search.defaultSearchElement: true 
      @ObjectModel.text.element: [ 'AgencyName' ]
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Agency_StdVH', element: 'AgencyID'  },
                                           useForValidation: true }]
      AgencyID,
      _Agency.Name as AgencyName,
      
      @Search.defaultSearchElement: true 
      @ObjectModel.text.element: [ 'CustomerName' ]
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer_StdVH', element: 'CustomerID'  },
                                           useForValidation: true }]
      
      CustomerID,
      _Customer.LastName as CustomerName,
      
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      Description,
      OverallStatus,

      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,

      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZBOOKING_C_MAP,
      _Currency,
      _Customer,
      _OverallStatus
}
