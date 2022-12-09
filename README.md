
# Assignment B4: Shiny App Updates
This repository is intended to meet the requirements for STAT545B Assignment 4, wherein a Shiny App is coded and published to Shinyapp.io

Option Selected: C (Make updates to the Shiny App completed for Assignment B3)

Link to running app: https://emtmasonjar.shinyapps.io/steam/

## App Description
This app functions to visualize data on flower dimensions of different iris flowers taken from a popularly used dataset called "iris" from the R datasets package. it will allow the user to look at petal length in relation to several other variables including sepal length, petal width, and species of iris in a boxplot and scatter plot format.

The following functions are included in this app to fulfill requirements for Assignment B4:

Function Type | B3 or B4 | Description & Rationale
----------|---------|-------------
Functional widgit | present in B3 | selecting variables to include on x-axis of graph. This is useful because it allows the user to visualize relationships between different variables and petal width
Change in UI | present in B3 | Added the paper theme, making text and colours of the UI aesthetically pleasing (and complementary to content of the app - purple iris flowers)
Functional widgit | present in B3 | checkbox to include outliers. This allows the user to choose whether or not data outliers are displayed on the graphs.
Change in UI | B4 addition | Addition of an image to the sidebar, depicting an iris flower cartoon. This gives a visual connection between the dataset and what the data is intended to evaluate: an iris flower.
Change in UI | B4 addition | Text descriptors before boxplot and scatter graph to explain the purpose of the app and how to interpret the data.
Functional Widgit | B4 addition | Addition of a reactive scatter plot to display a chosen variable against petal length, where data is grouped by Iris flower species.
