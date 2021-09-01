@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View forTravel'
@Search.searchable: true
@ObjectModel.semanticKey: ['TravelID']
define root view entity ZC_FE_TRAVEL_000191
  as projection on ZI_FE_TRAVEL_000191
{
  key TravelUUID,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
      @EndUserText.label: 'Travel'
      @ObjectModel.text.element: ['Description']
      TravelID,

      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: '/DMO/I_Agency',
          element: 'AgencyID'
        }
      } ]

      @EndUserText.label: 'Agency'
      @ObjectModel.text.element: ['AgencyName'] //Textini getirmek için
      AgencyID,
      _Agency.Name                   as AgencyName,


      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: '/DMO/I_Customer',
          element: 'CustomerID'
        }
      } ]

      @EndUserText.label: 'Customer'
      @ObjectModel.text.element: ['LastName']
      CustomerID,
      _Customer.LastName             as LastName,

      BeginDate,

      EndDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,

      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: 'I_Currency',
          element: 'Currency'
        }
      } ]
      CurrencyCode,

      Description,
      
      @Consumption.valueHelpDefinition: [ {
      entity: {
        name: 'ZI_FE_STAT_000191',
        element: 'TravelStatusId'
        }
      } ]

      @EndUserText.label: 'Status'
      @ObjectModel.text.element: ['StatusText']
      OverallStatus,
      _TravelStatus.TravelStatusText as StatusText,
      
      OverallStatusCriticality,

      CreatedBy,

      CreatedAt,

      LastChangedBy,

      LastChangedAt,

      LocalLastChangedAt,

      _Booking : redirected to composition child ZC_FE_BOOKING_000191,

      _Agency,

      _Currency,

      _Customer,

      _TravelStatus
}
