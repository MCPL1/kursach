﻿using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using CourseProject.Attributes;
using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace CourseProject.Models.DataModels
{
    [TableName("Order")]
    public class Order : Entity
    {
        [ForeignKey("user_Id")] public User User { get; set; }

        [ForeignKey("status_id")] public Status Status { get; set; }

        [Required]
        [DisplayName("Дата виконання")]
        [DataType(DataType.DateTime)]
        public DateTime CheckoutDate { get; set; }

        [ForeignKeyToMany("Item")] public List<OrderItem> Items { get; set; }

        [Required]
        [DisplayName("Адреса доставки")] 
        public string Address { get; set; }

        public DateTime Date { get; set; }


        public Order()
        {
            User = new User();
            Items = new List<OrderItem>();
            Status = new Status();
        }
    }
}