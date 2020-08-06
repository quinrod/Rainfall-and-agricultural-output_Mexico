# Rainfall-and-agricultural-output_Mexico
Weather extrapolation and OLS

In 2010 Mexico suffered one of the most severe droughts on record. The government of Mexico wants to determine whether index insurance contracts (Agrosemex) embed well-defined payout triggers to idemnify farmkers for output losses. 

## Findings
- There is little overlap between the triggers of Agrosemex payout and the measured dispersion of rainfall data around the mean at the national level for each of the stages in the crop cycle.
- The lack of overlap could be the result of changes in weather patterns since the definition of these triggers was made in 2008, or due to the localized data gathering practiced in the past.

## Suggestions
- Define the payout thresholds for weather index insurance based on the deviations from the 10 year historical mean rainfall in a given municipality.
- Modify the definition of Agroasemex upper and lower payout thresholds across the country as these may not be well-defined given the lack of overlap between triggers and dispersion.
- Examine the triggers on a state-by-state or municipality-by-municipality level to understand the lack of overlap.

## Methodology 

### OLS
![Methodology 1](https://github.com/quinrod/Rainfall-and-agricultural-output_Mexico/blob/master/figures/Methodology1.png)
![Methodology 2](https://github.com/quinrod/Rainfall-and-agricultural-output_Mexico/blob/master/figures/Methodology2.png)

## Data
Clean and merge datasets from weather stations and agricultural activity to weather insurance payouts and subsidies:

`Weather station info`: Daily temperature and rainfall daily between 2000 and 2013 from 13,000 georeferenced weather stations.

`Agricultural activity`: Hectares of agricultural cultivation and production by municipality and crop on a monthly basis between 2002 and 2013.

`Weather insurance payouts`: Payout disbursed to farmers by state and federal governments by municipality and crop between 2003 and 2014.

`Agricultural subsidies`: Direct support from the state to farmers between 2000 and 2014.

## Visualization

### Interpolation
![Interpolation](https://github.com/quinrod/Rainfall-and-agricultural-output_Mexico/blob/master/maps/Weather%20interpolated%20for%20June%202010%20in%20Mexico.png)

### Yield of maize production pre-drought

![Pre-drought](https://github.com/quinrod/Rainfall-and-agricultural-output_Mexico/blob/master/maps/maiz_yield_2010_pre_drought.png)

### Yield of maize production post-drought

![Post-drought](https://github.com/quinrod/Rainfall-and-agricultural-output_Mexico/blob/master/maps/maiz_yield_2011_post_drought.png)

