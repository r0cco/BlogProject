﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DapperDawgData;
using DapperDawgModels;

namespace DapperDawgBll
{
    public class BlogPostOperations
    {
        private readonly BlogPostRepository _repo;

        public BlogPostOperations()
        {
            _repo = new BlogPostRepository();
        }

        public List<BlogPost> GetBlogPosts()
        {
            var posts = _repo.GetAllBlogPosts();

            foreach (var post in posts)
            {
                post.CategoryName = _repo.GetCategoryByPostID(post.PostID);
                // checks to see if PublishDate is after today, or if ExpirationDate is before today 
                if (post.PublishDate.HasValue && DateTime.Compare(post.PublishDate.Value, DateTime.Now) > 0)
                {
                    posts.Remove(post);
                    break;
                }
                if (post.ExpirationDate.HasValue && DateTime.Compare(post.ExpirationDate.Value, DateTime.Now) < 0)
                {
                    posts.Remove(post);
                    break;
                }
            }
            foreach (var post in posts)
            {
                post.CategoryName = _repo.GetCategoryByPostID(post.PostID);
                var tagList = _repo.GetTagsByPostID(post.PostID);
                post.BlogTags = new List<Tag>();
                if (tagList != null)
                {
                    foreach (var tag in tagList)
                    {
                        post.BlogTags.Add(tag);
                    }
                }
            }
            return posts;
        }

        public List<BlogPost> GetPostsWithStatus0()
        {
            var posts = _repo.GetBlogPostsByPR();

            foreach (var post in posts)
            {
                post.CategoryName = _repo.GetCategoryByPostID(post.PostID);
                post.BlogTags = new List<Tag>();
                var tagList = _repo.GetTagsByPostID(post.PostID);
                if (tagList != null)
                {
                    foreach (var tag in tagList)
                    {
                        post.BlogTags.Add(tag);
                    }
                }
            }
            return posts;
        }

        public List<BlogPost> GetPostsWithStatus2()
        {
            var posts = _repo.GetDeletedBlogPosts();

            foreach (var post in posts)
            {
                post.CategoryName = _repo.GetCategoryByPostID(post.PostID);
                post.BlogTags = new List<Tag>();
                var tagList = _repo.GetTagsByPostID(post.PostID);
                if (tagList != null)
                {
                    foreach (var tag in tagList)
                    {
                        post.BlogTags.Add(tag);
                    }
                }
            }
            return posts;
        } 

        public List<Category> GetAllCategories()
        {
            return _repo.GetAllCategories();
        }

        public List<StaticPage> GetAllStaticPages()
        {
            return _repo.GetAllStaticPages();
        }

        public StaticPage GetStaticPageByID(int id)
        {
            return _repo.GetStaticPageByID(id);
        }

        public List<Tag> GetAllTags()
        {
            return _repo.GetAllTags();
        } 

        public void AddNewBlogPost(BlogPost newBlogPost)
        {
            newBlogPost.PostDate = DateTime.Now;
            newBlogPost.PostStatus = 1;
            if (newBlogPost.PublishDate == null)
            {
                newBlogPost.PublishDate = DateTime.Now;
            }
            var postId = _repo.AddNewBlogPost(newBlogPost);
            var tagList = _repo.GetAllTags();

            if (newBlogPost.tags != null)
            {
                foreach (var tag in newBlogPost.tags)
                {
                    var tagExists = false;
                    var tagId = 0;

                    foreach (var tag2 in tagList)
                    {
                        if (tag2.TagName == tag)
                        {
                            // Tag already exists, bool set to true
                            tagExists = true;
                            tagId = tag2.TagID;
                            break;
                        }
                    }
                    // Check bool to see if tag exists
                    if (tagExists)
                    {
                        // Tag exists on table, only need to add it to PostTags to tie it to a post
                        _repo.AddNewPostTag(tagId, postId);
                    }
                    else
                    {
                        // Tag doesn't exist on table, needs to be created, then tied to a post on PostTags table
                        tagId = _repo.AddNewTag(tag);
                        _repo.AddNewPostTag(tagId, postId);
                    }
                }
            }
        }

        public void PRAddNewBlogPost(BlogPost newBlogPost)
        {
            newBlogPost.PostDate = DateTime.Now;
            newBlogPost.PostStatus = 0;
            if (newBlogPost.PublishDate == null)
            {
                newBlogPost.PublishDate = DateTime.Now;
            }
            var postId = _repo.AddNewBlogPost(newBlogPost);
            var tagList = _repo.GetAllTags();

            if (newBlogPost.tags != null)
            {
                foreach (var tag in newBlogPost.tags)
                {
                    var tagExists = false;
                    var tagId = 0;

                    foreach (var tag2 in tagList)
                    {
                        if (tag2.TagName == tag)
                        {
                            // Tag already exists, bool set to true
                            tagExists = true;
                            tagId = tag2.TagID;
                            break;
                        }
                    }
                    // Check bool to see if tag exists
                    if (tagExists)
                    {
                        // Tag exists on table, only need to add it to PostTags to tie it to a post
                        _repo.AddNewPostTag(tagId, postId);
                    }
                    else
                    {
                        // Tag doesn't exist on table, needs to be created, then tied to a post on PostTags table
                        tagId = _repo.AddNewTag(tag);
                        _repo.AddNewPostTag(tagId, postId);
                    }
                }
            }
        }

        public void AddCategory(Category newCategory)
        {
            _repo.AddNewCategory(newCategory);
        }

        public List<BlogPost> GetPostsByCategoryID(int id)
        {
            var posts = _repo.GetBlogPostsByCategory(id);

            foreach (var post in posts)
            {
                post.CategoryName = _repo.GetCategoryByPostID(post.PostID);
                post.BlogTags = new List<Tag>();
                var tagList = _repo.GetTagsByPostID(post.PostID);
                if (tagList != null)
                {
                    foreach (var tag in tagList)
                    {
                        post.BlogTags.Add(tag);
                    }
                }
            }
            // copied loop to remove timed out posts
            foreach (var post in posts)
            {
                post.CategoryName = _repo.GetCategoryByPostID(post.PostID);
                // checks to see if PublishDate is after today, or if ExpirationDate is before today 
                if (post.PublishDate.HasValue && DateTime.Compare(post.PublishDate.Value, DateTime.Now) > 0)
                {
                    posts.Remove(post);
                    break;
                }
                if (post.ExpirationDate.HasValue && DateTime.Compare(post.ExpirationDate.Value, DateTime.Now) < 0)
                {
                    posts.Remove(post);
                    break;
                }
            }

            return posts;
        }

        public List<BlogPost> GetPostsByTagID(int id)
        {
            var posts = _repo.GetBlogPostsByTag(id);

            foreach (var post in posts)
            {
                post.CategoryName = _repo.GetCategoryByPostID(post.PostID);
                post.BlogTags = new List<Tag>();
                var tagList = _repo.GetTagsByPostID(post.PostID);
                if (tagList != null)
                {
                    foreach (var tag in tagList)
                    {
                        post.BlogTags.Add(tag);
                    }
                }
            }
            // copied loop to remove timed out posts
            foreach (var post in posts)
            {
                post.CategoryName = _repo.GetCategoryByPostID(post.PostID);
                // checks to see if PublishDate is after today, or if ExpirationDate is before today 
                if (post.PublishDate.HasValue && DateTime.Compare(post.PublishDate.Value, DateTime.Now) > 0)
                {
                    posts.Remove(post);
                    break;
                }
                if (post.ExpirationDate.HasValue && DateTime.Compare(post.ExpirationDate.Value, DateTime.Now) < 0)
                {
                    posts.Remove(post);
                    break;
                }
            }

            return posts;
        }

        public List<BlogPost> GetPostByID(int id)
        {
            var post = _repo.GetBlogPostByID(id);
            post.CategoryName = _repo.GetCategoryByPostID(post.PostID);
            post.BlogTags = new List<Tag>();
            post.UserComments = new List<UserComment>();
            var comments = _repo.GetUserCommentsByPostID(post.PostID);

            var tagList = _repo.GetTagsByPostID(post.PostID);
            if (tagList != null)
            {
                foreach (var tag in tagList)
                {
                    post.BlogTags.Add(tag);
                }
            }

            if (comments != null)
            {
                foreach (var comment in comments)
                {
                    post.UserComments.Add(comment);
                }
            }
            var postListCarrier = new List<BlogPost>();
            postListCarrier.Add(post);
            return postListCarrier;
        }

        public void EditStaticPage(StaticPage pageToEdit)
        {
            _repo.EditStaticPage(pageToEdit);
        }

        public void EditPost(BlogPost postToEdit)
        {
            _repo.EditBlogPost(postToEdit);
            var tagList = _repo.GetAllTags();

            // dissociate tags from old post (in cross table)
            _repo.RemovePostFromPostTagsTable(postToEdit.PostID);

            // add new tags to tags table, then set up new poststags table association (just like in add post)
            if (postToEdit.tags != null)
            {
                foreach (var tag in postToEdit.tags)
                {
                    var tagExists = false;
                    var tagId = 0;

                    foreach (var tag2 in tagList)
                    {
                        if (tag2.TagName == tag)
                        {
                            // Tag already exists, bool set to true
                            tagExists = true;
                            tagId = tag2.TagID;
                            break;
                        }
                    }
                    // Check bool to see if tag exists
                    if (tagExists)
                    {
                        // Tag exists on table, only need to add it to PostTags to tie it to a post
                        _repo.AddNewPostTag(tagId, postToEdit.PostID);
                    }
                    else
                    {
                        // Tag doesn't exist on table, needs to be created, then tied to a post on PostTags table
                        tagId = _repo.AddNewTag(tag);
                        _repo.AddNewPostTag(tagId, postToEdit.PostID);
                    }
                }
            }
        }

        public void SetPostTo1(int postId)
        {
            _repo.ApproveBlogPost(postId);
        }

        public void DeletePost(int id)
        {
            _repo.DeleteBlogPost(id);
        }

        public void AddNewUserComment(UserComment newUserComment, int postID)
        {
            _repo.AddUserComment(newUserComment, postID);
        }

    }
}
