Attribute VB_Name = "Tbussio"
'//------------------------------------------------------------------------
'//
'//      Termi-BUS SIO Serial Communication Library
'//
'//          DLL.Name: TMBSCOM.DLL
'//
'//      Termi-BUS SIO API Declaration for Visual Basic
'//
'//          FileName: TBUSSIO.BAS
'//
'//      Copyright(C) 1999,2003 Dyadic Systems Co.,Ltd.
'//
'//      Ver.4.10  14th/Apr./2004      By M.Tsurumi
'//
'//------------------------------------------------------------------------
Option Explicit

'//----------------------------------------------------------------
'//        �������u���b�N�]���R�}���h�̃p�����[�^�f�[�^�^
'//----------------------------------------------------------------
Type COMPACK
    address(31) As Long      '�I�t�Z�b�g�l�̔z��( -1�͏������X�L�b�v )
    data(31) As Long         '�f�[�^�̔z��
End Type

'//----------------------------------------------------------------
'//                 ���\���w����`�B�z��̒�`
'//----------------------------------------------------------------
Public axes_info(16) As Long

'//--------------------------------------------------------------------
'//  ���o�[�W�����݊��A�v���P�[�V�����v���O�����C���^�[�t�F�C�X�֐�
'//--------------------------------------------------------------------

'//----------------------------------------------------------------
'//                         �ʐM�N���`�o�h
'//----------------------------------------------------------------

'// Termi-BUS SIO �̒ʐM�N���֐� ( �ʐM�������ڎw�� )
'TBUSSIOAPI int WINAPI init_sio_tbus(
'    LPCTSTR port,  // �ʐM�|�[�g�t�@�C���� ( "COM1","COM2"etc. )
'    int baud,      // �{�[���C�g�w��R�[�h ( 4,5,6,11H,13H,14H )
'    int nrt,       // �R�}���h�đ��ő��
'    int *axes_info // ���\���w����
'    );

Public Declare Function init_sio_tbus Lib "TMBSCOM.DLL" Alias "_init_sio_tbus@16" _
    (ByVal port As String, _
    ByVal baud As Long, _
    ByVal nrt As Long, _
    axes_info As Long) As Long

'// Termi-BUS SIO �̒ʐM�N���֐� ( TBUSSIO.INI�t�@�C���w�� )
'TBUSSIOAPI int WINAPI init_sio( void );

Public Declare Function init_sio Lib "TMBSCOM.DLL" Alias "_init_sio@0" () As Long

'//----------------------------------------------------------------
'//                    �ʐM�����Ԋm�F�`�o�h
'//----------------------------------------------------------------

'// ���݂̎��\�����𓾂�֐�
'TBUSSIOAPI int WINAPI get_axes(
'    unsigned short *axes    // ���\�����i�[�̈�ւ̃|�C���^
'    );
Public Declare Function get_axes Lib "TMBSCOM.DLL" Alias "_get_axes@4" _
    (axes As Integer) As Long

'// ���݂̒ʐM�G���[�R�[�h�𓾂�֐�
Public Declare Function get_sio_error Lib "TMBSCOM.DLL" Alias "_get_sio_error@0" () As Long

'//----------------------------------------------------------------
'//                   ���z�������A�N�Z�X�`�o�h
'//----------------------------------------------------------------
'// (R4) ���z��������Ԃ���̃����_���A�N�Z�X�ǂݏo���֐�
Public Declare Function read_svmem Lib "TMBSCOM.DLL" Alias "_read_svmem@12" _
    (ByVal axis As Long, _
    ByVal address As Long, _
    dst As Long) As Long

'// EEPROM ���ʃp�����[�^�ꊇ��������( src -> EEPROM )�֐�
Public Declare Function write_param Lib "TMBSCOM.DLL" Alias "_write_param@8" _
    (ByVal axis As Long, _
    src As COMPACK) As Long

'// EEPROM ���ʃp�����[�^�ǂݏo��( EEPROM -> dst )�֐�
Public Declare Function read_param Lib "TMBSCOM.DLL" Alias "_read_param@8" _
    (ByVal axis As Long, _
    dst As COMPACK) As Long

'// EEPROM �|�C���g�f�[�^�ꊇ��������( src -> EEPROM )�֐�
Public Declare Function write_point Lib "TMBSCOM.DLL" Alias "_write_point@12" _
    (ByVal axis As Long, _
    ByVal Point As Long, _
    src As COMPACK) As Long

'// EEPROM �|�C���g�f�[�^�ǂݏo��( EEPROM -> dst )�֐�
Public Declare Function read_point Lib "TMBSCOM.DLL" Alias "_read_point@12" _
    (ByVal axis As Long, _
    ByVal Point As Long, _
    dst As COMPACK) As Long

'// ���s�̈拤�ʃp�����[�^���[�h( EEPROM -> Bank#30 )�֐�
Public Declare Function load_param Lib "TMBSCOM.DLL" Alias "_load_param@4" _
    (ByVal axis As Long) As Long

'// ���s�̈拤�ʃp�����[�^�Z�[�u( Bank#30 -> EEPROM )�֐�
Public Declare Function save_param Lib "TMBSCOM.DLL" Alias "_save_param@4" _
    (ByVal axis As Long) As Long

'// ���s�̈�|�C���g�f�[�^�Z�[�u( Bank#31 -> EEPROM )�֐�
Public Declare Function save_point Lib "TMBSCOM.DLL" Alias "_save_point@8" _
    (ByVal axis As Long, _
    ByVal Point As Long) As Long

'// ���ʃp�����[�^�̈�(Bank#0)�̏������݉񐔓ǂݏo���֐�
Public Declare Function get_write_count Lib "TMBSCOM.DLL" Alias "_get_write_count@4" _
    (ByVal axis As Long) As Long


'//----------------------------------------------------------------
'//                    ������p�����[�^�ύX�`�o�h
'//----------------------------------------------------------------

'// (z) ���]���y�n�m�d�o�͋��E�l��ύX����֐�
'   axis�F���ԍ�
'   zone�F���]���]�[�����E�l
Public Declare Function write_fzone Lib "TMBSCOM.DLL" Alias "_write_fzone@8" _
    (ByVal axis As Long, _
    ByVal zone As Long) As Long

'// (z) �t�]���y�n�m�d�o�͋��E�l��ύX����֐�
'   axis�F���ԍ�
'   zone�F�t�]���]�[�����E�l
Public Declare Function write_rzone Lib "TMBSCOM.DLL" Alias "_write_rzone@8" _
    (ByVal axis As Long, _
    ByVal zone As Long) As Long

'// (g) �ړ������͒�~���̃T�[�{�Q�C���p�����[�^��ύX����֐�
'   axis    �F���ԍ�
'   gain_sel�F��~���ړ����̑I�� 0=�ړ���, 1=��~��
'   svparm  �F�T�[�{�Q�C���p�����[�^
Public Declare Function select_svparm Lib "TMBSCOM.DLL" Alias "_select_svparm@12" _
    (ByVal axis As Long, _
    ByVal gain_sel As Long, _
    ByVal sv_parm As Long) As Long

'// (i) �ʒu���ߊ������o����ύX����֐�
'   axis �F���ԍ�
'   width�F�ʒu���ߊ������o��
Public Declare Function write_inpos Lib "TMBSCOM.DLL" Alias "_write_inpos@8" _
    (ByVal axis As Long, _
    ByVal width As Long) As Long

'// (l) ��~���y�шړ����̓d�������l��ύX����֐�
'   axis     �F���ԍ�
'   l_dynamic�F��~���d�������l
'   l_static �F�ړ����d�������l
Public Declare Function write_trqlim Lib "TMBSCOM.DLL" Alias "_write_trqlim@12" _
    (ByVal axis As Long, _
    ByVal l_dynamic As Long, _
    ByVal l_static As Long) As Long

'// (v) ���x�^�����x�w�ߒl�ݒ�֐�
'   axis�F���ԍ�
'   vcmd�F���x�w�ߒl
'   acmd�F�����x�w�ߒl
Public Declare Function write_velocity Lib "TMBSCOM.DLL" Alias "_write_velocity@12" _
    (ByVal axis As Long, _
    ByVal vcmd As Long, _
    ByVal acmd As Long) As Long


'//------------------------------------------------------------------
'//                        ������w�߂`�o�h
'//------------------------------------------------------------------

'// (Q3) �|�C���g�ԍ��w��o�s�o����w�ߊ֐�
'   axis �F���ԍ�
'   point�F�|�C���g�ԍ�
Public Declare Function move_point Lib "TMBSCOM.DLL" Alias "_move_point@8" _
    (ByVal axis As Long, _
    ByVal Point As Long) As Long

'// (a) ��Έʒu�w��o�s�o����w�ߊ֐�
'TBUSSIOAPI int WINAPI move_abs(
'    int axis,      // ���ԍ�
'    long position  // ��΍��W�n�ł̖ڕW�ʒu
'    );

Public Declare Function move_abs Lib "TMBSCOM.DLL" Alias "_move_abs@8" _
    (ByVal axis As Long, _
    ByVal position As Long) As Long

'// (d) �c�ړ��w�߃L�����Z���i������~�j�w�ߊ֐�
'TBUSSIOAPI int WINAPI follow_position(
'    int axis      // ���ԍ�
'    );

Public Declare Function follow_position Lib "TMBSCOM.DLL" Alias "_follow_position@4" _
    (ByVal axis As Long) As Long

'// (j) �i�n�f����w�ߊ֐�
'TBUSSIOAPI int WINAPI move_jog(
'    int axis,      // ���ԍ�
'    long distance  // �i�n�f�w�ߌJ��Ԃ�����������̈ړ���
'    );

Public Declare Function move_jog Lib "TMBSCOM.DLL" Alias "_move_jog@8" _
    (ByVal axis As Long, _
    ByVal distance As Long) As Long

'// (m) ���Έړ��ʈʒu�w��o�s�o����w�ߊ֐�
'TBUSSIOAPI int WINAPI move_inc(
'    int axis,      // ���ԍ�
'    long distance  // �ړ���
'    );

Public Declare Function move_inc Lib "TMBSCOM.DLL" Alias "_move_inc@8" _
    (ByVal axis As Long, _
    ByVal distance As Long) As Long

'// (o) ���_���A����w�ߊ֐�
'TBUSSIOAPI int WINAPI move_org(
'    int axis,      // ���ԍ�
'    int mode       // ���_���A����p�^�[���w��R�[�h
'    );

Public Declare Function move_org Lib "TMBSCOM.DLL" Alias "_move_org@8" _
    (ByVal axis As Long, _
    ByVal mode As Long) As Long

'// (v) ������]�w�ߊ֐�
'TBUSSIOAPI int WINAPI move_rotate(
'    int axis,      // ���ԍ�
'    int dir,       // ��]���� 0=���], 1=�t�]
'    int vcmd,      // ���x�w�ߒl
'    int acmd       // �����x�w�ߒl
'    );

Public Declare Function move_rotate Lib "TMBSCOM.DLL" Alias "_move_rotate@16" _
    (ByVal axis As Long, _
    ByVal dir As Long, _
    ByVal vcmd As Long, _
    ByVal acmd As Long) As Long


'//----------------------------------------------------------------
'//                 �T�[�{�V�X�e����ԕύX�`�o�h
'//----------------------------------------------------------------

'// (b) ���݈ʒu�ύX�i���W�n�V�t�g�j�w�ߊ֐�
'TBUSSIOAPI int WINAPI write_position(
'    int axis,      // ���ԍ�
'    long position  // ��΍��W�n�ł̌��݈ʒu
'    );

Public Declare Function write_position Lib "TMBSCOM.DLL" Alias "_write_position@8" _
    (ByVal axis As Long, _
    ByVal position As Long) As Long

'// (q) �T�[�{�n�m�w�ߊ֐�
'TBUSSIOAPI int WINAPI set_son(
'    int axis      // ���ԍ�
'    );

Public Declare Function set_son Lib "TMBSCOM.DLL" Alias "_set_son@4" _
    (ByVal axis As Long) As Long

'// (q) �T�[�{�n�e�e�w�ߊ֐�
'TBUSSIOAPI int WINAPI set_soff(
'    int axis      // ���ԍ�
'    );

Public Declare Function set_soff Lib "TMBSCOM.DLL" Alias "_set_soff@4" _
    (ByVal axis As Long) As Long

'// (r) �A���[�����Z�b�g�w�ߊ֐�
'TBUSSIOAPI int WINAPI reset_alarm(
'    int axis      // ���ԍ�
'    );

Public Declare Function reset_alarm Lib "TMBSCOM.DLL" Alias "_reset_alarm@4" _
    (ByVal axis As Long) As Long

'// (r) �s�������������������w�ߊ֐�
'TBUSSIOAPI int WINAPI reset_memory(
'    int axis      // ���ԍ�
'    );

Public Declare Function reset_memory Lib "TMBSCOM.DLL" Alias "_reset_memory@4" _
    (ByVal axis As Long) As Long

'// (s) �o�h�n�@�\�I���t���O�ݒ�֐�
'TBUSSIOAPI int WINAPI config_pio(
'    int axis,      // ���ԍ�
'    int mode       // �o�h�n�@�\�I���t���O
'    );

Public Declare Function config_pio Lib "TMBSCOM.DLL" Alias "_config_pio@8" _
    (ByVal axis As Long, _
    ByVal mode As Long) As Long


'//----------------------------------------------------------------
'//               �T�[�{�V�X�e��������Ԋm�F�`�o�h
'//----------------------------------------------------------------

'//  �T�[�{�V�X�e��������Ԃ𓾂�֐�
'TBUSSIOAPI int WINAPI get_status(
'    int axis,      // ���ԍ�
'    char *param    // �T�[�{�V�X�e��������ԃf�[�^�i�[�̈�ւ̃|�C���^
'    );

Public Declare Function get_status Lib "TMBSCOM.DLL" Alias "_get_status@8" _
    (ByVal axis As Long, _
    param As Byte) As Long

'// �T�[�{�V�X�e�� RUN ��� (RUN�r�b�g) �𓾂�֐�
'TBUSSIOAPI int WINAPI check_run(
'    int axis      // ���ԍ�
'    );

Public Declare Function check_run Lib "TMBSCOM.DLL" Alias "_check_run@4" _
    (ByVal axis As Long) As Long

'// �T�[�{ ON/OFF ��� (SON�r�b�g) �𓾂�֐�
'TBUSSIOAPI int WINAPI check_son(
'    int axis      // ���ԍ�
'    );

Public Declare Function check_son Lib "TMBSCOM.DLL" Alias "_check_son@4" _
    (ByVal axis As Long) As Long

'// ���_���A������� (ZFIN�r�b�g) �𓾂�֐�
'TBUSSIOAPI int WINAPI check_org(
'    int axis      // ���ԍ�
'    );

Public Declare Function check_org Lib "TMBSCOM.DLL" Alias "_check_org@4" _
    (ByVal axis As Long) As Long

'// �ʒu���ߊ������ (PFIN�r�b�g) �𓾂�֐�
'TBUSSIOAPI int WINAPI check_pfin(
'    int axis      // ���ԍ�
'    );

Public Declare Function check_pfin Lib "TMBSCOM.DLL" Alias "_check_pfin@4" _
    (ByVal axis As Long) As Long

'// �A���[����� (ALM�r�b�g) �𓾂�֐�
'TBUSSIOAPI int WINAPI check_alrm(
'    int axis      // ���ԍ�
'    );

Public Declare Function check_alarm Lib "TMBSCOM.DLL" Alias "_check_alrm@4" _
    (ByVal axis As Long) As Long

'// (n) �T�[�{�V�X�e��������ԃ|�[�����O�֐�
'TBUSSIOAPI int WINAPI check_status(
'    int axis      // ���ԍ�
'    );

Public Declare Function check_status Lib "TMBSCOM.DLL" Alias "_check_status@4" _
    (ByVal axis As Long) As Long

'// �_�C���N�g���X�|���X�f�[�^�������݃t���O���N���A����֐�
'TBUSSIOAPI int WINAPI reset_stwrf(
'    int axis      // ���ԍ�
'    );

Public Declare Function reset_stwrf Lib "TMBSCOM.DLL" Alias "_reset_stwrf@4" _
    (ByVal axis As Long) As Long

'// �_�C���N�g���X�|���X�f�[�^�������݃t���O�𒲂ׂ�֐�
'TBUSSIOAPI int WINAPI check_stwrf(
'    int axis      // ���ԍ�
'    );

Public Declare Function check_stwrf Lib "TMBSCOM.DLL" Alias "_check_stwrf@4" _
    (ByVal axis As Long) As Long


'//----------------------------------------------------------------------
'//       �V�K�ǉ��A�v���P�[�V�����v���O�����C���^�[�t�F�C�X�֐�
'//----------------------------------------------------------------------

'//----------------------------------------------------------------
'//                         �ʐM�N���`�o�h
'//----------------------------------------------------------------

'// Termi-BUS SIO �̐V�ʐM�N���֐� ( �ʐM�������ڎw�� )
'TBUSSIOAPI int WINAPI init_tmbs_config(
'    LPCTSTR port,      // �ʐM�|�[�g�t�@�C���� ( "COM1","COM2"etc. )
'    int baud,          // �{�[���C�g�w��R�[�h( 4,5,6,7,11H,12H,13H,14H )
'    int nrt,           // �R�}���h�đ��ő��
'    BOOL reset,        // TRUE �ōđ��񐔃I�[�o�̂Ƃ��ʐM�������ɖ߂�
'    BOOL automatic,    // TRUE �Ń{�[���C�g�����ݒ�
'    int *axes_info     // ���\���w����
'    );

Public Declare Function init_tmbs_config Lib "TMBSCOM.DLL" Alias "_init_tmbs_config@24" _
    (ByVal port As String, _
    ByVal baud As Long, _
    ByVal nrt As Long, _
    ByVal reset As Long, _
    ByVal automatic As Long, _
    axes_info As Long) As Long

'// Termi-BUS SIO �̐V�ʐM�N���֐� ( TBUSSIO.INI�t�@�C���w�� )
'TBUSSIOAPI int WINAPI init_tmbs( void );

Public Declare Function init_tmbs Lib "TMBSCOM.DLL" Alias "_init_tmbs@0" () As Long

'// Termi-BUS SIO �̑S�Ă̎�������ďI������֐�
'TBUSSIOAPI int WINAPI close_tmbs( void );

Public Declare Function close_tmbs Lib "TMBSCOM.DLL" Alias "_close_tmbs@0" () As Long

'// close_tmbs �֐��ŕ��� Termi-BUS ���ēx�I�[�v������֐�
'TBUSSIOAPI int WINAPI reopen_tmbs( void );

Public Declare Function reopen_tmbs Lib "TMBSCOM.DLL" Alias "_reopen_tmbs@0" () As Long

'//----------------------------------------------------------------
'//                      �ʐM��Ԋm�F�`�o�h
'//----------------------------------------------------------------

'// Termi-BUS SIO �ʐM�������s��Ԃ𓾂�֐�
'TBUSSIOAPI int WINAPI get_tmbs_state( void );

Public Declare Function get_tmbs_state Lib "TMBSCOM.DLL" Alias "_get_tmbs_state@0" () As Long

'// ���݂̃{�[���C�g�ݒ�l�𓾂�֐�
'TBUSSIOAPI int WINAPI get_current_baud( void );

Public Declare Function get_current_baud Lib "TMBSCOM.DLL" Alias "_get_current_baud@0" () As Long

'// COM �|�[�g�̒ʐM�G���[���O�𓾂�֐�
'TBUSSIOAPI int WINAPI get_com_errlog( void );

Public Declare Function get_com_errlog Lib "TMBSCOM.DLL" Alias "_get_com_errlog@0" () As Long

'//----------------------------------------------------------------
'//                   ���z�������A�N�Z�X�`�o�h
'//----------------------------------------------------------------

'// ���z��������ԃ����_���A�N�Z�X�������݊֐�
'TBUSSIOAPI int WINAPI write_svmem(
'    int axis,           // ���ԍ�
'    int address,        // ���z��������Ԃ̏������ݐ�A�h���X
'    const long *src     // �������݃f�[�^�i�[�̈�ւ̃|�C���^
'    );

Public Declare Function write_svmem Lib "TMBSCOM.DLL" Alias "_write_svmem@12" _
    (ByVal axis As Long, _
    ByVal address As Long, _
    src As Long) As Long

'//----------------------------------------------------------------
'//                �჌�x���R�}���h����M�`�o�h
'//----------------------------------------------------------------

'// �჌�x���������R�}���h����M�֐� ( R4,W4,T4 �`�� )
'TBUSSIOAPI int WINAPI memcmd_form0(
'    char *func_id,      // �������R�}���h�@�\�R�[�h������ւ̃|�C���^
'    int axis,           // ���ԍ�
'    DWORD com_data,     // �R�}���h�f�[�^
'    LPDWORD res_data,   // ���X�|���X�f�[�^�i�[�̈�ւ̃|�C���^
'    LPDWORD warning     // ���[�j���O�R�[�h�i�[�̈�ւ̃|�C���^
'    );

Public Declare Function memcmd_form0 Lib "TMBSCOM.DLL" Alias "_memcmd_form0@20" _
    (ByVal func_id As String, _
    ByVal axis As Long, _
    ByVal com_data As Long, _
    res_data As Long, _
    warning As Long) As Long

'// �჌�x���������R�}���h����M�֐� ( Q1,Q3 �`�� )
'TBUSSIOAPI int WINAPI memcmd_form1(
'    char *func_id,      // �������R�}���h�@�\�R�[�h������ւ̃|�C���^
'    int axis,           // ���ԍ�
'    int bank,           // �R�}���h�f�[�^( �o���N�ԍ� )
'    int point,          // �R�}���h�f�[�^( �|�C���g�ԍ� )
'    unsigned char *res, // ���X�|���X�f�[�^�i�[�̈�ւ̃|�C���^
'    LPDWORD warning     // ���[�j���O�R�[�h�i�[�̈�ւ̃|�C���^
'    );

Public Declare Function memcmd_form1 Lib "TMBSCOM.DLL" Alias "_memcmd_form1@24" _
    (ByVal func_id As String, _
    ByVal axis As Long, _
    ByVal bank As Long, _
    ByVal Point As Long, _
    Res As Byte, _
    warning As Long) As Long

'// �჌�x���������R�}���h����M�֐� ( Q2,Q4 �`�� )
'TBUSSIOAPI int WINAPI memcmd_form2(
'    char *func_id,      // �������R�}���h�@�\�R�[�h������ւ̃|�C���^
'    int axis,           // ���ԍ�
'    int bank,           // �R�}���h�f�[�^( �o���N�ԍ� )
'    unsigned char *res, // ���X�|���X�f�[�^�i�[�̈�ւ̃|�C���^
'    LPDWORD warning     // ���[�j���O�R�[�h�i�[�̈�ւ̃|�C���^
'    );

Public Declare Function memcmd_form2 Lib "TMBSCOM.DLL" Alias "_memcmd_form2@20" _
    (ByVal func_id As String, _
    ByVal axis As Long, _
    ByVal bank As Long, _
    Res As Byte, _
    warning As Long) As Long

'// �჌�x���������R�}���h����M�֐� ( V5,V6 �`�� )
'TBUSSIOAPI int WINAPI memcmd_form3(
'    char *func_id,      // �������R�}���h�@�\�R�[�h������ւ̃|�C���^
'    int axis,           // ���ԍ�
'    int bank,           // �R�}���h�f�[�^( �o���N�ԍ� )
'    int point,          // �R�}���h�f�[�^( �|�C���g�ԍ� )
'    LPDWORD res_data,   // ���X�|���X�f�[�^�i�[�̈�ւ̃|�C���^
'    LPDWORD warning     // ���[�j���O�R�[�h�i�[�̈�ւ̃|�C���^
'    );

Public Declare Function memcmd_form3 Lib "TMBSCOM.DLL" Alias "_memcmd_form3@24" _
    (ByVal func_id As String, _
    ByVal axis As Long, _
    ByVal bank As Long, _
    ByVal Point As Long, _
    res_data As Long, _
    warning As Long) As Long

'// �჌�x���_�C���N�g�R�}���h����M�֐� ( a,b,i,j,m �`�� )
'TBUSSIOAPI int WINAPI dircmd_form0(
'    char func_id,       // �_�C���N�g�R�}���h�@�\�R�[�h����
'    int axis,           // ���ԍ�
'    int data,           // �R�}���h�f�[�^
'    unsigned char *res, // ���X�|���X�f�[�^�i�[�̈�ւ̃|�C���^
'    LPDWORD warning     // ���[�j���O�R�[�h�i�[�̈�ւ̃|�C���^
'    );

Public Declare Function dircmd_form0 Lib "TMBSCOM.DLL" Alias "_dircmd_form0@20" _
    (ByVal func_id As Byte, _
    ByVal axis As Long, _
    ByVal data As Long, _
    Res As Byte, _
    warning As Long) As Long

'// �჌�x���_�C���N�g�R�}���h����M�֐� ( d,n,t �`�� )
'TBUSSIOAPI int WINAPI dircmd_form1(
'    char func_id,       // �_�C���N�g�R�}���h�@�\�R�[�h����
'    int axis,           // ���ԍ�
'    unsigned char *res, // ���X�|���X�f�[�^�i�[�̈�ւ̃|�C���^
'    LPDWORD warning     // ���[�j���O�R�[�h�i�[�̈�ւ̃|�C���^
'    );

Public Declare Function dircmd_form1 Lib "TMBSCOM.DLL" Alias "_dircmd_form1@16" _
    (ByVal func_id As Byte, _
    ByVal axis As Long, _
    Res As Byte, _
    warning As Long) As Long

'// �჌�x���_�C���N�g�R�}���h����M�֐� ( g �`�� )
'TBUSSIOAPI int WINAPI dircmd_form2(
'    char func_id,       // �_�C���N�g�R�}���h�@�\�R�[�h����
'    int axis,           // ���ԍ�
'    int data0,          // �R�}���h�f�[�^ ( ��ʑI���R�[�h )
'    int data1,          // �R�}���h�f�[�^ ( �Q�C���ԍ� )
'    unsigned char *res, // ���X�|���X�f�[�^�i�[�̈�ւ̃|�C���^
'    LPDWORD warning     // ���[�j���O�R�[�h�i�[�̈�ւ̃|�C���^
'    );

Public Declare Function dircmd_form2 Lib "TMBSCOM.DLL" Alias "_dircmd_form2@24" _
    (ByVal func_id As Byte, _
    ByVal axis As Long, _
    ByVal data0 As Long, _
    ByVal data1 As Long, _
    Res As Byte, _
    warning As Long) As Long

'// �჌�x���_�C���N�g�R�}���h����M�֐� ( l �`�� )
'TBUSSIOAPI int WINAPI dircmd_form3(
'    char func_id,       // �_�C���N�g�R�}���h�@�\�R�[�h����
'    int axis,           // ���ԍ�
'    int data0,          // �R�}���h�f�[�^ ( ��~���d�������l )
'    int data1,          // �R�}���h�f�[�^ ( �ړ����d�������l )
'    unsigned char *res, // ���X�|���X�f�[�^�i�[�̈�ւ̃|�C���^
'    LPDWORD warning     // ���[�j���O�R�[�h�i�[�̈�ւ̃|�C���^
'    );

Public Declare Function dircmd_form3 Lib "TMBSCOM.DLL" Alias "_dircmd_form3@24" _
    (ByVal func_id As Byte, _
    ByVal axis As Long, _
    ByVal data0 As Long, _
    ByVal data1 As Long, _
    Res As Byte, _
    warning As Long) As Long

'// �჌�x���_�C���N�g�R�}���h����M�֐� ( o, r �`�� )
'TBUSSIOAPI int WINAPI dircmd_form4(
'    char func_id,       // �_�C���N�g�R�}���h�@�\�R�[�h����
'    int axis,           // ���ԍ�
'    int data,           // �R�}���h�f�[�^
'    unsigned char *res, // ���X�|���X�f�[�^�i�[�̈�ւ̃|�C���^
'    LPDWORD warning     // ���[�j���O�R�[�h�i�[�̈�ւ̃|�C���^
'    );

Public Declare Function dircmd_form4 Lib "TMBSCOM.DLL" Alias "_dircmd_form4@20" _
    (ByVal func_id As Byte, _
    ByVal axis As Long, _
    ByVal data As Long, _
    Res As Byte, _
    warning As Long) As Long

'// �჌�x���_�C���N�g�R�}���h����M�֐� ( q �`�� )
'TBUSSIOAPI int WINAPI dircmd_form5(
'    char func_id,       // �_�C���N�g�R�}���h�@�\�R�[�h����
'    int axis,           // ���ԍ�
'    int data,           // �R�}���h�f�[�^
'    unsigned char *res, // ���X�|���X�f�[�^�i�[�̈�ւ̃|�C���^
'    LPDWORD warning     // ���[�j���O�R�[�h�i�[�̈�ւ̃|�C���^
'    );

Public Declare Function dircmd_form5 Lib "TMBSCOM.DLL" Alias "_dircmd_form5@20" _
    (ByVal func_id As Byte, _
    ByVal axis As Long, _
    ByVal data As Long, _
    Res As Byte, _
    warning As Long) As Long

'// �჌�x���_�C���N�g�R�}���h����M�֐� ( s �`�� )
'TBUSSIOAPI int WINAPI dircmd_form6(
'    char func_id,       // �_�C���N�g�R�}���h�@�\�R�[�h����
'    int axis,           // ���ԍ�
'    int data,           // �R�}���h�f�[�^
'    unsigned char *res, // ���X�|���X�f�[�^�i�[�̈�ւ̃|�C���^
'    LPDWORD warning     // ���[�j���O�R�[�h�i�[�̈�ւ̃|�C���^
'    );

Public Declare Function dircmd_form6 Lib "TMBSCOM.DLL" Alias "_dircmd_form6@20" _
    (ByVal func_id As Byte, _
    ByVal axis As Long, _
    ByVal data As Long, _
    Res As Byte, _
    warning As Long) As Long

'// �჌�x���_�C���N�g�R�}���h����M�֐� ( v �`�� )
'TBUSSIOAPI int WINAPI dircmd_form7(
'    char func_id,       // �_�C���N�g�R�}���h�@�\�R�[�h����
'    int axis,           // ���ԍ�
'    int data0,          // �R�}���h�f�[�^ ( �I���R�[�h )
'    int data1,          // �R�}���h�f�[�^ ( ���x�w�� )
'    int data2,          // �R�}���h�f�[�^ ( �����x�w�� )
'    unsigned char *res, // ���X�|���X�f�[�^�i�[�̈�ւ̃|�C���^
'    LPDWORD warning     // ���[�j���O�R�[�h�i�[�̈�ւ̃|�C���^
'    );

Public Declare Function dircmd_form7 Lib "TMBSCOM.DLL" Alias "_dircmd_form7@28" _
    (ByVal func_id As Byte, _
    ByVal axis As Long, _
    ByVal data0 As Long, _
    ByVal data1 As Long, _
    ByVal data2 As Long, _
    Res As Byte, _
    warning As Long) As Long

'// �჌�x���_�C���N�g�R�}���h����M�֐� ( z �`�� )
'TBUSSIOAPI int WINAPI dircmd_form8(
'    char func_id,       // �_�C���N�g�R�}���h�@�\�R�[�h����
'    int axis,           // ���ԍ�
'    int data0,          // �R�}���h�f�[�^ ( �̈�M�����E�l )
'    int data1,          // �R�}���h�f�[�^ ( ���E�̕��� )
'    unsigned char *res, // ���X�|���X�f�[�^�i�[�̈�ւ̃|�C���^
'    LPDWORD warning     // ���[�j���O�R�[�h�i�[�̈�ւ̃|�C���^
'    );

Public Declare Function dircmd_form8 Lib "TMBSCOM.DLL" Alias "_dircmd_form8@24" _
    (ByVal func_id As Byte, _
    ByVal axis As Long, _
    ByVal data0 As Long, _
    ByVal data1 As Long, _
    Res As Byte, _
    warning As Long) As Long

'// �჌�x���R�}���h����M�֐� ( �ėp �`���Ȃ� )
'TBUSSIOAPI int WINAPI cmd_unform(
'       int axis,         // ���ԍ�
'       int mode,         // mode 0:MemoryCommand, 1:DirectCommand
'       char *cmd_str,    // �R�}���h������ (11����) �ւ̃|�C���^
'       LPDWORD res_data, // ���X�|���X�f�[�^�i�[�̈�ւ̃|�C���^
'       LPDWORD warning   // ���[�j���O�R�[�h�i�[�̈�ւ̃|�C���^
'       );

Public Declare Function cmd_unform Lib "TMBSCOM.DLL" Alias "_cmd_unform@20" _
    (ByVal axis As Long, _
    ByVal mode As Long, _
    cmd_str As String, _
    res_data As Long, _
    warning As Long) As Long

'//----------------------------------------------------------------
'//                   ���o�[�W�����݊��萔
'//----------------------------------------------------------------
'//------------------------------------------------------------
'//              �e�֐�����̐����^���s�Ԃ�l
'//------------------------------------------------------------
'#define SIO_DONE            1   // ����I��
'#define SIO_ERROR           0   // �G���[

Public Const SIO_DONE As Long = 1
Public Const SIO_ERROR As Long = 0

'//-------------------------------------------------
'//   get_sio_error() �֐�����Ԃ����G���[�R�[�h
'//-------------------------------------------------
Public Const SIO_COMUSED As Long = -1           'COM�|�[�g�����łɎg���Ă���
Public Const SIO_TIMEOUT As Long = -2           '���X�|���X�̃^�C���A�E�g
Public Const SIO_NOINIT As Long = -3            '����������Ă��܂���
Public Const SIO_INVALID_AXIS As Long = -4      '���ݒ�ɖ��������w�肳�ꂽ
Public Const SIO_INVALID_PARAM As Long = -5     '�������Ȃ��p�����[�^���n���ꂽ
Public Const SIO_NOTSUPORT_TO As Long = -6      '�ʐM�^�C���A�E�g���T�|�[�g����Ă��Ȃ�
Public Const SIO_NOTSUPORT_DTR As Long = -7     'DTR���䂪�T�|�[�g����Ă��Ȃ�
Public Const SIO_NOTSUPORT_BAUD As Long = -8    '�T�|�[�g����Ă��Ȃ��{�[���C�g���w�肳�ꂽ
Public Const SIO_NOTSUPORT_PARA As Long = -9    'COM�p�����[�^�̕ύX���T�|�[�g����Ă��Ȃ�
Public Const SIO_NO_CONFIGFILE As Long = -10    '���ݒ�t�@�C����������Ȃ�
Public Const SIO_RESOURCE As Long = -11         '���\�[�X�f�[�^���ǂݍ��߂Ȃ�


'//-------------------------------------------------
'//                   �V�K�ǉ��萔
'//-------------------------------------------------
'//-------------------------------------------------
'//   get_sio_error() �֐�����Ԃ����G���[�R�[�h
'//-------------------------------------------------
Public Const SIO_COMFAILED As Long = -12    'COM �|�[�g�̃I�[�v���Ɏ��s���܂���

'//-------------------------------------------------
'//   �T�[�{�V�X�e��������ԃf�[�^�̃r�b�g���o�p�萔
'//-------------------------------------------------
'// �C���f�b�N�X
Public Const TMBS_PO_ID As Long = 0
Public Const TMBS_PI_ID As Long = 1
Public Const TMBS_ALARM_ID As Long = 2
Public Const TMBS_STAT_ID As Long = 3

'// PO �r�b�g�}�b�v
Public Const TMBS_PM_CODE As Long = &HF&
Public Const TMBS_PM1_BIT As Long = &H1&
Public Const TMBS_PM2_BIT As Long = &H2&
Public Const TMBS_PM4_BIT As Long = &H4&
Public Const TMBS_PM8_BIT As Long = &H8&
Public Const TMBS_PFIN_BIT As Long = &H10&
Public Const TMBS_ZFIN_BIT As Long = &H20&
Public Const TMBS_ZONE_BIT As Long = &H40&
Public Const TMBS_ALM_BIT As Long = &H80&

'// PI �r�b�g�}�b�v
Public Const TMBS_PC_CODE As Long = &HF&
Public Const TMBS_PC1_BIT As Long = &H1&
Public Const TMBS_PC2_BIT As Long = &H2&
Public Const TMBS_PC4_BIT As Long = &H4&
Public Const TMBS_PC8_BIT As Long = &H8&
Public Const TMBS_CSTR_BIT As Long = &H10&
Public Const TMBS_INHP_BIT As Long = &H20&
Public Const TMBS_INHN_BIT As Long = &H40&
Public Const TMBS_ILK_BIT As Long = &H80&

'// STAT �r�b�g�}�b�v
Public Const TMBS_SON_BIT As Long = &H1&
Public Const TMBS_RUN_BIT As Long = &H2&
Public Const TMBS_ZFST_BIT As Long = &H4&
Public Const TMBS_HOLD_BIT As Long = &H8&
Public Const TMBS_LIMP_BIT As Long = &H10&
Public Const TMBS_LIMN_BIT As Long = &H20&
Public Const TMBS_ILST_BIT As Long = &H40&
Public Const TMBS_WARN_BIT As Long = &H80&

'//-------------------------------------------------
'//       Termi-BUS SIO �{�[���C�g�ݒ�R�[�h
'//-------------------------------------------------
Public Const TMBS_BAUD_9600 As Long = &H4&      '  9600 bps
Public Const TMBS_BAUD_19200 As Long = &H5&     ' 19200 bps
Public Const TMBS_BAUD_38400 As Long = &H6&     ' 38400 bps
Public Const TMBS_BAUD_14400 As Long = &H11&    ' 14400 bps
Public Const TMBS_BAUD_57600 As Long = &H13&    ' 57600 bps
Public Const TMBS_BAUD_115200 As Long = &H14&   '115200 bps

'//-------------------------------------------------
'//       Termi-BUS SIO �ʐM�������s��ԃR�[�h
'//-------------------------------------------------
Public Const TMBS_NO_EXIST As Long = 0      '�ʐM�����͊J�n����Ă��܂���
Public Const TMBS_INITIAL As Long = 1       '�ʐM�������v���҂����
Public Const TMBS_INIT_ERROR As Long = 2    '�ʐM�������G���[���
Public Const TMBS_OPENING As Long = 3       '�ʐM���������s���
Public Const TMBS_RUNNING As Long = 4       '�ʐM�m�����
