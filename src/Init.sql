/*
	Use this script to add some initial data to SPA Cats. The script uses Identity Insert, so it needs to
	be run before any other data is added.

	The data references images which can be found in "\InitData\Images" and needs to be copied to "\src\Cofoundry.Samples.SPASite\App_Data\Files\Images"
*/

/* ENTITY DEFINITIONS */

if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFCEV'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFCEV', N'Custom Entity Version')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFCEM'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFCEM', N'Custom Entity Version Page Module')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFDOC'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFDOC', N'Document')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFIMG'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFIMG', N'Image')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFPGE'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFPGE', N'Page')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFPTL'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFPTL', N'Page Template')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFPGM'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFPGM', N'Page Version Module')

if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFRWR'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFRWR', N'Rewrite Rule')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFROL'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFCEV', N'Role')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFSET'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFSET', N'Settings')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFUSR'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFUSR', N'User (Cofoundry)')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFCUR'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFCUR', N'User (Current)')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFUSN'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFUSN', N'User (Non Cofoundry)')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFDIR'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFDIR', N'Web Directory')

/* CUSTOM ENTITY DEFINITIONS */
 
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'SPABRD'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'SPABRD', N'Breed')
if (not exists (select * from Cofoundry.[CustomEntityDefinition] where [CustomEntityDefinitionCode] = 'SPABRD'))
	INSERT [Cofoundry].[CustomEntityDefinition] ([CustomEntityDefinitionCode], [ForceUrlSlugUniqueness], [IsOrderable], [HasLocale]) VALUES (N'SPABRD', 1, 0, 0)

if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'SPACAT'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'SPACAT', N'Cat')
if (not exists (select * from Cofoundry.[CustomEntityDefinition] where [CustomEntityDefinitionCode] = 'SPACAT'))
	INSERT [Cofoundry].[CustomEntityDefinition] ([CustomEntityDefinitionCode], [ForceUrlSlugUniqueness], [IsOrderable], [HasLocale]) VALUES (N'SPACAT', 0, 0, 0)

if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'SPAFET'))
	INSERT [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'SPAFET', N'Feature')
if (not exists (select * from Cofoundry.[CustomEntityDefinition] where [CustomEntityDefinitionCode] = 'SPAFET'))
	INSERT [Cofoundry].[CustomEntityDefinition] ([CustomEntityDefinitionCode], [ForceUrlSlugUniqueness], [IsOrderable], [HasLocale]) VALUES (N'SPAFET', 1, 0, 0)
GO

/* IMAGES ASSETS */

SET IDENTITY_INSERT [Cofoundry].[ImageAsset] ON 
GO

INSERT [Cofoundry].[ImageAsset] ([ImageAssetId], [FileName], [Title], [WidthInPixels], [HeightInPixels], [FileExtension], [FileSizeInBytes], [CreateDate], [CreatorId], [UpdateDate], [ImageCropAnchorLocationId], [UpdaterId], [FileUpdateDate], [FileNameOnDisk], [VerificationToken]) VALUES (6, N'toby', N'Toby', 1024, 768, N'jpg', 95750, CAST(N'2018-01-31T15:50:26.1524000' AS DateTime2), 1, CAST(N'2018-01-31T15:50:26.1524000' AS DateTime2), NULL, 1, CAST(N'2018-01-31T15:50:26.1524000' AS DateTime2), '6', '82AE1B')
INSERT [Cofoundry].[ImageAsset] ([ImageAssetId], [FileName], [Title], [WidthInPixels], [HeightInPixels], [FileExtension], [FileSizeInBytes], [CreateDate], [CreatorId], [UpdateDate], [ImageCropAnchorLocationId], [UpdaterId], [FileUpdateDate], [FileNameOnDisk], [VerificationToken]) VALUES (7, N'bashful-toby', N'Bashful toby', 960, 635, N'jpg', 126823, CAST(N'2018-01-31T15:50:36.1617000' AS DateTime2), 1, CAST(N'2018-01-31T15:50:36.1617000' AS DateTime2), NULL, 1, CAST(N'2018-01-31T15:50:36.1617000' AS DateTime2), '7', '245F22')
INSERT [Cofoundry].[ImageAsset] ([ImageAssetId], [FileName], [Title], [WidthInPixels], [HeightInPixels], [FileExtension], [FileSizeInBytes], [CreateDate], [CreatorId], [UpdateDate], [ImageCropAnchorLocationId], [UpdaterId], [FileUpdateDate], [FileNameOnDisk], [VerificationToken]) VALUES (8, N'captain-fluffy', N'Captain fluffy', 1024, 634, N'jpg', 360755, CAST(N'2018-01-31T15:52:20.6093000' AS DateTime2), 1, CAST(N'2018-01-31T15:52:20.6093000' AS DateTime2), NULL, 1, CAST(N'2018-01-31T15:52:20.6093000' AS DateTime2), '8', '0FD9BB')
INSERT [Cofoundry].[ImageAsset] ([ImageAssetId], [FileName], [Title], [WidthInPixels], [HeightInPixels], [FileExtension], [FileSizeInBytes], [CreateDate], [CreatorId], [UpdateDate], [ImageCropAnchorLocationId], [UpdaterId], [FileUpdateDate], [FileNameOnDisk], [VerificationToken]) VALUES (9, N'captain-fluffy-sleeping', N'Captain fluffy sleeping', 5230, 3487, N'jpg', 7487668, CAST(N'2018-01-31T15:52:31.1004000' AS DateTime2), 1, CAST(N'2018-01-31T15:52:31.1004000' AS DateTime2), NULL, 1, CAST(N'2018-01-31T15:52:31.1004000' AS DateTime2), '9', '05C4FB')
INSERT [Cofoundry].[ImageAsset] ([ImageAssetId], [FileName], [Title], [WidthInPixels], [HeightInPixels], [FileExtension], [FileSizeInBytes], [CreateDate], [CreatorId], [UpdateDate], [ImageCropAnchorLocationId], [UpdaterId], [FileUpdateDate], [FileNameOnDisk], [VerificationToken]) VALUES (10, N'mr-tiddles-close-up', N'Mr tiddles close up', 2000, 1500, N'jpg', 1503262, CAST(N'2018-01-31T15:55:47.1729000' AS DateTime2), 1, CAST(N'2018-01-31T15:55:47.1729000' AS DateTime2), NULL, 1, CAST(N'2018-01-31T15:55:47.1729000' AS DateTime2), '10', '5AF06B')
INSERT [Cofoundry].[ImageAsset] ([ImageAssetId], [FileName], [Title], [WidthInPixels], [HeightInPixels], [FileExtension], [FileSizeInBytes], [CreateDate], [CreatorId], [UpdateDate], [ImageCropAnchorLocationId], [UpdaterId], [FileUpdateDate], [FileNameOnDisk], [VerificationToken]) VALUES (11, N'mr-tiddles', N'Mr tiddles', 1120, 2000, N'jpg', 973156, CAST(N'2018-01-31T15:55:58.7145000' AS DateTime2), 1, CAST(N'2018-01-31T15:55:58.7145000' AS DateTime2), NULL, 1, CAST(N'2018-01-31T15:55:58.7145000' AS DateTime2), '11', '68DEB1')
INSERT [Cofoundry].[ImageAsset] ([ImageAssetId], [FileName], [Title], [WidthInPixels], [HeightInPixels], [FileExtension], [FileSizeInBytes], [CreateDate], [CreatorId], [UpdateDate], [ImageCropAnchorLocationId], [UpdaterId], [FileUpdateDate], [FileNameOnDisk], [VerificationToken]) VALUES (12, N'sally-awake', N'Sally awake', 1280, 959, N'jpg', 366940, CAST(N'2018-01-31T15:57:31.6506000' AS DateTime2), 1, CAST(N'2018-01-31T15:57:31.6506000' AS DateTime2), NULL, 1, CAST(N'2018-01-31T15:57:31.6506000' AS DateTime2), '12', 'A8A136')
INSERT [Cofoundry].[ImageAsset] ([ImageAssetId], [FileName], [Title], [WidthInPixels], [HeightInPixels], [FileExtension], [FileSizeInBytes], [CreateDate], [CreatorId], [UpdateDate], [ImageCropAnchorLocationId], [UpdaterId], [FileUpdateDate], [FileNameOnDisk], [VerificationToken]) VALUES (13, N'sally', N'Sally', 1920, 1440, N'jpg', 688001, CAST(N'2018-01-31T15:57:39.5906000' AS DateTime2), 1, CAST(N'2018-01-31T15:57:39.5906000' AS DateTime2), NULL, 1, CAST(N'2018-01-31T15:57:39.5906000' AS DateTime2), '13', 'B2qs8f')
INSERT [Cofoundry].[ImageAsset] ([ImageAssetId], [FileName], [Title], [WidthInPixels], [HeightInPixels], [FileExtension], [FileSizeInBytes], [CreateDate], [CreatorId], [UpdateDate], [ImageCropAnchorLocationId], [UpdaterId], [FileUpdateDate], [FileNameOnDisk], [VerificationToken]) VALUES (14, N'pablo', N'Pablo', 1024, 678, N'jpg', 255453, CAST(N'2018-01-31T15:59:08.7159000' AS DateTime2), 1, CAST(N'2018-01-31T15:59:08.7159000' AS DateTime2), NULL, 1, CAST(N'2018-01-31T15:59:08.7159000' AS DateTime2), '14', 'oC3cyJ')
INSERT [Cofoundry].[ImageAsset] ([ImageAssetId], [FileName], [Title], [WidthInPixels], [HeightInPixels], [FileExtension], [FileSizeInBytes], [CreateDate], [CreatorId], [UpdateDate], [ImageCropAnchorLocationId], [UpdaterId], [FileUpdateDate], [FileNameOnDisk], [VerificationToken]) VALUES (15, N'pablo-asleep', N'Pablo asleep', 1024, 678, N'jpg', 177972, CAST(N'2018-01-31T15:59:18.1380000' AS DateTime2), 1, CAST(N'2018-01-31T15:59:18.1380000' AS DateTime2), NULL, 1, CAST(N'2018-01-31T15:59:18.1380000' AS DateTime2), '15', '8Rsl5n')
INSERT [Cofoundry].[ImageAsset] ([ImageAssetId], [FileName], [Title], [WidthInPixels], [HeightInPixels], [FileExtension], [FileSizeInBytes], [CreateDate], [CreatorId], [UpdateDate], [ImageCropAnchorLocationId], [UpdaterId], [FileUpdateDate], [FileNameOnDisk], [VerificationToken]) VALUES (16, N'mercedes', N'Mercedes', 1920, 1280, N'jpg', 250539, CAST(N'2018-01-31T16:00:56.8606000' AS DateTime2), 1, CAST(N'2018-01-31T16:00:56.8606000' AS DateTime2), NULL, 1, CAST(N'2018-01-31T16:00:56.8606000' AS DateTime2), '16', 'nK0i0O')
INSERT [Cofoundry].[ImageAsset] ([ImageAssetId], [FileName], [Title], [WidthInPixels], [HeightInPixels], [FileExtension], [FileSizeInBytes], [CreateDate], [CreatorId], [UpdateDate], [ImageCropAnchorLocationId], [UpdaterId], [FileUpdateDate], [FileNameOnDisk], [VerificationToken]) VALUES (17, N'mercedes-profile', N'Mercedes profile', 5184, 2912, N'jpg', 8225880, CAST(N'2018-01-31T16:01:06.7655000' AS DateTime2), 1, CAST(N'2018-01-31T16:01:06.7655000' AS DateTime2), NULL, 1, CAST(N'2018-01-31T16:01:06.7655000' AS DateTime2), '17', '87ae9e')
INSERT [Cofoundry].[ImageAsset] ([ImageAssetId], [FileName], [Title], [WidthInPixels], [HeightInPixels], [FileExtension], [FileSizeInBytes], [CreateDate], [CreatorId], [UpdateDate], [ImageCropAnchorLocationId], [UpdaterId], [FileUpdateDate], [FileNameOnDisk], [VerificationToken]) VALUES (18, N'tigra', N'Tigra', 1024, 768, N'jpg', 349670, CAST(N'2018-01-31T16:02:36.7338000' AS DateTime2), 1, CAST(N'2018-01-31T16:02:36.7338000' AS DateTime2), NULL, 1, CAST(N'2018-01-31T16:02:36.7338000' AS DateTime2), '18', 'd1i2jj')
INSERT [Cofoundry].[ImageAsset] ([ImageAssetId], [FileName], [Title], [WidthInPixels], [HeightInPixels], [FileExtension], [FileSizeInBytes], [CreateDate], [CreatorId], [UpdateDate], [ImageCropAnchorLocationId], [UpdaterId], [FileUpdateDate], [FileNameOnDisk], [VerificationToken]) VALUES (19, N'tigra-posing', N'Tigra posing', 1600, 1200, N'jpg', 1036502, CAST(N'2018-01-31T16:02:45.0821000' AS DateTime2), 1, CAST(N'2018-01-31T16:02:45.0821000' AS DateTime2), NULL, 1, CAST(N'2018-01-31T16:02:45.0821000' AS DateTime2), '19', 'qpk012')
INSERT [Cofoundry].[ImageAsset] ([ImageAssetId], [FileName], [Title], [WidthInPixels], [HeightInPixels], [FileExtension], [FileSizeInBytes], [CreateDate], [CreatorId], [UpdateDate], [ImageCropAnchorLocationId], [UpdaterId], [FileUpdateDate], [FileNameOnDisk], [VerificationToken]) VALUES (20, N'morris', N'Morris', 1920, 1280, N'jpg', 547576, CAST(N'2018-01-31T16:04:11.7204000' AS DateTime2), 1, CAST(N'2018-01-31T16:04:11.7204000' AS DateTime2), NULL, 1, CAST(N'2018-01-31T16:04:11.7204000' AS DateTime2), '20', 'isqiqp')
INSERT [Cofoundry].[ImageAsset] ([ImageAssetId], [FileName], [Title], [WidthInPixels], [HeightInPixels], [FileExtension], [FileSizeInBytes], [CreateDate], [CreatorId], [UpdateDate], [ImageCropAnchorLocationId], [UpdaterId], [FileUpdateDate], [FileNameOnDisk], [VerificationToken]) VALUES (21, N'morris-relaxing', N'Morris relaxing', 1920, 1280, N'jpg', 480940, CAST(N'2018-01-31T16:04:21.0347000' AS DateTime2), 1, CAST(N'2018-01-31T16:04:21.0347000' AS DateTime2), NULL, 1, CAST(N'2018-01-31T16:04:21.0347000' AS DateTime2), '21', '1sp039')

GO
SET IDENTITY_INSERT [Cofoundry].[ImageAsset] OFF
GO

/* CUSTOM ENTITIES */

SET IDENTITY_INSERT [Cofoundry].[CustomEntity] ON 
GO

INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], PublishStatusCode, PublishDate, [Ordering]) VALUES (1, N'SPABRD', NULL, N'british-short-hair', CAST(N'2018-01-31T15:32:39.4578000' AS DateTime2), 1, 'P', CAST(N'2018-01-31T15:32:39.4578000' AS DateTime2), NULL)
INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], PublishStatusCode, PublishDate, [Ordering]) VALUES (2, N'SPABRD', NULL, N'persian', CAST(N'2018-01-31T15:32:46.0512000' AS DateTime2), 1, 'P', CAST(N'2018-01-31T15:32:46.0512000' AS DateTime2), NULL)
INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], PublishStatusCode, PublishDate, [Ordering]) VALUES (3, N'SPABRD', NULL, N'siamese', CAST(N'2018-01-31T15:32:55.2977000' AS DateTime2), 1, 'P', CAST(N'2018-01-31T15:32:55.2977000' AS DateTime2), NULL)
INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], PublishStatusCode, PublishDate, [Ordering]) VALUES (4, N'SPABRD', NULL, N'maine-coon', CAST(N'2018-01-31T15:33:07.5513000' AS DateTime2), 1, 'P', CAST(N'2018-01-31T15:33:07.5513000' AS DateTime2), NULL)
INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], PublishStatusCode, PublishDate, [Ordering]) VALUES (5, N'SPABRD', NULL, N'bengal', CAST(N'2018-01-31T15:33:16.3957000' AS DateTime2), 1, 'P', CAST(N'2018-01-31T15:33:16.3957000' AS DateTime2), NULL)
INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], PublishStatusCode, PublishDate, [Ordering]) VALUES (6, N'SPABRD', NULL, N'burmese', CAST(N'2018-01-31T15:33:33.3041000' AS DateTime2), 1, 'P', CAST(N'2018-01-31T15:33:33.3041000' AS DateTime2), NULL)
INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], PublishStatusCode, PublishDate, [Ordering]) VALUES (7, N'SPABRD', NULL, N'scottish-fold', CAST(N'2018-01-31T15:33:48.5555000' AS DateTime2), 1, 'P', CAST(N'2018-01-31T15:33:48.5555000' AS DateTime2), NULL)
INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], PublishStatusCode, PublishDate, [Ordering]) VALUES (8, N'SPAFET', NULL, N'fluffy', CAST(N'2018-01-31T15:34:06.0901000' AS DateTime2), 1, 'P', CAST(N'2018-01-31T15:34:06.0901000' AS DateTime2), NULL)
INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], PublishStatusCode, PublishDate, [Ordering]) VALUES (9, N'SPAFET', NULL, N'short-hair', CAST(N'2018-01-31T15:34:13.3748000' AS DateTime2), 1, 'P', CAST(N'2018-01-31T15:34:13.3748000' AS DateTime2), NULL)
INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], PublishStatusCode, PublishDate, [Ordering]) VALUES (10, N'SPAFET', NULL, N'long-hair', CAST(N'2018-01-31T15:34:20.8121000' AS DateTime2), 1, 'P', CAST(N'2018-01-31T15:34:20.8121000' AS DateTime2), NULL)
INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], PublishStatusCode, PublishDate, [Ordering]) VALUES (11, N'SPAFET', NULL, N'wise', CAST(N'2018-01-31T15:34:26.8442000' AS DateTime2), 1, 'P', CAST(N'2018-01-31T15:34:26.8442000' AS DateTime2), NULL)
INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], PublishStatusCode, PublishDate, [Ordering]) VALUES (12, N'SPAFET', NULL, N'bashful', CAST(N'2018-01-31T15:34:34.2911000' AS DateTime2), 1, 'P', CAST(N'2018-01-31T15:34:34.2911000' AS DateTime2), NULL)
INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], PublishStatusCode, PublishDate, [Ordering]) VALUES (13, N'SPAFET', NULL, N'cunning', CAST(N'2018-01-31T15:34:40.6317000' AS DateTime2), 1, 'P', CAST(N'2018-01-31T15:34:40.6317000' AS DateTime2), NULL)
INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], PublishStatusCode, PublishDate, [Ordering]) VALUES (14, N'SPAFET', NULL, N'silly', CAST(N'2018-01-31T15:35:07.1484000' AS DateTime2), 1, 'P', CAST(N'2018-01-31T15:35:07.1484000' AS DateTime2), NULL)
INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], PublishStatusCode, PublishDate, [Ordering]) VALUES (15, N'SPAFET', NULL, N'well-groomed', CAST(N'2018-01-31T15:35:42.3773000' AS DateTime2), 1, 'P', CAST(N'2018-01-31T15:35:42.3773000' AS DateTime2), NULL)
INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], PublishStatusCode, PublishDate, [Ordering]) VALUES (16, N'SPAFET', NULL, N'regal', CAST(N'2018-01-31T15:35:54.2227000' AS DateTime2), 1, 'P', CAST(N'2018-01-31T15:35:54.2227000' AS DateTime2), NULL)
INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], PublishStatusCode, PublishDate, [Ordering]) VALUES (17, N'SPAFET', NULL, N'quick', CAST(N'2018-01-31T15:36:03.3354000' AS DateTime2), 1, 'P', CAST(N'2018-01-31T15:36:03.3354000' AS DateTime2), NULL)
INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], PublishStatusCode, PublishDate, [Ordering]) VALUES (18, N'SPAFET', NULL, N'adventurous', CAST(N'2018-01-31T15:36:17.3566000' AS DateTime2), 1, 'P', CAST(N'2018-01-31T15:36:17.3566000' AS DateTime2), NULL)
INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], PublishStatusCode, PublishDate, [Ordering]) VALUES (19, N'SPAFET', NULL, N'shy', CAST(N'2018-01-31T15:36:39.9222000' AS DateTime2), 1, 'P', CAST(N'2018-01-31T15:36:39.9222000' AS DateTime2), NULL)
INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], PublishStatusCode, PublishDate, [Ordering]) VALUES (20, N'SPAFET', NULL, N'proud', CAST(N'2018-01-31T15:36:53.4680000' AS DateTime2), 1, 'P', CAST(N'2018-01-31T15:36:53.4680000' AS DateTime2), NULL)
INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], PublishStatusCode, PublishDate, [Ordering]) VALUES (21, N'SPACAT', NULL, N'toby', CAST(N'2018-01-31T15:51:22.6698000' AS DateTime2), 1, 'P', CAST(N'2018-01-31T15:51:22.6698000' AS DateTime2), NULL)
INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], PublishStatusCode, PublishDate, [Ordering]) VALUES (22, N'SPACAT', NULL, N'captain-fluffy', CAST(N'2018-01-31T15:53:13.1226000' AS DateTime2), 1, 'P', CAST(N'2018-01-31T15:53:13.1226000' AS DateTime2), NULL)
INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], PublishStatusCode, PublishDate, [Ordering]) VALUES (23, N'SPACAT', NULL, N'mr-tiddles', CAST(N'2018-01-31T15:56:06.9258000' AS DateTime2), 1, 'P', CAST(N'2018-01-31T15:56:06.9258000' AS DateTime2), NULL)
INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], PublishStatusCode, PublishDate, [Ordering]) VALUES (24, N'SPACAT', NULL, N'sally', CAST(N'2018-01-31T15:57:50.5204000' AS DateTime2), 1, 'P', CAST(N'2018-01-31T15:57:50.5204000' AS DateTime2), NULL)
INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], PublishStatusCode, PublishDate, [Ordering]) VALUES (25, N'SPACAT', NULL, N'pablo', CAST(N'2018-01-31T15:59:26.2968000' AS DateTime2), 1, 'P', CAST(N'2018-01-31T15:59:26.2968000' AS DateTime2), NULL)
INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], PublishStatusCode, PublishDate, [Ordering]) VALUES (26, N'SPACAT', NULL, N'mercedes', CAST(N'2018-01-31T16:01:14.9689000' AS DateTime2), 1, 'P', CAST(N'2018-01-31T16:01:14.9689000' AS DateTime2), NULL)
INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], PublishStatusCode, PublishDate, [Ordering]) VALUES (27, N'SPACAT', NULL, N'tigra', CAST(N'2018-01-31T16:02:52.9080000' AS DateTime2), 1, 'P', CAST(N'2018-01-31T16:02:52.9080000' AS DateTime2), NULL)
INSERT [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], PublishStatusCode, PublishDate, [Ordering]) VALUES (28, N'SPACAT', NULL, N'morris', CAST(N'2018-01-31T16:04:30.9990000' AS DateTime2), 1, 'P', CAST(N'2018-01-31T16:04:30.9990000' AS DateTime2), NULL)
GO

SET IDENTITY_INSERT [Cofoundry].[CustomEntity] OFF
GO

/* CUSTOM ENTITIES VERSIONS */

SET IDENTITY_INSERT [Cofoundry].[CustomEntityVersion] ON 
GO

INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId], DisplayVersion) VALUES (1, 1, N'British Short Hair', 4, N'{}', CAST(N'2018-01-31T15:32:39.4578000' AS DateTime2), 1, 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId], DisplayVersion) VALUES (2, 2, N'Persian', 4, N'{}', CAST(N'2018-01-31T15:32:46.0512000' AS DateTime2), 1, 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId], DisplayVersion) VALUES (3, 3, N'Siamese', 4, N'{}', CAST(N'2018-01-31T15:32:55.2977000' AS DateTime2), 1, 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId], DisplayVersion) VALUES (4, 4, N'Maine Coon', 4, N'{}', CAST(N'2018-01-31T15:33:07.5513000' AS DateTime2), 1, 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId], DisplayVersion) VALUES (5, 5, N'Bengal', 4, N'{}', CAST(N'2018-01-31T15:33:16.3957000' AS DateTime2), 1, 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId], DisplayVersion) VALUES (6, 6, N'Burmese', 4, N'{}', CAST(N'2018-01-31T15:33:33.3041000' AS DateTime2), 1, 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId], DisplayVersion) VALUES (7, 7, N'Scottish Fold', 4, N'{}', CAST(N'2018-01-31T15:33:48.5555000' AS DateTime2), 1, 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId], DisplayVersion) VALUES (8, 8, N'Fluffy', 4, N'{}', CAST(N'2018-01-31T15:34:06.0901000' AS DateTime2), 1, 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId], DisplayVersion) VALUES (9, 9, N'Short Hair', 4, N'{}', CAST(N'2018-01-31T15:34:13.3748000' AS DateTime2), 1, 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId], DisplayVersion) VALUES (10, 10, N'Long Hair', 4, N'{}', CAST(N'2018-01-31T15:34:20.8121000' AS DateTime2), 1, 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId], DisplayVersion) VALUES (11, 11, N'Wise', 4, N'{}', CAST(N'2018-01-31T15:34:26.8442000' AS DateTime2), 1, 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId], DisplayVersion) VALUES (12, 12, N'Bashful', 4, N'{}', CAST(N'2018-01-31T15:34:34.2911000' AS DateTime2), 1, 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId], DisplayVersion) VALUES (13, 13, N'Cunning', 4, N'{}', CAST(N'2018-01-31T15:34:40.6317000' AS DateTime2), 1, 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId], DisplayVersion) VALUES (14, 14, N'Silly', 4, N'{}', CAST(N'2018-01-31T15:35:07.1484000' AS DateTime2), 1, 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId], DisplayVersion) VALUES (15, 15, N'Well Groomed', 4, N'{}', CAST(N'2018-01-31T15:35:42.3773000' AS DateTime2), 1, 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId], DisplayVersion) VALUES (16, 16, N'Regal', 4, N'{}', CAST(N'2018-01-31T15:35:54.2227000' AS DateTime2), 1, 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId], DisplayVersion) VALUES (17, 17, N'Quick', 4, N'{}', CAST(N'2018-01-31T15:36:03.3354000' AS DateTime2), 1, 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId], DisplayVersion) VALUES (18, 18, N'Adventurous', 4, N'{}', CAST(N'2018-01-31T15:36:17.3566000' AS DateTime2), 1, 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId], DisplayVersion) VALUES (19, 19, N'Shy', 4, N'{}', CAST(N'2018-01-31T15:36:39.9222000' AS DateTime2), 1, 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId], DisplayVersion) VALUES (20, 20, N'Proud', 4, N'{}', CAST(N'2018-01-31T15:36:53.4680000' AS DateTime2), 1, 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId], DisplayVersion) VALUES (21, 21, N'Toby', 4, N'{"description":"With a look so intense, Toby is sure to capture your heart","breedId":1,"featureIds":[12,14,9,15],"imageAssetIds":[7,6]}', CAST(N'2018-01-31T15:51:22.6698000' AS DateTime2), 1, 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId], DisplayVersion) VALUES (22, 22, N'Captain Fluffy', 4, N'{"description":"Captain Fluffy is a persian cat that loves mice and cake","breedId":2,"featureIds":[19,10,15,11],"imageAssetIds":[8,9]}', CAST(N'2018-01-31T15:53:13.1226000' AS DateTime2), 1, 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId], DisplayVersion) VALUES (23, 23, N'Mr Tiddles', 4, N'{"description":"Quick & cunning, Mr Tiddles always brings home the mice after a hard days adventuring","breedId":1,"featureIds":[18,13,17,9],"imageAssetIds":[10,11]}', CAST(N'2018-01-31T15:56:06.9258000' AS DateTime2), 1, 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId], DisplayVersion) VALUES (24, 24, N'Sally', 4, N'{"description":"Looks can be deceiving, Sally is the tough cat of the street and always asserts authority","breedId":4,"featureIds":[12,14,8,10],"imageAssetIds":[12,13]}', CAST(N'2018-01-31T15:57:50.5204000' AS DateTime2), 1, 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId], DisplayVersion) VALUES (25, 25, N'Pablo', 4, N'{"description":"The bad boy of the litter, Pablo is not a nice guy","breedId":6,"featureIds":[13,20,17,16],"imageAssetIds":[14,15]}', CAST(N'2018-01-31T15:59:26.2968000' AS DateTime2), 1, 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId], DisplayVersion) VALUES (26, 26, N'Mercedes', 4, N'{"description":"Cute and needy, Mercedes is useless without her owner","breedId":7,"featureIds":[18,12,8,16],"imageAssetIds":[16,17]}', CAST(N'2018-01-31T16:01:14.9689000' AS DateTime2), 1, 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId], DisplayVersion) VALUES (27, 27, N'Tigra', 4, N'{"description":"She might be shy, but Tigra has a look that is hard to match","breedId":5,"featureIds":[12,13,19,11],"imageAssetIds":[18,19]}', CAST(N'2018-01-31T16:02:52.9080000' AS DateTime2), 1, 1)
INSERT [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId], DisplayVersion) VALUES (28, 28, N'Morris', 4, N'{"description":"Morris is always looking for an adventure","breedId":2,"featureIds":[18,13,9,11],"imageAssetIds":[20,21]}', CAST(N'2018-01-31T16:04:30.9990000' AS DateTime2), 1, 1)
GO

SET IDENTITY_INSERT [Cofoundry].[CustomEntityVersion] OFF
GO


/* UNSTRUCTURED DATA DEPENDENCIES */

INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 21, N'SPABRD', 1, 1)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 21, N'SPAFET', 9, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 21, N'SPAFET', 12, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 21, N'SPAFET', 14, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 21, N'SPAFET', 15, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 22, N'SPABRD', 2, 1)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 22, N'SPAFET', 10, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 22, N'SPAFET', 11, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 22, N'SPAFET', 15, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 22, N'SPAFET', 19, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 23, N'SPABRD', 1, 1)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 23, N'SPAFET', 9, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 23, N'SPAFET', 13, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 23, N'SPAFET', 17, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 23, N'SPAFET', 18, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 24, N'SPABRD', 4, 1)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 24, N'SPAFET', 8, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 24, N'SPAFET', 10, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 24, N'SPAFET', 12, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 24, N'SPAFET', 14, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 25, N'SPABRD', 6, 1)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 25, N'SPAFET', 13, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 25, N'SPAFET', 16, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 25, N'SPAFET', 17, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 25, N'SPAFET', 20, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 26, N'SPABRD', 7, 1)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 26, N'SPAFET', 8, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 26, N'SPAFET', 12, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 26, N'SPAFET', 16, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 26, N'SPAFET', 18, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 27, N'SPABRD', 5, 1)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 27, N'SPAFET', 11, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 27, N'SPAFET', 12, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 27, N'SPAFET', 13, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 27, N'SPAFET', 19, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 28, N'SPABRD', 2, 1)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 28, N'SPAFET', 9, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 28, N'SPAFET', 11, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 28, N'SPAFET', 13, 2)
INSERT [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 28, N'SPAFET', 18, 2)
GO

/* Update versioning lookup tables */

exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 1
exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 2
exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 3
exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 4
exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 5
exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 6
exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 7
exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 8
exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 9
exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 10
exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 11
exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 12
exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 13
exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 14
exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 15
exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 16
exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 17
exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 18
exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 19
exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 20
exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 21
exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 22
exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 23
exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 24
exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 25
exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 26
exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 27
exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 28