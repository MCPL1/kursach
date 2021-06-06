﻿using System.ComponentModel.DataAnnotations.Schema;
using CourseProject.Attributes;

namespace CourseProject.Models.DataModels

{
    [TableName("User")]
    public class User:Entity
    {
        public string UserName { get; set; }
        public string Surname { get; set; }

        public string Name  { get; set; }
        public string PasswordHash { get; set; }

        [ForeignKey("role_Id")] 
        public Role Role { get; set; }
        public string PhoneNumber { get; set; }

        public User()
        {
            Role = new Role();
        }
    }
}