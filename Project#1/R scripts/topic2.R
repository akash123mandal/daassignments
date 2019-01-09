#EARTHQUAKE imported as quake

#Take a glance at the data
View(quake)
head(quake)
str(quake)

#check for discrepancies
plot(quake$Time, quake$Magnitude, xlab = "Month of 2016", ylab = "Magnitude of Quake", main = "Magnitude of quake vs Time")
plot(quake$Time, quake$`Depth/Km`, xlab = "Month of 2016", ylab = "Depth of quake", main = "Depth of quake vs Time")
max(quake$Magnitude)
plot(quake$Longitude, quake$Latitude, xlab = "Longitude(deg E)", ylab = "Latitude(deg N)", main = "Longitude and Latitude")

#five number summaries
fnum_depth <- fivenum(quake$`Depth/Km`)
fnum_magnitude <- fivenum(quake$Magnitude)
print(fnum_depth)
print(fnum_magnitude)

#boxplots, entire data
boxplot(quake$`Depth/Km`, ylab = "Depth(km)")
boxplot(quake$Magnitude, ylab = "Magnitude")

#quartiles
q1_depth <- fnum_depth[2]
q2_depth <- fnum_depth[3]
q3_depth <- fnum_depth[4]

q1_magnitude <- fnum_magnitude[2]
q2_magnitude <- fnum_magnitude[3]
q3_magnitude <- fnum_magnitude[4]

#IQR
iqr_depth <- IQR(quake$`Depth/Km`)
iqr_magnitude <- IQR(quake$Magnitude)
print(iqr_depth)
print(iqr_magnitude)

#cutoff values for outliers
min_cutoff_depth_minor <- q1_depth - 1.5 * iqr_depth
max_cutoff_depth_minor <- q3_depth + 1.5 * iqr_depth
min_cutoff_depth_major <- q1_depth - 3 * iqr_depth
max_cutoff_depth_major <- q3_depth + 3 * iqr_depth

print(min_cutoff_depth_minor)
print(max_cutoff_depth_minor)
print(min_cutoff_depth_major)
print(max_cutoff_depth_major)

min_cutoff_magnitude_minor <- q1_magnitude - 1.5 * iqr_magnitude
max_cutoff_magnitude_minor <- q3_magnitude + 1.5 * iqr_magnitude
min_cutoff_magnitude_major <- q1_magnitude - 3 * iqr_magnitude
max_cutoff_magnitude_major <- q3_magnitude + 3 * iqr_magnitude

print(min_cutoff_magnitude_minor)
print(max_cutoff_magnitude_minor)
print(min_cutoff_magnitude_major)
print(max_cutoff_magnitude_major)

#number of rows excluded
nrow(quake[quake$`Depth/Km` < min_cutoff_depth_minor | quake$`Depth/Km` > max_cutoff_depth_minor, ])
nrow(quake[quake$`Depth/Km` < min_cutoff_depth_major | quake$`Depth/Km` > max_cutoff_depth_major, ])

nrow(quake[quake$Magnitude < min_cutoff_magnitude_minor | quake$Magnitude > max_cutoff_magnitude_minor, ])
nrow(quake[quake$Magnitude < min_cutoff_magnitude_major | quake$Magnitude > max_cutoff_magnitude_major, ])

quake_depth_major <- quake[quake$`Depth/Km` > min_cutoff_depth_major & quake$`Depth/Km` < max_cutoff_depth_major, ]
quake_mag_minor <- quake[quake$Magnitude > min_cutoff_magnitude_minor & quake$Magnitude < max_cutoff_magnitude_minor, ]
quake_mag_major <- quake[quake$Magnitude > min_cutoff_magnitude_major & quake$Magnitude < max_cutoff_magnitude_major, ]
quake_mag_minor_depth_major <- quake[quake$`Depth/Km` > min_cutoff_depth_major & quake$`Depth/Km` < max_cutoff_depth_major & quake$Magnitude > min_cutoff_magnitude_minor & quake$Magnitude < max_cutoff_magnitude_minor, ]
