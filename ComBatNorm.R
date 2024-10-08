if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("sva")


if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("bladderbatch")


if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("snpStats")

library("sva")
library(devtools)
library(Biobase)
library(sva)
library(bladderbatch)
library(snpStats)
install.packages(c("devtools"))

---------------------------------------------------------
CombatNorm=read.csv("CombatNorm-Corrected.csv")
batch=read.csv("batch.csv")

# Check for missing values in batch$x
missing_values <- sum(is.na(batch$x))

# If there are missing values, remove them
if (missing_values > 0) {
  batch <- na.omit(batch)
}

# Convert batch$x to a factor with two levels
batch$x <- factor(batch$x, levels = c(1, 2))
# Check the structure of batch$x after conversion
str(batch$x)
# Use ComBat after handling missing values
combat_data <- ComBat(dat = CombatNorm[,2:943], batch = batch$x)
write.csv(combat_data, file="C:/Users/Mona/Desktop/Stanford/Nima/Cord Blood Metabolomics Analysis/sva Normalization/combat_data.csv", row.names = TRUE)



