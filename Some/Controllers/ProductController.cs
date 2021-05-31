﻿using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CourseProject.Data.Repositories;
using CourseProject.Models;
using CourseProject.Models.DataModels;
using CourseProject.Models.ViewModels;

namespace CourseProject.Controllers
{
    public class ProductController : Controller
    {
        private readonly IRepository<Product> _productRepository;
        private readonly IRepository<Category> _categoryRepository;

        public ProductController(IRepository<Product> productRepository, IRepository<Category> categoryRepository)
        {
            _productRepository = productRepository;
            _categoryRepository = categoryRepository;
        }

        public async Task<IActionResult> Index()
        {
            var products = await _productRepository.GetAll();
            return View(products);
        }


        public async Task<IActionResult> Details(int id)
        {
            var product = await _productRepository.GetById(id);
            return View(product);
        }


        public async Task<IActionResult> Create()
        {
            return View(new ProductCreateViewModel() {Categories = (await _categoryRepository.GetAll()).ToList()});
        }

        [HttpPost]
        public async Task<IActionResult> Create(Product product)
        {
            await _productRepository.Create(product);
            return RedirectToAction("Index");
        }

        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var product = await _productRepository.GetById(id);
            var categories = await _categoryRepository.GetAll();
            return View(new ProductUpdateViewModel(){Product = product,Categories = categories.ToList()});
        }

        [HttpPost]
        public async Task<IActionResult> Edit(ProductUpdateViewModel model)
        {
            await _productRepository.Update(model.Product, x => x.Id, model.Product.Id);
            return RedirectToAction("Details", model.Product);
        }
    }
}