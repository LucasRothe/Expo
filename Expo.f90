! gfortran Expo.f90 -o Expo.exe
! ./Expo.exe

program Exporter
    implicit none
    !<Variablen>
        integer Input ! Eingabe zur Auswahl
        integer :: nDataTyp, nDTZ, nNORM, nProcStat, nMulti  ! Einlese Integer zur Bestimmung des Status
        real*8 :: Exit
        character(len=4) :: DataTyp ! Dateityp
        character(len=3) :: DTZ ! Dezimaltrennzeichen
        character(len=8) :: NORM, ProcStat ! Normierung, Prozess/Übertragungsstatus
        character(len=80) :: DatName ! Name der Datei
        
    !<Code>
        print*
        print*
        print*, "         --------------------------------------"
        print*, "         |           Data Exporter            |"
        print*, "         |                                    |"
        print*, "         |           by Lucas Rothe           |"
        print*, "         |                v3.1                |"
        print*, "         |            CC BY-NC-SA             |"
        print*, "         --------------------------------------"
        !<Main Menu>
            do 
                call Stus(DataTyp,DTZ,NORM,nDataTyp,nDTZ,nNORM,nProcStat,ProcStat)
                print*
                print*
                print*, "*********************************************************"
                print*, "*                                                       *"
                print*, "*                    >> HOMEMENUE <<                    *"
                print*, "*                                                       *"
                print*, "*********************************************************"
                print*, "*                                                       *"
                print*, "*      ++++++++++++++++++++++++++++++++++++++++++       *"
                print*, "*      |        Aktuelles Ausgabeformat         |       *"
                print*, "*      |----------------------------------------|       *"
                print*, "*      | Dateityp: ",DataTyp," | Normierung: ",NORM,"  |       *"
                print*, "*      |        Dezimaltrennzeichen: ", DTZ,"        |       *"
                print*, "*      |   Zeige Uebertragungsstatus: ",ProcStat,"  |       *"
                print*, "*      ++++++++++++++++++++++++++++++++++++++++++       *"
                print*, "*                                                       *"
                print*, "*                 >> Weitere Menues <<                  *"
                print*, "*           [1] - Optionen | [2] - Patch Notes          *"
                print*, "*                                                       *"
                print*, "*              >> Messdaten extrahieren <<              *"
                print*, "*      [3] - GPC | [4] - Fluoreszenz | [5] - UV/Vis     *"
                print*, "*                                                       *"
                print*, "*-------------------------------------------------------*"
                print*, "*                     [0] - Exit                        *"
                print*, "*********************************************************"
                print*, "             WEITER MIT EINGABE EINER ZAHL!"
                read(*,*) Input
                select case(Input)
                 case(0)
                    exit
                 case(1)
                    call Optionen()
                 case(2)
                    call Patch()
                 case(3:5)
                    print*, "          ---< Mehrfache Datenextraktion >---"
                    print*, "          |      [1] - Ja | [2] - Nein      |"
                    print*, "          ==================================="
                    read(*,*) nMulti
                    select case(nMulti)
                     case(1) ! Multiexport
                        call MultiExpo(nDataTyp,nDTZ,nNORM,nProcStat,Input,nMulti)
                     case(2) ! Normal
                        call InputCheck(nDataTyp,nDTZ,nNORM,nProcStat,Input,DatName,nMulti)
                     case(:0)
                        print*, "******************************************************"
                        print*, "* Bitte eine Zahl aus den eckigen Klammern eingeben! *"
                        print*, "******************************************************"
                        print*, "             WEITER MIT EINGABE EINER ZAHL!"
                        read(*,*) Exit
                     case(3:)
                        print*, "******************************************************"
                        print*, "* Bitte eine Zahl aus den eckigen Klammern eingeben! *"
                        print*, "******************************************************"
                        print*, "             WEITER MIT EINGABE EINER ZAHL!"
                        read(*,*) Exit
                    end select    
                 case(6:)
                    print*
                    print*, "******************************************************"
                    print*, "*            Die Eingabe war inkorrekt!              *"
                    print*, "* Bitte eine Zahl aus den eckigen Klammern eingeben! *"
                    print*, "******************************************************"
                 case(:-1)
                    print*
                    print*, "******************************************************"
                    print*, "*            Die Eingabe war inkorrekt!              *"
                    print*, "* Bitte eine Zahl aus den eckigen Klammern eingeben! *"
                    print*, "******************************************************"
                end select
            enddo

end program Exporter

subroutine Patch()
    implicit none
    !<Variabel>
        real*8 :: Exit! Eingabe Zahl  

    !<Code>
        do 
            print*
            print*
            print*, "*********************************************************"
            print*, "*                                                       *"
            print*, "*                   >> PATCH NOTES <<                   *"
            print*, "*                                                       *"
            print*, "*********************************************************"
            print*
            print*, "------------------------< v3.1 >------------------------"
            print*, "- Multiexportierung"
            print*
            print*
            print*, "------------------------< v3.0 >------------------------"
            print*, "- Einfuehrung des Datenexports fuer:"
            print*, "   >> Fluoreszenz"
            print*, "   >> UV/Vis"
            print*, "- Einfuehrung des Uebertragungsstatus"
            print*, "- Behebung des Ausgabefehler, welcher zur Doppelung der Intensitaet fuehrte"
            print*, "- Ueberarbeiten des Layouts"
            print*, "- Anpassung des Export Berichtes fuer GPC-Daten"
            print*, "- Aenderung einiger if-Schleifen in cases:"
            print*, "   >> Programmauswahl"
            print*
            print*
            print*, "------------------------< v2.0 >------------------------"
            print*, "- Namensaenderung in Data Exporter"
            print*, "- Einfuehrung der Patch Notes"
            print*, "- Einfuehrung des Dateistatus"
            print*, "- Einfuehrung des Prozessstatus"
            print*, "- Neu Anordnung des Homemenues"
            print*, "- Behebung Einlesefehler, welche zum Absturz fuehrten:"
            print*, "   >> zu kleinen Exponenten"
            print*, "   >> fehlerhafte Eingabe von Dateinamen"
            print*, "- Nun Verborgen im Ordner:"
            print*, "   >> Expo.f90"
            print*
            print*
            print*, "------------------------< v1.1 >------------------------"
            print*, " - Release Version"
            print*
            print*
            print*, "--------------------------------------"
            print*, "     Don't miss your coffeebreak!"
            print*
            print*, "                      s "
            print*, "             ( ^_^)-c(_)"
            print*, "--------------------------------------"
            print*, "       [Zahl] - Zurueck ins Home"
            read(*,*) Exit
            if(Exit.le.0.or.Exit.ge.0) exit
        end do

end subroutine Patch

subroutine GPC(DatName,nDataTyp,nDTZ,nNORM,nProcStat)
    implicit none
    !<I/Variabel>
        character(len=80) :: DatName ! Name der Datei
        integer :: nDataTyp, nDTZ, nNORM, nProcStat ! Einlese Integer zur Bestimmung des Status
    
    !<Variabel>
        integer :: i,j,k ! Zähler
        integer :: NoR, NoRStart, NoRStop ! Number of Rows / Anzahl der zu übertragenden
        integer :: nERR, cERR ! Anzeigestatus für Fehleroutput| n=Nummer, c=counter
        integer :: iError ! Einlesefehler
        integer,allocatable :: ErrVec(:) ! Fehlervektor
        ! Fehler>0 dann Einlese-/Formatfehler ; Fehler<0 dann Ende des Files ; Fehler=0 kein Fehler
        real*8 :: M, Int, NormInt, Trsh, maxVal, maxM !Molare Masse, Intensität, Unnötige Werte, maximaler Wert (Intensität, Molare Masse)
        real*4 :: tstart,tend,ta,tb ! Zeitmarker
        real*4 :: tGesamt,tMWD,tNorm,tExpo ! Zeitrechner
        real*4 :: ptGesamt,ptMWD,ptNorm,ptExpo ! Zeitrechner
        character(len=80) :: Text  ! Char zum übertragen von Text
        character(len=1) :: MM
        character(len=3) :: Inty
    
    

    !<Code>
        print*, "<><><><><><><><><><><><><><><><><><><>"
        print*, "|           Prozessstatus            |"
        print*, "|             -> GPC <-              |"
        print*, "<><><><><><><><><><><><><><><><><><><>"
        !<Suche nach Anfang und Ende>
            print*
            print*, "Suche MWDstart und MWDstop:"
            call cpu_time(tstart)
            call SucheStart(DatName,NoRStart)
            call SucheStop(DatName,NoRStop)
            call cpu_time(ta)
            NoR=NoRStop-NoRStart-3 ! -3 Da zwei Leerzeilen und minus MWDstop-Zeile
        
        !<Suche nach max Intensität>
                print*
                print*, "Suche maximale Intensitaet:"
                call Norm(DatName,NoR,NorStart,maxVal)
            call cpu_time(tb)

        !<Übertragen der Daten>
            print*
            print*, "-----------------------------------------"
            print*, "       Starte Export der Daten!"
            print*, "-----------------------------------------"
            !<Anlegen der richtigen Datei>
            open(unit=11,file=".\In\"//trim(DatName)//".txt",form="formatted",status="old",action="read")
            if(nDataTyp.eq.1) then
                if(nDTZ.eq.1) then
                    open(unit=12, file=".\GPC/"//trim(DatName)//".txt",form="formatted",status="replace",action="write", &
                    DECIMAL="COMMA")
                 else
                    open(unit=12, file=".\GPC/"//trim(DatName)//".txt",form="formatted",status="replace",action="write")
                end if
            end if
            if(nDataTyp.eq.2) then
                if(nDTZ.eq.1) then
                    open(unit=12, file=".\GPC/"//trim(DatName)//".dat",form="formatted",status="replace",action="write", &
                    DECIMAL="COMMA")
                 else
                    open(unit=12, file=".\GPC/"//trim(DatName)//".dat",form="formatted",status="replace",action="write")
                end if
            end if
            if(nDataTyp.eq.3) then
                if(nDTZ.eq.1) then
                    open(unit=12, file=".\GPC/"//trim(DatName)//".xls",form="formatted",status="replace",action="write", &
                    DECIMAL="COMMA")
                 else
                    open(unit=12, file=".\GPC/"//trim(DatName)//".xls",form="formatted",status="replace",action="write")
                end if
            end if
            
            !<Benennung der Spalten>
            MM = "M"
            Inty = "Int"
            write(unit=12,FMT="(AX,A)") MM, Inty 

            !<Übertragen+Normierung>
            i=0
            nERR=1
            maxM=0
            allocate(ErrVec(NoR))
            do
                i=i+1
                read(11,FMT="(A)") Text
                if ( i.eq.NoRStart+2 ) then
                    do j = 1, NoR
                        !<Schreiben in neue Datei>
                            select case(nProcStat)
                                case(1)
                                print '(10X,A9,I4,1X,1A,1X,I4)' ,'Eintrag: ',j,'/',NoR
                            end select
                            read(11,FMT="(XF10.5,2X,F10.5,2X,F10.5)",iostat=iError) M, Int, Trsh
                            !print*, "M: ", M
                            !print*, "Int: ", Int
                            !print*, "Fehler: ", iError
                            !print*
                            !print*, "Trash: ", Trsh                                                
                        if(iError.gt.0)then
                            ErrVec(nERR)=j
                            nERR=nERR+1
                            Int = 0
                            if(nNORM.eq.1)then
                                NormInt = Int/maxVal
                                if(NormInt.eq.1) maxM=M
                                !print*, "NormInt: ", NormInt
                                write(unit=12,FMT="(F8.1,X,F10.5)") M, NormInt
                             else
                                write(unit=12,FMT="(F8.1,X,F10.5)") M, Int
                            end if
                         else
                            if(nNORM.eq.1)then
                                NormInt = Int/maxVal
                                if(NormInt.eq.1) maxM=M
                                !print*, "NormInt: ", NormInt
                                write(unit=12,FMT="(F8.1,X,F10.5)") M, NormInt
                             else
                                write(unit=12,FMT="(F8.1,X,F10.5)") M, Int
                            end if
                        end if                                    
                    end do
                    exit
                end if
            end do
            !deallocate(ErrVec)
            close(unit=11)
            close(unit=12)
            call CPU_TIME(tend)


            print*, "-----------------------------------------"
            print*, "       Beende Export der Daten!"
            print*, "-----------------------------------------"
        
        !<Report>
            cERR=nERR-1
            tGesamt=tend-tstart
            tMWD=ta-tstart
            tNorm=tb-ta
            tExpo=tend-tb
            ptMWD=(tMWD/tGesamt)*100
            ptNorm=(tNorm/tGesamt)*100
            ptExpo=(tExpo/tGesamt)*100
            ptGesamt=ptMWD+ptNorm+ptExpo
            
            
            print*
            print*, "*********************************************************"
            print*, "*                                                       *"
            print*, "*                 >> EXPORT BERICHT <<                  *"
            print*, "*                                                       *"
            print*, "*                                                       *"
            if(cERR.gt.0) print*, "*--------------------->> Hinweis <<---------------------*"
            if(cERR.gt.0) print*, "*                                                       *"
            if(cERR.gt.0) print*, "*       Eintrag mit einem Wert von kleiner 1E-09        *"
            if(cERR.gt.0) print*, "*          oder groesser 1E+10 wurde ermittelt          *"
            if(cERR.gt.0) print '(1X,A1,7X,A3,I3,1X,A34,7X,A1)','*','und',cERR,'Mal die Intensitaet auf 0 gesetzt!','*'
            if(cERR.gt.0) print*, "*                                                       *"
            i=1
            if(cERR.gt.0) then
                do
                    if(i.eq.nERR) exit
                    !print*, "ErrVec: ", ErrVec(i)
                    print '(1X,A1,12X,I4,A22,I4,13X,A1)','*',i,'. Aenderung in Zeile: ',ErrVec(i),'*'
                    i=i+1
                    !print*, "i_2: ", i,"| nERR: ",nERR
                end do
            end if
            if(cERR.gt.0) print*, "*                                                       *"
            print*, "*--------------------->> Maximum <<---------------------*"
            print*, "*                                                       *"
            print '(1X,A1,11X,A3,1X,F8.1,1X,A13,1X,F10.5,7X,A1)','*','M: ',maxM,'| max. Int.: ',maxVal,'*'
            print*, "*                                                       *"
            print*, "*--------------------->> Zeiten <<----------------------*"
            print*, "*                                                       *"
            print '(1X,A17,6X,F5.3,1X,1A,1X,F5.1,1X,A1,18X,A1)','*  MWD-Suche [s]: ',tMWD,'|',ptMWD,'%','*'
            print '(1X,A22,1X,F5.3,1X,1A,1X,F5.1,1X,A1,18X,A1)','*  max.Int.-Suche [s]: ',tNorm,'|',ptNorm,'%','*'
            print '(1X,A14,9X,F5.3,1X,1A,1X,F5.1,1X,A1,18X,A1)','*  Export [s]: ',tExpo,'|',ptExpo,'%','*'
            print*, "*_______________________________________________________*"
            print '(1X,A15,8X,F5.3,1X,1A,1X,F5.1,1X,A1,18X,A1)','*  Gesammt [s]: ',tGesamt,'|',ptGesamt,'%','*'
            print*, "*-------------------------------------------------------*"
            print*, "*                                                       *"
            print*, "*           >> EXPORT ERFOLGREICH BEENDET! <<           *"
            print*, "*                                                       *"
            print*, "*********************************************************"
            deallocate(ErrVec)
            return

end subroutine GPC

subroutine Stus(DataTyp,DTZ,NORM,nDataTyp,nDTZ,nNORM,nProcStat,ProcStat)
    implicit none
    !<IO/Variabel>
        character(len=4) :: DataTyp ! Dateityp
        character(len=3) :: DTZ ! Dezimaltrennzeichen
        character(len=8) :: NORM, ProcStat ! Normierung, Prozess/Übertragungsstatus

    !<Variabel>
        integer :: nDataTyp, nDTZ, nNORM, nProcStat ! Einlese Integer zur Bestimmung des Status

    !<Code>
        open(unit=11,file=".\opt.dat",form="formatted",status="old",action="read")
        read(11,FMT="(I1,X,I1,X,I1,X,I1)") nDataTyp, nDTZ, nNORM, nProcStat
        close(unit=11)
        !print*, nDataTyp
        !print*, nDTZ
        !print*, nNORM
        !<Dateityp>
            if(nDataTyp.eq.1) DataTyp = ".txt"
            if(nDataTyp.eq.2) DataTyp = ".dat"
            if(nDataTyp.eq.3) DataTyp = ".xls"
        !<Dezimaltrennzeichen>
            if(nDTZ.eq.0) DTZ = "[.]"
            if(nDTZ.eq.1) DTZ = "[,]"
        !<Normierung>
            if(nNORM.eq.0) NORM = "on/[OFF]"
            if(nNORM.eq.1) NORM = "[ON]/off"
        !<Prozessstatus>
            if(nProcStat.eq.0) ProcStat = "on/[OFF]"
            if(nProcStat.eq.1) ProcStat = "[ON]/off"
end subroutine Stus

subroutine Optionen()
    implicit none
    !<IO/Variabel>
        character(len=4) :: DataTyp ! Dateityp
        character(len=3) :: DTZ ! Dezimaltrennzeichen
        character(len=8) :: NORM, ProcStat ! Normierung, Prozess/Übertragungsstatus

    !<Variabel>
        integer :: nDataTyp, nDTZ, nNORM, nProcStat ! Einlese Integer zur Bestimmung des Status
        integer :: InA, InB, InC, InD ! Input  

    !<Code>
        do
            call Stus(DataTyp,DTZ,NORM,nDataTyp,nDTZ,nNORM,nProcStat,ProcStat)
            print*
            print*, "********************************************************"
            print*, "*                                                      *"
            print*, "*                    >> Optionen <<                    *"
            print*, "*                                                      *"
            print*, "********************************************************"
            print*, "*                                                      *"
            print*, "*      ++++++++++++++++++++++++++++++++++++++++++      *"
            print*, "*      |          Aktive Einstellungen          |      *"
            print*, "*      |----------------------------------------|      *"
            print*, "*      | Dateityp: ",DataTyp," | Normierung: ",NORM,"  |      *"
            print*, "*      |        Dezimaltrennzeichen: ", DTZ,"        |      *"
            print*, "*      |   Zeige Uebertragungsstatus: ",ProcStat,"  |      *"
            print*, "*      ++++++++++++++++++++++++++++++++++++++++++      *"
            print*, "*                                                      *"
            print*, "*                   >> Aengerung <<                    *"
            print*, "*        [1] - Dateityp | [2] - Dezimaltrennung        *"
            print*, "*      [3] - Normierung | [4] - Uebertragungsstatus    *"
            print*, "*                                                      *"
            print*, "*------------------------------------------------------*"
            print*, "*                [0] - Zurueck ins Home                *"
            print*, "*------------------------------------------------------*"
            print*, "             WEITER MIT EINGABE EINER ZAHL!"
            read(*,*) InA
            if(InA.eq.1) then
                print*
                print*, "      ++++++++++++++++++++< Aengerung Dateityp >++++++++++++++++++++"
                print*, "      | [1] - Text [.txt] | [2] - Data [.dat] | [3] - Excel [.xls] |"
                print*, "      ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
                read(*,*) InB
                if(InB.eq.1) nDataTyp = 1
                if(InB.eq.2) nDataTyp = 2
                if(InB.eq.3) nDataTyp = 3
            end if
            if(InA.eq.2) then
                print*
                print*, "      ++++< Aengerung Dezimaltrennung >++++"
                print*, "      | [1] - Punkt [.] | [2] - Komma [,] |"
                print*, "      +++++++++++++++++++++++++++++++++++++"
                read(*,*) InC
                if(InC.eq.1) nDTZ = 0
                if(InC.eq.2) nDTZ = 1
            end if
            if(InA.eq.3) then
                print*
                print*, "      ++++< Aengerung Normierung >++++"
                print*, "      |     [1] - An | [2] - Aus     |"
                print*, "      ++++++++++++++++++++++++++++++++"
                read(*,*) InD
                if(InD.eq.1) nNORM = 1
                if(InD.eq.2) nNORM = 0
            end if
            if(InA.eq.4) then
                print*
                print*, "      ++++< Aengerung Uebertragungsstatus >++++"
                print*, "      |         [1] - An | [2] - Aus          |"
                print*, "      +++++++++++++++++++++++++++++++++++++++++"
                read(*,*) InD
                if(InD.eq.1) nProcStat = 1
                if(InD.eq.2) nProcStat = 0
            end if

            !<Überschreiben der Einstellungen>
            open(unit=11,file=".\opt.dat",form="formatted",status="replace",action="write")
            write(11,FMT="(I1,X,I1,X,I1,X,I1)") nDataTyp, nDTZ, nNORM, nProcStat
            close(unit=11)

            if(InA.eq.0) exit
        end do
 
end subroutine Optionen

subroutine InputCheck(nDataTyp,nDTZ,nNORM,nProcStat,Input,DatName,nMulti)
    implicit none
    !<IO/Variabel>
    integer :: iError ! Einlesefehler
    integer :: nDataTyp, nDTZ, nNORM, nProcStat, Input, nMulti ! Einlese Integer zur Bestimmung des Status
    real*8 :: Exit
    character(len=80) :: DatName ! Name der Datei

    !<Code>
        !<Eingabe>
            select case(nMulti)
             case(1)
                print*
                print*, "========================================================"
                print*, "               Starte Export von ",DatName
                print*, "========================================================"
             case(2)
                print*
                print*, "*********************************************************"
                print*, "                BITTE DATEINAME EINGEBEN!"
                read(*,*) DatName
            end select    
        
        !<Check> Öffnen der Datei um zu Überprüfen ob Vorhanden
            select case(Input)
             case(3) !<GPC>
                open(unit=11,file=".\In\"//trim(DatName)//".txt",form="formatted",status="old",action="read",iostat=iError)
             case(4) !<Fluoreszenz>
                open(unit=11,file=".\In\"//trim(DatName)//".sp",form="formatted",status="old",action="read",iostat=iError)
             case(5) !<UV/Vis>
                open(unit=11,file=".\In\"//trim(DatName)//".dsp",form="formatted",status="old",action="read",iostat=iError)
            end select
            close(unit=11)
            print*
            print*, "<><><><><><><><><><><><><><><><><><><>"
            print*, "|            Suche Datei             |"
            print*, "<><><><><><><><><><><><><><><><><><><>"
            if (iError.gt.0) then
                print*
                print*, "********************************************************"
                print*, "*                    >> WARNUNG! <<                    *"
                print*, "*                                                      *"
                print*, "*              Die Eingabe war inkorrekt!              *"
                print*, "*        Die Datei konnte nicht gefunden werden!       *"
                print*, "*------------------------------------------------------*"
                print*, "*                    Fehlerbehebung                    *"
                print*, "* 1.) Leerzeichen entfernen oder durch '_' ersetzen    *"
                print '(1x,A28,A80)','* 2.) Eingabe ueberpruefen: ',DatName
                print*, "*                                                      *"
                print*, "*------------------------------------------------------*"
                print*, "*              [Zahl] - Zurueck ins Home               *"
                print*, "********************************************************"
                close(unit=15)
                read(*,*) Exit
             else   
                print*
                print*, "---> Datei wurde gefunden!"
                print*
                if(Input.eq.3) call GPC(DatName,nDataTyp,nDTZ,nNORM,nProcStat)
                if(Input.eq.4) call Fluoro(DatName,nDataTyp,nDTZ,nNORM,nProcStat,Input)
                if(Input.eq.5) call UV_Vis(DatName,nDataTyp,nDTZ,nNORM,nProcStat,Input)  
            end if
            return
end subroutine InputCheck

subroutine SucheStart(DatName,NoR)
    implicit none
    !<IO/Variabel>
        integer,intent(out) :: NoR ! Number of Rows / Anzahl der zu übertragenden
        character(len=80),intent(in) :: DatName ! Name der Datei
        character(len=80) :: Text  ! Char zum übertragen von Text

    !<Code>
        open(unit=11,file=".\In\"//trim(DatName)//".txt",form="formatted",status="old",action="read")
        NoR=0
        do
            NoR=NoR+1
            read(11,FMT="(A)") Text
            !print*, Text
            if (Text.eq.'MWDstart :') then
                print*, "  --> MWDstart gefunden!"             
                exit
            end if
        end do
        close(unit=11)
end subroutine SucheStart

subroutine SucheStop(DatName,NoR)
    implicit none
    !<IO/Variabel>
        integer,intent(out) :: NoR ! Number of Rows / Anzahl der zu übertragenden
        character(len=80),intent(in) :: DatName ! Name der Datei 
        character(len=80) :: Text  ! Char zum übertragen von Text

    !<Code>
        open(unit=11,file=".\In\"//trim(DatName)//".txt",form="formatted",status="old",action="read")
        NoR=0
        do
            NoR=NoR+1
            read(11,FMT="(A)") Text
            if (Text.eq.'MWDstop :') then
                print*, "  --> MWDstop gefunden!"             
                exit
            end if
        end do
        close(unit=11)
end subroutine SucheStop

subroutine Norm(DatName,NoR,NorStart,maxVal)
    implicit none
    !<IO/Variabel>
        real*8,intent(out) :: maxVal ! Maximum
        real*8 :: curVal ! Einlesewert
        real*8 :: TrshA, TrshB ! Einlesevariablen für den Müll
    
    !<I/Variabel>
        integer :: NoR, NoRStart ! Number of Rows
        character(len=80) :: DatName ! Dateiname
    
    !<Variabel>
        integer :: i,j ! Laufnummer
        integer :: iError ! Einlesefehler
        character(len=80) :: Text

    !<Code>
        open(unit=11,file=".\In\"//trim(DatName)//".txt",form="formatted",status="old",action="read")
        i=0
        do
            i=i+1
            read(11,FMT="(A)") Text
            if ( i.eq.NoRStart+2 ) then
                do j = 1, NoR
                    read(11,FMT="(XF10.5,2X,F10.5,2X,F10.5)",iostat=iError) TrshA, curVal, TrshB
                    if(iError.gt.0)then
                        curVal=0
                     else
                        if(j.eq.1) maxVal = curVal
                        if(j.gt.1) then
                            if(curVal.gt.maxVal) maxVal = curVal
                        end if
                    end if
                    !print*,"Normierung"
                    !print '(A9,I4,1X,1A,1X,I4)' ,'Eintrag: ',j,'/',NoR
                    !print*,"curVal: ", curVal
                    !print*,"maxVal: ", maxVal
                end do
                exit
            end if
        end do
        close(unit=11)
        print '("   --> Maximum gefunden: ", F10.5)', maxVal
        return

end subroutine Norm

subroutine UV_Vis(DatName,nDataTyp,nDTZ,nNORM,nProcStat,Input)
    implicit none
    !<I/Variabel>
        character(len=80) :: DatName ! Name der Datei
        integer :: nDataTyp, nDTZ, nNORM,nProcStat, Input ! Einlese Integer zur Bestimmung des Status

    !<Variabel>
        integer :: i,j ! Zähler
        integer :: NoR, NoRStart, NoRStop ! Number of Rows / Anzahl der zu übertragenden
        integer :: iError,nERR,cERR ! Einlesefehler
        integer,allocatable :: ErrVec(:) ! Fehlervektor
        integer :: fEntry,tEntry,cEntry,Check ! Einträge im Datensatz | f-file, t-total, c-check
        integer:: LambdaStart,LambdaEnd ! Lambdastart- & Lambdaendwert
        real*4 :: LambdaTicker ! Lambda-Abstand  
        real*8 :: Lambda, Int, NormInt, Trsh, maxVal, maxL !Molare Masse, Intensität, Unnötige Werte, maximaler Wert
        real*4 :: tstart,tend,ta,tb,tc,td ! Zeitmarker
        real*4 :: tGesamt,tData,tCheck,tLambda,tNorm,tExpo ! Zeitrechner
        real*4 :: ptGesamt,ptData,ptCheck,ptLambda,ptNorm,ptExpo ! Zeit-Anteile
        character(len=80) :: Text  ! Char zum übertragen von Text
        character(len=6) :: x
        character(len=3) :: y

    !<Code>
        print*, "<><><><><><><><><><><><><><><><><><><>"
        print*, "|           Prozessstatus            |"
        print*, "|            -> UV/Vis <-            |"
        print*, "<><><><><><><><><><><><><><><><><><><>"

        !<Suche #DATA>
            print*
            print*, "Suche #DATA:"
            call cpu_time(tstart)
            call SucheData(DatName,Input,NoR)
            NoRStart=NoR+1 !Bestimmung der Startreihe zum Übertragen der Daten
            call cpu_time(ta)
            print*
            print*, "Erfasse die Anzahl der Eintraege:"
            call Entries(DatName,Input,NoR,fEntry,tEntry,cEntry)
            Check=cEntry-fEntry
            if(Check.ne.0) then
                print*
                print*, "********************************************************"
                print*, "*                    >> WARNUNG! <<                    *"
                print*, "*                                                      *"
                print*, "*    Die eingetragene Anzahl der Messpunkte stimmt     *"
                print*, "*    nicht mit der tatsaechlichen Anzahl ueberein!     *"
                print*, "*                                                      *"
                print*, "*------------------------------------------------------*"
                print*, "*                Ist=Total-Pos(#DATA)                  *"
                print*, "*     Pos(#DATA):",NoR,"| Total:",tEntry,"    *"
                print*, "*           Soll:",fEntry,"|   Ist:",cEntry,"    *"
                print*, "*------------------------------------------------------*"
                print*, "*                                                      *"
                print*, "*              >> EXPORT ABGEBROCHEN! <<               *"
                print*, "*                                                      *"
                print*, "********************************************************"
                return
            end if
            print '(A7,I3,1X,A19)' ,'   --> ',fEntry,'Eintraege gefunden!'
            call cpu_time(tb)
        
        !<Suche nach Lambda Start- & Endwert mit Ticker>
            print*
            print*, "Suche Lambdawerte:"
            call SucheLambda(DatName,LambdaStart,LambdaEnd,LambdaTicker)
            call cpu_time(tc)

        !<Suche nach max Intensität>
            print*
            print*, "Suche maximale Intensitaet:"
            call NormUF(DatName,NoR,NoRStart,Input,fEntry,maxVal)
            call cpu_time(td)  
            

        !<Übertragen der Daten>
            print*
            print*, "-----------------------------------------"
            print*, "       Starte Export der Daten!"
            print*, "-----------------------------------------"
            !<Anlegen der richtigen Datei>
            open(unit=11,file=".\In\"//trim(DatName)//".dsp",form="formatted",status="old",action="read")
            if(nDataTyp.eq.1) then
                if(nDTZ.eq.1) then
                    open(unit=12, file=".\UV/"//trim(DatName)//".txt",form="formatted",status="replace",action="write", &
                    DECIMAL="COMMA")
                 else
                    open(unit=12, file=".\UV/"//trim(DatName)//".txt",form="formatted",status="replace",action="write")
                end if
            end if
            if(nDataTyp.eq.2) then
                if(nDTZ.eq.1) then
                    open(unit=12, file=".\UV/"//trim(DatName)//".dat",form="formatted",status="replace",action="write", &
                    DECIMAL="COMMA")
                 else
                    open(unit=12, file=".\UV/"//trim(DatName)//".dat",form="formatted",status="replace",action="write")
                end if
            end if
            if(nDataTyp.eq.3) then
                if(nDTZ.eq.1) then
                    open(unit=12, file=".\UV/"//trim(DatName)//".xls",form="formatted",status="replace",action="write", &
                    DECIMAL="COMMA")
                 else
                    open(unit=12, file=".\UV/"//trim(DatName)//".xls",form="formatted",status="replace",action="write")
                end if
            end if
            
            !<Benennung der Spalten>
            x = "Lambda"
            y = "Int"
            write(unit=12,FMT="(AX,A)") x, y

            !<Übertragen+Normierung>
            i=0
            nERR=1
            Lambda=LambdaStart
            allocate(ErrVec(NoR))
            do
                i=i+1
                read(11,FMT="(A)") Text
                if (i.eq.NoR) then
                    do j = 1, fEntry
                        !<Schreiben in neue Datei>
                            select case(nProcStat)
                                case(1)
                                print '(10X,A9,I4,1X,1A,1X,I4)' ,'Eintrag: ',j,'/',fEntry
                            end select
                            read(11,FMT="(F20.14)",iostat=iError) Int
                            if(iError.gt.0)then
                                read(11,FMT="(F17.15)",iostat=iError) Int
                            else
                                if(iError.gt.0)then
                                    read(11,FMT="(F16.14)",iostat=iError) Int
                                else
                                    if(iError.gt.0)then
                                       read(11,FMT="(F15.13)",iostat=iError) Int
                                    else
                                    if(iError.gt.0)then
                                        read(11,FMT="(F14.12)",iostat=iError) Int
                                    else
                                        if(iError.gt.0)then
                                            ErrVec(nERR)=j
                                            nERR=nERR+1
                                            !print*, "Wert kann nicht eingelesen werden und wird uebersprungen!"
                                        end if
                                    end if
                                    end if
                                end if
                            end if
                            !print*, "Lambda: ", Lambda
                            !print*, "Int: ", Int
                            !print*, "Fehler: ", iError
                            !print*
                            if(nNORM.eq.1)then
                                NormInt = Int/maxVal
                                if(NormInt.eq.1) maxL=Lambda
                                !print*, "NormInt: ", NormInt
                                write(unit=12,FMT="(F10.6,X,F20.15)") Lambda, NormInt
                             else
                                write(unit=12,FMT="(F10.6,X,F20.15)") Lambda, Int
                            end if
                            Lambda=Lambda+LambdaTicker                                    
                    end do
                    exit
                end if
            end do
            close(unit=11)
            close(unit=12)
            call CPU_TIME(tend)

            print*, "-----------------------------------------"
            print*, "       Beende Export der Daten!"
            print*, "-----------------------------------------"


    !<Report>
            cERR=nERR-1
            tGesamt=tend-tstart
            tData=ta-tstart
            tCheck=tb-ta
            tLambda=tc-tb
            tNorm=td-tc
            tExpo=tend-td
            ptData=(tData/tGesamt)*100
            ptCheck=(tCheck/tGesamt)*100
            ptLambda=(tLambda/tGesamt)*100
            ptNorm=(tNorm/tGesamt)*100
            ptExpo=(tExpo/tGesamt)*100
            ptGesamt=ptData+ptCheck+ptLambda+ptNorm+ptExpo
            
            print*
            print*, "*********************************************************"
            print*, "*                                                       *"
            print*, "*                 >> EXPORT BERICHT <<                  *"
            print*, "*                                                       *"
            print*, "*                                                       *"
            if(cERR.gt.0) print*, "*--------------------->> Hinweis <<---------------------*"
            if(cERR.gt.0) print*, "*                                                       *"
            if(cERR.gt.0) print*, "*          In folgenden Zeilen konnte der Wert          *"
            if(cERR.gt.0) print*, "*    nicht eingelesen werden und wird uebersprungen!    *"
            if(cERR.gt.0) print*, "*                                                       *"
            i=1
            if(cERR.gt.0) then
                do
                    if(i.eq.nERR) exit
                    !print*, "ErrVec: ", ErrVec(i)
                    print '(1X,A1,12X,I4,A22,I4,13X,A1)','*',i,'. Aenderung in Zeile: ',ErrVec(i),'*'
                    i=i+1
                    !print*, "i_2: ", i,"| nERR: ",nERR
                end do
            end if
            if(cERR.gt.0) print*, "*                                                       *"                                                                       
            print*, "*------------------->> Lambdawerte <<-------------------*"
            print*, "*                                                       *"
            print '(1X,A1,8X,A7,I4,A8,I4,A13,F3.1,8X,A1)' ,'*','Start: ',LambdaStart,'| Ende: ',LambdaEnd, &
            '| Inkrement: ',LambdaTicker,'*'
            print*, "*                                                       *"
            print*, "*--------------------->> Maximum <<---------------------*"
            print*, "*                                                       *"
            print '(1X,A1,10X,A8,1X,F5.1,1X,A13,1X,F9.6,7X,A1)','*','Lambda: ',maxL,'| max. Int.: ',maxVal,'*'
            print*, "*                                                       *"
            print*, "*--------------------->> Zeiten <<----------------------*"
            print*, "*                                                       *"
            print*, "* Bestimmung der Eintraege:                             *"
            print '(1X,A22,1X,F5.3,1X,1A,1X,F5.1,1X,A1,18X,A1)','*  - Suche #Data [s]: ',tData,'|',ptData,'%','*'
            print '(1X,A22,1X,F5.3,1X,1A,1X,F5.1,1X,A1,18X,A1)','*  - Check Daten [s]: ',tCheck,'|',ptCheck,'%','*'
            print '(1X,A22,1X,F5.3,1X,1A,1X,F5.1,1X,A1,18X,A1)','*  - Lambdawerte [s]: ',tLambda,'|',ptLambda,'%','*'
            print '(1X,A22,1X,F5.3,1X,1A,1X,F5.1,1X,A1,18X,A1)','*  max.Int.-Suche [s]: ',tNorm,'|',ptNorm,'%','*'
            print '(1X,A14,9X,F5.3,1X,1A,1X,F5.1,1X,A1,18X,A1)','*  Export [s]: ',tExpo,'|',ptExpo,'%','*'
            print*, "*_______________________________________________________*"
            print '(1X,A15,8X,F5.3,1X,1A,1X,F5.1,1X,A1,18X,A1)','*  Gesammt [s]: ',tGesamt,'|',ptGesamt,'%','*'
            print*, "*-------------------------------------------------------*"
            print*, "*                                                       *"
            print*, "*           >> EXPORT ERFOLGREICH BEENDET! <<           *"
            print*, "*                                                       *"
            print*, "*********************************************************"
            deallocate(ErrVec)
            return

end subroutine UV_Vis

subroutine Fluoro(DatName,nDataTyp,nDTZ,nNORM,nProcStat,Input)
    implicit none
    !<I/Variabel>
        character(len=80) :: DatName ! Name der Datei
        integer :: nDataTyp, nDTZ, nNORM, nProcStat, Input ! Einlese Integer zur Bestimmung des Status

    !<Variabel>
        integer :: i,j ! Zähler
        integer :: NoR, NoRStart, NoRStop ! Number of Rows / Anzahl der zu übertragenden
        integer :: iError,nERR ! Einlesefehler
        integer :: fEntry,tEntry,cEntry,Check ! Einträge im Datensatz | f-file, t-total, c-check  
        real*8 :: Lambda, Int, NormInt, Trsh, maxVal, maxL !Molare Masse, Intensität, Unnötige Werte, maximaler Wert
        real*4 :: tstart,tend,ta,tb,tc ! Zeitmarker
        real*4 :: tGesamt,tData,tCheck,tNorm,tExpo ! Zeitrechner
        real*4 :: ptGesamt,ptData,ptCheck,ptNorm,ptExpo ! Zeitrechner
        character(len=80) :: Text  ! Char zum übertragen von Text
        character(len=6) :: x
        character(len=3) :: y

    !<Code>
        print*, "<><><><><><><><><><><><><><><><><><><>"
        print*, "|           Prozessstatus            |"
        print*, "|         -> Fluoreszenz <-          |"
        print*, "<><><><><><><><><><><><><><><><><><><>"

        !<Suche #DATA>
            print*
            print*, "Suche #DATA:"
            call cpu_time(tstart)
            call SucheData(DatName,Input,NoR)
            NoRStart=NoR+1 !Bestimmung der Startreihe zum Übertragen der Daten
            call cpu_time(ta)
            print*
            print*, "Erfasse die Anzahl der Eintraege:"
            call Entries(DatName,Input,NoR,fEntry,tEntry,cEntry)
            Check=cEntry-fEntry
            if(Check.ne.0) then
                print*
                print*, "********************************************************"
                print*, "*                    >> WARNUNG! <<                    *"
                print*, "*                                                      *"
                print*, "*    Die eingetragene Anzahl der Messpunkte stimmt     *"
                print*, "*    nicht mit der tatsaechlichen Anzahl ueberein!     *"
                print*, "*                                                      *"
                print*, "*------------------------------------------------------*"
                print*, "*                Ist=Total-Pos(#DATA)                  *"
                print*, "*     Pos(#DATA):",NoR,"| Total:",tEntry,"    *"
                print*, "*           Soll:",fEntry,"|   Ist:",cEntry,"    *"
                print*, "*------------------------------------------------------*"
                print*, "*                                                      *"
                print*, "*              >> EXPORT ABGEBROCHEN! <<               *"
                print*, "*                                                      *"
                print*, "********************************************************"
                return
            end if
            print '(A7,I3,1X,A19)' ,'   --> ',fEntry,'Eintraege gefunden!'
            call cpu_time(tb)

        !<Suche nach max Intensität>
            print*
            print*, "Suche maximale Intensitaet:"
            call NormUF(DatName,NoR,NoRStart,Input,fEntry,maxVal)
            call cpu_time(tc)  
            

        !<Übertragen der Daten>
            print*
            print*, "-----------------------------------------"
            print*, "       Starte Export der Daten!"
            print*, "-----------------------------------------"
            !<Anlegen der richtigen Datei>
            open(unit=11,file=".\In\"//trim(DatName)//".sp",form="formatted",status="old",action="read")
            if(nDataTyp.eq.1) then
                if(nDTZ.eq.1) then
                    open(unit=12, file=".\Fluoreszenz/"//trim(DatName)//".txt",form="formatted",status="replace",action="write", &
                    DECIMAL="COMMA")
                 else
                    open(unit=12, file=".\Fluoreszenz/"//trim(DatName)//".txt",form="formatted",status="replace",action="write")
                end if
            end if
            if(nDataTyp.eq.2) then
                if(nDTZ.eq.1) then
                    open(unit=12, file=".\Fluoreszenz/"//trim(DatName)//".dat",form="formatted",status="replace",action="write", &
                    DECIMAL="COMMA")
                 else
                    open(unit=12, file=".\Fluoreszenz/"//trim(DatName)//".dat",form="formatted",status="replace",action="write")
                end if
            end if
            if(nDataTyp.eq.3) then
                if(nDTZ.eq.1) then
                    open(unit=12, file=".\Fluoreszenz/"//trim(DatName)//".xls",form="formatted",status="replace",action="write", &
                    DECIMAL="COMMA")
                 else
                    open(unit=12, file=".\Fluoreszenz/"//trim(DatName)//".xls",form="formatted",status="replace",action="write")
                end if
            end if
            
            !<Benennung der Spalten>
            x = "Lambda"
            y = "Int"
            write(unit=12,FMT="(AX,A)") x, y

            !<Übertragen+Normierung>
            i=0
            nERR=0
            do
                i=i+1
                read(11,FMT="(A)") Text
                if (i.eq.NoR) then
                    do j = 1, fEntry
                        !<Schreiben in neue Datei>
                            select case(nProcStat)
                                case(1)
                                print '(10X,A9,I4,1X,1A,1X,I4)' ,'Eintrag: ',j,'/',fEntry
                            end select
                            read(11,FMT="(F10.6,X,F9.6,X)",iostat=iError) Lambda, Int
                            !print*, "Lambda: ", Lambda
                            !print*, "Int: ", Int
                            !print*, "Fehler: ", iError
                            !print*
                            if(nNORM.eq.1)then
                                NormInt = Int/maxVal
                                if(NormInt.eq.1) maxL=Lambda
                                !print*, "NormInt: ", NormInt
                                write(unit=12,FMT="(F10.6,X,F9.6)") Lambda, NormInt
                             else
                                write(unit=12,FMT="(F10.6,X,F9.6)") Lambda, Int
                            end if                                    
                    end do
                    exit
                end if
            end do
            close(unit=11)
            close(unit=12)
            call CPU_TIME(tend)

            print*, "-----------------------------------------"
            print*, "       Beende Export der Daten!"
            print*, "-----------------------------------------"


    !<Report>
            tGesamt=tend-tstart
            tData=ta-tstart
            tCheck=tb-ta
            tNorm=tc-tb
            tExpo=tend-tc
            ptData=(tData/tGesamt)*100
            ptCheck=(tCheck/tGesamt)*100
            ptNorm=(tNorm/tGesamt)*100
            ptExpo=(tExpo/tGesamt)*100
            ptGesamt=ptData+ptCheck+ptNorm+ptExpo
            
            print*
            print*, "*********************************************************"
            print*, "*                                                       *"
            print*, "*                  >> EXPORT BERICHT <<                 *"
            print*, "*                                                       *"
            print*, "*                                                       *"
            print*, "*--------------------->> Maximum <<---------------------*"
            print*, "*                                                       *"
            print '(1X,A1,10X,A8,1X,F5.1,1X,A13,1X,F9.6,7X,A1)','*','Lambda: ',maxL,'| max. Int.: ',maxVal,'*'
            print*, "*                                                       *"
            print*, "*--------------------->> Zeiten <<----------------------*"
            print*, "*                                                       *"
            print*, "* Bestimmung der Eintraege:                             *"
            print '(1X,A22,1X,F5.3,1X,1A,1X,F5.1,1X,A1,18X,A1)','*  - Suche #Data [s]: ',tData,'|',ptData,'%','*'
            print '(1X,A22,1X,F5.3,1X,1A,1X,F5.1,1X,A1,18X,A1)','*  - Check Daten [s]: ',tCheck,'|',ptCheck,'%','*'
            print '(1X,A22,1X,F5.3,1X,1A,1X,F5.1,1X,A1,18X,A1)','*  max.Int.-Suche [s]: ',tNorm,'|',ptNorm,'%','*'
            print '(1X,A14,9X,F5.3,1X,1A,1X,F5.1,1X,A1,18X,A1)','*  Export [s]: ',tExpo,'|',ptExpo,'%','*'
            print*, "*_______________________________________________________*"
            print '(1X,A15,8X,F5.3,1X,1A,1X,F5.1,1X,A1,18X,A1)','*  Gesammt [s]: ',tGesamt,'|',ptGesamt,'%','*'
            print*, "*-------------------------------------------------------*"
            print*, "*                                                       *"
            print*, "*           >> EXPORT ERFOLGREICH BEENDET! <<           *"
            print*, "*                                                       *"
            print*, "*********************************************************"
            return

end subroutine Fluoro

subroutine SucheData(DatName,Input,NoR)
    implicit none
    !<IO/Variabel>
        integer,intent(out) :: NoR ! Number of Rows / Anzahl der zu übertragenden
        integer,intent(in) :: Input
        character(len=80),intent(in) :: DatName ! Name der Datei
        
    !<Variabel>
        integer :: iError   
        character(len=80) :: Text  ! Char zum übertragen von Text

    !<Code>
        !<Suche nach #DATA>
            select case(Input)
             case(4) !<Fluoreszenz>
               open(unit=11,file=".\In\"//trim(DatName)//".sp",form="formatted",status="old",action="read",iostat=iError)
             case(5) !<UV/Vis>
               open(unit=11,file=".\In\"//trim(DatName)//".dsp",form="formatted",status="old",action="read",iostat=iError)
            end select
        
            NoR=0
            do
                NoR=NoR+1
                read(11,FMT="(A)") Text
                !print*, Text
                if (Text.eq.'#DATA') then
                    print*, "  --> #DATA gefunden!"
                    exit
                end if
            end do
            close(unit=11)
        
end subroutine SucheData

subroutine SucheLambda(DatName,LambdaStart,LambdaEnd,LambdaTicker)
    implicit none
    !<IO/Variabel>
        integer,intent(out) :: LambdaStart,LambdaEnd ! Lambdastart- & Lambdaendwert
        real*4, intent(out) :: LambdaTicker ! Lambda-Abstand
        character(len=80),intent(in) :: DatName ! Name der Datei
        
    !<Variabel>
        integer :: iError, LRow, i   
        character(len=80) :: Text  ! Char zum übertragen von Text

    !<Code>
        !<Suche nm>
            open(unit=11,file=".\In\"//trim(DatName)//".dsp",form="formatted",status="old",action="read",iostat=iError)
            LRow=0
            do
                LRow=LRow+1
                read(11,FMT="(A)") Text
                !print*, Text
                if (Text.eq.'nm') then
                    !print*, "  --> nm gefunden!"
                    !print*, LRow
                    exit
                end if
            end do
            close(unit=11)
        
        !<Suche Lambdawerte>
            open(unit=11,file=".\In\"//trim(DatName)//".dsp",form="formatted",status="old",action="read",iostat=iError)
            i=0
            do
                i=i+1
                !print '(5X,A3,I4,A8,I4)' ,'i: ',i,'/ LRow: ',LRow
                if(i.le.LRow) then
                    read(11,FMT="(A)") Text
                else
                    if (i.eq.LRow+1) read(11, FMT="(I3)") LambdaStart
                    if (i.eq.LRow+2) read(11, FMT="(I3)") LambdaEnd
                    if (i.eq.LRow+3) read(11, FMT="(F3.1)") LambdaTicker
                end if
                if(i.gt.LRow+3) exit 
            end do
            close(unit=11)
            print*, "Lambdawerte gefunden:"
            print '(5X,A7,I4,A8,I4)' ,'Start: ',LambdaStart,'/ Ende: ',LambdaEnd
            print '(5X,A20,F3.1)' ,'in Inkrementen von: ',LambdaTicker
            return

end subroutine SucheLambda

subroutine Entries(DatName,Input,NoR,fEntry,tEntry,cEntry)
    implicit none
    !<IO/Variabel>
        integer,intent(in) :: NoR ! Number of Rows / Anzahl der zu übertragenden
        integer,intent(in) :: Input
        integer,intent(out) :: fEntry,tEntry,cEntry ! Einträge im Datensatz | f-file, t-total, c-check
        character(len=80),intent(in) :: DatName ! Name der Datei
    
    !<Variabel>
        integer :: i ! Laufzahl
        integer :: iError
        integer :: LRow ! Reihe von nm bei UV/Vis-Datensatz 
        integer :: sRoEntry ! Search Row of Entries    
        character(len=80) :: Text  ! Char zum übertragen von Text

    !<Code>
        !<Bestimmung der Gesamtgröße des Datensatz>
            select case(Input)
             case(4) !<Fluoreszenz>
              open(unit=11,file=".\In\"//trim(DatName)//".sp",form="formatted",status="old",action="read",iostat=iError)
             case(5) !<UV/Vis>
              open(unit=11,file=".\In\"//trim(DatName)//".dsp",form="formatted",status="old",action="read",iostat=iError)
            end select

            tEntry=0
            do
                tEntry=tEntry+1
                read(11,FMT="(A)",iostat=iError) Text
                !print*, Text
                if (iError.gt.0) exit
            end do
            close(unit=11)

        !<Bestimmung der Einträge im Datensatz>
            select case(Input)
             case(4) !<Fluoreszenz>
                open(unit=11,file=".\In\"//trim(DatName)//".sp",form="formatted",status="old",action="read")
                i=0
                sRoEntry=NoR-4
                do  
                    i=i+1
                    if(i.eq.sRoEntry) then
                        read(11,FMT="(I3)") fEntry
                        exit
                     else
                        read(11,FMT="(A)") Text
                    end if
                end do
                close(unit=11)
                !<Check der Einträge>
                cEntry=tEntry-NoR-3 ! -3 da 2x leere Spalten + eine Iteration wo erkannt wird dass das Dokument am Ende ist
               
            case(5) !<UV/Vis>
                !<Suche nach nm>
                open(unit=11,file=".\In\"//trim(DatName)//".dsp",form="formatted",status="old",action="read",iostat=iError)
                LRow=0
                do
                    LRow=LRow+1
                    read(11,FMT="(A)") Text
                    !print*, Text
                    if (Text.eq.'nm') then
                        !print*, "  --> nm gefunden!"
                        !print*, LRow
                        exit
                    end if
                end do
                close(unit=11)

                open(unit=11,file=".\In\"//trim(DatName)//".dsp",form="formatted",status="old",action="read",iostat=iError)
                i=0
                sRoEntry=LRow+4
                do  
                    i=i+1
                    if(i.eq.sRoEntry) then
                        read(11,FMT="(I3)") fEntry
                        exit
                     else
                        read(11,FMT="(A)") Text
                    end if
                end do
                close(unit=11)
                !<Check der Einträge>
                cEntry=tEntry-NoR-2 ! -2 da je 1x leere Spalten + Iteration wo erkannt wird dass das Dokument am Ende ist
           end select
           return

end subroutine Entries

subroutine NormUF(DatName,NoR,NoRStart,Input,fEntry,maxVal)
    implicit none
    !<IO/Variabel>
        real*8,intent(out) :: maxVal ! Maximum
    
    !<I/Variabel>
        integer,intent(in) :: Input
        integer :: NoR, NoRStart,fEntry ! Number of Rows/Einträge
        character(len=80) :: DatName ! Dateiname
    
    !<Variabel>
        integer :: i,j ! Laufnummer
        integer :: iError ! Einlesefehler
        real*8 :: curVal ! Einlesewert
        real*8 :: TrshA, TrshB ! Einlesevariablen für den Müll
        real, allocatable:: ErrVec(:) ! Fehler Vektor
        character(len=80) :: Text

    !<Code>
        !<Auswahl ob Fl oder UV>
        select case(Input)
         case(4) !<Fluoreszenz>
          open(unit=11,file=".\In\"//trim(DatName)//".sp",form="formatted",status="old",action="read",iostat=iError)
         case(5) !<UV/Vis>
          open(unit=11,file=".\In\"//trim(DatName)//".dsp",form="formatted",status="old",action="read",iostat=iError)
        end select

        !<Reset aller Variablen>
        i=0
        maxVal=0
        curVal=0
        do
            i=i+1
            read(11,FMT="(A)") Text
            if (i.eq.NoR) then
                do j = 1, fEntry                                        
                    select case(Input)
                     case(4) !<Fluoreszenz>
                        read(11,FMT="(F10.6,X,F9.6)",iostat=iError) TrshA, curVal
                     case(5) !<UV/Vis>
                        read(11,FMT="(F20.14)",iostat=iError) curVal
                        if(iError.gt.0)then
                            read(11,FMT="(F17.15)",iostat=iError) curVal
                            if(iError.gt.0)then
                                read(11,FMT="(F16.14)",iostat=iError) curVal
                                if(iError.gt.0)then
                                   read(11,FMT="(F15.13)",iostat=iError) curVal
                                if(iError.gt.0)then
                                    read(11,FMT="(F14.12)",iostat=iError) curVal
                                    if(iError.gt.0)then
                                        !print*, "Loop 6 | Zeile: ", j
                                        !print*, "Wert kann nicht eingelesen werden und wird uebersprungen!"
                                    end if
                                end if
                                end if
                            end if
                        end if
                    end select
                    
                    if(j.eq.1) maxVal = curVal
                    if(j.gt.1) then
                        if(curVal.gt.maxVal) maxVal = curVal
                    end if
                    !print*," -->> Normierung <<--"
                    !print*,"Eintrag:", j
                    !print*,"Trash: ", TrshA
                    !print*,"curVal: ", curVal
                    !print*,"maxVal: ", maxVal
                end do
                exit
            end if
        end do
        close(unit=11)
        print '("   --> Maximum gefunden: ", F9.6)', maxVal
        return 

end subroutine NormUF

subroutine MultiExpo(nDataTyp,nDTZ,nNORM,nProcStat,Input,nMulti)
    implicit none
    !<IO/Variabel>
        integer :: nDataTyp, nDTZ, nNORM, nProcStat, Input, nMulti ! Einlese Integer zur Bestimmung des Status
        real*8 :: Exit
        character(len=80) :: DatName ! Name der Datei

    !<IO/Variabel>
        integer :: i,j,k ! Zähler
        integer :: nEntries
        real*8 :: Progress ! Prozessfortschritt


    !<Code>
        print*
        print*, "======================================================"
        print*, "|      Wie viele Dateien sollen genutzt werden?      |"
        print*, "======================================================"
        print*, "                  BITTE ZAHL EINGEBEN!"
        read(*,*) nEntries
        
        ! Einlesen der Datennamen
        open(unit=11,file=".\MultiExpo.dat",form="formatted",status="replace",action="write")
        i=0
        j=1   
        do i = 0, nEntries-1 
            print*
            print*,j,". Dateiname"
            read(*,*) DatName
            write(unit=11,FMT="(40A)") trim(DatName)
            j=j+1
        end do
        close(unit=11)
        
        ! Übergeben der Datennamen an Inputcheck
        open(unit=15,file=".\MultiExpo.dat",form="formatted",action="read")
        i=0
       do i = 0, nEntries-1
        read(15,*) DatName
        call InputCheck(nDataTyp,nDTZ,nNORM,nProcStat,Input,DatName,nMulti)
       end do
       close(unit=15)

       return
end subroutine MultiExpo