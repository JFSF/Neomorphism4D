unit uNeoCtrls;

interface

uses
  System.Classes,
  System.Types,
  System.SysUtils,
  Winapi.CommCtrl,
  Winapi.Windows,
  Winapi.Messages,
  Winapi.RichEdit,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Themes,
  Vcl.ImgList,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.CheckLst,
  Vcl.ToolWin,
  Vcl.GraphUtil,
  Vcl.Menus,
  Vcl.ComCtrls,
  Vcl.Mask,
  uNeoDrawUtils;

type
  TNeoDrawTextMode = ( dtmGDI, dtmGDIPlus );

  TNeoCustomControl = class( TCustomControl )
    private
      FStopEraseBackground                                         : Boolean;
      FromWMPaint                                                  : Boolean;

    protected
      FFullUpadting                                                : Boolean;
      FUseOnlyParentBackground                                     : Boolean;
      ParentBGBuffer                                               : TBitmap;
      FBlurBackground                                              : Boolean;
      FBlurBrackgroundAmount                                       : Integer;
      FStorePaintBuffer                                            : Boolean;
      FDrawOnBackground                                            : Boolean;
      FTransparentBackground                                       : Boolean;
      FDrawInClientRect                                            : Boolean;
      FScaleFactor                                                 : Integer;
      FScalePercent                                                : Integer;
      FOnChangeScale                                               : TNotifyEvent;
      FUpdateParentBuffer                                          : Boolean;
      FBackgroundLeft                                              : Integer;
      FBackgroundTop                                               : Integer;
      FFluentUIOpaque                                              : Boolean;
      FDrawTextMode                                                : TNeoDrawTextMode;

      procedure SetDrawTextMode( Value                             : TNeoDrawTextMode );
      procedure SetFluentUIOpaque( Value                           : Boolean );
      procedure SetBlurBackground( Value                           : Boolean );
      procedure SetBlurBackgroundAmount( Value                     : Integer );
      procedure SetTransparentBackground( Value                    : Boolean ); virtual;
      procedure ChangeScale( M : Integer; D : Integer; isDPIChange : Boolean ); override;
      procedure GetParentBG; virtual;
      procedure CMEnabledChanged( var Message : TMessage ); message CM_ENABLEDCHANGED;

      function  IsFluentUIOpaque                                   : Boolean;
      function  CanDrawOnBackground                                : Boolean;

  end;

implementation

end.
