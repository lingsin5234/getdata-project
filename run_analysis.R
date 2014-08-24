## run_analysis.R

## number of features (labels)
labels <- read.fwf("UCI HAR Dataset/features.txt", 30, sep = "")
xread <- 16*nrow(labels)
## first read the test and train data sets
Ytestall <- read.fwf("UCI HAR Dataset/test/Y_test.txt", 5, sep = "")
Xtestall <- read.fwf("UCI HAR Dataset/test/X_test.txt", xread, sep = "")

Ytrainall <- read.fwf("UCI HAR Dataset/train/Y_train.txt", 5, sep = "")
Xtrainall <- read.fwf("UCI HAR Dataset/train/X_train.txt", xread, sep = "")

actlabels <- read.fwf("UCI HAR Dataset/activity_labels.txt", 20, sep = "")

## convert the activity #s to its activity name
    actlabels[,2] <- as.character(actlabels[,2])    
    Ytestall$V1 <- as.character(Ytestall$V1)
    Ytestall$V1[Ytestall$V1=="1"] <- actlabels[1,2]
    Ytestall$V1[Ytestall$V1=="2"] <- actlabels[2,2]
    Ytestall$V1[Ytestall$V1=="3"] <- actlabels[3,2]
    Ytestall$V1[Ytestall$V1=="4"] <- actlabels[4,2]
    Ytestall$V1[Ytestall$V1=="5"] <- actlabels[5,2]
    Ytestall$V1[Ytestall$V1=="6"] <- actlabels[6,2]
    Ytrainall$V1 <- as.character(Ytrainall$V1)
    Ytrainall$V1[Ytrainall$V1=="1"] <- actlabels[1,2]
    Ytrainall$V1[Ytrainall$V1=="2"] <- actlabels[2,2]
    Ytrainall$V1[Ytrainall$V1=="3"] <- actlabels[3,2]
    Ytrainall$V1[Ytrainall$V1=="4"] <- actlabels[4,2]
    Ytrainall$V1[Ytrainall$V1=="5"] <- actlabels[5,2]
    Ytrainall$V1[Ytrainall$V1=="6"] <- actlabels[6,2]

## easier to extract measurements before merging the sets
relevantfeatures <- c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543,555:561)

Xtest <- data.frame(Xtestall[relevantfeatures])
XYtest <- cbind(Ytestall, Xtest)

Xtrain <- data.frame(Xtrainall[relevantfeatures])
XYtrain <- cbind(Ytrainall,Xtrain)

##labels for the merged data sets
XYlabels <- c("Activity", as.character(labels[relevantfeatures,2]))

##merge the two sets together
# heading for train and test subjects
subject <- c("train", "train", "train", "train", "train", "train", "test", "test", "test", "test", "test", "test")
XYavgtrain <- aggregate(XYtrain[,2:length(XYlabels)], list(XYtrain$"V1"), mean)
XYavgtest <- aggregate(XYtest[,2:length(XYlabels)], list(XYtest$"V1"), mean)
XYavg <- cbind(subject, rbind(XYavgtrain, XYavgtest))
names(XYavg) <- c("Subject", XYlabels)