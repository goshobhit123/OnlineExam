USE [DBQUIZ]
GO
/****** Object:  Table [dbo].[Q_DETAILS]    Script Date: 10/9/2019 5:22:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Q_DETAILS](
	[DETAIL_ID] [int] IDENTITY(1,1) NOT NULL,
	[EXAM_ID] [int] NOT NULL,
	[QUESTION_ID] [int] NOT NULL,
 CONSTRAINT [PK_Q_DETAILS] PRIMARY KEY CLUSTERED 
(
	[DETAIL_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_ADMIN]    Script Date: 10/9/2019 5:22:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_ADMIN](
	[AD_ID] [int] IDENTITY(1,1) NOT NULL,
	[AD_NAME] [nvarchar](20) NOT NULL,
	[AD_PASSWORD] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_categroy]    Script Date: 10/9/2019 5:22:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_categroy](
	[cat_id] [int] IDENTITY(1,1) NOT NULL,
	[cat_name] [nvarchar](50) NOT NULL,
	[cat_fk_adid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_QUESTIONS]    Script Date: 10/9/2019 5:22:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_QUESTIONS](
	[QUESTION_ID] [int] IDENTITY(1,1) NOT NULL,
	[Q_TEXT] [nvarchar](max) NOT NULL,
	[OPA] [nvarchar](max) NOT NULL,
	[OPB] [nvarchar](max) NOT NULL,
	[OPC] [nvarchar](max) NOT NULL,
	[OPD] [nvarchar](max) NOT NULL,
	[COP] [nvarchar](max) NOT NULL,
	[q_fk_catid] [int] NULL,
	[Q_level] [varchar](50) NULL,
 CONSTRAINT [PK__TBL_QUES__30BE07ADCF94DACC] PRIMARY KEY CLUSTERED 
(
	[QUESTION_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBL_SETEXAM]    Script Date: 10/9/2019 5:22:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_SETEXAM](
	[EXAM_ID] [int] IDENTITY(1,1) NOT NULL,
	[EXAM_DATE] [datetime] NULL,
	[EXAM_FK_STU] [int] NULL,
	[EXAM_NAME] [nvarchar](50) NOT NULL,
	[EXAM_STD_SCORE] [int] NULL,
	[EXAM_DURATION] [time](7) NULL,
	[EXAM_MARKS] [int] NULL,
	[EXAM_NO_QUES] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EXAM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_STUDENT]    Script Date: 10/9/2019 5:22:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_STUDENT](
	[S_ID] [int] IDENTITY(1000,10) NOT NULL,
	[S_EMAIL] [nvarchar](max) NOT NULL,
	[S_NAME] [nvarchar](30) NOT NULL,
	[S_PASSWORD] [nvarchar](20) NOT NULL,
	[PHONE_NO] [bigint] NULL,
	[ADDRESS] [nvarchar](max) NULL,
	[AGE] [int] NULL,
	[GENDER] [varchar](50) NULL,
 CONSTRAINT [PK__TBL_STUD__A3DFF16D64528795] PRIMARY KEY CLUSTERED 
(
	[S_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USER_REPORT]    Script Date: 10/9/2019 5:22:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USER_REPORT](
	[TEST_ID] [int] IDENTITY(1,1) NOT NULL,
	[USER_ID] [int] NOT NULL,
	[USER_NAME] [varchar](50) NOT NULL,
	[USER_PAPER] [varchar](50) NOT NULL,
	[USER_SCORE] [int] NOT NULL,
	[MAX_MARKS] [int] NOT NULL,
 CONSTRAINT [PK_USER_REPORT] PRIMARY KEY CLUSTERED 
(
	[TEST_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_ADMIN] ON 

INSERT [dbo].[TBL_ADMIN] ([AD_ID], [AD_NAME], [AD_PASSWORD]) VALUES (1, N'Admin', N'adminadmin')
SET IDENTITY_INSERT [dbo].[TBL_ADMIN] OFF
SET IDENTITY_INSERT [dbo].[tbl_categroy] ON 

INSERT [dbo].[tbl_categroy] ([cat_id], [cat_name], [cat_fk_adid]) VALUES (1, N'asp.net MVC', 1)
INSERT [dbo].[tbl_categroy] ([cat_id], [cat_name], [cat_fk_adid]) VALUES (2, N'HTML-5', 1)
INSERT [dbo].[tbl_categroy] ([cat_id], [cat_name], [cat_fk_adid]) VALUES (3, N'LINUX UBUNTU', 1)
INSERT [dbo].[tbl_categroy] ([cat_id], [cat_name], [cat_fk_adid]) VALUES (1002, N'c#', 1)
INSERT [dbo].[tbl_categroy] ([cat_id], [cat_name], [cat_fk_adid]) VALUES (3003, N'python', 1)
INSERT [dbo].[tbl_categroy] ([cat_id], [cat_name], [cat_fk_adid]) VALUES (4002, N'math', 1)
INSERT [dbo].[tbl_categroy] ([cat_id], [cat_name], [cat_fk_adid]) VALUES (4003, N'Physics', 1)
INSERT [dbo].[tbl_categroy] ([cat_id], [cat_name], [cat_fk_adid]) VALUES (4004, N'chemistry', 1)
INSERT [dbo].[tbl_categroy] ([cat_id], [cat_name], [cat_fk_adid]) VALUES (4005, N'biology', 1)
SET IDENTITY_INSERT [dbo].[tbl_categroy] OFF
SET IDENTITY_INSERT [dbo].[TBL_QUESTIONS] ON 

INSERT [dbo].[TBL_QUESTIONS] ([QUESTION_ID], [Q_TEXT], [OPA], [OPB], [OPC], [OPD], [COP], [q_fk_catid], [Q_level]) VALUES (3002, N'HTML stands for?', N'Hypertext Markup Language', N'Hyper Markup Language', N'Hypermax Language', N'Hyper Language', N'A', 2, N'EASY')
INSERT [dbo].[TBL_QUESTIONS] ([QUESTION_ID], [Q_TEXT], [OPA], [OPB], [OPC], [OPD], [COP], [q_fk_catid], [Q_level]) VALUES (3003, N'which tag is used to mark a begining of paragraph?', N'td', N'br', N'p', N'tr', N'C', 2, N'MEDIUM')
INSERT [dbo].[TBL_QUESTIONS] ([QUESTION_ID], [Q_TEXT], [OPA], [OPB], [OPC], [OPD], [COP], [q_fk_catid], [Q_level]) VALUES (3004, N'Largest heading tag?', N'h2', N'h1', N'h3', N'h4', N'B', 2, N'MEDIUM')
INSERT [dbo].[TBL_QUESTIONS] ([QUESTION_ID], [Q_TEXT], [OPA], [OPB], [OPC], [OPD], [COP], [q_fk_catid], [Q_level]) VALUES (3005, N'The attribute of form tag is ?', N'Method ', N'Action', N'Both A and B', N'None of these', N'C', 2, N'HARD')
INSERT [dbo].[TBL_QUESTIONS] ([QUESTION_ID], [Q_TEXT], [OPA], [OPB], [OPC], [OPD], [COP], [q_fk_catid], [Q_level]) VALUES (3006, N'From which tag descriptive list starts?', N'LL', N'DD', N'DL', N'DS', N'C', 2, N'MEDIUM')
INSERT [dbo].[TBL_QUESTIONS] ([QUESTION_ID], [Q_TEXT], [OPA], [OPB], [OPC], [OPD], [COP], [q_fk_catid], [Q_level]) VALUES (3007, N'Markup tags tell the web browser?', N'How to organise page?', N'How to display Page', N'How to display message box on page', N'None of these', N'B', 2, N'HARD')
INSERT [dbo].[TBL_QUESTIONS] ([QUESTION_ID], [Q_TEXT], [OPA], [OPB], [OPC], [OPD], [COP], [q_fk_catid], [Q_level]) VALUES (3008, N'www is based on which model?', N'Local-server', N'Clien-server', N'3-tier', N'None of these', N'B', 2, N'HARD')
INSERT [dbo].[TBL_QUESTIONS] ([QUESTION_ID], [Q_TEXT], [OPA], [OPB], [OPC], [OPD], [COP], [q_fk_catid], [Q_level]) VALUES (3009, N'A much better approach to establish the base URL is to use-', N'Base element ', N'Head element ', N'Both A and B', N'None of these', N'A', 2, N'HARD')
INSERT [dbo].[TBL_QUESTIONS] ([QUESTION_ID], [Q_TEXT], [OPA], [OPB], [OPC], [OPD], [COP], [q_fk_catid], [Q_level]) VALUES (3010, N'In HTML input is a-', N'Format tag', N'Empty tag', N'Both A and B', N'None of these', N'B', 2, N'MEDIUM')
INSERT [dbo].[TBL_QUESTIONS] ([QUESTION_ID], [Q_TEXT], [OPA], [OPB], [OPC], [OPD], [COP], [q_fk_catid], [Q_level]) VALUES (3011, N'The latest HTML standard is-', N'XML', N'SGML', N'HTML 4.0', N'HTML 5.0', N'D', 2, N'HARD')
INSERT [dbo].[TBL_QUESTIONS] ([QUESTION_ID], [Q_TEXT], [OPA], [OPB], [OPC], [OPD], [COP], [q_fk_catid], [Q_level]) VALUES (3012, N'2+2?', N'4', N'100', N'2', N'5', N'A', 4002, N'HARD')
INSERT [dbo].[TBL_QUESTIONS] ([QUESTION_ID], [Q_TEXT], [OPA], [OPB], [OPC], [OPD], [COP], [q_fk_catid], [Q_level]) VALUES (3013, N'2+3', N'5', N'6', N'4', N'2', N'A', 4002, N'HARD')
INSERT [dbo].[TBL_QUESTIONS] ([QUESTION_ID], [Q_TEXT], [OPA], [OPB], [OPC], [OPD], [COP], [q_fk_catid], [Q_level]) VALUES (3014, N'7+0', N'0', N'1', N'7', N'3', N'C', 4002, N'EASY')
INSERT [dbo].[TBL_QUESTIONS] ([QUESTION_ID], [Q_TEXT], [OPA], [OPB], [OPC], [OPD], [COP], [q_fk_catid], [Q_level]) VALUES (3015, N'3+3', N'5', N'4', N'6', N'6', N'D', 4002, N'EASY')
INSERT [dbo].[TBL_QUESTIONS] ([QUESTION_ID], [Q_TEXT], [OPA], [OPB], [OPC], [OPD], [COP], [q_fk_catid], [Q_level]) VALUES (4013, N'what is the unit of speed?', N'metre per second', N'metre per second square', N'm', N'second', N'A', 4003, N'EASY')
SET IDENTITY_INSERT [dbo].[TBL_QUESTIONS] OFF
SET IDENTITY_INSERT [dbo].[TBL_STUDENT] ON 

INSERT [dbo].[TBL_STUDENT] ([S_ID], [S_EMAIL], [S_NAME], [S_PASSWORD], [PHONE_NO], [ADDRESS], [AGE], [GENDER]) VALUES (1000, N'SHOBHIT@GMAIL.COM', N'shobhit', N'shobhit@123', 8754561771, N'address', 21, N'MALE')
INSERT [dbo].[TBL_STUDENT] ([S_ID], [S_EMAIL], [S_NAME], [S_PASSWORD], [PHONE_NO], [ADDRESS], [AGE], [GENDER]) VALUES (1010, N'ch@gmail.com', N'shivani', N'asdfg@123', 1234567890, N'address', 22, N'FEMALE')
SET IDENTITY_INSERT [dbo].[TBL_STUDENT] OFF
SET IDENTITY_INSERT [dbo].[USER_REPORT] ON 

INSERT [dbo].[USER_REPORT] ([TEST_ID], [USER_ID], [USER_NAME], [USER_PAPER], [USER_SCORE], [MAX_MARKS]) VALUES (1033, 1000, N'shobhit', N'HTML-5', 50, 100)
INSERT [dbo].[USER_REPORT] ([TEST_ID], [USER_ID], [USER_NAME], [USER_PAPER], [USER_SCORE], [MAX_MARKS]) VALUES (1034, 1000, N'shobhit', N'HTML-5', 50, 100)
INSERT [dbo].[USER_REPORT] ([TEST_ID], [USER_ID], [USER_NAME], [USER_PAPER], [USER_SCORE], [MAX_MARKS]) VALUES (1035, 1000, N'shobhit', N'HTML-5', 30, 100)
INSERT [dbo].[USER_REPORT] ([TEST_ID], [USER_ID], [USER_NAME], [USER_PAPER], [USER_SCORE], [MAX_MARKS]) VALUES (1036, 1000, N'shobhit', N'HTML-5', 40, 100)
INSERT [dbo].[USER_REPORT] ([TEST_ID], [USER_ID], [USER_NAME], [USER_PAPER], [USER_SCORE], [MAX_MARKS]) VALUES (1037, 1000, N'shobhit', N'HTML-5', 10, 100)
INSERT [dbo].[USER_REPORT] ([TEST_ID], [USER_ID], [USER_NAME], [USER_PAPER], [USER_SCORE], [MAX_MARKS]) VALUES (1038, 1000, N'shobhit', N'HTML-5', 0, 100)
INSERT [dbo].[USER_REPORT] ([TEST_ID], [USER_ID], [USER_NAME], [USER_PAPER], [USER_SCORE], [MAX_MARKS]) VALUES (1039, 1000, N'shobhit', N'HTML-5', 30, 100)
INSERT [dbo].[USER_REPORT] ([TEST_ID], [USER_ID], [USER_NAME], [USER_PAPER], [USER_SCORE], [MAX_MARKS]) VALUES (1040, 1000, N'shobhit', N'2', 30, 100)
INSERT [dbo].[USER_REPORT] ([TEST_ID], [USER_ID], [USER_NAME], [USER_PAPER], [USER_SCORE], [MAX_MARKS]) VALUES (1041, 1000, N'shobhit', N'4002', 50, 100)
INSERT [dbo].[USER_REPORT] ([TEST_ID], [USER_ID], [USER_NAME], [USER_PAPER], [USER_SCORE], [MAX_MARKS]) VALUES (1042, 1000, N'shobhit', N'2', 0, 100)
INSERT [dbo].[USER_REPORT] ([TEST_ID], [USER_ID], [USER_NAME], [USER_PAPER], [USER_SCORE], [MAX_MARKS]) VALUES (1043, 1010, N'shivani', N'2', 40, 100)
INSERT [dbo].[USER_REPORT] ([TEST_ID], [USER_ID], [USER_NAME], [USER_PAPER], [USER_SCORE], [MAX_MARKS]) VALUES (1044, 1010, N'shivani', N'4002', 25, 100)
INSERT [dbo].[USER_REPORT] ([TEST_ID], [USER_ID], [USER_NAME], [USER_PAPER], [USER_SCORE], [MAX_MARKS]) VALUES (1045, 1010, N'shivani', N'4002', 25, 100)
INSERT [dbo].[USER_REPORT] ([TEST_ID], [USER_ID], [USER_NAME], [USER_PAPER], [USER_SCORE], [MAX_MARKS]) VALUES (1046, 1010, N'shivani', N'4002', 25, 100)
INSERT [dbo].[USER_REPORT] ([TEST_ID], [USER_ID], [USER_NAME], [USER_PAPER], [USER_SCORE], [MAX_MARKS]) VALUES (1047, 1010, N'shivani', N'4003', 100, 100)
INSERT [dbo].[USER_REPORT] ([TEST_ID], [USER_ID], [USER_NAME], [USER_PAPER], [USER_SCORE], [MAX_MARKS]) VALUES (1048, 1010, N'shivani', N'4002', 50, 100)
SET IDENTITY_INSERT [dbo].[USER_REPORT] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__TBL_ADMI__C07C2643EFE66CCB]    Script Date: 10/9/2019 5:22:18 AM ******/
ALTER TABLE [dbo].[TBL_ADMIN] ADD UNIQUE NONCLUSTERED 
(
	[AD_NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__TBL_STUD__8ADDC207C01352CE]    Script Date: 10/9/2019 5:22:18 AM ******/
ALTER TABLE [dbo].[TBL_STUDENT] ADD  CONSTRAINT [UQ__TBL_STUD__8ADDC207C01352CE] UNIQUE NONCLUSTERED 
(
	[S_NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Q_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_Q_DETAILS_TBL_QUESTIONS] FOREIGN KEY([QUESTION_ID])
REFERENCES [dbo].[TBL_QUESTIONS] ([QUESTION_ID])
GO
ALTER TABLE [dbo].[Q_DETAILS] CHECK CONSTRAINT [FK_Q_DETAILS_TBL_QUESTIONS]
GO
ALTER TABLE [dbo].[Q_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_Q_DETAILS_TBL_SETEXAM] FOREIGN KEY([EXAM_ID])
REFERENCES [dbo].[TBL_SETEXAM] ([EXAM_ID])
GO
ALTER TABLE [dbo].[Q_DETAILS] CHECK CONSTRAINT [FK_Q_DETAILS_TBL_SETEXAM]
GO
ALTER TABLE [dbo].[tbl_categroy]  WITH CHECK ADD FOREIGN KEY([cat_fk_adid])
REFERENCES [dbo].[TBL_ADMIN] ([AD_ID])
GO
ALTER TABLE [dbo].[TBL_QUESTIONS]  WITH CHECK ADD  CONSTRAINT [FK__TBL_QUEST__q_fk___22AA2996] FOREIGN KEY([q_fk_catid])
REFERENCES [dbo].[tbl_categroy] ([cat_id])
GO
ALTER TABLE [dbo].[TBL_QUESTIONS] CHECK CONSTRAINT [FK__TBL_QUEST__q_fk___22AA2996]
GO
