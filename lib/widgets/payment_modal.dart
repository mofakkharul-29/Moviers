import 'package:flutter/material.dart';

void showPaymentBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.90,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(10, 10, 10, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 5,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Subscribe to Premium Plan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Helvetica Neue',
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Get the premium plan and get unlimited access content for watching movies.',
                  style: TextStyle(
                    color: Color.fromRGBO(194, 194, 194, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Helvetica Neue',
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 150,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color(
                                0xFF1F80FF,
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding:
                                    const EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                decoration: const BoxDecoration(
                                  color: Color(0xFF1F80FF),
                                  borderRadius:
                                      BorderRadius.only(
                                        topLeft:
                                            Radius.circular(
                                              10,
                                            ),
                                        topRight:
                                            Radius.circular(
                                              10,
                                            ),
                                      ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Annually',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight:
                                          FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                padding:
                                    const EdgeInsets.all(
                                      16,
                                    ),
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius:
                                      BorderRadius.only(
                                        bottomLeft:
                                            Radius.circular(
                                              10,
                                            ),
                                        bottomRight:
                                            Radius.circular(
                                              10,
                                            ),
                                      ),
                                ),
                                child: const Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,
                                  children: [
                                    Text(
                                      '\$79.99 / year',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight:
                                            FontWeight.w700,
                                        fontFamily:
                                            'Helvetica Neue',
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Billed annually with 14-day trial',
                                      style: TextStyle(
                                        color:
                                            Color.fromRGBO(
                                              194,
                                              194,
                                              194,
                                              1,
                                            ),
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: SizedBox(
                        height: 150,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: Colors.white24,
                            ),
                            borderRadius:
                                BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding:
                                    const EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius:
                                      const BorderRadius.only(
                                        topLeft:
                                            Radius.circular(
                                              10,
                                            ),
                                        topRight:
                                            Radius.circular(
                                              10,
                                            ),
                                      ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Monthly',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight:
                                          FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                padding:
                                    const EdgeInsets.all(
                                      16,
                                    ),
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius:
                                      BorderRadius.only(
                                        bottomLeft:
                                            Radius.circular(
                                              10,
                                            ),
                                        bottomRight:
                                            Radius.circular(
                                              10,
                                            ),
                                      ),
                                ),
                                child: const Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,
                                  children: [
                                    Text(
                                      '\$7.99 / monthly',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight:
                                            FontWeight.w700,
                                        fontFamily:
                                            'Helvetica Neue',
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Billed monthly',
                                      style: TextStyle(
                                        color:
                                            Color.fromRGBO(
                                              194,
                                              194,
                                              194,
                                              1,
                                            ),
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ListTile(
                  leading: const Icon(
                    Icons.play_circle_rounded,
                    color: Color.fromRGBO(158, 158, 158, 1),
                  ),
                  title: const Text(
                    'Unlimited Content',
                    style: TextStyle(
                      color: Color.fromRGBO(
                        255,
                        255,
                        255,
                        1,
                      ),
                      fontFamily: 'Helvetica Neue',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: const Text(
                    'Watching unlimited content in one app',
                    style: TextStyle(
                      color: Color.fromRGBO(
                        158,
                        158,
                        158,
                        1,
                      ),
                      fontSize: 12,
                      fontFamily: 'Helvetica Neue',
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.groups_2,
                    color: Color.fromRGBO(158, 158, 158, 1),
                  ),
                  title: const Text(
                    'Sharing Accounts',
                    style: TextStyle(
                      color: Color.fromRGBO(
                        255,
                        255,
                        255,
                        1,
                      ),
                      fontSize: 14,
                      fontFamily: 'Helvetica Neue',
                    ),
                  ),
                  subtitle: const Text(
                    'Enjoy access with your beloved friends or family',
                    style: TextStyle(
                      color: Color.fromRGBO(
                        158,
                        158,
                        158,
                        1,
                      ),
                      fontSize: 12,
                      fontFamily: 'Helvetica Neue',
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.star_purple500_outlined,
                    color: Color.fromRGBO(158, 158, 158, 1),
                  ),
                  title: const Text(
                    'FHD Quality',
                    style: TextStyle(
                      color: Color.fromRGBO(
                        255,
                        255,
                        255,
                        1,
                      ),
                      fontFamily: 'Helvetica Neue',
                      fontSize: 14,
                    ),
                  ),
                  subtitle: const Text(
                    'The best service for you with best quality player',
                    style: TextStyle(
                      color: Color.fromRGBO(
                        158,
                        158,
                        158,
                        1,
                      ),
                      fontSize: 12,
                      fontFamily: 'Helvetica Neue',
                    ),
                  ),
                ),
                const SizedBox(height: 120),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(
                        0xFF1F80FF,
                      ),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          4,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Start your 14-days trial',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(
                          255,
                          255,
                          255,
                          1,
                        ),
                        fontFamily: 'Helvetica Neue',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
