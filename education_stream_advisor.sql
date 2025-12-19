-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2025 at 10:04 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `education_stream_advisor`
--

-- --------------------------------------------------------

--
-- Table structure for table `ai_chat_history`
--

CREATE TABLE `ai_chat_history` (
  `chat_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `sender` enum('User','AI') DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `education_levels`
--

CREATE TABLE `education_levels` (
  `level_id` int(11) NOT NULL,
  `level_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `education_levels`
--

INSERT INTO `education_levels` (`level_id`, `level_name`) VALUES
(1, '10th Pass'),
(2, '12th Science'),
(3, '12th Commerce'),
(4, '12th Arts'),
(5, 'Diploma'),
(6, 'Undergraduate'),
(7, 'Postgraduate');

-- --------------------------------------------------------

--
-- Table structure for table `entrance_exams`
--

CREATE TABLE `entrance_exams` (
  `exam_id` int(11) NOT NULL,
  `exam_name` varchar(100) DEFAULT NULL,
  `conducting_body` varchar(150) DEFAULT NULL,
  `exam_level` enum('National','State','Institute') DEFAULT NULL,
  `overview` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `entrance_exams`
--

INSERT INTO `entrance_exams` (`exam_id`, `exam_name`, `conducting_body`, `exam_level`, `overview`) VALUES
(1, 'JEE Main', 'NTA', 'National', 'Engineering entrance exam'),
(2, 'NEET', 'NTA', 'National', 'Medical entrance exam');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `job_id` int(11) NOT NULL,
  `job_title` varchar(150) DEFAULT NULL,
  `sector` enum('Government','Private') DEFAULT NULL,
  `job_overview` text DEFAULT NULL,
  `career_growth` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`job_id`, `job_title`, `sector`, `job_overview`, `career_growth`) VALUES
(1, 'Software Engineer', 'Private', 'Develop software applications', 'Senior Engineer → Architect'),
(2, 'PSU Engineer', 'Government', 'Engineering jobs in PSUs', 'Manager → Director');

-- --------------------------------------------------------

--
-- Table structure for table `roadmaps`
--

CREATE TABLE `roadmaps` (
  `roadmap_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `current_level_id` int(11) DEFAULT NULL,
  `target_job_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roadmap_steps`
--

CREATE TABLE `roadmap_steps` (
  `step_id` int(11) NOT NULL,
  `roadmap_id` int(11) DEFAULT NULL,
  `step_order` int(11) DEFAULT NULL,
  `education_stage` varchar(100) DEFAULT NULL,
  `stream_name` varchar(100) DEFAULT NULL,
  `exam_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `streams`
--

CREATE TABLE `streams` (
  `stream_id` int(11) NOT NULL,
  `level_id` int(11) DEFAULT NULL,
  `stream_name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `future_scope` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `streams`
--

INSERT INTO `streams` (`stream_id`, `level_id`, `stream_name`, `description`, `duration`, `future_scope`) VALUES
(1, 1, '12th Science', 'Science stream with PCM/PCB', '2 Years', 'Engineering, Medicine, Research'),
(2, 1, 'Diploma Engineering', 'Technical diploma after 10th', '3 Years', 'Lateral entry to B.Tech'),
(3, 2, 'Engineering', 'B.Tech Engineering degree', '4 Years', 'IT, Core, PSU jobs'),
(4, 2, 'Medicine', 'MBBS degree', '5.5 Years', 'Doctor, Specialist'),
(6, 1, '12th Commerce', 'Commerce with Accounts, Business', '2 Years', 'CA, BBA, MBA, Finance'),
(7, 1, '12th Arts', 'Arts and Humanities stream', '2 Years', 'Civil services, Law, Design'),
(9, 1, 'ITI', 'Industrial Training Institute courses', '1–2 Years', 'Technical & trade jobs'),
(10, 2, 'Pure Science (B.Sc)', 'Physics, Chemistry, Maths, Biology', '3 Years', 'Research, Teaching'),
(11, 2, 'Architecture (B.Arch)', 'Architecture and design', '5 Years', 'Architect'),
(12, 2, 'Pharmacy (B.Pharm)', 'Pharmaceutical sciences', '4 Years', 'Pharma industry'),
(13, 3, 'B.Com', 'Bachelor of Commerce', '3 Years', 'Accounting, Finance'),
(14, 3, 'BBA', 'Business Administration', '3 Years', 'Management, MBA'),
(15, 3, 'CA', 'Chartered Accountancy', '4–5 Years', 'Auditing, Finance'),
(16, 3, 'CS', 'Company Secretary', '3–4 Years', 'Corporate Law'),
(17, 1, 'Polytechnic Diploma', 'Applied technical diploma', '3 Years', 'Industry & lateral entry'),
(18, 1, 'Vocational Courses', 'Skill-based vocational education', '1–2 Years', 'Employment & entrepreneurship'),
(19, 7, 'PhD', 'Doctoral research', '3–5 Years', 'Academia, R&D'),
(20, 7, 'Postdoctoral Research', 'Advanced research', '2–3 Years', 'Research scientist'),
(21, 7, 'Fellowships', 'Policy & research fellowships', '1–2 Years', 'Think tanks'),
(22, 7, 'Professional Certification', 'Industry certifications', 'Variable', 'Specialist roles'),
(23, 6, 'M.Tech', 'Postgraduate engineering', '2 Years', 'Research, PSU'),
(24, 6, 'MBA', 'Business administration', '2 Years', 'Management'),
(25, 6, 'M.Sc', 'Postgraduate science', '2 Years', 'Research, teaching'),
(26, 6, 'LLM', 'Postgraduate law', '1–2 Years', 'Legal specialization'),
(27, 6, 'MS (Abroad / India)', 'Advanced specialization', '2 Years', 'Global roles'),
(28, 6, 'MCA', 'Computer applications', '2 Years', 'Software industry'),
(29, 5, 'B.Tech (Lateral Entry)', 'Engineering via diploma', '3 Years', 'Engineering jobs'),
(30, 5, 'BCA', 'Computer applications', '3 Years', 'IT industry'),
(31, 5, 'B.Sc Applied Sciences', 'Applied science degree', '3 Years', 'Industry roles'),
(32, 5, 'Advanced Diploma', 'Higher diploma specialization', '1–2 Years', 'Skill enhancement'),
(33, 2, 'Agriculture (B.Sc Agri)', 'Agricultural sciences', '4 Years', 'Agri officer, research'),
(34, 2, 'Nursing (B.Sc Nursing)', 'Healthcare & nursing', '4 Years', 'Clinical & admin roles'),
(35, 3, 'Economics', 'Economics & policy studies', '3 Years', 'Policy, analytics'),
(36, 3, 'Banking & Insurance', 'Banking & finance studies', '3 Years', 'Banking jobs'),
(37, 4, 'BA', 'Arts & humanities degree', '3 Years', 'UPSC, teaching'),
(38, 4, 'Law (BA LLB)', 'Integrated law degree', '5 Years', 'Lawyer, judiciary'),
(39, 4, 'Journalism & Mass Communication', 'Media & communication', '3 Years', 'Media industry'),
(40, 4, 'Psychology', 'Human behavior studies', '3 Years', 'Counselling, HR'),
(41, 4, 'Design (Fashion / Graphic / UI)', 'Creative design studies', '3–4 Years', 'Design industry');

-- --------------------------------------------------------

--
-- Table structure for table `stream_exams`
--

CREATE TABLE `stream_exams` (
  `id` int(11) NOT NULL,
  `stream_id` int(11) DEFAULT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `required` enum('Yes','No') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stream_exams`
--

INSERT INTO `stream_exams` (`id`, `stream_id`, `exam_id`, `required`) VALUES
(1, 3, 1, 'Yes'),
(2, 4, 2, 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `stream_jobs`
--

CREATE TABLE `stream_jobs` (
  `id` int(11) NOT NULL,
  `stream_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stream_jobs`
--

INSERT INTO `stream_jobs` (`id`, `stream_id`, `job_id`) VALUES
(1, 3, 1),
(2, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stream_progression`
--

CREATE TABLE `stream_progression` (
  `id` int(11) NOT NULL,
  `from_stream_id` int(11) DEFAULT NULL,
  `to_stream_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ai_chat_history`
--
ALTER TABLE `ai_chat_history`
  ADD PRIMARY KEY (`chat_id`);

--
-- Indexes for table `education_levels`
--
ALTER TABLE `education_levels`
  ADD PRIMARY KEY (`level_id`);

--
-- Indexes for table `entrance_exams`
--
ALTER TABLE `entrance_exams`
  ADD PRIMARY KEY (`exam_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`job_id`);

--
-- Indexes for table `roadmaps`
--
ALTER TABLE `roadmaps`
  ADD PRIMARY KEY (`roadmap_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `roadmap_steps`
--
ALTER TABLE `roadmap_steps`
  ADD PRIMARY KEY (`step_id`),
  ADD KEY `roadmap_id` (`roadmap_id`);

--
-- Indexes for table `streams`
--
ALTER TABLE `streams`
  ADD PRIMARY KEY (`stream_id`),
  ADD KEY `level_id` (`level_id`);

--
-- Indexes for table `stream_exams`
--
ALTER TABLE `stream_exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stream_id` (`stream_id`),
  ADD KEY `exam_id` (`exam_id`);

--
-- Indexes for table `stream_jobs`
--
ALTER TABLE `stream_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stream_id` (`stream_id`),
  ADD KEY `job_id` (`job_id`);

--
-- Indexes for table `stream_progression`
--
ALTER TABLE `stream_progression`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from_stream_id` (`from_stream_id`),
  ADD KEY `to_stream_id` (`to_stream_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ai_chat_history`
--
ALTER TABLE `ai_chat_history`
  MODIFY `chat_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `education_levels`
--
ALTER TABLE `education_levels`
  MODIFY `level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `entrance_exams`
--
ALTER TABLE `entrance_exams`
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roadmaps`
--
ALTER TABLE `roadmaps`
  MODIFY `roadmap_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roadmap_steps`
--
ALTER TABLE `roadmap_steps`
  MODIFY `step_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `streams`
--
ALTER TABLE `streams`
  MODIFY `stream_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `stream_exams`
--
ALTER TABLE `stream_exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stream_jobs`
--
ALTER TABLE `stream_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stream_progression`
--
ALTER TABLE `stream_progression`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `roadmaps`
--
ALTER TABLE `roadmaps`
  ADD CONSTRAINT `roadmaps_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `roadmap_steps`
--
ALTER TABLE `roadmap_steps`
  ADD CONSTRAINT `roadmap_steps_ibfk_1` FOREIGN KEY (`roadmap_id`) REFERENCES `roadmaps` (`roadmap_id`);

--
-- Constraints for table `streams`
--
ALTER TABLE `streams`
  ADD CONSTRAINT `streams_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `education_levels` (`level_id`);

--
-- Constraints for table `stream_exams`
--
ALTER TABLE `stream_exams`
  ADD CONSTRAINT `stream_exams_ibfk_1` FOREIGN KEY (`stream_id`) REFERENCES `streams` (`stream_id`),
  ADD CONSTRAINT `stream_exams_ibfk_2` FOREIGN KEY (`exam_id`) REFERENCES `entrance_exams` (`exam_id`);

--
-- Constraints for table `stream_jobs`
--
ALTER TABLE `stream_jobs`
  ADD CONSTRAINT `stream_jobs_ibfk_1` FOREIGN KEY (`stream_id`) REFERENCES `streams` (`stream_id`),
  ADD CONSTRAINT `stream_jobs_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`);

--
-- Constraints for table `stream_progression`
--
ALTER TABLE `stream_progression`
  ADD CONSTRAINT `stream_progression_ibfk_1` FOREIGN KEY (`from_stream_id`) REFERENCES `streams` (`stream_id`),
  ADD CONSTRAINT `stream_progression_ibfk_2` FOREIGN KEY (`to_stream_id`) REFERENCES `streams` (`stream_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
