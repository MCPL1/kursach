﻿using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using CourseProject.Attributes;
using Microsoft.AspNetCore.Cors;

namespace CourseProject.Models.DataModels
{
    [TableName("Product")]
    public class Product : Entity
    {
        [StringLength(8, ErrorMessage = "Login length can't be more than 8.")]
        [DisplayName("Name")]
        public string Name { get; set; }

        [DataType(DataType.MultilineText)]
        [DisplayName("Description")]
        public string Description { get; set; }

        [DataType(DataType.Currency)]
        [DisplayName("Price")]
        public decimal Price { get; set; }

        [ForeignKey("category_id")] public Category Category { get; set; }

        [ForeignKey("manufacturer_id")] public Manufacturer Manufacturer { get; set; }

        public Product()
        {
            Manufacturer = new Manufacturer();
            Category = new Category();
        }

    }
}