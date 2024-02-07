CREATE DATABASE  IF NOT EXISTS `botscryout` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `botscryout`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: botscryout
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `likedID` int NOT NULL AUTO_INCREMENT,
  `prayerID` int DEFAULT NULL,
  `userID` int DEFAULT NULL,
  `likedTime` datetime NOT NULL,
  PRIMARY KEY (`likedID`),
  UNIQUE KEY `likedID` (`likedID`),
  UNIQUE KEY `likes` (`prayerID`,`userID`),
  KEY `userID` (`userID`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`),
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`prayerID`) REFERENCES `prayers` (`prayerID`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1,1,'2023-12-02 01:22:00'),(2,3,1,'2023-12-02 01:22:00'),(3,5,1,'2023-12-03 01:22:00'),(4,14,1,'2023-12-02 01:22:00'),(6,24,2,'2023-04-09 01:27:00'),(7,2,2,'2023-12-04 01:22:00'),(8,23,2,'2023-12-10 01:22:00'),(9,4,3,'2023-02-02 04:22:00'),(10,10,3,'2023-11-02 01:22:00'),(11,26,4,'2023-12-02 01:22:00'),(12,1,4,'2023-12-02 09:22:00'),(13,13,4,'2023-05-20 01:22:00'),(14,25,4,'2023-12-02 01:22:00'),(15,15,5,'2023-12-07 01:20:00'),(16,4,6,'2023-12-02 13:22:00'),(17,22,6,'2023-04-30 01:22:00'),(18,14,6,'2023-12-02 01:22:00'),(19,2,6,'2023-10-02 01:22:00'),(20,13,6,'2023-12-02 01:22:00'),(21,10,6,'2023-09-02 14:11:00'),(22,6,7,'2023-12-04 01:22:00'),(23,4,7,'2023-12-02 01:22:00'),(24,2,7,'2023-02-02 04:22:00'),(25,11,7,'2023-11-02 01:22:00'),(26,18,8,'2023-05-12 01:22:00'),(27,5,8,'2023-12-02 01:22:00'),(28,24,9,'2023-03-09 01:22:00'),(29,16,9,'2023-12-02 01:22:00'),(30,30,9,'2023-12-09 01:22:00'),(31,7,10,'2023-12-02 01:22:00'),(32,25,11,'2023-12-10 01:22:00'),(33,4,11,'2023-07-02 01:22:00'),(34,20,12,'2023-12-02 01:22:00'),(35,27,12,'2023-01-01 01:22:00'),(36,6,12,'2023-12-02 04:22:00'),(37,29,13,'2023-11-19 01:22:00'),(38,7,13,'2023-12-02 01:22:00'),(39,5,13,'2023-01-08 09:22:00'),(40,18,14,'2023-07-02 01:29:00'),(41,9,14,'2023-12-02 10:22:00'),(42,30,14,'2023-01-01 01:22:00'),(43,17,15,'2023-08-10 01:22:00'),(44,21,15,'2023-11-19 01:20:00'),(45,5,16,'2023-02-04 01:22:00'),(46,8,17,'2023-12-08 01:22:00'),(47,7,17,'2023-03-08 01:22:00');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prayers`
--

DROP TABLE IF EXISTS `prayers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prayers` (
  `prayerID` int NOT NULL AUTO_INCREMENT,
  `prompt` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `coverImage` varchar(255) DEFAULT NULL,
  `audioRecitation` varchar(255) DEFAULT NULL,
  `aiCreator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`prayerID`),
  UNIQUE KEY `prayerID` (`prayerID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prayers`
--

LOCK TABLES `prayers` WRITE;
/*!40000 ALTER TABLE `prayers` DISABLE KEYS */;
INSERT INTO `prayers` VALUES (1,'Overcoming Difficult Tasks','Dear Heavenly Father,\nAs I embark on the daunting journey of this academic task, I humbly come before you, seeking your guidance and grace. In the face of this challenging assignment, I lift my eyes to you, the source of all wisdom and understanding.Grant me the strength to persevere through the complexities that lie ahead. May your Spirit empower my mind, filling it with clarity and discernment as I navigate the intricacies of the subject at hand. In moments of uncertainty, be my guiding light, illuminating the path to knowledge and comprehension. I place before you the hours of research, the struggle with concepts, and the effort required to articulate my thoughts. Bless the work of my hands and the thoughts of my mind, that they may align with your purpose for my education. In moments of fatigue, renew my energy. In moments of frustration, instill patience. In moments of doubt, sow seeds of confidence. Let this assignment be not just a task but a journey of growth and learning. May the words I write reflect not only my understanding of the material but also the diligence and dedication I bring to this endeavor. In your boundless mercy, grant me the focus to stay committed and the resilience to overcome obstacles. I commit this assignment into your hands, trusting that with you, all things are possible. In your holy name, I pray, Amen.','','challenge.mp4','ChatGPT 3.5'),(2,'Loving Others Who Have Wronged Me','Heavenly Father,\nIn the tapestry of my journey, I find myself at the crossroads of hurt and forgiveness, seeking Your divine guidance. Lord, grant me the strength to love those who have wronged me, to see beyond the scars and find compassion in the face of adversity. Your word teaches us to love our enemies and pray for those who persecute us, and I humbly ask for the grace to embody this profound lesson. As I navigate the tempest of emotions, wrap Your loving arms around my wounded heart. Help me transcend bitterness and resentment, replacing them with the transformative power of Your unconditional love. Teach me to view others through the lens of Your mercy, recognizing the inherent worth in every soul, regardless of their actions. Grant me the wisdom to understand that forgiveness is not a sign of weakness but a testament to Your boundless love working within me. May my actions be a reflection of Your grace, a living testimony to the transformative power of Your love. As I release the burden of grudges, fill me with Your peace that surpasses all understanding. Help me cultivate a heart that mirrors Your own, overflowing with love even in the face of adversity. In moments of challenge, remind me of Your unfailing love and the redemptive power of forgiveness. May my journey be marked by compassion, understanding, and a commitment to emulate Your divine example.\nIn Your holy name, I pray, Amen.','love.jpg','','ChatGPT 3.5'),(3,'Being Patient With Others','Dear Lord, thank you for giving the ability to interact with my peers. I am very grateful to have friends who I can call my friend. Please give me the patience I need to tolerate those get on my nerves and aggravate me. I know you are a very patient and loving God, so help me be more like you by helping me love those who annoy me without even trying. You have given every person their own unique gift and I am very grateful for that, but sometimes I lose sight of your vision and can\'t see the gift you have given someone. I know you have made everyone special in their own way, but sometimes things don\'t go the way I want and I lose sight of your calling for me to be patient and love others. Help me overcome my impatience with others who prefer the leisurely lifestyle over the hard working lifestyle. Give me the ability to guide these individuals in the paths of righteousness and success. I know we are not perfect but sometimes we believe we are. Please humble my spirit into a state of tolerance for those who are not tolerant of righteous things. In Jesus name I pray, Amen. ','','patience.mp4',NULL),(4,'Success of Wrongdoers','Dear Heavenly Father,\nI come before you with a humble heart, seeking your divine guidance and mercy. Your word reminds us that you work all things together for the good of those who love you and are called according to your purpose. Lord, I lift up those who may have strayed from your path, those who have committed wrongs and are now experiencing success that seems undeserved.\n\nIn this moment, I pray for your transformative grace to touch their lives. May your love penetrate their hearts, leading them to repentance and a genuine desire to walk in righteousness. Help them recognize that true success comes from aligning their lives with your will.\n\nLord, I pray for those who may be envious or confused by the success of the wrongdoer. Grant them the wisdom to trust in your divine plan, knowing that your ways are higher than ours. Strengthen their faith to believe that even in the face of apparent success built on wrongdoings, your justice will prevail.\n\nMay your mercy and forgiveness be poured out upon all of us, for we are all sinners in need of your grace. Let your light shine in the darkest corners, bringing redemption and healing to those who have lost their way.\n\nIn Jesus\' name, I pray.\n\nAmen.','','success.mp4','ChatGPT 3.5'),(5,'Weariness of Life','Heavenly Father,\n\n\'Take my yoke upon you and learn from me, for I am gentle and humble in heart, and you will find rest for your souls. For my yoke is easy, and my burden is light.\'\n\nLord, I come to you with the weariness that life often brings - physically, emotionally, and spiritually. In the midst of busyness and the demands of the world, I seek the rest that only you can provide. I lay down my burdens at your feet and take up the yoke of your love and grace.\n\nGrant me the peace that surpasses all understanding, a rest that goes beyond the physical realm and penetrates the depths of my soul. May your gentle presence surround me, calming every anxious thought and soothing every troubled emotion.\n\nHelp me to learn from you, Lord, embracing the simplicity of your ways and finding solace in your everlasting love. In the quiet moments of communion with you, may my soul find rejuvenation, and may I emerge refreshed and strengthened to face the challenges ahead.\n\nThank you, Lord, for being the source of true rest. In Jesus\' name, I pray.\n\nAmen.','','','ChatGPT 3.5'),(6,'Comfort when your heart is hurting for others','Dear Heavenly Father,\n\nIn the moments when my heart aches for others, weighed down by the burdens they carry, I turn to You, the source of all comfort and compassion. Your love is a balm for our wounds, and in the midst of pain, I seek solace in Your presence.\n\nLord, grant me the strength to bear the sorrows of those I hold dear in my heart. May Your comforting embrace surround them, bringing peace to their troubled souls. Let them feel Your unwavering love, a love that surpasses all understanding and transcends the depths of human sorrow.\n\nAs I lift up the names and faces of those who are hurting, I ask for Your healing touch to soothe their wounds. Pour out Your grace upon them, granting them resilience in times of adversity. Help them find solace in the knowledge that You are near, a present help in times of trouble.\n\nLord, make me an instrument of Your peace and comfort. Guide my words and actions to bring hope to the despairing and light to the darkness. May Your love flow through me, a channel of Your mercy and compassion.\n\nIn Jesus\' name, I pray. Amen.','','','ChatGPT 3.5'),(7,'Thankfulness for loved ones','Dear Heavenly Father,\n\nAs I bow before Your presence, I am filled with gratitude that overflows from the depths of my heart. I lift up my voice in thanksgiving for the precious gift of loved ones that You have bestowed upon me.\n\nThank You for the tapestry of souls woven into my life - the threads of family, friends, and companionship that create a masterpiece of love. Each person is a reflection of Your grace, a testament to Your boundless generosity.\n\nI thank You for the moments of joy we share, the laughter that resonates in our hearts, and the tears that draw us closer. In the tapestry of life, You have intertwined our stories, and I am grateful for the chapters we\'ve written together.\n\nMay Your light shine upon my loved ones, guiding their paths and filling their hearts with Your unwavering love. Grant them strength in times of trial, comfort in moments of sorrow, and joy that surpasses understanding.\n\nLord, help me cherish every fleeting moment with those I hold dear. May my love for them be a reflection of Your eternal love for us. In thankfulness, I pray for the well-being and happiness of those I love, knowing that You, O Lord, are the source of all blessings.\n\nIn Jesus\' name, I humbly offer this prayer of gratitude. Amen.','heart.jpg','thankful.mp4','ChatGPT 3.5'),(8,'Finding Motivation in difficult times ','Heavenly Father, in the journey of life, grant me the resilience to persevere and the courage to face challenges with unwavering faith. As I stand at the crossroads of decisions and uncertainties, I seek Your guidance and strength. May the assurance of Your purposeful plans infuse me with motivation. In moments of doubt, let me remember that You have designed a path for me, filled with hope and a future. Illuminate my steps with Your wisdom, Lord, as I navigate the twists and turns of my journey. Father, grant me the determination to press forward, knowing that Your intentions for my life are rooted in love. When obstacles seem insurmountable, empower me to rise above, fueled by the knowledge that Your hand is guiding me. May I find motivation in the understanding that You are the author of my story, and Your plans are for my flourishing. In Jesus\' name, I pray. Amen.','','','ChatGPT 3.5'),(9,'Rid your life of pride ','Gracious Father, in the light of Your Word that teaches us to value others above ourselves, I humbly come before You. Help me, O Lord, to cast aside selfish ambitions and vain conceit, replacing them with a heart of true humility. May Your Spirit guide me in actions that reflect Your love and grace. Grant me the strength to set aside personal agendas and to earnestly consider the needs and concerns of others. In moments of pride, remind me of the example set by Your Son, Jesus Christ, who, in perfect humility, served others with boundless love. Lord, create in me a humble spirit that seeks to uplift those around me. May I embrace a genuine concern for the well-being of others, recognizing their worth and value in Your eyes. Teach me the beauty of selfless living and the joy found in putting others first. In the name of Jesus, who exemplified humility in every way, I pray. Amen','','','ChatGPT 3.5'),(10,'Dealing with Self Doubt','Heavenly Father, in moments of self-doubt, remind me of Your unwavering love and strength. When shadows of uncertainty cloud my path, illuminate my way with Your divine light. Teach me to trust in Your plan, knowing that You guide my steps with purpose and grace.\nGrant me the courage to face my fears, to embrace the challenges that test my faith. In the silence of my heart, let me hear Your reassuring voice, dispelling the whispers of doubt that seek to undermine my spirit.\nHelp me to see myself through Your eyes – capable, strong, and worthy. Instill in me a sense of confidence rooted not in my own abilities, but in Your endless support and guidance.\nIn times of hesitation, remind me of the countless times You\'ve carried me through trials, turning my weaknesses into strengths. Let Your wisdom be my guide, Your love my shield, and Your truth the foundation upon which I build my life.\nMay I walk boldly in the direction of my dreams, anchored in the knowledge that with You, all things are possible. Amen.','','','ChatGPT 4'),(11,'Facing Your fears ','Gracious and Almighty God, in this moment of introspection, I seek Your strength to confront my fears. Grant me the courage that comes from knowing You are with me, guiding my steps and fortifying my spirit.\nAs I stand at the threshold of my apprehensions, arm me with Your wisdom to discern the path ahead. In Your boundless love, dissolve the shadows of fear that cloud my heart and mind. Replace my anxiety with the steadfast assurance of Your presence.\nHelp me to remember that courage does not mean the absence of fear, but the resolve to face it head-on. Let me draw upon the wellspring of bravery that You instilled within me at creation, empowering me to overcome the obstacles that lie before me.\nIn moments of doubt, remind me of Your past faithfulness. May the memory of Your unwavering support in times past be the wind beneath my wings as I soar above my fears. Infuse my heart with the peace that surpasses understanding, anchoring me in the certainty of Your eternal care.\nThrough Your grace, may I transform my fears into stepping stones towards growth, resilience, and a deeper trust in Your plan. Amen.','','fears.mp4','ChatGPT 4'),(12,'Being a Better Christian Example','Heavenly Father, on this joyous day, I come before you with a heart full of gratitude for the gift of life and the journey of faith that has brought me to this moment. I humbly seek your guidance and grace to become a better Christian example to those around me. Lord, instill in me the virtues of love, compassion, and humility, that I may reflect Your divine character in all my interactions. Help me to be a beacon of light in a world often shadowed by darkness, demonstrating the transformative power of Your love in every step I take. Grant me the strength to resist the temptations that divert me from the path of righteousness, and fill my heart with the wisdom to discern your will in all circumstances. May my words and actions align with the teachings of your Son, Jesus Christ, and may I bear the fruits of the Spirit—love, joy, peace, patience, kindness, goodness, faithfulness, gentleness, and self-control. Lord, as I embark on this Christian journey, may your Holy Spirit guide me to be a living testimony of your grace, inspiring others to seek you with an open heart. Use me as an instrument of your peace, that through my life, others may come to know the transformative power of your redeeming love. In Jesus\' name, I pray. Amen.','','','ChatGPT 3.5'),(13,'Turning Away form Sin','Heavenly Father, on this sacred moment of prayer, I come before Your presence with a contrite heart, acknowledging my need for Your mercy and forgiveness. I recognize the moments where I\'ve faltered and turned away from Your perfect path. Today, I humbly seek Your grace to turn away from sin and recommit myself to Your righteous ways. Lord, Your Word reminds me that if we confess our sins, You are faithful and just to forgive us and cleanse us from all unrighteousness. I lay before You my shortcomings, knowing that Your love surpasses my failures. Grant me the strength to resist the allure of sin and the wisdom to discern the paths that lead away from Your light. Help me, O Lord, to flee from temptation and to find refuge in Your unfailing love. May Your Holy Spirit guide me, convicting my heart when I stray and gently leading me back to the shelter of Your grace. I surrender my weaknesses to You, trusting that Your power is made perfect in my moments of vulnerability. As I turn away from sin, fill my heart with a deep desire for righteousness. Transform my thoughts and actions, that I may be a living testament to Your redeeming love. Thank You for the promise of forgiveness and the opportunity for a renewed journey with You. In Jesus\' name, I pray. Amen.','sin.jpg','','ChatGPT 3.5'),(14,'Having a Pure Heart','\nDear Heavenly Father,\n\nOn this day, as I reflect upon the journey of the past year, I come before you with gratitude and humility. Lord, you have been my constant companion, guiding me through the ups and downs of life.\n\nAs I stand before you, I recognize the imperfections within my heart. Today, I earnestly seek your presence to cleanse and purify my heart. Remove any traces of impurity, doubt, and negativity that may have taken residence within me.\n\nGrant me the strength to let go of any bitterness or resentment, replacing it with love and compassion. May my thoughts be pure, my words be kind, and my actions be guided by your grace. Help me to see the beauty in others, just as you see the beauty in me.\n\nCreate in me a pure heart, O God, and renew a steadfast spirit within me. Let your light shine through every corner of my being, illuminating the path of righteousness.\n\nI surrender my heart to you, trusting that your love and mercy will transform me from within. Thank you, Lord, for your unwavering love and the opportunity for renewal that each day brings.\n\nIn Jesus\' name, I pray.\n\nAmen.','','','ChatGPT 3.5'),(15,'Walking by Faith','Dear Heavenly Father,\n\nAs I stand at the threshold of another day, I come before you with a heart filled with gratitude and trust. Lord, your Word reminds me that we are called to walk by faith and not by sight. Today, I surrender my plans, my fears, and my uncertainties into your hands.\n\nGrant me the strength to trust in your divine guidance, even when the path ahead seems unclear. Help me to rely on the assurance of your promises, knowing that you are faithful to fulfill them. May my steps be aligned with your will, and may my faith deepen with each stride.\n\nIn moments of doubt, Lord, bolster my faith. When challenges arise, let me find solace in the certainty of your love. May my walk be a testimony of the faithfulness that emanates from a relationship with you.\n\nI place my trust in you, recognizing that you hold the map to my journey. As I walk by faith, may your light illuminate my path, and may my life reflect the hope and confidence that come from placing my trust in you.\n\nIn Jesus\' name, I pray.\n\nAmen.','','faith.mp4','ChatGPT 3.6'),(16,'Being in College','Gracious Father, As I embark on this collegiate journey, I am reminded of Proverbs 2:6: \'For the Lord gives wisdom; from his mouth come knowledge and understanding.\' I humbly seek Your divine wisdom to navigate the complexities of academia. Grant me the discernment to comprehend the teachings presented before me, and the understanding to apply this knowledge for the betterment of myself and others. May Your wisdom guide me in every lecture, exam, and interaction, shaping my intellect and character. Just as You provided wisdom to Solomon, bestow upon me the ability to grasp concepts, to analyze, and to synthesize information effectively. Help me not only to accumulate knowledge but also to gain understanding, seeing beyond the surface into the deeper significance of what I learn. In moments of uncertainty and academic challenges, may Your wisdom be my guiding light, leading me towards the right decisions and paths to follow. Let Your teachings resonate within me, enabling me to make a positive impact in this world. I surrender my academic pursuits to Your divine guidance, trusting that through Your wisdom, I will flourish and grow during my time in college. In Your name, I pray, Amen.','','','ChatGPT 3.5'),(17,'Having Joy','Heavenly Father,\nI come before you with a heart full of gratitude for the joy that you have promised and provided for us. In the midst of life\'s challenges and uncertainties, I seek the enduring joy that can only come from You.\nLord, help me to find joy in your presence, knowing that in Your company, there is fullness of joy. Open my eyes to see the beauty of your creation, the love of those around me, and the countless blessings that you pour into my life each day.\nI surrender to you the burdens that weigh me down, trusting that Your joy is my strength. Fill me with the peace that surpasses all understanding, guarding my heart and mind in Christ Jesus.\nFather, teach me to choose joy in all circumstances, not based on my circumstances but on the unchanging truth of Your love and grace. May my joy be a testimony to your goodness and faithfulness.\nI pray for a heart of gratitude, recognizing and appreciating the simple joys that surround me. In moments of difficulty, help me to focus on the hope I have in You, knowing that joy comes in the morning.\nLord, I also pray for those who may be struggling to find joy. May your comforting presence be near to them, lifting their spirits and renewing their hearts with the joy that only You can provide.\nThank you, Lord, for the gift of joy that comes from knowing and trusting in You. May it overflow in my life and be a source of light and encouragement to those around me.\nIn the name of Jesus, who is our ultimate source of joy, I pray.\nAmen.','joy.jpg','','ChatGPT 3.5'),(18,'Rasing Children','Dear Heavenly Father,\nOn this day, as we come before you, we thank you for the precious gift of children that you have entrusted us with. We acknowledge that they are ultimately Yours, and we seek Your guidance and wisdom in raising them to know and love You.\nLord, we pray for the strength to be examples of Your love, grace, and mercy in our children\'s lives. May our words and actions reflect Your teachings, and may our home be a place filled with Your presence.\nGrant us the patience to nurture their faith, answering their questions with love and understanding. Help us to create an environment where they feel safe to explore their beliefs and develop a personal relationship with You.\nWe ask for Your protection over our children, both physically and spiritually. Guard their hearts and minds against the challenges of the world, and surround them with positive influences that lead them closer to You.\nLord, we pray for the Holy Spirit to work in their lives, guiding them into all truth and convicting them of Your love. May they grow in wisdom, understanding, and grace as they walk in the path You have set before them.\nGrant us the wisdom to discipline with love, to encourage with kindness, and to inspire with Your Word. May our family be a place where Your love is evident, and where our children can experience the joy of knowing You.\nLord Jesus, we commit our children into Your loving care. May they come to know You as their Savior and follow You all the days of their lives. May they be a light in this world, shining Your love and truth to those around them.\nIn Jesus\' name, we pray.\nAmen.','','children.mp4','ChatGPT 3.5'),(19,'Overcoming Stress','Dear Heavenly Father,\n\nOn this day, as we gather our thoughts and open our hearts to your boundless grace, we come before you seeking solace and strength in the face of stress that burdens our minds and spirits. Grant us, O God, the wisdom to recognize the roots of our stress and the courage to confront them. Help us understand that challenges are opportunities for growth, and that with your guidance, we can overcome any adversity. In moments of overwhelming pressure, be our calming force, soothing the turbulence within. Illuminate our minds with clarity, helping us discern the path forward amidst the chaos. May we find the serenity to accept what we cannot change, the courage to change what we can, and the wisdom to know the difference. Infuse our hearts with resilience, that we may rise above the anxieties that threaten to consume us. Grant us the patience to endure, the faith to believe in a brighter tomorrow, and the strength to persevere through the darkest of hours. Let your comforting presence surround us, enveloping us in a protective embrace that banishes fear and anxiety. Fill us with a profound sense of peace that transcends understanding, allowing us to navigate life\'s challenges with grace and composure. As we face the trials of each day, empower us to cultivate a spirit of gratitude, recognizing the blessings that abound even in the midst of turmoil. Guide us to appreciate the beauty that exists in every moment, and to draw strength from the love that surrounds us. We humbly offer this prayer, trusting in your infinite compassion and knowing that, with your divine assistance, we can overcome stress and emerge stronger on the other side. Amen.','','','ChatGPT 3.5'),(20,'Appearing in court','Dear Heavenly Father, As I stand on the threshold of the courtroom, I am enveloped in the shadows of anxiety and uncertainty. Lord, You know the depths of my heart, and You understand the fears that grip my soul. In this moment of vulnerability, I turn to You, the source of strength and solace. Gracious God, grant me the courage to face the challenges that lie ahead. In the face of anxiety, fill me with Your peace that surpasses all understanding. Let Your comforting presence be my shield as I step into the arena of judgment. Lord Jesus, who bore the weight of the world\'s burdens, I surrender my anxieties to You. Take this heavy load from my shoulders, and grant me the assurance that Your grace is sufficient for me. In moments of doubt, remind me of Your unwavering love and the promise that You will never leave nor forsake me. Holy Spirit, be my guide and advocate in the courtroom. Grant wisdom to those who will make decisions, and let justice be served according to Your divine will. May Your light dispel the shadows of anxiety, and may Your truth prevail in every aspect of this legal process. I place my trust in You, O Lord, for You are the ultimate Judge and the source of all righteousness. Help me to walk in faith, knowing that, regardless of the outcome, Your plan for my life is perfect and purposeful. In the name of the Father, the Son, and the Holy Spirit, I offer this prayer. Amen.','','','ChatGPT 3.5'),(21,'Patience with Youself','Dear God,\nOn this day, as I reflect upon the journey of the past year, I come before you with a humble heart. I acknowledge the challenges I’ve faced, the obstacles I’ve overcome, and the lessons I’ve learned. In the midst of it all, I find myself yearning for the strength to embrace patience with myself. Grant me the wisdom to understand that growth takes time, that progress is a journey, and that self-love is a vital companion on this path. In moments of frustration and self-doubt, be my guiding light, illuminating the way to patience. Help me release the weight of expectations and perfection, replacing them with the understanding that I am a work in progress. May I find solace in the knowledge that mistakes are stepping stones to wisdom, and setbacks are opportunities for resilience. Grant me the courage to be kind to myself, to celebrate small victories, and to recognize the beauty in the process of becoming. In moments of impatience, gently remind me that I am worthy of the time it takes to evolve and transform. May I learn to trust in the timing of my life, recognizing that every step forward, no matter how small, is a triumph. Bless me with the grace to be patient with myself, as you are patient with all of your creations. In your divine presence, I find strength, compassion, and the assurance that I am enough. As I continue this journey, let patience be my constant companion, allowing me to bloom in your perfect timing. Amen.\n','calm.jpg','health.mp4','ChatGPT 3.5'),(22,'Coming Back from an Injury','Dear Lord,\nI come before you with a heart filled with gratitude for the gift of life and the strength you have bestowed upon me. In this moment of prayer, I lift up to you the challenges I’ve faced due to my sports injury. I acknowledge the pain, frustration, and the journey of healing that lies ahead. Grant me the courage to face the path of recovery with resilience and determination. As I navigate the physical therapy, the setbacks, and the moments of doubt, be my constant source of strength and inspiration. Let your healing touch be upon me, both in body and spirit. Help me embrace patience as I allow my body to heal and regain its strength. May I find solace in knowing that every small step toward recovery is a victory in itself. In moments of weakness, instill in me the belief that with your grace, I can overcome any obstacle. Surround me with a supportive community—doctors, therapists, friends, and family—who uplift me in times of need. Grant them wisdom and compassion as they contribute to my healing journey. May their presence be a reminder of the love and care that surrounds me. Guide me to listen to my body, to discern the pace of recovery, and to be mindful of the lessons this experience brings. In the process of healing, may I discover a deeper understanding of my own resilience and an appreciation for the fragility and strength of the human body. Lord, I surrender my fears and anxieties to you, trusting that you are the ultimate healer. Your love is a balm for my wounds, and your grace is the foundation of my recovery. As I step back onto the field or court, may I do so with a heart filled with gratitude and a spirit fortified by your unwavering support. In your holy name, I pray. Amen.','','','ChatGPT 3.5'),(23,'Giving Thanks for Blessings','Dear Lord,\n\nOn this special day, as I reflect upon the journey of the past year, I am overwhelmed with gratitude and a profound sense of thanksgiving. I lift my heart in prayer to express my deepest appreciation for the countless blessings that have graced my life. Thank you for the gift of life itself — for every breath, every heartbeat, and the wondrous symphony of moments that make up the tapestry of my existence. Your divine grace has illuminated my path, guiding me through both sunshine and storm. I am grateful for the love that surrounds me, the warmth of relationships that nurture my soul. Family and friends, whose support and companionship have been a source of strength and joy, I give thanks for the beauty of these connections. Thank you for the challenges, for in them I have found opportunities for growth and resilience. Your wisdom has been a guiding light, helping me navigate the twists and turns of life\'s journey with courage and fortitude. I express gratitude for the bountiful provisions you have bestowed upon me — the sustenance for my body, the shelter for my rest, and the abundance that allows me to share with others in need. In moments of solitude, I find gratitude for the stillness that allows me to hear the whispers of my own soul and the gentle nudges of your divine presence. Thank you for the moments of reflection and introspection that deepen my understanding of myself and my purpose. As I offer this prayer of thanks, I recognize that every blessing, large or small, is a manifestation of your boundless love and generosity. May my heart be forever attuned to the melody of gratitude, and may my actions reflect the appreciation I feel. In humble acknowledgment of your grace, I offer this prayer with a heart overflowing with thanks. Amen.','','','ChatGPT 3.5'),(24,'Prayer for Patience with Frustrating Students','Heavenly Father, I come before you today, seeking your guidance and grace. I humbly ask for your divine intervention in navigating the challenges I face as an educator, particularly in moments when patience seems to wear thin. Lord, I acknowledge that my students are individuals with unique minds, learning styles, and backgrounds. They are not merely vessels to be filled with knowledge but rather blooming flowers, each at their own stage of growth. Grant me the wisdom to recognize that their struggles are not intentional acts of defiance but rather reflections of their individual journeys. When faced with frustrating behaviors or seemingly insurmountable obstacles, help me to remember your boundless patience. Remind me that just as you nurture the seeds of nature, I am called to cultivate the seeds of knowledge and understanding within my students. In moments of frustration, grant me the serenity to pause, breathe, and seek your guidance. Help me to approach each situation with compassion and understanding, remembering that my role is not to judge or condemn but to guide and support. Lord, I pray for the strength to persevere, to find joy in the small victories, and to celebrate the progress, no matter how incremental. Remind me that my calling is not a sprint but a marathon, and that true growth takes time and unwavering dedication. As I embark on this journey of teaching and learning, fill me with your infinite patience, so that I may reflect your love and grace in my interactions with my students. May I be a beacon of hope, fostering an environment where every student feels valued, respected, and encouraged to reach their full potential. In Jesus\' name, I pray, Amen.','calm.jpg','','Google Bard'),(25,'Prayer for Guidance','Heavenly Father, on this significant day, I come before you with a prayer for guidance as I stand at the crossroads of the past and the future. Your word in Proverbs 3:5-6 reminds me to trust in you with all my heart and not lean on my own understanding. In this moment, I surrender my plans and aspirations to your divine will, seeking the path you have laid out for me. Lord, grant me discernment to make wise decisions, clarity to see the direction you\'re leading me, and the courage to follow, even when the path may seem unclear. Your promise in Jeremiah 29:11 assures me that you have plans for my welfare, plans for a future full of hope. With this assurance, I step forward in faith, knowing that you hold my future in your loving hands. As I embark on this new phase of my journey, I ask for the light of your Word to illuminate my path. May the teachings of Psalm 119:105 be a lamp unto my feet and a light unto my path, guiding me through both challenges and triumphs.In moments of uncertainty, may I find solace in your promises. In moments of decision, may your wisdom be my guide. I place my trust in you, O Lord, and I pray that every step I take aligns with your divine purpose for my life.Amen.','','','ChatGPT 3.5'),(26,'Prayer for healing','Heavenly Healer, on this day of reflection and gratitude, I offer a prayer for healing. Your word in Psalm 147:3 assures us that you heal the brokenhearted and bind up their wounds. In moments of physical or emotional pain, I turn to you as the ultimate source of restoration and comfort. Lord, I lift up to you all those who are in need of healing - physically, mentally, and spiritually. May your healing touch be upon them, bringing comfort, strength, and renewal. I trust in your promise from James 5:15 that the prayer of faith will save the sick, and the Lord will raise them up. As I seek healing for myself or on behalf of others, I pray for the patience to endure, the strength to persevere, and the faith to believe in your miraculous power. May the balm of your love soothe every ache, and may the warmth of your presence bring peace to troubled hearts. In times of uncertainty, remind us of your unchanging love. In times of pain, be our refuge and strength. I place my trust in your healing grace, knowing that you are the Great Physician who mends both body and soul. Amen.','','healing.mp4','ChatGPT 3.5'),(27,'Being thankful ','Gracious Heavenly Father,\nWe come before you with hearts overflowing with gratitude, acknowledging your boundless love and mercy that sustains us each day. In moments of joy and trials alike, we are grateful for the assurance that your presence accompanies us, guiding and comforting our souls.\nLord, we give thanks for the countless blessings you have bestowed upon us - the gift of life, the love of family and friends, and the abundance of your grace. In our moments of reflection, we recognize that every good and perfect gift comes from above, a testament to your unwavering faithfulness.\nAs we express our thankfulness, we are reminded of the words from Philippians 4:6-7: \'Do not be anxious about anything, but in every situation, by prayer and petition, with thanksgiving, present your requests to God. And the peace of God, which transcends all understanding, will guard your hearts and your minds in Christ Jesus.\'\nMay these words guide us in our journey of gratitude, trusting in your divine plan for our lives. Help us cultivate hearts of thanksgiving, even in challenging times, knowing that your love endures forever.\nIn Jesus\' name, we pray.Amen.','','','ChatGPT 3.5'),(28,'Prayer about being strong and courageous','Heavenly Father, In the face of life\'s challenges and uncertainties, we humbly come before you, seeking strength and courage. Your Word assures us in Joshua 1:9, \'Be strong and courageous. Do not be afraid; do not be discouraged, for the Lord your God will be with you wherever you go.\' We cling to this promise, knowing that your presence empowers us to face any circumstance with unwavering faith. Grant us the strength to persevere in adversity, trusting in your divine plan for our lives. Fill our hearts with courage, Lord, as we navigate the paths you\'ve set before us. May we find solace in the knowledge that, through Christ, we can overcome any obstacle.\nIn moments of doubt, remind us that you are our refuge and strength, an ever-present help in trouble (Psalm 46:1). As we draw near to you, may we be strengthened by the assurance of your love and the indomitable power of your Spirit within us. Embolden us, O Lord, to face each day with courage, knowing that we are more than conquerors through Him who loved us (Romans 8:37). In Jesus\' mighty name, we pray. Amen','strength.jpg','','Chat GPT 3.5'),(29,'Prayer about staying mentally strong','Dear [Divine Being/Higher Power],\nIn moments of challenge and uncertainty, I turn to you, seeking strength for my mind and spirit. Grant me the fortitude to face the trials that come my way and the resilience to navigate the twists and turns of life.\nIn the midst of chaos, help me find the calm within. Illuminate the path of clarity and understanding, so I may confront my fears with a steady heart and a resolute mind. Let the light of your wisdom guide me through the shadows of doubt and confusion.\nGrant me the wisdom to discern between what I can control and what is beyond my influence. Teach me the power of acceptance and the serenity that comes with releasing the burdens that are not mine to carry.\nWhen doubts and negative thoughts attempt to cloud my mind, empower me to replace them with affirmations of strength, courage, and positivity. Let your love and grace be the foundation upon which I build my mental resilience.\nIn moments of weakness, may I find solace in your presence. Strengthen my spirit and fill my heart with hope, reminding me that I am never alone in my journey. Help me draw strength from the lessons of the past and courage from the possibilities of the future.\nAs I face the challenges ahead, may I cultivate a mindset of gratitude, recognizing the blessings that surround me even in difficult times. Grant me the insight to appreciate the lessons embedded in adversity and the courage to emerge from challenges stronger than before.\nI surrender my anxieties and concerns to you, knowing that in your infinite wisdom, you hold the key to my mental strength. May I be a beacon of resilience, inspiring others to find strength in the face of adversity.\nIn your name, I pray.\n\nAmen.','','','ChatGPT 3.5'),(30,'Prayer for those full of hatred and anger','Heavenly Father,\n\nAs we stand before You, we lift up those who are burdened by the weight of anger and hatred in their hearts. We recall the wisdom You imparted through the words of Corinthians, reminding us that love is patient and kind, never envious or boastful, never arrogant or rude. Help us, Lord, to embody these teachings as we intercede for those battling animosity and resentment.\n\nGuide them through the corridors of their souls, where shadows of anger obscure the light of Your love. Grant them the strength to heed the lessons from Corinthians, to let go of bitterness and embrace the enduring power of love.\n\nIn the spirit of Corinthians, where love rejoices in truth and bears all things, may their hearts find solace in forgiveness and reconciliation. May they discover the transformative grace of Your love, healing the wounds of anger and paving the way for understanding and empathy.\n\nJust as Corinthians teaches us to put away childish ways, may these individuals shed the burden of hate, embracing the maturity of forgiveness and compassion.\n\nMay the essence of Corinthians infuse their spirits, allowing them to radiate the love that is patient, kind, and eternally enduring.\n\nIn Your compassionate embrace, may they find peace and redemption, transforming their hearts to reflect the love that Corinthians so beautifully describes.\n\nAmen.','','','ChatGPT 3.5');
/*!40000 ALTER TABLE `prayers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prayerscreators`
--

DROP TABLE IF EXISTS `prayerscreators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prayerscreators` (
  `prayersCreatorID` int NOT NULL AUTO_INCREMENT,
  `userID` int DEFAULT NULL,
  `prayerID` int DEFAULT NULL,
  PRIMARY KEY (`prayersCreatorID`),
  UNIQUE KEY `prayersCreatorID` (`prayersCreatorID`),
  UNIQUE KEY `prayerCreators` (`prayerID`,`userID`),
  KEY `userID` (`userID`),
  CONSTRAINT `prayerscreators_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`),
  CONSTRAINT `prayerscreators_ibfk_2` FOREIGN KEY (`prayerID`) REFERENCES `prayers` (`prayerID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prayerscreators`
--

LOCK TABLES `prayerscreators` WRITE;
/*!40000 ALTER TABLE `prayerscreators` DISABLE KEYS */;
INSERT INTO `prayerscreators` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,4),(5,2,5),(6,3,6),(7,3,7),(8,4,8),(9,4,9),(10,5,10),(11,5,11),(12,6,12),(13,6,13),(14,7,14),(15,7,15),(16,8,16),(17,8,17),(18,9,18),(19,10,19),(20,11,20),(21,12,21),(22,12,22),(23,10,23),(24,11,24),(25,13,25),(26,13,26),(27,14,27),(28,14,28),(29,15,29),(30,16,30);
/*!40000 ALTER TABLE `prayerscreators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prayersscriptures`
--

DROP TABLE IF EXISTS `prayersscriptures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prayersscriptures` (
  `prayersScriptureID` int NOT NULL AUTO_INCREMENT,
  `scriptureID` int DEFAULT NULL,
  `prayerID` int DEFAULT NULL,
  PRIMARY KEY (`prayersScriptureID`),
  UNIQUE KEY `prayersScriptureID` (`prayersScriptureID`),
  UNIQUE KEY `prayerScriptures` (`prayerID`,`scriptureID`),
  KEY `scriptureID` (`scriptureID`),
  CONSTRAINT `prayersscriptures_ibfk_1` FOREIGN KEY (`prayerID`) REFERENCES `prayers` (`prayerID`),
  CONSTRAINT `prayersscriptures_ibfk_2` FOREIGN KEY (`scriptureID`) REFERENCES `scriptures` (`scriptureID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prayersscriptures`
--

LOCK TABLES `prayersscriptures` WRITE;
/*!40000 ALTER TABLE `prayersscriptures` DISABLE KEYS */;
INSERT INTO `prayersscriptures` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),(16,16,16),(17,17,17),(18,18,18),(19,19,19),(20,19,20),(21,20,20),(22,21,21),(23,22,22),(24,23,23),(25,24,24),(26,25,24),(27,26,25),(28,27,26),(29,19,27),(30,28,28),(31,1,29),(32,20,29),(33,29,30);
/*!40000 ALTER TABLE `prayersscriptures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prayerstags`
--

DROP TABLE IF EXISTS `prayerstags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prayerstags` (
  `prayerTagID` int NOT NULL AUTO_INCREMENT,
  `tagID` int DEFAULT NULL,
  `prayerID` int DEFAULT NULL,
  PRIMARY KEY (`prayerTagID`),
  UNIQUE KEY `prayerTagID` (`prayerTagID`),
  UNIQUE KEY `prayerTags` (`prayerID`,`tagID`),
  KEY `tagID` (`tagID`),
  CONSTRAINT `prayerstags_ibfk_1` FOREIGN KEY (`prayerID`) REFERENCES `prayers` (`prayerID`),
  CONSTRAINT `prayerstags_ibfk_2` FOREIGN KEY (`tagID`) REFERENCES `tags` (`tagID`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prayerstags`
--

LOCK TABLES `prayerstags` WRITE;
/*!40000 ALTER TABLE `prayerstags` DISABLE KEYS */;
INSERT INTO `prayerstags` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,7),(9,9,8),(10,10,9),(11,9,10),(12,11,11),(13,11,12),(14,12,13),(15,13,14),(16,14,15),(17,15,16),(18,16,17),(23,3,18),(19,15,18),(20,17,18),(21,18,18),(22,19,18),(26,7,19),(25,9,19),(24,11,19),(27,20,19),(28,21,20),(29,22,20),(30,23,20),(31,24,20),(33,3,21),(32,11,21),(34,9,22),(36,15,23),(35,33,23),(37,3,24),(38,25,24),(39,26,24),(40,27,24),(41,28,24),(42,11,25),(43,14,25),(45,15,25),(44,29,25),(49,6,26),(46,30,26),(47,31,26),(48,32,26),(52,8,27),(50,33,27),(51,34,27),(53,35,28),(54,36,28),(55,36,29),(57,3,30),(56,8,30),(58,37,30);
/*!40000 ALTER TABLE `prayerstags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saves`
--

DROP TABLE IF EXISTS `saves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saves` (
  `savedID` int NOT NULL AUTO_INCREMENT,
  `prayerID` int DEFAULT NULL,
  `userID` int DEFAULT NULL,
  `savedTime` datetime NOT NULL,
  PRIMARY KEY (`savedID`),
  UNIQUE KEY `savedID` (`savedID`),
  UNIQUE KEY `saves` (`prayerID`,`userID`),
  KEY `userID` (`userID`),
  CONSTRAINT `saves_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`),
  CONSTRAINT `saves_ibfk_2` FOREIGN KEY (`prayerID`) REFERENCES `prayers` (`prayerID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saves`
--

LOCK TABLES `saves` WRITE;
/*!40000 ALTER TABLE `saves` DISABLE KEYS */;
INSERT INTO `saves` VALUES (1,3,1,'2023-12-02 01:22:00'),(2,12,1,'2023-12-02 01:23:00'),(3,20,2,'2023-12-03 01:22:00'),(4,10,3,'2023-12-02 01:22:00'),(5,15,3,'2023-12-02 01:38:00'),(6,18,3,'2023-04-09 01:27:00'),(7,11,4,'2023-12-04 01:22:00'),(8,22,4,'2023-12-02 01:20:00'),(9,13,4,'2023-02-02 04:22:00'),(10,21,4,'2023-11-02 01:22:00'),(11,8,5,'2023-12-02 01:22:00'),(12,7,5,'2023-12-02 09:22:00'),(13,17,5,'2023-05-20 04:22:00'),(14,24,6,'2023-12-02 01:22:00'),(15,12,6,'2023-12-07 01:20:00'),(16,27,7,'2023-12-02 13:22:00'),(17,10,8,'2023-04-30 01:22:00'),(18,18,8,'2023-12-02 09:22:00'),(19,2,8,'2023-10-02 01:22:00'),(20,5,8,'2023-12-02 01:22:00'),(21,21,8,'2023-09-02 14:11:00'),(22,4,9,'2023-12-02 05:20:00'),(23,7,10,'2023-04-02 01:22:00'),(24,22,10,'2023-12-01 01:21:00'),(25,2,11,'2023-12-02 01:22:00'),(26,18,11,'2023-05-12 01:22:00'),(27,27,11,'2023-12-02 01:06:00'),(28,30,12,'2023-03-09 01:22:00'),(29,12,12,'2023-12-02 08:22:00'),(30,26,13,'2023-12-09 01:22:00'),(31,23,13,'2023-12-02 01:11:11'),(32,15,13,'2023-12-10 01:22:00'),(33,18,14,'2023-07-02 06:12:00'),(34,17,14,'2023-12-02 03:02:00'),(35,7,15,'2023-01-01 01:22:00'),(36,22,16,'2023-12-02 01:02:00'),(37,16,17,'2023-11-19 01:22:00'),(38,28,17,'2023-12-02 01:22:00'),(39,4,17,'2023-12-08 01:22:00');
/*!40000 ALTER TABLE `saves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scriptures`
--

DROP TABLE IF EXISTS `scriptures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scriptures` (
  `scriptureID` int NOT NULL AUTO_INCREMENT,
  `verses` varchar(255) NOT NULL,
  PRIMARY KEY (`scriptureID`),
  UNIQUE KEY `scriptureID` (`scriptureID`),
  UNIQUE KEY `verses` (`verses`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scriptures`
--

LOCK TABLES `scriptures` WRITE;
/*!40000 ALTER TABLE `scriptures` DISABLE KEYS */;
INSERT INTO `scriptures` VALUES (11,' Psalm 23:4'),(29,'1 Corinthians 13'),(3,'1 Corinthians 13:4-5'),(13,'1 John 1:9'),(23,'1 Thessalonians 5:18'),(15,'2 Corinthians 5:7'),(10,'Deuteronomy 31:6'),(25,'Galatians 6:9'),(21,'Isaiah 40:31'),(20,'Isaiah 41:10'),(8,'Jeremiah 29:11'),(28,'Joshua 1:9'),(2,'Mark 12:31'),(5,'Matthew 11:28-30'),(12,'Matthew 5:16'),(19,'Philippians 4:6-7 '),(9,'Phillippians 2:3'),(1,'Phillippians 4:13'),(16,'Proverbs 2:6'),(18,'Proverbs 22:6'),(24,'Proverbs 25:5'),(26,'Proverbs 3:5-6'),(7,'Psalm 136:1-3'),(27,'Psalm 147:3'),(17,'Psalm 30:5'),(22,'Psalm 34:17-18'),(6,'Psalm 46'),(14,'Psalm 51:10-12'),(4,'Romans 8:28');
/*!40000 ALTER TABLE `scriptures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `tagID` int NOT NULL AUTO_INCREMENT,
  `tagDescription` varchar(255) NOT NULL,
  PRIMARY KEY (`tagID`),
  UNIQUE KEY `tagID` (`tagID`),
  UNIQUE KEY `tagDescription` (`tagDescription`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (37,' Growth'),(18,'Advice'),(21,'Anxiety'),(1,'Challenges'),(17,'Children'),(29,'Clarity'),(6,'Comfort'),(35,'Courage'),(19,'Example'),(14,'Faith'),(24,'Faithfulness'),(22,'Forgiveness'),(25,'Frustration'),(33,'Gratitude'),(11,'Guidance '),(31,'Healing'),(10,'Humility'),(16,'Joy'),(23,'Justice'),(26,'Learning'),(8,'Love'),(2,'LovingOthers'),(9,'Motivation'),(27,'Obstacles'),(3,'Patience'),(20,'Peace'),(13,'PureHeart'),(12,'Repentance'),(5,'Rest'),(32,'Restoration'),(30,'Spiritual'),(36,'Strength'),(28,'Struggles'),(4,'Success'),(34,'Thankfulness'),(7,'Thanks'),(15,'Wisdom');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userID` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Nathan Lewis'),(2,'Priscilla Harris'),(3,'Lauren Taylor'),(4,'Seth Creasy '),(5,'Tucker Brown'),(6,'Christian Stackpole'),(7,'Emma Kate Garrett'),(8,'Savannah Martin'),(9,'Daniel Trimm'),(10,'Avery Harris'),(11,'Wesley Baker'),(12,'Kaylee Odom'),(13,'Maddie Ehinger'),(14,'Justin Ellis'),(15,'Tyler Rhodes'),(16,'Judah Rininger'),(17,'Kelly Sproule');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-07 14:10:21
