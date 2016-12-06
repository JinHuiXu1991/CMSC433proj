-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 11, 2016 at 09:03 PM
-- Server version: 5.5.47-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `scripting`
--

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE IF NOT EXISTS `classes` (
  `courseNum` varchar(8) NOT NULL,
  `name` text NOT NULL,
  `required` tinyint(1) DEFAULT NULL,
  `taken` tinyint(1) NOT NULL,
  `credits` int(11) NOT NULL,
  `elective` tinyint(1) NOT NULL,
  `satisfied` tinyint(1) NOT NULL,
  `department` varchar(4) NOT NULL,
  `prerequisites` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`courseNum`, `name`, `required`, `taken`, `credits`, `elective`, `satisfied`, `department`, `prerequisites`) VALUES
('CMSC201', 'Computer Science I for Majors', 1, 1, 4, 0, 0, 'CMSC', ''),
('CMSC202', 'Computer Science II for Majors', 1, 1, 4, 0, 0, 'CMSC', 'CMSC201'),
('CMSC203', 'Discrete Structures', 1, 1, 3, 0, 0, 'CMSC', 'CMSC201 CMSC202'),
('CMSC304', 'Social and Ethical Issues in Information Technology', 1, 1, 3, 0, 0, 'CMSC', 'CMSC201 CMSC202'),
('CMSC313', 'Computer Organization and Assembly Language Programming', 1, 1, 3, 0, 0, 'CMSC', 'CMSC201 CMSC202 CMSC203'),
('CMSC331', 'Principles of Programming Languages', 1, 1, 3, 0, 0, 'CMSC', 'CMSC201 CMSC202 CMSC203'),
('CMSC341', 'Data Structures', 1, 1, 3, 0, 0, 'CMSC', 'CMSC201 CMSC202 CMSC203'),
('CMSC411', 'Computer Architecture', 1, 0, 3, 0, 1, 'CMSC', 'CMSC201 CMSC202 CMSC203 CMSC313'),
('CMSC421', 'Principles of Operating Systems', 1, 0, 3, 0, 1, 'CMSC', 'CMSC201 CMSC202 CMSC203 CMSC313 CMSC341'),
('CMSC441', 'Design and Analysis of Algorithms', 1, 0, 3, 0, 1, 'CMSC', 'CMSC201 CMSC202 CMSC203 CMSC341'),
('CMSC447', 'Software Engineering I', 1, 0, 3, 0, 1, 'CMSC', 'CMSC201 CMSC202 CMSC203 CMSC341'),
('CMSC426', 'Principles of Computer Security', 0, 0, 3, 1, 1, 'CMSC', 'CMSC201 CMSC202 CMSC203 CMSC331 CMSC341'),
('CMSC431', 'Compiler Design Principles', 0, 0, 3, 1, 1, 'CMSC', 'CMSC201 CMSC202 CMSC203 CMSC331 CMSC341'),
('CMSC435', 'Computer Graphics', 0, 0, 3, 1, 1, 'CMSC', 'CMSC201 CMSC202 CMSC203 CMSC313 CMSC341'),
('CMSC437', 'Graphical User Interface Programming', 0, 0, 3, 1, 0, 'CMSC', 'CMSC341 MATH221'),
('CMSC448', 'Software Engineering II', 0, 0, 3, 1, 0, 'CMSC', 'CMSC201 CMSC202 CMSC203 CMSC341 CMSC447'),
('CMSC451', 'Automata Theory and Formal Languages', 0, 0, 3, 1, 1, 'CMSC', 'CMSC201 CMSC202 CMSC203'),
('CMSC455', 'Numerical Computations', 0, 0, 3, 1, 1, 'CMSC', 'CMSC201 CMSC202 CMSC203 CMSC341'),
('CMSC456', 'Symbolic Computation', 0, 0, 3, 1, 1, 'CMSC', 'CMSC201 CMSC202 CMSC203 CMSC341'),
('CMSC461', 'Database Management Systems', 0, 0, 3, 1, 1, 'CMSC', 'CMSC201 CMSC202 CMSC203 CMSC341'),
('CMSC471', 'Introduction to Artificial Intelligence', 0, 0, 3, 1, 1, 'CMSC', 'CMSC201 CMSC202 CMSC203 CMSC341'),
('CMSC479', 'Introduction to Robotics', 0, 0, 3, 1, 0, 'CMSC', 'CMSC471'),
('CMSC481', 'Computer Networks', 0, 0, 3, 1, 1, 'CMSC', 'CMSC201 CMSC202 CMSC203 CMSC341'),
('CMSC483', 'Parallel and Distributed Processing', 0, 0, 3, 1, 0, 'CMSC', 'CMSC201 CMSC202 CMSC203 CMSC313 CMSC341 CMSC421'),
('CMSC493', 'Capstone Games Group Project', 0, 0, 3, 1, 0, 'CMSC', 'CMSC435 CMSC471'),
('CHEM101', 'Principles of Chemistry I', 0, 0, 4, 1, 1, 'SCI', ''),
('CHEM102', 'Principles of Chemistry II', 0, 0, 4, 1, 0, 'SCI', 'CHEM101'),
('BIO141', 'Foundations of Biology: Cells, Energy and Organisms', 0, 0, 4, 1, 1, 'SCI', ''),
('BIO142', 'Foundations of Biology: Ecology and Evolution', 0, 0, 4, 1, 1, 'SCI', ''),
('BIO301', 'Ecology and Evolution', 0, 0, 3, 1, 0, 'SCI', 'BIO141'),
('BIO302', 'Molecular and General Genetics', 0, 0, 4, 1, 0, 'SCI', 'BIO141 MATH151'),
('BIO302L', 'Molecular and General Genetics Lab', 0, 0, 2, 1, 0, 'SCI', 'BIO141 MATH151'),
('BIO303', 'Cell Biology', 0, 0, 4, 1, 0, 'SCI', 'BIO302 CHEM102 MATH151'),
('BIO303L', 'Cell Biology Lab', 0, 0, 2, 1, 0, 'SCI', 'BIO302 CHEM102 MATH151'),
('BIO304', 'Plant Biology', 0, 0, 3, 1, 0, 'SCI', 'BIO303'),
('BIO304L', 'Plant Biology Lab', 0, 0, 2, 1, 0, 'SCI', 'BIO303'),
('BIO305', 'Comparative Animal Physiology', 0, 0, 3, 1, 0, 'SCI', 'BIO303'),
('BIO305L', 'Comparative Animal Physiology Lbal', 0, 0, 2, 1, 0, 'SCI', 'BIO303'),
('PHYS121', 'Introductory Physics I', 0, 0, 4, 1, 1, 'SCI', ''),
('PHYS122', 'Introductory Physics II', 0, 0, 4, 1, 0, 'SCI', 'PHYS121'),
('GES110', 'Physical Geography', 0, 0, 3, 1, 1, 'SCI', ''),
('GES120', 'Environmental Science and Conservation', 0, 0, 3, 1, 1, 'SCI', ''),
('STAT355', 'Introduction to Probability and Statistics for Scientists an', 1, 0, 4, 0, 0, 'STAT', 'MATH151 MATH152'),
('MATH151', 'Calculus and Analytic Geometry I', 1, 0, 4, 0, 1, 'MATH', ''),
('MATH152', 'Calculus and Analytic Geometry II', 1, 0, 4, 0, 0, 'MATH', 'MATH151'),
('MATH221', 'Introduction to Linear Algebra', 1, 0, 3, 0, 0, 'MATH', 'MATH151 MATH152'),
('MATH225', 'Introduction to Differential Equations', 0, 0, 3, 1, 0, 'MATH', 'MATH152'),
('MATH251', 'Multivariable Calculus', 0, 0, 3, 1, 0, 'MATH', 'MATH152'),
('MATH301', 'Introduction to Mathematical Analysis 1', 0, 0, 4, 1, 0, 'MATH', 'MATH152 MATH221'),
('MATH381', 'Linear Methods in Operations Research', 0, 0, 3, 1, 0, 'MATH', 'MATH221'),
('MATH430', 'Matrix Analysis', 0, 0, 3, 1, 0, 'MATH', 'MATH251 MATH301'),
('MATH441', 'Introduction to Numerical Analysis', 0, 0, 3, 1, 0, 'MATH', 'CMSC201 MATH225 MATH251 MATH301'),
('MATH452', 'Introduction to Stochastic Processes', 0, 0, 3, 1, 0, 'MATH', 'STAT355'),
('MATH475', 'Combinatorics and Graph Theory', 0, 0, 3, 1, 0, 'MATH', 'MATH301'),
('MATH481', 'Mathematical Modelling', 0, 0, 3, 1, 0, 'MATH', 'MATH221 MATH225 MATH251'),
('MATH483', 'Linear Combinatorial Optimization', 0, 0, 3, 1, 0, 'MATH', 'MATH381');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
