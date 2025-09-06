import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sport_profile_208415/models/models.dart';
import 'package:sport_profile_208415/providers/providers.dart';
import 'package:sport_profile_208415/utils/utils.dart';
import 'package:sport_profile_208415/widgets/widgets.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  late final ProfilesProvider _profilesProvider;

  final ImagePicker _picker = ImagePicker();

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final teamNameController = TextEditingController();

  Profile _profile = Profile.empty();

  @override
  void initState() {
    super.initState();
    _profilesProvider = context.read<ProfilesProvider>();
    _profile = _profilesProvider.profile;
    nameController.text = _profile.name ?? '';
    ageController.text = _profile.age?.toString() ?? '';
    heightController.text = _profile.height?.toString() ?? '';
    weightController.text = _profile.weight?.toString() ?? '';
    teamNameController.text = _profile.teamName ?? '';

    nameController.addListener(() => setState(() {}));
    ageController.addListener(() => setState(() {}));
    heightController.addListener(() => setState(() {}));
    weightController.addListener(() => setState(() {}));
    teamNameController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 56.h),
            child: Column(
              children: [
                SafeArea(bottom: false, child: ProfileCard(profile: _profile)),
                SizedBox(height: 16.h),
                CustomImagePicker(
                  text: "Upload profile image",
                  onTap: _pickProfileImage,
                ),
                SizedBox(height: 16.h),
                CustomTextField1(
                  title: 'Name',
                  icon: 'assets/png/profile.png',
                  maxLength: 12,
                  controller: nameController,
                ),
                SizedBox(height: 16.h),
                PositionsDropdown(
                  value: _profile.pos ?? '',
                  onChanged: (value) => setState(() => _profile.pos = value),
                ),
                SizedBox(height: 16.h),
                CustomTextField1(
                  title: 'Age',
                  icon: 'assets/png/calendar.png',
                  maxLength: 3,
                  formatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$')),
                  ],
                  controller: ageController,
                ),
                SizedBox(height: 16.h),
                CustomSelector2(
                  title: 'Nationality',
                  icon: 'assets/png/flag.png',
                  value: 'USA',
                ),
                SizedBox(height: 16.h),
                CustomTextField2(
                  title: 'Height',
                  icon: 'assets/png/profile.png',
                  suffix: 'cm',
                  controller: heightController,
                ),
                SizedBox(height: 16.h),
                CustomTextField2(
                  title: 'Weight',
                  icon: 'assets/png/profile.png',
                  suffix: 'kg',
                  controller: weightController,
                ),
                SizedBox(height: 24.h),
                Container(
                  width: 358.w,
                  height: 1.sp,
                  color: Colors.white.withValues(alpha: 0.2),
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  width: 358.w,
                  child: Text("Team Parameters", style: AppTextStyles.ts20_600),
                ),
                SizedBox(height: 16.h),
                CustomImagePicker(
                  text: "Upload team logo",
                  onTap: _pickTeamLogo,
                ),
                SizedBox(height: 16.h),
                CustomTextField1(
                  title: 'Team Name',
                  icon: 'assets/png/profile.png',
                  maxLength: 12,
                  controller: teamNameController,
                ),
                SizedBox(height: 40.h),
                LabeledButton2(
                  title: 'Save',
                  textColor: Colors.white,
                  onTap: () async {
                    final name = nameController.text.trim();
                    final age = int.tryParse(ageController.text.trim());
                    final height = int.tryParse(heightController.text.trim());
                    final weight = int.tryParse(weightController.text.trim());
                    final teamName = teamNameController.text.trim();

                    if (name.isEmpty ||
                        age == null ||
                        height == null ||
                        weight == null ||
                        teamName.isEmpty) {
                      return;
                    }

                    await _profilesProvider.updateProfile(_profile);
                    context.pop();
                  },
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 16.h,
          left: 16.w,
          right: 16.w,
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  iconPath: 'assets/png/back.png',
                  onTap: context.pop,
                ),
                Text(
                  "Edit Profile",
                  style: AppTextStyles.ts14_600.copyWith(color: Colors.white),
                ),
                SizedBox(width: 40.r),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _pickProfileImage() async {
    final file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) setState(() => _profile.image = file.path);
  }

  void _pickTeamLogo() async {
    final file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) setState(() => _profile.teamLogo = file.path);
  }
}
