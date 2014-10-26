features <- read.table("./UCI HAR Dataset/features.txt", quote="\"", stringsAsFactors=FALSE)
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", quote="\"")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", quote="\"")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", quote="\"")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", quote="\"")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", quote="\"")

y_test <- merge(x=y_test,y=activity_labels, by=1)
y_train<- merge(x=y_train,y=activity_labels, by=1)

data <- rbind(X_test,X_train)
activity <- rbind(y_test,y_train)


names(data) <- t(features[2])
names(activity) <- c('id','activity')

data <- cbind(activity[2],data[,grep('.*(mean|std)\\(\\).*',names(data))])

write.table(data,file = 'out.txt',row.names = FALSE)
