; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67242 () Bool)

(assert start!67242)

(declare-fun b!301991 () Bool)

(declare-datatypes ((Unit!21145 0))(
  ( (Unit!21146) )
))
(declare-fun e!216928 () Unit!21145)

(declare-fun lt!437048 () Unit!21145)

(assert (=> b!301991 (= e!216928 lt!437048)))

(declare-datatypes ((array!18290 0))(
  ( (array!18291 (arr!9025 (Array (_ BitVec 32) (_ BitVec 8))) (size!7942 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18290)

(declare-fun a2!948 () array!18290)

(declare-datatypes ((tuple4!1092 0))(
  ( (tuple4!1093 (_1!13201 (_ BitVec 32)) (_2!13201 (_ BitVec 32)) (_3!1503 (_ BitVec 32)) (_4!546 (_ BitVec 32))) )
))
(declare-fun lt!437050 () tuple4!1092)

(declare-fun lt!437049 () tuple4!1092)

(declare-fun arrayRangesEqSlicedLemma!214 (array!18290 array!18290 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21145)

(assert (=> b!301991 (= lt!437048 (arrayRangesEqSlicedLemma!214 a1!948 a2!948 (_1!13201 lt!437049) (_2!13201 lt!437049) (_1!13201 lt!437050) (_2!13201 lt!437050)))))

(declare-fun arrayRangesEq!1604 (array!18290 array!18290 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!301991 (arrayRangesEq!1604 a1!948 a2!948 (_1!13201 lt!437050) (_2!13201 lt!437050))))

(declare-fun b!301992 () Bool)

(declare-fun res!248549 () Bool)

(declare-fun lt!437044 () (_ BitVec 32))

(assert (=> b!301992 (= res!248549 (= lt!437044 #b00000000000000000000000000000000))))

(declare-fun e!216929 () Bool)

(assert (=> b!301992 (=> res!248549 e!216929)))

(declare-fun e!216927 () Bool)

(assert (=> b!301992 (= e!216927 e!216929)))

(declare-fun b!301993 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!301993 (= e!216929 (byteRangesEq!0 (select (arr!9025 a1!948) (_4!546 lt!437049)) (select (arr!9025 a2!948) (_4!546 lt!437049)) #b00000000000000000000000000000000 lt!437044))))

(declare-fun b!301994 () Bool)

(declare-fun e!216933 () Bool)

(declare-fun call!5495 () Bool)

(assert (=> b!301994 (= e!216933 call!5495)))

(declare-fun b!301995 () Bool)

(declare-fun e!216931 () Unit!21145)

(declare-fun lt!437053 () Unit!21145)

(assert (=> b!301995 (= e!216931 lt!437053)))

(declare-fun arrayRangesEqImpliesEq!256 (array!18290 array!18290 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21145)

(assert (=> b!301995 (= lt!437053 (arrayRangesEqImpliesEq!256 a1!948 a2!948 (_1!13201 lt!437049) (_4!546 lt!437050) (_2!13201 lt!437049)))))

(assert (=> b!301995 (= (select (arr!9025 a1!948) (_4!546 lt!437050)) (select (arr!9025 a2!948) (_4!546 lt!437050)))))

(declare-fun b!301996 () Bool)

(declare-fun Unit!21147 () Unit!21145)

(assert (=> b!301996 (= e!216928 Unit!21147)))

(declare-fun b!301997 () Bool)

(declare-fun e!216925 () Unit!21145)

(declare-fun lt!437051 () Unit!21145)

(assert (=> b!301997 (= e!216925 lt!437051)))

(assert (=> b!301997 (= lt!437051 (arrayRangesEqImpliesEq!256 a1!948 a2!948 (_1!13201 lt!437049) (_3!1503 lt!437050) (_2!13201 lt!437049)))))

(assert (=> b!301997 (= (select (arr!9025 a1!948) (_3!1503 lt!437050)) (select (arr!9025 a2!948) (_3!1503 lt!437050)))))

(declare-fun b!301998 () Bool)

(assert (=> b!301998 (= e!216933 e!216927)))

(declare-fun res!248555 () Bool)

(assert (=> b!301998 (= res!248555 call!5495)))

(assert (=> b!301998 (=> (not res!248555) (not e!216927))))

(declare-fun b!301999 () Bool)

(declare-fun res!248554 () Bool)

(declare-fun e!216932 () Bool)

(assert (=> b!301999 (=> (not res!248554) (not e!216932))))

(declare-fun lt!437055 () (_ BitVec 64))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!301999 (= res!248554 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437055) (not (= fromSlice!52 toSlice!52))))))

(declare-fun lt!437054 () (_ BitVec 32))

(declare-fun c!14304 () Bool)

(declare-fun bm!5492 () Bool)

(assert (=> bm!5492 (= call!5495 (byteRangesEq!0 (select (arr!9025 a1!948) (_3!1503 lt!437049)) (select (arr!9025 a2!948) (_3!1503 lt!437049)) lt!437054 (ite c!14304 lt!437044 #b00000000000000000000000000000111)))))

(declare-fun b!302001 () Bool)

(declare-fun e!216934 () Bool)

(assert (=> b!302001 (= e!216934 e!216932)))

(declare-fun res!248553 () Bool)

(assert (=> b!302001 (=> (not res!248553) (not e!216932))))

(assert (=> b!302001 (= res!248553 (and (bvsle toBit!258 lt!437055) (bvsle fromBit!258 lt!437055)))))

(assert (=> b!302001 (= lt!437055 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7942 a1!948))))))

(declare-fun b!302002 () Bool)

(declare-fun e!216924 () Bool)

(assert (=> b!302002 (= e!216932 e!216924)))

(declare-fun res!248552 () Bool)

(assert (=> b!302002 (=> (not res!248552) (not e!216924))))

(assert (=> b!302002 (= res!248552 e!216933)))

(assert (=> b!302002 (= c!14304 (= (_3!1503 lt!437049) (_4!546 lt!437049)))))

(declare-fun lt!437046 () Unit!21145)

(assert (=> b!302002 (= lt!437046 e!216928)))

(declare-fun c!14307 () Bool)

(assert (=> b!302002 (= c!14307 (bvslt (_1!13201 lt!437050) (_2!13201 lt!437050)))))

(declare-fun lt!437047 () (_ BitVec 32))

(assert (=> b!302002 (= lt!437047 ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1092)

(assert (=> b!302002 (= lt!437050 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!302002 (= lt!437044 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302002 (= lt!437054 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302002 (= lt!437049 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!302003 () Bool)

(declare-fun Unit!21148 () Unit!21145)

(assert (=> b!302003 (= e!216931 Unit!21148)))

(declare-fun res!248547 () Bool)

(assert (=> start!67242 (=> (not res!248547) (not e!216934))))

(assert (=> start!67242 (= res!248547 (and (bvsle (size!7942 a1!948) (size!7942 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67242 e!216934))

(assert (=> start!67242 true))

(declare-fun array_inv!7554 (array!18290) Bool)

(assert (=> start!67242 (array_inv!7554 a1!948)))

(assert (=> start!67242 (array_inv!7554 a2!948)))

(declare-fun b!302000 () Bool)

(declare-fun e!216923 () Bool)

(assert (=> b!302000 (= e!216924 e!216923)))

(declare-fun res!248551 () Bool)

(assert (=> b!302000 (=> (not res!248551) (not e!216923))))

(assert (=> b!302000 (= res!248551 (not (= (_3!1503 lt!437050) (_4!546 lt!437050))))))

(declare-fun lt!437052 () Unit!21145)

(assert (=> b!302000 (= lt!437052 e!216931)))

(declare-fun c!14306 () Bool)

(assert (=> b!302000 (= c!14306 (and (bvslt (_4!546 lt!437050) (_4!546 lt!437049)) (bvslt (_3!1503 lt!437049) (_4!546 lt!437050))))))

(declare-fun lt!437045 () Unit!21145)

(assert (=> b!302000 (= lt!437045 e!216925)))

(declare-fun c!14305 () Bool)

(assert (=> b!302000 (= c!14305 (and (bvslt (_3!1503 lt!437049) (_3!1503 lt!437050)) (bvslt (_3!1503 lt!437050) (_4!546 lt!437049))))))

(declare-fun b!302004 () Bool)

(declare-fun res!248550 () Bool)

(assert (=> b!302004 (=> (not res!248550) (not e!216932))))

(declare-fun arrayBitRangesEq!0 (array!18290 array!18290 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302004 (= res!248550 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!302005 () Bool)

(assert (=> b!302005 (= e!216923 (not (byteRangesEq!0 (select (arr!9025 a1!948) (_4!546 lt!437050)) (select (arr!9025 a2!948) (_4!546 lt!437050)) #b00000000000000000000000000000000 lt!437047)))))

(declare-fun b!302006 () Bool)

(declare-fun Unit!21149 () Unit!21145)

(assert (=> b!302006 (= e!216925 Unit!21149)))

(declare-fun b!302007 () Bool)

(declare-fun res!248548 () Bool)

(assert (=> b!302007 (=> (not res!248548) (not e!216923))))

(assert (=> b!302007 (= res!248548 (byteRangesEq!0 (select (arr!9025 a1!948) (_3!1503 lt!437050)) (select (arr!9025 a2!948) (_3!1503 lt!437050)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111))))

(declare-fun b!302008 () Bool)

(declare-fun res!248556 () Bool)

(assert (=> b!302008 (=> (not res!248556) (not e!216923))))

(assert (=> b!302008 (= res!248556 (not (= lt!437047 #b00000000000000000000000000000000)))))

(assert (= (and start!67242 res!248547) b!302001))

(assert (= (and b!302001 res!248553) b!302004))

(assert (= (and b!302004 res!248550) b!301999))

(assert (= (and b!301999 res!248554) b!302002))

(assert (= (and b!302002 c!14307) b!301991))

(assert (= (and b!302002 (not c!14307)) b!301996))

(assert (= (and b!302002 c!14304) b!301994))

(assert (= (and b!302002 (not c!14304)) b!301998))

(assert (= (and b!301998 res!248555) b!301992))

(assert (= (and b!301992 (not res!248549)) b!301993))

(assert (= (or b!301994 b!301998) bm!5492))

(assert (= (and b!302002 res!248552) b!302000))

(assert (= (and b!302000 c!14305) b!301997))

(assert (= (and b!302000 (not c!14305)) b!302006))

(assert (= (and b!302000 c!14306) b!301995))

(assert (= (and b!302000 (not c!14306)) b!302003))

(assert (= (and b!302000 res!248551) b!302007))

(assert (= (and b!302007 res!248548) b!302008))

(assert (= (and b!302008 res!248556) b!302005))

(declare-fun m!440829 () Bool)

(assert (=> b!301997 m!440829))

(declare-fun m!440831 () Bool)

(assert (=> b!301997 m!440831))

(declare-fun m!440833 () Bool)

(assert (=> b!301997 m!440833))

(declare-fun m!440835 () Bool)

(assert (=> b!302002 m!440835))

(declare-fun m!440837 () Bool)

(assert (=> b!302002 m!440837))

(declare-fun m!440839 () Bool)

(assert (=> b!302004 m!440839))

(declare-fun m!440841 () Bool)

(assert (=> b!302005 m!440841))

(declare-fun m!440843 () Bool)

(assert (=> b!302005 m!440843))

(assert (=> b!302005 m!440841))

(assert (=> b!302005 m!440843))

(declare-fun m!440845 () Bool)

(assert (=> b!302005 m!440845))

(declare-fun m!440847 () Bool)

(assert (=> b!301991 m!440847))

(declare-fun m!440849 () Bool)

(assert (=> b!301991 m!440849))

(declare-fun m!440851 () Bool)

(assert (=> start!67242 m!440851))

(declare-fun m!440853 () Bool)

(assert (=> start!67242 m!440853))

(declare-fun m!440855 () Bool)

(assert (=> b!301993 m!440855))

(declare-fun m!440857 () Bool)

(assert (=> b!301993 m!440857))

(assert (=> b!301993 m!440855))

(assert (=> b!301993 m!440857))

(declare-fun m!440859 () Bool)

(assert (=> b!301993 m!440859))

(declare-fun m!440861 () Bool)

(assert (=> bm!5492 m!440861))

(declare-fun m!440863 () Bool)

(assert (=> bm!5492 m!440863))

(assert (=> bm!5492 m!440861))

(assert (=> bm!5492 m!440863))

(declare-fun m!440865 () Bool)

(assert (=> bm!5492 m!440865))

(declare-fun m!440867 () Bool)

(assert (=> b!301995 m!440867))

(assert (=> b!301995 m!440841))

(assert (=> b!301995 m!440843))

(assert (=> b!302007 m!440831))

(assert (=> b!302007 m!440833))

(assert (=> b!302007 m!440831))

(assert (=> b!302007 m!440833))

(declare-fun m!440869 () Bool)

(assert (=> b!302007 m!440869))

(push 1)

(assert (not b!301991))

(assert (not b!302005))

(assert (not bm!5492))

(assert (not b!301995))

(assert (not start!67242))

(assert (not b!301993))

(assert (not b!302007))

(assert (not b!301997))

(assert (not b!302002))

(assert (not b!302004))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!100986 () Bool)

(assert (=> d!100986 (arrayRangesEq!1604 a1!948 a2!948 (_1!13201 lt!437050) (_2!13201 lt!437050))))

(declare-fun lt!437146 () Unit!21145)

(declare-fun choose!544 (array!18290 array!18290 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21145)

(assert (=> d!100986 (= lt!437146 (choose!544 a1!948 a2!948 (_1!13201 lt!437049) (_2!13201 lt!437049) (_1!13201 lt!437050) (_2!13201 lt!437050)))))

(assert (=> d!100986 (and (bvsle #b00000000000000000000000000000000 (_1!13201 lt!437049)) (bvsle (_1!13201 lt!437049) (_2!13201 lt!437049)))))

(assert (=> d!100986 (= (arrayRangesEqSlicedLemma!214 a1!948 a2!948 (_1!13201 lt!437049) (_2!13201 lt!437049) (_1!13201 lt!437050) (_2!13201 lt!437050)) lt!437146)))

(declare-fun bs!26050 () Bool)

(assert (= bs!26050 d!100986))

(assert (=> bs!26050 m!440849))

(declare-fun m!440995 () Bool)

(assert (=> bs!26050 m!440995))

(assert (=> b!301991 d!100986))

(declare-fun d!100988 () Bool)

(declare-fun res!248642 () Bool)

(declare-fun e!217035 () Bool)

(assert (=> d!100988 (=> res!248642 e!217035)))

(assert (=> d!100988 (= res!248642 (= (_1!13201 lt!437050) (_2!13201 lt!437050)))))

(assert (=> d!100988 (= (arrayRangesEq!1604 a1!948 a2!948 (_1!13201 lt!437050) (_2!13201 lt!437050)) e!217035)))

(declare-fun b!302148 () Bool)

(declare-fun e!217036 () Bool)

(assert (=> b!302148 (= e!217035 e!217036)))

(declare-fun res!248643 () Bool)

(assert (=> b!302148 (=> (not res!248643) (not e!217036))))

(assert (=> b!302148 (= res!248643 (= (select (arr!9025 a1!948) (_1!13201 lt!437050)) (select (arr!9025 a2!948) (_1!13201 lt!437050))))))

(declare-fun b!302149 () Bool)

(assert (=> b!302149 (= e!217036 (arrayRangesEq!1604 a1!948 a2!948 (bvadd (_1!13201 lt!437050) #b00000000000000000000000000000001) (_2!13201 lt!437050)))))

(assert (= (and d!100988 (not res!248642)) b!302148))

(assert (= (and b!302148 res!248643) b!302149))

(declare-fun m!440997 () Bool)

(assert (=> b!302148 m!440997))

(declare-fun m!440999 () Bool)

(assert (=> b!302148 m!440999))

(declare-fun m!441001 () Bool)

(assert (=> b!302149 m!441001))

(assert (=> b!301991 d!100988))

(declare-fun d!100990 () Bool)

(assert (=> d!100990 (and (bvsge (_3!1503 lt!437050) #b00000000000000000000000000000000) (bvslt (_3!1503 lt!437050) (size!7942 a1!948)) (bvslt (_3!1503 lt!437050) (size!7942 a2!948)) (= (select (arr!9025 a1!948) (_3!1503 lt!437050)) (select (arr!9025 a2!948) (_3!1503 lt!437050))))))

(declare-fun lt!437149 () Unit!21145)

(declare-fun choose!545 (array!18290 array!18290 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21145)

(assert (=> d!100990 (= lt!437149 (choose!545 a1!948 a2!948 (_1!13201 lt!437049) (_3!1503 lt!437050) (_2!13201 lt!437049)))))

(assert (=> d!100990 (and (bvsle #b00000000000000000000000000000000 (_1!13201 lt!437049)) (bvsle (_1!13201 lt!437049) (_2!13201 lt!437049)))))

(assert (=> d!100990 (= (arrayRangesEqImpliesEq!256 a1!948 a2!948 (_1!13201 lt!437049) (_3!1503 lt!437050) (_2!13201 lt!437049)) lt!437149)))

(declare-fun bs!26051 () Bool)

(assert (= bs!26051 d!100990))

(assert (=> bs!26051 m!440831))

(assert (=> bs!26051 m!440833))

(declare-fun m!441003 () Bool)

(assert (=> bs!26051 m!441003))

(assert (=> b!301997 d!100990))

(declare-fun d!100992 () Bool)

(assert (=> d!100992 (and (bvsge (_4!546 lt!437050) #b00000000000000000000000000000000) (bvslt (_4!546 lt!437050) (size!7942 a1!948)) (bvslt (_4!546 lt!437050) (size!7942 a2!948)) (= (select (arr!9025 a1!948) (_4!546 lt!437050)) (select (arr!9025 a2!948) (_4!546 lt!437050))))))

(declare-fun lt!437150 () Unit!21145)

(assert (=> d!100992 (= lt!437150 (choose!545 a1!948 a2!948 (_1!13201 lt!437049) (_4!546 lt!437050) (_2!13201 lt!437049)))))

(assert (=> d!100992 (and (bvsle #b00000000000000000000000000000000 (_1!13201 lt!437049)) (bvsle (_1!13201 lt!437049) (_2!13201 lt!437049)))))

(assert (=> d!100992 (= (arrayRangesEqImpliesEq!256 a1!948 a2!948 (_1!13201 lt!437049) (_4!546 lt!437050) (_2!13201 lt!437049)) lt!437150)))

(declare-fun bs!26052 () Bool)

(assert (= bs!26052 d!100992))

(assert (=> bs!26052 m!440841))

(assert (=> bs!26052 m!440843))

(declare-fun m!441005 () Bool)

(assert (=> bs!26052 m!441005))

(assert (=> b!301995 d!100992))

(declare-fun d!100994 () Bool)

(assert (=> d!100994 (= (byteRangesEq!0 (select (arr!9025 a1!948) (_3!1503 lt!437049)) (select (arr!9025 a2!948) (_3!1503 lt!437049)) lt!437054 (ite c!14304 lt!437044 #b00000000000000000000000000000111)) (or (= lt!437054 (ite c!14304 lt!437044 #b00000000000000000000000000000111)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9025 a1!948) (_3!1503 lt!437049))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14304 lt!437044 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!437054)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9025 a2!948) (_3!1503 lt!437049))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14304 lt!437044 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!437054)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26053 () Bool)

(assert (= bs!26053 d!100994))

(declare-fun m!441007 () Bool)

(assert (=> bs!26053 m!441007))

(declare-fun m!441009 () Bool)

(assert (=> bs!26053 m!441009))

(assert (=> bm!5492 d!100994))

(declare-fun d!100996 () Bool)

(assert (=> d!100996 (= (array_inv!7554 a1!948) (bvsge (size!7942 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67242 d!100996))

(declare-fun d!100998 () Bool)

(assert (=> d!100998 (= (array_inv!7554 a2!948) (bvsge (size!7942 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67242 d!100998))

(declare-fun d!101000 () Bool)

(assert (=> d!101000 (= (byteRangesEq!0 (select (arr!9025 a1!948) (_4!546 lt!437050)) (select (arr!9025 a2!948) (_4!546 lt!437050)) #b00000000000000000000000000000000 lt!437047) (or (= #b00000000000000000000000000000000 lt!437047) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9025 a1!948) (_4!546 lt!437050))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!437047))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9025 a2!948) (_4!546 lt!437050))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!437047))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26054 () Bool)

(assert (= bs!26054 d!101000))

(declare-fun m!441011 () Bool)

(assert (=> bs!26054 m!441011))

(declare-fun m!441013 () Bool)

(assert (=> bs!26054 m!441013))

(assert (=> b!302005 d!101000))

(declare-fun b!302164 () Bool)

(declare-fun e!217050 () Bool)

(declare-fun e!217052 () Bool)

(assert (=> b!302164 (= e!217050 e!217052)))

(declare-fun res!248654 () Bool)

(assert (=> b!302164 (=> (not res!248654) (not e!217052))))

(declare-fun e!217054 () Bool)

(assert (=> b!302164 (= res!248654 e!217054)))

(declare-fun res!248657 () Bool)

(assert (=> b!302164 (=> res!248657 e!217054)))

(declare-fun lt!437158 () tuple4!1092)

(assert (=> b!302164 (= res!248657 (bvsge (_1!13201 lt!437158) (_2!13201 lt!437158)))))

(declare-fun lt!437159 () (_ BitVec 32))

(assert (=> b!302164 (= lt!437159 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!437157 () (_ BitVec 32))

(assert (=> b!302164 (= lt!437157 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302164 (= lt!437158 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun c!14337 () Bool)

(declare-fun bm!5504 () Bool)

(declare-fun call!5507 () Bool)

(assert (=> bm!5504 (= call!5507 (byteRangesEq!0 (select (arr!9025 a1!948) (_3!1503 lt!437158)) (select (arr!9025 a2!948) (_3!1503 lt!437158)) lt!437157 (ite c!14337 lt!437159 #b00000000000000000000000000001000)))))

(declare-fun d!101002 () Bool)

(declare-fun res!248658 () Bool)

(assert (=> d!101002 (=> res!248658 e!217050)))

(assert (=> d!101002 (= res!248658 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101002 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!217050)))

(declare-fun b!302165 () Bool)

(declare-fun e!217049 () Bool)

(assert (=> b!302165 (= e!217052 e!217049)))

(assert (=> b!302165 (= c!14337 (= (_3!1503 lt!437158) (_4!546 lt!437158)))))

(declare-fun b!302166 () Bool)

(declare-fun e!217051 () Bool)

(assert (=> b!302166 (= e!217051 (byteRangesEq!0 (select (arr!9025 a1!948) (_4!546 lt!437158)) (select (arr!9025 a2!948) (_4!546 lt!437158)) #b00000000000000000000000000000000 lt!437159))))

(declare-fun b!302167 () Bool)

(declare-fun e!217053 () Bool)

(assert (=> b!302167 (= e!217049 e!217053)))

(declare-fun res!248655 () Bool)

(assert (=> b!302167 (= res!248655 call!5507)))

(assert (=> b!302167 (=> (not res!248655) (not e!217053))))

(declare-fun b!302168 () Bool)

(assert (=> b!302168 (= e!217054 (arrayRangesEq!1604 a1!948 a2!948 (_1!13201 lt!437158) (_2!13201 lt!437158)))))

(declare-fun b!302169 () Bool)

(assert (=> b!302169 (= e!217049 call!5507)))

(declare-fun b!302170 () Bool)

(declare-fun res!248656 () Bool)

(assert (=> b!302170 (= res!248656 (= lt!437159 #b00000000000000000000000000000000))))

(assert (=> b!302170 (=> res!248656 e!217051)))

(assert (=> b!302170 (= e!217053 e!217051)))

(assert (= (and d!101002 (not res!248658)) b!302164))

(assert (= (and b!302164 (not res!248657)) b!302168))

(assert (= (and b!302164 res!248654) b!302165))

(assert (= (and b!302165 c!14337) b!302169))

(assert (= (and b!302165 (not c!14337)) b!302167))

(assert (= (and b!302167 res!248655) b!302170))

(assert (= (and b!302170 (not res!248656)) b!302166))

(assert (= (or b!302169 b!302167) bm!5504))

(assert (=> b!302164 m!440837))

(declare-fun m!441015 () Bool)

(assert (=> bm!5504 m!441015))

(declare-fun m!441017 () Bool)

(assert (=> bm!5504 m!441017))

(assert (=> bm!5504 m!441015))

(assert (=> bm!5504 m!441017))

(declare-fun m!441019 () Bool)

(assert (=> bm!5504 m!441019))

(declare-fun m!441021 () Bool)

(assert (=> b!302166 m!441021))

(declare-fun m!441023 () Bool)

(assert (=> b!302166 m!441023))

(assert (=> b!302166 m!441021))

(assert (=> b!302166 m!441023))

(declare-fun m!441025 () Bool)

(assert (=> b!302166 m!441025))

(declare-fun m!441027 () Bool)

(assert (=> b!302168 m!441027))

(assert (=> b!302004 d!101002))

(declare-fun d!101004 () Bool)

(assert (=> d!101004 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1093 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302002 d!101004))

(declare-fun d!101006 () Bool)

(assert (=> d!101006 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1093 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302002 d!101006))

(declare-fun d!101008 () Bool)

(assert (=> d!101008 (= (byteRangesEq!0 (select (arr!9025 a1!948) (_3!1503 lt!437050)) (select (arr!9025 a2!948) (_3!1503 lt!437050)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (or (= ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9025 a1!948) (_3!1503 lt!437050))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9025 a2!948) (_3!1503 lt!437050))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26055 () Bool)

(assert (= bs!26055 d!101008))

(declare-fun m!441029 () Bool)

(assert (=> bs!26055 m!441029))

(declare-fun m!441031 () Bool)

(assert (=> bs!26055 m!441031))

(assert (=> b!302007 d!101008))

(declare-fun d!101010 () Bool)

(assert (=> d!101010 (= (byteRangesEq!0 (select (arr!9025 a1!948) (_4!546 lt!437049)) (select (arr!9025 a2!948) (_4!546 lt!437049)) #b00000000000000000000000000000000 lt!437044) (or (= #b00000000000000000000000000000000 lt!437044) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9025 a1!948) (_4!546 lt!437049))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!437044))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9025 a2!948) (_4!546 lt!437049))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!437044))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26056 () Bool)

(assert (= bs!26056 d!101010))

(declare-fun m!441033 () Bool)

(assert (=> bs!26056 m!441033))

(assert (=> bs!26056 m!441013))

(assert (=> b!301993 d!101010))

(push 1)

(assert (not bm!5504))

(assert (not d!100986))

(assert (not d!100992))

(assert (not b!302164))

(assert (not b!302168))

(assert (not b!302149))

(assert (not b!302166))

(assert (not d!100990))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

