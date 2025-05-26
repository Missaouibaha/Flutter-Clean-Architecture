import 'package:clean_arch_app/core/helper/spacing.dart';
import 'package:clean_arch_app/core/theming/app_assets.dart';
import 'package:clean_arch_app/core/theming/app_dimensions.dart';
import 'package:clean_arch_app/core/theming/colors.dart';
import 'package:clean_arch_app/core/theming/styles.dart';
import 'package:clean_arch_app/core/utils/app_consts.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/features/search/domain/entities/dotor_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class InfoPagerView extends StatefulWidget {
  final DoctorEntity? doctor;

  const InfoPagerView({super.key, this.doctor});

  @override
  State<InfoPagerView> createState() => _InfoPagerViewState();
}

class _InfoPagerViewState extends State<InfoPagerView>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _pageController.jumpToPage(_tabController.index);
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: AppStrings.aboutTitle),
              Tab(text: AppStrings.locationTitle),
              Tab(text: AppStrings.reviewsTitle),
            ],
            controller: _tabController,
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                _tabController.animateTo(index);
              },
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  color: ColorManager.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(AppDimensions.height_30),
                      Text(
                        AppStrings.aboutMe,
                        style: TextStyles.font14BlueRegular,
                      ),
                      verticalSpace(AppDimensions.height_10),
                      Text(
                        AppStrings.aboutMeDescription
                            .replaceAll(
                              '{'
                              '${AppStrings.name}'
                              '}',
                              widget.doctor?.name ?? '',
                            )
                            .replaceAll(
                              '{'
                              '${AppStrings.docSpeciality}'
                              '}',
                              widget.doctor?.specialization?.name ?? '',
                            ),
                        style: TextStyles.font13BlackMedium,
                      ),
                      verticalSpace(AppDimensions.height_15),
                      Text(
                        AppStrings.workingTime,
                        style: TextStyles.font14BlueRegular,
                      ),
                      verticalSpace(AppDimensions.height_15),
                      Text(
                        AppStrings.workingTimes,
                        style: TextStyles.font13BlackMedium,
                      ),
                      verticalSpace(AppDimensions.height_15),
                      Text(
                        AppStrings.appointmentPrice,
                        style: TextStyles.font14BlueRegular,
                      ),
                      verticalSpace(AppDimensions.height_15),
                      Text(
                        " ${widget.doctor?.appointPrice}",
                        style: TextStyles.font13BlackMedium,
                      ),
                    ],
                  ),
                ),
                Container(
                  color: ColorManager.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(AppDimensions.height_30),
                      Text(
                        AppStrings.practicePlace,
                        style: TextStyles.font14BlueRegular,
                      ),
                      verticalSpace(AppDimensions.height_15),
                      Text(
                        "${widget.doctor?.address} ",
                        style: TextStyles.font13BlackMedium,
                      ),
                      verticalSpace(AppDimensions.height_15),
                      Text(
                        AppStrings.locationMap,
                        style: TextStyles.font14BlueRegular,
                      ),
                      Flexible(
                        child: FlutterMap(
                          options: MapOptions(
                            initialCenter: AppConsts.fakeDocLocationLatLng,
                            initialZoom: AppConsts.mapInitialZoom,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate: AppConsts.urlTemplate,
                              userAgentPackageName:
                                  AppConsts.userAgentPackageName,
                            ),
                            MarkerLayer(
                              markers: [
                                Marker(
                                  width: AppDimensions.width_60,
                                  height: AppDimensions.height_60,
                                  point: AppConsts.fakeDocLocationLatLng,
                                  child: Image.asset(AppAssets.iconMarker),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: ColorManager.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(AppDimensions.height_30),
                      Text(
                        AppStrings.reviewsTitle,
                        style: TextStyles.font14BlueRegular,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
