# Microsoft Developer Studio Generated NMAKE File, Based on TBsample.dsp
!IF "$(CFG)" == ""
CFG=TBsample - Win32 Debug
!MESSAGE �\�����w�肳��Ă��܂���B��̫�Ă� TBsample - Win32 Debug ��ݒ肵�܂��B
!ENDIF 

!IF "$(CFG)" != "TBsample - Win32 Release" && "$(CFG)" !=\
 "TBsample - Win32 Debug"
!MESSAGE �w�肳�ꂽ ����� Ӱ�� "$(CFG)" �͐���������܂���B
!MESSAGE NMAKE �̎��s���ɍ\�����w��ł��܂�
!MESSAGE ����� ײݏ��ϸۂ̐ݒ���`���܂��B��:
!MESSAGE 
!MESSAGE NMAKE /f "TBsample.mak" CFG="TBsample - Win32 Debug"
!MESSAGE 
!MESSAGE �I���\������� Ӱ��:
!MESSAGE 
!MESSAGE "TBsample - Win32 Release" ("Win32 (x86) Console Application" �p)
!MESSAGE "TBsample - Win32 Debug" ("Win32 (x86) Console Application" �p)
!MESSAGE 
!ERROR �����ȍ\�����w�肳��Ă��܂��B
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "TBsample - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\TBsample.exe"

!ELSE 

ALL : "$(OUTDIR)\TBsample.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\TBsample.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\TBsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D\
 "_MBCS" /Fp"$(INTDIR)\TBsample.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD\
 /c 
CPP_OBJS=.\Release/
CPP_SBRS=.
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\TBsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)\TBsample.pdb" /machine:I386 /out:"$(OUTDIR)\TBsample.exe" 
LINK32_OBJS= \
	"$(INTDIR)\TBsample.obj"

"$(OUTDIR)\TBsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "TBsample - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\TBsample.exe"

!ELSE 

ALL : "$(OUTDIR)\TBsample.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\TBsample.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\vc50.pdb"
	-@erase "$(OUTDIR)\TBsample.exe"
	-@erase "$(OUTDIR)\TBsample.ilk"
	-@erase "$(OUTDIR)\TBsample.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE"\
 /D "_MBCS" /Fp"$(INTDIR)\TBsample.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"\
 /FD /c 
CPP_OBJS=.\Debug/
CPP_SBRS=.
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\TBsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib tmbscom.lib /nologo /subsystem:console /incremental:yes\
 /pdb:"$(OUTDIR)\TBsample.pdb" /debug /machine:I386\
 /out:"$(OUTDIR)\TBsample.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\TBsample.obj"

"$(OUTDIR)\TBsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

.c{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<


!IF "$(CFG)" == "TBsample - Win32 Release" || "$(CFG)" ==\
 "TBsample - Win32 Debug"
SOURCE=.\TBsample.cpp
DEP_CPP_TBSAM=\
	".\TBUSSIO.H"\
	

"$(INTDIR)\TBsample.obj" : $(SOURCE) $(DEP_CPP_TBSAM) "$(INTDIR)"



!ENDIF 

