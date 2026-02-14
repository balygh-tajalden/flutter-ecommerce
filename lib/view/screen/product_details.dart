import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/productdetails_controller.dart';
import 'package:flutter_application_1/core/class/handlingdataview.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/linkapi.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControllerImp());
    return Scaffold(
      backgroundColor: AppColor.white,
      body: GetBuilder<ProductDetailsControllerImp>(
          builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: SafeArea(
                  child: Column(
                    children: [
                      // Custom Top Bar
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _circleIconBtn(Icons.arrow_back_ios_new,
                                onTap: () => Get.back()),
                            const Text(
                              "Detail Product",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            _circleIconBtn(Icons.shopping_cart_outlined),
                          ],
                        ),
                      ),

                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Product Image Section
                              Container(
                                margin: const EdgeInsets.all(30),
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: AppColor.backgroundcolor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Column(
                                  children: [
                                    Hero(
                                      tag: "${controller.itemsModel.itemId}",
                                      child: Image.network(
                                        "${AppLink.imageItems}/${controller.itemsModel.itemImage}",
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${controller.itemsModel.itemName}",
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "${controller.itemsModel.itemNameAr}",
                                      style: const TextStyle(color: AppColor.grey),
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Colors & Size",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            _quantityAction(Icons.remove,
                                                onTap: () {
                                              controller.remove();
                                            }),
                                            Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(horizontal: 10),
                                              child: Text(
                                                  "${controller.countitems}",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            _quantityAction(Icons.add,
                                                isPrimary: true, onTap: () {
                                              controller.add();
                                            }),
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          _colorDot(Colors.blue.shade200,
                                              isSelected: true),
                                          _colorDot(AppColor.primaryColor),
                                          _colorDot(AppColor.orange),
                                          _colorDot(AppColor.black),
                                          const SizedBox(width: 20),
                                          _sizeBox("S"),
                                          _sizeBox("M", isSelected: true),
                                          _sizeBox("L"),
                                          _sizeBox("XL"),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      "${controller.itemsModel.itemDesc}",
                                      style: const TextStyle(
                                          color: AppColor.grey, height: 1.5),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero),
                                      child: const Text("Read more",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: AppColor.black)),
                                    ),
                                    const SizedBox(height: 15),
                                    const Row(
                                      children: [
                                        // Avatar stack placeholder
                                        Icon(Icons.people_outline,
                                            color: AppColor.grey),
                                        SizedBox(width: 8),
                                        Text("475+ People Pinned this",
                                            style:
                                                TextStyle(color: AppColor.grey)),
                                      ],
                                    ),
                                    const SizedBox(height: 30),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Bottom Add to Cart Section
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.black.withValues(alpha: 0.05),
                              blurRadius: 10,
                              offset: const Offset(0, -5),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("\$${controller.itemsModel.itemPrice}",
                                    style: const TextStyle(
                                        color: AppColor.grey,
                                        decoration:
                                            TextDecoration.lineThrough)),
                                Text(
                                    "\$${controller.itemsModel.itemPrice! - (controller.itemsModel.itemPrice! * controller.itemsModel.itemDiscount! / 100)}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(width: 30),
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  controller.add();
                                },
                                icon: const Icon(Icons.shopping_cart_outlined,
                                    color: AppColor.white),
                                label: const Text("Add to card",
                                    style: TextStyle(
                                        color: AppColor.white, fontSize: 16)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.orange,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
    );
  }

  Widget _circleIconBtn(IconData icon, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColor.grey),
        ),
        child: Icon(icon, size: 20, color: AppColor.black),
      ),
    );
  }

  Widget _quantityAction(IconData icon,
      {bool isPrimary = false, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isPrimary ? AppColor.primaryColor : AppColor.white,
          border: Border.all(
              color: isPrimary ? AppColor.primaryColor : AppColor.grey),
        ),
        child:
            Icon(icon, size: 16, color: isPrimary ? AppColor.white : AppColor.black),
      ),
    );
  }

  Widget _colorDot(Color color, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: isSelected ? Border.all(color: AppColor.primaryColor, width: 2) : null,
      ),
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }

  Widget _sizeBox(String size, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? AppColor.orange : AppColor.white,
        shape: BoxShape.circle,
        border: Border.all(color: isSelected ? AppColor.orange : AppColor.grey),
      ),
      child: Text(
        size,
        style: TextStyle(
          color: isSelected ? AppColor.white : AppColor.black,
          fontSize: 12,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
