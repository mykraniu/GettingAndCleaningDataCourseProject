rm(list=ls())
setwd("~/Github/GettingAndCleaningDataCourseProject")


# ========================
#  Load in all the Data
# ========================


# Top level data
activity.labels <- read.table('activity_labels.txt')
features <- read.table('features.txt')

# -----------------
#  Test Set
# -----------------

# Main Singals
test.X_test <- read.table('test/X_test.txt')
test.Y_test <- read.table('test/Y_test.txt')
test.subject_test <- read.table('test/subject_test.txt')

# # Inertial Signals
# # Body Accelerometer
# test.inrt.body_acc_x_test <- read.table('test/Inertial Signals/body_acc_x_test.txt')
# test.inrt.body_acc_y_test <- read.table('test/Inertial Signals/body_acc_y_test.txt')
# test.inrt.body_acc_z_test <- read.table('test/Inertial Signals/body_acc_z_test.txt')
# # Body Gyro
# test.inrt.body_gyro_x_test <- read.table('test/Inertial Signals/body_gyro_x_test.txt')
# test.inrt.body_gyro_y_test <- read.table('test/Inertial Signals/body_gyro_y_test.txt')
# test.inrt.body_gyro_z_test <- read.table('test/Inertial Signals/body_gyro_z_test.txt')
# # Total Accelerometer (Body + Gravity)
# test.inrt.total_acc_x_test <- read.table('test/Inertial Signals/total_acc_x_test.txt')
# test.inrt.total_acc_y_test <- read.table('test/Inertial Signals/total_acc_y_test.txt')
# test.inrt.total_acc_z_test <- read.table('test/Inertial Signals/total_acc_z_test.txt')


# -----------------
#  Train Set
# -----------------

# Main Singals
train.X_train <- read.table('train/X_train.txt')
train.Y_train <- read.table('train/Y_train.txt')
train.subject_train <- read.table('train/subject_train.txt')

# # Inertial Signals
# # Body Accelerometer
# train.inrt.body_acc_x_train <- read.table('train/Inertial Signals/body_acc_x_train.txt')
# train.inrt.body_acc_y_train <- read.table('train/Inertial Signals/body_acc_y_train.txt')
# train.inrt.body_acc_z_train <- read.table('train/Inertial Signals/body_acc_z_train.txt')
# # Body Gyro
# train.inrt.body_gyro_x_train <- read.table('train/Inertial Signals/body_gyro_x_train.txt')
# train.inrt.body_gyro_y_train <- read.table('train/Inertial Signals/body_gyro_y_train.txt')
# train.inrt.body_gyro_z_train <- read.table('train/Inertial Signals/body_gyro_z_train.txt')
# # Total Accelerometer (Body + Gravity)
# train.inrt.total_acc_x_train <- read.table('train/Inertial Signals/total_acc_x_train.txt')
# train.inrt.total_acc_y_train <- read.table('train/Inertial Signals/total_acc_y_train.txt')
# train.inrt.total_acc_z_train <- read.table('train/Inertial Signals/total_acc_z_train.txt')




# ------------------------------------------------
#  Combined Set - Cleanup old data to save memory
# ------------------------------------------------

# Main Singals
all.X <- rbind(train.X_train,test.X_test); rm(train.X_train,test.X_test)
all.Y <- rbind(train.Y_train,test.Y_test); rm(train.Y_train,test.Y_test)
all.subject <- rbind(train.subject_train,test.subject_test); rm(train.subject_train,test.subject_test)

# # Inertial Signals
# # Body Accelerometer
# all.inrt.body_acc_x <- rbind(train.inrt.body_acc_x_train,test.inrt.body_acc_x_test); rm(train.inrt.body_acc_x_train,test.inrt.body_acc_x_test)
# all.inrt.body_acc_y <- rbind(train.inrt.body_acc_y_train,test.inrt.body_acc_y_test); rm(train.inrt.body_acc_y_train,test.inrt.body_acc_y_test)
# all.inrt.body_acc_z <- rbind(train.inrt.body_acc_z_train,test.inrt.body_acc_z_test); rm(train.inrt.body_acc_z_train,test.inrt.body_acc_z_test)
# # Body Gyro
# all.inrt.body_gyro_x <- rbind(train.inrt.body_gyro_x_train,test.inrt.body_gyro_x_test); rm(train.inrt.body_gyro_x_train,test.inrt.body_gyro_x_test)
# all.inrt.body_gyro_y <- rbind(train.inrt.body_gyro_y_train,test.inrt.body_gyro_y_test); rm(train.inrt.body_gyro_y_train,test.inrt.body_gyro_y_test)
# all.inrt.body_gyro_z <- rbind(train.inrt.body_gyro_z_train,test.inrt.body_gyro_z_test); rm(train.inrt.body_gyro_z_train,test.inrt.body_gyro_z_test)
# # Total Accelerometer (Body + Gravity)
# all.inrt.total_acc_x <- rbind(train.inrt.total_acc_x_train,test.inrt.total_acc_x_test); rm(train.inrt.total_acc_x_train,test.inrt.total_acc_x_test)
# all.inrt.total_acc_y <- rbind(train.inrt.total_acc_y_train,test.inrt.total_acc_y_test); rm(train.inrt.total_acc_y_train,test.inrt.total_acc_y_test)
# all.inrt.total_acc_z <- rbind(train.inrt.total_acc_z_train,test.inrt.total_acc_z_test); rm(train.inrt.total_acc_z_train,test.inrt.total_acc_z_test)





# ------------------------------------
#  Apply column names to the data
# ------------------------------------

names(features) <- c('feature.id','feature.name')
names(activity.labels) <- c('activity.id','activity.name')
names(all.subject) <- c('subject.id')
names(all.Y) <- c('activity.id')
#names(all.X) <- features$feature.name


# ------------------------------------
#  Add Activity names to Y
# ------------------------------------
#  3) Uses descriptive activity names to name the activities in the data set
all.Y <- merge(all.Y,activity.labels,by='activity.id')
# Add Column names to Y
names(all.Y) <- c('activity.id','activity.name')


# --------------------
#  Unique Identifier
# --------------------
#
# Give a unique Identifier to each all.* table to help combine later
#
sample.id <- 1:nrow(all.Y)
# Main Singals
all.set <- cbind(sample.id=sample.id,all.subject,activity=all.Y$activity.name,all.X)
rm(all.subject,all.X)

# # Inertial Signals
# # Body Accelerometer
# all.inrt.body_acc_x <- cbind(sample.id=sample.id,all.inrt.body_acc_x)
# all.inrt.body_acc_y <- cbind(sample.id=sample.id,all.inrt.body_acc_y)
# all.inrt.body_acc_z <- cbind(sample.id=sample.id,all.inrt.body_acc_z)
# # Body Gyrosample.id=sample.id
# all.inrt.body_gyro_x <- cbind(sample.id=sample.id,all.inrt.body_gyro_x)
# all.inrt.body_gyro_y <- cbind(sample.id=sample.id,all.inrt.body_gyro_y)
# all.inrt.body_gyro_z <- cbind(sample.id=sample.id,all.inrt.body_gyro_z)
# # Total Accelerometer (Body + Gravity)
# all.inrt.total_acc_x <- cbind(sample.id=sample.id,all.inrt.total_acc_x)
# all.inrt.total_acc_y <- cbind(sample.id=sample.id,all.inrt.total_acc_y)
# all.inrt.total_acc_z <- cbind(sample.id=sample.id,all.inrt.total_acc_z)




# ----------------------------------------------------------
#  Select Columns from all.X that correspond to mean and SD
# ----------------------------------------------------------

# Get a list of features that correspond to mean() and std()
msd.features <- grep('(mean|std)\\(\\)',features$feature.name,value=TRUE)
msd.cols <- grep('(mean|std)\\(\\)',features$feature.name) + 3 ; # Add 3 to compensate for sample, subject, activity ids
write.table(msd.features,'msd.features.txt')

# 2) Extracts only the measurements on the mean and standard deviation for each measurement.
# Filter out the columns from the feature list
all.set <- all.set %>% select(sample.id,subject.id,activity,msd.cols)


# 4) Appropriately labels the data set with descriptive variable names.
# Rename the columns with desired names
names(all.set) <- c('sample.id','subject.id','activity',msd.features)


# 5) From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.

# Use tidyr gather to convert from wide to long format
all.tidy.set <- all.set %>%
  gather(feature,value,-sample.id:-activity)

# Group the data by Activity subject and feature. And get a summary of the average value
all.tidy.summary <- all.tidy.set %>%
  group_by(activity,subject.id,feature) %>%
  summarise(count=n(),average.value=mean(value))

# Write out the file 
write.table(all.tidy.summary,'all.tidy.summary.txt')


