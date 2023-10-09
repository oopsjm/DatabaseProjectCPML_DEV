CREATE TABLE [dbo].[EuropeResult] (
    [Action]     CHAR (35)  NOT NULL,
    [Result]     CHAR (35)  NOT NULL,
    [Regime]     CHAR (255) NULL,
    [Repository] CHAR (255) NULL,
    CONSTRAINT [CK_EuropeResult_Action] CHECK (len([Action])>=(1)),
    CONSTRAINT [CK_EuropeResult_Regime] CHECK ([Regime]='Emir' OR [Regime]='Remit'),
    CONSTRAINT [CK_EuropeResult_Result] CHECK (len([Result])>=(1))
);


GO

CREATE TABLE [dbo].[BrokerConfirmation] (
    [SchemaVersion]       CHAR (255)   NOT NULL,
    [SchemaRelease]       CHAR (255)   NOT NULL,
    [DocumentID]          CHAR (255)   NOT NULL,
    [DocumentUsage]       CHAR (255)   NOT NULL,
    [SenderID]            CHAR (255)   NOT NULL,
    [ReceiverID]          CHAR (255)   NOT NULL,
    [ReceiverRole]        CHAR (255)   NOT NULL,
    [DocumentVersion]     BIGINT       NOT NULL,
    [Market]              CHAR (2)     NULL,
    [Commodity]           CHAR (255)   NULL,
    [TransactionType]     CHAR (255)   NOT NULL,
    [DeliveryPointArea]   CHAR (255)   NULL,
    [BuyerParty]          CHAR (255)   NOT NULL,
    [SellerParty]         CHAR (255)   NOT NULL,
    [LoadType]            CHAR (255)   NULL,
    [Agreement]           CHAR (255)   NULL,
    [TotalVolume]         DECIMAL (38) NULL,
    [TotalVolumeUnit]     CHAR (255)   NOT NULL,
    [TotalAmountCurrency] CHAR (3)     NOT NULL,
    [TradeDate]           DATETIME     NOT NULL,
    [CapacityUnit]        CHAR (255)   NULL,
    [TotalContractValue]  DECIMAL (38) NOT NULL,
    [CommonPricing]       CHAR (255)   NULL,
    [EffectiveDate]       DATETIME     NULL,
    [TerminationDate]     DATETIME     NULL,
    [TradeTime]           DATETIME     NULL,
    [TraderName]          CHAR (255)   NULL,
    CONSTRAINT [CK_BrokerConfirmation_CapacityUnit] CHECK ([CapacityUnit]='IUN' OR [CapacityUnit]='Vega' OR [CapacityUnit]='M3' OR [CapacityUnit]='in' OR [CapacityUnit]='g' OR [CapacityUnit]='BSH' OR [CapacityUnit]='BF' OR [CapacityUnit]='BCF' OR [CapacityUnit]='Bag' OR [CapacityUnit]='Fahrenheit' OR [CapacityUnit]='Celsius' OR [CapacityUnit]='CER' OR [CapacityUnit]='LEC' OR [CapacityUnit]='ROC' OR [CapacityUnit]='WBU' OR [CapacityUnit]='t' OR [CapacityUnit]='st' OR [CapacityUnit]='SBU' OR [CapacityUnit]='ozt' OR [CapacityUnit]='OBU' OR [CapacityUnit]='MMBTU' OR [CapacityUnit]='LB' OR [CapacityUnit]='L' OR [CapacityUnit]='kL' OR [CapacityUnit]='KG' OR [CapacityUnit]='Ingot' OR [CapacityUnit]='hL' OR [CapacityUnit]='DTH' OR [CapacityUnit]='cwt' OR [CapacityUnit]='CBU' OR [CapacityUnit]='BTU' OR [CapacityUnit]='EUA' OR [CapacityUnit]='Day' OR [CapacityUnit]='GJPerDay' OR [CapacityUnit]='GW' OR [CapacityUnit]='KW' OR [CapacityUnit]='MW' OR [CapacityUnit]='MMJPerDay' OR [CapacityUnit]='100MJPerDay' OR [CapacityUnit]='MJPerDay' OR [CapacityUnit]='GWhPerDay' OR [CapacityUnit]='KWhPerDay' OR [CapacityUnit]='ThermPerDay' OR [CapacityUnit]='GAL' OR [CapacityUnit]='MT' OR [CapacityUnit]='BBL' OR [CapacityUnit]='GJ' OR [CapacityUnit]='MMJ' OR [CapacityUnit]='100MJ' OR [CapacityUnit]='MJ' OR [CapacityUnit]='GWh' OR [CapacityUnit]='MWh' OR [CapacityUnit]='KWh' OR [CapacityUnit]='Therm'),
    CONSTRAINT [CK_BrokerConfirmation_Commodity] CHECK ([Commodity]='CER' OR [Commodity]='EUAPhase_3' OR [Commodity]='EUAPhase_2' OR [Commodity]='EUAPhase_1' OR [Commodity]='ReactivePower' OR [Commodity]='Paper' OR [Commodity]='Agriculturals' OR [Commodity]='Metal' OR [Commodity]='Bullion' OR [Commodity]='Coal' OR [Commodity]='Oil' OR [Commodity]='Gas' OR [Commodity]='Power'),
    CONSTRAINT [CK_BrokerConfirmation_CommonPricing] CHECK ([CommonPricing]='false' OR [CommonPricing]='true'),
    CONSTRAINT [CK_BrokerConfirmation_DocumentUsage] CHECK ([DocumentUsage]='Live' OR [DocumentUsage]='Test'),
    CONSTRAINT [CK_BrokerConfirmation_DocumentVersion] CHECK ([DocumentVersion]>=(1) AND [DocumentVersion]<=(999)),
    CONSTRAINT [CK_BrokerConfirmation_EffectiveDate] CHECK ([EffectiveDate] like '____-__-__'),
    CONSTRAINT [CK_BrokerConfirmation_LoadType] CHECK ([LoadType]='Custom' OR [LoadType]='OffPeak' OR [LoadType]='Peak' OR [LoadType]='Base'),
    CONSTRAINT [CK_BrokerConfirmation_Market] CHECK (len([Market])>=(2)),
    CONSTRAINT [CK_BrokerConfirmation_ReceiverRole] CHECK ([ReceiverRole]='ECVNA' OR [ReceiverRole]='ClearingHouse' OR [ReceiverRole]='Broker' OR [ReceiverRole]='Trader'),
    CONSTRAINT [CK_BrokerConfirmation_TerminationDate] CHECK ([TerminationDate] like '____-__-__'),
    CONSTRAINT [CK_BrokerConfirmation_TotalAmountCurrency] CHECK (len([TotalAmountCurrency])>=(3)),
    CONSTRAINT [CK_BrokerConfirmation_TotalVolumeUnit] CHECK ([TotalVolumeUnit]='IUN' OR [TotalVolumeUnit]='Vega' OR [TotalVolumeUnit]='M3' OR [TotalVolumeUnit]='in' OR [TotalVolumeUnit]='g' OR [TotalVolumeUnit]='BSH' OR [TotalVolumeUnit]='BF' OR [TotalVolumeUnit]='BCF' OR [TotalVolumeUnit]='Bag' OR [TotalVolumeUnit]='Fahrenheit' OR [TotalVolumeUnit]='Celsius' OR [TotalVolumeUnit]='CER' OR [TotalVolumeUnit]='LEC' OR [TotalVolumeUnit]='ROC' OR [TotalVolumeUnit]='WBU' OR [TotalVolumeUnit]='t' OR [TotalVolumeUnit]='st' OR [TotalVolumeUnit]='SBU' OR [TotalVolumeUnit]='ozt' OR [TotalVolumeUnit]='OBU' OR [TotalVolumeUnit]='MMBTU' OR [TotalVolumeUnit]='LB' OR [TotalVolumeUnit]='L' OR [TotalVolumeUnit]='kL' OR [TotalVolumeUnit]='KG' OR [TotalVolumeUnit]='Ingot' OR [TotalVolumeUnit]='hL' OR [TotalVolumeUnit]='DTH' OR [TotalVolumeUnit]='cwt' OR [TotalVolumeUnit]='CBU' OR [TotalVolumeUnit]='BTU' OR [TotalVolumeUnit]='EUA' OR [TotalVolumeUnit]='Day' OR [TotalVolumeUnit]='GJPerDay' OR [TotalVolumeUnit]='GW' OR [TotalVolumeUnit]='KW' OR [TotalVolumeUnit]='MW' OR [TotalVolumeUnit]='MMJPerDay' OR [TotalVolumeUnit]='100MJPerDay' OR [TotalVolumeUnit]='MJPerDay' OR [TotalVolumeUnit]='GWhPerDay' OR [TotalVolumeUnit]='KWhPerDay' OR [TotalVolumeUnit]='ThermPerDay' OR [TotalVolumeUnit]='GAL' OR [TotalVolumeUnit]='MT' OR [TotalVolumeUnit]='BBL' OR [TotalVolumeUnit]='GJ' OR [TotalVolumeUnit]='MMJ' OR [TotalVolumeUnit]='100MJ' OR [TotalVolumeUnit]='MJ' OR [TotalVolumeUnit]='GWh' OR [TotalVolumeUnit]='MWh' OR [TotalVolumeUnit]='KWh' OR [TotalVolumeUnit]='Therm'),
    CONSTRAINT [CK_BrokerConfirmation_TradeDate] CHECK ([TradeDate] like '____-__-__'),
    CONSTRAINT [CK_BrokerConfirmation_TransactionType] CHECK ([TransactionType]='OPT_VV_FLT_SWP' OR [TransactionType]='OPT_FIN_INX' OR [TransactionType]='OPT_FLT_SWP' OR [TransactionType]='OPT_FXD_SWP' OR [TransactionType]='VV_FLT_SWP' OR [TransactionType]='FLT_SWP' OR [TransactionType]='FXD_SWP' OR [TransactionType]='OPT_PHYS_INX' OR [TransactionType]='PHYS_INX' OR [TransactionType]='OPT' OR [TransactionType]='FOR')
);


GO

CREATE TABLE [dbo].[AdditionalData] (
    [Key]   CHAR (255) NOT NULL,
    [Value] CHAR (255) NOT NULL
);


GO

CREATE TABLE [dbo].[FixedPriceInformation] (
    [FixedPricePayer]          CHAR (255)   NOT NULL,
    [FPCurrencyUnit]           CHAR (3)     NULL,
    [FPCapacityUnit]           CHAR (255)   NULL,
    [FPCapacityConversionRate] DECIMAL (38) NULL,
    CONSTRAINT [CK_FixedPriceInformation_FPCapacityUnit] CHECK ([FPCapacityUnit]='IUN' OR [FPCapacityUnit]='Vega' OR [FPCapacityUnit]='M3' OR [FPCapacityUnit]='in' OR [FPCapacityUnit]='g' OR [FPCapacityUnit]='BSH' OR [FPCapacityUnit]='BF' OR [FPCapacityUnit]='BCF' OR [FPCapacityUnit]='Bag' OR [FPCapacityUnit]='Fahrenheit' OR [FPCapacityUnit]='Celsius' OR [FPCapacityUnit]='CER' OR [FPCapacityUnit]='LEC' OR [FPCapacityUnit]='ROC' OR [FPCapacityUnit]='WBU' OR [FPCapacityUnit]='t' OR [FPCapacityUnit]='st' OR [FPCapacityUnit]='SBU' OR [FPCapacityUnit]='ozt' OR [FPCapacityUnit]='OBU' OR [FPCapacityUnit]='MMBTU' OR [FPCapacityUnit]='LB' OR [FPCapacityUnit]='L' OR [FPCapacityUnit]='kL' OR [FPCapacityUnit]='KG' OR [FPCapacityUnit]='Ingot' OR [FPCapacityUnit]='hL' OR [FPCapacityUnit]='DTH' OR [FPCapacityUnit]='cwt' OR [FPCapacityUnit]='CBU' OR [FPCapacityUnit]='BTU' OR [FPCapacityUnit]='EUA' OR [FPCapacityUnit]='Day' OR [FPCapacityUnit]='GJPerDay' OR [FPCapacityUnit]='GW' OR [FPCapacityUnit]='KW' OR [FPCapacityUnit]='MW' OR [FPCapacityUnit]='MMJPerDay' OR [FPCapacityUnit]='100MJPerDay' OR [FPCapacityUnit]='MJPerDay' OR [FPCapacityUnit]='GWhPerDay' OR [FPCapacityUnit]='KWhPerDay' OR [FPCapacityUnit]='ThermPerDay' OR [FPCapacityUnit]='GAL' OR [FPCapacityUnit]='MT' OR [FPCapacityUnit]='BBL' OR [FPCapacityUnit]='GJ' OR [FPCapacityUnit]='MMJ' OR [FPCapacityUnit]='100MJ' OR [FPCapacityUnit]='MJ' OR [FPCapacityUnit]='GWh' OR [FPCapacityUnit]='MWh' OR [FPCapacityUnit]='KWh' OR [FPCapacityUnit]='Therm'),
    CONSTRAINT [CK_FixedPriceInformation_FPCurrencyUnit] CHECK (len([FPCurrencyUnit])>=(3))
);


GO

CREATE TABLE [dbo].[Fixing] (
    [Currency1]  CHAR (3)   NOT NULL,
    [Currency2]  CHAR (3)   NOT NULL,
    [QuoteBasis] CHAR (255) NOT NULL,
    [FixingDate] DATETIME   NULL,
    CONSTRAINT [CK_Fixing_Currency1] CHECK (len([Currency1])>=(3)),
    CONSTRAINT [CK_Fixing_Currency2] CHECK (len([Currency2])>=(3)),
    CONSTRAINT [CK_Fixing_FixingDate] CHECK ([FixingDate] like '____-__-__'),
    CONSTRAINT [CK_Fixing_QuoteBasis] CHECK ([QuoteBasis]='CallCurrencyPerPutCurrency' OR [QuoteBasis]='PutCurrencyPerCallCurrency' OR [QuoteBasis]='Currency2PerCurrency1' OR [QuoteBasis]='Currency1PerCurrency2')
);


GO

CREATE TABLE [dbo].[FixingDates] (
    [PeriodMultiplier] BIGINT     NOT NULL,
    [Period]           CHAR (255) NOT NULL,
    CONSTRAINT [CK_FixingDates_Period] CHECK ([Period]='T' OR [Period]='Y' OR [Period]='M' OR [Period]='W' OR [Period]='D'),
    CONSTRAINT [CK_FixingDates_PeriodMultiplier] CHECK ([PeriodMultiplier]>=(1) AND [PeriodMultiplier]<=(999))
);


GO

CREATE TABLE [dbo].[Strike] (
    [FXRate]     DECIMAL (38) NOT NULL,
    [QuoteBasis] CHAR (255)   NOT NULL,
    CONSTRAINT [CK_Strike_QuoteBasis] CHECK ([QuoteBasis]='CallCurrencyPerPutCurrency' OR [QuoteBasis]='PutCurrencyPerCallCurrency' OR [QuoteBasis]='Currency2PerCurrency1' OR [QuoteBasis]='Currency1PerCurrency2')
);


GO

CREATE TABLE [dbo].[PaymentFrequency] (
    [PeriodMultiplier] BIGINT     NOT NULL,
    [Period]           CHAR (255) NOT NULL,
    CONSTRAINT [CK_PaymentFrequency_Period] CHECK ([Period]='T' OR [Period]='Y' OR [Period]='M' OR [Period]='W' OR [Period]='D'),
    CONSTRAINT [CK_PaymentFrequency_PeriodMultiplier] CHECK ([PeriodMultiplier]>=(1) AND [PeriodMultiplier]<=(999))
);


GO

CREATE TABLE [dbo].[USElectricityTradeDetails] (
    [Type]         CHAR (255)   NOT NULL,
    [Voltage]      DECIMAL (38) NOT NULL,
    [DeliveryType] CHAR (255)   NOT NULL,
    CONSTRAINT [CK_USElectricityTradeDetails_DeliveryType] CHECK ([DeliveryType]='unitFirm' OR [DeliveryType]='systemFirm' OR [DeliveryType]='nonFirm' OR [DeliveryType]='firm')
);


GO

CREATE TABLE [dbo].[Action] (
    [ActionType]   CHAR (255) NOT NULL,
    [ActionDetail] CHAR (255) NULL,
    CONSTRAINT [CK_Action_ActionType] CHECK ([ActionType]='O' OR [ActionType]='C' OR [ActionType]='E' OR [ActionType]='M' OR [ActionType]='N')
);


GO

CREATE TABLE [dbo].[USCoalProduct] (
    [BTUQualityAdjustments]   CHAR (255) NOT NULL,
    [SO2QualityAdjustments]   CHAR (255) NOT NULL,
    [QVA]                     CHAR (255) NOT NULL,
    [TransportationEquipment] CHAR (255) NOT NULL,
    CONSTRAINT [CK_USCoalProduct_QVA] CHECK ([QVA]='false' OR [QVA]='true'),
    CONSTRAINT [CK_USCoalProduct_TransportationEquipment] CHECK ([TransportationEquipment]='Railcar' OR [TransportationEquipment]='Truck' OR [TransportationEquipment]='Barge')
);


GO

CREATE TABLE [dbo].[ExchangedRate] (
    [Currency1]     CHAR (3)     NOT NULL,
    [Currency2]     CHAR (3)     NOT NULL,
    [QuoteBasis]    CHAR (255)   NOT NULL,
    [SpotRate]      DECIMAL (38) NOT NULL,
    [ForwardPoints] DECIMAL (38) NOT NULL,
    CONSTRAINT [CK_ExchangedRate_Currency1] CHECK (len([Currency1])>=(3)),
    CONSTRAINT [CK_ExchangedRate_Currency2] CHECK (len([Currency2])>=(3)),
    CONSTRAINT [CK_ExchangedRate_QuoteBasis] CHECK ([QuoteBasis]='CallCurrencyPerPutCurrency' OR [QuoteBasis]='PutCurrencyPerCallCurrency' OR [QuoteBasis]='Currency2PerCurrency1' OR [QuoteBasis]='Currency1PerCurrency2')
);


GO

CREATE TABLE [dbo].[FixedRateSchedule] (
    [InitialValue] DECIMAL (38) NOT NULL
);


GO

CREATE TABLE [dbo].[IRSTradeDetails] (
    [DocumentID]            CHAR (255) NOT NULL,
    [DocumentUsage]         CHAR (255) NOT NULL,
    [SenderID]              CHAR (255) NOT NULL,
    [ReceiverID]            CHAR (255) NOT NULL,
    [ReceiverRole]          CHAR (255) NOT NULL,
    [DocumentVersion]       BIGINT     NOT NULL,
    [TradeID]               CHAR (255) NULL,
    [TransactionType]       CHAR (255) NOT NULL,
    [IRSProduct]            CHAR (255) NOT NULL,
    [BuyerParty]            CHAR (255) NOT NULL,
    [SellerParty]           CHAR (255) NOT NULL,
    [Agreement]             CHAR (255) NOT NULL,
    [Currency]              CHAR (3)   NOT NULL,
    [TradeDate]             DATETIME   NOT NULL,
    [TradeTime]             DATETIME   NULL,
    [TraderName]            CHAR (255) NULL,
    [Rounding]              CHAR (255) NULL,
    [CommonPricing]         CHAR (255) NULL,
    [BusinessDayConvention] CHAR (255) NOT NULL,
    CONSTRAINT [CK_IRSTradeDetails_BusinessDayConvention] CHECK ([BusinessDayConvention]='NotApplicable' OR [BusinessDayConvention]='NONE' OR [BusinessDayConvention]='NEAREST' OR [BusinessDayConvention]='MODPRECEDING' OR [BusinessDayConvention]='PRECEDING' OR [BusinessDayConvention]='MODFOLLOWING' OR [BusinessDayConvention]='FRN' OR [BusinessDayConvention]='FOLLOWING'),
    CONSTRAINT [CK_IRSTradeDetails_CommonPricing] CHECK ([CommonPricing]='false' OR [CommonPricing]='true'),
    CONSTRAINT [CK_IRSTradeDetails_Currency] CHECK (len([Currency])>=(3)),
    CONSTRAINT [CK_IRSTradeDetails_DocumentUsage] CHECK ([DocumentUsage]='Live' OR [DocumentUsage]='Test'),
    CONSTRAINT [CK_IRSTradeDetails_DocumentVersion] CHECK ([DocumentVersion]>=(1) AND [DocumentVersion]<=(999)),
    CONSTRAINT [CK_IRSTradeDetails_IRSProduct] CHECK ([IRSProduct]='CrossCurrency' OR [IRSProduct]='Basis' OR [IRSProduct]='IRSwap'),
    CONSTRAINT [CK_IRSTradeDetails_ReceiverRole] CHECK ([ReceiverRole]='ECVNA' OR [ReceiverRole]='ClearingHouse' OR [ReceiverRole]='Broker' OR [ReceiverRole]='Trader'),
    CONSTRAINT [CK_IRSTradeDetails_Rounding] CHECK ([Rounding]='N_A' OR [Rounding]='9' OR [Rounding]='8' OR [Rounding]='7' OR [Rounding]='6' OR [Rounding]='5' OR [Rounding]='4' OR [Rounding]='3' OR [Rounding]='2' OR [Rounding]='1' OR [Rounding]='0'),
    CONSTRAINT [CK_IRSTradeDetails_TradeDate] CHECK ([TradeDate] like '____-__-__'),
    CONSTRAINT [CK_IRSTradeDetails_TransactionType] CHECK ([TransactionType]='OPT_FLT_SWP' OR [TransactionType]='OPT_FXD_FXD_SWP' OR [TransactionType]='OPT_FXD_SWP' OR [TransactionType]='FLT_SWP' OR [TransactionType]='FXD_FXD_SWP' OR [TransactionType]='FXD_SWP')
);


GO

CREATE TABLE [dbo].[PipelineCycle] (
    [Cycle] CHAR (255) NOT NULL
);


GO

CREATE TABLE [dbo].[BuyerDetails] (
    [BuyerParty]         CHAR (255)    NOT NULL,
    [DealID]             CHAR (255)    NULL,
    [ExecutionTimestamp] VARCHAR (255) NULL
);


GO

CREATE TABLE [dbo].[CallCurrencyAmount] (
    [Currency] CHAR (3)     NOT NULL,
    [Amount]   DECIMAL (38) NOT NULL,
    CONSTRAINT [CK_CallCurrencyAmount_Currency] CHECK (len([Currency])>=(3))
);


GO

CREATE TABLE [dbo].[SpreadInformation] (
    [SpreadPayer]        CHAR (255)   NOT NULL,
    [SpreadAmount]       DECIMAL (38) NOT NULL,
    [SpreadCurrencyUnit] CHAR (3)     NULL,
    CONSTRAINT [CK_SpreadInformation_SpreadCurrencyUnit] CHECK (len([SpreadCurrencyUnit])>=(3))
);


GO

CREATE TABLE [dbo].[PremiumUnit] (
    [Currency] CHAR (3)   NOT NULL,
    [Capacity] CHAR (255) NOT NULL,
    CONSTRAINT [CK_PremiumUnit_Capacity] CHECK ([Capacity]='IUN' OR [Capacity]='Vega' OR [Capacity]='M3' OR [Capacity]='in' OR [Capacity]='g' OR [Capacity]='BSH' OR [Capacity]='BF' OR [Capacity]='BCF' OR [Capacity]='Bag' OR [Capacity]='Fahrenheit' OR [Capacity]='Celsius' OR [Capacity]='CER' OR [Capacity]='LEC' OR [Capacity]='ROC' OR [Capacity]='WBU' OR [Capacity]='t' OR [Capacity]='st' OR [Capacity]='SBU' OR [Capacity]='ozt' OR [Capacity]='OBU' OR [Capacity]='MMBTU' OR [Capacity]='LB' OR [Capacity]='L' OR [Capacity]='kL' OR [Capacity]='KG' OR [Capacity]='Ingot' OR [Capacity]='hL' OR [Capacity]='DTH' OR [Capacity]='cwt' OR [Capacity]='CBU' OR [Capacity]='BTU' OR [Capacity]='EUA' OR [Capacity]='Day' OR [Capacity]='GJPerDay' OR [Capacity]='GW' OR [Capacity]='KW' OR [Capacity]='MW' OR [Capacity]='MMJPerDay' OR [Capacity]='100MJPerDay' OR [Capacity]='MJPerDay' OR [Capacity]='GWhPerDay' OR [Capacity]='KWhPerDay' OR [Capacity]='ThermPerDay' OR [Capacity]='GAL' OR [Capacity]='MT' OR [Capacity]='BBL' OR [Capacity]='GJ' OR [Capacity]='MMJ' OR [Capacity]='100MJ' OR [Capacity]='MJ' OR [Capacity]='GWh' OR [Capacity]='MWh' OR [Capacity]='KWh' OR [Capacity]='Therm'),
    CONSTRAINT [CK_PremiumUnit_Currency] CHECK (len([Currency])>=(3))
);


GO

CREATE TABLE [dbo].[MaximumNotionalAmount] (
    [Currency] CHAR (3)     NOT NULL,
    [Amount]   DECIMAL (38) NOT NULL,
    CONSTRAINT [CK_MaximumNotionalAmount_Currency] CHECK (len([Currency])>=(3))
);


GO

CREATE TABLE [dbo].[SellerDetails] (
    [SellerParty]        CHAR (255)    NOT NULL,
    [DealID]             CHAR (255)    NULL,
    [ExecutionTimestamp] VARCHAR (255) NULL
);


GO

CREATE TABLE [dbo].[PhysicalOilTradeDetails] (
    [Type]             CHAR (255) NOT NULL,
    [Grade]            CHAR (255) NOT NULL,
    [Incoterms]        CHAR (255) NOT NULL,
    [ImporterOfRecord] CHAR (255) NULL
);


GO

CREATE TABLE [dbo].[AmericanOptionDetails] (
    [CommencementDate]      DATETIME   NOT NULL,
    [BusinessDayConvention] CHAR (255) NOT NULL,
    CONSTRAINT [CK_AmericanOptionDetails_BusinessDayConvention] CHECK ([BusinessDayConvention]='NotApplicable' OR [BusinessDayConvention]='NONE' OR [BusinessDayConvention]='NEAREST' OR [BusinessDayConvention]='MODPRECEDING' OR [BusinessDayConvention]='PRECEDING' OR [BusinessDayConvention]='MODFOLLOWING' OR [BusinessDayConvention]='FRN' OR [BusinessDayConvention]='FOLLOWING'),
    CONSTRAINT [CK_AmericanOptionDetails_CommencementDate] CHECK ([CommencementDate] like '____-__-__')
);


GO

CREATE TABLE [dbo].[PercentageTolerance] (
    [PositiveLimit]        DECIMAL (38) NOT NULL,
    [NegativeLimit]        DECIMAL (38) NOT NULL,
    [ToleranceOptionOwner] CHAR (255)   NOT NULL
);


GO

CREATE TABLE [dbo].[ODRF] (
    [ReportMode]        CHAR (255)    NOT NULL,
    [CreationTimestamp] VARCHAR (255) NOT NULL,
    CONSTRAINT [CK_ODRF_ReportMode] CHECK ([ReportMode]='CmsReport' OR [ReportMode]='NoReport' OR [ReportMode]='Report')
);


GO

CREATE TABLE [dbo].[Reason] (
    [ReasonCode]  CHAR (255) NOT NULL,
    [ErrorSource] CHAR (255) NULL,
    [Originator]  CHAR (255) NULL,
    [ReasonText]  CHAR (512) NULL,
    CONSTRAINT [CK_Reason_ErrorSource] CHECK (len([ErrorSource])>=(1)),
    CONSTRAINT [CK_Reason_Originator] CHECK (len([Originator])>=(1)),
    CONSTRAINT [CK_Reason_ReasonCode] CHECK (len([ReasonCode])>=(1)),
    CONSTRAINT [CK_Reason_ReasonText] CHECK (len([ReasonText])>=(1))
);


GO

CREATE TABLE [dbo].[AdditionalRepository] (
    [Prefix] CHAR (80) NOT NULL,
    CONSTRAINT [CK_AdditionalRepository_Prefix] CHECK (len([Prefix])>=(1))
);


GO

CREATE TABLE [dbo].[ETDProductInformation] (
    [Underlying]                   CHAR (255)    NOT NULL,
    [NotionalCurrency1]            CHAR (3)      NOT NULL,
    [NotionalCurrency2]            CHAR (3)      NULL,
    [DeliverableCurrency]          CHAR (3)      NOT NULL,
    [PriceNotation]                CHAR (3)      NOT NULL,
    [PriceMultiplier]              DECIMAL (38)  NOT NULL,
    [TotalVolumeQuantityUnit]      CHAR (255)    NULL,
    [DeliveryType]                 CHAR (255)    NOT NULL,
    [EffectiveDate]                DATETIME      NOT NULL,
    [MaturityDate]                 DATETIME      NOT NULL,
    [CommodityBase]                CHAR (255)    NULL,
    [CommodityDetail]              CHAR (255)    NULL,
    [DeliveryPointOrZone]          CHAR (255)    NULL,
    [InterconnectionPoint]         CHAR (255)    NULL,
    [LoadType]                     CHAR (255)    NULL,
    [ContractCapacity]             DECIMAL (38)  NULL,
    [EnergyQuantityUnit]           CHAR (255)    NULL,
    [DeliveryStartDateAndTime]     VARCHAR (255) NULL,
    [DeliveryEndDateAndTime]       VARCHAR (255) NULL,
    [Currency2]                    CHAR (3)      NULL,
    [ExchangeRate1]                DECIMAL (38)  NULL,
    [ExchangeRateBasis]            CHAR (255)    NULL,
    [FixedRateOfLeg2]              DECIMAL (38)  NULL,
    [FixedRateDayCount]            CHAR (255)    NULL,
    [FixedLegPaymentFrequency]     CHAR (255)    NULL,
    [FloatingRatePaymentFrequency] CHAR (255)    NULL,
    [FloatingRateResetFrequency]   CHAR (255)    NULL,
    [FloatingRateOfLeg1]           CHAR (255)    NULL,
    [FloatingRateOfLeg2]           CHAR (255)    NULL,
    CONSTRAINT [CK_ETDProductInformation_CommodityBase] CHECK ([CommodityBase]='N/A' OR [CommodityBase]='EX' OR [CommodityBase]='EV' OR [CommodityBase]='IN' OR [CommodityBase]='ME' OR [CommodityBase]='FR' OR [CommodityBase]='EN' OR [CommodityBase]='AG'),
    CONSTRAINT [CK_ETDProductInformation_CommodityDetail] CHECK ([CommodityDetail]='N/A' OR [CommodityDetail]='EM' OR [CommodityDetail]='WE' OR [CommodityDetail]='NP' OR [CommodityDetail]='PR' OR [CommodityDetail]='IE' OR [CommodityDetail]='EL' OR [CommodityDetail]='CO' OR [CommodityDetail]='NG' OR [CommodityDetail]='OI' OR [CommodityDetail]='SO' OR [CommodityDetail]='FO' OR [CommodityDetail]='LI' OR [CommodityDetail]='DA' OR [CommodityDetail]='GO'),
    CONSTRAINT [CK_ETDProductInformation_Currency2] CHECK (len([Currency2])>=(3)),
    CONSTRAINT [CK_ETDProductInformation_DeliverableCurrency] CHECK (len([DeliverableCurrency])>=(3)),
    CONSTRAINT [CK_ETDProductInformation_DeliveryType] CHECK ([DeliveryType]='O' OR [DeliveryType]='P' OR [DeliveryType]='C'),
    CONSTRAINT [CK_ETDProductInformation_EffectiveDate] CHECK ([EffectiveDate] like '____-__-__'),
    CONSTRAINT [CK_ETDProductInformation_EnergyQuantityUnit] CHECK ([EnergyQuantityUnit]='IUN' OR [EnergyQuantityUnit]='Vega' OR [EnergyQuantityUnit]='M3' OR [EnergyQuantityUnit]='in' OR [EnergyQuantityUnit]='g' OR [EnergyQuantityUnit]='BSH' OR [EnergyQuantityUnit]='BF' OR [EnergyQuantityUnit]='BCF' OR [EnergyQuantityUnit]='Bag' OR [EnergyQuantityUnit]='Fahrenheit' OR [EnergyQuantityUnit]='Celsius' OR [EnergyQuantityUnit]='CER' OR [EnergyQuantityUnit]='LEC' OR [EnergyQuantityUnit]='ROC' OR [EnergyQuantityUnit]='WBU' OR [EnergyQuantityUnit]='t' OR [EnergyQuantityUnit]='st' OR [EnergyQuantityUnit]='SBU' OR [EnergyQuantityUnit]='ozt' OR [EnergyQuantityUnit]='OBU' OR [EnergyQuantityUnit]='MMBTU' OR [EnergyQuantityUnit]='LB' OR [EnergyQuantityUnit]='L' OR [EnergyQuantityUnit]='kL' OR [EnergyQuantityUnit]='KG' OR [EnergyQuantityUnit]='Ingot' OR [EnergyQuantityUnit]='hL' OR [EnergyQuantityUnit]='DTH' OR [EnergyQuantityUnit]='cwt' OR [EnergyQuantityUnit]='CBU' OR [EnergyQuantityUnit]='BTU' OR [EnergyQuantityUnit]='EUA' OR [EnergyQuantityUnit]='Day' OR [EnergyQuantityUnit]='GJPerDay' OR [EnergyQuantityUnit]='GW' OR [EnergyQuantityUnit]='KW' OR [EnergyQuantityUnit]='MW' OR [EnergyQuantityUnit]='MMJPerDay' OR [EnergyQuantityUnit]='100MJPerDay' OR [EnergyQuantityUnit]='MJPerDay' OR [EnergyQuantityUnit]='GWhPerDay' OR [EnergyQuantityUnit]='KWhPerDay' OR [EnergyQuantityUnit]='ThermPerDay' OR [EnergyQuantityUnit]='GAL' OR [EnergyQuantityUnit]='MT' OR [EnergyQuantityUnit]='BBL' OR [EnergyQuantityUnit]='GJ' OR [EnergyQuantityUnit]='MMJ' OR [EnergyQuantityUnit]='100MJ' OR [EnergyQuantityUnit]='MJ' OR [EnergyQuantityUnit]='GWh' OR [EnergyQuantityUnit]='MWh' OR [EnergyQuantityUnit]='KWh' OR [EnergyQuantityUnit]='Therm'),
    CONSTRAINT [CK_ETDProductInformation_ExchangeRateBasis] CHECK ([ExchangeRateBasis]='CallCurrencyPerPutCurrency' OR [ExchangeRateBasis]='PutCurrencyPerCallCurrency' OR [ExchangeRateBasis]='Currency2PerCurrency1' OR [ExchangeRateBasis]='Currency1PerCurrency2'),
    CONSTRAINT [CK_ETDProductInformation_LoadType] CHECK ([LoadType]='OT' OR [LoadType]='BH' OR [LoadType]='OP' OR [LoadType]='PL' OR [LoadType]='BL'),
    CONSTRAINT [CK_ETDProductInformation_MaturityDate] CHECK ([MaturityDate] like '____-__-__'),
    CONSTRAINT [CK_ETDProductInformation_NotionalCurrency1] CHECK (len([NotionalCurrency1])>=(3)),
    CONSTRAINT [CK_ETDProductInformation_NotionalCurrency2] CHECK (len([NotionalCurrency2])>=(3)),
    CONSTRAINT [CK_ETDProductInformation_PriceNotation] CHECK (len([PriceNotation])>=(3)),
    CONSTRAINT [CK_ETDProductInformation_TotalVolumeQuantityUnit] CHECK ([TotalVolumeQuantityUnit]='IUN' OR [TotalVolumeQuantityUnit]='Vega' OR [TotalVolumeQuantityUnit]='M3' OR [TotalVolumeQuantityUnit]='in' OR [TotalVolumeQuantityUnit]='g' OR [TotalVolumeQuantityUnit]='BSH' OR [TotalVolumeQuantityUnit]='BF' OR [TotalVolumeQuantityUnit]='BCF' OR [TotalVolumeQuantityUnit]='Bag' OR [TotalVolumeQuantityUnit]='Fahrenheit' OR [TotalVolumeQuantityUnit]='Celsius' OR [TotalVolumeQuantityUnit]='CER' OR [TotalVolumeQuantityUnit]='LEC' OR [TotalVolumeQuantityUnit]='ROC' OR [TotalVolumeQuantityUnit]='WBU' OR [TotalVolumeQuantityUnit]='t' OR [TotalVolumeQuantityUnit]='st' OR [TotalVolumeQuantityUnit]='SBU' OR [TotalVolumeQuantityUnit]='ozt' OR [TotalVolumeQuantityUnit]='OBU' OR [TotalVolumeQuantityUnit]='MMBTU' OR [TotalVolumeQuantityUnit]='LB' OR [TotalVolumeQuantityUnit]='L' OR [TotalVolumeQuantityUnit]='kL' OR [TotalVolumeQuantityUnit]='KG' OR [TotalVolumeQuantityUnit]='Ingot' OR [TotalVolumeQuantityUnit]='hL' OR [TotalVolumeQuantityUnit]='DTH' OR [TotalVolumeQuantityUnit]='cwt' OR [TotalVolumeQuantityUnit]='CBU' OR [TotalVolumeQuantityUnit]='BTU' OR [TotalVolumeQuantityUnit]='EUA' OR [TotalVolumeQuantityUnit]='Day' OR [TotalVolumeQuantityUnit]='GJPerDay' OR [TotalVolumeQuantityUnit]='GW' OR [TotalVolumeQuantityUnit]='KW' OR [TotalVolumeQuantityUnit]='MW' OR [TotalVolumeQuantityUnit]='MMJPerDay' OR [TotalVolumeQuantityUnit]='100MJPerDay' OR [TotalVolumeQuantityUnit]='MJPerDay' OR [TotalVolumeQuantityUnit]='GWhPerDay' OR [TotalVolumeQuantityUnit]='KWhPerDay' OR [TotalVolumeQuantityUnit]='ThermPerDay' OR [TotalVolumeQuantityUnit]='GAL' OR [TotalVolumeQuantityUnit]='MT' OR [TotalVolumeQuantityUnit]='BBL' OR [TotalVolumeQuantityUnit]='GJ' OR [TotalVolumeQuantityUnit]='MMJ' OR [TotalVolumeQuantityUnit]='100MJ' OR [TotalVolumeQuantityUnit]='MJ' OR [TotalVolumeQuantityUnit]='GWh' OR [TotalVolumeQuantityUnit]='MWh' OR [TotalVolumeQuantityUnit]='KWh' OR [TotalVolumeQuantityUnit]='Therm')
);


GO

CREATE TABLE [dbo].[ReportingResult] (
    [TradeID] CHAR (255) NOT NULL,
    [UTI]     CHAR (255) NULL
);


GO

CREATE TABLE [dbo].[SwapStream] (
    [PayerParty]    CHAR (255) NOT NULL,
    [ReceiverParty] CHAR (255) NOT NULL
);


GO

CREATE TABLE [dbo].[PriceUnit] (
    [CapacityUnit] CHAR (255) NOT NULL,
    CONSTRAINT [CK_PriceUnit_CapacityUnit] CHECK ([CapacityUnit]='IUN' OR [CapacityUnit]='Vega' OR [CapacityUnit]='M3' OR [CapacityUnit]='in' OR [CapacityUnit]='g' OR [CapacityUnit]='BSH' OR [CapacityUnit]='BF' OR [CapacityUnit]='BCF' OR [CapacityUnit]='Bag' OR [CapacityUnit]='Fahrenheit' OR [CapacityUnit]='Celsius' OR [CapacityUnit]='CER' OR [CapacityUnit]='LEC' OR [CapacityUnit]='ROC' OR [CapacityUnit]='WBU' OR [CapacityUnit]='t' OR [CapacityUnit]='st' OR [CapacityUnit]='SBU' OR [CapacityUnit]='ozt' OR [CapacityUnit]='OBU' OR [CapacityUnit]='MMBTU' OR [CapacityUnit]='LB' OR [CapacityUnit]='L' OR [CapacityUnit]='kL' OR [CapacityUnit]='KG' OR [CapacityUnit]='Ingot' OR [CapacityUnit]='hL' OR [CapacityUnit]='DTH' OR [CapacityUnit]='cwt' OR [CapacityUnit]='CBU' OR [CapacityUnit]='BTU' OR [CapacityUnit]='EUA' OR [CapacityUnit]='Day' OR [CapacityUnit]='GJPerDay' OR [CapacityUnit]='GW' OR [CapacityUnit]='KW' OR [CapacityUnit]='MW' OR [CapacityUnit]='MMJPerDay' OR [CapacityUnit]='100MJPerDay' OR [CapacityUnit]='MJPerDay' OR [CapacityUnit]='GWhPerDay' OR [CapacityUnit]='KWhPerDay' OR [CapacityUnit]='ThermPerDay' OR [CapacityUnit]='GAL' OR [CapacityUnit]='MT' OR [CapacityUnit]='BBL' OR [CapacityUnit]='GJ' OR [CapacityUnit]='MMJ' OR [CapacityUnit]='100MJ' OR [CapacityUnit]='MJ' OR [CapacityUnit]='GWh' OR [CapacityUnit]='MWh' OR [CapacityUnit]='KWh' OR [CapacityUnit]='Therm')
);


GO

CREATE TABLE [dbo].[ECVNA] (
    [BSCPartyID]          CHAR (255) NULL,
    [BuyerEnergyAccount]  CHAR (255) NULL,
    [SellerEnergyAccount] CHAR (255) NULL,
    [SellerID]            CHAR (255) NULL,
    [BuyerID]             CHAR (255) NULL,
    CONSTRAINT [CK_ECVNA_BuyerEnergyAccount] CHECK ([BuyerEnergyAccount]='Consumption' OR [BuyerEnergyAccount]='Production'),
    CONSTRAINT [CK_ECVNA_SellerEnergyAccount] CHECK ([SellerEnergyAccount]='Consumption' OR [SellerEnergyAccount]='Production')
);


GO

CREATE TABLE [dbo].[SettlementDates] (
    [DateOfSettlement] DATETIME NOT NULL,
    CONSTRAINT [CK_SettlementDates_DateOfSettlement] CHECK ([DateOfSettlement] like '____-__-__')
);


GO

CREATE TABLE [dbo].[CommodityReference] (
    [CommodityReferencePrice]  CHAR (255)   NOT NULL,
    [IndexCommodity]           CHAR (255)   NOT NULL,
    [IndexCurrencyUnit]        CHAR (3)     NOT NULL,
    [IndexCapacityUnit]        CHAR (255)   NOT NULL,
    [Factor]                   DECIMAL (38) NOT NULL,
    [Multiplier]               DECIMAL (38) NULL,
    [IndexCap]                 DECIMAL (38) NULL,
    [IndexFloor]               DECIMAL (38) NULL,
    [CRCapacityConversionRate] DECIMAL (38) NULL,
    CONSTRAINT [CK_CommodityReference_IndexCapacityUnit] CHECK ([IndexCapacityUnit]='IUN' OR [IndexCapacityUnit]='Vega' OR [IndexCapacityUnit]='M3' OR [IndexCapacityUnit]='in' OR [IndexCapacityUnit]='g' OR [IndexCapacityUnit]='BSH' OR [IndexCapacityUnit]='BF' OR [IndexCapacityUnit]='BCF' OR [IndexCapacityUnit]='Bag' OR [IndexCapacityUnit]='Fahrenheit' OR [IndexCapacityUnit]='Celsius' OR [IndexCapacityUnit]='CER' OR [IndexCapacityUnit]='LEC' OR [IndexCapacityUnit]='ROC' OR [IndexCapacityUnit]='WBU' OR [IndexCapacityUnit]='t' OR [IndexCapacityUnit]='st' OR [IndexCapacityUnit]='SBU' OR [IndexCapacityUnit]='ozt' OR [IndexCapacityUnit]='OBU' OR [IndexCapacityUnit]='MMBTU' OR [IndexCapacityUnit]='LB' OR [IndexCapacityUnit]='L' OR [IndexCapacityUnit]='kL' OR [IndexCapacityUnit]='KG' OR [IndexCapacityUnit]='Ingot' OR [IndexCapacityUnit]='hL' OR [IndexCapacityUnit]='DTH' OR [IndexCapacityUnit]='cwt' OR [IndexCapacityUnit]='CBU' OR [IndexCapacityUnit]='BTU' OR [IndexCapacityUnit]='EUA' OR [IndexCapacityUnit]='Day' OR [IndexCapacityUnit]='GJPerDay' OR [IndexCapacityUnit]='GW' OR [IndexCapacityUnit]='KW' OR [IndexCapacityUnit]='MW' OR [IndexCapacityUnit]='MMJPerDay' OR [IndexCapacityUnit]='100MJPerDay' OR [IndexCapacityUnit]='MJPerDay' OR [IndexCapacityUnit]='GWhPerDay' OR [IndexCapacityUnit]='KWhPerDay' OR [IndexCapacityUnit]='ThermPerDay' OR [IndexCapacityUnit]='GAL' OR [IndexCapacityUnit]='MT' OR [IndexCapacityUnit]='BBL' OR [IndexCapacityUnit]='GJ' OR [IndexCapacityUnit]='MMJ' OR [IndexCapacityUnit]='100MJ' OR [IndexCapacityUnit]='MJ' OR [IndexCapacityUnit]='GWh' OR [IndexCapacityUnit]='MWh' OR [IndexCapacityUnit]='KWh' OR [IndexCapacityUnit]='Therm'),
    CONSTRAINT [CK_CommodityReference_IndexCurrencyUnit] CHECK (len([IndexCurrencyUnit])>=(3))
);


GO

CREATE TABLE [dbo].[PaymentRelativeTo] (
    [PayRelativeTo] CHAR (255) NOT NULL,
    CONSTRAINT [CK_PaymentRelativeTo_PayRelativeTo] CHECK ([PayRelativeTo]='ValuationDate' OR [PayRelativeTo]='ResetDate' OR [PayRelativeTo]='LastPricingDate' OR [PayRelativeTo]='CalculationPeriodEndDate' OR [PayRelativeTo]='CalculationPeriodStartDate')
);


GO

CREATE TABLE [dbo].[Exercise] (
    [DeliveryStartDateTime] VARCHAR (255) NULL,
    [DeliveryEndDateTime]   VARCHAR (255) NULL,
    [ExerciseDateTime]      VARCHAR (255) NOT NULL,
    [ExerciseTimeZone]      SMALLINT      NULL,
    CONSTRAINT [CK_Exercise_DeliveryEndDateTime] CHECK ([DeliveryEndDateTime] like '20__-__-__T__:__:__'),
    CONSTRAINT [CK_Exercise_DeliveryStartDateTime] CHECK ([DeliveryStartDateTime] like '20__-__-__T__:__:__'),
    CONSTRAINT [CK_Exercise_ExerciseDateTime] CHECK ([ExerciseDateTime] like '20__-__-__T__:__:__'),
    CONSTRAINT [CK_Exercise_ExerciseTimeZone] CHECK ([ExerciseTimeZone]>=(-12) AND [ExerciseTimeZone]<=(12))
);


GO

CREATE TABLE [dbo].[FXOption] (
    [OptionWriter]          CHAR (255) NOT NULL,
    [OptionHolder]          CHAR (255) NOT NULL,
    [OptionType]            CHAR (255) NOT NULL,
    [EffectiveDate]         DATETIME   NOT NULL,
    [BusinessDayConvention] CHAR (255) NOT NULL,
    CONSTRAINT [CK_FXOption_BusinessDayConvention] CHECK ([BusinessDayConvention]='NotApplicable' OR [BusinessDayConvention]='NONE' OR [BusinessDayConvention]='NEAREST' OR [BusinessDayConvention]='MODPRECEDING' OR [BusinessDayConvention]='PRECEDING' OR [BusinessDayConvention]='MODFOLLOWING' OR [BusinessDayConvention]='FRN' OR [BusinessDayConvention]='FOLLOWING'),
    CONSTRAINT [CK_FXOption_EffectiveDate] CHECK ([EffectiveDate] like '____-__-__'),
    CONSTRAINT [CK_FXOption_OptionType] CHECK ([OptionType]='Floored_Put' OR [OptionType]='Capped_Call' OR [OptionType]='Put' OR [OptionType]='Call')
);


GO

CREATE TABLE [dbo].[TimeIntervalQuantity] (
    [DeliveryStartDateAndTime] VARCHAR (255) NOT NULL,
    [DeliveryEndDateAndTime]   VARCHAR (255) NOT NULL,
    [ContractCapacity]         DECIMAL (38)  NOT NULL,
    [Price]                    DECIMAL (38)  NULL,
    CONSTRAINT [CK_TimeIntervalQuantity_DeliveryEndDateAndTime] CHECK ([DeliveryEndDateAndTime] like '20__-__-__T__:__:__'),
    CONSTRAINT [CK_TimeIntervalQuantity_DeliveryStartDateAndTime] CHECK ([DeliveryStartDateAndTime] like '20__-__-__T__:__:__')
);


GO

CREATE TABLE [dbo].[DateAdjustments] (
    [BusinessDayConvention] CHAR (255) NOT NULL,
    CONSTRAINT [CK_DateAdjustments_BusinessDayConvention] CHECK ([BusinessDayConvention]='NotApplicable' OR [BusinessDayConvention]='NONE' OR [BusinessDayConvention]='NEAREST' OR [BusinessDayConvention]='MODPRECEDING' OR [BusinessDayConvention]='PRECEDING' OR [BusinessDayConvention]='MODFOLLOWING' OR [BusinessDayConvention]='FRN' OR [BusinessDayConvention]='FOLLOWING')
);


GO

CREATE TABLE [dbo].[ReportingDetails] (
    [ReportSubmitter]    CHAR (255)    NOT NULL,
    [ReportingTimestamp] VARCHAR (255) NOT NULL,
    [SdrAction]          CHAR (255)    NOT NULL,
    [MessageType]        CHAR (255)    NOT NULL,
    CONSTRAINT [CK_ReportingDetails_MessageType] CHECK ([MessageType]='Document' OR [MessageType]='None' OR [MessageType]='Verification' OR [MessageType]='Valuation' OR [MessageType]='RealTime-PET-Confirm' OR [MessageType]='PET-Confirm' OR [MessageType]='RealTime-PET' OR [MessageType]='Snapshot' OR [MessageType]='Confirm' OR [MessageType]='PET' OR [MessageType]='RealTime'),
    CONSTRAINT [CK_ReportingDetails_SdrAction] CHECK ([SdrAction]='Exit' OR [SdrAction]='Cancel' OR [SdrAction]='Modify' OR [SdrAction]='New')
);


GO

CREATE TABLE [dbo].[Collateral] (
    [PortfolioCode] BIGINT     NOT NULL,
    [Result]        CHAR (255) NOT NULL,
    CONSTRAINT [CK_Collateral_PortfolioCode] CHECK ([PortfolioCode]>=(0) AND [PortfolioCode]<=(9999999999.)),
    CONSTRAINT [CK_Collateral_Result] CHECK (len([Result])>=(1))
);


GO

CREATE TABLE [dbo].[FloatingRateCalculation] (
    [FloatingRateIndex] CHAR (255) NOT NULL
);


GO

CREATE TABLE [dbo].[ResetFrequency] (
    [PeriodMultiplier]     BIGINT     NOT NULL,
    [Period]               CHAR (255) NOT NULL,
    [WeeklyRollConvention] CHAR (255) NULL,
    CONSTRAINT [CK_ResetFrequency_Period] CHECK ([Period]='T' OR [Period]='Y' OR [Period]='M' OR [Period]='W' OR [Period]='D'),
    CONSTRAINT [CK_ResetFrequency_PeriodMultiplier] CHECK ([PeriodMultiplier]>=(1) AND [PeriodMultiplier]<=(999)),
    CONSTRAINT [CK_ResetFrequency_WeeklyRollConvention] CHECK ([WeeklyRollConvention]='TBILL' OR [WeeklyRollConvention]='SUN' OR [WeeklyRollConvention]='SAT' OR [WeeklyRollConvention]='FRI' OR [WeeklyRollConvention]='THU' OR [WeeklyRollConvention]='WED' OR [WeeklyRollConvention]='TUE' OR [WeeklyRollConvention]='MON')
);


GO

CREATE TABLE [dbo].[OptionDetails] (
    [OptionsType]           CHAR (255)    NOT NULL,
    [OptionWriter]          CHAR (255)    NOT NULL,
    [OptionHolder]          CHAR (255)    NOT NULL,
    [OptionStyle]           CHAR (255)    NOT NULL,
    [StrikePrice]           DECIMAL (38)  NOT NULL,
    [IndexStrikePriceStyle] CHAR (255)    NULL,
    [SecondStrikePrice]     DECIMAL (38)  NULL,
    [CappedPrice]           DECIMAL (38)  NULL,
    [FlooredPrice]          DECIMAL (38)  NULL,
    [OptionCurrency]        CHAR (3)      NULL,
    [PremiumRate]           DECIMAL (38)  NULL,
    [PremiumCurrency]       CHAR (3)      NOT NULL,
    [TotalPremiumValue]     DECIMAL (38)  NOT NULL,
    [PremiumPaymentDate]    DATETIME      NULL,
    [ExerciseDateTime]      VARCHAR (255) NULL,
    CONSTRAINT [CK_OptionDetails_ExerciseDateTime] CHECK ([ExerciseDateTime] like '20__-__-__T__:__:__'),
    CONSTRAINT [CK_OptionDetails_IndexStrikePriceStyle] CHECK ([IndexStrikePriceStyle]='Index_Dated' OR [IndexStrikePriceStyle]='Index_Following'),
    CONSTRAINT [CK_OptionDetails_OptionCurrency] CHECK (len([OptionCurrency])>=(3)),
    CONSTRAINT [CK_OptionDetails_OptionStyle] CHECK ([OptionStyle]='Bermudan' OR [OptionStyle]='Collar' OR [OptionStyle]='Floor' OR [OptionStyle]='Cap' OR [OptionStyle]='Asian' OR [OptionStyle]='European' OR [OptionStyle]='American'),
    CONSTRAINT [CK_OptionDetails_OptionsType] CHECK ([OptionsType]='Floored_Put' OR [OptionsType]='Capped_Call' OR [OptionsType]='Put' OR [OptionsType]='Call'),
    CONSTRAINT [CK_OptionDetails_PremiumCurrency] CHECK (len([PremiumCurrency])>=(3)),
    CONSTRAINT [CK_OptionDetails_PremiumPaymentDate] CHECK ([PremiumPaymentDate] like '____-__-__')
);


GO

CREATE TABLE [dbo].[ProcessInformation] (
    [ReportingRole]   CHAR (255) NOT NULL,
    [EMIRReportMode]  CHAR (255) NOT NULL,
    [REMITReportMode] CHAR (255) NOT NULL,
    [Position]        CHAR (255) NULL,
    [Backload]        CHAR (255) NOT NULL,
    CONSTRAINT [CK_ProcessInformation_Backload] CHECK ([Backload]='false' OR [Backload]='true'),
    CONSTRAINT [CK_ProcessInformation_EMIRReportMode] CHECK ([EMIRReportMode]='CmsReport' OR [EMIRReportMode]='NoReport' OR [EMIRReportMode]='Report'),
    CONSTRAINT [CK_ProcessInformation_Position] CHECK ([Position]='false' OR [Position]='true'),
    CONSTRAINT [CK_ProcessInformation_REMITReportMode] CHECK ([REMITReportMode]='CmsReport' OR [REMITReportMode]='NoReport' OR [REMITReportMode]='Report'),
    CONSTRAINT [CK_ProcessInformation_ReportingRole] CHECK ([ReportingRole]='Clearing_Agent' OR [ReportingRole]='Execution_Agent' OR [ReportingRole]='Internal_Agent' OR [ReportingRole]='CP_Agent' OR [ReportingRole]='Trader')
);


GO

CREATE TABLE [dbo].[ResetDates] (
    [ResetRelativeTo] CHAR (255) NOT NULL,
    CONSTRAINT [CK_ResetDates_ResetRelativeTo] CHECK ([ResetRelativeTo]='CalculationPeriodEndDate' OR [ResetRelativeTo]='CalculationPeriodStartDate')
);


GO

CREATE TABLE [dbo].[EffectiveDate] (
    [EffectiveDate] DATETIME NOT NULL,
    CONSTRAINT [CK_EffectiveDate_EffectiveDate] CHECK ([EffectiveDate] like '____-__-__')
);


GO

CREATE TABLE [dbo].[ETDTradeDetails] (
    [DocumentID]        CHAR (255)    NOT NULL,
    [DocumentUsage]     CHAR (255)    NOT NULL,
    [SenderID]          CHAR (255)    NOT NULL,
    [ReceiverID]        CHAR (255)    NOT NULL,
    [ReceiverRole]      CHAR (255)    NOT NULL,
    [DocumentVersion]   BIGINT        NOT NULL,
    [CreationTimestamp] VARCHAR (255) NOT NULL,
    [TransactionType]   CHAR (255)    NOT NULL,
    [PrimaryAssetClass] CHAR (255)    NOT NULL,
    CONSTRAINT [CK_ETDTradeDetails_DocumentUsage] CHECK ([DocumentUsage]='Live' OR [DocumentUsage]='Test'),
    CONSTRAINT [CK_ETDTradeDetails_DocumentVersion] CHECK ([DocumentVersion]>=(1) AND [DocumentVersion]<=(999)),
    CONSTRAINT [CK_ETDTradeDetails_PrimaryAssetClass] CHECK ([PrimaryAssetClass]='InterestRateODRF' OR [PrimaryAssetClass]='Credit' OR [PrimaryAssetClass]='InterestRate' OR [PrimaryAssetClass]='EquityBond' OR [PrimaryAssetClass]='Equity' OR [PrimaryAssetClass]='ForeignExchange' OR [PrimaryAssetClass]='Commodity'),
    CONSTRAINT [CK_ETDTradeDetails_ReceiverRole] CHECK ([ReceiverRole]='Trader' OR [ReceiverRole]='Exchange' OR [ReceiverRole]='ClearingHouse' OR [ReceiverRole]='ClearingBroker' OR [ReceiverRole]='Broker'),
    CONSTRAINT [CK_ETDTradeDetails_TransactionType] CHECK ([TransactionType]='SPT' OR [TransactionType]='OPT_FUT' OR [TransactionType]='FUT' OR [TransactionType]='OPT_FIN_INX' OR [TransactionType]='OPT_FLT_SWP' OR [TransactionType]='OPT_FXD_FXD_SWP' OR [TransactionType]='OPT_FXD_SWP' OR [TransactionType]='FLT_SWP' OR [TransactionType]='FXD_FXD_SWP' OR [TransactionType]='FXD_SWP' OR [TransactionType]='OPT_PHYS_INX' OR [TransactionType]='PHYS_INX' OR [TransactionType]='OPT' OR [TransactionType]='FOR')
);


GO

CREATE TABLE [dbo].[PremiumPayment] (
    [PremiumPaymentDate]    DATETIME     NOT NULL,
    [BusinessDayConvention] CHAR (255)   NOT NULL,
    [PremiumCurrency]       CHAR (3)     NOT NULL,
    [PremiumPaymentValue]   DECIMAL (38) NOT NULL,
    CONSTRAINT [CK_PremiumPayment_BusinessDayConvention] CHECK ([BusinessDayConvention]='NotApplicable' OR [BusinessDayConvention]='NONE' OR [BusinessDayConvention]='NEAREST' OR [BusinessDayConvention]='MODPRECEDING' OR [BusinessDayConvention]='PRECEDING' OR [BusinessDayConvention]='MODFOLLOWING' OR [BusinessDayConvention]='FRN' OR [BusinessDayConvention]='FOLLOWING'),
    CONSTRAINT [CK_PremiumPayment_PremiumCurrency] CHECK (len([PremiumCurrency])>=(3)),
    CONSTRAINT [CK_PremiumPayment_PremiumPaymentDate] CHECK ([PremiumPaymentDate] like '____-__-__')
);


GO

CREATE TABLE [dbo].[ValuationFeedback] (
    [ValuationID]          CHAR (255) NOT NULL,
    [UniqueSwapIdentifier] CHAR (255) NULL,
    [State]                CHAR (35)  NOT NULL,
    CONSTRAINT [CK_ValuationFeedback_State] CHECK (len([State])>=(1))
);


GO

CREATE TABLE [dbo].[DoddFrankResult] (
    [ErrAction]            CHAR (35)  NOT NULL,
    [ErrResult]            CHAR (35)  NOT NULL,
    [TradeID]              CHAR (255) NOT NULL,
    [ReportingParty]       CHAR (255) NULL,
    [UniqueSwapIdentifier] CHAR (255) NULL,
    CONSTRAINT [CK_DoddFrankResult_ErrAction] CHECK (len([ErrAction])>=(1)),
    CONSTRAINT [CK_DoddFrankResult_ErrResult] CHECK (len([ErrResult])>=(1))
);


GO

CREATE TABLE [dbo].[AccountAndChargeInformation] (
    [SellerEnergyAccountIdentification] CHAR (255) NOT NULL,
    [BuyerEnergyAccountIdentification]  CHAR (255) NOT NULL,
    [NotificationAgent]                 CHAR (255) NULL,
    [TransmissionChargeIdentification]  CHAR (255) NOT NULL
);


GO

CREATE TABLE [dbo].[PhysicalBullionTradeDetails] (
    [Type]                 CHAR (255) NOT NULL,
    [BullionType]          CHAR (255) NOT NULL,
    [SettlementDisruption] CHAR (255) NOT NULL,
    CONSTRAINT [CK_PhysicalBullionTradeDetails_BullionType] CHECK ([BullionType]='RhodiumSponge' OR [BullionType]='Silver' OR [BullionType]='Platinum' OR [BullionType]='Palladium' OR [BullionType]='Gold'),
    CONSTRAINT [CK_PhysicalBullionTradeDetails_SettlementDisruption] CHECK ([SettlementDisruption]='Cancellation_And_Payment' OR [SettlementDisruption]='Negociation')
);


GO

CREATE TABLE [dbo].[FXTradeDetails] (
    [DocumentID]      CHAR (255) NOT NULL,
    [DocumentUsage]   CHAR (255) NOT NULL,
    [SenderID]        CHAR (255) NOT NULL,
    [ReceiverID]      CHAR (255) NOT NULL,
    [ReceiverRole]    CHAR (255) NOT NULL,
    [DocumentVersion] BIGINT     NOT NULL,
    [TradeID]         CHAR (255) NULL,
    [TransactionType] CHAR (255) NOT NULL,
    [FXProduct]       CHAR (255) NOT NULL,
    [BuyerParty]      CHAR (255) NOT NULL,
    [SellerParty]     CHAR (255) NOT NULL,
    [Agreement]       CHAR (255) NOT NULL,
    [TradeDate]       DATETIME   NOT NULL,
    [TradeTime]       DATETIME   NULL,
    [TraderName]      CHAR (255) NULL,
    CONSTRAINT [CK_FXTradeDetails_DocumentUsage] CHECK ([DocumentUsage]='Live' OR [DocumentUsage]='Test'),
    CONSTRAINT [CK_FXTradeDetails_DocumentVersion] CHECK ([DocumentVersion]>=(1) AND [DocumentVersion]<=(999)),
    CONSTRAINT [CK_FXTradeDetails_FXProduct] CHECK ([FXProduct]='FXOption_Non_Deliverable' OR [FXProduct]='FXForward_Non_Delivererable' OR [FXProduct]='FXOption' OR [FXProduct]='FXSwap' OR [FXProduct]='FXForward' OR [FXProduct]='FXSpot'),
    CONSTRAINT [CK_FXTradeDetails_ReceiverRole] CHECK ([ReceiverRole]='ECVNA' OR [ReceiverRole]='ClearingHouse' OR [ReceiverRole]='Broker' OR [ReceiverRole]='Trader'),
    CONSTRAINT [CK_FXTradeDetails_TradeDate] CHECK ([TradeDate] like '____-__-__'),
    CONSTRAINT [CK_FXTradeDetails_TransactionType] CHECK ([TransactionType]='SPT' OR [TransactionType]='OPT_FXD_FXD_SWP' OR [TransactionType]='FXD_FXD_SWP' OR [TransactionType]='OPT' OR [TransactionType]='FOR')
);


GO

CREATE TABLE [dbo].[DoddFrank] (
    [ReportMode]                        CHAR (255)    NOT NULL,
    [CreationTimestamp]                 VARCHAR (255) NOT NULL,
    [TradeID]                           CHAR (255)    NOT NULL,
    [ReportingParty]                    CHAR (255)    NULL,
    [UniqueSwapIdentifier]              CHAR (255)    NULL,
    [DFTradeEvent]                      CHAR (255)    NOT NULL,
    [PrimaryAssetClass]                 CHAR (255)    NOT NULL,
    [SecondaryAssetClass]               CHAR (255)    NOT NULL,
    [SuppressPriceDissemination]        CHAR (255)    NULL,
    [AllocationIndicator]               CHAR (255)    NULL,
    [ExecutionVenue]                    CHAR (255)    NOT NULL,
    [ExecutionVenuePrefix]              CHAR (80)     NULL,
    [ExecutionVenuePartyID]             CHAR (200)    NULL,
    [ExecutionTimeStamp]                VARCHAR (255) NOT NULL,
    [ProductIDPrefix]                   CHAR (255)    NOT NULL,
    [ProductIDValue]                    CHAR (200)    NOT NULL,
    [ClearingExceptionParty]            CHAR (200)    NULL,
    [HedgingExemption]                  CHAR (255)    NULL,
    [Nonstandard]                       BIT           NOT NULL,
    [EmbeddedOption]                    BIT           NOT NULL,
    [Collateralized]                    CHAR (255)    NOT NULL,
    [Verification]                      CHAR (255)    NOT NULL,
    [AsOfDate]                          DATETIME      NULL,
    [AsOfTime]                          DATETIME      NULL,
    [LargeTradeSize]                    BIT           NULL,
    [TransfereeParty]                   CHAR (255)    NULL,
    [TransferorParty]                   CHAR (255)    NULL,
    [RemainingParty]                    CHAR (255)    NULL,
    [ReportingJurisdiction]             CHAR (255)    NULL,
    [SenderReportingObligation]         CHAR (255)    NULL,
    [SenderVoluntarySubmissionTrade]    CHAR (255)    NULL,
    [IntentToClear]                     BIT           NOT NULL,
    [IntentToMatch]                     BIT           NOT NULL,
    [IntentToReport]                    BIT           NOT NULL,
    [ExerciseOfSwaption]                BIT           NULL,
    [ResultOfCompression]               BIT           NULL,
    [AdditionalRepositoryTradeID]       CHAR (42)     NULL,
    [LinkID]                            CHAR (255)    NULL,
    [Party2Parties]                     CHAR (200)    NULL,
    [PostTradeEventExecutionDateTime]   VARCHAR (255) NULL,
    [PostTradeEventChangeNumberOfUnits] DECIMAL (38)  NULL,
    [PostTradeEventFee]                 DECIMAL (38)  NULL,
    [PostTradeEventFeeCurrency]         CHAR (3)      NULL,
    [TradeParty1Role]                   CHAR (20)     NULL,
    [TradeParty1USPersonIndicator]      CHAR (2)      NULL,
    [TradeParty1FinancialEntityStatus]  CHAR (70)     NULL,
    [TradeParty2Role]                   CHAR (20)     NULL,
    [TradeParty2USPersonIndicator]      CHAR (2)      NULL,
    [TradeParty2FinancialEntityStatus]  CHAR (70)     NULL,
    [RealTimeNotionalAmount]            DECIMAL (38)  NULL,
    [RealTimeNotionalAmountCurrency]    CHAR (3)      NULL,
    CONSTRAINT [CK_DoddFrank_AdditionalRepositoryTradeID] CHECK (len([AdditionalRepositoryTradeID])>=(1)),
    CONSTRAINT [CK_DoddFrank_AllocationIndicator] CHECK ([AllocationIndicator]='PostAllocation' OR [AllocationIndicator]='PreAllocation'),
    CONSTRAINT [CK_DoddFrank_AsOfDate] CHECK ([AsOfDate] like '____-__-__'),
    CONSTRAINT [CK_DoddFrank_ClearingExceptionParty] CHECK (len([ClearingExceptionParty])>=(1)),
    CONSTRAINT [CK_DoddFrank_Collateralized] CHECK ([Collateralized]='Fully' OR [Collateralized]='OneWay' OR [Collateralized]='Partially' OR [Collateralized]='Uncollateralized'),
    CONSTRAINT [CK_DoddFrank_DFTradeEvent] CHECK ([DFTradeEvent]='PartialTermination' OR [DFTradeEvent]='FullTermination' OR [DFTradeEvent]='NovationFee' OR [DFTradeEvent]='Novation' OR [DFTradeEvent]='NewTrade' OR [DFTradeEvent]='Increase' OR [DFTradeEvent]='Exercise' OR [DFTradeEvent]='Modify' OR [DFTradeEvent]='NoneconomicAmendment' OR [DFTradeEvent]='EconomicAmendment' OR [DFTradeEvent]='Compression' OR [DFTradeEvent]='Backload' OR [DFTradeEvent]='Allocation'),
    CONSTRAINT [CK_DoddFrank_ExecutionVenue] CHECK ([ExecutionVenue]='LEI' OR [ExecutionVenue]='Off-Facility' OR [ExecutionVenue]='DCM' OR [ExecutionVenue]='SEF'),
    CONSTRAINT [CK_DoddFrank_ExecutionVenuePartyID] CHECK (len([ExecutionVenuePartyID])>=(1)),
    CONSTRAINT [CK_DoddFrank_ExecutionVenuePrefix] CHECK (len([ExecutionVenuePrefix])>=(1)),
    CONSTRAINT [CK_DoddFrank_HedgingExemption] CHECK ([HedgingExemption]='Anticipated_Service' OR [HedgingExemption]='Anticipated_Royalty' OR [HedgingExemption]='Anticipated_Merchandising' OR [HedgingExemption]='Anticipated_Requirement' OR [HedgingExemption]='Anticipated_Production' OR [HedgingExemption]='Pass-Through_Swap' OR [HedgingExemption]='Bona_Fide_Hedge'),
    CONSTRAINT [CK_DoddFrank_LinkID] CHECK (len([LinkID])>=(1)),
    CONSTRAINT [CK_DoddFrank_Party2Parties] CHECK (len([Party2Parties])>=(1)),
    CONSTRAINT [CK_DoddFrank_PostTradeEventFeeCurrency] CHECK (len([PostTradeEventFeeCurrency])>=(3)),
    CONSTRAINT [CK_DoddFrank_PrimaryAssetClass] CHECK ([PrimaryAssetClass]='InterestRateODRF' OR [PrimaryAssetClass]='Credit' OR [PrimaryAssetClass]='InterestRate' OR [PrimaryAssetClass]='EquityBond' OR [PrimaryAssetClass]='Equity' OR [PrimaryAssetClass]='ForeignExchange' OR [PrimaryAssetClass]='Commodity'),
    CONSTRAINT [CK_DoddFrank_ProductIDPrefix] CHECK ([ProductIDPrefix]='GTR' OR [ProductIDPrefix]='ISDA' OR [ProductIDPrefix]='UPI'),
    CONSTRAINT [CK_DoddFrank_ProductIDValue] CHECK (len([ProductIDValue])>=(1)),
    CONSTRAINT [CK_DoddFrank_RealTimeNotionalAmountCurrency] CHECK (len([RealTimeNotionalAmountCurrency])>=(3)),
    CONSTRAINT [CK_DoddFrank_ReportingJurisdiction] CHECK ([ReportingJurisdiction]='Other' OR [ReportingJurisdiction]='ESMA' OR [ReportingJurisdiction]='ODRF' OR [ReportingJurisdiction]='HKMA' OR [ReportingJurisdiction]='CFTC' OR [ReportingJurisdiction]='SEC'),
    CONSTRAINT [CK_DoddFrank_ReportMode] CHECK ([ReportMode]='CmsReport' OR [ReportMode]='NoReport' OR [ReportMode]='Report'),
    CONSTRAINT [CK_DoddFrank_SecondaryAssetClass] CHECK ([SecondaryAssetClass]='InterestRateODRF' OR [SecondaryAssetClass]='Credit' OR [SecondaryAssetClass]='InterestRate' OR [SecondaryAssetClass]='EquityBond' OR [SecondaryAssetClass]='Equity' OR [SecondaryAssetClass]='ForeignExchange' OR [SecondaryAssetClass]='Commodity'),
    CONSTRAINT [CK_DoddFrank_SenderReportingObligation] CHECK ([SenderReportingObligation]='Other' OR [SenderReportingObligation]='ESMA' OR [SenderReportingObligation]='ODRF' OR [SenderReportingObligation]='HKMA' OR [SenderReportingObligation]='CFTC' OR [SenderReportingObligation]='SEC'),
    CONSTRAINT [CK_DoddFrank_SenderVoluntarySubmissionTrade] CHECK ([SenderVoluntarySubmissionTrade]='Other' OR [SenderVoluntarySubmissionTrade]='ESMA' OR [SenderVoluntarySubmissionTrade]='ODRF' OR [SenderVoluntarySubmissionTrade]='HKMA' OR [SenderVoluntarySubmissionTrade]='CFTC' OR [SenderVoluntarySubmissionTrade]='SEC'),
    CONSTRAINT [CK_DoddFrank_SuppressPriceDissemination] CHECK ([SuppressPriceDissemination]='None' OR [SuppressPriceDissemination]='RT'),
    CONSTRAINT [CK_DoddFrank_TradeID] CHECK (len([TradeID])>=(1)),
    CONSTRAINT [CK_DoddFrank_TradeParty1FinancialEntityStatus] CHECK (len([TradeParty1FinancialEntityStatus])>=(1)),
    CONSTRAINT [CK_DoddFrank_TradeParty1Role] CHECK (len([TradeParty1Role])>=(1)),
    CONSTRAINT [CK_DoddFrank_TradeParty1USPersonIndicator] CHECK (len([TradeParty1USPersonIndicator])>=(2)),
    CONSTRAINT [CK_DoddFrank_TradeParty2FinancialEntityStatus] CHECK (len([TradeParty2FinancialEntityStatus])>=(1)),
    CONSTRAINT [CK_DoddFrank_TradeParty2Role] CHECK (len([TradeParty2Role])>=(1)),
    CONSTRAINT [CK_DoddFrank_TradeParty2USPersonIndicator] CHECK (len([TradeParty2USPersonIndicator])>=(2)),
    CONSTRAINT [CK_DoddFrank_Verification] CHECK ([Verification]='Unverified' OR [Verification]='Non-Electronic' OR [Verification]='Electronic')
);


GO

CREATE TABLE [dbo].[FloatPriceInformation] (
    [FloatPricePayer] CHAR (255) NOT NULL
);


GO

CREATE TABLE [dbo].[ContingencyDetails] (
    [Contingency]     CHAR (255) NOT NULL,
    [ContingentParty] CHAR (255) NOT NULL
);


GO

CREATE TABLE [dbo].[Broker] (
    [BrokerID]       CHAR (255)   NOT NULL,
    [TotalFee]       DECIMAL (38) NOT NULL,
    [FeeCurrency]    CHAR (3)     NOT NULL,
    [Sleeve]         CHAR (255)   NULL,
    [Voice]          CHAR (255)   NULL,
    [Initiate]       CHAR (255)   NULL,
    [Spread]         CHAR (255)   NULL,
    [BrokerSpreadID] CHAR (255)   NULL,
    [BrokerTradeID]  CHAR (255)   NULL,
    CONSTRAINT [CK_Broker_FeeCurrency] CHECK (len([FeeCurrency])>=(3)),
    CONSTRAINT [CK_Broker_Initiate] CHECK ([Initiate]='false' OR [Initiate]='true'),
    CONSTRAINT [CK_Broker_Sleeve] CHECK ([Sleeve]='false' OR [Sleeve]='true'),
    CONSTRAINT [CK_Broker_Spread] CHECK ([Spread]='false' OR [Spread]='true'),
    CONSTRAINT [CK_Broker_Voice] CHECK ([Voice]='false' OR [Voice]='true')
);


GO

CREATE TABLE [dbo].[EProduct] (
    [EProductID1]      CHAR (255) NOT NULL,
    [Product1CodeType] CHAR (255) NULL,
    [EProductID2]      CHAR (255) NOT NULL,
    CONSTRAINT [CK_EProduct_EProductID1] CHECK ([EProductID1]='OT' OR [EProductID1]='IR' OR [EProductID1]='EQ' OR [EProductID1]='CU' OR [EProductID1]='CR' OR [EProductID1]='CO'),
    CONSTRAINT [CK_EProduct_EProductID2] CHECK ([EProductID2]='OT' OR [EProductID2]='SW' OR [EProductID2]='OP' OR [EProductID2]='FW' OR [EProductID2]='FU' OR [EProductID2]='FR' OR [EProductID2]='CD'),
    CONSTRAINT [CK_EProduct_Product1CodeType] CHECK ([Product1CodeType]='EMIR_Taxonomy')
);


GO

CREATE TABLE [dbo].[MinimumNotionalAmount] (
    [Currency] CHAR (3)     NOT NULL,
    [Amount]   DECIMAL (38) NOT NULL,
    CONSTRAINT [CK_MinimumNotionalAmount_Currency] CHECK (len([Currency])>=(3))
);


GO

CREATE TABLE [dbo].[FXSpotRateSource] (
    [PrimaryRateSource]     CHAR (255)    NOT NULL,
    [RateSourcePage]        CHAR (255)    NULL,
    [RateSourcePageHeading] CHAR (255)    NULL,
    [FixingTime]            VARCHAR (255) NULL
);


GO

CREATE TABLE [dbo].[Currency] (
    [UseFractionUnit] BIT CONSTRAINT [CK_Currency_UseFractionUnit_default] DEFAULT ((0)) NULL
);


GO

CREATE TABLE [dbo].[GenericConfirmation] (
    [DocumentID]          CHAR (255)   NOT NULL,
    [DocumentUsage]       CHAR (255)   NOT NULL,
    [SenderID]            CHAR (255)   NOT NULL,
    [ReceiverID]          CHAR (255)   NOT NULL,
    [ReceiverRole]        CHAR (255)   NOT NULL,
    [DocumentVersion]     BIGINT       NOT NULL,
    [TransactionType]     CHAR (255)   NOT NULL,
    [Commodity]           CHAR (255)   NULL,
    [ProductName]         CHAR (255)   NOT NULL,
    [BuyerParty]          CHAR (255)   NOT NULL,
    [SellerParty]         CHAR (255)   NOT NULL,
    [TradeDate]           DATETIME     NOT NULL,
    [TradeTime]           DATETIME     NULL,
    [TraderName]          CHAR (255)   NULL,
    [EffectiveDate]       DATETIME     NULL,
    [TerminationDate]     DATETIME     NULL,
    [TotalVolume]         DECIMAL (38) NULL,
    [TotalVolumeUnit]     CHAR (255)   NOT NULL,
    [TotalAmountCurrency] CHAR (3)     NOT NULL,
    [SchemaVersion]       CHAR (255)   NOT NULL,
    [SchemaRelease]       CHAR (255)   NOT NULL,
    CONSTRAINT [CK_GenericConfirmation_DocumentUsage] CHECK ([DocumentUsage]='Live' OR [DocumentUsage]='Test'),
    CONSTRAINT [CK_GenericConfirmation_DocumentVersion] CHECK ([DocumentVersion]>=(1) AND [DocumentVersion]<=(999)),
    CONSTRAINT [CK_GenericConfirmation_EffectiveDate] CHECK ([EffectiveDate] like '____-__-__'),
    CONSTRAINT [CK_GenericConfirmation_ReceiverRole] CHECK ([ReceiverRole]='ECVNA' OR [ReceiverRole]='ClearingHouse' OR [ReceiverRole]='Broker' OR [ReceiverRole]='Trader'),
    CONSTRAINT [CK_GenericConfirmation_TerminationDate] CHECK ([TerminationDate] like '____-__-__'),
    CONSTRAINT [CK_GenericConfirmation_TotalAmountCurrency] CHECK (len([TotalAmountCurrency])>=(3)),
    CONSTRAINT [CK_GenericConfirmation_TotalVolumeUnit] CHECK ([TotalVolumeUnit]='IUN' OR [TotalVolumeUnit]='Vega' OR [TotalVolumeUnit]='M3' OR [TotalVolumeUnit]='in' OR [TotalVolumeUnit]='g' OR [TotalVolumeUnit]='BSH' OR [TotalVolumeUnit]='BF' OR [TotalVolumeUnit]='BCF' OR [TotalVolumeUnit]='Bag' OR [TotalVolumeUnit]='Fahrenheit' OR [TotalVolumeUnit]='Celsius' OR [TotalVolumeUnit]='CER' OR [TotalVolumeUnit]='LEC' OR [TotalVolumeUnit]='ROC' OR [TotalVolumeUnit]='WBU' OR [TotalVolumeUnit]='t' OR [TotalVolumeUnit]='st' OR [TotalVolumeUnit]='SBU' OR [TotalVolumeUnit]='ozt' OR [TotalVolumeUnit]='OBU' OR [TotalVolumeUnit]='MMBTU' OR [TotalVolumeUnit]='LB' OR [TotalVolumeUnit]='L' OR [TotalVolumeUnit]='kL' OR [TotalVolumeUnit]='KG' OR [TotalVolumeUnit]='Ingot' OR [TotalVolumeUnit]='hL' OR [TotalVolumeUnit]='DTH' OR [TotalVolumeUnit]='cwt' OR [TotalVolumeUnit]='CBU' OR [TotalVolumeUnit]='BTU' OR [TotalVolumeUnit]='EUA' OR [TotalVolumeUnit]='Day' OR [TotalVolumeUnit]='GJPerDay' OR [TotalVolumeUnit]='GW' OR [TotalVolumeUnit]='KW' OR [TotalVolumeUnit]='MW' OR [TotalVolumeUnit]='MMJPerDay' OR [TotalVolumeUnit]='100MJPerDay' OR [TotalVolumeUnit]='MJPerDay' OR [TotalVolumeUnit]='GWhPerDay' OR [TotalVolumeUnit]='KWhPerDay' OR [TotalVolumeUnit]='ThermPerDay' OR [TotalVolumeUnit]='GAL' OR [TotalVolumeUnit]='MT' OR [TotalVolumeUnit]='BBL' OR [TotalVolumeUnit]='GJ' OR [TotalVolumeUnit]='MMJ' OR [TotalVolumeUnit]='100MJ' OR [TotalVolumeUnit]='MJ' OR [TotalVolumeUnit]='GWh' OR [TotalVolumeUnit]='MWh' OR [TotalVolumeUnit]='KWh' OR [TotalVolumeUnit]='Therm'),
    CONSTRAINT [CK_GenericConfirmation_TradeDate] CHECK ([TradeDate] like '____-__-__'),
    CONSTRAINT [CK_GenericConfirmation_TransactionType] CHECK ([TransactionType]='OPT_VV_FLT_SWP' OR [TransactionType]='OPT_FIN_INX' OR [TransactionType]='OPT_FLT_SWP' OR [TransactionType]='OPT_FXD_SWP' OR [TransactionType]='VV_FLT_SWP' OR [TransactionType]='FLT_SWP' OR [TransactionType]='FXD_SWP' OR [TransactionType]='OPT_PHYS_INX' OR [TransactionType]='PHYS_INX' OR [TransactionType]='OPT' OR [TransactionType]='FOR')
);


GO

CREATE TABLE [dbo].[ProductIdentifier] (
    [Taxonomy]         CHAR (255) NULL,
    [TaxonomyCodeType] CHAR (255) NULL,
    CONSTRAINT [CK_ProductIdentifier_Taxonomy] CHECK ([Taxonomy]='E' OR [Taxonomy]='I' OR [Taxonomy]='U'),
    CONSTRAINT [CK_ProductIdentifier_TaxonomyCodeType] CHECK ([TaxonomyCodeType]='EMIR_Taxonomy')
);


GO

CREATE TABLE [dbo].[FXExerciseSchedule] (
    [OptionStyle]       CHAR (255)    NOT NULL,
    [ExpiryDate]        DATETIME      NOT NULL,
    [ExpiryDateAndTime] VARCHAR (255) NOT NULL,
    [CutName]           CHAR (255)    NULL,
    [ValueDate]         DATETIME      NOT NULL,
    CONSTRAINT [CK_FXExerciseSchedule_ExpiryDate] CHECK ([ExpiryDate] like '____-__-__'),
    CONSTRAINT [CK_FXExerciseSchedule_OptionStyle] CHECK ([OptionStyle]='Bermudan' OR [OptionStyle]='Collar' OR [OptionStyle]='Floor' OR [OptionStyle]='Cap' OR [OptionStyle]='Asian' OR [OptionStyle]='European' OR [OptionStyle]='American'),
    CONSTRAINT [CK_FXExerciseSchedule_ValueDate] CHECK ([ValueDate] like '____-__-__')
);


GO

CREATE TABLE [dbo].[PhysicalMetalTradeDetails] (
    [Type]                 CHAR (255)   NOT NULL,
    [MetalMaterial]        CHAR (255)   NOT NULL,
    [MetalGrade]           CHAR (255)   NOT NULL,
    [SettlementDisruption] CHAR (255)   NOT NULL,
    [Incoterms]            CHAR (255)   NOT NULL,
    [TitleConditions]      CHAR (255)   NOT NULL,
    [Tolerance]            DECIMAL (38) NOT NULL,
    CONSTRAINT [CK_PhysicalMetalTradeDetails_MetalMaterial] CHECK ([MetalMaterial]='Gold' OR [MetalMaterial]='Zinc' OR [MetalMaterial]='Uranium' OR [MetalMaterial]='Tin' OR [MetalMaterial]='Steel' OR [MetalMaterial]='Nickel' OR [MetalMaterial]='NASAA' OR [MetalMaterial]='Molybdenum' OR [MetalMaterial]='Lead' OR [MetalMaterial]='Copper' OR [MetalMaterial]='Cobalt' OR [MetalMaterial]='Aluminum-Primary'),
    CONSTRAINT [CK_PhysicalMetalTradeDetails_SettlementDisruption] CHECK ([SettlementDisruption]='Cancellation_And_Payment' OR [SettlementDisruption]='Negociation')
);


GO

CREATE TABLE [dbo].[PipelineDetails] (
    [PipelineName]       CHAR (255) NOT NULL,
    [EntryPoint]         CHAR (255) NOT NULL,
    [DeliverableByBarge] CHAR (255) NOT NULL,
    [Incoterms]          CHAR (255) NOT NULL,
    CONSTRAINT [CK_PipelineDetails_DeliverableByBarge] CHECK ([DeliverableByBarge]='false' OR [DeliverableByBarge]='true')
);


GO

CREATE TABLE [dbo].[Calculation] (
    [DayCountFraction] CHAR (255) NOT NULL
);


GO

CREATE TABLE [dbo].[Product] (
    [CRAProductCode] CHAR (100) NOT NULL,
    CONSTRAINT [CK_Product_CRAProductCode] CHECK (len([CRAProductCode])>=(1))
);


GO

CREATE TABLE [dbo].[FormulaProductInformation] (
    [Underlying]        CHAR (255) NOT NULL,
    [CommodityBase]     CHAR (255) NOT NULL,
    [CommodityDetail]   CHAR (255) NOT NULL,
    [IndexCurrencyUnit] CHAR (3)   NULL,
    CONSTRAINT [CK_FormulaProductInformation_CommodityBase] CHECK ([CommodityBase]='N/A' OR [CommodityBase]='EX' OR [CommodityBase]='EV' OR [CommodityBase]='IN' OR [CommodityBase]='ME' OR [CommodityBase]='FR' OR [CommodityBase]='EN' OR [CommodityBase]='AG'),
    CONSTRAINT [CK_FormulaProductInformation_CommodityDetail] CHECK ([CommodityDetail]='N/A' OR [CommodityDetail]='EM' OR [CommodityDetail]='WE' OR [CommodityDetail]='NP' OR [CommodityDetail]='PR' OR [CommodityDetail]='IE' OR [CommodityDetail]='EL' OR [CommodityDetail]='CO' OR [CommodityDetail]='NG' OR [CommodityDetail]='OI' OR [CommodityDetail]='SO' OR [CommodityDetail]='FO' OR [CommodityDetail]='LI' OR [CommodityDetail]='DA' OR [CommodityDetail]='GO'),
    CONSTRAINT [CK_FormulaProductInformation_IndexCurrencyUnit] CHECK (len([IndexCurrencyUnit])>=(3))
);


GO

CREATE TABLE [dbo].[HubCodificationInformation] (
    [BuyerHubCode]  CHAR (255) NULL,
    [SellerHubCode] CHAR (255) NULL
);


GO

CREATE TABLE [dbo].[MTFDetails] (
    [MTFID]              CHAR (255)    NOT NULL,
    [ExecutionTimestamp] VARCHAR (255) NOT NULL
);


GO

CREATE TABLE [dbo].[ReportingOnBehalfOf] (
    [ActingOnBehalfOf] CHAR (255) NOT NULL,
    [AgentID]          CHAR (255) NOT NULL,
    CONSTRAINT [CK_ReportingOnBehalfOf_ActingOnBehalfOf] CHECK ([ActingOnBehalfOf]='Buyer_And_Seller' OR [ActingOnBehalfOf]='Seller' OR [ActingOnBehalfOf]='Buyer')
);


GO

CREATE TABLE [dbo].[EUATradeDetails] (
    [Price]                 DECIMAL (38) NULL,
    [EmissionsDeliveryDate] DATETIME     NULL,
    CONSTRAINT [CK_EUATradeDetails_EmissionsDeliveryDate] CHECK ([EmissionsDeliveryDate] like '____-__-__')
);


GO

CREATE TABLE [dbo].[Valuation] (
    [UTI]    CHAR (255) NOT NULL,
    [Result] CHAR (255) NOT NULL,
    CONSTRAINT [CK_Valuation_Result] CHECK (len([Result])>=(1))
);


GO

CREATE TABLE [dbo].[ElectingPartyDetails] (
    [ElectingParty] CHAR (255) NOT NULL
);


GO

CREATE TABLE [dbo].[PutCurrencyAmount] (
    [Currency] CHAR (3)     NOT NULL,
    [Amount]   DECIMAL (38) NOT NULL,
    CONSTRAINT [CK_PutCurrencyAmount_Currency] CHECK (len([Currency])>=(3))
);


GO

CREATE TABLE [dbo].[Confirmation] (
    [ServiceMode] CHAR (255) NOT NULL,
    CONSTRAINT [CK_Confirmation_ServiceMode] CHECK ([ServiceMode]='NO' OR [ServiceMode]='YES')
);


GO

CREATE TABLE [dbo].[EURegulatoryDetails] (
    [UTI]                            CHAR (255)    NULL,
    [Repository]                     CHAR (255)    NULL,
    [ReportingTimestamp]             VARCHAR (255) NULL,
    [CPIDCodeType]                   CHAR (255)    NULL,
    [TraderUserName]                 CHAR (255)    NULL,
    [OtherTraderUserName]            CHAR (255)    NULL,
    [CPFinancialNature]              CHAR (255)    NULL,
    [CPSector]                       CHAR (255)    NULL,
    [BeneficiaryID]                  CHAR (255)    NULL,
    [TradingCapacity]                CHAR (255)    NULL,
    [OtherCPEEA]                     CHAR (255)    NULL,
    [CommercialOrTreasury]           CHAR (255)    NULL,
    [ClearingThreshold]              CHAR (255)    NULL,
    [Collateralisation]              CHAR (255)    NULL,
    [CollateralisationPortfolio]     CHAR (255)    NULL,
    [CollateralisationPortfolioCode] BIGINT        NULL,
    [UnderlyingCodeType]             CHAR (255)    NULL,
    [LinkedTransactionID]            CHAR (255)    NULL,
    [TradeID]                        CHAR (255)    NOT NULL,
    [VenueOfExecution]               CHAR (255)    NOT NULL,
    [Compression]                    CHAR (255)    NULL,
    [UpFrontPayment]                 DECIMAL (38)  NULL,
    [ExecutionTimestamp]             VARCHAR (255) NULL,
    [MasterAgreementVersion]         CHAR (255)    NULL,
    [ClearingObligation]             CHAR (255)    NULL,
    [Intragroup]                     CHAR (255)    NOT NULL,
    [LoadType]                       CHAR (255)    NULL,
    [ConfirmationMeans]              CHAR (255)    NOT NULL,
    [ConfirmationTimestamp]          VARCHAR (255) NULL,
    [NotionalAmount]                 DECIMAL (38)  NULL,
    CONSTRAINT [CK_EURegulatoryDetails_ClearingObligation] CHECK ([ClearingObligation]='false' OR [ClearingObligation]='true'),
    CONSTRAINT [CK_EURegulatoryDetails_ClearingThreshold] CHECK ([ClearingThreshold]='false' OR [ClearingThreshold]='true'),
    CONSTRAINT [CK_EURegulatoryDetails_Collateralisation] CHECK ([Collateralisation]='FC' OR [Collateralisation]='OC' OR [Collateralisation]='PC' OR [Collateralisation]='U'),
    CONSTRAINT [CK_EURegulatoryDetails_CollateralisationPortfolio] CHECK ([CollateralisationPortfolio]='false' OR [CollateralisationPortfolio]='true'),
    CONSTRAINT [CK_EURegulatoryDetails_CollateralisationPortfolioCode] CHECK ([CollateralisationPortfolioCode]>=(0) AND [CollateralisationPortfolioCode]<=(9999999999.)),
    CONSTRAINT [CK_EURegulatoryDetails_CommercialOrTreasury] CHECK ([CommercialOrTreasury]='false' OR [CommercialOrTreasury]='true'),
    CONSTRAINT [CK_EURegulatoryDetails_Compression] CHECK ([Compression]='false' OR [Compression]='true'),
    CONSTRAINT [CK_EURegulatoryDetails_ConfirmationMeans] CHECK ([ConfirmationMeans]='E' OR [ConfirmationMeans]='N' OR [ConfirmationMeans]='Y'),
    CONSTRAINT [CK_EURegulatoryDetails_CPFinancialNature] CHECK ([CPFinancialNature]='N' OR [CPFinancialNature]='F'),
    CONSTRAINT [CK_EURegulatoryDetails_CPIDCodeType] CHECK ([CPIDCodeType]='Client_Code' OR [CPIDCodeType]='BIC' OR [CPIDCodeType]='MIC' OR [CPIDCodeType]='LEI'),
    CONSTRAINT [CK_EURegulatoryDetails_CPSector] CHECK ([CPSector]='U' OR [CPSector]='R' OR [CPSector]='O' OR [CPSector]='L' OR [CPSector]='I' OR [CPSector]='F' OR [CPSector]='C' OR [CPSector]='A'),
    CONSTRAINT [CK_EURegulatoryDetails_Intragroup] CHECK ([Intragroup]='false' OR [Intragroup]='true'),
    CONSTRAINT [CK_EURegulatoryDetails_LoadType] CHECK ([LoadType]='OT' OR [LoadType]='BH' OR [LoadType]='OP' OR [LoadType]='PL' OR [LoadType]='BL'),
    CONSTRAINT [CK_EURegulatoryDetails_OtherCPEEA] CHECK ([OtherCPEEA]='false' OR [OtherCPEEA]='true'),
    CONSTRAINT [CK_EURegulatoryDetails_TradingCapacity] CHECK ([TradingCapacity]='P' OR [TradingCapacity]='A')
);


GO

CREATE TABLE [dbo].[AbsoluteTolerance] (
    [PositiveLimit]        DECIMAL (38) NOT NULL,
    [NegativeLimit]        DECIMAL (38) NOT NULL,
    [ToleranceUoM]         CHAR (255)   NOT NULL,
    [ToleranceOptionOwner] CHAR (255)   NOT NULL,
    CONSTRAINT [CK_AbsoluteTolerance_ToleranceUoM] CHECK ([ToleranceUoM]='IUN' OR [ToleranceUoM]='Vega' OR [ToleranceUoM]='M3' OR [ToleranceUoM]='in' OR [ToleranceUoM]='g' OR [ToleranceUoM]='BSH' OR [ToleranceUoM]='BF' OR [ToleranceUoM]='BCF' OR [ToleranceUoM]='Bag' OR [ToleranceUoM]='Fahrenheit' OR [ToleranceUoM]='Celsius' OR [ToleranceUoM]='CER' OR [ToleranceUoM]='LEC' OR [ToleranceUoM]='ROC' OR [ToleranceUoM]='WBU' OR [ToleranceUoM]='t' OR [ToleranceUoM]='st' OR [ToleranceUoM]='SBU' OR [ToleranceUoM]='ozt' OR [ToleranceUoM]='OBU' OR [ToleranceUoM]='MMBTU' OR [ToleranceUoM]='LB' OR [ToleranceUoM]='L' OR [ToleranceUoM]='kL' OR [ToleranceUoM]='KG' OR [ToleranceUoM]='Ingot' OR [ToleranceUoM]='hL' OR [ToleranceUoM]='DTH' OR [ToleranceUoM]='cwt' OR [ToleranceUoM]='CBU' OR [ToleranceUoM]='BTU' OR [ToleranceUoM]='EUA' OR [ToleranceUoM]='Day' OR [ToleranceUoM]='GJPerDay' OR [ToleranceUoM]='GW' OR [ToleranceUoM]='KW' OR [ToleranceUoM]='MW' OR [ToleranceUoM]='MMJPerDay' OR [ToleranceUoM]='100MJPerDay' OR [ToleranceUoM]='MJPerDay' OR [ToleranceUoM]='GWhPerDay' OR [ToleranceUoM]='KWhPerDay' OR [ToleranceUoM]='ThermPerDay' OR [ToleranceUoM]='GAL' OR [ToleranceUoM]='MT' OR [ToleranceUoM]='BBL' OR [ToleranceUoM]='GJ' OR [ToleranceUoM]='MMJ' OR [ToleranceUoM]='100MJ' OR [ToleranceUoM]='MJ' OR [ToleranceUoM]='GWh' OR [ToleranceUoM]='MWh' OR [ToleranceUoM]='KWh' OR [ToleranceUoM]='Therm')
);


GO

CREATE TABLE [dbo].[TradeConfirmation] (
    [DocumentID]          CHAR (255)   NOT NULL,
    [DocumentUsage]       CHAR (255)   NOT NULL,
    [SenderID]            CHAR (255)   NOT NULL,
    [ReceiverID]          CHAR (255)   NOT NULL,
    [ReceiverRole]        CHAR (255)   NOT NULL,
    [DocumentVersion]     BIGINT       NOT NULL,
    [Market]              CHAR (2)     NULL,
    [Commodity]           CHAR (255)   NULL,
    [TransactionType]     CHAR (255)   NOT NULL,
    [DeliveryPointArea]   CHAR (255)   NULL,
    [BuyerParty]          CHAR (255)   NOT NULL,
    [SellerParty]         CHAR (255)   NOT NULL,
    [LoadType]            CHAR (255)   NULL,
    [Agreement]           CHAR (255)   NOT NULL,
    [TotalVolume]         DECIMAL (38) NULL,
    [TotalVolumeUnit]     CHAR (255)   NOT NULL,
    [TotalAmountCurrency] CHAR (3)     NOT NULL,
    [TradeDate]           DATETIME     NOT NULL,
    [CapacityUnit]        CHAR (255)   NULL,
    [TotalContractValue]  DECIMAL (38) NOT NULL,
    [Rounding]            CHAR (255)   NULL,
    [CommonPricing]       CHAR (255)   NULL,
    [OrderNumber]         CHAR (255)   NULL,
    [EffectiveDate]       DATETIME     NULL,
    [TerminationDate]     DATETIME     NULL,
    [TradeTime]           DATETIME     NULL,
    [TraderName]          CHAR (255)   NULL,
    [SchemaVersion]       CHAR (255)   NOT NULL,
    [SchemaRelease]       CHAR (255)   NOT NULL,
    CONSTRAINT [CK_TradeConfirmation_CapacityUnit] CHECK ([CapacityUnit]='IUN' OR [CapacityUnit]='Vega' OR [CapacityUnit]='M3' OR [CapacityUnit]='in' OR [CapacityUnit]='g' OR [CapacityUnit]='BSH' OR [CapacityUnit]='BF' OR [CapacityUnit]='BCF' OR [CapacityUnit]='Bag' OR [CapacityUnit]='Fahrenheit' OR [CapacityUnit]='Celsius' OR [CapacityUnit]='CER' OR [CapacityUnit]='LEC' OR [CapacityUnit]='ROC' OR [CapacityUnit]='WBU' OR [CapacityUnit]='t' OR [CapacityUnit]='st' OR [CapacityUnit]='SBU' OR [CapacityUnit]='ozt' OR [CapacityUnit]='OBU' OR [CapacityUnit]='MMBTU' OR [CapacityUnit]='LB' OR [CapacityUnit]='L' OR [CapacityUnit]='kL' OR [CapacityUnit]='KG' OR [CapacityUnit]='Ingot' OR [CapacityUnit]='hL' OR [CapacityUnit]='DTH' OR [CapacityUnit]='cwt' OR [CapacityUnit]='CBU' OR [CapacityUnit]='BTU' OR [CapacityUnit]='EUA' OR [CapacityUnit]='Day' OR [CapacityUnit]='GJPerDay' OR [CapacityUnit]='GW' OR [CapacityUnit]='KW' OR [CapacityUnit]='MW' OR [CapacityUnit]='MMJPerDay' OR [CapacityUnit]='100MJPerDay' OR [CapacityUnit]='MJPerDay' OR [CapacityUnit]='GWhPerDay' OR [CapacityUnit]='KWhPerDay' OR [CapacityUnit]='ThermPerDay' OR [CapacityUnit]='GAL' OR [CapacityUnit]='MT' OR [CapacityUnit]='BBL' OR [CapacityUnit]='GJ' OR [CapacityUnit]='MMJ' OR [CapacityUnit]='100MJ' OR [CapacityUnit]='MJ' OR [CapacityUnit]='GWh' OR [CapacityUnit]='MWh' OR [CapacityUnit]='KWh' OR [CapacityUnit]='Therm'),
    CONSTRAINT [CK_TradeConfirmation_Commodity] CHECK ([Commodity]='CER' OR [Commodity]='EUAPhase_3' OR [Commodity]='EUAPhase_2' OR [Commodity]='EUAPhase_1' OR [Commodity]='ReactivePower' OR [Commodity]='Paper' OR [Commodity]='Agriculturals' OR [Commodity]='Metal' OR [Commodity]='Bullion' OR [Commodity]='Coal' OR [Commodity]='Oil' OR [Commodity]='Gas' OR [Commodity]='Power'),
    CONSTRAINT [CK_TradeConfirmation_CommonPricing] CHECK ([CommonPricing]='false' OR [CommonPricing]='true'),
    CONSTRAINT [CK_TradeConfirmation_DocumentUsage] CHECK ([DocumentUsage]='Live' OR [DocumentUsage]='Test'),
    CONSTRAINT [CK_TradeConfirmation_DocumentVersion] CHECK ([DocumentVersion]>=(1) AND [DocumentVersion]<=(999)),
    CONSTRAINT [CK_TradeConfirmation_EffectiveDate] CHECK ([EffectiveDate] like '____-__-__'),
    CONSTRAINT [CK_TradeConfirmation_LoadType] CHECK ([LoadType]='Custom' OR [LoadType]='OffPeak' OR [LoadType]='Peak' OR [LoadType]='Base'),
    CONSTRAINT [CK_TradeConfirmation_Market] CHECK (len([Market])>=(2)),
    CONSTRAINT [CK_TradeConfirmation_ReceiverRole] CHECK ([ReceiverRole]='ECVNA' OR [ReceiverRole]='ClearingHouse' OR [ReceiverRole]='Broker' OR [ReceiverRole]='Trader'),
    CONSTRAINT [CK_TradeConfirmation_Rounding] CHECK ([Rounding]='N_A' OR [Rounding]='9' OR [Rounding]='8' OR [Rounding]='7' OR [Rounding]='6' OR [Rounding]='5' OR [Rounding]='4' OR [Rounding]='3' OR [Rounding]='2' OR [Rounding]='1' OR [Rounding]='0'),
    CONSTRAINT [CK_TradeConfirmation_TerminationDate] CHECK ([TerminationDate] like '____-__-__'),
    CONSTRAINT [CK_TradeConfirmation_TotalAmountCurrency] CHECK (len([TotalAmountCurrency])>=(3)),
    CONSTRAINT [CK_TradeConfirmation_TotalVolumeUnit] CHECK ([TotalVolumeUnit]='IUN' OR [TotalVolumeUnit]='Vega' OR [TotalVolumeUnit]='M3' OR [TotalVolumeUnit]='in' OR [TotalVolumeUnit]='g' OR [TotalVolumeUnit]='BSH' OR [TotalVolumeUnit]='BF' OR [TotalVolumeUnit]='BCF' OR [TotalVolumeUnit]='Bag' OR [TotalVolumeUnit]='Fahrenheit' OR [TotalVolumeUnit]='Celsius' OR [TotalVolumeUnit]='CER' OR [TotalVolumeUnit]='LEC' OR [TotalVolumeUnit]='ROC' OR [TotalVolumeUnit]='WBU' OR [TotalVolumeUnit]='t' OR [TotalVolumeUnit]='st' OR [TotalVolumeUnit]='SBU' OR [TotalVolumeUnit]='ozt' OR [TotalVolumeUnit]='OBU' OR [TotalVolumeUnit]='MMBTU' OR [TotalVolumeUnit]='LB' OR [TotalVolumeUnit]='L' OR [TotalVolumeUnit]='kL' OR [TotalVolumeUnit]='KG' OR [TotalVolumeUnit]='Ingot' OR [TotalVolumeUnit]='hL' OR [TotalVolumeUnit]='DTH' OR [TotalVolumeUnit]='cwt' OR [TotalVolumeUnit]='CBU' OR [TotalVolumeUnit]='BTU' OR [TotalVolumeUnit]='EUA' OR [TotalVolumeUnit]='Day' OR [TotalVolumeUnit]='GJPerDay' OR [TotalVolumeUnit]='GW' OR [TotalVolumeUnit]='KW' OR [TotalVolumeUnit]='MW' OR [TotalVolumeUnit]='MMJPerDay' OR [TotalVolumeUnit]='100MJPerDay' OR [TotalVolumeUnit]='MJPerDay' OR [TotalVolumeUnit]='GWhPerDay' OR [TotalVolumeUnit]='KWhPerDay' OR [TotalVolumeUnit]='ThermPerDay' OR [TotalVolumeUnit]='GAL' OR [TotalVolumeUnit]='MT' OR [TotalVolumeUnit]='BBL' OR [TotalVolumeUnit]='GJ' OR [TotalVolumeUnit]='MMJ' OR [TotalVolumeUnit]='100MJ' OR [TotalVolumeUnit]='MJ' OR [TotalVolumeUnit]='GWh' OR [TotalVolumeUnit]='MWh' OR [TotalVolumeUnit]='KWh' OR [TotalVolumeUnit]='Therm'),
    CONSTRAINT [CK_TradeConfirmation_TradeDate] CHECK ([TradeDate] like '____-__-__'),
    CONSTRAINT [CK_TradeConfirmation_TransactionType] CHECK ([TransactionType]='OPT_VV_FLT_SWP' OR [TransactionType]='OPT_FIN_INX' OR [TransactionType]='OPT_FLT_SWP' OR [TransactionType]='OPT_FXD_SWP' OR [TransactionType]='VV_FLT_SWP' OR [TransactionType]='FLT_SWP' OR [TransactionType]='FXD_SWP' OR [TransactionType]='OPT_PHYS_INX' OR [TransactionType]='PHYS_INX' OR [TransactionType]='OPT' OR [TransactionType]='FOR')
);


GO

CREATE TABLE [dbo].[CalculationPeriod] (
    [StartDate]          DATETIME     NOT NULL,
    [EndDate]            DATETIME     NOT NULL,
    [CPNotionalQuantity] DECIMAL (38) NULL,
    CONSTRAINT [CK_CalculationPeriod_EndDate] CHECK ([EndDate] like '____-__-__'),
    CONSTRAINT [CK_CalculationPeriod_StartDate] CHECK ([StartDate] like '____-__-__')
);


GO

CREATE TABLE [dbo].[PriorUniqueSwapIdentifiers] (
    [PriorUniqueSwapIdentifier] CHAR (255) NOT NULL
);


GO

CREATE TABLE [dbo].[DeliveryPeriod] (
    [DeliveryPeriodStartDate]        DATETIME     NOT NULL,
    [DeliveryPeriodEndDate]          DATETIME     NOT NULL,
    [DeliveryPeriodNotionalQuantity] DECIMAL (38) NOT NULL,
    [FixedPrice]                     DECIMAL (38) NULL,
    CONSTRAINT [CK_DeliveryPeriod_DeliveryPeriodEndDate] CHECK ([DeliveryPeriodEndDate] like '____-__-__'),
    CONSTRAINT [CK_DeliveryPeriod_DeliveryPeriodStartDate] CHECK ([DeliveryPeriodStartDate] like '____-__-__')
);


GO

CREATE TABLE [dbo].[PhysicalCoalTradeDetails] (
    [RSS]       CHAR (255) NOT NULL,
    [Origin]    CHAR (255) NOT NULL,
    [Incoterms] CHAR (255) NOT NULL
);


GO

CREATE TABLE [dbo].[Attachment] (
    [MimeType]            CHAR (255)   NOT NULL,
    [Filename]            CHAR (255)   NOT NULL,
    [DocumentDescription] CHAR (255)   NOT NULL,
    [AttachmentData]      BINARY (255) NOT NULL,
    CONSTRAINT [CK_Attachment_DocumentDescription] CHECK ([DocumentDescription]='HISTORICALEXPIRED' OR [DocumentDescription]='HISTORICAL' OR [DocumentDescription]='CREDIT_ANNEX' OR [DocumentDescription]='DRAFT' OR [DocumentDescription]='CONFIRM'),
    CONSTRAINT [CK_Attachment_MimeType] CHECK ([MimeType]='application/x-gzip' OR [MimeType]='application/zip' OR [MimeType]='application/xml' OR [MimeType]='text/xml' OR [MimeType]='text/plain' OR [MimeType]='text/csv' OR [MimeType]='image/x-tiff' OR [MimeType]='image/tiff' OR [MimeType]='image/png' OR [MimeType]='image/pjpeg' OR [MimeType]='image/jpeg' OR [MimeType]='image/gif' OR [MimeType]='application/vnd.ms-powerpoint' OR [MimeType]='application/x-mspowerpoint' OR [MimeType]='application/powerpoint' OR [MimeType]='application/mspowerpoint' OR [MimeType]='application/x-excel' OR [MimeType]='application/x-msexcel' OR [MimeType]='application/vnd.ms-excel' OR [MimeType]='application/excel' OR [MimeType]='application/msword' OR [MimeType]='application/pdf')
);


GO

CREATE TABLE [dbo].[CMSResult] (
    [Action]  CHAR (35)  NOT NULL,
    [Result]  CHAR (35)  NOT NULL,
    [TradeID] CHAR (255) NULL,
    [UTI]     CHAR (255) NULL,
    CONSTRAINT [CK_CMSResult_Action] CHECK (len([Action])>=(1)),
    CONSTRAINT [CK_CMSResult_Result] CHECK (len([Result])>=(1))
);


GO

CREATE TABLE [dbo].[ExchangedCurrency] (
    [PayerParty]      CHAR (255)   NOT NULL,
    [ReceiverParty]   CHAR (255)   NOT NULL,
    [PaymentCurrency] CHAR (3)     NOT NULL,
    [PaymentAmount]   DECIMAL (38) NOT NULL,
    [ValueDate]       DATETIME     NOT NULL,
    CONSTRAINT [CK_ExchangedCurrency_PaymentCurrency] CHECK (len([PaymentCurrency])>=(3)),
    CONSTRAINT [CK_ExchangedCurrency_ValueDate] CHECK ([ValueDate] like '____-__-__')
);


GO

CREATE TABLE [dbo].[CashSettlement] (
    [SettlementCurrency]    CHAR (3)   NOT NULL,
    [SettlementDate]        DATETIME   NOT NULL,
    [BusinessDayConvention] CHAR (255) NOT NULL,
    CONSTRAINT [CK_CashSettlement_BusinessDayConvention] CHECK ([BusinessDayConvention]='NotApplicable' OR [BusinessDayConvention]='NONE' OR [BusinessDayConvention]='NEAREST' OR [BusinessDayConvention]='MODPRECEDING' OR [BusinessDayConvention]='PRECEDING' OR [BusinessDayConvention]='MODFOLLOWING' OR [BusinessDayConvention]='FRN' OR [BusinessDayConvention]='FOLLOWING'),
    CONSTRAINT [CK_CashSettlement_SettlementCurrency] CHECK (len([SettlementCurrency])>=(3)),
    CONSTRAINT [CK_CashSettlement_SettlementDate] CHECK ([SettlementDate] like '____-__-__')
);


GO

CREATE TABLE [dbo].[FXInformation] (
    [FXReference] CHAR (255)   NOT NULL,
    [FXMethod]    CHAR (255)   NOT NULL,
    [FXRate]      DECIMAL (38) NOT NULL,
    CONSTRAINT [CK_FXInformation_FXMethod] CHECK ([FXMethod]='Mixed' OR [FXMethod]='Monthly' OR [FXMethod]='Daily')
);


GO

CREATE TABLE [dbo].[ReportingCounterpartyDetails] (
    [CPName]     CHAR (255) NOT NULL,
    [CPDomicile] CHAR (255) NOT NULL
);


GO

CREATE TABLE [dbo].[ODRFResult] (
    [Action]               CHAR (35)  NOT NULL,
    [Result]               CHAR (35)  NOT NULL,
    [ErrAction]            CHAR (35)  NOT NULL,
    [ErrResult]            CHAR (35)  NOT NULL,
    [TradeID]              CHAR (255) NOT NULL,
    [ReportingParty]       CHAR (255) NULL,
    [UniqueSwapIdentifier] CHAR (255) NULL,
    CONSTRAINT [CK_ODRFResult_Action] CHECK (len([Action])>=(1)),
    CONSTRAINT [CK_ODRFResult_ErrAction] CHECK (len([ErrAction])>=(1)),
    CONSTRAINT [CK_ODRFResult_ErrResult] CHECK (len([ErrResult])>=(1)),
    CONSTRAINT [CK_ODRFResult_Result] CHECK (len([Result])>=(1))
);


GO

CREATE TABLE [dbo].[TerminationDate] (
    [TerminationDate] DATETIME NOT NULL,
    CONSTRAINT [CK_TerminationDate_TerminationDate] CHECK ([TerminationDate] like '____-__-__')
);


GO

CREATE TABLE [dbo].[NonDeliverableSettlement] (
    [SettlementCurrency]    CHAR (3)   NOT NULL,
    [SettlementDate]        DATETIME   NOT NULL,
    [BusinessDayConvention] CHAR (255) NOT NULL,
    CONSTRAINT [CK_NonDeliverableSettlement_BusinessDayConvention] CHECK ([BusinessDayConvention]='NotApplicable' OR [BusinessDayConvention]='NONE' OR [BusinessDayConvention]='NEAREST' OR [BusinessDayConvention]='MODPRECEDING' OR [BusinessDayConvention]='PRECEDING' OR [BusinessDayConvention]='MODFOLLOWING' OR [BusinessDayConvention]='FRN' OR [BusinessDayConvention]='FOLLOWING'),
    CONSTRAINT [CK_NonDeliverableSettlement_SettlementCurrency] CHECK (len([SettlementCurrency])>=(3)),
    CONSTRAINT [CK_NonDeliverableSettlement_SettlementDate] CHECK ([SettlementDate] like '____-__-__')
);


GO

CREATE TABLE [dbo].[Agent] (
    [AgentType] CHAR (255) NOT NULL,
    [AgentName] CHAR (255) NULL,
    CONSTRAINT [CK_Agent_AgentType] CHECK ([AgentType]='SettlementAgent' OR [AgentType]='ClearingBroker' OR [AgentType]='ECVNA' OR [AgentType]='Broker')
);


GO

CREATE TABLE [dbo].[ClearingParameters] (
    [DealID]                      CHAR (255)   NULL,
    [ClearingRegistrationAgentID] CHAR (255)   NOT NULL,
    [ClearingHouseID]             CHAR (255)   NOT NULL,
    [Lots]                        BIGINT       NOT NULL,
    [UnitPrice]                   DECIMAL (38) NOT NULL,
    [Anonymous]                   CHAR (255)   NULL,
    [Initiator]                   CHAR (255)   NULL,
    CONSTRAINT [CK_ClearingParameters_Anonymous] CHECK ([Anonymous]='false' OR [Anonymous]='true'),
    CONSTRAINT [CK_ClearingParameters_Lots] CHECK ([Lots]>=(1) AND [Lots]<=(9999999999999999.))
);


GO

CREATE TABLE [dbo].[OtherCounterpartyDetails] (
    [Repository]                     CHAR (255) NULL,
    [CPFinancialNature]              CHAR (255) NULL,
    [CPSector]                       CHAR (255) NULL,
    [BeneficiaryID]                  CHAR (255) NULL,
    [TradingCapacity]                CHAR (255) NULL,
    [OtherCPEEA]                     CHAR (255) NULL,
    [CommercialOrTreasury]           CHAR (255) NULL,
    [ClearingThreshold]              CHAR (255) NULL,
    [Collateralisation]              CHAR (255) NULL,
    [CollateralisationPortfolio]     CHAR (255) NULL,
    [CollateralisationPortfolioCode] BIGINT     NULL,
    CONSTRAINT [CK_OtherCounterpartyDetails_ClearingThreshold] CHECK ([ClearingThreshold]='false' OR [ClearingThreshold]='true'),
    CONSTRAINT [CK_OtherCounterpartyDetails_Collateralisation] CHECK ([Collateralisation]='FC' OR [Collateralisation]='OC' OR [Collateralisation]='PC' OR [Collateralisation]='U'),
    CONSTRAINT [CK_OtherCounterpartyDetails_CollateralisationPortfolio] CHECK ([CollateralisationPortfolio]='false' OR [CollateralisationPortfolio]='true'),
    CONSTRAINT [CK_OtherCounterpartyDetails_CollateralisationPortfolioCode] CHECK ([CollateralisationPortfolioCode]>=(0) AND [CollateralisationPortfolioCode]<=(9999999999.)),
    CONSTRAINT [CK_OtherCounterpartyDetails_CommercialOrTreasury] CHECK ([CommercialOrTreasury]='false' OR [CommercialOrTreasury]='true'),
    CONSTRAINT [CK_OtherCounterpartyDetails_CPFinancialNature] CHECK ([CPFinancialNature]='N' OR [CPFinancialNature]='F'),
    CONSTRAINT [CK_OtherCounterpartyDetails_CPSector] CHECK ([CPSector]='U' OR [CPSector]='R' OR [CPSector]='O' OR [CPSector]='L' OR [CPSector]='I' OR [CPSector]='F' OR [CPSector]='C' OR [CPSector]='A'),
    CONSTRAINT [CK_OtherCounterpartyDetails_OtherCPEEA] CHECK ([OtherCPEEA]='false' OR [OtherCPEEA]='true'),
    CONSTRAINT [CK_OtherCounterpartyDetails_TradingCapacity] CHECK ([TradingCapacity]='P' OR [TradingCapacity]='A')
);


GO

CREATE TABLE [dbo].[UProduct] (
    [UProductID1]      CHAR (255) NOT NULL,
    [Product1CodeType] CHAR (255) NULL,
    CONSTRAINT [CK_UProduct_Product1CodeType] CHECK ([Product1CodeType]='EMIR_Taxonomy')
);


GO

CREATE TABLE [dbo].[CalculationPeriodFrequency] (
    [PeriodMultiplier] INT     NOT NULL,
    [Period]           CHAR (2) NOT NULL,
    [RollConvention]   CHAR (2) NOT NULL,
    CONSTRAINT [CK_CalculationPeriodFrequency_Period] CHECK ([Period]='T' OR [Period]='Y' OR [Period]='M' OR [Period]='W' OR [Period]='D'),
    CONSTRAINT [CK_CalculationPeriodFrequency_PeriodMultiplier] CHECK ([PeriodMultiplier]>=(1) AND [PeriodMultiplier]<=(999))
);


GO

CREATE TABLE [dbo].[IProduct] (
    [IProductID1]      CHAR (255) NOT NULL,
    [Product1CodeType] CHAR (255) NULL,
    [IProductID2]      CHAR (255) NOT NULL,
    CONSTRAINT [CK_IProduct_Product1CodeType] CHECK ([Product1CodeType]='EMIR_Taxonomy')
);


GO

