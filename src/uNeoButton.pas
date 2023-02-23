unit uNeoButton;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Types,
  System.UITypes,
  Winapi.Windows,
  Winapi.Messages,
  Winapi.GDIPOBJ,
  Winapi.GDIPAPI,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ImgList,
  Vcl.Buttons,
  uNeoCtrls;

type
  TNeoButtonShape = ( btnshpRect, btnshpRndRect );

  TNeoButtonOptions = class( TPersistent )
    protected
      // Cores do botão
      FNormalColor                               : TColor;
      FFocusColor                                : TColor;
      FHotColor                                  : TColor;
      FDisableColor                              : TColor;
      FPressedColor                              : TColor;

      // Cores da borda do botão
      FFrameNormalColor                          : TColor;
      FFrameFocusColor                           : TColor;
      FFrameHotColor                             : TColor;
      FFrameDisableColor                         : TColor;
      FFramePressedColor                         : TColor;

      // Cores da fonte do texto
      FFontNormalColor                           : TColor;
      FFontFocusColor                            : TColor;
      FFontHotColor                              : TColor;
      FFontDisableColor                          : TColor;
      FFontPressedColor                          : TColor;

      // Espessura da borda
      FFrameWidth                                : Integer;

      // Canal Alpha do botão
      FNormalColorAlpha                          : Byte;
      FFocusColorAlpha                           : Byte;
      FHotColorAlpha                             : Byte;
      FDisableColorAlpha                         : Byte;
      FPressedColorAlpha                         : Byte;

      // Canal Alpha da borda
      FFrameNormalColorAlpha                     : Byte;
      FFrameFocusColorAlpha                      : Byte;
      FFrameHotColorAlpha                        : Byte;
      FFrameDisableColorAlpha                    : Byte;
      FFramePressedColorAlpha                    : Byte;

      // Canal Alpha da font
      FFontNormalColorAlpha                      : Byte;
      FFontFocusColorAlpha                       : Byte;
      FFontHotColorAlpha                         : Byte;
      FFontDisableColorAlpha                     : Byte;
      FFontPressedColorAlpha                     : Byte;

      // Radius dos cantos da borda
      FShapeCornerRadius                         : Integer;

      FOnChange                                  : TNotifyEvent;

      procedure SetShapeCornerRadius( Value      : Integer );

      procedure SetNormalColor( Value            : TColor );
      procedure SetFocusColor( Value             : TColor );
      procedure SetHotColor( Value               : TColor );
      procedure SetDisableColor( Value           : TColor );
      procedure SetPressedColor( Value           : TColor );

      procedure SetNormalColorAlpha( Value       : Byte );
      procedure SetFocusColorAlpha( Value        : Byte );
      procedure SetHotColorAlpha( Value          : Byte );
      procedure SetDisableColorAlpha( Value      : Byte );
      procedure SetPressedColorAlpha( Value      : Byte );

      procedure SetFrameNormalColor( Value       : TColor );
      procedure SetFrameFocusColor( Value        : TColor );
      procedure SetFrameHotColor( Value          : TColor );
      procedure SetFrameDisableColor( Value      : TColor );
      procedure SetFramePressedColor( Value      : TColor );

      procedure SetFrameNormalColorAlpha( Value  : Byte );
      procedure SetFrameFocusColorAlpha( Value   : Byte );
      procedure SetFrameHotColorAlpha( Value     : Byte );
      procedure SetFrameDisableColorAlpha( Value : Byte );
      procedure SetFramePressedColorAlpha( Value : Byte );

      procedure SetFrameWidth( Value             : Integer );

      procedure SetFontNormalColor( Value        : TColor );
      procedure SetFontFocusColor( Value         : TColor );
      procedure SetFontHotColor( Value           : TColor );
      procedure SetFontDisableColor( Value       : TColor );
      procedure SetFontPressedColor( Value       : TColor );

      procedure SetFontNormalColorAlpha( Value   : Byte );
      procedure SetFontFocusColorAlpha( Value    : Byte );
      procedure SetFontHotColorAlpha( Value      : Byte );
      procedure SetFontDisableColorAlpha( Value  : Byte );
      procedure SetFontPressedColorAlpha( Value  : Byte );

      function  GetColor                         : TColor;
      function  GetFrameColor                    : TColor;
      function  GetFontColor                     : TColor;
      function  GetDisableColor                  : TColor;
      function  GetPressedColor                  : TColor;

      function  GetColorAlpha                    : Byte;
      function  GetFrameColorAlpha               : Byte;
      function  GetFontColorAlpha                : Byte;
      function  GetDisableColorAlpha             : Byte;
      function  GetPressedColorAlpha             : Byte;

    public
      constructor Create; virtual;

      procedure Assign( Source                   : TPersistent ); override;

      procedure Changed;

      property Color                             : TColor read GetColor;
      property FrameColor                        : TColor read GetFrameColor;
      property FontColor                         : TColor read GetFontColor;
      property ColorAlpha                        : Byte   read GetColorAlpha;

    published
      property NormalColor                       : TColor  read FNormalColor            write SetNormalColor;
      property FocusColor                        : TColor  read FFocusColor             write SetFocusColor;
      property HotColor                          : TColor  read FHotColor               write SetHotColor;
      property DisableColor                      : TColor  read FDisableColor           write SetDisableColor;
      property PressedColor                      : TColor  read FPressedColor           write SetPressedColor;

      property NormalColorAlpha                  : Byte    read FNormalColorAlpha       write SetNormalColorAlpha;
      property FocusColorAlpha                   : Byte    read FFocusColorAlpha        write SetFocusColorAlpha;
      property HotColorAlpha                     : Byte    read FHotColorAlpha          write SetHotColorAlpha;
      property DisableColorAlpha                 : Byte    read FDisableColorAlpha      write SetDisableColorAlpha;
      property PressedColorAlpha                 : Byte    read FPressedColorAlpha      write SetPressedColorAlpha;

      property FrameNormalColor                  : TColor  read FFrameNormalColor       write SetFrameNormalColor;
      property FrameFocusColor                   : TColor  read FFrameFocusColor        write SetFrameFocusColor;
      property FrameHotColor                     : TColor  read FFrameHotColor          write SetFrameHotColor;
      property FrameDisableColor                 : TColor  read FFrameDisableColor      write SetFrameDisableColor;
      property FramePressedColor                 : TColor  read FFramePressedColor      write SetFramePressedColor;

      property FrameNormalColorAlpha             : Byte    read FFrameNormalColorAlpha  write SetFrameNormalColorAlpha;
      property FrameFocusColorAlpha              : Byte    read FFrameFocusColorAlpha   write SetFrameFocusColorAlpha;
      property FrameHotColorAlpha                : Byte    read FFrameHotColorAlpha     write SetFrameHotColorAlpha;
      property FrameDisableColorAlpha            : Byte    read FFrameDisableColorAlpha write SetFrameDisableColorAlpha;
      property FramePressedColorAlpha            : Byte    read FFramePressedColorAlpha write SetFramePressedColorAlpha;

      property FrameWidth                        : Integer read FFrameWidth             write SetFrameWidth;

      property FontNormalColor                   : TColor  read FFontNormalColor        write SetFontNormalColor;
      property FontFocusColor                    : TColor  read FFontFocusColor         write SetFontFocusColor;
      property FontHotColor                      : TColor  read FFontHotColor           write SetFontHotColor;
      property FontDisableColor                  : TColor  read FFontDisableColor       write SetFontDisableColor;
      property FontPressedColor                  : TColor  read FFontPressedColor       write SetFontPressedColor;

      property FontNormalColorAlpha              : Byte    read FFontNormalColorAlpha   write SetFontNormalColorAlpha;
      property FontFocusColorAlpha               : Byte    read FFontFocusColorAlpha    write SetFocusColorAlpha;
      property FontHotColorAlpha                 : Byte    read FFontHotColorAlpha      write SetFontHotColorAlpha;
      property FontDisableColorAlpha             : Byte    read FFontDisableColorAlpha  write SetFontDisableColorAlpha;
      property FontPressedColorAlpha             : Byte    read FFontPressedColorAlpha  write SetFontPressedColorAlpha;

      property ShapeCornerRadius                 : Integer read FShapeCornerRadius      write SetShapeCornerRadius;

      property OnChange                          : TNotifyEvent read FOnChange          write FOnChange;
  end;

//  TNeoButton = class()
//
//  end;


implementation

end.
