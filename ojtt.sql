create database project_ojt;
use project_ojt;
create table Users(
    userId int auto_increment primary key,
    userName nvarchar(50),
    passwords nvarchar(255),
    created date,
    email nvarchar(255),
    userAvatar text,
    phone nvarchar(255),
    userStatus bit


);
create table Exhibition(
    exhibitionId int auto_increment primary key,
    exhibitionTitle nvarchar(255),
    exhibitionDescription nvarchar(255),
    exhibitionCreatedDate date,
    exhibitionExpiredDate date,
    exhibitionStatus bit
);
create table Tags(
    tagId int auto_increment primary key ,
    tagName nvarchar(225),
    tagStatus nvarchar(225)
);
create table Product(
    productId int auto_increment primary key ,
    productName nvarchar(255),
    productAuthor nvarchar(255),
    productPrice float,
    productImage text,
    productDecription text,
    productCreateDate date,
    userId int,
    exhibitionId int,
    foreign key (userId) references Users(userId),
    foreign key (exhibitionId) references Exhibition(exhibitionID)
);
create table Product_Tag(
    productId int,
    tagId int,
    foreign key (productId) references Product(productId),
    foreign key (tagId) references Tags(tagId)
);
create table Historys(
    historyId int auto_increment primary key ,
    historyDateTime datetime,
    productId int,
    userId int ,
    foreign key (productId) references Product(productId),
    foreign key (userId) references Users(userId)
);
create table Blog(
    blogId int auto_increment primary key ,
    blogTitle nvarchar(255),
    blogContent nvarchar(255),
    blogImage text,
    blogCreateDate date,
    userCreatedId int,
    userAuthorizedId int,
    foreign key (userCreatedId) references Users(userId),
    foreign key (userAuthorizedId) references Users(userId)
);
create table Blog_Tag(
    productId int,
    tagId int ,
    foreign key (productId) references Product(productId),
    foreign key (tagId) references Tags(tagId)

);
create table Likes(
    userId int,
    blogId int,
    foreign key (userId) references Users(userId),
    foreign key (blogId) references Blog(blogId)
);
create table Comments(
    commentId int auto_increment primary key ,
    commentDate date,
    commentContent text,
    commentStatus bit,
    userId int,
    blogId int,
    foreign key (userId) references Users(userId),
        foreign key (blogId) references Blog(blogId)

);
create table Followings(
    followId int auto_increment primary key ,
    followerUserId int,
    followingUserId int ,
    followStatus bit,
    foreign key (followerUserId) references Users(userId),
    foreign key (followingUserId) references Users(userId)
);
create table Exhibition_Tag(
    exhibitionId int ,
    tagId int ,
    foreign key (exhibitionId) references Exhibition(exhibitionId),
    foreign key (tagId) references Tags(tagId)

);
Insert Into Roles(RoleName)
values ('ROLE_ADMIN'),('ROLE_MODERATOR'),('ROLE_USER')

