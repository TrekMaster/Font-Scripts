#tag Class
Protected Class FontScripts
	#tag Method, Flags = &h21
		Private Function CharToUTF32(Char as String) As UInt32
		  Char = Char.DefineEncoding( Encodings.UTF8 ).ConvertEncoding( Encodings.UTF32 )
		  Return Char.Asc
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(FontName as String)
		  CurrentFont = FontName
		  
		  NSFontClass = NSClassFromString( "NSFont" )
		  
		  NSFont = NSFont_withName( NSFontClass, FontName, 0 )
		  CharacterSet = NSFont_coveredCharacterSet( NSFont )
		  
		  SizingPicture = New Picture( 10, 10 )
		  SizingPicture.Graphics.FontName = FontName
		  SizingPicture.Graphics.FontSize = 12
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function KnownScripts() As String()
		  // European Scripts
		  Const Latin_A As String = "Aa"
		  Const Armenian_Ayb As String = &u0531 + &u0561
		  Const Carian_A As String = &u102A0
		  Const Caucasian_Albanian_ALT As String = &u10530 // "𐔰"
		  Const Cyrillic_BE As String = &u0411 // "Б"
		  Const Cypriot_Syllabary_A As String = &u10800
		  Const Cypro_Minoan_CM001 As String = &u12F90
		  Const Elbasan_A As String = &u10500 // "𐔀"
		  Const Georgian_AN As String = &u10D0 // "ა"
		  Const Glagolitic_AZU As String = &u2C00 + &u2C30 // "Ⰰⰰ"
		  Const Gothic_AHSA As String = &u10330
		  Const Greek_PhiDelta As String = &u03A6 + &u03B3
		  Const LinearA_AB001 As String = &u10600 // "𐘀"
		  Const Lycian_A As String = &u10280 // "𐊀"
		  Const Lydian_A As String = &u10920
		  Const Ogham_BEITH As String = &u1681 // "ᚁ"
		  Const OldHungarian_A As String = &u10CC0 + &u10C80
		  Const OldItalic_A As String = &u10300 // "𐌀"
		  Const OldPermic_AN As String = &u10350 // "𐍐"
		  Const PhaistosDisc_PEDESTRIAN As String = &u101D0
		  Const Runic_A As String = &u16A0 // "ᚠ"
		  Const Shavian_KICK As String = &u10452 // "𐑒"
		  Const Vithkuqi_A As String = &u10570 + &u10597
		  
		  // African Scripts
		  Const Adlam_ALIF As String = &u1E900
		  Const Bamum_KA As String = &uA6A1 // "ꚡ"
		  Const BassaVah_KA As String = &u16AD1 // "𖫑"
		  Const Coptic_ALFA As String = &u2C80 + &u2C81 // "Ⲁⲁ"
		  Const EgyptianHieroglyphs_A001 As String = &u13000 // "𓀀"
		  Const Ethiopic_Ba As String = &u1260 // "በ"
		  Const Medefaidrin_M As String = &u16E40 + &u16E60
		  Const MendeKikakui_KI As String = &u1E800
		  Const MeroiticCursive_KA As String = &u109B2
		  Const MeroiticHieroglyphs_KA As String = &u10996
		  Const NKo_KA As String = &u07DE
		  Const Osmanya_ALEF As String = &u10480 // "𐒀"
		  Const Tifinagh_YAB As String = &u2D31
		  Const Vai_A As String = &uA549 // "ꕉ"
		  
		  // Middle Eastern Scripts
		  Const AnatolianHieroglyphs_A001 As String = &u14400
		  Const Arabic_Ain As String = &u0639
		  Const Aramaic_ALEPH As String = &u10840
		  Const Avestan_A As String = &u10B00
		  Const Chorasmian_ALEPH As String = &u10FB0
		  Const Cuneiform_A As String = &u12000 // "𒀀"
		  Const Elymaic_ALEPH As String = &u10FE0
		  Const Hatran_ALEPH As String = &u108E0
		  Const Hebrew_Alef As String = &u05D0
		  Const Mandaic_AB As String = &u0841
		  Const Nabataean_ALEPH As String = &u10881
		  Const OldNorthArabian_ALEF As String = &u10A91
		  Const OldSouthArabian_ALEF As String = &u10A71
		  Const PahlaviI_ALEPH As String = &u10B60
		  Const PahlaviP_ALEPH As String = &u10B80
		  Const Palmyrene_ALEPH As String = &u10860
		  Const Parthian_ALEPH As String = &u10B40
		  Const Phoenician_ALF As String = &u10900
		  Const Samaritan_ALAF As String = &u0800
		  Const Syriac_ALAPH As String = &u0710
		  Const Yezidi_SIN As String = &u10E91
		  
		  // Central Asian Scripts
		  Const Manichaean_ALEPH As String = &u10AC0
		  Const Marchen_KA As String = &u11C72 // "𑱲"
		  Const Mongolian_A As String = &u1820 // "ᠠ"
		  Const OldSogdian_ALEPH As String = &u10F00
		  Const OldTurkic_ORKHON_A As String = &u10C00
		  Const OldUyghur_ALEPH As String = &u10F70
		  Const PhagsPa_KA As String = &uA840 // "ꡀ"
		  Const Sogdian_ALEPH As String = &u10F30
		  Const Soyombo_KA As String = &u11A5C
		  Const Tibetan_Ka As String = &u0F40 // "ཀ"
		  Const Zanabazar_KA As String = &u11A0B
		  
		  // South Asian Scripts
		  Const Ahom_KA As String = &u11700
		  Const Bengali_Ka As String = &u0995 // "ক"
		  Const Bhaiksuki_KA As String = &u11C0E // "𑰎"
		  Const Brahmi_KA As String = &u11013 // "𑀓"
		  Const Chakma_KAA As String = &u11107 // "𑄇"
		  Const Devanagari_KA As String = &u0915 // "क"
		  Const DivesAkuru_KA As String = &u1190C
		  Const Dogra_KA As String = &u1180A
		  Const Grantha_KA As String = &u11315 // "𑌕"
		  Const Gujarati_Ka As String = &u0A95 // "ક"
		  Const GunjalaGondi_YA As String = &u11D6C // "𑵬"
		  Const Gurmukhi_Ka As String = &u0A15 // "ਕ"
		  Const Kaithi_KA As String = &u1108D // "𑂍"
		  Const Kannada_KA As String = &u0C95 // "ಕ" 
		  Const Kharoshthi_KA As String = &u10A10
		  Const Khojki_KA As String = &u11208 // "𑈈"
		  Const Khudawadi_KA As String = &u112BA // "𑊺"
		  Const Lepcha_KA As String = &u1C00 // "ᰀ"
		  Const Limbu_KA As String = &u1901 // "ᤁ"
		  Const Mahajani_KA As String = &u11155 // "𑅕"
		  Const Malayalam_Ka As String = &u0D15 // "ക"
		  Const MasaramGondi_KA As String = &u11D0C
		  Const MeeteiMayek_KA As String = &uABC0 // "ꯀ"
		  Const Modi_KA As String = &u1160E // "𑘎"
		  Const Mro_TA As String = &u16A40 // "𖩀"
		  Const Multani_KA As String = &u11284 // "𑊄"
		  Const NagMundari_O As String = &u1E4D0
		  Const Nandinagari_KA As String = &u119AE
		  Const Newa_KA As String = &u1140E // "𑐎"
		  Const Ol_Chiki_LA As String = &u1C5A // "ᱚ"
		  Const Oriya_Ka As String = &u0B15 // "କ"
		  Const Saurashtra_KA As String = &uA892 // "ꢒ"
		  Const Sharada_KA As String = &u11191 // "𑆑"
		  Const Siddham_KA As String = &u1158E // "𑖎"
		  Const Sinhala_KAYANNA As String = &u0D9A // "ක"
		  Const SoraSompeng_SA As String = &u110D0 // "𑃐"
		  Const SylotiNagri_KO As String = &uA807 // "ꠇ"
		  Const Takri_KA As String = &u1168A // "𑚊"
		  Const Tamil_Ka As String = &u0B95 // "க"
		  Const Telugu_Ka As String = &u0C15 // "క"
		  Const Thaana_TTAA As String = &u0798
		  Const Tirhuta_KA As String = &u1148F // "𑒏"
		  Const Toto_PA As String = &u1E290
		  Const Wancho_AA As String = &u1E2C0 // "𞋀"
		  Const WarangCiti_ANG As String = &u118AA // "𑢪"
		  
		  // Southeast Asian Scripts
		  Const Cham_KA As String = &uAA06 // "ꨆ"
		  Const HanifiRohingya_KA As String = &u10D00
		  Const KayahLi_Ka As String = &uA90A // "ꤊ"
		  Const Khmer_Ka As String = &u1780 // "ក"
		  Const Lao_Lo_Loot As String = &u0EA5 // "ລ"
		  Const Mayanmar_Ka As String = &u1000 // "က"
		  Const TaiNewLue_QA As String = &u1980 // "ᦀ"
		  Const NyiakengPuachueHmong_MA As String = &u1E100 // "𞄀"
		  Const PahawhHmong_KEEB As String = &u16B00 // "𖬀"
		  Const PauCinHau_PA As String = &u11AC0
		  Const TaiLe_KA As String = &u1950 // "ᥐ"
		  Const TaiTham_KA As String = &u1A20 // "ᨠ"
		  Const TaiViet_KO As String = &uAA80 // "ꪀ"
		  Const Tangsa_KA As String = &u16AA0
		  Const Thai_KO_KAI As String = &u0E01 // "ก"
		  
		  // Indonesian & Philippine Scripts
		  Const Balinese_KA As String = &u1B13 // "ᬓ"
		  Const Batak_A As String = &u1BC0 // "ᯀ"
		  Const Buginese_KA As String = &u1A00 // "ᨀ"
		  Const Buhid_KA As String = &u1743 // "ᝃ"
		  Const Hanunoo_KA As String = &u1723 // "ᜣ"
		  Const Javanese_A As String = &uA984 // "ꦄ"
		  Const Kawi_KA As String = &u11F12
		  Const Makasar_KA As String = &u11EE0
		  Const Rejang_KA As String = &uA930 // "ꤰ"
		  Const Sundanese_KA As String = &u1B8A // "ᮊ"
		  Const Tagalog_KA As String = &u1703
		  Const Tagbanwa_KA As String = &u1763 // "ᝣ"
		  
		  // East Asian Scripts
		  Const Bopomofo_B As String = &u3106 // "ㄆ"
		  Const Chinese_Han As String = &u6F22 // "漢"
		  Const CJK_Simple As String = &u6C49 // "汉"
		  Const HangulJamo_HIEUH As String = &u1112 // "ᄒ"
		  Const Hiragana_A As String = &u3042 // "あ"
		  Const Katakana_A As String = &u30A2 // "ア"
		  Const Korean_Dong As String = &uB3D9 // "동"
		  Const Lisu_KA As String = &uA4D7 // "ꓗ"
		  Const Miao_BA As String = &u16F01 // "𖼁"
		  Const Nushu_1B19F As String = &u1B19F
		  Const Tangut_17000 As String = &u17000
		  
		  // American Scripts
		  Const Cherokee_TSE As String = &u13E3 + &uABB3
		  Const Deseret_LONG_I As String = &u10400 + &u10428
		  Const Osage_A As String = &u104B0 + &u104D8
		  Const Canadian_Symbolics_NE As String = &u14C0 // "ᓀ"
		  
		  // Symbols etc
		  Const Brail_1345 As String = &u281D // "⠝"
		  
		  Var Charsets() As String = Array( _
		  Latin_A, Armenian_Ayb, Carian_A, Caucasian_Albanian_ALT, Cyrillic_BE, Cypriot_Syllabary_A, Cypro_Minoan_CM001, Elbasan_A, _
		  Georgian_AN, Glagolitic_AZU, Gothic_AHSA, Greek_PhiDelta, LinearA_AB001, Lycian_A, Lydian_A, Ogham_BEITH, OldHungarian_A, _
		  OldItalic_A, OldPermic_AN, PhaistosDisc_PEDESTRIAN, Runic_A, Shavian_KICK, Vithkuqi_A, _
		  _
		  Adlam_ALIF, Bamum_KA, BassaVah_KA, Coptic_ALFA, EgyptianHieroglyphs_A001, Ethiopic_Ba, Medefaidrin_M, MendeKikakui_KI, _
		  MeroiticCursive_KA, MeroiticHieroglyphs_KA, NKo_KA, Osmanya_ALEF, Tifinagh_YAB, Vai_A, _
		  _
		  AnatolianHieroglyphs_A001, Arabic_Ain, Aramaic_ALEPH, Avestan_A, Chorasmian_ALEPH, Cuneiform_A, Elymaic_ALEPH, _
		  Hatran_ALEPH, Hebrew_Alef, Mandaic_AB, Nabataean_ALEPH, OldNorthArabian_ALEF, OldSouthArabian_ALEF, PahlaviI_ALEPH, _
		  PahlaviP_ALEPH, Palmyrene_ALEPH, Parthian_ALEPH, Phoenician_ALF, Samaritan_ALAF, Syriac_ALAPH, Yezidi_SIN, _
		  _
		  Manichaean_ALEPH, Marchen_KA, Mongolian_A, OldSogdian_ALEPH, OldTurkic_ORKHON_A, OldUyghur_ALEPH, PhagsPa_KA, _
		  Sogdian_ALEPH, Soyombo_KA, Tibetan_Ka, Zanabazar_KA, _
		  _
		  Ahom_KA, Bengali_Ka, Bhaiksuki_KA, Brahmi_KA, Chakma_KAA, Devanagari_Ka, DivesAkuru_KA, Dogra_KA, Grantha_KA, Gujarati_Ka, _
		  GunjalaGondi_YA, Gurmukhi_Ka, Kaithi_KA, Kannada_KA, Kharoshthi_KA, Khojki_KA, Khudawadi_KA, Lepcha_KA, Limbu_KA, _
		  Mahajani_KA, Malayalam_Ka, MasaramGondi_KA, MeeteiMayek_KA, Modi_KA, Mro_TA, Multani_KA, NagMundari_O, Nandinagari_KA, _
		  Newa_KA, Ol_Chiki_LA, Oriya_Ka, Saurashtra_KA, Sharada_KA, Siddham_KA, Sinhala_KAYANNA, SoraSompeng_SA, SylotiNagri_KO, _
		  Takri_KA, Tamil_Ka, Telugu_Ka, Thaana_TTAA, Tirhuta_KA, Toto_PA, Wancho_AA, WarangCiti_ANG, _
		  _
		  Cham_KA, HanifiRohingya_KA, KayahLi_Ka, Khmer_Ka, Lao_Lo_Loot, Mayanmar_Ka, TaiNewLue_QA, NyiakengPuachueHmong_MA, _
		  PahawhHmong_KEEB, PauCinHau_PA, TaiLe_KA, TaiTham_KA, TaiViet_KO, Tangsa_KA, Thai_KO_KAI, _
		  _
		  Balinese_KA, Batak_A, Buginese_KA, Buhid_KA, Hanunoo_KA, Javanese_A, Kawi_KA, Makasar_KA, Rejang_KA, Sundanese_KA, _
		  Tagalog_KA, Tagbanwa_KA, Bopomofo_B, Chinese_Han, CJK_Simple, HangulJamo_HIEUH, Hiragana_A, Katakana_A, Korean_Dong, _
		  Lisu_KA, Miao_BA, Nushu_1B19F, Tangut_17000, _
		  _
		  Cherokee_TSE, Deseret_LONG_I, Osage_A, Canadian_Symbolics_NE, _
		  _
		  Brail_1345 _
		  )
		  
		  Return Charsets
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h0, CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit)), Description = 4F5320582031302E30202B
		Declare Function NSCharacterSet_longCharacterIsMember Lib "Foundation" Selector "longCharacterIsMember:" (NSFontInstance as Ptr, CodePoiint32 as UInt32) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function NSClassFromString Lib "Foundation" (className as CFStringRef) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0, CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit)), Description = 4F5320582031302E30202B
		Declare Function NSFont_coveredCharacterSet Lib "AppKit" Selector "coveredCharacterSet" (NSFontInstance as Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0, CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit)), Description = 4F5320582031302E30202B
		Declare Function NSFont_withName Lib "AppKit" Selector "fontWithName:size:" (NSFontClass as Ptr, name as CFStringRef, size as CGFloat) As Ptr
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function SupportsScript(CharacterCode As String) As Boolean
		  // If a Character is supported
		  If NSCharacterSet_longCharacterIsMember( CharacterSet, CharToUTF32( CharacterCode ) ) Then
		    
		    Var xSize, ySize As Integer
		    xSize = SizingPicture.Graphics.TextWidth( CharacterCode.Left( 1 ) )
		    ySize = SizingPicture.Graphics.TextHeight( CharacterCode.Left( 1 ), 100 )
		    
		    Var CharImage As New Picture( xSize, ySize, 32 )
		    CharImage.Graphics.FontName = CurrentFont
		    CharImage.Graphics.FontSize = 12
		    CharImage.Graphics.DrawText( CharacterCode.Left( 1 ), 0, CharImage.Graphics.FontAscent )
		    
		    Var bBlank As Boolean = True
		    Var cColor As Color
		    For nY As Integer = 0 To ySize - 1
		      For nX As Integer = 0 To xSize - 1
		        cColor = CharImage.RGBSurface.Pixel( nX, nY )
		        If cColor <> &cFFFFFF00 And cColor.Alpha <> 255 Then
		          bBlank = False
		          Exit For nY
		        End If
		      Next
		    Next
		    
		    If bBlank Then
		      // Not a real character
		      Return False
		      
		    Else
		      // We have a workable Glyph
		      Return True
		    End If
		    
		  Else
		    // Not supported
		    Return False
		    
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SupportsScript(CodePoint as UInt32) As Boolean
		  Return SupportsScript( Chr( CodePoint ) )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Symbols() As String
		  Var cSymbols As String = ""
		  Var nFound As Integer = 0
		  
		  For i As Integer = &h2700 To &h27FF
		    If SupportsScript( i ) Then
		      cSymbols = cSymbols + Chr( i )
		      
		      nFound = nFound + 1
		      If nFound > 1 Then Exit For
		      
		    End If
		  Next
		  
		  If nFound < 2 Then
		    
		    For i As Integer = &hF021 To &hF0FF
		      If SupportsScript( i ) Then
		        cSymbols = cSymbols + Chr( i )
		        
		        nFound = nFound + 1
		        If nFound > 1 Then Exit For
		        
		      End If
		    Next
		    
		  End If
		  
		  Return cSymbols
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private CharacterSet As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private CurrentFont As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private NSFont As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private NSFontClass As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SizingPicture As Picture
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SizingPicture"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
