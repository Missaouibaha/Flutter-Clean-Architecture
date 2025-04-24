import 'package:clean_arch_app/core/di/dependency_injection.dart';
import 'package:clean_arch_app/features/appointment/appointment_screen.dart';
import 'package:clean_arch_app/features/appointment/cubit/appointment_cubit.dart';
import 'package:clean_arch_app/features/chat/chat_screen.dart';
import 'package:clean_arch_app/features/chat/cubit/chat_cubit.dart';
import 'package:clean_arch_app/features/home/home_screen.dart';
import 'package:clean_arch_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:clean_arch_app/features/main/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:clean_arch_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:clean_arch_app/features/profile/profile_screen.dart';
import 'package:clean_arch_app/features/search/cubit/search_cubit.dart';
import 'package:clean_arch_app/features/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    BlocProvider(create: (context) => getIt<HomeCubit>(), child: HomeScreen()),

    BlocProvider(create: (context) => getIt<ChatCubit>(), child: ChatScreen()),

    BlocProvider(
      create: (context) => getIt<SearchCubit>(),
      child: SearchScreen(),
    ),

    BlocProvider(
      create: (context) => getIt<AppointmentCubit>(),
      child: AppointmentScreen(),
    ),

    BlocProvider(
      create: (context) => getIt<ProfileCubit>(),
      child: ProfileScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
