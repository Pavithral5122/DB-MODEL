CREATE TABLE `Student` (
  `studentId` INT,
  `firstName` TEXT,
  `lastName` TEXT,
  `dept` TEXT,
  `emailId` varchar(50),
  `password` varchar(50),
  `number` integer,
  `courseName` text,
  `batchId` int
);

CREATE TABLE `Batch` (
  `batchId` int,
  `batchName` VARCHAR(50),
  `startDate` DATE,
  `endDate` DATE,
  `language` VARCHAR(50),
  `IsWeekendBatch` boolean
);

CREATE TABLE `Class` (
  `classId` INTEGER,
  `mentorName` text,
  `classTitle` TEXT,
  `classDate` date,
  `sessionStartTime` time,
  `sessionEndTime` time,
  `content` text,
  `TaskLink` TEXT
);

CREATE TABLE `SubmittedActivities` (
  `activitiesId` INT,
  `classId` INT,
  `studentId` INT,
  `SourceCodeLink` text,
  `comments` text
);

CREATE TABLE `Attendence` (
  `attendenceId` INT,
  `studentId` INT,
  `classId` INT
);

CREATE TABLE `Query` (
  `queryId` INT,
  `queryCode` VARCHAR(20),
  `studentId` INT,
  `category` TEXT,
  `preferedLanguage` TEXT,
  `queryTitle` TEXT,
  `queryDescription` TEXT,
  `availableTimeFrom` TEXT,
  `availableTimeTo` TEXT,
  `status` TEXT,
  `assignedTo` TEXT,
  `attachment` TEXT,
  `createdDate` DATETIME,
  `updatedDate` DATETIME
);

CREATE TABLE `Requirements` (
  `requirementId` INT,
  `companyName` TEXT,
  `companyUrl` TEXT,
  `role` TEXT,
  `ctc` INT,
  `natureOfJobs` TEXT,
  `openings` INT,
  `deadline` DATE,
  `program` TEXT
);

CREATE TABLE `Portfolio` (
  `portfolioId` INT,
  `studentId` INT,
  `gitHubUrl` TEXT,
  `portfolioUrl` TEXT,
  `resumeUrl` TEXT,
  `status` TEXT,
  `comments` TEXT,
  `batchId` INT,
  `reviewSTATUS` TEXT,
  `reviewedBy` TEXT
);

CREATE TABLE `LeaveApplication` (
  `leaveApplicationId` INT,
  `studentId` INT,
  `noOfDays` INT,
  `fromDate` DATE,
  `toDate` DATE,
  `reason` TEXT
);

ALTER TABLE `Student` ADD FOREIGN KEY (`studentId`) REFERENCES `SubmittedActivities` (`studentId`);

ALTER TABLE `Batch` ADD FOREIGN KEY (`batchId`) REFERENCES `Student` (`batchId`);

ALTER TABLE `Class` ADD FOREIGN KEY (`classId`) REFERENCES `SubmittedActivities` (`classId`);

ALTER TABLE `Student` ADD FOREIGN KEY (`studentId`) REFERENCES `Attendence` (`studentId`);

ALTER TABLE `Student` ADD FOREIGN KEY (`studentId`) REFERENCES `LeaveApplication` (`studentId`);

ALTER TABLE `Class` ADD FOREIGN KEY (`classId`) REFERENCES `Attendence` (`classId`);

ALTER TABLE `Student` ADD FOREIGN KEY (`studentId`) REFERENCES `Query` (`studentId`);

ALTER TABLE `Student` ADD FOREIGN KEY (`studentId`) REFERENCES `Portfolio` (`studentId`);

ALTER TABLE `Batch` ADD FOREIGN KEY (`batchId`) REFERENCES `Portfolio` (`batchId`);
