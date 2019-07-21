features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

#read all train data
subject_train <- read.table("train/subject_train.txt")
X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")

#read all test data
subject_test <- read.table("test/subject_test.txt")
X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")

# merge data
subject_total <- rbind(subject_train, subject_test)
X_total <- rbind(X_train, X_test)
y_total <- rbind(y_train, y_test)

# select and append features
names(X_total) <- features[, 2]
features.selected <- as.character(features[grepl("mean\\(", features[, 2]) | grepl("std\\(", features[, 2]), 2])
X_total.selected <- X_total[, features.selected]
X_total.selected$subject <- subject_total[, 1]
X_total.selected$activity <- y_total

activities <- c()
for (activity in X_total.selected$activity) {
	activities <- append(activities, as.character(activity_labels[as.numeric(activity), 2]))
}
X_total.selected$activity <- activities

allActivities <- c("STANDING", "SITTING", "LAYING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS")
allSubjects <- c(1:30)

features.ordered <- c("subject", "activity", features.selected)
X_total.selected <- X_total.selected[, features.ordered]

averages <- data.frame()

for (curSubject in allSubjects) {
	for (curActivity in allActivities) {
		temp <- list(subject = curSubject, activity = curActivity)
		logicSubject <- X_total.selected$subject == curSubject
		logicActivity <- X_total.selected$activity == curActivity
		temp2 <- sapply(X_total.selected[logicSubject & logicActivity, 3:68], mean)
		temp3 <- data.frame(append(temp, temp2))
		averages <- rbind(averages, temp3)
	}
}

write.table(averages, file = "tidy_data_average.txt", row.names = FALSE)