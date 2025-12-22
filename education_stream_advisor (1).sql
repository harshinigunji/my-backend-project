-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2025 at 10:16 AM
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
-- Table structure for table `career_path_rules`
--

CREATE TABLE `career_path_rules` (
  `job_id` int(11) NOT NULL,
  `stop_at_stream_id` int(11) DEFAULT NULL,
  `required_exam` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `career_path_rules`
--

INSERT INTO `career_path_rules` (`job_id`, `stop_at_stream_id`, `required_exam`) VALUES
(7, 35, NULL),
(9, NULL, NULL),
(10, 4, 'NEET'),
(16, 13, 'CA Foundation'),
(21, 37, 'UPSC'),
(22, 38, 'CLAT'),
(27, NULL, 'UGC NET'),
(28, NULL, 'UGC NET'),
(31, 24, 'CAT');

-- --------------------------------------------------------

--
-- Table structure for table `career_rules`
--

CREATE TABLE `career_rules` (
  `job_id` int(11) NOT NULL,
  `min_level` enum('UG','PG','Professional') NOT NULL,
  `requires_exam` enum('Yes','No') DEFAULT 'Yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `career_rules`
--

INSERT INTO `career_rules` (`job_id`, `min_level`, `requires_exam`) VALUES
(9, 'PG', 'Yes'),
(10, 'Professional', 'Yes'),
(16, 'Professional', 'Yes'),
(21, 'Professional', 'Yes'),
(22, 'Professional', 'Yes'),
(27, 'PG', 'Yes'),
(28, 'PG', 'Yes');

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
(2, 'NEET', 'NTA', 'National', 'Medical entrance exam'),
(3, 'Navodaya Vidyalaya Entrance Exam', 'Navodaya Vidyalaya Samiti', 'National', 'Admission to Navodaya schools'),
(4, 'Sainik School Entrance Exam', 'Sainik School Society', 'National', 'Admission to Sainik Schools'),
(5, 'ITI Entrance Exam', 'State Boards', 'State', 'Admission to ITI institutes'),
(6, 'Polytechnic Entrance Exam', 'State Boards', 'State', 'Admission to Polytechnic diploma'),
(7, 'JEE Advanced', 'IITs', 'National', 'Admission to IITs'),
(8, 'CUET UG', 'NTA', 'National', 'Central university UG admissions'),
(9, 'State CET', 'State Boards', 'State', 'State-level engineering & pharmacy'),
(10, 'NATA', 'COA', 'National', 'Architecture entrance exam'),
(11, 'CA Foundation', 'ICAI', 'National', 'Entry-level CA exam'),
(12, 'CS Foundation', 'ICSI', 'National', 'Entry-level CS exam'),
(13, 'CLAT', 'Consortium of NLUs', 'National', 'Law entrance exam'),
(14, 'IPMAT', 'IIM Indore/Rohtak', 'National', 'Integrated management'),
(15, 'NIFT Entrance Exam', 'NIFT', 'National', 'Fashion & design admission'),
(16, 'GATE', 'IITs', 'National', 'PG engineering & PSU entry'),
(17, 'CAT', 'IIMs', 'National', 'MBA entrance exam'),
(18, 'XAT', 'XLRI', 'National', 'MBA entrance exam'),
(19, 'CMAT', 'NTA', 'National', 'MBA entrance exam'),
(20, 'JAM', 'IITs', 'National', 'M.Sc admission'),
(21, 'CUET PG', 'NTA', 'National', 'Central university PG admission'),
(22, 'UPSC CSE', 'UPSC', 'National', 'Civil services exam'),
(23, 'UGC NET', 'UGC', 'National', 'Lectureship & PhD eligibility');

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
(2, 'PSU Engineer', 'Government', 'Engineering jobs in PSUs', 'Manager → Director'),
(3, 'ITI Technician', 'Private', 'Technical trade-based work', 'Senior Technician → Supervisor'),
(4, 'Apprentice', 'Government', 'Skill-based apprenticeship programs', 'Permanent skilled roles'),
(5, 'Junior Technician', 'Private', 'Entry-level technical support', 'Senior Technician → Lead'),
(6, 'Field Assistant', 'Private', 'On-field operational support', 'Supervisor → Manager'),
(7, 'Data Analyst', 'Private', 'Analyze and interpret data', 'Senior Analyst → Data Scientist'),
(8, 'System Engineer', 'Private', 'System design and maintenance', 'Lead Engineer → Manager'),
(9, 'Research Scientist', 'Private', 'Scientific research and R&D', 'Senior Scientist → Lead'),
(10, 'Doctor', 'Private', 'Medical practitioner', 'Specialist → Consultant'),
(11, 'Government Medical Officer', 'Government', 'Doctor in govt hospitals', 'CMO → Director'),
(12, 'Staff Nurse', 'Government', 'Clinical nursing roles', 'Senior Nurse → Admin'),
(13, 'Clinical Research Associate', 'Private', 'Clinical trials & research', 'Project Lead → Manager'),
(14, 'Medical Lab Technician', 'Private', 'Laboratory diagnostic work', 'Senior Technician → Lab Manager'),
(15, 'Accountant', 'Private', 'Accounting and finance operations', 'Finance Manager → CFO'),
(16, 'Chartered Accountant', 'Private', 'Audit, taxation, compliance', 'Partner → Consultant'),
(17, 'Bank Probationary Officer', 'Government', 'Officer role in banks', 'Manager → AGM'),
(18, 'Business Analyst', 'Private', 'Business & data analysis', 'Lead Analyst → Manager'),
(19, 'Marketing Manager', 'Private', 'Brand & marketing strategy', 'Head → Director'),
(20, 'Financial Analyst', 'Private', 'Investment & financial analysis', 'Portfolio Manager'),
(21, 'Civil Services Officer', 'Government', 'UPSC civil services', 'Secretary → Cabinet roles'),
(22, 'Lawyer', 'Private', 'Legal practice and advisory', 'Senior Advocate → Judge'),
(23, 'Journalist', 'Private', 'News reporting and media', 'Editor → Bureau Chief'),
(24, 'Psychologist', 'Private', 'Mental health counselling', 'Senior Therapist → Consultant'),
(25, 'UI/UX Designer', 'Private', 'User experience & interface design', 'Lead Designer → Head'),
(26, 'Content Strategist', 'Private', 'Content planning & communication', 'Content Head'),
(27, 'Assistant Professor', 'Government', 'Teaching in colleges & universities', 'Professor → Dean'),
(28, 'Research Fellow', 'Government', 'Funded research roles', 'Scientist → Director'),
(29, 'Policy Analyst', 'Private', 'Public policy & research', 'Senior Analyst'),
(30, 'Data Scientist', 'Private', 'Advanced data modeling', 'Lead Scientist'),
(31, 'Management Consultant', 'Private', 'Business consulting', 'Senior Consultant → Partner');

-- --------------------------------------------------------

--
-- Table structure for table `job_start_constraints`
--

CREATE TABLE `job_start_constraints` (
  `job_id` int(11) DEFAULT NULL,
  `allowed_start_stream_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_start_constraints`
--

INSERT INTO `job_start_constraints` (`job_id`, `allowed_start_stream_id`) VALUES
(1, 1),
(1, 2),
(1, 9);

-- --------------------------------------------------------

--
-- Table structure for table `roadmaps`
--

CREATE TABLE `roadmaps` (
  `roadmap_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `current_level_id` int(11) DEFAULT NULL,
  `current_stream_id` int(11) DEFAULT NULL,
  `target_job_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roadmaps`
--

INSERT INTO `roadmaps` (`roadmap_id`, `user_id`, `current_level_id`, `current_stream_id`, `target_job_id`, `created_at`) VALUES
(95, 1, 9, NULL, 5, '2025-12-21 07:42:47'),
(96, 1, 14, NULL, 31, '2025-12-21 07:46:16'),
(97, 1, 13, NULL, 18, '2025-12-21 07:48:11'),
(98, 1, 37, NULL, 27, '2025-12-21 07:49:19'),
(99, 1, 1, NULL, 1, '2025-12-21 09:21:47'),
(100, 1, 1, NULL, 5, '2025-12-21 09:24:16'),
(101, 1, 3, NULL, 31, '2025-12-21 09:25:07'),
(102, 1, 9, NULL, 3, '2025-12-22 06:51:58'),
(103, 1, 1, NULL, 3, '2025-12-22 07:15:41'),
(104, 1, 9, NULL, 3, '2025-12-22 08:09:15');

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
  `exam_name` varchar(100) DEFAULT NULL,
  `step_type` enum('education','exam','job') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roadmap_steps`
--

INSERT INTO `roadmap_steps` (`step_id`, `roadmap_id`, `step_order`, `education_stage`, `stream_name`, `exam_name`, `step_type`) VALUES
(315, 95, 1, 'ITI', NULL, NULL, 'education'),
(316, 95, 2, 'Polytechnic Diploma', NULL, NULL, 'education'),
(317, 95, 3, NULL, 'Junior Technician', NULL, 'education'),
(318, 96, 1, 'BBA', NULL, NULL, 'education'),
(319, 96, 2, 'MBA', NULL, NULL, 'education'),
(320, 96, 3, NULL, NULL, 'CAT', 'education'),
(321, 96, 4, NULL, 'Management Consultant', NULL, 'education'),
(322, 97, 1, 'B.Com', NULL, NULL, 'education'),
(323, 97, 2, 'MBA', NULL, NULL, 'education'),
(324, 97, 3, NULL, 'Business Analyst', NULL, 'education'),
(325, 98, 1, 'BA', NULL, NULL, 'education'),
(326, 98, 2, 'MBA', NULL, NULL, 'education'),
(327, 98, 3, NULL, NULL, 'CAT', 'education'),
(328, 98, 4, 'Fellowships', NULL, NULL, 'education'),
(329, 98, 5, NULL, 'Assistant Professor', NULL, 'education'),
(330, 99, 1, 'ITI', NULL, NULL, 'education'),
(331, 99, 2, 'Polytechnic Diploma', NULL, NULL, 'education'),
(332, 99, 3, 'B.Tech', NULL, NULL, 'education'),
(333, 99, 4, NULL, NULL, 'JEE Lateral Entry', 'exam'),
(334, 99, 5, NULL, 'Software Engineer', NULL, 'job'),
(335, 100, 1, 'ITI', NULL, NULL, 'education'),
(336, 100, 2, NULL, 'Junior Technician', NULL, 'job'),
(337, 101, 1, 'BBA', NULL, NULL, 'education'),
(338, 101, 2, NULL, NULL, 'CAT', 'exam'),
(339, 101, 3, 'MBA', NULL, NULL, 'education'),
(340, 101, 4, NULL, 'Management Consultant', NULL, 'job'),
(341, 102, 1, 'ITI', NULL, NULL, 'education'),
(342, 102, 2, NULL, 'ITI Technician', NULL, 'education'),
(343, 103, 1, 'ITI', NULL, NULL, 'education'),
(344, 103, 2, NULL, NULL, 'ITI Entrance Exam', 'exam'),
(345, 103, 3, NULL, 'ITI Technician', NULL, 'job'),
(346, 104, 1, 'ITI', NULL, NULL, 'education'),
(347, 104, 2, NULL, 'ITI Technician', NULL, 'education');

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
(1, 1, 'Science(12th-PCM-PCB)', 'Science stream with PCM or PCB', '2 Years', 'Engineering, Medicine, Research'),
(2, 1, 'Diploma Engineering', 'Technical diploma after 10th (private or government colleges)\r\n', '3 Years', 'Lateral entry to B.Tech'),
(3, 2, 'Engineering', 'B.Tech Engineering degree', '4 Years', 'IT, Core, PSU jobs'),
(4, 2, 'Medicine', 'MBBS degree', '5.5 Years', 'Doctor, Specialist'),
(6, 1, 'Commerce (12th)\r\n', 'Commerce with Accounts, Business', '2 Years', 'CA, BBA, MBA, Finance'),
(7, 1, 'Arts (12th)\r\n', 'Arts and Humanities stream', '2 Years', 'Civil services, Law, Design'),
(9, 1, 'ITI', 'Industrial Training Institute courses', '1–2 Years', 'Technical & trade jobs'),
(10, 2, 'Pure Science (B.Sc)', 'Physics, Chemistry, Maths, Biology', '3 Years', 'Research, Teaching'),
(11, 2, 'Architecture (B.Arch)', 'Architecture and design', '5 Years', 'Architect'),
(12, 2, 'Pharmacy (B.Pharm)', 'Pharmaceutical sciences', '4 Years', 'Pharma industry'),
(13, 3, 'B.Com', 'Bachelor of Commerce', '3 Years', 'Accounting, Finance'),
(14, 3, 'BBA', 'Business Administration', '3 Years', 'Management, MBA'),
(15, 3, 'CA', 'Chartered Accountancy', '4–5 Years', 'Auditing, Finance'),
(16, 3, 'CS', 'Company Secretary', '3–4 Years', 'Corporate Law'),
(17, 1, 'Polytechnic Diploma', 'State board technical diploma with lateral entry eligibility\r\n', '3 Years', 'Industry & lateral entry'),
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
  `required` enum('Yes','Optional') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stream_exams`
--

INSERT INTO `stream_exams` (`id`, `stream_id`, `exam_id`, `required`) VALUES
(3, 18, 6, 'Optional'),
(4, 3, 1, 'Yes'),
(5, 3, 7, 'Optional'),
(6, 3, 9, 'Optional'),
(7, 4, 2, 'Yes'),
(8, 10, 8, 'Optional'),
(9, 11, 10, 'Yes'),
(10, 12, 9, 'Optional'),
(11, 33, 8, 'Optional'),
(12, 34, 2, 'Optional'),
(13, 13, 8, 'Optional'),
(14, 14, 14, 'Optional'),
(15, 15, 11, 'Yes'),
(16, 16, 12, 'Yes'),
(17, 35, 8, 'Optional'),
(18, 36, 8, 'Optional'),
(19, 37, 8, 'Optional'),
(20, 38, 13, 'Yes'),
(21, 39, 8, 'Optional'),
(22, 40, 8, 'Optional'),
(28, 41, 15, 'Yes'),
(31, 30, 8, 'Optional'),
(32, 23, 16, 'Yes'),
(33, 24, 17, 'Yes'),
(34, 24, 18, 'Optional'),
(35, 24, 19, 'Optional'),
(36, 25, 20, 'Yes'),
(37, 25, 21, 'Optional'),
(38, 26, 21, 'Optional'),
(40, 19, 23, 'Yes');

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
(1, 9, 3),
(2, 9, 4),
(3, 2, 5),
(4, 17, 5),
(5, 18, 6),
(6, 3, 1),
(7, 3, 2),
(8, 3, 7),
(9, 3, 8),
(10, 10, 9),
(11, 10, 7),
(12, 31, 7),
(13, 31, 30),
(14, 4, 10),
(15, 4, 11),
(16, 34, 12),
(17, 12, 13),
(18, 12, 14),
(19, 33, 6),
(20, 33, 9),
(21, 13, 15),
(22, 13, 20),
(23, 14, 18),
(24, 14, 19),
(25, 15, 16),
(26, 16, 16),
(27, 35, 20),
(28, 35, 29),
(29, 36, 17),
(30, 37, 21),
(31, 38, 22),
(32, 39, 23),
(33, 40, 24),
(34, 41, 25),
(35, 41, 26),
(36, 29, 1),
(37, 30, 1),
(38, 30, 7),
(39, 28, 1),
(40, 23, 9),
(41, 23, 30),
(42, 24, 31),
(43, 24, 18),
(44, 25, 9),
(45, 25, 30),
(46, 26, 22),
(47, 19, 27),
(48, 19, 28),
(49, 21, 28);

-- --------------------------------------------------------

--
-- Table structure for table `stream_progression`
--

CREATE TABLE `stream_progression` (
  `id` int(11) NOT NULL,
  `from_stream_id` int(11) DEFAULT NULL,
  `to_stream_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stream_progression`
--

INSERT INTO `stream_progression` (`id`, `from_stream_id`, `to_stream_id`, `priority`) VALUES
(45, 1, 3, 1),
(46, 1, 4, 1),
(47, 1, 10, 1),
(48, 1, 11, 1),
(49, 1, 12, 1),
(50, 1, 33, 1),
(51, 1, 34, 1),
(52, 6, 13, 1),
(53, 6, 14, 1),
(54, 6, 15, 1),
(55, 6, 16, 1),
(56, 6, 35, 1),
(57, 6, 36, 1),
(58, 7, 37, 1),
(59, 7, 38, 1),
(60, 7, 39, 1),
(61, 7, 40, 1),
(62, 7, 41, 1),
(63, 2, 29, 1),
(64, 17, 29, 1),
(65, 9, 17, 1),
(66, 18, 32, 1),
(67, 3, 23, 1),
(68, 3, 24, 2),
(69, 3, 27, 1),
(70, 3, 28, 1),
(71, 4, 25, 1),
(72, 4, 24, 1),
(73, 10, 25, 1),
(74, 10, 24, 1),
(75, 12, 25, 1),
(76, 12, 24, 1),
(77, 33, 25, 1),
(78, 33, 24, 1),
(79, 34, 25, 1),
(80, 34, 24, 1),
(81, 13, 24, 1),
(82, 13, 25, 1),
(83, 14, 24, 1),
(84, 15, 24, 1),
(85, 16, 26, 1),
(86, 16, 24, 1),
(87, 35, 25, 1),
(88, 35, 24, 1),
(89, 36, 24, 1),
(91, 37, 24, 1),
(92, 38, 26, 1),
(93, 39, 24, 1),
(94, 40, 25, 1),
(95, 40, 24, 1),
(96, 41, 24, 1),
(97, 23, 19, 1),
(98, 25, 19, 1),
(99, 26, 19, 1),
(100, 27, 19, 1),
(101, 24, 21, 1),
(102, 24, 22, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `auth_token` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `created_at`, `auth_token`) VALUES
(1, 'Test User', 'testuser@gmail.com', '12345', '2025-12-20 13:10:04', NULL),
(2, 'Test User', 'test@gmail.com', '$2y$10$IgajxScaQAknoquXeXRvjev3jYe.BR.1ZbhDQ6K5UADvnFjVSp2QC', '2025-12-21 10:36:51', '03ab097b83e5f7680d31a3008101363897e7df31db22acf7eea4723c57f0f10f'),
(3, 'Test User', 'user@gmail.com', '112233', '2025-12-22 04:35:06', '5f0c40476c9262d303c72bbe8cbe1f6ad69e05284b03e2b8270c2605721ad22e'),
(5, 'User', 'usertest@gmail.com', '$2y$10$A91CfjPJ8d512/a/1zVxKOFmlwdquBtXYnuHF3XJ4nMHv0OVsxSiq', '2025-12-22 05:09:25', NULL),
(6, 'Student', 'student@gmail.com', '$2y$10$uSBVOBEWabgnhkvA09Uck.JeZE/MLRSczadOhWe9UQtiA2bYb3iie', '2025-12-22 06:44:43', NULL),
(7, 'Stud', 'stud@gmail.com', '$2y$10$TMI1LzyEOE.tqP6cVaS2yuH.Z9WoItE/sN5lr4OW9NVjJiLV41vx2', '2025-12-22 07:45:49', '08531ac9d112b1e62fd07f87d8eb7f98f60d28b90cc8f084c26e8f982fb07b07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ai_chat_history`
--
ALTER TABLE `ai_chat_history`
  ADD PRIMARY KEY (`chat_id`);

--
-- Indexes for table `career_path_rules`
--
ALTER TABLE `career_path_rules`
  ADD PRIMARY KEY (`job_id`);

--
-- Indexes for table `career_rules`
--
ALTER TABLE `career_rules`
  ADD PRIMARY KEY (`job_id`);

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
  ADD UNIQUE KEY `unique_stream_exam` (`stream_id`,`exam_id`),
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
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `roadmaps`
--
ALTER TABLE `roadmaps`
  MODIFY `roadmap_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `roadmap_steps`
--
ALTER TABLE `roadmap_steps`
  MODIFY `step_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=350;

--
-- AUTO_INCREMENT for table `streams`
--
ALTER TABLE `streams`
  MODIFY `stream_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `stream_exams`
--
ALTER TABLE `stream_exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `stream_jobs`
--
ALTER TABLE `stream_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `stream_progression`
--
ALTER TABLE `stream_progression`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
