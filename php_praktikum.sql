-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2023 at 07:26 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `php_praktikum`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(3) NOT NULL,
  `address_line` varchar(150) NOT NULL,
  `address_number` varchar(20) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip_code` varchar(20) NOT NULL,
  `country` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `address_line`, `address_number`, `city`, `state`, `zip_code`, `country`, `created_at`) VALUES
(9, 'Maple Street', '123', 'Los Angeles', 'California', '90001', 'United States', '2023-04-16 17:38:35'),
(10, 'Oxford Road', '12', 'London', 'London', '90001', 'United Kingdom', '2023-04-16 17:41:01'),
(11, 'Test', '12', 'Test', 'Test', '3333333', 'Test', '2023-04-17 20:11:59'),
(12, '', '', '', '', '', '', '2023-04-23 10:40:49'),
(13, '', '', '', '', '', '', '2023-04-23 10:41:17'),
(14, '', '', '', '', '', '', '2023-04-23 10:42:05'),
(15, 'asda', 'sd', '', '', '', '', '2023-05-09 22:00:53'),
(16, 'asdas', '', '', '', '', '', '2023-05-09 22:01:28'),
(17, 'asdasd', 'asdasd', 'asd', 's', 'asd', 'a', '2023-05-09 22:01:38'),
(18, 'asd', 'asd', 'asd', '', '', '', '2023-05-09 22:01:54'),
(19, 'Test', '1', 'Test', 'Test', '1234456', 'Test', '2023-05-09 22:26:53'),
(20, 'Test', '12', 'Test', 'Test', '123456', 'Test', '2023-05-09 22:27:52'),
(21, 'Test', '1', 'Test', 'Test', '12345', 'Test', '2023-05-09 22:29:05'),
(22, 'Test', '12', 'Test', 'Test', '1213421', 'Test', '2023-05-09 22:30:55'),
(23, 'Test', '2', 'Test', 'Test', '12312312', 'Test', '2023-05-09 22:35:13'),
(24, 'Test', '2', 'Test', 'Test', '23123123', 'Test', '2023-05-09 22:37:11'),
(25, 'Test', '32', 'Test', 'Test', '123123123', 'Test', '2023-05-09 22:38:49'),
(26, 'Test', '2', 'Test', 'Test', '234234234', 'Test', '2023-05-09 22:40:01'),
(27, 'Test', '324', 'Test', 'Test', '234234234', 'Test', '2023-05-09 22:41:36'),
(28, 'Test', '2', 'Test', 'Test', '123123213', 'Test', '2023-05-09 22:42:14'),
(29, 'Test', '23', 'Test', 'Test', '212312312321', 'Test', '2023-05-09 22:42:39'),
(30, 'Test', '2', 'Test', 'Test', '123123123', 'Test', '2023-05-09 22:43:07'),
(31, 'Test', '1', 'Test', 'Test', '1212312', 'Test', '2023-05-09 22:49:13'),
(32, 'Test', '23', 'Teas', 'Teas', '1231232', 'Teas', '2023-05-09 22:50:31'),
(33, 'Test', '23', 'Test', 'Test', '1212121', 'Test', '2023-05-09 22:53:55'),
(34, 'Test', '2', 'Test', 'Test', '1212121', 'Test', '2023-05-09 23:09:47'),
(35, 'Test', '12', 'Test', 'Test', '12121', 'Test', '2023-05-09 23:11:28'),
(36, 'Test', '122', 'Test', 'Test', '1212121', 'Test', '2023-05-09 23:12:09'),
(37, 'Test', '12', 'Test', 'Test', '121221', 'Test', '2023-05-09 23:13:11'),
(38, 'Test', '12', 'Test', 'Test', '123123', 'Test', '2023-05-09 23:15:26'),
(39, 'Test', '12', 'Test', 'Test', '121212', 'Test', '2023-05-10 15:02:50'),
(40, 'Maple Street', '12344', 'Los Angeles', 'California', '90001', 'United States', '2023-05-31 18:22:44'),
(41, 'Test', '1212', 'Test', 'Test', '12122', 'Test', '2023-06-02 15:11:57'),
(42, 'Test', '12121', 'Test', 'Test', '12121', 'Test', '2023-06-02 15:13:24');

-- --------------------------------------------------------

--
-- Table structure for table `avatar`
--

CREATE TABLE `avatar` (
  `id` int(11) NOT NULL,
  `src` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `avatar`
--

INSERT INTO `avatar` (`id`, `src`, `created_at`, `user_id`) VALUES
(7, '7.jpg', '2023-04-16 17:28:54', 25),
(8, '8.jpg', '2023-04-16 17:33:13', 26),
(9, '9.jpg', '2023-04-16 17:38:35', 27),
(10, '10.jpg', '2023-04-16 17:41:01', 28),
(11, '11.jpg', '2023-04-16 17:44:23', 29),
(12, '12.jpg', '2023-04-23 10:45:28', 33),
(13, '13.jpg', '2023-04-23 10:56:28', 32),
(14, '14.jpg', '2023-04-23 11:01:36', 34),
(15, '15.jpg', '2023-04-23 11:05:10', 36),
(16, '16.jpg', '2023-04-23 11:05:47', 35),
(17, '17.jpg', '2023-04-23 11:07:05', 37),
(18, '18.jpg', '2023-04-23 11:08:25', 38),
(19, '19.jpg', '2023-04-23 11:09:48', 39),
(20, '20.jpg', '2023-04-23 11:11:30', 40),
(21, '21.jpg', '2023-04-23 11:17:57', 42),
(22, '22.jpg', '2023-04-23 11:20:40', 43),
(23, '23.jpg', '2023-04-23 11:22:17', 44),
(24, '24.jpg', '2023-04-23 11:23:43', 45),
(25, '25.jpg', '2023-04-23 11:26:12', 47),
(26, '26.jpg', '2023-04-23 11:27:38', 48),
(27, '27.jpg', '2023-04-23 11:29:19', 49),
(28, '28.jpg', '2023-04-23 11:31:34', 50),
(29, '29.jpg', '2023-04-23 11:33:17', 51),
(30, '30.jpg', '2023-04-23 11:39:53', 41),
(31, '31.jpg', '2023-04-23 11:40:30', 46);

-- --------------------------------------------------------

--
-- Table structure for table `biography`
--

CREATE TABLE `biography` (
  `id` int(4) NOT NULL,
  `biography_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `biography`
--

INSERT INTO `biography` (`id`, `biography_text`, `created_at`, `updated_at`, `user_id`) VALUES
(2, 'er er er er df', '2023-04-18 12:40:06', NULL, 30),
(3, ' Born in Torquay in 1890, Agatha Christie began writing during the First World War and wrote over 100 novels, plays and short story collections. She was still writing to great acclaim until her death, and her books have now sold over a billion copies in English and another billion in over 100 foreign languages. Yet Agatha Christie was always a very private person, and though Hercule Poirot and Miss Marple became household names, the Queen of Crime was a complete enigma to all but her closest friends.', '2023-04-23 10:36:59', NULL, 32),
(4, ' Sir Arthur Conan Doyle was born in Edinburgh in 1859 and died in 1930. Within those years was crowded a variety of activity and creative work that made him an international figure and inspired the French to give him the epithet \'the good giant\'. He was the nephew of \'Dickie Doyle\' the artist, and was educated at Stonyhurst, and later studied medicine at Edinburgh University, where the methods of diagnosis of one of the professors provided the idea for the methods of deduction used by Sherlock Holmes.', '2023-04-23 10:45:29', NULL, 33),
(5, ' Bill Bryson was born in Des Moines, Iowa. For twenty years he lived in England, where he worked for the Times and the Independent, and wrote for most major British and American publications. His books include travel memoirs (Neither Here Nor There; The Lost Continent; Notes from a Small Island) and books on language (The Mother Tongue; Made in America). His account of his attempts to walk the Appalachian Trail, A Walk in the Woods, was a huge New York Times bestseller. He lives in Hanover, New Hampshire, with his wife and his four children.', '2023-04-23 11:01:36', NULL, 34),
(6, 'Paul Theroux was born and educated in the United States. After graduating from university in 1963, he travelled first to Italy and then to Africa, where he worked as a Peace Corps teacher at a bush school in Malawi, and as a lecturer at Makerere University in Uganda. In 1968 he joined the University of Singapore and taught in the Department of English for three years. Throughout this time he was publishing short stories and journalism, and wrote a number of novels. Among these were Fong and the Indians, Girls at Play and Jungle Lovers, all of which appear in one volume, On the Edge of the Great Rift (Penguin, 1996).', '2023-04-23 11:03:06', NULL, 35),
(7, 'Dale Carnegie (1888-1955) described himself as a \"simple country boy\" from Missouri but was also a pioneer of the self-improvement genre. Since the 1936 publication of his first book, How to Win Friends and Influence People, he has touched millions of readers and his classic works continue to impact lives to this day.', '2023-04-23 11:05:10', NULL, 36),
(8, 'Tony Robbins is a bestselling author, entrepreneur, and philanthropist. For more than thirty-nine years, millions of people have enjoyed the warmth, humor, and the transformational power of Mr. Robbins\'s business and personal development events. He is the nation\'s #1 life and business strategist. He\'s called upon to consult and coach some of the world\'s finest athletes, entertainers, Fortune 500 CEOs, and even presidents of nations. Robbins is the chairman of a holding company comprised of more than a dozen businesses with combined sales exceeding five billion dollars a year. His philanthropic efforts helped provide more than 100 million meals in the last year alone. He lives in Palm Beach, Florida.', '2023-04-23 11:07:05', NULL, 37),
(9, 'Julia Child was born in Pasadena, California. She was graduated from Smith College and worked for the OSS during World War II in Ceylon and China, where she met Paul Child. After they married they lived in Paris, where she studied at the Cordon Bleu and taught cooking with Simone Beck and Louisette Bertholle, with whom she wrote the first volume of Mastering the Art of French Cooking (1961). In 1963, Boston\'s WGBH launched The French Chef television series, which made her a national celebrity, earning her the Peabody Award in 1965 and an Emmy in 1966. Several public television shows and numerous cookbooks followed. She died in 2004.', '2023-04-23 11:08:25', NULL, 38),
(10, 'Jamie Oliver is a global phenomenon in food and campaigning. During a 20-year television and publishing career he has inspired millions of people to enjoy cooking from scratch and eating fresh, delicious food. Through his organization, Jamie is leading the charge on a global food revolution, aiming to reduce childhood obesity and improve everyone\'s health and happiness through food.', '2023-04-23 11:09:48', NULL, 39),
(11, 'Levy is editor at large at Wired. Previous positions include editor in chief at Backchannel; and chief technology writer and a senior editor for Newsweek. In early 2020, his book \"Facebook: The Inside Story\" will appear, the product of over three years studying the company, which granted unprecedented access to its employees and executives. Levy has written previous seven books and has had articles published in Harper\'s, Macworld, The New York Times Magazine, The New Yorker, Premiere, and Rolling Stone. Steven has won several awards during his 30+ years of writing about technology, including Hackers, which PC Magazine named the best Sci-Tech book written in the last twenty years and, Crypto, which won the grand eBook prize at the 2001 Frankfurt Book festival. \"In the Plex,\" the definitive book on Google, was named the Best Business Book of 2011 on both Amazon and Audible.', '2023-04-23 11:11:30', NULL, 40),
(12, 'Walter Isaacson, University Professor of History at Tulane, has been CEO of the Aspen Institute, chairman of CNN, and editor of Time magazine. He is the author of Leonardo da Vinci; Steve Jobs; Einstein: His Life and Universe; Benjamin Franklin: An American Life; and Kissinger: A Biography. He is also the coauthor of The Wise Men: Six Friends and the World They Made.', '2023-04-23 11:14:46', NULL, 41),
(13, 'J.K. Rowling is best-known as the author of the seven Harry Potter books, which were published between 1997 and 2007. The enduringly popular adventures of Harry, Ron and Hermione have gone on to sell over 600 million copies worldwide, be translated into 85 languages and made into eight blockbuster films.', '2023-04-23 11:17:57', NULL, 42),
(14, 'Stephen King is the author of more than fifty books, all of them worldwide bestsellers. His first crime thriller featuring Bill Hodges, MR MERCEDES, won the Edgar Award for best novel and was shortlisted for the CWA Gold Dagger Award. Both MR MERCEDES and END OF WATCH received the Goodreads Choice Award for the Best Mystery and Thriller of 2014 and 2016 respectively.', '2023-04-23 11:20:40', NULL, 43),
(15, 'Theodor Seuss Geisel—aka Dr. Seuss—is one of the most beloved children\'s book authors of all time. From The Cat in the Hat to Oh, the Places You\'ll Go!, his iconic characters, stories, and art style have been a lasting influence on generations of children and adults. The books he wrote and illustrated under the name Dr. Seuss (and others that he wrote but did not illustrate, including some under the pseudonyms Theo. LeSieg and Rosetta Stone) have been translated into 45 languages. Hundreds of millions of copies have found their way into homes and hearts around the world. Dr. Seuss\'s long list of awards includes Caldecott Honors, the Pulitzer Prize, and eight honorary doctorates. Works based on his original stories have won three Oscars, three Emmys, three Grammys, and a Peabody.', '2023-04-23 11:22:17', NULL, 44),
(16, 'The son of Norwegian parents, Roald Dahl was born in Wales in 1916 and educated at Repton. He was a fighter pilot for the RAF during World War Two, and it was while writing about his experiences during this time that he started his career as an author.', '2023-04-23 11:23:43', NULL, 45),
(17, 'Nicholas Sparks is one of the world\'s most beloved storytellers. All of his books have been New York Times bestsellers, with over 105 million copies sold worldwide, in more than 50 languages, including over 75 million copies in the United States alone.', '2023-04-23 11:24:43', NULL, 46),
(18, 'Nora Roberts is the #1 New York Times bestselling author of more than 200 novels, including Shelter in Place, Year One, Come Sundown, and many more. She is also the author of the bestselling In Death series written under the pen name J.D. Robb. There are more than five hundred million copies of her books in print.', '2023-04-23 11:26:12', NULL, 47),
(19, 'Doris Kearns Goodwin\'s interest in leadership began more than half a century ago as a professor at Harvard. Her experiences working for LBJ in the White House and later assisting him on his memoirs led to her bestselling Lyndon Johnson and the American Dream. She followed up with the Pulitzer Prize-winning No Ordinary Time: Franklin & Eleanor Roosevelt: The Home Front in World War II. Goodwin earned the Lincoln Prize for the runaway bestseller Team of Rivals, the basis for Steven Spielberg\'s Academy Award-winning film Lincoln, and the Carnegie Medal for The Bully Pulpit, the New York Times bestselling chronicle of the friendship between Theodore Roosevelt and William Howard Taft. She lives in Concord, Massachusetts, with her husband, the writer Richard N. Goodwin. More at www.doriskearnsgoodwin.com @DorisKGoodwin', '2023-04-23 11:27:38', NULL, 48),
(20, 'David McCullough has twice received the Pulitzer Prize, for Truman and John Adams, and twice received the National Book Award, for The Path Between the Seas and Mornings on Horseback; His other widely praised books are 1776, Brave Companions, The Great Bridge, and The Johnstown Flood. He has been honored with the National Book Foundation Distinguished Contribution to American Letters Award, the National Humanities Medal, and the Presidential Medal of Freedom.', '2023-04-23 11:29:19', NULL, 49),
(21, 'Malcolm Gladwell has been a staff writer at The New Yorker since 1996. He is the author of The Tipping Point, Blink, Outliers, and What the Dog Saw. Prior to joining The New Yorker, he was a reporter at the Washington Post. Gladwell was born in England and grew up in rural Ontario. He now lives in New York.', '2023-04-23 11:31:34', NULL, 50),
(22, 'Michael Lewis, the best-selling author of The Undoing Project, Liar\'s Poker, Flash Boys, Moneyball, The Blind Side, Home Game and The Big Short, among other works, lives in Berkeley, California, with his wife, Tabitha Soren, and their three children.', '2023-04-23 11:32:31', NULL, 51);

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `page_count` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `release_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  `publisher_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id`, `name`, `page_count`, `price`, `release_date`, `description`, `status`, `created_at`, `deleted_at`, `publisher_id`, `user_id`, `image_id`) VALUES
(4, 'Murder on the Orient Express', 289, '17', '2011-01-17 23:00:00', 'THE MOST WIDELY READ MYSTERY OF ALL TIME-NOW A MAJOR MOTION PICTURE DIRECTED BY KENNETH BRANAGH AND PRODUCED BY RIDLEY SCOTT!\r\n\r\n\"The murderer is with us-on the train now . . .\"\r\n\r\nJust after midnight, the famous Orient Express is stopped in its tracks by a snowdrift. By morning, the millionaire Samuel Edward Ratchett lies dead in his compartment, stabbed a dozen times, his door locked from the inside. Without a shred of doubt, one of his fellow passengers is the murderer.\r\n', 1, '2023-04-25 20:40:03', NULL, 16, 32, 7),
(5, 'And Then There Were None123', 303, '16', '2011-03-25 23:00:00', 'If you\'re one of the few who haven\'t experienced the genius of Agatha Christie, this novel is a stellar starting point.\" - DAVID BALDACCI, #1 New York Times Bestselling Author\r\n\r\nAn exclusive authorized edition of the most famous and beloved stories from the Queen of Mystery.\r\n\r\nTen people, each with something to hide and something to fear, are invited to an isolated mansion on Indian Island by a host who, surprisingly, fails to appear. On the island they are cut off from everything but each other and the inescapable shadows of their own past lives. One by one, the guests share the darkest secrets of their wicked pasts. And one by one, they die…', 1, '2023-04-25 20:53:23', NULL, 16, 32, 8),
(6, 'The Murder of Roger Ackroyd123', 306, '15', '2018-12-30 23:00:00', 'The Murder of Roger Ackroyd is a work of detective fiction by British writer Agatha Christie, first published in June 1926 in the United Kingdom. It is the third novel to feature Hercule Poirot as the lead detective.\r\n\r\nIn 2013, the British Crime Writers\' Association voted it the best crime novel ever.', 1, '2023-04-26 16:09:22', NULL, 16, 32, 9),
(7, 'Midwinter Murder', 306, '31', '2020-07-03 22:00:00', '\"Reading a perfectly plotted Agatha Christie is like crunching into a perfect apple: that pure, crisp, absolute satisfaction.\" -Tana French, New York Times bestselling author of the Dublin Murder Squad novels\r\n\r\nAn all-new collection of winter-themed stories from the Queen of Mystery, just in time for the holidays-including the original version of \"Christmas Adventure,\" never before released in the United States!\r\nThere\'s a chill in the air and the days are growing shorter . . . It\'s the perfect time to curl up in front of a crackling fire with these wintry whodunits from the legendary Agatha Christie. But beware of deadly snowdrifts and dangerous gifts, poisoned meals and mysterious guests. This chilling compendium of short stories-some featuring beloved detectives Hercule Poirot and Miss Marple-is an essential omnibus for Christie fans and the perfect holiday gift for mystery lovers.\r\n', 1, '2023-04-26 17:07:28', NULL, 16, 32, 10),
(8, 'The Mysterious Affair at Styles', 185, '9', '2020-01-01 23:00:00', 'One morning at Styles Court, an Essex country manor, the elderly owner is found dead of strychnine poisoning. Arthur Hastings, a soldier staying there on sick leave from the Western Front, ventures out to the nearby village of Styles St. Mary to ask help from his friend Hercule Poirot, an eccentric Belgian inspector. Thus, in this classic whodunit, one of the most famous characters in detective fiction makes his debut on the world stage. With a half dozen suspects who all harbor secrets, it takes all of Poirot\'s prodigious sleuthing skills to untangle the mystery-but not before the inquiry undergoes scores of spellbinding twists and surprises. Contains the original illustrations and a detailed biography.', 1, '2023-04-26 17:09:23', NULL, 16, 32, 11),
(9, 'Death on the Nile', 320, '14', '2005-06-02 22:00:00', '\"A top-notch literary brainteaser.\" -New York Times\r\n\r\nSoon to be a major motion picture sequel to Murder on the Orient Express with a screenplay by Michael Green, directed by and starring Kenneth Branagh alongside Gal Gadot-coming February 11, 2022!\r\n\r\nThe tranquility of a luxury cruise along the Nile was shattered by the discovery that Linnet Ridgeway had been shot through the head. She was young, stylish, and beautiful. A girl who had everything . . . until she lost her life', 1, '2023-04-26 17:11:42', NULL, 16, 32, 12),
(10, 'The Murder at the Vicarage', 305, '29', '2009-03-14 23:00:00', 'The Murder at the Vicarage is Agatha Christie\'s first mystery to feature the beloved investigator Miss Marple-as a dead body in a clergyman\'s study proves to the indomitable sleuth that no place, holy or otherwise, is a sanctuary from homicide.\r\n\r\nMiss Marple encounters a compelling murder mystery in the sleepy little village of St. Mary Mead, where under the seemingly peaceful exterior of an English country village lurks intrigue, guilt, deception and death.\r\n\r\n\r\nColonel Protheroe, local magistrate and overbearing land-owner is the most detested man in the village. Everyone--even in the vicar--wishes he were dead. And very soon he is--shot in the head in the vicar\'s own study. Faced with a surfeit of suspects, only the inscrutable Miss Marple can unravel the tangled web of clues that will lead to the unmasking of the killer.', 1, '2023-04-26 17:13:14', NULL, 16, 32, 13),
(11, 'The Hollow', 272, '18', '2006-07-03 22:00:00', 'Agatha Christie\'s classic, The Hollow, finds Poirot entangled in a nasty web of family secrets when he comes across a fresh murder at an English country manor.\r\n\r\nA far-from-warm welcome greets Hercule Poirot as he arrives for lunch at Lucy Angkatell\'s country house. A man lies dying by the swimming pool, his blood dripping into the water. His wife stands over him, holding a revolver.\r\n\r\nAs Poirot investigates, he begins to realize that beneath the respectable surface lies a tangle of family secrets and everyone becomes a suspect.', 1, '2023-04-26 17:15:10', NULL, 16, 32, 14),
(12, 'A Murder Is Announced', 240, '27', '2009-06-17 22:00:00', 'The villagers of Chipping Cleghorn, including Jane Marple, are agog with curiosity over an advertisement in the local gazette which read: \'A murder is announced and will take place on Friday October 29th, at Little Paddocks at 6:30 p.m.\' Unable to resist the mysterious invitation, a crowd begins to gather at Little Paddocks at the pointed time when, without warning, the lights go out ...', 1, '2023-04-26 17:16:33', NULL, 16, 32, 15),
(13, 'Sparkling Cyanide', 288, '9', '2009-03-25 23:00:00', 'In Sparkling Cyanide, Agatha Christie seats six-including a murderer-around a dining table set for seven, one year to the day that a beautiful heiress was poisoned in that very room.\r\n\r\nSix people sit down to a sumptuous meal at a table laid for seven. In front of the empty place is a sprig of rosemary-\\\"rosemary for remembrance.\\\" A strange sentiment considering no one is likely to forget the night, exactly a year ago, that Rosemary Barton died at exactly the same table, her beautiful face unrecognizable, convulsed with pain and horror.\r\n\r\nBut then Rosemary had always been memorable-she had the ability to arouse strong passions in most people she met. In one case, strong enough to kill. . . .', 1, '2023-04-26 17:17:42', NULL, 16, 32, 16),
(14, 'The Adventures Of Sherlock Holmes', 148, '10', '2022-03-10 23:00:00', 'The Adventures of Sherlock Holmes is a collection of twelve short stories by Arthur Conan Doyle, first published on 14 October 1892. It contains the earliest short stories featuring the consulting detective Sherlock Holmes, which had been published in twelve monthly issues of The Strand Magazine from July 1891 to June 1892. The stories are collected in the same sequence, which is not supported by any fictional chronology. The only characters common to all twelve are Holmes and Dr. Watson and all are related in first-person narrative from Watson\'s point of view.\r\n\r\nIn general the stories in The Adventures of Sherlock Holmes identify, and try to correct, social injustices. Holmes is portrayed as offering a new, fairer sense of justice. The stories were well received, and boosted the subscriptions figures of The Strand Magazine, prompting Doyle to be able to demand more money for his next set of stories. The first story, \\\"A Scandal in Bohemia\\\", includes the character of Irene Adler, who, despite being featured only within this one story by Doyle, is a prominent character in modern Sherlock Holmes adaptations, generally as a love interest for Holmes. Doyle included four of the twelve stories from this collection in his twelve favourite Sherlock Holmes stories, picking \"The Adventure of the Speckled Band\" as his overall favourite.\r\n\r\n', 1, '2023-04-26 17:26:13', NULL, 17, 33, 17),
(15, 'The Hound of the Baskervilles', 208, '9', '2019-06-22 22:00:00', 'The Hound of the Baskervilles is the third of the four crime novels written by Sir Arthur Conan Doyle featuring the detective Sherlock Holmes. Originally serialised in The Strand Magazine from August 1901 to April 1902, it is set largely on Dartmoor in Devon in England\'s West Country and tells the story of an attempted murder inspired by the legend of a fearsome, diabolical hound of supernatural origin. Sherlock Holmes and his companion Dr. Watson investigate the case. This was the first appearance of Holmes since his apparent death in \"The Final Problem\", and the success of The Hound of the Baskervilles led to the character\'s eventual revival.', 1, '2023-04-26 17:27:18', NULL, 17, 33, 18),
(16, 'A Study in Scarlet', 142, '6', '2018-04-02 22:00:00', 'A Study in Scarlet first appeared in 1887 in Beeton\'s Christmas Annual and was marked the first appearance of Sherlock Holmes and Dr. Watson, who would become the most famous detective duo in popular fiction. The book\'s title derives from a speech given by Holmes, a consulting detective, to his friend and chronicler Watson on the nature of his work, in which he describes the story\'s murder investigation as his \\\"study in scarlet\\\". The story, and its main characters, attracted little public interest when it first appeared. This book is the first of four full-length novels about Holmes. Doyle\'s other works were collections of short stories.', 1, '2023-04-26 17:28:20', NULL, 17, 33, 19),
(17, 'The Memoirs of Sherlock Holmes', 276, '16', '2019-07-02 22:00:00', 'The Memoirs of Sherlock Holmes is a collection of Sherlock Holmes stories, originally published in 1893, by Arthur Conan Doyle. Doyle had decided that these would be the last collection of Holmes\'s stories, and intended to kill him off in the last adventure \\\"The Final Problem\\\". Readers wanted him to write more adventures featuring Sherlock Holmes, so Doyle released The Hound of the Baskervilles years later. He followed that up with The Return of Sherlock Holmes, in which Holmes relates how he survived.', 1, '2023-04-26 17:29:19', NULL, 17, 33, 20),
(18, 'The Sign of Four', 126, '15', '2021-09-06 22:00:00', 'A nice edition with the first edition cover and 13 original illustrations.\r\n\r\nThe Sign of Four was first released to magazines in 1890. It was later published in book format and is also known by the title The Sign of the Four. It is the second Sherlock Holmes novel, after A Study in Scarlet. The plot involves service in India, the Indian Rebellion of 1857, a stolen treasure, and a secret pact among four convicts (\\\"the Four\\\" of the title) and two corrupt prison guards... and of course, Sherlock Holmes.', 1, '2023-04-26 17:31:59', NULL, 17, 33, 23),
(19, 'Notes from a Small Island', 338, '13', '2015-02-02 23:00:00', 'Before New York Times bestselling author Bill Bryson wrote The Road to Little Dribbling, he took this delightfully irreverent jaunt around the unparalleled floating nation of Great Britain, which has produced zebra crossings, Shakespeare, Twiggie Winkie\'s Farm, and places with names like Farleigh Wallop and Titsey.', 1, '2023-04-26 17:35:15', NULL, 14, 34, 24),
(20, 'A Short History of Nearly Everything', 345, '49', '2003-04-30 22:00:00', 'One of the world\'s most beloved writers and New York Times bestselling author of A Walk in the Woods and The Body takes his ultimate journey-into the most intriguing and intractable questions that science seeks to answer.\r\n\r\nIn A Walk in the Woods, Bill Bryson trekked the Appalachian Trail-well, most of it. In A Sunburned Country, he confronted some of the most lethal wildlife Australia has to offer. Now, in his biggest book, he confronts his greatest challenge: to understand-and, if possible, answer-the oldest, biggest questions we have posed about the universe and ourselves. Taking as territory everything from the Big Bang to the rise of civilization, Bryson seeks to understand how we got from there being nothing at all to there being us. To that end, he has attached himself to a host of the world\'s most advanced (and often obsessed) archaeologists, anthropologists, and mathematicians, travelling to their offices, laboratories, and field camps. He has read (or tried to read) their books, pestered them with questions, apprenticed himself to their powerful minds. A Short History of Nearly Everything is the record of this quest, and it is a sometimes profound, sometimes funny, and always supremely clear and entertaining adventure in the realms of human knowledge, as only Bill Bryson can render it. Science has never been more involving or entertaining.', 1, '2023-04-26 17:37:23', NULL, 16, 34, 25),
(21, 'A Walk in the Woods: Rediscovering America on the ', 305, '38', '2010-08-07 22:00:00', '\"The best way of escaping into nature.\"-The New York Times\r\n\r\n Back in America after twenty years in Britain, Bill Bryson decided to reacquaint himself with his native country by walking the 2,100-mile Appalachian Trail, which stretches from Georgia to Maine. The AT offers an astonishing landscape of silent forests and sparkling lakes-and to a writer with the comic genius of Bill Bryson, it also provides endless opportunities to witness the majestic silliness of his fellow human beings. \r\n\r\nFor a start there\'s the gloriously out-of-shape Stephen Katz, a buddy from Iowa along for the walk. But A Walk in the Woods is more than just a laugh-out-loud hike. Bryson\'s acute eye is a wise witness to this beautiful but fragile trail, and as he tells its fascinating history, he makes a moving plea for the conservation of America\'s last great wilderness. An adventure, a comedy, and a celebration, A Walk in the Woods is a modern classic of travel literature.', 1, '2023-04-26 17:39:33', NULL, 16, 34, 26),
(22, 'In a Sunburned Country', 335, '29', '1999-12-31 23:00:00', 'Every time Bill Bryson walks out the door, memorable travel literature threatens to break out. This time in Australia.\r\nHis previous excursion along the Appalachian Trail resulted in the sublime national bestseller A Walk in the Woods. In A Sunburned Country is his report on what he found in an entirely different place: Australia, the country that doubles as a continent, and a place with the friendliest inhabitants, the hottest, driest weather, and the most peculiar and lethal wildlife to be found on the planet. The result is a deliciously funny, fact-filled, and adventurous performance by a writer who combines humor, wonder, and unflagging curiousity.\r\n\r\nDespite the fact that Australia harbors more things that can kill you in extremely nasty ways than anywhere else, including sharks, crocodiles, snakes, even riptides and deserts, Bill Bryson adores the place, and he takes his readers on a rollicking ride far beyond that beaten tourist path. Wherever he goes he finds Australians who are cheerful, extroverted, and unfailingly obliging, and these beaming products of land with clean, safe cities, cold beer, and constant sunshine fill the pages of this wonderful book.\r\n', 1, '2023-04-26 17:40:55', NULL, 16, 34, 27),
(23, 'The Road to Little Dribbling: Adventures of an Ame', 382, '27', '2016-01-17 23:00:00', 'A loving and hilarious-if occasionally spiky-valentine to Bill Bryson\'s adopted country, Great Britain. Prepare for total joy and multiple episodes of unseemly laughter.\r\n\r\nTwenty years ago, Bill Bryson went on a trip around Britain to discover and celebrate that green and pleasant land. The result was Notes from a Small Island, a true classic and one of the bestselling travel books ever written. Now he has traveled about Britain again, by bus and train and rental car and on foot, to see what has changed-and what hasn\'t.\r\n\r\nFollowing (but not too closely) a route he dubs the Bryson Line, from Bognor Regis in the south to Cape Wrath in the north, by way of places few travelers ever get to at all, Bryson rediscovers the wondrously beautiful, magnificently eccentric, endearingly singular country that he both celebrates and, when called for, twits. With his matchless instinct for the funniest and quirkiest and his unerring eye for the idiotic, the bewildering, the appealing, and the ridiculous, he offers acute and perceptive insights into all that is best and worst about Britain today.', 1, '2023-04-26 17:42:26', NULL, 16, 34, 28),
(24, 'One Summer: America, 1927', 545, '16', '2013-09-03 22:00:00', 'In One Summer Bill Bryson, one of our greatest and most beloved nonfiction writers, transports readers on a journey back to one amazing season in American life.\r\n\r\nThe summer of 1927 began with one of the signature events of the twentieth century: on May 21, 1927, Charles Lindbergh became the first man to cross the Atlantic by plane nonstop, and when he landed in Le Bourget airfield near Paris, he ignited an explosion of worldwide rapture and instantly became the most famous person on the planet. Meanwhile, the titanically talented Babe Ruth was beginning his assault on the home run record, which would culminate on September 30 with his sixtieth blast, one of the most resonant and durable records in sports history. In between those dates a Queens housewife named Ruth Snyder and her corset-salesman lover garroted her husband, leading to a murder trial that became a huge tabloid sensation\r\n\r\nAlvin \"Shipwreck\" Kelly sat atop a flagpole in Newark, New Jersey, for twelve days-a new record. The American South was clobbered by unprecedented rain and by flooding of the Mississippi basin, a great human disaster, the relief efforts for which were guided by the uncannily able and insufferably pompous Herbert Hoover. Calvin Coolidge interrupted an already leisurely presidency for an even more relaxing three-month vacation in the Black Hills of South Dakota.', 1, '2023-04-26 17:44:00', NULL, 16, 34, 29),
(25, 'I\'m a Stranger Here Myself: Notes on Returning to ', 306, '21', '2008-06-12 22:00:00', 'A classic from the New York Times bestselling author of A Walk in the Woods and The Body.\r\n\r\nAfter living in Britain for two decades, Bill Bryson recently moved back to the United States with his English wife and four children (he had read somewhere that nearly 3 million Americans believed they had been abducted by aliens-as he later put it, \\\"it was clear my people needed me\\\"). They were greeted by a new and improved America that boasts microwave pancakes, twenty-four-hour dental-floss hotlines, and the staunch conviction that ice is not a luxury item.\r\n\r\nDelivering the brilliant comic musings that are a Bryson hallmark, I\'m a Stranger Here Myself recounts his sometimes disconcerting reunion with the land of his birth. The result is a book filled with hysterical scenes of one man\'s attempt to reacquaint himself with his own country, but it is also an extended if at times bemused love letter to the homeland he has returned to after twenty years away.', 1, '2023-04-26 17:45:34', NULL, 16, 34, 30),
(26, 'Bill Bryson\'s African Diary', 66, '22', '2007-12-14 23:00:00', 'From the author of A Short History of Nearly Everything and The Body comes a travel diary documenting a visit to Kenya. All royalties and profits go to CARE International.\r\n\r\nIn the early fall of 2002, famed travel writer Bill Bryson journeyed to Kenya at the invitation of CARE International, the charity dedicated to working with local communities to eradicate poverty around the world. He arrived with a set of mental images of Africa gleaned from television broadcasts of low-budget Jungle Jim movies in his Iowa childhood and a single viewing of the film version of Out of Africa. (Also with some worries about tropical diseases, insects, and large predators.) But the vibrant reality of Kenya and its people took over the second he deplaned in Nairobi, and this diary records Bill Bryson\'s impressions of his trip with his inimitable trademark style of wry observation and curious insight.\r\n\r\nFrom the wrenching poverty of the Kibera slum in Nairobi to the meticulously manicured grounds of the Karen Blixen house and the human fossil riches of the National Museum, Bryson registers the striking contrasts of a postcolonial society in transition. He visits the astoundingly vast Great Rift Valley; undergoes the rigors of a teeth-rattling train journey to Mombasa and a hair-whitening flight through a vicious storm; and visits the refugee camps and the agricultural and economic projects where dedicated CARE professionals wage noble and dogged war against poverty, dislocation, and corruption.', 1, '2023-04-26 17:47:21', NULL, 16, 34, 31),
(27, 'Neither here nor there: Travels in Europe', 322, '49', '2015-04-13 22:00:00', 'In the early seventies, Bill Bryson backpacked across Europe-in search of enlightenment, beer, and women. He was accompanied by an unforgettable sidekick named Stephen Katz (who will be gloriously familiar to readers of Bryson\'s A Walk in the Woods). Twenty years later, he decided to retrace his journey. The result is the affectionate and riotously funny Neither Here Nor There.\r\n\r\n', 1, '2023-04-26 17:48:39', NULL, 16, 34, 32),
(28, 'The Lost Continent: Travels in Small Town America', 354, '14', '2015-04-30 22:00:00', 'An inspiring and hilarious account of one man\'s rediscovery of America and his search for the perfect small town.\r\n\r\nFollowing an urge to rediscover his youth, Bill Bryson left his native Des Moines, Iowa, in a journey that would take him across 38 states. Lucky for us, he brought a notebook. With a razor wit and a kind heart, Bryson serves up a colorful tale of boredom, kitsch, and beauty when you least expect it. From Times Square to the Mississippi River to Williamsburg, Virginia, Bryson\'s keen and hilarious search for the perfect American small town is a journey straight into the heart and soul of America.', 1, '2023-04-26 18:04:47', NULL, 16, 34, 33),
(29, 'The Great Railway Bazaar', 354, '15', '2006-04-30 22:00:00', 'The acclaimed author recounts his epic journey across Europe and Asia in this international bestselling classic of travel literature: \"Compulsive reading\" (Graham Greene).\r\n\r\nIn 1973, Paul Theroux embarked on a four-month journey by train from the United Kingdom through Europe, the Middle East, and Southeast Asia. In The Great Railway Bazaar, he records in vivid detail and penetrating insight the many fascinating incidents, adventures, and encounters of his grand, intercontinental tour.\r\n\r\nAsia\'s fabled trains-the Orient Express, the Khyber Pass Local, the Frontier Mail, the Golden Arrow to Kuala Lumpur, the Mandalay Express, the Trans-Siberian Express-are the stars of a journey that takes Theroux on a loop eastbound from London\'s Victoria Station to Tokyo Central, then back from Japan on the Trans-Siberian. Brimming with Theroux\'s signature humor and wry observations, this engrossing chronicle is essential reading for both the ardent adventurer and the armchair traveler.', 1, '2023-04-26 18:07:19', NULL, 18, 35, 34),
(30, 'Deep South: Four Seasons on Back Roads', 485, '27', '2015-05-03 22:00:00', 'The acclaimed author of The Great Railway Bazaar takes a revealing journey through the Southern US in a \"vivid contemporary portrait of rural life\" (Atlanta Journal-Constitution).\r\n\r\nPaul Theroux has spent decades roaming the globe and writing of his experiences with remote people and far-flung places. Now, for the first time, he turns his attention to a corner of America-the Deep South. On a winding road trip through Mississippi, South Carolina, and elsewhere below the Mason-Dixon, Theroux discovers architectural and artistic wonders, incomparable music, mouth-watering cuisine-and also some of the worst schools, medical care, housing, and unemployment rates in the nation.\r\n\r\nMost fascinating of all are Theroux\'s many encounters with the people who make the South what it is-from preachers and mayors to quarry workers and gun show enthusiasts. With his astute ear and penetrating mind, Theroux once again demonstrates his \"remarkable gift for getting strangers to reveal themselves\" in this eye-opening excursion into his own country (The New York Times Book Review).', 1, '2023-04-26 18:09:44', NULL, 18, 35, 35),
(31, 'The Happy Isles of Oceania: Paddling the Pacific', 530, '43', '2006-11-30 23:00:00', 'The author of The Great Railway Bazaar explores the South Pacific by kayak: \"This exhilarating epic ranks with [his] best travel books\" (Publishers Weekly).\r\n\r\nIn one of his most exotic and adventuresome journeys, travel writer Paul Theroux embarks on an eighteen-month tour of the South Pacific, exploring fifty-one islands by collapsible kayak. Beginning in New Zealand\'s rain forests and ultimately coming to shore thousands of miles away in Hawaii, Theroux paddles alone over isolated atolls, through dirty harbors and shark-filled waters, and along treacherous coastlines.\r\n\r\nAlong the way, Theroux meets the king of Tonga, encounters street gangs in Auckland, and investigates a cargo cult in Vanuatu. From Australia to Tahiti, Fiji, Easter Island, and beyond, this exhilarating tropical epic is full of disarming observations and high adventure.', 1, '2023-04-26 18:11:38', NULL, 18, 35, 36),
(32, 'On The Plain Of Snakes: A Mexican Journey', 542, '21', '2019-06-03 22:00:00', 'The legendary travel writer drives the entire length of the US-Mexico border, then takes the back roads of Chiapas and Oaxaca, to uncover the rich, layered world behind the everyday headlines.\r\n\r\nPaul Theroux has spent his life crisscrossing the globe in search of the histories and peoples that give life to the places they call home. Now, as immigration debates boil around the world, Theroux has set out to explore a country key to understanding our current discourse: Mexico. Just south of the Arizona border, in the desert region of Sonora, he finds a place brimming with vitality, yet visibly marked by both the US Border Patrol to the north and mounting discord from within. With the same humanizing sensibility that he employed in Deep South, Theroux stops to talk with residents, visits Zapotec mill workers in the highlands, and attends a Zapatista party meeting, communing with people of all stripes who remain south of the border even as family members brave the journey north.', 1, '2023-04-26 18:12:56', NULL, 18, 35, 37),
(33, 'The Old Patagonian Express: By Train Through the A', 506, '47', '2014-06-03 22:00:00', 'The acclaimed travel writer journeys by train across the Americas from Boston to Patagonia in this international bestselling travel memoir.\r\n\r\nStarting with a rush-hour subway ride to South Station in Boston to catch the Lake Shore Limited to Chicago, Paul Theroux takes a grand railway adventure first across the United States and then south through Mexico, Central America, and across the Andes until he winds up on the meandering Old Patagonian Express steam engine. His epic commute finally comes to a halt in a desolate land of cracked hills and thorn bushes that reaches toward Antarctica.\r\n\r\nAlong the way, Theroux demonstrates how train travel can reveal \"the social miseries and scenic splendors\" of a continent. And through his perceptive prose we learn that what matters most are the people he meets along the way, including the monologuing Mr. Thornberry in Costa Rica, the bogus priest of Cali, and the blind Jorge Luis Borges, who delights in having Theroux read Robert Louis Stevenson to him.', 1, '2023-04-26 18:15:52', NULL, 16, 35, 38),
(34, 'How to Win Friends and Influence People', 317, '25', '2022-05-16 22:00:00', 'Updated for the first time in more than forty years, Dale Carnegie\'s timeless bestseller How to Win Friends and Influence People-a classic that has improved and transformed the personal and professional lives of millions.\r\n\r\nThis new edition of the most influential self-help book of the last century has been updated under the care of Dale\'s daughter, Donna, introducing changes that keep the book fresh for today\'s readers, with priceless material restored from the original 1936 text.\r\n\r\nOne of the best-known motivational guides in history, Dale Carnegie\'s groundbreaking publication has sold tens of millions of copies, been translated into almost every known written language, and has helped countless people succeed.', 1, '2023-04-26 18:19:35', NULL, 19, 36, 39),
(35, 'How to Stop Worrying & Start Living', 399, '15', '2022-05-11 22:00:00', '\"Let\'s not allow ourselves to be upset by small things we should despise and forget. Remember \"Life is too short to belittle\" \"One of the most tragic things I know about human nature is that all of us tend to put off living. We are all dreaming of some magical rose garden over the horizon-instead of enjoying the roses that are blooming outside our windows today. Why are we such fools-such tragic fools?\" \"The most important thing in life is not to capitalize on your gains. Any fool can do that. The really important thing is to profit from your losses.\" -Dale Carnegie This enlightening self-book offers a detailed guide on how to manage your worries to lead a delightful life. More often than not our personal and professional relationships are the major cause of stress and anxiety. A best-seller of all times, this book will help you achieve your maximum potential in the complex and competitive modern age, without worrying about your associations and affiliations with others.', 1, '2023-04-26 18:28:07', NULL, 19, 36, 40),
(36, 'The Art of Public Speaking: The Original Tool for ', 532, '43', '2018-06-22 22:00:00', 'Do you have trouble getting up in front of an audience? Are you struggling to get your point across? Public speaking can be nerve-wracking, especially if you\'re a naturally nervous person or if you\'re underprepared. Originally published in 1915, The Art of Public Speaking has been the go-to guide for those who want to better their speaking abilities for more than a century.', 1, '2023-04-26 18:29:49', NULL, 19, 36, 41),
(37, 'Take Command', 267, '14', '2023-01-03 23:00:00', 'Take command of your future with this groundbreaking book from the experts who brought you How to Win Friends and Influence People.\r\n\r\nTake Command offers powerful tools and time-tested methods to help you live an intentional life by transforming how you approach your thoughts, emotions, relationships, and future. Filled with stories of everyday people and based on expert research and interviews with more than a hundred high-performing leaders, Take Command gives you the strategies you need to unlock your full potential and create the life you want.', 1, '2023-04-26 18:31:19', NULL, 19, 36, 42),
(38, 'The Quick and Easy Way to Effective Speaking', 185, '45', '2019-05-18 22:00:00', 'Good public speakers are made-not born. Public speaking is an important skill which anyone can acquire and develop. This book that has literally put millions on the highway to greater accomplishment and success can show you how to have maximum impact as a speaker. It will help you to acquire basic public speaking skills, building confidence, earning the right to talk, sharing the talk with the audience.', 1, '2023-04-26 18:32:30', NULL, 19, 36, 43),
(39, 'Listen!: The Art of Effective Communication', 224, '18', '2018-07-02 22:00:00', 'Why do we so often fail to connect when speaking with business colleagues, family members, or friends? Wouldn\'t you like to make yourself heard and understood in all of your relationships?\r\n\r\nUsing vivid examples, easy-to-learn techniques, and practical exercises for becoming a better listener-and making yourself heard and understood, Dale Carnegie will show you how it\'s done, even in difficult situations.\r\n\r\nFounded in 1912, Dale Carnegie Training has evolved from one man\'s belief in the power of self-improvement to a performance-based training company with offices worldwide. Dale Carnegie\'s original body of knowledge has been constantly updated, expanded and refined through nearly a century\'s worth of real-life business experiences. He is recognized internationally as the leader in bringing out the best in people and over 8 million people have completed a Dale Carnegie course.', 1, '2023-04-26 18:48:11', NULL, 19, 36, 44),
(40, 'Make Yourself Unforgettable', 175, '52', '2011-02-06 23:00:00', 'From one of the most trusted and bestselling brands in business training, Make Yourself Unforgettable reveals how to develop and embody unforgettable qualities so you can become the effective and desirable colleague and friend possible.\r\n\r\nLearn how to develop and embody the ten essential elements of being unforgettable!\r\n\r\nWhat does it really mean to have class? How do you distinguish yourself from the crowd and become a successful leader? When should intuition guide your business decisions? The answers to these and other important questions can be found in this dynamic and inspiring guidebook for anyone looking to lead a life of greater meaning and influence.', 1, '2023-04-26 18:49:59', NULL, 19, 36, 45),
(41, 'How To Develop Self-Confidence & Influence People', 260, '63', '2021-02-28 23:00:00', 'Dale Carnegie\'s How to Develop-Self Confidence & Influence People is an evergreen work. The main takeaway from this book is that improving public speaking and improving self-confidence are a function of preparation, education, determination and practice. There is no short cut to a better you - rather a long path of self-improvement.', 1, '2023-04-26 19:01:03', NULL, 19, 36, 46),
(42, 'How to Stop Worrying and Start Living', 734, '16', '2021-08-11 22:00:00', 'How To Stop Worrying and Start Living is a self-help book by Dale Carnegie. Carnegie is considered to be one of the greatest self-help experts, he mentions in the preface that he wrote it because he \"was one of the unhappiest lads in New York\". He says that he made himself sick with worry because he hated his position in life, which he attributes to wanting to figure out how to stop worrying.\r\n\r\nThe book\'s goal is to lead the reader to a more enjoyable and fulfilling lifestyle, helping them to become more aware of, not only themselves, but others also around them. Carnegie tries to address the everyday nuances of living, in order to get the reader to focus on the more important aspects of life.', 1, '2023-04-26 19:03:02', NULL, 19, 36, 47),
(43, '3 Steps to Being a Great Manager', 614, '33', '2021-08-04 22:00:00', 'Why do we so often fail to connect when speaking with others? Wouldn\'t you like to make yourself heard and understood? Using vivid examples, easy-to-learn techniques, and practical exercises for becoming a better listener-and making yourself heard and understood, Dale Carnegie will show you how it\'s done, even in difficult situations.\r\n\r\nToday, where media is social and funding is raised by crowds, the sales cycle has permanently changed. It\'s not enough to know your product, nor always appropriate to challenge your customer\'s thinking based on your research. Dale Carnegie & Associates reveal the REAL modern sales cycle that depends on your ability to influence more than just one buyer, understand what today\'s customers want, and use time-tested principles to strengthen relationships anywhere in the global economy.', 1, '2023-04-26 19:04:37', NULL, 19, 36, 48),
(44, 'Life Force', 700, '25', '2022-02-07 23:00:00', 'Transform your life or the life of someone you love with Life Force-the newest breakthroughs in health technology to help maximize your energy and strength, prevent disease, and extend your health span-from Tony Robbins, author of the #1 New York Times bestseller Money: Master the Game.\r\n\r\nWhat if there were scientific solutions that could wipe out your deepest fears of falling ill, receiving a life-threatening diagnosis, or feeling the effects of aging? What if you had access to the same cutting-edge tools and technology used by peak performers and the world\'s greatest athletes?\r\n\r\nIn a world full of fear and uncertainty about our health, it can be difficult to know where to turn for actionable advice you can trust. Today, leading scientists and doctors in the field of regenerative medicine are developing diagnostic tools and safe and effective therapies that can free you from fear.', 1, '2023-04-26 19:07:42', NULL, 19, 37, 49),
(45, 'MONEY Master the Game: 7 Simple Steps to Financial', 689, '66', '2014-09-17 22:00:00', 'Tony Robbins turns to the topic that vexes us all: How to secure financial freedom for ourselves and for our families. \"If there were a Pulitzer Prize for investment books, this one would win, hands down\" (Forbes).\r\n\r\nTony Robbins is one of the most revered writers and thinkers of our time. People from all over the world-from the disadvantaged to the well-heeled, from twenty-somethings to retirees-credit him for giving them the inspiration and the tools for transforming their lives. From diet and fitness, to business and leadership, to relationships and self-respect, Tony Robbins\'s books have changed people in profound and lasting ways. Now, for the first time, he has assembled an invaluable \"distillation of just about every good personal finance idea of the last forty years\" (The New York Times).\r\n\r\nBased on extensive research and interviews with some of the most legendary investors at work today (John Bogle, Warren Buffett, Paul Tudor Jones, Ray Dalio, Carl Icahn, and many others), Tony Robbins has created a 7-step blueprint for securing financial freedom. With advice about taking control of your financial decisions, to setting up a savings and investing plan, to destroying myths about what it takes to save and invest, to setting up a \"lifetime income plan,\" the book brims with advice and practices for making the financial game not only winnable-but providing financial freedom for the rest of your life. \"Put MONEY on your short list of new books to read…It\'s that good\" (Marketwatch.com).', 1, '2023-04-26 19:09:37', NULL, 19, 37, 50),
(46, 'Unshakeable: Your Financial Freedom Playbook', 257, '43', '2017-02-04 23:00:00', 'Transform your financial life and accelerate your path to financial freedom with this step-by-step playbook to achieving your financial goals from the #1 New York Times bestseller of Money: Master the Game, Tony Robbins.\r\n\r\nRobbins, who has coached more than fifty million people from 100 countries, is the world\'s #1 life and business strategist. In this book, he teams up with Peter Mallouk, the only man in history to be ranked the #1 financial advisor in the US for three consecutive years by Barron\'s. Together they reveal how to become unshakeable-someone who can not only maintain true peace of mind in a world of immense uncertainty, economic volatility, and unprecedented change, but who can profit from the fear that immobilizes so many.', 1, '2023-04-26 19:13:54', NULL, 19, 37, 51),
(47, 'The Path: Accelerating Your Journey to Financial F', 316, '24', '2020-04-12 22:00:00', 'Accelerate your journey to financial freedom with the tools, strategies, and mindset of money mastery.\r\n\r\nRegardless of your stage of life and your current financial picture, the quest for financial freedom can indeed be conquered. The journey will demand the right tools and strategies along with the mindset of money mastery. With decades of collective wisdom and hands-on experience, your guides for this expedition are Peter Mallouk, the only man in history to be ranked the #1 Financial Advisor in the U.S. for three consecutive years by Barron\'s (2013, 2014, 2015), and Tony Robbins, the world-renowned life and business strategist. Mallouk and Robbins take the seemingly daunting goal of financial freedom and simplify it into a step-by-step process that anyone can achieve.', 1, '2023-04-26 19:15:19', NULL, 19, 37, 52),
(48, 'The Emotion Code', 349, '64', '2022-02-14 23:00:00', '\"I believe that the discoveries in this book can change our understanding of how we store emotional experiences and in so doing, change our lives. The Emotion Code has already changed many lives around the world, and it is my hope that millions more will be led to use this simple tool to heal themselves and their loved ones.\"-Tony Robbins\r\n\r\nIn this newly revised and expanded edition of The Emotion Code, renowned holistic physician and lecturer Dr. Bradley Nelson skillfully lays bare the inner workings of the subconscious mind. He reveals how emotionally-charged events from your past can still be haunting you in the form of \\\"trapped emotions\\\"-emotional energies that literally inhabit your body. These trapped emotions can fester in your life and body, creating pain, malfunction, and eventual disease. They can also extract a heavy mental and emotional toll on you, impacting how you think, the choices that you make, and the level of success and abundance you are able to achieve. Perhaps most damaging of all, trapped emotional energies can gather around your heart, cutting off your ability to give and receive love.\r\n\r\nThe Emotion Code is a powerful and simple way to rid yourself of this unseen baggage. Dr. Nelson\'s method gives you the tools to identify and release the trapped emotions in your life, eliminating your \"emotional baggage,\" and opening your heart and body to the positive energies of the world. Filled with real-world examples from many years of clinical practice, The Emotion Code is a distinct and authoritative work that has become a classic on self-healing.', 1, '2023-04-26 19:17:26', NULL, 19, 37, 53),
(49, 'Mastering the Art of French Cooking', 754, '55', '2011-09-04 22:00:00', '\"What a cookbook should be: packed with sumptuous recipes, detailed instructions, and precise line drawings. Some of the instructions look daunting, but as Child herself says in the introduction, \'If you can read, you can cook.\'\" -Entertainment Weekly\r\n\r\n\"I only wish that I had written it myself.\" -James Beard\r\n\r\nFeaturing 524 delicious recipes and over 100 instructive illustrations to guide readers every step of the way, Mastering the Art of French Cooking offers something for everyone, from seasoned experts to beginners who love good food and long to reproduce the savory delights of French cuisine.', 1, '2023-04-28 12:10:50', NULL, 20, 38, 54),
(50, 'Mastering the Art of French Cooking, Volume 2', 1244, '45', '2012-12-30 23:00:00', 'The beloved sequel to the bestselling classic, Mastering the Art of French Cooking, Volume II presents more fantastic step-by-step French recipes for home cooks.\r\n\r\nWorking from the principle that \"mastering any art is a continuing process,\" Julia Child and Simone Beck gathered together a brilliant selection of new dishes to bring you to a yet higher level of culinary mastery.\r\n\r\nThey have searched out more of the classic dishes and regional specialties of France, and adapted them so that Americans, working with American ingredients, in American kitchens, can achieve the incomparable flavors and aromas that bring up a rush of memories-of lunch at a country inn in Provence, of an evening at a great Paris restaurant, of the essential cooking of France.ext', 1, '2023-04-28 17:23:20', NULL, 20, 38, 55),
(51, 'The French Chef Cookbook', 1343, '19', '2022-02-03 23:00:00', 'The beloved icon and author of best-selling classic Mastering the Art of French Cooking presents an array of delectable French recipes that first made her a household name.\r\n\r\nOriginally debuted on her first public television show, here are 119 traditional French recipes, tested and perfected for home cooks to enjoy-from Mayonnaise to Bouillabaisse, crepes to steaks, and delicious vegetables to delectable desserts. America\'s first lady of food continues to profoundly shaped the way we cook, the way we eat, and the way we see food.', 1, '2023-04-28 17:24:22', NULL, 20, 38, 56),
(52, 'Julia\'s Kitchen Wisdom', 6544, '45', '2010-02-02 23:00:00', 'In this indispensable volume of kitchen wisdom, Julia Child gives home cooks the answers to their most pressing cooking questions-with essential information about soups, vegetables, eggs, baking breads and tarts, and more.\r\n\r\nHow many minutes should you cook green beans? What are the right proportions for a vinaigrette? How do you skim off fat? What is the perfect way to roast a chicken?\r\n\r\nHere Julia provides solutions for these and many other everyday cooking queries. How are you going to cook that small rib steak you brought home? You\'ll be guided to the quick sauté as the best and fastest way. And once you\'ve mastered that recipe, you can apply the technique to chops, chicken, or fish, following Julia\'s careful guidelines.', 1, '2023-04-28 17:25:33', NULL, 20, 38, 57),
(53, 'People Who Love to Eat Are Always the Best People', 91, '62', '2020-04-05 22:00:00', 'Perfect for home cooks, Julia fans, and anyone who simply loves to eat and drink-a delightful collection of the beloved chef and bestselling author\'s words of wisdom on love, life, and, of course, food.\r\n\r\n\"If you\'re afraid of butter, use cream.\\\" So decrees Julia Child, the legendary culinary authority and cookbook author who taught America how to cook-and how to eat. This delightful volume of quotations compiles some of Julia\'s most memorable lines on eating-\"The only time to eat diet food is while you\'re waiting for the steak to cook\"-on drinking, on life-\"I think every woman should have a blowtorch\"-on love, travel, France, and much more.', 1, '2023-04-28 17:27:30', NULL, 20, 38, 58),
(54, 'The Way to Cook', 528, '77', '1989-01-30 23:00:00', 'In her most creative and instructive cookbook, Julia Child distills a lifetime of cooking into 800 recipes emphasizing lightness, freshness, and simplicity. Chapters are structured around master recipes, followed by innumerable variations that are easily made once the basics are understood. For example, make Julia\'s simple but impeccably prepared sauté of chicken, and before long you\'re easily whipping up Chicken with Mushrooms and Cream, Chicken Provençale, Chicken Pipérade, or Chicken Marengo. Or master her perfect broiled butterflied chicken, and you\'ll soon be including Deviled Rabbit or Split Cornish Game Hens Broiled with Cheese on your menu.\r\n\r\nHere home cooks will find a treasure trove of poultry and fish recipes, as well as a vast array of fresh vegetables prepared in new ways, along with bread doughs and delicious indulgences, such as Caramel Apple Mountain or a Queen of Sheba Chocolate Almond Cake with Chocolate Leaves. And if you want to know how a finished dish should look or how to angle your knife or to fashion a pretty rosette on a cake, there are more than 600 color photographs to entice and instruct you along the way. A brilliant, inspiring, one-of-a-kind, book from the incomparable Julia Child, The Way to Cook is a testament to the satisfactions of good home cooking.', 1, '2023-04-28 17:28:34', NULL, 20, 38, 59),
(55, 'Julia and Jacques Cooking at Home', 448, '43', '1999-03-05 23:00:00', 'Two legendary cooks invite us into their kitchen and show us the basics of good home cooking.\r\n\r\nJulia Child and Jacques Pépin are synonymous with good food, and in these pages they demonstrate techniques (on which they don\'t always agree), discuss ingredients, improvise, balance flavors to round out a meal, and conjure up new dishes from leftovers. Center stage are carefully spelled-out recipes flanked by Julia\'s and Jacques\'s comments-the accumulated wisdom of two lifetimes of honing their cooking skills. Nothing is written in stone, they imply. And that is one of the most important lessons for every good cook.', 1, '2023-04-28 17:38:23', NULL, 20, 38, 60),
(56, 'My Life in France', 336, '32', '2006-09-02 22:00:00', 'Julia\'s story of her transformative years in France in her own words is \"captivating ... her marvelously distinctive voice is present on every page.\" (San Francisco Chronicle).\r\n\r\nAlthough she would later singlehandedly create a new approach to American cuisine with her cookbook Mastering the Art of French Cooking and her television show The French Chef, Julia Child was not always a master chef. Indeed, when she first arrived in France in 1948 with her husband, Paul, who was to work for the USIS, she spoke no French and knew nothing about the country itself.', 1, '2023-04-28 17:39:48', NULL, 20, 38, 61);
INSERT INTO `book` (`id`, `name`, `page_count`, `price`, `release_date`, `description`, `status`, `created_at`, `deleted_at`, `publisher_id`, `user_id`, `image_id`) VALUES
(57, 'Baking with Julia', 512, '15', '1996-04-26 22:00:00', 'Nothing promises pleasure more readily than the words \"freshly baked.\" And nothing says magnum opus as definitively as Baking with Julia, which offers the dedicated home cook, whether a novice or seasoned veteran, a unique distillation of the baker\'s art.\r\n\r\nBaking with Julia is not only a book full of glorious recipes but also one that continues Julia\'s teaching tradition. Here, basic techniques come alive and are made easily comprehensible in recipes that demonstrate the myriad ways of raising dough, glazing cakes, and decorating crusts. This is the resource you\'ll turn to again and again for all your baking needs. With Baking with Julia in your cookbook library, you can become a master baker.', 1, '2023-04-28 17:41:28', NULL, 20, 38, 62),
(58, 'Julia\'s Breakfasts, Lunches, and Suppers: Seven me', 113, '45', '1999-04-24 22:00:00', 'Here are seven menus to make any meal a treat--morning, noon, or evening. From a breezy Holiday Lunch featuring a melon-sized pate of chicken and a salad of skewered vegetables to a homey Sunday Night Supper of corned beef and pork with a fresh tomato fondue, Julia shows you how to plan ahead and cook without trepidation. Her incomparable step-by-step recipes, shopping lists, variations, and suggestions for leftovers are complemented by more than 100 photographs and ensure success with every meal.', 1, '2023-04-28 17:42:24', NULL, 20, 38, 63),
(59, 'One: Simple One-Pan Wonders', 312, '21', '2022-12-31 23:00:00', 'One is the ultimate cookbook that will make getting good food on the table easier than ever before . . . Jamie Oliver is back to basics with over 120 simple, delicious, ONE pan recipes.\r\n\r\nIn ONE, Jamie Oliver will guide you through over 120 recipes for tasty, fuss-free and satisfying dishes cooked in just one pan. What\'s better: each recipe has just eight ingredients or fewer, meaning minimal prep (and cleaning up) and offering maximum convenience.\r\n\r\nPacked with budget-friendly dishes you can rustle up any time, ONE has everything from delicious work from home lunches to quick dinners the whole family will love; from meat-free options to meals that will get novice cooks started.', 1, '2023-04-28 18:09:24', NULL, 21, 39, 64),
(60, '5 Ingredients: Quick & Easy Food', 490, '54', '2019-01-07 23:00:00', 'Jamie Oliver--one of the bestselling cookbook authors of all time--is back with a bang. Focusing on incredible combinations of just five ingredients, he\'s created 130 brand-new recipes that you can cook up at home, any day of the week. From salads, pasta, chicken, and fish to exciting ways with vegetables, rice and noodles, beef, pork, and lamb, plus a bonus chapter of sweet treats, Jamie\'s got all the bases covered. This is about maximum flavor with minimum fuss, lots of nutritious options, and loads of epic inspiration.', 1, '2023-04-28 18:10:24', NULL, 21, 39, 65),
(61, 'Jamie\'s 30-Minute Meals', 408, '55', '2017-05-03 22:00:00', 'Jamie Oliver will teach you how to make good food super-fast in his game-changing guide to coordinating an entire meal without any fuss.\r\n\r\nWith 50 exciting, seasonal meal ideas, Jamie\'s 30 Minute Meals provides the essential collection of dishes for putting on the ultimate three-course meal without taking up your time.\r\n\r\nNot only that, Jamie also includes refreshing, light lunch recipes that you can put together in no time at all.', 1, '2023-04-28 18:11:49', NULL, 21, 39, 66),
(62, 'Together: Memorable Meals Made Easy', 350, '64', '2021-01-08 23:00:00', 'Welcome friends and family back around your table with Jamie Oliver\'s brand-new cookbook, Together - a joyous celebration of incredible food to share.\r\n\r\nBeing with our loved ones has never felt so important, and great food is the perfect excuse to get together. Each chapter features a meal, from seasonal feasts to curry nights, with a simple, achievable menu that can be mostly prepped ahead.\r\n\r\nJamie\'s aim - whether you\'re following the full meal or choosing just one of the 130 individual recipes - is to minimize your time in the kitchen so you can maximize the time you spend with your guests.', 1, '2023-04-28 18:13:11', NULL, 21, 39, 67),
(63, 'Ultimate Veg', 468, '21', '2020-05-04 22:00:00', 'Jamie Oliver, one of the bestselling cookbook authors of all time, is back with brilliantly easy, delicious, and flavor-packed vegetable recipes.\r\n\r\nThis edition has been adapted for the US market. It was originally published in the UK under the title Veg.\r\n\r\nFrom simple suppers and family favorites, to weekend dishes for sharing with friends, this book is packed full of phenomenal food - pure and simple.', 1, '2023-04-28 18:14:31', NULL, 21, 39, 68),
(64, 'Hackers', 654, '35', '2010-04-04 22:00:00', 'This 25th anniversary edition of Steven Levy\'s classic book traces the exploits of the computer revolution\'s original hackers -- those brilliant and eccentric nerds from the late 1950s through the early \'80s who took risks, bent the rules, and pushed the world in a radical new direction. With updated material from noteworthy hackers such as Bill Gates, Mark Zuckerberg, Richard Stallman, and Steve Wozniak, Hackers is a fascinating story that begins in early computer research labs and leads to the first home computers.\r\n\r\nLevy profiles the imaginative brainiacs who found clever and unorthodox solutions to computer engineering problems. They had a shared sense of values, known as \"the hacker ethic,\" that still thrives today. Hackers captures a seminal period in recent history when underground activities blazed a trail for today\'s digital world, from MIT students finagling access to clunky computer-card machines to the DIY culture that spawned the Altair and the Apple II.', 1, '2023-04-28 18:24:33', NULL, 22, 40, 69),
(65, 'In the Plex', 461, '53', '2011-12-07 23:00:00', '\"The most interesting book ever written about Google\" (The Washington Post) delivers the inside story behind the most successful and admired technology company of our time, now updated with a new Afterword.\r\n\r\nGoogle is arguably the most important company in the world today, with such pervasive influence that its name is a verb. The company founded by two Stanford graduate students-Larry Page and Sergey Brin-has become a tech giant known the world over. Since starting with its search engine, Google has moved into mobile phones, computer operating systems, power utilities, self-driving cars, all while remaining the most powerful company in the advertising business.\r\n\r\nGranted unprecedented access to the company, Levy disclosed that the key to Google\'s success in all these businesses lay in its engineering mindset and adoption of certain internet values such as speed, openness, experimentation, and risk-taking. Levy discloses details behind Google\'s relationship with China, including how Brin disagreed with his colleagues on the China strategy-and why its social networking initiative failed; the first time Google tried chasing a successful competitor. He examines Google\'s rocky relationship with government regulators, particularly in the EU, and how it has responded when employees left the company for smaller, nimbler start-ups.', 1, '2023-04-28 18:34:37', NULL, 22, 40, 70),
(66, 'Crypto', 370, '32', '2001-07-02 22:00:00', 'If you\'ve ever made a secure purchase with your credit card over the Internet, then you have seen cryptography, or \"crypto\", in action. From Stephen Levy-the author who made \"hackers\" a household word-comes this account of a revolution that is already affecting every citizen in the twenty-first century. Crypto tells the inside story of how a group of \"crypto rebels\"-nerds and visionaries turned freedom fighters-teamed up with corporate interests to beat Big Brother and ensure our privacy on the Internet. Levy\'s history of one of the most controversial and important topics of the digital age reads like the best futuristic fiction.', 1, '2023-04-28 18:35:53', NULL, 22, 40, 71),
(67, 'Facebook: The Inside Story', 592, '43', '2020-09-05 22:00:00', 'One of the Best Technology Books of 2020-Financial Times\r\n\r\n\"Levy\'s all-access Facebook reflects the reputational swan dive of its subject. . . . The result is evenhanded and devastating.\"-San Francisco Chronicle\r\n\r\nThe definitive history, packed with untold stories, of one of America\'s most controversial and powerful companies: Facebook', 1, '2023-04-28 18:48:52', NULL, 22, 40, 73),
(68, 'Insanely Great', 338, '65', '2012-03-03 23:00:00', 'The creation of the Mac in 1984 catapulted America into the digital millennium, captured a fanatic cult audience, and transformed the computer industry into an unprecedented mix of technology, economics, and show business. Now veteran technology writer and Newsweek senior editor Steven Levy zooms in on the great machine and the fortunes of the unique company responsible for its evolution. Loaded with anecdote and insight, and peppered with sharp commentary, Insanely Great is the definitive book on the most important computer ever made. It is a must-have for anyone curious about how we got to the interactive age.\r\n\r\nThis new edition includes a never-before-seen transcript of an interview with Steve Jobs.', 1, '2023-04-28 18:50:15', NULL, 22, 40, 74),
(69, 'The Code Breaker', 552, '64', '2020-01-31 23:00:00', 'The bestselling author of Leonardo da Vinci and Steve Jobs returns with a \"compelling\" (The Washington Post) account of how Nobel Prize winner Jennifer Doudna and her colleagues launched a revolution that will allow us to cure diseases, fend off viruses, and have healthier babies.\r\n\r\nWhen Jennifer Doudna was in sixth grade, she came home one day to find that her dad had left a paperback titled The Double Helix on her bed. She put it aside, thinking it was one of those detective tales she loved. When she read it on a rainy Saturday, she discovered she was right, in a way. As she sped through the pages, she became enthralled by the intense drama behind the competition to discover the code of life. Even though her high school counselor told her girls didn\'t become scientists, she decided she would.\r\n\r\nDriven by a passion to understand how nature works and to turn discoveries into inventions, she would help to make what the book\'s author, James Watson, told her was the most important biological advance since his codiscovery of the structure of DNA. She and her collaborators turned a curiosity of nature into an invention that will transform the human race: an easy-to-use tool that can edit DNA. Known as CRISPR, it opened a brave new world of medical miracles and moral questions.', 1, '2023-04-28 18:51:40', NULL, 22, 41, 75),
(70, 'The Wise Men: Six Friends and the World They Made', 873, '45', '2012-03-11 23:00:00', 'With a new introduction by the authors, this is the classic account of the American statesmen who rebuilt the world after the catastrophe of World War II.\r\n\r\nA captivating blend of personal biography and public drama, The Wise Men introduces six close friends who shaped the role their country would play in the dangerous years following World War II.\r\n\r\nThey were the original best and brightest, whose towering intellects, outsize personalities, and dramatic actions would bring order to the postwar chaos and leave a legacy that dominates American policy to this day.', 1, '2023-04-28 19:03:10', NULL, 22, 41, 76),
(71, 'The Innovators', 560, '34', '2014-02-08 23:00:00', 'Following his blockbuster biography of Steve Jobs, Walter Isaacson\'s New York Times bestselling and critically acclaimed The Innovators is a \"riveting, propulsive, and at times deeply moving\" (The Atlantic) story of the people who created the computer and the internet.\r\n\r\nWhat were the talents that allowed certain inventors and entrepreneurs to turn their visionary ideas into disruptive realities? What led to their creative leaps? Why did some succeed and others fail?\r\n\r\nThe Innovators is a masterly saga of collaborative genius destined to be the standard history of the digital revolution-and an indispensable guide to how innovation really happens. Isaacson begins the adventure with Ada Lovelace, Lord Byron\'s daughter, who pioneered computer programming in the 1840s. He explores the fascinating personalities that created our current digital revolution, such as Vannevar Bush, Alan Turing, John von Neumann, J.C.R. Licklider, Doug Engelbart, Robert Noyce, Bill Gates, Steve Wozniak, Steve Jobs, Tim Berners-Lee, and Larry Page.', 1, '2023-04-28 19:04:23', NULL, 22, 41, 77),
(72, 'Leonardo da Vinci', 625, '53', '2017-04-11 22:00:00', 'The #1 New York Times bestseller from Walter Isaacson brings Leonardo da Vinci to life in this exciting new biography that is \"a study in creativity: how to define it, how to achieve it…Most important, it is a powerful story of an exhilarating mind and life\" (The New Yorker).\r\n\r\nBased on thousands of pages from Leonardo da Vinci\'s astonishing notebooks and new discoveries about his life and work, Walter Isaacson \"deftly reveals an intimate Leonardo\" (San Francisco Chronicle) in a narrative that connects his art to his science. He shows how Leonardo\'s genius was based on skills we can improve in ourselves, such as passionate curiosity, careful observation, and an imagination so playful that it flirted with fantasy.\r\n\r\nHe produced the two most famous paintings in history, The Last Supper and the Mona Lisa. With a passion that sometimes became obsessive, he pursued innovative studies of anatomy, fossils, birds, the heart, flying machines, botany, geology, and weaponry. He explored the math of optics, showed how light rays strike the cornea, and produced illusions of changing perspectives in The Last Supper. His ability to stand at the crossroads of the humanities and the sciences, made iconic by his drawing of Vitruvian Man, made him history\'s most creative genius.', 1, '2023-04-28 19:06:05', NULL, 22, 41, 78),
(73, 'Einstein: His Life and Universe', 710, '34', '2022-06-15 22:00:00', 'By the author of the acclaimed bestsellers Benjamin Franklin and Steve Jobs, this is the definitive biography of Albert Einstein.\r\n\r\nHow did his mind work? What made him a genius? Isaacson\'s biography shows how his scientific imagination sprang from the rebellious nature of his personality. His fascinating story is a testament to the connection between creativity and freedom.\r\n\r\nBased on newly released personal letters of Einstein, this book explores how an imaginative, impertinent patent clerk-a struggling father in a difficult marriage who couldn\'t get a teaching job or a doctorate-became the mind reader of the creator of the cosmos, the locksmith of the mysteries of the atom, and the universe. His success came from questioning conventional wisdom and marveling at mysteries that struck others as mundane. This led him to embrace a morality and politics based on respect for free minds, free spirits, and free individuals.', 1, '2023-04-28 19:07:41', NULL, 22, 41, 80),
(74, 'Green Eggs and Ham', 65, '66', '2013-08-01 22:00:00', 'Join in the fun with Sam-I-Am in this iconic classic by Dr. Seuss that will have readers of all ages craving Green Eggs and Ham! This is a beloved classic from the bestselling author of Horton Hears a Who!, The Lorax, and Oh, the Places You\'ll Go!\r\n\r\nWith unmistakable characters and signature rhymes, Dr. Seuss\'s beloved favorite has cemented its place as a children\'s classic. Kids will love the terrific tongue-twisters as the list of places to enjoy green eggs and ham gets longer and longer...and they might even learn a thing or two about trying new things!\r\n\r\nAnd don\'t miss the Netflix series adaptation!', 1, '2023-04-28 19:14:24', NULL, 23, 44, 81),
(75, 'Oh, the Places You\'ll Go!', 56, '45', '2013-01-02 23:00:00', 'Dr. Seuss\'s wonderfully wise Oh, the Places You\'ll Go! is the perfect gift to celebrate all of our special milestones-from graduations to birthdays and beyond!\r\n\r\nFrom soaring to high heights and seeing great sights to being left in a Lurch on a prickle-ly perch, Dr. Seuss addresses life\'s ups and downs with his trademark humorous verse and whimsical illustrations.\r\n\r\nThe inspiring and timeless message encourages readers to find the success that lies within, no matter what challenges they face. A perennial favorite and a perfect gift for anyone starting a new phase in their life!', 1, '2023-04-28 19:15:30', NULL, 23, 44, 82),
(76, 'One Fish Two Fish Red Fish Blue Fish', 67, '23', '2013-09-07 22:00:00', 'Count and explore the zany world and words of Seuss in this classic picture book.\r\n\r\nFrom counting to opposites to Dr. Seuss\'s signature silly rhymes, this book has everything a beginning reader needs! Meet the bumpy Wump and the singing Ying, and even the winking Yink who drinks pink ink. The silly rhymes and colorful cast of characters will have every child giggling from morning to night.\r\n\r\nOriginally created by Dr. Seuss himself, Beginner Books are fun, funny, and easy to read. These unjacketed hardcover early readers encourage children to read all on their own, using simple words and illustrations. Smaller than the classic large format Seuss picture books like The Lorax and Oh, the Places You\'ll Go!, these portable packages are perfect for practicing readers ages 3-7, and lucky parents too!', 1, '2023-04-28 19:17:42', NULL, 23, 44, 83),
(77, 'The Cat in the Hat', 345, '14', '2013-09-01 22:00:00', 'Have a ball with Dr. Seuss and the Cat in the Hat in this classic picture book...but don\'t forget to clean up your mess!\r\n\r\nA dreary day turns into a wild romp when this beloved story introduces readers to the Cat in the Hat and his troublemaking friends, Thing 1 and Thing 2. A favorite among kids, parents and teachers, this story uses simple words and basic ryhme to encourage and delight beginning readers.\r\n\r\nOriginally created by Dr. Seuss himself, Beginner Books are fun, funny, and easy to read. These unjacketed hardcover early readers encourage children to read all on their own, using simple words and illustrations. Smaller than the classic large format Seuss picture books like The Lorax and Oh, The Places You\'ll Go!, these portable packages are perfect for practicing readers ages 3-7, and lucky parents too!', 1, '2023-04-28 19:18:52', NULL, 23, 44, 84),
(78, 'How the Grinch Stole Christmas', 64, '12', '2013-02-11 23:00:00', 'Grow your heart three sizes and get in on all of the Grinch-mas cheer with this Christmas classic--the ultimate Dr. Seuss holiday book that no collection is complete without!\r\n\r\nEvery Who down in Who-ville liked Christmas a lot . . . but the Grinch, who lived just north of Who-ville, did NOT!\r\n\r\nNot since \"\'Twas the night before Christmas\" has the beginning of a Christmas tale been so instantly recognizable. This heartwarming story about the effects of the Christmas spirit will grow even the coldest and smallest of hearts. Like mistletoe, candy canes, and caroling, the Grinch is a mainstay of the holidays, and his story is the perfect gift for readers young and old.', 1, '2023-04-28 19:20:04', NULL, 23, 44, 85),
(79, 'Fox in Socks', 62, '13', '2013-07-16 22:00:00', 'Find out how wacky words can be with Dr. Seuss and the Fox in Socks in this classic hardcover picture book of tongue tanglers!\r\n\r\nThis rhyming romp includes chicks with bricks, chewy blue glue, a noodle eating poodle, and so much more! Just try to keep your tongue out of trouble! Seuss piles his the energetic rhymes into a mountain of hilarity that the whole family will enjoy. Rhyming has never been this fun!\r\n\r\nOriginally created by Dr. Seuss himself, Beginner Books are fun, funny, and easy to read. These unjacketed hardcover early readers encourage children to read all on their own, using simple words and illustrations. Smaller than the classic large format Seuss picture books like The Lorax and Oh, The Places You\'ll Go!, these portable packages are perfect for practicing readers ages 3-7, and lucky parents too!', 1, '2023-04-28 19:23:13', NULL, 23, 44, 86),
(80, 'The Sneetches and Other Stories', 72, '11', '2013-06-24 22:00:00', 'An iconic collection of original stories from Dr. Seuss that includes the official versions of \"The Sneetches,\" \"The Zax,\" \"Too Many Daves,\" and \"What Was I Scared Of?\" This is a beloved classic that deserves a place in every child\'s library-from the bestselling author of Horton Hears a Who!, The Lorax, and Oh, the Places You\'ll Go!\r\n\r\nIn these four timeless stories, Dr. Seuss challenges the assumption that we need to look the same or behave the same to find common ground. Filled with Dr. Seuss\'s signature rhymes and lively humor, this classic story collection is a must-have for readers of all ages, and is ideal for sparking discussions about tolerance, diversity, and acceptance.', 1, '2023-04-28 19:24:36', NULL, 23, 44, 87),
(81, 'The Lorax', 72, '14', '2013-02-15 23:00:00', 'Celebrate Earth Day with Dr. Seuss and the Lorax in this classic picture book about protecting the environment!\r\n\r\nDr. Seuss\'s beloved story teaches kids to speak up and stand up for those who can\'t. With a recycling-friendly \"Go Green\" message, The Lorax allows young readers to experience the beauty of the Truffula Trees and the danger of taking our earth for granted, all in a story that is timely, playful and hopeful. The book\'s final pages teach us that just one small seed, or one small child, can make a difference.\r\n\r\nPrinted on recycled paper, this book is the perfect gift for Earth Day and for any child-or child at heart-who is interested in recycling, advocacy and the environment, or just loves nature and playing outside.', 1, '2023-04-28 19:26:57', NULL, 23, 44, 88),
(82, 'Dr. Seuss\'s ABC', 63, '14', '2013-03-01 23:00:00', 'Arguably the most entertaining alphabet book ever written, this classic Beginner Book by Dr. Seuss is perfect for children learning their ABCs. Featuring a fantastic cast of zany characters-from Aunt Annie\'s alligator to the Zizzer-Zazzer-Zuzz, with a lazy lion licking a lollipop and an ostrich oiling an orange owl-Dr. Seuss\'s ABC is a must-have for every young child\'s library.\r\n\r\nOriginally created by Dr. Seuss, Beginner Books encourage children to read all by themselves, with simple words and illustrations that give clues to their meaning.', 1, '2023-04-28 19:27:53', NULL, 23, 44, 89),
(83, 'Hop on Pop', 75, '9', '2013-05-11 22:00:00', 'Join Dr. Seuss in this classic rhyming picture book-\"the simplest Seuss for youngest use.\"\r\n\r\nFull of short, simple words and silly rhymes, this book is perfect for reading alone or reading aloud with Dad!  The rollicking rythym will keep kids entertained on every page, and it\'s an especially good way to  show Pop some love on Father\'s Day!\r\n\r\nOriginally created by Dr. Seuss himself, Beginner Books are fun, funny, and easy to read. These unjacketed hardcover early readers encourage children to read all on their own, using simple words and illustrations. Smaller than the classic large format Seuss picture books like The Lorax and Oh, The Places You\'ll Go!, these portable packages are perfect for practicing readers ages 3-7, and lucky parents too!', 1, '2023-04-28 19:29:13', NULL, 23, 44, 90),
(84, 'Matilda', 240, '21', '2007-12-02 23:00:00', 'Now a musical on broadway and streaming on Netflix!\r\n\r\nMatilda is a sweet, exceptional young girl, but her parents think she\'s just a nuisance. She expects school to be different but there she has to face Miss Trunchbull, a menacing, kid-hating headmistress. When Matilda is attacked by the Trunchbull she suddenly discovers she has a remarkable power with which to fight back. It\'ll take a superhuman genius to give Miss Trunchbull what she deserves and Matilda may be just the one to do it!\r\n\r\nHere is Roald Dahl\'s original novel of a little girl with extraordinary powers. This much-loved story has recently been made into a wonderful new musical, adapted by Dennis Kelly with music and lyrics by Tim Minchin.', 1, '2023-04-28 19:38:00', NULL, 24, 45, 91),
(85, 'Charlie and the Chocolate Factory', 162, '14', '2007-04-25 22:00:00', 'Willy Wonka\'s famous chocolate factory is opening at last!\r\n\r\nBut only five lucky children will be allowed inside. And the winners are: Augustus Gloop, an enormously fat boy whose hobby is eating; Veruca Salt, a spoiled-rotten brat whose parents are wrapped around her little finger; Violet Beauregarde, a dim-witted gum-chewer with the fastest jaws around; Mike Teavee, a toy pistol-toting gangster-in-training who is obsessed with television; and Charlie Bucket, Our Hero, a boy who is honest and kind, brave and true, and good and ready for the wildest time of his life!\r\n\r\n', 1, '2023-04-28 19:39:00', NULL, 24, 45, 92),
(86, 'James and the Giant Peach', 153, '14', '2007-08-23 22:00:00', 'From the World\'s No. 1 Storyteller, James and the Giant Peach is a children\'s classic that has captured young reader\'s imaginations for generations.\r\n\r\nOne of TIME MAGAZINE\'s 100 Best Fantasy Books of All Time\r\n\r\nAfter James Henry Trotter\'s parents are tragically eaten by a rhinoceros, he goes to live with his two horrible aunts, Spiker and Sponge. Life there is no fun, until James accidentally drops some magic crystals by the old peach tree and strange things start to happen. The peach at the top of the tree begins to grow, and before long it\'s as big as a house. Inside, James meets a bunch of oversized friends-Grasshopper, Centipede, Ladybug, and more. With a snip of the stem, the peach starts rolling away, and the great adventure begins!', 1, '2023-04-28 19:40:21', NULL, 24, 45, 93),
(87, 'The BFG', 208, '16', '2007-01-20 23:00:00', 'Roald Dahl\'s beloved novel hits the big screen in July 2016 in a major motion picture adaptation directed by Steven Spielberg from Amblin Entertainment and Walt Disney Pictures.\r\n\r\nWhen Sophie is snatched from her orphanage bed by the BFG (Big Friendly Giant), she fears she will be eaten. But instead the two join forces to vanquish the nine other far less gentle giants who threaten to consume earth\'s children. This beautiful hardcover gift edition of Dahl\'s classic features the original illustrations by Quentin Blake, as well as a silk ribbon marker, acid-free paper, gilt stamping on a full-cloth cover, decorative endpapers, and a sewn binding.', 1, '2023-04-28 19:41:37', NULL, 24, 45, 94),
(88, 'Charlie and the Great Glass Elevator', 165, '13', '2007-06-20 22:00:00', 'From the bestselling author of Charlie and the Chocolate Factory and The BFG!\r\n\r\nLast seen flying through the sky in a giant elevator in Charlie and the Chocolate Factory, Charlie Bucket\'s back for another adventure. When the giant elevator picks up speed, Charlie, Willy Wonka, and the gang are sent hurtling through space and time. Visiting the world\'\' first space hotel, battling the dreaded Vermicious Knids, and saving the world are only a few stops along this remarkable, intergalactic joyride.', 1, '2023-04-28 19:42:36', NULL, 24, 45, 95),
(89, 'Dreamland', 359, '16', '2022-11-03 23:00:00', '#1 NEW YORK TIMES BESTSELLER • A twist you won\'t see coming. A love story you\'ll never forget. From the acclaimed author of The Notebook comes a powerful novel about risking everything for a dream-and whether it\'s possible to leave the past behind.\r\n\r\nWe don\'t always get to choose our paths in life; sometimes they choose us.\r\n\r\nAfter fleeing an abusive husband with her six-year-old son, Tommie, Beverly is attempting to create a new life for them in a small town off the beaten track. Despite their newfound freedom, Beverly is constantly on guard: she creates a fake backstory, wears a disguise around town, and buries herself in DIY projects to stave off anxiety. But her stress only rises when Tommie insists he\'d been hearing someone walking on the roof and calling his name late at night. With money running out and danger seemingly around every corner, she makes a desperate decision that will rewrite everything she knows to be true. . . .', 1, '2023-04-29 07:01:23', NULL, 25, 46, 96),
(90, 'The Wish', 401, '21', '2021-03-16 23:00:00', 'With exclusive travel photos and a special letter from the Author, only available for e-readers.\r\n\r\nFrom the author of The Longest Ride and The Return comes a novel about the enduring legacy of first love, and the decisions that haunt us forever.\r\n\r\n1996 was the year that changed everything for Maggie Dawes. Sent away at sixteen to live with an aunt she barely knew in Ocracoke, a remote village on North Carolina\'s Outer Banks, she could think only of the friends and family she left behind . . . until she met Bryce Trickett, one of the few teenagers on the island. Handsome, genuine, and newly admitted to West Point, Bryce showed her how much there was to love about the wind-swept beach town-and introduced her to photography, a passion that would define the rest of her life.', 1, '2023-04-29 07:02:36', NULL, 25, 46, 97),
(91, 'Every Breath', 321, '32', '2018-04-23 22:00:00', 'Treat yourself to an epic #1 New York Times bestselling love story that spans decades and continents as two people at a crossroads -- one from North Carolina and one from Zimbabwe -- experience the transcendence and heartbreak of true love.\r\n\r\nHope Anderson has some important choices to make. At thirty-six, she\'s been dating her boyfriend, an orthopedic surgeon, for six years. With no wedding plans in sight, and her father recently diagnosed with ALS, she decides to use a week at her family\'s cottage in Sunset Beach, North Carolina, to ready the house for sale and mull over some difficult decisions about her future.\r\n\r\nTru Walls has never visited North Carolina but is summoned to Sunset Beach by a letter from a man claiming to be his father. A safari guide, born and raised in Zimbabwe, Tru hopes to unravel some of the mysteries surrounding his mother\'s early life and recapture memories lost with her death. When the two strangers cross paths, their connection is as electric as it is unfathomable . . . but in the immersive days that follow, their feelings for each other will give way to choices that pit family duty against personal happiness in devastating ways.', 1, '2023-04-29 07:03:55', NULL, 25, 46, 98),
(92, 'The Return', 369, '64', '2020-06-20 22:00:00', 'In the romantic tradition of Dear John, an injured Navy doctor meets two extremely important women whose secrets will change the course of his life in this #1 New York Times bestseller.\r\n\r\nTrevor Benson never intended to move back to New Bern, North Carolina. But when a mortar blast outside the hospital where he worked sent him home from Afghanistan with devastating injuries, the dilapidated cabin he\'d inherited from his grandfather seemed as good a place to regroup as any.\r\n\r\nTending to his grandfather\'s beloved beehives, Trevor isn\'t prepared to fall in love with a local . . . yet, from their very first encounter, Trevor feels a connection with deputy sheriff Natalie Masterson that he can\'t ignore. But even as she seems to reciprocate his feelings, she remains frustratingly distant, making Trevor wonder what she\'s hiding.', 1, '2023-04-29 07:05:09', NULL, 25, 46, 99),
(93, 'The Rescue', 433, '43', '2000-05-11 22:00:00', 'In this heartfelt Southern love story from the #1 New York Times bestselling author of The Notebook, a daring fireman rescues a single mom-and learns that falling in love is the greatest risk of all.\r\n\r\nWhen confronted by raging fires or deadly accidents, volunteer fireman Taylor McAden feels compelled to take terrifying risks to save lives. But there is one leap of faith Taylor can\'t bring himself to make: he can\'t fall in love. For all his adult years, Taylor has sought out women who need to be rescued, women he leaves as soon as their crisis is over and the relationship starts to become truly intimate.\r\n\r\nWhen a raging storm hits his small Southern town, single mother Denise Holton\'s car skids off the road. The young mom is with her four-year-old son Kyle, a boy with severe learning disabilities and for whom she has sacrificed everything. Taylor McAden finds her unconscious and bleeding, but does not find Kyle. When Denise wakes, the chilling truth becomes clear to both of them. Kyle is gone. During the search for Kyle, a connection between Taylor and Denise takes root. But Taylor doesn\'t know that this rescue will be different from all the others.', 1, '2023-04-29 07:07:13', NULL, 25, 46, 100),
(94, 'A Bend in the Road', 388, '56', '2001-03-20 23:00:00', 'Fall in love with this small-town love story about a widower sheriff and a divorced schoolteacher who are searching for second chances -- only to be threatened by long-held secrets of the past.\r\n\r\nMiles Ryan\'s life seemed to end the day his wife was killed in a hit-and-run accident two years ago. As deputy sheriff of New Bern, North Carolina, he not only grieves for her and worries about their young son Jonah but longs to bring the unknown driver to justice. Then Miles meets Sarah Andrews, Jonah\'s second-grade teacher. A young woman recovering from a difficult divorce, Sarah moved to New Bern hoping to start over. Tentatively, Miles and Sarah reach out to each other...soon they are falling in love. But what neither realizes is that they are also bound together by a shocking secret, one that will force them to reexamine everything they believe in-including their love.', 1, '2023-04-29 07:09:29', NULL, 25, 46, 101),
(95, 'True Believer', 480, '23', '2005-06-23 22:00:00', 'Part love story and part ghost story, this is an unforgettable New York Times bestseller about a science journalist and a North Carolina librarian who dare to believe in the impossible.\r\n\r\nAs a science journalist with a regular column in Scientific American, Jeremy Marsh specializes in debunking the supernatural-until he falls in love with the granddaughter of the town psychic.\r\n\r\nWhen Jeremy receives a letter from Boone Creek, North Carolina, about ghostly lights appearing in a cemetery, he can\'t resist driving down to investigate. Here, in this tightly knit community, Lexie Darnell runs the town\'s library. Disappointed by past relationships, she is sure of one thing: her future is in Boone Creek, close to all the people she loves. From the moment Jeremy sets eyes on Lexie, he is intrigued. And Lexie, while hesitating to trust this outsider, finds herself thinking of him more than she cares to admit. Now, if they are to be together, Jeremy must do something he\'s never done before-take a giant leap of faith.', 1, '2023-04-29 07:10:57', NULL, 25, 46, 102),
(96, 'The Guardian', 494, '12', '2003-02-01 23:00:00', 'After her husband\'s death, a young widow with a faithful Great Dane must decide between two men -- but as new love blossoms, jealousy turns deadly in this suspenseful New York Times bestseller.\r\n\r\nJulie Barenson\'s young husband left her two unexpected gifts before he died - a Great Dane puppy named Singer and the promise that he would always be watching over her. Now four years have passed. Still living in the small town of Swansboro, North Carolina, twenty-nine-year-old Julie is emotionally ready to make a commitment to someone again. But who?\r\n\r\nShould it be Richard Franklin, the handsome, sophisticated engineer who treats her like a queen? Or Mike Harris, the down-to-earth nice guy who was her husband\'s best friend? Choosing one of them should bring her more happiness than she\'s had in years. Instead, Julie is soon fighting for her life in a nightmare spawned by a chilling deception and jealousy so poisonous that it has become a murderous desire...', 1, '2023-04-29 07:12:04', NULL, 25, 46, 103),
(97, 'See Me', 489, '34', '2015-08-23 22:00:00', 'In this suspenseful New York Times bestseller, a chance encounter between a successful lawyer and a rebellious bad boy will change life as they know it forever, as their pasts catch up with them . . .\r\n\r\nColin Hancock is giving his second chance his best shot. With a history of violence and bad decisions behind him and the threat of prison dogging his every step, he\'s determined to walk a straight line. To Colin, that means applying himself single-mindedly toward his teaching degree and avoiding everything that proved destructive in his earlier life. Reminding himself daily of his hard-earned lessons, the last thing he is looking for is a serious relationship.\r\n\r\nMaria Sanchez, the hardworking daughter of Mexican immigrants, is the picture of conventional success. With a degree from Duke Law School and a job at a prestigious firm in Wilmington, she is a dark-haired beauty with a seemingly flawless professional track record. And yet Maria has a traumatic history of her own, one that compelled her to return to her hometown and left her questioning so much of what she once believed.', 1, '2023-04-29 07:13:27', NULL, 25, 46, 104),
(98, 'Two by Two', 497, '45', '2016-07-21 22:00:00', 'In this New York Times bestseller, a single father discovers the true nature of unconditional love when a new chance at happiness turns his world upside down.\r\n\r\nAt 32, Russell Green has it all: a stunning wife, a lovable six year-old daughter, a successful career as an advertising executive, and an expansive home in Charlotte. He is living the dream, and his marriage to the bewitching Vivian is at the center of it. But underneath the shiny surface of this perfect existence, fault lines are beginning to appear . . . and no one is more surprised than Russ when every aspect of the life he has taken for granted is turned upside down.\r\nIn a matter of months, Russ finds himself without a job or a wife, caring for his young daughter while struggling to adapt to a new and baffling reality. Throwing himself into the wilderness of single parenting, Russ embarks on a journey at once terrifying and rewarding -- one that will test his abilities and his emotional resources beyond anything he\'s ever imagined.\r\n', 1, '2023-04-29 07:14:37', NULL, 25, 46, 105),
(99, 'The Choice: The Dragon Heart Legacy', 438, '23', '2022-07-21 22:00:00', 'The conclusion of the epic trilogy from the #1 New York Times bestselling author of The Awakening and The Becoming.\r\n\r\nTalamh is a land of green hills, high mountains, deep forests, and seas, where magicks thrive. But portals allow for passage in and out-and ultimately, each must choose their place, and choose between good and evil, war and peace, life and death…\r\n\r\nBreen Siobhan Kelly grew up in the world of Man and was once unaware of her true nature. Now she is in Talamh, trying to heal after a terrible battle and heartbreaking losses. Her grandfather, the dark god Odran, has been defeated in his attempt to rule over Talamh, and over Breen-for now.', 1, '2023-04-29 08:34:50', NULL, 26, 47, 106),
(100, 'The Becoming: The Dragon Heart Legacy', 444, '34', '2021-01-25 23:00:00', 'A new epic of love and war among gods and humans, from Nora Roberts-the #1 New York Times bestselling author of The Awakening.\r\n\r\nThe world of magick and the world of man have long been estranged from one another. But some can walk between the two-including Breen Siobhan Kelly. She has just returned to Talamh, with her friend, Marco, who\'s dazzled and disoriented by this realm-a place filled with dragons and faeries and mermaids (but no WiFi, to his chagrin). In Talamh, Breen is not the ordinary young schoolteacher he knew her as. Here she is learning to embrace the powers of her true identity. Marco is welcomed kindly by her people-and by Keegan, leader of the Fey. Keegan has trained Breen as a warrior, and his yearning for her has grown along with his admiration of her strength and skills.\r\n\r\nBut one member of Breen\'s bloodline is not there to embrace her. Her grandfather, the outcast god Odran, plots to destroy Talamh-and now all must unite to defeat his dark forces. There will be losses and sorrows, betrayal and bloodshed. But through it, Breen Siobhan Kelly will take the next step on the journey to becoming all that she was born to be.', 1, '2023-04-29 08:36:09', NULL, 26, 47, 107),
(101, 'The Awakening: The Dragon Heart Legacy', 345, '23', '2020-03-20 23:00:00', '#1 New York Times bestselling author Nora Roberts begins a new trilogy of adventure, romance, and magick in The Awakening.\r\n\r\nIn the realm of Talamh, a teenage warrior named Keegan emerges from a lake holding a sword-representing both power and the terrifying responsibility to protect the Fey. In another realm known as Philadelphia, a young woman has just discovered she possesses a treasure of her own…\r\n\r\nWhen Breen Kelly was a girl, her father would tell her stories of magical places. Now she\'s an anxious twentysomething mired in student debt and working a job she hates. But one day she stumbles upon a shocking discovery: her mother has been hiding an investment account in her name. It has been funded by her long-lost father-and it\'s worth nearly four million dollars.', 1, '2023-04-29 08:37:17', NULL, 26, 47, 108),
(102, 'Nightwork', 440, '54', '2022-04-23 22:00:00', '#1 New York Times bestselling author Nora Roberts introduces an unforgettable thief in an unputdownable new novel…\r\n\r\nGreed. Desire. Obsession. Revenge . . . It\'s all in a night\'s work.\r\n\r\nHarry Booth started stealing at nine to keep a roof over his ailing mother\'s head, slipping into luxurious, empty homes at night to find items he could trade for precious cash. When his mother finally succumbed to cancer, he left Chicago-but kept up his nightwork, developing into a master thief with a code of honor and an expertise in not attracting attention?or getting attached.', 1, '2023-04-29 08:38:37', NULL, 26, 47, 109),
(103, 'Courting Catherine: The Calhoun Women', 141, '34', '2020-03-21 23:00:00', 'First in The Calhoun Women series, #1 New York Times bestselling author Nora Roberts\'s Courting Catherine begins a story of sisters bound by their family\'s ancestral home and determined to forge their own futures.\r\n\r\nThe once grand mansion known as the Towers has stood on the Maine coast for decades. It was supposed to symbolize the Calhoun family legacy, but instead has fallen into a desperate state of disrepair. Catherine \\\"C. C.\\\" Calhoun and her sisters have inherited both the mansion and the responsibility of restoring the Towers back to its former glory-only to struggle with escalating costs.\r\n\r\nHotelier Trenton St. James believes the estate\'s time has passed and that the town would be served better if the property were converted into a luxury resort. But his business negotiation skills fail to persuade C. C.-whose fighting spirit and driving passions capture his heart and compel him to build something more loving and lasting between them.', 1, '2023-04-29 08:40:13', NULL, 26, 47, 110),
(104, 'Truman', 1120, '54', '2003-08-02 22:00:00', 'The Pulitzer Prize-winning biography of Harry S. Truman, whose presidency included momentous events from the atomic bombing of Japan to the outbreak of the Cold War and the Korean War, told by America\'s beloved and distinguished historian.\r\n\r\nThe life of Harry S. Truman is one of the greatest of American stories, filled with vivid characters-Roosevelt, Churchill, Stalin, Eleanor Roosevelt, Bess Wallace Truman, George Marshall, Joe McCarthy, and Dean Acheson-and dramatic events. In this riveting biography, acclaimed historian David McCullough not only captures the man-a more complex, informed, and determined man than ever before imagined-but also the turbulent times in which he rose, boldly, to meet unprecedented challenges. The last president to serve as a living link between the nineteenth and the twentieth centuries, Truman\'s story spans the raw world of the Missouri frontier, World War I, the powerful Pendergast machine of Kansas City, the legendary Whistle-Stop Campaign of 1948, and the decisions to drop the atomic bomb, confront Stalin at Potsdam, send troops to Korea, and fire General MacArthur. Drawing on newly discovered archival material and extensive interviews with Truman\'s own family, friends, and Washington colleagues, McCullough tells the deeply moving story of the seemingly ordinary \"man from Missouri\" who was perhaps the most courageous president in our history.', 1, '2023-04-29 08:43:07', NULL, 19, 49, 111),
(105, 'The Path Between the Seas', 420, '12', '2001-09-02 22:00:00', 'The National Book Award-winning epic chronicle of the creation of the Panama Canal, a first-rate drama of the bold and brilliant engineering feat that was filled with both tragedy and triumph, told by master historian David McCullough.\r\n\r\nFrom the Pulitzer Prize-winning author of Truman, here is the national bestselling epic chronicle of the creation of the Panama Canal. In The Path Between the Seas, acclaimed historian David McCullough delivers a first-rate drama of the sweeping human undertaking that led to the creation of this grand enterprise.\r\n\r\nThe Path Between the Seas tells the story of the men and women who fought against all odds to fulfill the 400-year-old dream of constructing an aquatic passageway between the Atlantic and Pacific oceans. It is a story of astonishing engineering feats, tremendous medical accomplishments, political power plays, heroic successes, and tragic failures. Applying his remarkable gift for writing lucid, lively exposition, McCullough weaves the many strands of the momentous event into a comprehensive and captivating tale.', 1, '2023-04-29 08:44:17', NULL, 19, 49, 112),
(106, 'The Pioneers', 353, '43', '2019-01-03 23:00:00', 'The #1 New York Times bestseller by Pulitzer Prize-winning historian David McCullough rediscovers an important chapter in the American story that\'s \\\"as resonant today as ever\\\" (The Wall Street Journal)-the settling of the Northwest Territory by courageous pioneers who overcame incredible hardships to build a community based on ideals that would define our country.\r\n\r\nAs part of the Treaty of Paris, in which Great Britain recognized the new United States of America, Britain ceded the land that comprised the immense Northwest Territory, a wilderness empire northwest of the Ohio River containing the future states of Ohio, Indiana, Illinois, Michigan, and Wisconsin. A Massachusetts minister named Manasseh Cutler was instrumental in opening this vast territory to veterans of the Revolutionary War and their families for settlement. Included in the Northwest Ordinance were three remarkable conditions: freedom of religion, free universal education, and most importantly, the prohibition of slavery. In 1788 the first band of pioneers set out from New England for the Northwest Territory under the leadership of Revolutionary War veteran General Rufus Putnam. They settled in what is now Marietta on the banks of the Ohio River\r\n\r\nMcCullough tells the story through five major characters: Cutler and Putnam; Cutler\'s son Ephraim; and two other men, one a carpenter turned architect, and the other a physician who became a prominent pioneer in American science. \"With clarity and incisiveness, [McCullough] details the experience of a brave and broad-minded band of people who crossed raging rivers, chopped down forests, plowed miles of land, suffered incalculable hardships, and braved a lonely frontier to forge a new American ideal\" (The Providence Journal).', 1, '2023-04-29 08:45:34', NULL, 19, 49, 113),
(107, '1776', 365, '54', '2005-05-02 22:00:00', 'America\'s beloved and distinguished historian presents, in a book of breathtaking excitement, drama, and narrative force, the stirring story of the year of our nation\'s birth, 1776, interweaving, on both sides of the Atlantic, the actions and decisions that led Great Britain to undertake a war against her rebellious colonial subjects and that placed America\'s survival in the hands of George Washington.\r\n\r\nIn this masterful book, David McCullough tells the intensely human story of those who marched with General George Washington in the year of the Declaration of Independence-when the whole American cause was riding on their success, without which all hope for independence would have been dashed and the noble ideals of the Declaration would have amounted to little more than words on paper.', 1, '2023-04-29 08:46:32', NULL, 19, 49, 114),
(108, 'The Great Bridge', 609, '34', '2007-03-20 23:00:00', 'The dramatic and enthralling story of the building of the Brooklyn Bridge, the world\'s longest suspension bridge at the time, a tale of greed, corruption, and obstruction but also of optimism, heroism, and determination, told by master historian David McCullough.\r\n\r\nThis monumental book is the enthralling story of one of the greatest events in our nation\'s history, during the Age of Optimism-a period when Americans were convinced in their hearts that all things were possible.\r\n\r\nIn the years around 1870, when the project was first undertaken, the concept of building an unprecedented bridge to span the East River between the great cities of Manhattan and Brooklyn required a vision and determination comparable to that which went into the building of the great cathedrals. Throughout the fourteen years of its construction, the odds against the successful completion of the bridge seemed staggering. Bodies were crushed and broken, lives lost, political empires fell, and surges of public emotion constantly threatened the project. But this is not merely the saga of an engineering miracle; it is a sweeping narrative of the social climate of the time and of the heroes and rascals who had a hand in either constructing or exploiting the surpassing enterprise.', 1, '2023-04-29 08:47:50', NULL, 19, 49, 115);
INSERT INTO `book` (`id`, `name`, `page_count`, `price`, `release_date`, `description`, `status`, `created_at`, `deleted_at`, `publisher_id`, `user_id`, `image_id`) VALUES
(109, 'The Wright Brothers', 56, '23', '2022-04-30 22:00:00', 'The aim of this book has been to satisfy the curiosity of the average, non-technical reader regarding the work of the Wright Brothers, and to do so as simply as possible. This book has been vetted for accuracy by Orville Wright himself, who has read the manuscript and given generously of his time in verifying the accuracy of various statements and in correcting inaccuracies that otherwise would have appeared.', 1, '2023-04-29 08:48:35', NULL, 19, 49, 116),
(110, 'John Adams', 752, '34', '2001-11-30 23:00:00', 'The Pulitzer Prize-winning, bestselling biography of America\'s founding father and second president that was the basis for the acclaimed HBO series, brilliantly told by master historian David McCullough.\r\n\r\nIn this powerful, epic biography, David McCullough unfolds the adventurous life journey of John Adams, the brilliant, fiercely independent, often irascible, always honest Yankee patriot who spared nothing in his zeal for the American Revolution; who rose to become the second president of the United States and saved the country from blundering into an unnecessary war; who was learned beyond all but a few and regarded by some as \"out of his senses\"; and whose marriage to the wise and valiant Abigail Adams is one of the moving love stories in American history.\r\n\r\nThis is history on a grand scale-a book about politics and war and social issues, but also about human nature, love, religious faith, virtue, ambition, friendship, and betrayal, and the far-reaching consequences of noble ideas. Above all, John Adams is an enthralling, often surprising story of one of the most important and fascinating Americans who ever lived.', 1, '2023-04-29 08:54:56', NULL, 19, 49, 117),
(111, 'Brave Companions', 258, '23', '2007-06-30 22:00:00', 'From Alexander von Humboldt to Charles and Anne Lindbergh, these are stories of people of great vision and daring whose achievements continue to inspire us today, brilliantly told by master historian David McCullough.\r\n\r\nThe bestselling author of Truman and John Adams, David McCullough has written profiles of exceptional men and women past and present who have not only shaped the course of history or changed how we see the world but whose stories express much that is timeless about the human condition.\r\n\r\nHere are Alexander von Humboldt, whose epic explorations of South America surpassed the Lewis and Clark expedition; Harriet Beecher Stowe, \"the little woman who made the big war\"; Frederic Remington; the extraordinary Louis Agassiz of Harvard; Charles and Anne Lindbergh, and their fellow long-distance pilots Antoine de Saint-Exupéry and Beryl Markham; Harry Caudill, the Kentucky lawyer who awakened the nation to the tragedy of Appalachia; and David Plowden, a present-day photographer of vanishing America.', 1, '2023-04-29 08:56:19', NULL, 19, 49, 118),
(112, 'Mornings on Horseback', 450, '23', '2007-07-01 22:00:00', 'The National Book Award-winning biography that tells the story of how young Teddy Roosevelt transformed himself from a sickly boy into the vigorous man who would become a war hero and ultimately president of the United States, told by master historian David McCullough.\r\n\r\nMornings on Horseback is the brilliant biography of the young Theodore Roosevelt. Hailed as \\\"a masterpiece\\\" (John A. Gable, Newsday), it is the winner of the Los Angeles Times 1981 Book Prize for Biography and the National Book Award for Biography. Written by David McCullough, the author of Truman, this is the story of a remarkable little boy, seriously handicapped by recurrent and almost fatal asthma attacks, and his struggle to manhood: an amazing metamorphosis seen in the context of the very uncommon household in which he was raised.\r\n\r\nThe father is the first Theodore Roosevelt, a figure of unbounded energy, enormously attractive and selfless, a god in the eyes of his small, frail namesake. The mother, Mittie Bulloch Roosevelt, is a Southerner and a celebrated beauty, but also considerably more, which the book makes clear as never before. There are sisters Anna and Corinne, brother Elliott (who becomes the father of Eleanor Roosevelt), and the lovely, tragic Alice Lee, TR\'s first love. All are brought to life to make \"a beautifully told story, filled with fresh detail\" (The New York Times Book Review).', 1, '2023-04-29 08:58:03', NULL, 19, 49, 119),
(113, 'Johnstown Flood', 443, '34', '2007-01-30 23:00:00', 'The stunning story of one of America\'s great disasters, a preventable tragedy of Gilded Age America, brilliantly told by master historian David McCullough.\r\n\r\nAt the end of the nineteenth century, Johnstown, Pennsylvania, was a booming coal-and-steel town filled with hardworking families striving for a piece of the nation\'s burgeoning industrial prosperity. In the mountains above Johnstown, an old earth dam had been hastily rebuilt to create a lake for an exclusive summer resort patronized by the tycoons of that same industrial prosperity, among them Andrew Carnegie, Henry Clay Frick, and Andrew Mellon. Despite repeated warnings of possible danger, nothing was done about the dam. Then came May 31, 1889, when the dam burst, sending a wall of water thundering down the mountain, smashing through Johnstown, and killing more than 2,000 people. It was a tragedy that became a national scandal.\r\n\r\nGraced by David McCullough\'s remarkable gift for writing richly textured, sympathetic social history, The Johnstown Flood is an absorbing, classic portrait of life in nineteenth-century America, of overweening confidence, of energy, and of tragedy. It also offers a powerful historical lesson for our century and all times: the danger of assuming that because people are in positions of responsibility they are necessarily behaving responsibly.', 1, '2023-04-29 08:59:05', NULL, 19, 49, 120),
(114, 'Team of Rivals', 954, '34', '2006-12-05 23:00:00', 'Winner of the Lincoln Prize\r\n\r\nAcclaimed historian Doris Kearns Goodwin illuminates Abraham Lincoln\'s political genius in this highly original work, as the one-term congressman and prairie lawyer rises from obscurity to prevail over three gifted rivals of national reputation to become president.\r\n\r\nOn May 18, 1860, William H. Seward, Salmon P. Chase, Edward Bates, and Abraham Lincoln waited in their hometowns for the results from the Republican National Convention in Chicago. When Lincoln emerged as the victor, his rivals were dismayed and angry.', 1, '2023-04-29 09:00:11', NULL, 19, 48, 121),
(115, 'No Ordinary Time', 771, '12', '2008-04-30 22:00:00', 'Doris Kearns Goodwin\'s Pulitzer Prize-winning classic about the relationship between Franklin D. Roosevelt and Eleanor Roosevelt, and how it shaped the nation while steering it through the Great Depression and the outset of World War II.\r\n\r\nWith an extraordinary collection of details, Goodwin masterfully weaves together a striking number of story lines-Eleanor and Franklin\'s marriage and remarkable partnership, Eleanor\'s life as First Lady, and FDR\'s White House and its impact on America as well as on a world at war. Goodwin effectively melds these details and stories into an unforgettable and intimate portrait of Eleanor and Franklin Roosevelt and of the time during which a new, modern America was born.', 1, '2023-04-29 09:01:07', NULL, 19, 48, 122),
(116, 'Leadership', 497, '34', '2018-08-02 22:00:00', 'From Pulitzer Prize-winning author and esteemed presidential historian Doris Kearns Goodwin, an invaluable guide to the development and exercise of leadership from Abraham Lincoln, Theodore Roosevelt, Lyndon B. Johnson, and Franklin D. Roosevelt.\r\n\r\nThe inspiration for the multipart HISTORY Channel series Abraham Lincoln and Theodore Roosevelt.\r\n\r\n\"After five decades of magisterial output, Doris Kearns Goodwin leads the league of presidential historians\" (USA TODAY). In her \"inspiring\" (The Christian Science Monitor) Leadership, Doris Kearns Goodwin draws upon the four presidents she has studied most closely-Abraham Lincoln, Theodore Roosevelt, Franklin D. Roosevelt, and Lyndon B. Johnson (in civil rights)-to show how they recognized leadership qualities within themselves and were recognized as leaders by others. By looking back to their first entries into public life, we encounter them at a time when their paths were filled with confusion, fear, and hope.', 1, '2023-04-29 09:09:31', NULL, 19, 48, 123),
(117, 'The Bully Pulpit', 929, '34', '2013-04-01 22:00:00', 'Pulitzer Prize-winning author and presidential historian Doris Kearns Goodwin\'s dynamic history of Theodore Roosevelt, William H. Taft and the first decade of the Progressive era, that tumultuous time when the nation was coming unseamed and reform was in the air.\r\n\r\nWinner of the Carnegie Medal.\r\n\r\nDoris Kearns Goodwin\'s The Bully Pulpit is a dynamic history of the first decade of the Progressive era, that tumultuous time when the nation was coming unseamed and reform was in the air.', 1, '2023-04-29 09:10:47', NULL, 19, 48, 124),
(118, 'Lincoln', 194, '23', '2013-03-05 23:00:00', '\"All forward thrust and hot-damn urgency…A brilliant, brawling epic. Screenwriter Tony Kushner blows the dust off history by investing it with flesh, blood, and churning purpose. . . . A great American movie.\" -Peter Travers, Rolling Stone\r\n\r\n\"Lincoln is a rough and noble democratic masterpiece. And the genius of Lincoln, finally, lies in its vision of politics as a noble, sometimes clumsy dialectic of the exalted and the mundane…And Mr. Kushner, whose love of passionate, exhaustive disputation is unmatched in the modern theater, fills nearly every scene with wonderful, maddening talk. Go see this movie.\" -A.O. Scott, New York Times\r\n\r\n\"A lyrical, ingeniously structured screenplay. Lincoln is one of the most authentic biographical dramas I\'ve ever seen…grand and immersive. It plugs us into the final months of Lincoln\'s presidency with a purity that makes us feel transported as if by time machine.\" -Owen Gleiberman, Entertainment Weekly', 1, '2023-04-29 09:12:13', NULL, 19, 48, 125),
(119, 'David and Goliath', 322, '45', '2013-04-01 22:00:00', 'Explore the power of the underdog in Malcolm Gladwell\'s dazzling examination of success, motivation, and the role of adversity in shaping our lives, from the bestselling author of The Bomber Mafia.\r\n\r\nThree thousand years ago on a battlefield in ancient Palestine, a shepherd boy felled a mighty warrior with nothing more than a stone and a sling, and ever since then the names of David and Goliath have stood for battles between underdogs and giants. David\'s victory was improbable and miraculous. He shouldn\'t have won.\r\n\r\nIn David and Goliath, Malcolm Gladwellchallenges how we think about obstacles and disadvantages, offering a new interpretation of what it means to be discriminated against, or cope with a disability, or lose a parent, or attend a mediocre school, or suffer from any number of other apparent setbacks.', 1, '2023-04-29 09:17:47', NULL, 27, 50, 126),
(120, 'Talking to Strangers', 401, '23', '2019-02-02 23:00:00', 'Malcolm Gladwell, host of the podcast Revisionist History and author of the #1 New York Times bestseller Outliers, offers a powerful examination of our interactions with strangers and why they often go wrong-now with a new afterword by the author.\r\n\r\nA Best Book of the Year: The Financial Times, Bloomberg, Chicago Tribune, and Detroit Free Press\r\n\r\nHow did Fidel Castro fool the CIA for a generation? Why did Neville Chamberlain think he could trust Adolf Hitler? Why are campus sexual assaults on the rise? Do television sitcoms teach us something about the way we relate to one another that isn\'t true?', 1, '2023-04-29 09:21:08', NULL, 27, 50, 127),
(121, 'Outliers', 321, '34', '2008-06-03 22:00:00', 'Malcolm Gladwell, bestselling author of Blink and The Bomber Mafia and host of the podcast Revisionist History, explores what sets high achievers apart-from Bill Gates to the Beatles-in this seminal work from \"a singular talent\" (New York Times Book Review).\r\n\r\nIn this stunning book, Malcolm Gladwell takes us on an intellectual journey through the world of \"outliers\"-the best and the brightest, the most famous and the most successful. He asks the question: what makes high-achievers different?\r\n\r\nHis answer is that we pay too much attention to what successful people are like, and too little attention to where they are from: that is, their culture, their family, their generation, and the idiosyncratic experiences of their upbringing. Along the way he explains the secrets of software billionaires, what it takes to be a great soccer player, why Asians are good at math, and what made the Beatles the greatest rock band.', 1, '2023-04-29 09:22:34', NULL, 27, 50, 128),
(122, 'Blink', 296, '12', '2007-04-15 22:00:00', 'From the #1 bestselling author of The Bomber Mafia, the landmark book that has revolutionized the way we understand leadership and decision making.\r\n\r\nIn his breakthrough bestseller The Tipping Point, Malcolm Gladwell redefined how we understand the world around us. Now, in Blink, he revolutionizes the way we understand the world within. Blink is a book about how we think without thinking, about choices that seem to be made in an instant--in the blink of an eye--that actually aren\'t as simple as they seem. Why are some people brilliant decision makers, while others are consistently inept? Why do some people follow their instincts and win, while others end up stumbling into error? How do our brains really work--in the office, in the classroom, in the kitchen, and in the bedroom? And why are the best decisions often those that are impossible to explain to others? In Blink we meet the psychologist who has learned to predict whether a marriage will last, based on a few minutes of observing a couple; the tennis coach who knows when a player will double-fault before the racket even makes contact with the ball; the antiquities experts who recognize a fake at a glance.', 1, '2023-04-29 09:23:49', NULL, 27, 50, 129),
(123, 'The Tipping Point', 298, '23', '2006-01-21 23:00:00', 'From the bestselling author of The Bomber Mafia: discover Malcolm Gladwell\'s breakthrough debut and explore the science behind viral trends in business, marketing, and human behavior.\r\n\r\nThe tipping point is that magic moment when an idea, trend, or social behavior crosses a threshold, tips, and spreads like wildfire. Just as a single sick person can start an epidemic of the flu, so too can a small but precisely targeted push cause a fashion trend, the popularity of a new product, or a drop in the crime rate. This widely acclaimed bestseller, in which Malcolm Gladwell explores and brilliantly illuminates the tipping point phenomenon, is already changing the way people throughout the world think about selling products and disseminating ideas.\r\n\r\n\"A wonderful page-turner about a fascinating idea that should affect the way every thinking person looks at the world.\" -Michael Lewis', 1, '2023-04-29 09:25:46', NULL, 27, 50, 130),
(124, 'The Big Shor', 287, '15', '2010-05-11 22:00:00', 'The #1 New York Times bestseller: \"It is the work of our greatest financial journalist, at the top of his game. And it\'s essential reading.\" - Graydon Carter, Vanity Fair\r\n\r\nThe real story of the crash began in bizarre feeder markets where the sun doesn\'t shine and the SEC doesn\'t dare, or bother, to tread: the bond and real estate derivative markets where geeks invent impenetrable securities to profit from the misery of lower- and middle-class Americans who can\'t pay their debts. The smart people who understood what was or might be happening were paralyzed by hope and fear; in any case, they weren\'t talking.\r\n\r\nMichael Lewis creates a fresh, character-driven narrative brimming with indignation and dark humor, a fitting sequel to his #1 bestseller Liar\'s Poker. Out of a handful of unlikely-really unlikely-heroes, Lewis fashions a story as compelling and unusual as any of his earlier bestsellers, proving yet again that he is the finest and funniest chronicler of our time.', 1, '2023-04-29 09:35:59', NULL, 28, 51, 131),
(125, 'Liar\'s Poker', 352, '17', '2012-03-03 23:00:00', 'The time was the 1980s. The place was Wall Street. The game was called Liar\'s Poker.\r\n\r\nMichael Lewis was fresh out of Princeton and the London School of Economics when he landed a job at Salomon Brothers, one of Wall Street\'s premier investment firms. During the next three years, Lewis rose from callow trainee to bond salesman, raking in millions for the firm and cashing in on a modern-day gold rush. Liar\'s Poker is the culmination of those heady, frenzied years-a behind-the-scenes look at a unique and turbulent time in American business. From the frat-boy camaraderie of the forty-first-floor trading room to the killer instinct that made ambitious young men gamble everything on a high-stakes game of bluffing and deception, here is Michael Lewis\'s knowing and hilarious insider\'s account of an unprecedented era of greed, gluttony, and outrageous fortune.', 1, '2023-04-29 09:39:26', NULL, 28, 51, 132),
(126, 'Moneyball', 316, '11', '2004-03-16 23:00:00', 'Michael Lewis\'s instant classic may be \"the most influential book on sports ever written\" (People), but \"you need know absolutely nothing about baseball to appreciate the wit, snap, economy and incisiveness of [Lewis\'s] thoughts about it\" (Janet Maslin, New York Times).\r\n\r\nOne of GQ\'s 50 Best Books of Literary Journalism of the 21st Century\r\n\r\nJust before the 2002 season opens, the Oakland Athletics must relinquish its three most prominent (and expensive) players and is written off by just about everyone-but then comes roaring back to challenge the American League record for consecutive wins. How did one of the poorest teams in baseball win so many games?\r\n', 1, '2023-04-29 09:40:46', NULL, 28, 51, 133),
(127, 'The Fifth Risk', 255, '17', '2018-03-01 23:00:00', 'The New York Times Bestseller, with a new afterword\r\n\r\n\"[Michael Lewis\'s] most ambitious and important book.\" -Joe Klein, New York Times\r\n\r\nMichael Lewis\'s brilliant narrative of the Trump administration\'s botched presidential transition takes us into the engine rooms of a government under attack by its leaders through willful ignorance and greed. The government manages a vast array of critical services that keep us safe and underpin our lives from ensuring the safety of our food and drugs and predicting extreme weather events to tracking and locating black market uranium before the terrorists do. The Fifth Risk masterfully and vividly unspools the consequences if the people given control over our government have no idea how it works.', 1, '2023-04-29 09:42:05', NULL, 28, 51, 134),
(128, 'The Undoing Project', 369, '45', '2012-12-05 23:00:00', '\"Brilliant. . . . Lewis has given us a spectacular account of two great men who faced up to uncertainty and the limits of human reason.\" —William Easterly, Wall Street Journal\r\n\r\nForty years ago, Israeli psychologists Daniel Kahneman and Amos Tversky wrote a series of breathtakingly original papers that invented the field of behavioral economics. One of the greatest partnerships in the history of science, Kahneman and Tversky\'s extraordinary friendship incited a revolution in Big Data studies, advanced evidence-based medicine, led to a new approach to government regulation, and made much of Michael Lewis\'s own work possible. In The Undoing Project, Lewis shows how their Nobel Prize-winning theory of the mind altered our perception of reality.', 1, '2023-04-29 09:43:45', NULL, 28, 51, 135),
(129, 'Harry Potter and the Prisoner of Azkaban', 180, '15', '2015-03-20 23:00:00', '\'Welcome to the Knight Bus, emergency transport for the stranded witch or wizard. Just stick out your wand hand, step on board and we can take you anywhere you want to go.\'\r\n\r\nWhen the Knight Bus crashes through the darkness and screeches to a halt in front of him, it\'s the start of another far from ordinary year at Hogwarts for Harry Potter. Sirius Black, escaped mass-murderer and follower of Lord Voldemort, is on the run - and they say he is coming after Harry. In his first ever Divination class, Professor Trelawney sees an omen of death in Harry\'s tea leaves... But perhaps most terrifying of all are the Dementors patrolling the school grounds, with their soul-sucking kiss...\r\n\r\nHaving become classics of our time, the Harry Potter eBooks never fail to bring comfort and escapism. With their message of hope, belonging and the enduring power of truth and love, the story of the Boy Who Lived continues to delight generations of new readers.', 1, '2023-04-29 09:48:01', NULL, 14, 42, 136),
(130, 'Harry Potter and the Goblet of Fire', 301, '16', '2015-12-07 23:00:00', '\'There will be three tasks, spaced throughout the school year, and they will test the champions in many different ways ... their magical prowess - their daring - their powers of deduction - and, of course, their ability to cope with danger.\'\r\n\r\nThe Triwizard Tournament is to be held at Hogwarts. Only wizards who are over seventeen are allowed to enter - but that doesn\'t stop Harry dreaming that he will win the competition. Then at Hallowe\'en, when the Goblet of Fire makes its selection, Harry is amazed to find his name is one of those that the magical cup picks out. He will face death-defying tasks, dragons and Dark wizards, but with the help of his best friends, Ron and Hermione, he might just make it through - alive!\r\n\r\nHaving become classics of our time, the Harry Potter eBooks never fail to bring comfort and escapism. With their message of hope, belonging and the enduring power of truth and love, the story of the Boy Who Lived continues to delight generations of new readers.', 1, '2023-04-29 09:49:01', NULL, 14, 42, 137),
(131, 'Harry Potter and the Half-Blood Prince', 652, '15', '2015-02-28 23:00:00', 'There it was, hanging in the sky above the school: the blazing green skull with a serpent tongue, the mark Death Eaters left behind whenever they had entered a building... wherever they had murdered...\r\n\r\nWhen Dumbledore arrives at Privet Drive one summer night to collect Harry Potter, his wand hand is blackened and shrivelled, but he does not reveal why. Secrets and suspicion are spreading through the wizarding world, and Hogwarts itself is not safe. Harry is convinced that Malfoy bears the Dark Mark: there is a Death Eater amongst them. Harry will need powerful magic and true friends as he explores Voldemort\'s darkest secrets, and Dumbledore prepares him to face his destiny...\r\n\r\nHaving become classics of our time, the Harry Potter eBooks never fail to bring comfort and escapism. With their message of hope, belonging and the enduring power of truth and love, the story of the Boy Who Lived continues to delight generations of new readers.', 1, '2023-04-29 09:50:07', NULL, 14, 42, 138),
(132, 'Harry Potter and the Order of the Phoenix', 412, '16', '2015-03-01 23:00:00', '\'You are sharing the Dark Lord\'s thoughts and emotions. The Headmaster thinks it inadvisable for this to continue. He wishes me to teach you how to close your mind to the Dark Lord.\'\r\n\r\nDark times have come to Hogwarts. After the Dementors\' attack on his cousin Dudley, Harry Potter knows that Voldemort will stop at nothing to find him. There are many who deny the Dark Lord\'s return, but Harry is not alone: a secret order gathers at Grimmauld Place to fight against the Dark forces. Harry must allow Professor Snape to teach him how to protect himself from Voldemort\'s savage assaults on his mind. But they are growing stronger by the day and Harry is running out of time ...', 1, '2023-04-29 10:19:34', NULL, 14, 42, 139),
(133, 'Harry Potter and the Sorcerer\'s Stone', 341, '13', '2015-12-07 23:00:00', 'Turning the envelope over, his hand trembling, Harry saw a purple wax seal bearing a coat of arms; a lion, an eagle, a badger and a snake surrounding a large letter \'H\'.\r\n\r\nHarry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry\'s eleventh birthday, a great beetle-eyed giant of a man called Rubeus Hagrid bursts in with some astonishing news: Harry Potter is a wizard, and he has a place at Hogwarts School of Witchcraft and Wizardry. An incredible adventure is about to begin!\r\n\r\nHaving become classics of our time, the Harry Potter eBooks never fail to bring comfort and escapism. With their message of hope, belonging and the enduring power of truth and love, the story of the Boy Who Lived continues to delight generations of new readers.', 1, '2023-04-29 10:21:08', NULL, 14, 42, 140),
(134, 'Fairy Tale', 607, '18', '2022-01-04 23:00:00', 'Legendary storyteller Stephen King goes into the deepest well of his imagination in this spellbinding novel about a seventeen-year-old boy who inherits the keys to a parallel world where good and evil are at war, and the stakes could not be higher-for that world or ours.\r\n\r\nCharlie Reade looks like a regular high school kid, great at baseball and football, a decent student. But he carries a heavy load. His mom was killed in a hit-and-run accident when he was seven, and grief drove his dad to drink. Charlie learned how to take care of himself-and his dad. When Charlie is seventeen, he meets a dog named Radar and her aging master, Howard Bowditch, a recluse in a big house at the top of a big hill, with a locked shed in the backyard. Sometimes strange sounds emerge from it.\r\n\r\nCharlie starts doing jobs for Mr. Bowditch and loses his heart to Radar. Then, when Bowditch dies, he leaves Charlie a cassette tape telling a story no one would believe. What Bowditch knows, and has kept secret all his long life, is that inside the shed is a portal to another world.', 1, '2023-04-29 10:24:41', NULL, 15, 43, 141),
(135, 'Billy Summers', 527, '17', '2021-11-22 23:00:00', 'Master storyteller Stephen King, whose \"restless imagination is a power that cannot be contained\" (The New York Times Book Review), presents an unforgettable and relentless #1 New York Times bestseller about a good guy in a bad job.\r\n\r\nChances are, if you\'re a target of Billy Summers, two immutable truths apply: You\'ll never even know what hit you, and you\'re really getting what you deserve. He\'s a killer for hire and the best in the business-but he\'ll do the job only if the assignment is a truly bad person. But now, time is catching up with him, and Billy wants out. Before he can do that though, there\'s one last hit, which promises a generous payday at the end of the line even as things don\'t seem quite on the level here. Given that Billy is among the most talented snipers in the world, a decorated Iraq war vet, and a virtual Houdini when it comes to vanishing after the job is done, what could possibly go wrong? How about everything.\r\n\r\nPart war story and part love letter to small-town America and the people who live there, this spectacular thriller of luck, fate, and love will grip readers with its electrifying narrative, as a complex antihero with one last shot at redemption must avenge the crimes of an extraordinarily evil man. You won\'t ever forget this stunning novel from master storyteller Stephen King…and you will never forget Billy.', 1, '2023-04-29 10:26:02', NULL, 15, 43, 142),
(136, 'The Dark Tower I: The Gunslinger', 284, '12', '2016-01-03 23:00:00', '\"An impressive work of mythic magnitude that may turn out to be Stephen King\'s greatest literary achievement\" (The Atlanta Journal-Constitution), The Gunslinger is the first volume in the epic Dark Tower Series.\r\n\r\nA #1 national bestseller, The Gunslinger introduces readers to one of Stephen King\'s most powerful creations, Roland of Gilead: The Last Gunslinger. He is a haunting figure, a loner on a spellbinding journey into good and evil. In his desolate world, which mirrors our own in frightening ways, Roland tracks The Man in Black, encounters an enticing woman named Alice, and begins a friendship with the boy from New York named Jake.\r\n\r\nInspired in part by the Robert Browning narrative poem, \"Childe Roland to the Dark Tower Came,\" The Gunslinger is \"a compelling whirlpool of a story that draws one irretrievable to its center\" (Milwaukee Sentinel). It is \"brilliant and fresh…and will leave you panting for more\" (Booklist).', 1, '2023-04-29 10:27:24', NULL, 15, 43, 143),
(137, 'The Institute', 560, '18', '2019-08-05 22:00:00', 'In the middle of the night, in a house on a quiet street in suburban Minneapolis, intruders silently murder Luke Ellis\'s parents and load him into a black SUV. The operation takes less than two minutes. Luke will wake up at The Institute, in a room that looks just like his own, except there\'s no window. And outside his door are other doors, behind which are other kids with special talents-telekinesis and telepathy-who got to this place the same way Luke did: Kalisha, Nick, George, Iris, and ten-year-old Avery Dixon. They are all in Front Half. Others, Luke learns, graduated to Back Half, \"like the roach motel,\" Kalisha says. \"You check in, but you don\'t check out.\"\r\n\r\nIn this most sinister of institutions, the director, Mrs. Sigsby, and her staff are ruthlessly dedicated to extracting from these children the force of their extranormal gifts. There are no scruples here. If you go along, you get tokens for the vending machines. If you don\'t, punishment is brutal. As each new victim disappears to Back Half, Luke becomes more and more desperate to get out and get help. But no one has ever escaped from the Institute.\r\n\r\nAs psychically terrifying as Firestarter, and with the spectacular kid power of It, The Institute is \"first-rate entertainment that has something important to say. We all need to listen\" (The Washington Post).', 1, '2023-04-29 10:29:10', NULL, 15, 43, 144),
(138, 'The Shining', 674, '25', '2008-01-23 23:00:00', 'Jack Torrance\'s new job at the Overlook Hotel is the perfect chance for a fresh start. As the off-season caretaker at the atmospheric old hotel, he\'ll have plenty of time to spend reconnecting with his family and working on his writing. But as the harsh winter weather sets in, the idyllic location feels ever more remote . . . and more sinister. And the only one to notice the strange and terrible forces gathering around the Overlook is Danny Torrance, a uniquely gifted five-year-old.', 1, '2023-04-29 10:30:04', NULL, 15, 43, 145),
(139, 'Gwendy\'s Final Task', 287, '13', '2022-05-30 22:00:00', 'The final book in the New York Times bestselling Gwendy\'s Button Box trilogy from Stephen King and Richard Chizmar.\r\n\r\nWhen Gwendy Peterson was twelve, a mysterious stranger named Richard Farris gave her a mysterious box for safekeeping. It offered treats and vintage coins, but it was dangerous. Pushing any of its eight colored buttons promised death and destruction. Years later, the button box reentered Gwendy\'s life. A successful novelist and a rising political star, she was once again forced to deal with the temptation the box represented. Now, malignant forces seek to possess the button box, and it is up to Senator Gwendy Peterson to keep it from them at all costs. But where can one hide something from such powerful entities?\r\n\r\nIn Gwendy\'s Final Task, master storytellers Stephen King and Richard Chizmar take us on a journey from Castle Rock to another famous cursed Maine city to the MF-1 space station, where Gwendy must execute a secret mission to save the world. And, maybe, all worlds.', 1, '2023-04-29 10:31:23', NULL, 15, 43, 146),
(140, 'The Outsider', 655, '15', '2018-02-24 23:00:00', 'Evil has many faces…maybe even yours in this #1 New York Times bestseller from master storyteller Stephen King.\r\n\r\nAn eleven-year-old boy\'s violated corpse is discovered in a town park. Eyewitnesses and fingerprints point unmistakably to one of Flint City\'s most popular citizens-Terry Maitland, Little League coach, English teacher, husband, and father of two girls. Detective Ralph Anderson, whose son Maitland once coached, orders a quick and very public arrest. Maitland has an alibi, but Anderson and the district attorney soon have DNA evidence to go with the fingerprints and witnesses. Their case seems ironclad.\r\n\r\nAs the investigation expands and horrifying details begin to emerge, King\'s story kicks into high gear, generating strong tension and almost unbearable suspense. Terry Maitland seems like a nice guy, but is he wearing another face? When the answer comes, it will shock you as only Stephen King can.', 1, '2023-04-29 10:32:49', NULL, 15, 43, 147),
(141, 'Mr. Mercedes', 559, '26', '2014-02-28 23:00:00', '#1 New York Times bestseller! In a high-suspense race against time, three of the most unlikely heroes Stephen King has ever created try to stop a lone killer from blowing up thousands. \"Mr. Mercedes is a rich, resonant, exceptionally readable accomplishment by a man who can write in whatever genre he chooses\" (The Washington Post).\r\n\r\nThe stolen Mercedes emerges from the pre-dawn fog and plows through a crowd of men and women on line for a job fair in a distressed American city. Then the lone driver backs up, charges again, and speeds off, leaving eight dead and more wounded. The case goes unsolved and ex-cop Bill Hodges is out of hope when he gets a letter from a man who loved the feel of death under the Mercedes\'s wheels…\r\n\r\nBrady Hartsfield wants that rush again, but this time he\'s going big, with an attack that would take down thousands-unless Hodges and two new unusual allies he picks up along the way can throw a wrench in Hartsfield\'s diabolical plans. Stephen King takes off on a \"nerve-shredding, pulse-pounding race against time\" (Fort Worth Star-Telegram) with this acclaimed #1 bestselling thriller.', 1, '2023-04-29 10:34:07', NULL, 15, 43, 148),
(142, '\'Salem\'s Lot', 668, '27', '2008-06-02 22:00:00', 'Ben Mears has returned to Jerusalem\'s Lot in hopes that exploring the history of the Marsten House, an old mansion long the subject of rumor and speculation, will help him cast out his personal devils and provide inspiration for his new book.\r\n\r\nBut when two young boys venture into the woods, and only one returns alive, Mears begins to realize that something sinister is at work.\r\n\r\nIn fact, his hometown is under siege from forces of darkness far beyond his imagination. And only he, with a small group of allies, can hope to contain the evil that is growing within the borders of this small New England town.\r\n\r\nWith this, his second novel, Stephen King established himself as an indisputable master of American horror, able to transform the old conceits of the genre into something fresh and all the more frightening for taking place in a familiar, idyllic locale.', 1, '2023-04-29 10:35:19', NULL, 15, 43, 149),
(143, 'It', 1181, '24', '2016-07-02 22:00:00', 'Stephen King\'s terrifying, classic #1 New York Times bestseller, \"a landmark in American literature\" (Chicago Sun-Times)-about seven adults who return to their hometown to confront a nightmare they had first stumbled on as teenagers…an evil without a name: It.\r\n\r\nWelcome to Derry, Maine. It\'s a small city, a place as hauntingly familiar as your own hometown. Only in Derry the haunting is real.\r\n\r\nThey were seven teenagers when they first stumbled upon the horror. Now they are grown-up men and women who have gone out into the big world to gain success and happiness. But the promise they made twenty-eight years ago calls them reunite in the same place where, as teenagers, they battled an evil creature that preyed on the city\'s children. Now, children are being murdered again and their repressed memories of that terrifying summer return as they prepare to once again battle the monster lurking in Derry\'s sewers.', 1, '2023-04-29 10:36:25', NULL, 15, 43, 150),
(144, 'Test', 121, '12', '2023-05-29 22:00:00', 'asda sd asd as ad as d', 0, '2023-06-01 21:14:33', NULL, 14, 30, 158),
(145, 'das a a', 232, '23', '2023-05-31 22:00:00', 'asd asda sda ssd asd asd', 0, '2023-06-03 13:25:54', NULL, 14, 30, 169),
(146, 'sdf sd fsdf sd ', 23, '23', '2023-05-31 22:00:00', 'dfs fsd fsd fs fsdf sf', 0, '2023-06-03 13:29:12', NULL, 14, 30, 170);

-- --------------------------------------------------------

--
-- Table structure for table `book_category`
--

CREATE TABLE `book_category` (
  `book_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `book_category`
--

INSERT INTO `book_category` (`book_id`, `category_id`) VALUES
(4, 14),
(5, 15),
(6, 14),
(7, 14),
(7, 15),
(8, 14),
(8, 15),
(9, 15),
(10, 14),
(11, 15),
(12, 14),
(13, 14),
(14, 14),
(15, 15),
(16, 15),
(17, 14),
(17, 15),
(18, 15),
(19, 16),
(19, 17),
(20, 15),
(20, 29),
(21, 17),
(22, 16),
(22, 17),
(23, 17),
(24, 17),
(24, 28),
(24, 29),
(25, 16),
(25, 17),
(26, 16),
(26, 17),
(27, 16),
(28, 16),
(29, 16),
(29, 17),
(30, 16),
(30, 17),
(31, 16),
(32, 17),
(33, 16),
(33, 17),
(34, 18),
(34, 19),
(34, 31),
(35, 19),
(35, 31),
(36, 18),
(36, 19),
(37, 18),
(38, 19),
(39, 19),
(40, 18),
(41, 18),
(42, 18),
(43, 18),
(43, 31),
(44, 18),
(45, 18),
(45, 31),
(45, 32),
(46, 18),
(46, 32),
(47, 18),
(47, 32),
(48, 18),
(49, 21),
(50, 21),
(51, 21),
(52, 20),
(52, 21),
(53, 20),
(54, 20),
(55, 20),
(56, 17),
(57, 20),
(58, 20),
(59, 20),
(60, 20),
(61, 20),
(62, 20),
(63, 20),
(64, 23),
(65, 22),
(66, 22),
(67, 22),
(68, 22),
(69, 22),
(69, 23),
(70, 22),
(71, 22),
(72, 22),
(72, 28),
(73, 22),
(73, 28),
(74, 24),
(74, 25),
(75, 25),
(76, 24),
(77, 24),
(77, 25),
(78, 24),
(78, 25),
(79, 24),
(79, 25),
(80, 24),
(81, 24),
(82, 24),
(83, 24),
(83, 25),
(84, 24),
(85, 24),
(85, 25),
(86, 24),
(87, 24),
(88, 24),
(89, 27),
(90, 26),
(90, 27),
(91, 27),
(92, 26),
(93, 26),
(93, 27),
(94, 27),
(95, 26),
(96, 27),
(97, 26),
(98, 26),
(99, 27),
(100, 27),
(101, 27),
(102, 27),
(103, 27),
(104, 28),
(104, 29),
(105, 29),
(106, 28),
(107, 28),
(108, 29),
(109, 28),
(109, 29),
(110, 28),
(110, 29),
(111, 29),
(112, 29),
(113, 28),
(113, 29),
(114, 29),
(115, 29),
(116, 28),
(116, 29),
(117, 28),
(118, 28),
(119, 31),
(120, 18),
(120, 19),
(120, 31),
(121, 18),
(121, 31),
(122, 18),
(122, 31),
(123, 31),
(123, 32),
(124, 32),
(125, 18),
(125, 32),
(126, 32),
(127, 31),
(127, 32),
(128, 32),
(129, 15),
(129, 24),
(129, 34),
(130, 24),
(130, 34),
(131, 15),
(131, 24),
(131, 34),
(132, 15),
(132, 24),
(132, 34),
(133, 15),
(133, 24),
(133, 34),
(134, 15),
(134, 34),
(135, 15),
(135, 34),
(136, 15),
(136, 33),
(136, 34),
(137, 14),
(137, 33),
(138, 34),
(139, 34),
(140, 15),
(140, 34),
(141, 15),
(141, 34),
(142, 15),
(142, 33),
(143, 33),
(144, 14),
(144, 16),
(144, 17),
(145, 22),
(146, 26);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `status`, `created_at`, `deleted_at`, `category_id`) VALUES
(4, 'Mystery', 1, '2023-04-21 21:22:08', '2023-04-29 15:12:16', NULL),
(5, 'Travel', 1, '2023-04-21 21:25:35', '2023-04-22 10:25:08', NULL),
(6, 'Self Improvement', 1, '2023-04-21 21:26:32', '2023-04-22 10:43:02', NULL),
(7, 'Cooking', 1, '2023-04-21 21:27:16', '2023-04-22 10:24:10', NULL),
(8, 'Technology And Science', 1, '2023-04-22 07:18:49', '2023-04-22 10:42:22', NULL),
(9, 'Children\'s Books', 1, '2023-04-22 10:46:48', '2023-04-22 11:12:54', NULL),
(10, 'Romance', 1, '2023-04-22 10:47:04', NULL, NULL),
(11, 'History', 1, '2023-04-22 10:47:14', NULL, NULL),
(12, 'Business And Economics', 1, '2023-04-22 10:47:31', '2023-04-22 11:37:12', NULL),
(13, 'Fiction', 1, '2023-04-22 10:49:24', NULL, NULL),
(14, 'Detective Fiction', 1, '2023-04-22 10:50:36', '2023-04-29 15:12:16', 4),
(15, 'Thrillers', 1, '2023-04-22 11:44:25', '2023-04-29 15:12:16', 4),
(16, 'Adventure Travel', 1, '2023-04-22 11:45:05', NULL, 5),
(17, 'Cultural Travel', 1, '2023-04-22 11:45:18', NULL, 5),
(18, 'Personal Development', 1, '2023-04-22 11:45:52', NULL, 6),
(19, 'Communication Skills', 1, '2023-04-22 11:46:18', NULL, 6),
(20, 'Healthy Cooking', 1, '2023-04-22 11:47:11', NULL, 7),
(21, 'Ethnic Cuisines', 1, '2023-04-22 11:47:47', NULL, 7),
(22, 'Computer Programming', 1, '2023-04-22 11:48:48', NULL, 8),
(23, 'Cybersecurity And Hacking', 1, '2023-04-22 11:49:15', NULL, 8),
(24, 'Young Adult Fiction', 1, '2023-04-22 11:50:04', NULL, 9),
(25, 'Humorous Stories', 1, '2023-04-22 11:50:27', NULL, 9),
(26, 'Historical Romance', 1, '2023-04-22 11:53:49', NULL, 10),
(27, 'Fantasy Romance', 1, '2023-04-22 11:54:48', NULL, 10),
(28, 'Social History', 1, '2023-04-22 11:58:46', NULL, 11),
(29, 'Cultural History', 1, '2023-04-22 11:58:59', '2023-04-29 14:25:02', 11),
(31, 'Management And Leadership', 1, '2023-04-22 11:59:55', '2023-04-22 12:01:30', 12),
(32, 'Finance And Accounting', 1, '2023-04-22 12:00:13', '2023-04-29 14:22:20', 12),
(33, 'Horror Fiction', 1, '2023-04-22 12:00:53', '2023-04-29 14:24:54', 13),
(34, 'Fantasy Fiction', 1, '2023-04-22 12:01:07', '2023-05-31 17:48:17', 13),
(35, 'Test', 0, '2023-05-31 17:48:55', '2023-05-31 17:49:00', 4),
(37, 'Testq', 0, '2023-05-31 17:49:11', '2023-05-31 17:49:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `choice`
--

CREATE TABLE `choice` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `src` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `choice`
--

INSERT INTO `choice` (`id`, `name`, `src`) VALUES
(3, 'Terrible', 'terrible.svg'),
(4, 'Poor', 'poor.svg'),
(5, 'Average', 'average.svg'),
(6, 'Good', 'good.svg'),
(7, 'Excellent', 'excellent.svg');

-- --------------------------------------------------------

--
-- Table structure for table `choice_survey`
--

CREATE TABLE `choice_survey` (
  `choice_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `choice_survey`
--

INSERT INTO `choice_survey` (`choice_id`, `survey_id`) VALUES
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `comment_text` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `comment_text`, `user_id`, `book_id`) VALUES
(1, 'Tets Tets Tets Tets  Tets Tets', 31, 75),
(2, 'Tets Tets Tets Tets  Tets Tets', 31, 75),
(3, 'SDF sdf sdfsd fsd fsdf sdf sdf ', 31, 75),
(4, 'asd asd asd ad asd asd ', 31, 88),
(5, 'asdasd asd a asd asd asd asd', 31, 88),
(6, 'asd asd asdasd as asd asd ', 31, 88),
(7, 'asd asd asd asd asd as', 31, 88),
(8, 'asd asda s asd aasd ', 31, 84),
(9, 'proba proba proba proba proba proba', 30, 129),
(10, 'test test test test test', 31, 129),
(11, 'As much as I LOVE the prisoner of Azkaban movie, I\'ve always felt like there were missing details and reading this book definitely filled in the holes for me. The way that the author describes the hourglass scene is just amazing. Loved this book', 25, 129),
(12, 'I bought this for my daughter who is getting into Harry Potter now. I didn\'t want to spend a lot of money since I\'m trying to buy all the books. I\'m very satisfied with the seller, the book matched their description perfectly..', 26, 129),
(13, 'As always with Rowling\'s books, I loved Harry Potter and the Prisoner of Azkaban! JK Rowling\'s words have a curious habit of coming to life, and her characters are funny, and realistic. One of the greatest things about Harry Potter, is that they improve with each book, and you can clearly glimpse the clever, intricate plot Rowling has wove, with cleverly placed foreshadowing and seemingly innocent hints.', 27, 129),
(14, 'In this book, as Harry approaches adolescence the tone changes. And we get a more interesting, but also more complex and darker story.\r\n\r\nUnlike the static characters in other books or series, Harry is getting older, and getting less stable emotionally. The book still appeals to both children and adults but it involves some horror creatures, Dementors and there is lot of focus on Harry\'s parents\' deaths.\r\n\r\nThe great thing for children is that the familiar, relatable characters are being brought to life and come across as very realistic. Harry\'s friendship with Ron and Hermione takes a different direction in this instalment. Hermione is being forced to make tough choices that impact Harry but Ron in particular. With who she is in constant disagreement. But the book also has an exceptionally strong set of secondary characters like Professor Lupin, the Defense Against the Dark Arts teacher, a great new character that hides a big hairy secret. Then there is Professor Trelawney for Divination studies. While Hagrid displays his love of all magical creatures. Professor Snape remains enigmatic so that you continue to question his true motives. Cedric Diggory and Cho Chang, who play important roles in later books of the series are introduced as well', 28, 129),
(15, 'This is the third instalment as I attempt to read this so-called modern classic. I watched the first three or four films as they came out but abandoned reading the books after reading the first one twenty years ago. I was advised to persevere with them and that by the third one I would see what it was all about. This was easily better than the first two and I have begun to warm to the characters especially Ron and Hermione. The plot was also more complex than the first two and I felt it became a page turner towards the end which I hadn\'t experienced with the first two.\r\n\r\nI will continue and expect further rewards in the final four books. There is a whole universe in here which is admirable. If I am honest compared to Lord of the Rings there is no comparison in terms of the wonder contained. I may change my mind by book 7 . However, this is a huge step up from the first two. We will see.', 29, 129);

-- --------------------------------------------------------

--
-- Table structure for table `comment_image`
--

CREATE TABLE `comment_image` (
  `comment_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comment_image`
--

INSERT INTO `comment_image` (`comment_id`, `image_id`) VALUES
(2, 151),
(3, 152),
(3, 153),
(6, 154),
(6, 155),
(6, 156),
(7, 157),
(13, 159),
(14, 160),
(14, 161),
(14, 162),
(15, 163),
(15, 164),
(15, 165);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_type`
--

CREATE TABLE `delivery_type` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `delivery_type`
--

INSERT INTO `delivery_type` (`id`, `name`, `status`, `created_at`, `deleted_at`) VALUES
(1, 'Test', 0, '2023-04-23 10:09:16', '2023-04-23 10:24:35'),
(2, 'Standard', 1, '2023-04-23 10:23:50', NULL),
(3, 'Express', 1, '2023-04-23 10:24:12', '2023-05-10 08:32:58'),
(4, 'Next Day', 1, '2023-04-23 10:24:23', '2023-05-31 12:19:31'),
(5, 'Same Day', 1, '2023-04-23 10:24:32', NULL),
(6, 'Rffff', 0, '2023-05-31 11:48:09', '2023-05-31 12:19:36'),
(7, 'Sasda', 0, '2023-05-31 11:49:00', '2023-05-31 12:19:35'),
(8, 'Testw', 0, '2023-05-31 12:19:51', '2023-05-31 12:19:53');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `src` varchar(50) DEFAULT NULL,
  `alt` varchar(50) DEFAULT NULL,
  `created_at` int(11) DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id`, `src`, `alt`, `created_at`) VALUES
(7, '7.jpg', NULL, 2147483647),
(8, '8.jpg', NULL, 2147483647),
(9, '9.jpg', NULL, 2147483647),
(10, '10.jpg', NULL, 2147483647),
(11, '11.jpg', NULL, 2147483647),
(12, '12.jpg', NULL, 2147483647),
(13, '13.jpg', NULL, 2147483647),
(14, '14.jpg', NULL, 2147483647),
(15, '15.jpg', NULL, 2147483647),
(16, '16.jpg', NULL, 2147483647),
(17, '17.jpg', NULL, 2147483647),
(18, '18.jpg', NULL, 2147483647),
(19, '19.jpg', NULL, 2147483647),
(20, '20.jpg', NULL, 2147483647),
(21, NULL, NULL, 2147483647),
(22, NULL, NULL, 2147483647),
(23, '23.jpg', NULL, 2147483647),
(24, '24.jpg', NULL, 2147483647),
(25, '25.jpg', NULL, 2147483647),
(26, '26.jpg', NULL, 2147483647),
(27, '27.jpg', NULL, 2147483647),
(28, '28.jpg', NULL, 2147483647),
(29, '29.jpg', NULL, 2147483647),
(30, '30.jpg', NULL, 2147483647),
(31, '31.jpg', NULL, 2147483647),
(32, '32.jpg', NULL, 2147483647),
(33, '33.jpg', NULL, 2147483647),
(34, '34.jpg', NULL, 2147483647),
(35, '35.jpg', NULL, 2147483647),
(36, '36.jpg', NULL, 2147483647),
(37, '37.jpg', NULL, 2147483647),
(38, '38.jpg', NULL, 2147483647),
(39, '39.jpg', NULL, 2147483647),
(40, '40.jpg', NULL, 2147483647),
(41, '41.jpg', NULL, 2147483647),
(42, '42.jpg', NULL, 2147483647),
(43, '43.jpg', NULL, 2147483647),
(44, '44.jpg', NULL, 2147483647),
(45, '45.jpg', NULL, 2147483647),
(46, '46.jpg', NULL, 2147483647),
(47, '47.jpg', NULL, 2147483647),
(48, '48.jpg', NULL, 2147483647),
(49, '49.jpg', NULL, 2147483647),
(50, '50.jpg', NULL, 2147483647),
(51, '51.jpg', NULL, 2147483647),
(52, '52.jpg', NULL, 2147483647),
(53, '53.jpg', NULL, 2147483647),
(54, '54.jpg', NULL, 2147483647),
(55, '55.jpg', NULL, 2147483647),
(56, '56.jpg', NULL, 2147483647),
(57, '57.jpg', NULL, 2147483647),
(58, '58.jpg', NULL, 2147483647),
(59, '59.jpg', NULL, 2147483647),
(60, '60.jpg', NULL, 2147483647),
(61, '61.jpg', NULL, 2147483647),
(62, '62.jpg', NULL, 2147483647),
(63, '63.jpg', NULL, 2147483647),
(64, '64.jpg', NULL, 2147483647),
(65, '65.jpg', NULL, 2147483647),
(66, '66.jpg', NULL, 2147483647),
(67, '67.jpg', NULL, 2147483647),
(68, '68.jpg', NULL, 2147483647),
(69, '69.jpg', NULL, 2147483647),
(70, '70.jpg', NULL, 2147483647),
(71, '71.jpg', NULL, 2147483647),
(72, NULL, NULL, 2147483647),
(73, '73.jpg', NULL, 2147483647),
(74, '74.jpg', NULL, 2147483647),
(75, '75.jpg', NULL, 2147483647),
(76, '76.jpg', NULL, 2147483647),
(77, '77.jpg', NULL, 2147483647),
(78, '78.jpg', NULL, 2147483647),
(79, NULL, NULL, 2147483647),
(80, '80.jpg', NULL, 2147483647),
(81, '81.jpg', NULL, 2147483647),
(82, '82.jpg', NULL, 2147483647),
(83, '83.jpg', NULL, 2147483647),
(84, '84.jpg', NULL, 2147483647),
(85, '85.jpg', NULL, 2147483647),
(86, '86.jpg', NULL, 2147483647),
(87, '87.jpg', NULL, 2147483647),
(88, '88.jpg', NULL, 2147483647),
(89, '89.jpg', NULL, 2147483647),
(90, '90.jpg', NULL, 2147483647),
(91, '91.jpg', NULL, 2147483647),
(92, '92.jpg', NULL, 2147483647),
(93, '93.jpg', NULL, 2147483647),
(94, '94.jpg', NULL, 2147483647),
(95, '95.jpg', NULL, 2147483647),
(96, '96.jpg', NULL, 2147483647),
(97, '97.jpg', NULL, 2147483647),
(98, '98.jpg', NULL, 2147483647),
(99, '99.jpg', NULL, 2147483647),
(100, '100.jpg', NULL, 2147483647),
(101, '101.jpg', NULL, 2147483647),
(102, '102.jpg', NULL, 2147483647),
(103, '103.jpg', NULL, 2147483647),
(104, '104.jpg', NULL, 2147483647),
(105, '105.jpg', NULL, 2147483647),
(106, '106.jpg', NULL, 2147483647),
(107, '107.jpg', NULL, 2147483647),
(108, '108.jpg', NULL, 2147483647),
(109, '109.jpg', NULL, 2147483647),
(110, '110.jpg', NULL, 2147483647),
(111, '111.jpg', NULL, 2147483647),
(112, '112.jpg', NULL, 2147483647),
(113, '113.jpg', NULL, 2147483647),
(114, '114.jpg', NULL, 2147483647),
(115, '115.jpg', NULL, 2147483647),
(116, '116.jpg', NULL, 2147483647),
(117, '117.jpg', NULL, 2147483647),
(118, '118.jpg', NULL, 2147483647),
(119, '119.jpg', NULL, 2147483647),
(120, '120.jpg', NULL, 2147483647),
(121, '121.jpg', NULL, 2147483647),
(122, '122.jpg', NULL, 2147483647),
(123, '123.jpg', NULL, 2147483647),
(124, '124.jpg', NULL, 2147483647),
(125, '125.jpg', NULL, 2147483647),
(126, '126.jpg', NULL, 2147483647),
(127, '127.jpg', NULL, 2147483647),
(128, '128.jpg', NULL, 2147483647),
(129, '129.jpg', NULL, 2147483647),
(130, '130.jpg', NULL, 2147483647),
(131, '131.jpg', NULL, 2147483647),
(132, '132.jpg', NULL, 2147483647),
(133, '133.jpg', NULL, 2147483647),
(134, '134.jpg', NULL, 2147483647),
(135, '135.jpg', NULL, 2147483647),
(136, '136.jpg', NULL, 2147483647),
(137, '137.jpg', NULL, 2147483647),
(138, '138.jpg', NULL, 2147483647),
(139, '139.jpg', NULL, 2147483647),
(140, '140.jpg', NULL, 2147483647),
(141, '141.jpg', NULL, 2147483647),
(142, '142.jpg', NULL, 2147483647),
(143, '143.jpg', NULL, 2147483647),
(144, '144.jpg', NULL, 2147483647),
(145, '145.jpg', NULL, 2147483647),
(146, '146.jpg', NULL, 2147483647),
(147, '147.jpg', NULL, 2147483647),
(148, '148.jpg', NULL, 2147483647),
(149, '149.jpg', NULL, 2147483647),
(150, '150.jpg', NULL, 2147483647),
(151, '151.jpg', NULL, 2147483647),
(152, '152.jpg', NULL, 2147483647),
(153, '153.jpg', NULL, 2147483647),
(154, '154.jpg', NULL, 2147483647),
(155, '155.jpg', NULL, 2147483647),
(156, '156.jpg', NULL, 2147483647),
(157, '157.jpg', NULL, 2147483647),
(158, '158.jpg', NULL, 2147483647),
(159, '159.jpg', NULL, 2147483647),
(160, '160.jpg', NULL, 2147483647),
(161, '161.jpg', NULL, 2147483647),
(162, '162.jpg', NULL, 2147483647),
(163, '163.jpg', NULL, 2147483647),
(164, '164.jpg', NULL, 2147483647),
(165, '165.jpg', NULL, 2147483647),
(166, NULL, NULL, 2147483647),
(167, NULL, NULL, 2147483647),
(168, NULL, NULL, 2147483647),
(169, '169.jpg', NULL, 2147483647),
(170, '170.jpg', NULL, 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `ime`
--

CREATE TABLE `ime` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ime`
--

INSERT INTO `ime` (`id`, `name`) VALUES
(1, 'Das'),
(3, 'pop');

-- --------------------------------------------------------

--
-- Table structure for table `link`
--

CREATE TABLE `link` (
  `id` int(2) NOT NULL,
  `name` varchar(20) NOT NULL,
  `href` varchar(50) NOT NULL,
  `appearance` int(2) NOT NULL,
  `id_target` int(2) NOT NULL,
  `id_link_type` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `link`
--

INSERT INTO `link` (`id`, `name`, `href`, `appearance`, `id_target`, `id_link_type`) VALUES
(1, 'Admin', 'admin', 1, 1, 1),
(2, 'Shop', 'shop', 3, 1, 1),
(3, 'Checkout', 'checkout', 4, 1, 1),
(4, 'Sign up', 'signup', 5, 1, 1),
(5, 'Log in', 'login', 7, 1, 1),
(6, 'Log out', 'logout', 6, 1, 1),
(7, 'Home', 'home', 2, 1, 1),
(8, 'Author', 'index.php?page=author', 8, 1, 3),
(9, 'Documentation', 'views/pages/documentation.pdf', 9, 2, 3),
(10, 'RSS', 'views/pages/rss.xml', 11, 2, 3),
(11, 'Sitemap', 'views/pages/sitemap.xml', 12, 2, 3),
(12, 'Facebook', 'https://www.facebook.com/', 13, 2, 2),
(13, 'Instagram', 'https://www.instagram.com/', 14, 2, 2),
(14, 'Twitter', 'https://twitter.com/', 15, 2, 2),
(16, 'GitHub', 'https://github.com/NikolaSamardzic/Readilyphp', 10, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `link_position`
--

CREATE TABLE `link_position` (
  `position_id` int(11) NOT NULL,
  `link_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `link_position`
--

INSERT INTO `link_position` (`position_id`, `link_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 16);

-- --------------------------------------------------------

--
-- Table structure for table `link_role`
--

CREATE TABLE `link_role` (
  `role_id` int(2) NOT NULL,
  `link_id` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `link_role`
--

INSERT INTO `link_role` (`role_id`, `link_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 16),
(2, 2),
(2, 3),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 16),
(3, 2),
(3, 3),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 16),
(4, 2),
(4, 4),
(4, 5),
(4, 7),
(4, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 12),
(4, 13),
(4, 14),
(4, 16);

-- --------------------------------------------------------

--
-- Table structure for table `link_target`
--

CREATE TABLE `link_target` (
  `id` int(11) NOT NULL,
  `name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `link_target`
--

INSERT INTO `link_target` (`id`, `name`) VALUES
(1, '_self'),
(2, '_blank');

-- --------------------------------------------------------

--
-- Table structure for table `link_type`
--

CREATE TABLE `link_type` (
  `id` int(2) NOT NULL,
  `name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `link_type`
--

INSERT INTO `link_type` (`id`, `name`) VALUES
(1, 'link'),
(2, 'social media'),
(3, 'document');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `message_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `title`, `message_text`, `created_at`, `user_id`) VALUES
(1, 'Test', 'Test Test Test Test Test', '2023-05-10 14:04:52', 31),
(2, 'Lorem', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem', '2023-05-10 14:31:36', 31),
(3, 'Proba', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '2023-05-10 14:37:50', 25),
(4, 'Proba', ' 1 1 1  1 1 1 1 ', '2023-05-31 10:22:40', 31);

-- --------------------------------------------------------

--
-- Table structure for table `order_book`
--

CREATE TABLE `order_book` (
  `order_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,0) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_book`
--

INSERT INTO `order_book` (`order_id`, `book_id`, `quantity`, `unit_price`, `created_at`) VALUES
(12, 137, 4, '18', '2023-05-09 23:15:10'),
(12, 78, 1, '12', '2023-05-09 23:15:11'),
(13, 88, 1, '13', '2023-05-10 08:11:53'),
(13, 76, 3, '23', '2023-05-10 08:11:54'),
(13, 87, 1, '16', '2023-05-10 08:11:55'),
(14, 46, 1, '43', '2023-05-10 08:18:35'),
(16, 46, 1, '43', '2023-05-10 08:19:48'),
(13, 132, 1, '16', '2023-05-10 15:02:26'),
(19, 88, 3, '13', '2023-06-02 14:44:26'),
(19, 46, 4, '43', '2023-06-02 14:45:31'),
(25, 46, 2, '43', '2023-06-02 15:12:40'),
(26, 132, 3, '16', '2023-06-03 15:28:27'),
(26, 137, 2, '18', '2023-06-03 15:28:28');

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Shipped'),
(4, 'Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `id` int(2) NOT NULL,
  `name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`id`, `name`) VALUES
(1, 'header'),
(2, 'footer');

-- --------------------------------------------------------

--
-- Table structure for table `prefered_categories`
--

CREATE TABLE `prefered_categories` (
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `prefered_categories`
--

INSERT INTO `prefered_categories` (`user_id`, `category_id`) VALUES
(31, 4),
(31, 9),
(31, 13),
(25, 5),
(25, 6),
(25, 8),
(26, 4),
(26, 10),
(26, 13),
(27, 6),
(27, 8),
(27, 12),
(28, 4),
(28, 7),
(28, 10),
(36, 5),
(36, 8),
(36, 11),
(40, 8),
(40, 11),
(40, 12),
(42, 4),
(42, 7),
(42, 10),
(47, 4),
(47, 5),
(47, 6),
(48, 9),
(48, 11),
(48, 12),
(29, 5),
(29, 8),
(29, 11),
(30, 6),
(30, 7),
(30, 9);

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `id` int(3) NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`id`, `name`, `status`, `created_at`, `deleted_at`) VALUES
(1, 'Test', 0, '2023-04-21 13:10:56', '2023-06-02 15:30:47'),
(14, 'Pottermore Publishing', 1, '2023-04-23 10:26:02', '2023-06-02 15:31:06'),
(15, 'Scribner', 1, '2023-04-23 10:26:13', NULL),
(16, 'William Morrow Paperbacks', 1, '2023-04-23 10:26:21', NULL),
(17, 'Grapevine', 1, '2023-04-23 10:26:30', NULL),
(18, 'Mariner Books', 1, '2023-04-23 10:26:39', NULL),
(19, 'Simon And Schuster', 1, '2023-04-23 10:26:53', NULL),
(20, 'Knopf', 1, '2023-04-23 10:27:03', NULL),
(21, 'Flatiron Books', 1, '2023-04-23 10:27:11', '2023-05-31 15:40:50'),
(22, 'Oreilly Media', 1, '2023-04-23 10:30:41', '2023-04-29 11:13:00'),
(23, 'Random House Books For Young Readers', 1, '2023-04-23 10:32:29', '2023-05-31 15:42:30'),
(24, 'Viking Books For Young Readers', 1, '2023-04-23 10:32:45', NULL),
(25, 'Random House', 1, '2023-04-23 10:32:58', '2023-04-29 11:02:42'),
(26, 'Martins Press', 1, '2023-04-23 10:33:25', NULL),
(27, 'Little Brown And Company', 1, '2023-04-23 10:33:43', '2023-04-29 11:02:39'),
(28, 'Norton And Company', 1, '2023-04-23 10:34:01', '2023-04-29 11:00:37'),
(30, 'Testwe', 0, '2023-05-31 15:43:01', '2023-05-31 15:53:02'),
(31, 'Errrr', 0, '2023-05-31 15:44:41', '2023-05-31 15:53:02'),
(32, 'Tter', 0, '2023-05-31 15:52:52', '2023-05-31 15:52:54');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `stars` int(11) NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `stars`, `created_at`, `user_id`, `book_id`) VALUES
(1, 3, 2147483647, 31, 79),
(2, 5, 2147483647, 31, 129),
(3, 5, 2147483647, 31, 46),
(4, 3, 2147483647, 31, 20),
(5, 2, 2147483647, 31, 76),
(6, 4, 2147483647, 31, 88),
(7, 3, 2147483647, 31, 47),
(8, 4, 2147483647, 31, 137),
(9, 3, 2147483647, 25, 46),
(10, 4, 2147483647, 31, 75),
(11, 4, 2147483647, 31, 84),
(12, 4, 2147483647, 30, 144),
(13, 3, 2147483647, 30, 129),
(14, 4, 2147483647, 29, 129),
(15, 5, 2147483647, 31, 133);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(2) NOT NULL,
  `name` varchar(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `created_at`) VALUES
(1, 'admin', '2023-04-05 18:53:58'),
(2, 'customer', '2023-04-05 18:54:23'),
(3, 'writer', '2023-04-05 18:55:02'),
(4, 'unauthorised', '2023-04-06 18:34:18');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `naziv` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `survey`
--

CREATE TABLE `survey` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `survey_text` varchar(150) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `finished_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `survey`
--

INSERT INTO `survey` (`id`, `name`, `survey_text`, `status`, `created_at`, `finished_at`) VALUES
(1, 'website experience', 'Please rate your experience on our website and help us improve!', 1, '2023-05-06 18:18:08', '2023-06-02 15:30:21');

-- --------------------------------------------------------

--
-- Table structure for table `survey_user`
--

CREATE TABLE `survey_user` (
  `survey_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `choice_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `survey_user`
--

INSERT INTO `survey_user` (`survey_id`, `user_id`, `choice_id`) VALUES
(1, 31, 3),
(1, 25, 7),
(1, 26, 6),
(1, 27, 7),
(1, 28, 5),
(1, 36, 5),
(1, 40, 4),
(1, 42, 7),
(1, 47, 5),
(1, 48, 3),
(1, 30, 7);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `token` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_banned` tinyint(1) NOT NULL DEFAULT 0,
  `banned_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `address_id` int(3) DEFAULT NULL,
  `role_id` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `email`, `password`, `phone`, `status`, `token`, `is_active`, `is_banned`, `banned_at`, `created_at`, `updated_at`, `deleted_at`, `address_id`, `role_id`) VALUES
(25, 'Samantha', 'Kim', 'ArtisticAdventurer', 'pp5104133@gmail.com', 'add58e3521344b053c0b0499229890c9', '12345678', 1, 'b89c5914b042e26c0b98', 1, 0, '2023-04-21 18:23:19', '2023-04-16 17:28:54', NULL, '2023-05-31 11:21:16', NULL, 2),
(26, 'Joshua', 'Martinez', 'BookishBibliophile', 'pp5104133@gmail.com', 'add58e3521344b053c0b0499229890c9', '1234567', 1, 'b43aedd80df18faf7c98', 1, 0, '2023-04-21 17:33:48', '2023-04-16 17:33:13', NULL, '2023-05-31 11:21:24', NULL, 2),
(27, 'William', 'Chen', 'BusinessBoss', 'pp5104133@gmail.com', 'add58e3521344b053c0b0499229890c9', '1234567', 1, '6569e275f3ec1a117bb2', 1, 0, '2023-04-21 18:23:17', '2023-04-16 17:38:35', NULL, '2023-05-31 10:48:10', 9, 2),
(28, 'Daniel', 'Park', 'CultureCrusader', 'pp5104133@gmail.com', 'add58e3521344b053c0b0499229890c9', '12345646', 1, '81578a898a814f5b9c98', 1, 0, '2023-04-19 20:42:01', '2023-04-16 17:41:01', NULL, '2023-05-31 11:20:32', 10, 2),
(29, 'Benjamin', 'Wilson', 'CosmicCrusader', 'pp5104133@gmail.com', 'add58e3521344b053c0b0499229890c9', '123456', 1, '9ab412db3cd9c5be7609', 1, 0, '2023-04-21 16:29:35', '2023-04-16 17:44:23', NULL, NULL, 10, 2),
(30, 'Probaproba', 'Probaproba', 'Probaproba', 'pp5104133@gmail.com', 'add58e3521344b053c0b0499229890c9', '1234567', 1, '74abc5a68ba6abda38e5', 0, 1, '2023-06-03 16:26:13', '2023-04-18 12:40:06', NULL, NULL, NULL, 3),
(31, 'Admin', 'Admin', 'Admin', 'pp5104133@gmail.com', 'add58e3521344b053c0b0499229890c9', '12345678', 1, 'b06f6e4360979b2c1487', 1, 0, '2023-05-09 14:32:02', '2023-04-18 17:36:46', NULL, '2023-04-24 15:51:49', NULL, 1),
(32, 'Agatha', 'Christie', 'AgathaChristie', 'pp5104133@gmail.com', 'add58e3521344b053c0b0499229890c9', '12345678', 1, '0645b30d99f26b49efe9', 1, 0, NULL, '2023-04-23 10:36:59', NULL, NULL, NULL, 3),
(33, 'Sir Arthur Conan', 'Doyle', 'SirArthur', 'pp5104133@gmail.com', 'add58e3521344b053c0b0499229890c9', '1234567', 1, '97b7639b55960c0da097', 1, 0, NULL, '2023-04-23 10:45:28', NULL, NULL, NULL, 3),
(34, 'Bill', 'Bryson', 'BillBryson', 'pp5104133@gmail.com', 'add58e3521344b053c0b0499229890c9', '1234567', 1, 'f56015797a1704abfaa1', 1, 0, NULL, '2023-04-23 11:01:36', NULL, NULL, NULL, 3),
(35, 'Paul', 'Theroux', 'PaulTheroux', 'pp5104133@gmail.com', 'add58e3521344b053c0b0499229890c9', '1234567', 1, 'e421bc5f4bc16bb633fe', 1, 0, NULL, '2023-04-23 11:03:06', NULL, NULL, NULL, 3),
(36, 'Dale', 'Carnegie', 'DaleCarnegie', 'pp5104133@gmail.com', 'add58e3521344b053c0b0499229890c9', '1234567', 1, '809b38910b352a8f4826', 1, 0, NULL, '2023-04-23 11:05:10', NULL, NULL, NULL, 3),
(37, 'Tony', 'Robbins', 'TonyRobbins', 'pp5104133@gmail.com', 'add58e3521344b053c0b0499229890c9', '1234567', 1, '230a427f90b91a959c1e', 1, 0, NULL, '2023-04-23 11:07:05', NULL, NULL, NULL, 3),
(38, 'Julia', 'Child', 'JuliaChild', 'pp5104133@gmail.com', 'add58e3521344b053c0b0499229890c9', '1234567', 1, 'ad430455fb460d15f76a', 1, 0, '2023-05-09 14:33:35', '2023-04-23 11:08:25', NULL, NULL, NULL, 3),
(39, 'Jamie', 'Oliver', 'JamieOliver', 'pp5104133@gmail.com', 'add58e3521344b053c0b0499229890c9', '1234567', 1, '49ba001077f1a8426e0f', 1, 0, NULL, '2023-04-23 11:09:48', NULL, NULL, NULL, 3),
(40, 'Steven', 'Levy', 'StevenLevy', 'pp5104133@gmail.com', 'add58e3521344b053c0b0499229890c9', '12345678', 1, '04166edd230a66fb4a0b', 1, 0, NULL, '2023-04-23 11:11:30', NULL, NULL, NULL, 3),
(41, 'Walter', 'Isaacson', 'WalterIsaacson', 'pp5104133@gmail.com', 'add58e3521344b053c0b0499229890c9', '12345678', 1, '11b34498229cb6d36772', 1, 0, NULL, '2023-04-23 11:14:45', NULL, NULL, NULL, 3),
(42, 'Joanne', 'Rowling', 'JoanneRowling', 'pp5104133@gmail.com', 'add58e3521344b053c0b0499229890c9', '1234567', 1, '710f7067cfcad8285a27', 1, 0, NULL, '2023-04-23 11:17:57', NULL, NULL, NULL, 3),
(43, 'Stephen', 'King', 'StephenKing', 'pp5104133@gmail.com', 'add58e3521344b053c0b0499229890c9', '1234567', 1, 'd9950b310d086ab5da1f', 1, 0, NULL, '2023-04-23 11:20:40', NULL, NULL, NULL, 3),
(44, 'Theodor', 'Seuss', 'TheodorSeuss', 'pp5104133@gmail.com', 'add58e3521344b053c0b0499229890c9', '1234567', 1, '693544755e7ac2ad7a6a', 1, 0, '2023-05-31 11:18:51', '2023-04-23 11:22:17', NULL, '2023-05-31 10:47:18', NULL, 3),
(45, 'Roald', 'Dahl', 'RoaldDahl', 'pp5104133@gmail.com', 'add58e3521344b053c0b0499229890c9', '1234567', 1, 'b7794bca5e440f17dcab', 1, 0, NULL, '2023-04-23 11:23:43', NULL, '2023-05-31 10:54:01', NULL, 3),
(46, 'Nicholas', 'Sparks', 'NicholasSparks', 'pp5104133@gmail.com', 'add58e3521344b053c0b0499229890c9', '1234567', 1, 'd60facbf1e0766e82297', 1, 0, '2023-05-31 11:18:54', '2023-04-23 11:24:43', NULL, NULL, NULL, 3),
(47, 'Nora', 'Roberts', 'NoraRoberts', 'pp5104133@gmail.com', 'add58e3521344b053c0b0499229890c9', '1234567', 1, 'b60bd6b281b76c27fbef', 1, 0, '2023-05-31 11:18:55', '2023-04-23 11:26:12', NULL, NULL, NULL, 3),
(48, 'Doris Kearns Goodwin', 'Goodwin', 'DorisGoodwin', 'pp5104133@gmail.com', 'add58e3521344b053c0b0499229890c9', '1234567', 1, 'f78a6792017280c4e48d', 1, 0, '2023-05-09 14:33:45', '2023-04-23 11:27:38', NULL, '2023-05-31 11:18:56', NULL, 3),
(49, 'David', 'Cullough', 'DavidCullough', 'pp5104133@gmail.com', 'add58e3521344b053c0b0499229890c9', '1234567', 1, 'cdd7fd4342379f9809e1', 1, 0, '2023-05-31 11:18:58', '2023-04-23 11:29:19', NULL, NULL, NULL, 3),
(50, 'Malcolm', 'Gladwell', 'MalcolmGladwell', 'pp5104133@gmail.com', 'add58e3521344b053c0b0499229890c9', '1234567', 1, '63f007deaa2096c98411', 1, 0, '2023-05-09 14:33:45', '2023-04-23 11:31:34', NULL, NULL, NULL, 3),
(51, 'Michael', 'Lewis', 'MichaelLewis', 'pp5104133@gmail.com', 'add58e3521344b053c0b0499229890c9', '1234567', 1, 'ced0de5255d1da8f06fa', 1, 0, NULL, '2023-04-23 11:32:31', NULL, NULL, NULL, 3),
(55, 'Test', 'Test', 'Test.123', 'pp5104133@gmail.com', 'add58e3521344b053c0b0499229890c9', '12121212', 1, '3cd811a4ae61043652ab', 1, 0, NULL, '2023-06-01 16:10:39', NULL, NULL, NULL, 2),
(56, 'Test', 'Test', 'Test.123123', 'pp5104133@gmail.com', 'add58e3521344b053c0b0499229890c9', '123123123', 1, '3fcaf3fa077bbb62f243', 1, 0, NULL, '2023-06-01 16:25:42', NULL, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_order`
--

CREATE TABLE `user_order` (
  `id` int(11) NOT NULL,
  `total_price` decimal(10,0) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `finished_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `order_status_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `delivery_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_order`
--

INSERT INTO `user_order` (`id`, `total_price`, `created_at`, `finished_at`, `user_id`, `order_status_id`, `address_id`, `delivery_type_id`) VALUES
(12, '84', '2023-05-09 23:14:47', '2023-05-09 23:15:26', 31, 4, 38, 2),
(13, '114', '2023-05-09 23:15:26', '2023-05-10 15:02:50', 31, 1, 39, 2),
(14, '43', '2023-05-10 08:18:21', '2023-05-10 08:18:40', 27, 2, 9, 2),
(15, '0', '2023-05-10 08:18:41', NULL, 27, NULL, NULL, NULL),
(16, '43', '2023-05-10 08:19:12', '2023-05-10 08:19:51', 29, 3, 10, 2),
(17, '0', '2023-05-10 08:19:51', NULL, 29, NULL, NULL, NULL),
(18, '0', '2023-05-10 14:37:25', NULL, 25, NULL, NULL, NULL),
(19, '211', '2023-05-10 15:02:50', '2023-06-02 15:11:57', 31, 1, 41, 2),
(20, '0', '2023-06-01 16:26:15', NULL, 56, NULL, NULL, NULL),
(21, '0', '2023-06-01 16:44:11', NULL, 51, NULL, NULL, NULL),
(22, '0', '2023-06-01 21:14:06', NULL, 30, NULL, NULL, NULL),
(23, '0', '2023-06-02 10:49:02', NULL, 26, NULL, NULL, NULL),
(24, '0', '2023-06-02 10:52:46', NULL, 28, NULL, NULL, NULL),
(25, '86', '2023-06-02 15:11:57', '2023-06-02 15:13:24', 31, 1, 42, 2),
(26, '0', '2023-06-02 15:13:24', NULL, 31, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `avatar`
--
ALTER TABLE `avatar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `biography`
--
ALTER TABLE `biography`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `publisher_id` (`publisher_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `image_id` (`image_id`);

--
-- Indexes for table `book_category`
--
ALTER TABLE `book_category`
  ADD KEY `book_id` (`book_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `choice`
--
ALTER TABLE `choice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `choice_survey`
--
ALTER TABLE `choice_survey`
  ADD KEY `choice_id` (`choice_id`),
  ADD KEY `survey_id` (`survey_id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `comment_image`
--
ALTER TABLE `comment_image`
  ADD KEY `image_id` (`image_id`),
  ADD KEY `comment_id` (`comment_id`);

--
-- Indexes for table `delivery_type`
--
ALTER TABLE `delivery_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ime`
--
ALTER TABLE `ime`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `link`
--
ALTER TABLE `link`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `apperiance` (`appearance`),
  ADD KEY `id_target` (`id_target`),
  ADD KEY `id_liink_type` (`id_link_type`);

--
-- Indexes for table `link_position`
--
ALTER TABLE `link_position`
  ADD PRIMARY KEY (`position_id`,`link_id`),
  ADD KEY `link_id` (`link_id`);

--
-- Indexes for table `link_role`
--
ALTER TABLE `link_role`
  ADD PRIMARY KEY (`role_id`,`link_id`),
  ADD KEY `link_id` (`link_id`);

--
-- Indexes for table `link_target`
--
ALTER TABLE `link_target`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `link_type`
--
ALTER TABLE `link_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_book`
--
ALTER TABLE `order_book`
  ADD KEY `order_id` (`order_id`,`book_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prefered_categories`
--
ALTER TABLE `prefered_categories`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `naziv` (`naziv`);

--
-- Indexes for table `survey`
--
ALTER TABLE `survey`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `survey_user`
--
ALTER TABLE `survey_user`
  ADD KEY `survey_id` (`survey_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `choice_id` (`choice_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `address_id` (`address_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `user_order`
--
ALTER TABLE `user_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_status_id` (`order_status_id`),
  ADD KEY `address_id` (`address_id`),
  ADD KEY `delivery_type_id` (`delivery_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `avatar`
--
ALTER TABLE `avatar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `biography`
--
ALTER TABLE `biography`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `choice`
--
ALTER TABLE `choice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `delivery_type`
--
ALTER TABLE `delivery_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `ime`
--
ALTER TABLE `ime`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `link`
--
ALTER TABLE `link`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `link_target`
--
ALTER TABLE `link_target`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `link_type`
--
ALTER TABLE `link_type`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `survey`
--
ALTER TABLE `survey`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `user_order`
--
ALTER TABLE `user_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `avatar`
--
ALTER TABLE `avatar`
  ADD CONSTRAINT `avatar_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `biography`
--
ALTER TABLE `biography`
  ADD CONSTRAINT `biography_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`id`),
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `book_ibfk_3` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`);

--
-- Constraints for table `book_category`
--
ALTER TABLE `book_category`
  ADD CONSTRAINT `book_category_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  ADD CONSTRAINT `book_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `choice_survey`
--
ALTER TABLE `choice_survey`
  ADD CONSTRAINT `choice_survey_ibfk_1` FOREIGN KEY (`choice_id`) REFERENCES `choice` (`id`),
  ADD CONSTRAINT `choice_survey_ibfk_2` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`id`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);

--
-- Constraints for table `comment_image`
--
ALTER TABLE `comment_image`
  ADD CONSTRAINT `comment_image_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`),
  ADD CONSTRAINT `comment_image_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`);

--
-- Constraints for table `link`
--
ALTER TABLE `link`
  ADD CONSTRAINT `link_ibfk_1` FOREIGN KEY (`id_target`) REFERENCES `link_target` (`id`),
  ADD CONSTRAINT `link_ibfk_2` FOREIGN KEY (`id_link_type`) REFERENCES `link_type` (`id`);

--
-- Constraints for table `link_position`
--
ALTER TABLE `link_position`
  ADD CONSTRAINT `link_position_ibfk_1` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`),
  ADD CONSTRAINT `link_position_ibfk_2` FOREIGN KEY (`link_id`) REFERENCES `link` (`id`);

--
-- Constraints for table `link_role`
--
ALTER TABLE `link_role`
  ADD CONSTRAINT `link_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `link_role_ibfk_2` FOREIGN KEY (`link_id`) REFERENCES `link` (`id`);

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `order_book`
--
ALTER TABLE `order_book`
  ADD CONSTRAINT `order_book_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `user_order` (`id`),
  ADD CONSTRAINT `order_book_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);

--
-- Constraints for table `prefered_categories`
--
ALTER TABLE `prefered_categories`
  ADD CONSTRAINT `prefered_categories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `prefered_categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);

--
-- Constraints for table `survey_user`
--
ALTER TABLE `survey_user`
  ADD CONSTRAINT `survey_user_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`id`),
  ADD CONSTRAINT `survey_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `survey_user_ibfk_3` FOREIGN KEY (`choice_id`) REFERENCES `choice` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Constraints for table `user_order`
--
ALTER TABLE `user_order`
  ADD CONSTRAINT `user_order_ibfk_1` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`id`),
  ADD CONSTRAINT `user_order_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `user_order_ibfk_3` FOREIGN KEY (`delivery_type_id`) REFERENCES `delivery_type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
