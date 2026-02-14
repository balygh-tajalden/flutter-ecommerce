import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/cart_controller.dart';
import 'package:flutter_application_1/core/class/handlingdataview.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/data/model/cartmodel.dart';
import 'package:flutter_application_1/linkapi.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    CartControllerImp controller = Get.put(CartControllerImp());
    controller.getData(); // Force refresh every time the widget builds

    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      body: GetBuilder<CartControllerImp>(
        builder: (controller) => SafeArea(
          child: Column(
            children: [
              // --- Header ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Cart (${controller.data.length.toString().padLeft(2, '0')})",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColor.black,
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: const BoxDecoration(
                        color: AppColor.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.favorite_outline, color: AppColor.black, size: 22),
                    )
                  ],
                ),
              ),

              // --- Cart Items List ---
              Expanded(
                child: HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: controller.data.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 15),
                    itemBuilder: (context, index) {
                      CartModel cartModel = controller.data[index];
                      return Dismissible(
                        key: Key(cartModel.cartId.toString()),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          controller.delete(cartModel);
                        },
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            color: const Color(0xfff8d7da), // Light pinkish red
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Icon(Icons.delete_outline, color: Color(0xffdc3545), size: 28),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              // Product Image
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  color: const Color(0xfff5f5f5),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: CachedNetworkImage(
                                    imageUrl: "${AppLink.imageItems}/${cartModel.itemImage}",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              // Details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${cartModel.itemName}",
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Size  : M", // Placeholder
                                      style: TextStyle(color: AppColor.grey.withValues(alpha: 0.6), fontSize: 12),
                                    ),
                                    Text(
                                      "Color : Yellow Gold", // Placeholder
                                      style: TextStyle(color: AppColor.grey.withValues(alpha: 0.6), fontSize: 12),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        _quantityBtn(Icons.remove, onTap: () => controller.remove(cartModel)),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Text(
                                            cartModel.cartCount.toString().padLeft(2, '0'),
                                            style: const TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        _quantityBtn(Icons.add, isPrimary: true, onTap: () => controller.add(cartModel)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              // Price
                              Text(
                                "\$${cartModel.itemPrice}",
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // --- Summary Section ---
              if (controller.data.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.black.withValues(alpha: 0.05),
                        blurRadius: 20,
                        offset: const Offset(0, -10),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      _summaryRow("Sub-total", "\$${controller.subtotal.toStringAsFixed(2)}"),
                      const SizedBox(height: 12),
                      _summaryRow("Delivery Fee", "\$${controller.deliveryFee.toStringAsFixed(2)}"),
                      const SizedBox(height: 15),
                      const Divider(),
                      const SizedBox(height: 15),
                      _summaryRow("Total Cost", "\$${controller.totalPrice.toStringAsFixed(2)}", isTotal: true),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.orange,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            elevation: 0,
                          ),
                          child: const Text(
                            "Checkout",
                            style: TextStyle(color: AppColor.white, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20), // Space for floating nav if any
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget _quantityBtn(IconData icon, {bool isPrimary = false, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isPrimary ? AppColor.orange : AppColor.white,
          border: isPrimary ? null : Border.all(color: AppColor.grey.withValues(alpha: 0.3)),
        ),
        child: Icon(
          icon,
          size: 16,
          color: isPrimary ? AppColor.white : AppColor.black,
        ),
      ),
    );
  }

  Widget _summaryRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: isTotal ? AppColor.black : AppColor.grey.withValues(alpha: 0.6),
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: AppColor.black,
            fontSize: isTotal ? 18 : 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
