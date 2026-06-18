import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({super.key});

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  bool _isLoading = true;

  final String _studentName = "Mike Rack";
  final String _studentId = "STU-2025-0042";
  final String _department = "Computer Science & Engineering";

  @override
  void initState() {
    super.initState();
    _simulateLoading();
  }

  void _simulateLoading() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  Widget _buildShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: 320.w,
        height: 380.h,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      width: 320.w,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 28.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(150),
            blurRadius: 12,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 42.r,
                backgroundColor: const Color(0xFFD6D9F5),
                child: Icon(
                  Icons.person,
                  size: 48.sp,
                  color: const Color(0xFF3F51B5),
                ),
              ),
              Positioned(
                top: -6.h,
                right: -10.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    "New",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            _studentName,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C2C54),
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          Text(
            "ID:$_studentId",
            style: TextStyle(
              fontSize: 13.sp,
              color: Colors.grey.shade600,
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            _department,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.sp,
              color: Colors.grey.shade500,
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          SizedBox(
            width: double.infinity,
            height: 44.h,
            child: ElevatedButton.icon(
              onPressed: _showStudentDetailsDialog,
              icon: Icon(
                Icons.info_outline,
                size: 18.sp,
              ),
              label: Text(
                "View Details",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3F51B5),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          SizedBox(
            width: double.infinity,
            height: 44.h,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.check_circle_outline,
                  size: 18.sp, color: Colors.green.shade700),
              label: Text(
                "Marrk Present",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.green.shade700),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.green.shade700),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _showStudentDetailsDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.all(20.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.school,
                          color: const Color(0xFF3F51B5), size: 22.sp),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        "Student Details",
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF2C2C54),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      _detailRow(Icons.person, "Name", _studentName),
                      SizedBox(
                        height: 10.h,
                      ),
                      _detailRow(Icons.badge, "ID", _studentId),
                      SizedBox(
                        height: 10.h,
                      ),
                      _detailRow(Icons.apartment, "Dept", _department),
                      SizedBox(
                        height: 18.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            "Close",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF3F51B5),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget _detailRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16.sp, color: Colors.grey.shade600),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 13.5.sp,
                color: const Color(0xFF2C2C54),
              ),
              children: [
                TextSpan(
                  text: '$label: ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Profile"),
        backgroundColor: const Color(0xFF3F51B5),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: _isLoading ? _buildShimmerLoading() : _buildProfileCard(),
      ),
    );
  }
}
