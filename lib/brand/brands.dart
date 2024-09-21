import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/svg_icons.dart';
import '../constants/text.dart';

class MyBrands extends StatelessWidget {
  const MyBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 42,
                    height: 158,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          constraints: const BoxConstraints(
                            minWidth: 42,
                            minHeight: 64,
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(249, 249, 249, 1),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                width: 42,
                                height: 48,
                                child: SvgPicture.string(SvgIcons.nike),
                              ),
                              const MyText(
                                text: 'Nike',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(
                            minWidth: 42,
                            minHeight: 64,
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(249, 249, 249, 1),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                width: 48,
                                height: 48,
                                child: SvgPicture.string(SvgIcons.adidas),
                              ),
                              const MyText(
                                text: 'Adidas',
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 42,
                    height: 158,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          constraints: const BoxConstraints(
                            minWidth: 42,
                            minHeight: 64,
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(249, 249, 249, 1),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                width: 42,
                                height: 48,
                                child: SvgPicture.string(SvgIcons.gucci),
                              ),
                              const MyText(
                                text: 'Gucci',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(
                            minWidth: 42,
                            minHeight: 64,
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(249, 249, 249, 1),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                width: 48,
                                height: 48,
                                child: SvgPicture.string(SvgIcons.reebok),
                              ),
                              const MyText(
                                text: 'Reebok',
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 62,
                    height: 158,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          constraints: const BoxConstraints(
                            minWidth: 42,
                            minHeight: 64,
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(249, 249, 249, 1),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                width: 42,
                                height: 48,
                                child: SvgPicture.string(SvgIcons.jordan),
                              ),
                              const MyText(
                                text: 'Jordan',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(
                            minWidth: 42,
                            minHeight: 64,
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(249, 249, 249, 1),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                width: 48,
                                height: 48,
                                child: SvgPicture.string(SvgIcons.newBalance),
                              ),
                              const MyText(
                                text: 'New Balance',
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 42,
                    height: 158,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          constraints: const BoxConstraints(
                            minWidth: 42,
                            minHeight: 64,
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(249, 249, 249, 1),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                width: 42,
                                height: 48,
                                child: SvgPicture.string(SvgIcons.balenciaga),
                              ),
                              const MyText(
                                text: 'Balenciaga',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(
                            minWidth: 42,
                            minHeight: 64,
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(249, 249, 249, 1),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                width: 48,
                                height: 48,
                                child: const MyText(
                                  text: 'View all',
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
             ;
  }
}