# Scoring in the NHL

## Overview
This project was conducted during the **CMU Sports Analytics Camp**. We explored the **2023 NHL Playoff Shots Database**, which contains over **122,000 shot attempts** and provides insights into various factors affecting shot effectiveness. The dataset comprises **124 variables**, detailing such as result of each shot and number of players on the ice at the time of the shot. 

## Research Questions
### 1. Relationship between Player Fatigue and Shot Effectiveness
**Hypothesis**: The longer a player spends on the ice, the less likely they are to score.

- **Metrics**:
  - **Shot Effectiveness**: Defined as the total number of goals scored out of the total shots taken within a specified time interval.
  - **Player Fatigue**: Measured by the time players spend on ice, segmented into intervals of **60 seconds**.

### 2. Effect of Opposing Players on Shooting Efficiency
**Hypothesis**: Player shooting efficiency will improve as the number of opposing players on the ice decreases.

### 3. Rebounds and Shot Locations
**Question**: Are shots taken closer to the net more likely to generate rebounds?

## Cluster Analysis of NHL Team Shot Patterns
### Principal Component Analysis (PCA)
To reduce dimensionality while retaining key information, we performed PCA to identify the variables that best differentiate teams' shot patterns. 

### Key Variables
The following variables were identified as influential in differentiating shot patterns:

| Variable                                  | PC1 Loadings |
|-------------------------------------------|---------------|
| Average Expected Goals                    | 0.5723        |
| Average Expected Rebounds                 | 0.6011        |
| Average Shot Distance                     | -0.0070       |
| Average Number of Away Players on Ice     | -0.3834       |
| Average Time Players on Ice               | 0.4051        |

### Clustering of NHL Teams
A clustering analysis was performed based on **Average Expected Goals** and **Average Rebounds per Shot Attempt** to visualize team performance.

## Summary
- As the number of opposing players on the ice decreases, a greater percentage of shots on goal result in scores.
- Most rebounds are generated near the net, varying by shot types.
- Shot effectiveness increases with more time spent on ice by the shooter.

## Acknowledgements
- Christina Vu, Texas Christian University, ngoc.bt.vu@gmail.com
- Frithjof Sanger, Carnegie Mellon University, fsanger@andrew.cmu.edu
- Chisunta Chikwamu, Whitman College, chikwamm@whitman.edu


## References

