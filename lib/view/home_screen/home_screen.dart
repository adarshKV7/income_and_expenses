// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:income_and_expenses/controller/home_screen_controller.dart';
import 'package:income_and_expenses/core/constants/color_constants.dart';
import 'package:income_and_expenses/view/home_screen/income_expense_screen/income_expense_screen.dart';

import 'package:income_and_expenses/view/home_screen/widgets/custom_container_tab.dart.dart';
import 'package:income_and_expenses/view/home_screen/widgets/custom_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<HomeScreenController>(context, listen: false).getData();
    Provider.of<HomeScreenController>(context, listen: false).totalIncomeSum();
    Provider.of<HomeScreenController>(context, listen: false).totalExpenseSum();
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.primaryWhite,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              decoration: BoxDecoration(
                  color: ColorConstants.primaryBlack,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(""),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          Text(
                            "Hello Adarsh",
                            style: TextStyle(
                                color: ColorConstants.primaryWhite,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "Welcome Back!",
                            style: TextStyle(
                                color: ColorConstants.primaryWhite,
                                fontWeight: FontWeight.normal,
                                fontSize: 10),
                          )
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.menu,
                        color: ColorConstants.primaryWhite,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Balance",
                    style: TextStyle(color: ColorConstants.primaryWhite),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Consumer<HomeScreenController>(
                    builder: (context, value, child) => Text(
                      "\$${value.incomeAmount ?? -value.expenseAmount ?? ""}",
                      style: TextStyle(
                          color: ColorConstants.primaryWhite,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      IncomeExpenseScreen(initialTabIndex: 0),
                                ));
                          },
                          child: Consumer<HomeScreenController>(
                            builder: (context, value, child) =>
                                CustomContainerTab(
                                    title: "Income",
                                    amount: "\$${value.incomeAmount}",
                                    color: ColorConstants.primaryGreen),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Consumer<HomeScreenController>(
                          builder: (context, value, child) => InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        IncomeExpenseScreen(initialTabIndex: 1),
                                  ));
                            },
                            child: CustomContainerTab(
                                title: "Expense",
                                amount: "\$${value.expenseAmount}",
                                color: ColorConstants.primaryRed),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Recent Transcations",
                      style: TextStyle(
                          color: ColorConstants.primaryBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 350,
                      child: Consumer<HomeScreenController>(
                        builder: (context, value, child) => ListView.separated(
                            itemBuilder: (context, index) => CustomListviewCard(
                                category: HomeScreenController
                                    .lstIncomeExpenseModelData[index].category,
                                amount: HomeScreenController
                                    .lstIncomeExpenseModelData[index].amount,
                                note: HomeScreenController
                                    .lstIncomeExpenseModelData[index].note,
                                date: HomeScreenController
                                    .lstIncomeExpenseModelData[index].date,
                                isIncome: HomeScreenController
                                    .lstIncomeExpenseModelData[index].isIncome),
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 15,
                                ),
                            itemCount: HomeScreenController
                                .lstIncomeExpenseModelData.length),
                      ),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
