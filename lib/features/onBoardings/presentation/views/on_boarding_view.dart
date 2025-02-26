import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';
import 'package:manfaz/core/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  String _selectedLanguage = 'en';

  final List<OnBoardingPage> _pages = [
    OnBoardingPage(
      image: 'assets/images/onBoarding/Online Groceries-pana.png',
      title: 'Welcome to Manfaz',
      description: 'Your one-stop solution for all service needs',
    ),
    OnBoardingPage(
      image: 'assets/images/onBoarding/Natural Resource Depletion-amico.png',
      title: 'Choose Your Language',
      description: 'Select your preferred language to get started',
      isLanguagePage: true,
    ),
    OnBoardingPage(
      image: 'assets/images/onBoarding/Take Away-pana.png',
      title: 'Get Started',
      description: 'Find and book the services you need with ease',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        color: AppColors.primary,
        ),
        child: Stack(
          children: [
            Positioned(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return _buildPage(_pages[index]);
                },
              ),
            ),
            Positioned(
              bottom: 10.h,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: _pages.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Colors.white,
                      dotColor: Colors.white.withOpacity(0.4),
                      dotHeight: 8.h,
                      dotWidth: 8.w,
                      spacing: 8.w,
                      expansionFactor: 3,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (_currentPage > 0)
                          TextButton(
                            onPressed: () {
                              _pageController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 12.h,
                              ),
                            ),
                            child: Text(
                              'Previous',
                              style: AppStyles.subtitle2.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        else
                          const SizedBox.shrink(),
                        ElevatedButton(
                          onPressed: () {
                            if (_currentPage < _pages.length - 1) {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              Navigator.pushNamed(context, Routes.loginView);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              horizontal: 32.w,
                              vertical: 16.h,
                            ),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: Text(
                            _currentPage < _pages.length - 1 ? 'Next' : 'Get Started',
                            style: AppStyles.subtitle2.copyWith(
                              color: AppColors.primaryDark,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(OnBoardingPage page) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child:
             ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.asset(
                page.image,
                // height: 500.h,
                // fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 30.h),
          Text(
            page.title,
            style: AppStyles.header1.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.h),
          Text(
            page.description,
            style: AppStyles.subtitle1.copyWith(
              color: Colors.white.withOpacity(0.9),
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          if (page.isLanguagePage) ...[
            SizedBox(height: 10.h),
            _buildLanguageSelector(),
          ],
        ],
      ),
    );
  }

  Widget _buildLanguageSelector() {
    return Column(
      children: [
        _buildLanguageOption('English', 'en'),
        SizedBox(height: 16.h),
        _buildLanguageOption('العربية', 'ar'),
      ],
    );
  }

  Widget _buildLanguageOption(String label, String value) {
    final isSelected = _selectedLanguage == value;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedLanguage = value;
            context.setLocale(Locale(value));
          });
        },
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 16.h,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Colors.white : Colors.white.withOpacity(0.3),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12.r),
            color: isSelected ? Colors.white.withOpacity(0.2) : Colors.transparent,
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: AppStyles.subtitle1.copyWith(
                  color: Colors.white,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
              if (isSelected)
                Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: 24.r,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnBoardingPage {
  final String image;
  final String title;
  final String description;
  final bool isLanguagePage;

  OnBoardingPage({
    required this.image,
    required this.title,
    required this.description,
    this.isLanguagePage = false,
  });
}
