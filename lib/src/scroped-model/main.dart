import 'package:mobile_timesheet_makara_venge/src/scroped-model/leave_absence_connected.dart';
import 'package:mobile_timesheet_makara_venge/src/scroped-model/login_connected.dart';
import 'package:mobile_timesheet_makara_venge/src/scroped-model/project_connected.dart';
import 'package:mobile_timesheet_makara_venge/src/scroped-model/time_sheets_connected.dart';
import 'package:mobile_timesheet_makara_venge/src/scroped-model/user_profile_connected.dart';
import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model
    with
        ConnectedLogin,
        LoginModel,
        ConnectedProject,
        ProjectModel,
        ConnectedUserProfile,
        UserProfileModel,
        ConnectedTimeSheets,
        ConnectedLeaveAbsence,
        LeaveAbsenceModel,
        TimeSheetsModel {}
