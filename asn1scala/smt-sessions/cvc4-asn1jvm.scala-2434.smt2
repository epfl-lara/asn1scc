; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62020 () Bool)

(assert start!62020)

(declare-fun b!277916 () Bool)

(declare-fun e!197827 () Bool)

(declare-fun e!197825 () Bool)

(assert (=> b!277916 (= e!197827 e!197825)))

(declare-fun res!230822 () Bool)

(assert (=> b!277916 (=> (not res!230822) (not e!197825))))

(declare-datatypes ((tuple4!604 0))(
  ( (tuple4!605 (_1!12377 (_ BitVec 32)) (_2!12377 (_ BitVec 32)) (_3!1082 (_ BitVec 32)) (_4!302 (_ BitVec 32))) )
))
(declare-fun lt!415668 () tuple4!604)

(assert (=> b!277916 (= res!230822 (= (_3!1082 lt!415668) (_4!302 lt!415668)))))

(declare-datatypes ((Unit!19427 0))(
  ( (Unit!19428) )
))
(declare-fun lt!415665 () Unit!19427)

(declare-fun e!197826 () Unit!19427)

(assert (=> b!277916 (= lt!415665 e!197826)))

(declare-fun c!12720 () Bool)

(assert (=> b!277916 (= c!12720 (bvslt (_1!12377 lt!415668) (_2!12377 lt!415668)))))

(declare-fun lt!415664 () (_ BitVec 32))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!277916 (= lt!415664 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!415667 () (_ BitVec 32))

(declare-fun from!822 () (_ BitVec 64))

(assert (=> b!277916 (= lt!415667 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!604)

(assert (=> b!277916 (= lt!415668 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!277917 () Bool)

(declare-fun res!230820 () Bool)

(assert (=> b!277917 (=> (not res!230820) (not e!197827))))

(declare-datatypes ((array!15974 0))(
  ( (array!15975 (arr!7905 (Array (_ BitVec 32) (_ BitVec 8))) (size!6909 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15974)

(declare-fun a2!699 () array!15974)

(declare-fun arrayBitRangesEq!0 (array!15974 array!15974 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277917 (= res!230820 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!277918 () Bool)

(declare-fun res!230819 () Bool)

(assert (=> b!277918 (=> (not res!230819) (not e!197827))))

(assert (=> b!277918 (= res!230819 (bvslt from!822 to!789))))

(declare-fun res!230821 () Bool)

(assert (=> start!62020 (=> (not res!230821) (not e!197827))))

(assert (=> start!62020 (= res!230821 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6909 a1!699) (size!6909 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6909 a1!699))))))))

(assert (=> start!62020 e!197827))

(assert (=> start!62020 true))

(declare-fun array_inv!6633 (array!15974) Bool)

(assert (=> start!62020 (array_inv!6633 a1!699)))

(assert (=> start!62020 (array_inv!6633 a2!699)))

(declare-fun b!277919 () Bool)

(declare-fun Unit!19429 () Unit!19427)

(assert (=> b!277919 (= e!197826 Unit!19429)))

(declare-fun arrayRangesEq!1195 (array!15974 array!15974 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277919 (arrayRangesEq!1195 a1!699 a2!699 (_1!12377 lt!415668) (_2!12377 lt!415668))))

(declare-fun lt!415666 () Unit!19427)

(declare-fun arrayRangesEqSymmetricLemma!114 (array!15974 array!15974 (_ BitVec 32) (_ BitVec 32)) Unit!19427)

(assert (=> b!277919 (= lt!415666 (arrayRangesEqSymmetricLemma!114 a1!699 a2!699 (_1!12377 lt!415668) (_2!12377 lt!415668)))))

(assert (=> b!277919 (arrayRangesEq!1195 a2!699 a1!699 (_1!12377 lt!415668) (_2!12377 lt!415668))))

(declare-fun b!277920 () Bool)

(assert (=> b!277920 (= e!197825 (not (and (bvsle #b00000000000000000000000000000000 lt!415667) (bvsle lt!415667 lt!415664) (bvsle lt!415664 #b00000000000000000000000000001000))))))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277920 (byteRangesEq!0 (select (arr!7905 a1!699) (_3!1082 lt!415668)) (select (arr!7905 a2!699) (_3!1082 lt!415668)) lt!415667 lt!415664)))

(declare-fun b!277921 () Bool)

(declare-fun Unit!19430 () Unit!19427)

(assert (=> b!277921 (= e!197826 Unit!19430)))

(assert (= (and start!62020 res!230821) b!277917))

(assert (= (and b!277917 res!230820) b!277918))

(assert (= (and b!277918 res!230819) b!277916))

(assert (= (and b!277916 c!12720) b!277919))

(assert (= (and b!277916 (not c!12720)) b!277921))

(assert (= (and b!277916 res!230822) b!277920))

(declare-fun m!411023 () Bool)

(assert (=> b!277916 m!411023))

(declare-fun m!411025 () Bool)

(assert (=> b!277920 m!411025))

(declare-fun m!411027 () Bool)

(assert (=> b!277920 m!411027))

(assert (=> b!277920 m!411025))

(assert (=> b!277920 m!411027))

(declare-fun m!411029 () Bool)

(assert (=> b!277920 m!411029))

(declare-fun m!411031 () Bool)

(assert (=> b!277917 m!411031))

(declare-fun m!411033 () Bool)

(assert (=> start!62020 m!411033))

(declare-fun m!411035 () Bool)

(assert (=> start!62020 m!411035))

(declare-fun m!411037 () Bool)

(assert (=> b!277919 m!411037))

(declare-fun m!411039 () Bool)

(assert (=> b!277919 m!411039))

(declare-fun m!411041 () Bool)

(assert (=> b!277919 m!411041))

(push 1)

(assert (not b!277919))

(assert (not b!277916))

(assert (not b!277920))

(assert (not start!62020))

(assert (not b!277917))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95856 () Bool)

(assert (=> d!95856 (= (array_inv!6633 a1!699) (bvsge (size!6909 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62020 d!95856))

(declare-fun d!95860 () Bool)

(assert (=> d!95860 (= (array_inv!6633 a2!699) (bvsge (size!6909 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62020 d!95860))

(declare-fun b!277992 () Bool)

(declare-fun e!197893 () Bool)

(declare-fun e!197897 () Bool)

(assert (=> b!277992 (= e!197893 e!197897)))

(declare-fun res!230877 () Bool)

(declare-fun call!4526 () Bool)

(assert (=> b!277992 (= res!230877 call!4526)))

(assert (=> b!277992 (=> (not res!230877) (not e!197897))))

(declare-fun lt!415696 () (_ BitVec 32))

(declare-fun lt!415697 () tuple4!604)

(declare-fun e!197892 () Bool)

(declare-fun b!277993 () Bool)

(assert (=> b!277993 (= e!197892 (byteRangesEq!0 (select (arr!7905 a1!699) (_4!302 lt!415697)) (select (arr!7905 a2!699) (_4!302 lt!415697)) #b00000000000000000000000000000000 lt!415696))))

(declare-fun d!95864 () Bool)

(declare-fun res!230878 () Bool)

(declare-fun e!197894 () Bool)

(assert (=> d!95864 (=> res!230878 e!197894)))

(assert (=> d!95864 (= res!230878 (bvsge from!822 to!789))))

(assert (=> d!95864 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!197894)))

(declare-fun b!277994 () Bool)

(declare-fun e!197895 () Bool)

(assert (=> b!277994 (= e!197894 e!197895)))

(declare-fun res!230879 () Bool)

(assert (=> b!277994 (=> (not res!230879) (not e!197895))))

(declare-fun e!197896 () Bool)

(assert (=> b!277994 (= res!230879 e!197896)))

(declare-fun res!230880 () Bool)

(assert (=> b!277994 (=> res!230880 e!197896)))

(assert (=> b!277994 (= res!230880 (bvsge (_1!12377 lt!415697) (_2!12377 lt!415697)))))

(assert (=> b!277994 (= lt!415696 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!415698 () (_ BitVec 32))

(assert (=> b!277994 (= lt!415698 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277994 (= lt!415697 (arrayBitIndices!0 from!822 to!789))))

(declare-fun bm!4523 () Bool)

(declare-fun c!12729 () Bool)

(assert (=> bm!4523 (= call!4526 (byteRangesEq!0 (select (arr!7905 a1!699) (_3!1082 lt!415697)) (select (arr!7905 a2!699) (_3!1082 lt!415697)) lt!415698 (ite c!12729 lt!415696 #b00000000000000000000000000001000)))))

(declare-fun b!277995 () Bool)

(assert (=> b!277995 (= e!197896 (arrayRangesEq!1195 a1!699 a2!699 (_1!12377 lt!415697) (_2!12377 lt!415697)))))

(declare-fun b!277996 () Bool)

(declare-fun res!230881 () Bool)

(assert (=> b!277996 (= res!230881 (= lt!415696 #b00000000000000000000000000000000))))

(assert (=> b!277996 (=> res!230881 e!197892)))

(assert (=> b!277996 (= e!197897 e!197892)))

(declare-fun b!277997 () Bool)

(assert (=> b!277997 (= e!197893 call!4526)))

(declare-fun b!277998 () Bool)

(assert (=> b!277998 (= e!197895 e!197893)))

(assert (=> b!277998 (= c!12729 (= (_3!1082 lt!415697) (_4!302 lt!415697)))))

(assert (= (and d!95864 (not res!230878)) b!277994))

(assert (= (and b!277994 (not res!230880)) b!277995))

(assert (= (and b!277994 res!230879) b!277998))

(assert (= (and b!277998 c!12729) b!277997))

(assert (= (and b!277998 (not c!12729)) b!277992))

(assert (= (and b!277992 res!230877) b!277996))

(assert (= (and b!277996 (not res!230881)) b!277993))

(assert (= (or b!277997 b!277992) bm!4523))

(declare-fun m!411095 () Bool)

(assert (=> b!277993 m!411095))

(declare-fun m!411097 () Bool)

(assert (=> b!277993 m!411097))

(assert (=> b!277993 m!411095))

(assert (=> b!277993 m!411097))

(declare-fun m!411099 () Bool)

(assert (=> b!277993 m!411099))

(assert (=> b!277994 m!411023))

(declare-fun m!411101 () Bool)

(assert (=> bm!4523 m!411101))

(declare-fun m!411103 () Bool)

(assert (=> bm!4523 m!411103))

(assert (=> bm!4523 m!411101))

(assert (=> bm!4523 m!411103))

(declare-fun m!411105 () Bool)

(assert (=> bm!4523 m!411105))

(declare-fun m!411107 () Bool)

(assert (=> b!277995 m!411107))

(assert (=> b!277917 d!95864))

(declare-fun d!95880 () Bool)

(assert (=> d!95880 (= (arrayBitIndices!0 from!822 to!789) (tuple4!605 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!277916 d!95880))

(declare-fun d!95886 () Bool)

(declare-fun res!230888 () Bool)

(declare-fun e!197904 () Bool)

(assert (=> d!95886 (=> res!230888 e!197904)))

(assert (=> d!95886 (= res!230888 (= (_1!12377 lt!415668) (_2!12377 lt!415668)))))

(assert (=> d!95886 (= (arrayRangesEq!1195 a1!699 a2!699 (_1!12377 lt!415668) (_2!12377 lt!415668)) e!197904)))

(declare-fun b!278005 () Bool)

(declare-fun e!197905 () Bool)

(assert (=> b!278005 (= e!197904 e!197905)))

(declare-fun res!230889 () Bool)

(assert (=> b!278005 (=> (not res!230889) (not e!197905))))

(assert (=> b!278005 (= res!230889 (= (select (arr!7905 a1!699) (_1!12377 lt!415668)) (select (arr!7905 a2!699) (_1!12377 lt!415668))))))

(declare-fun b!278006 () Bool)

(assert (=> b!278006 (= e!197905 (arrayRangesEq!1195 a1!699 a2!699 (bvadd (_1!12377 lt!415668) #b00000000000000000000000000000001) (_2!12377 lt!415668)))))

(assert (= (and d!95886 (not res!230888)) b!278005))

(assert (= (and b!278005 res!230889) b!278006))

(declare-fun m!411113 () Bool)

(assert (=> b!278005 m!411113))

(declare-fun m!411115 () Bool)

(assert (=> b!278005 m!411115))

(declare-fun m!411117 () Bool)

(assert (=> b!278006 m!411117))

(assert (=> b!277919 d!95886))

(declare-fun d!95890 () Bool)

(assert (=> d!95890 (arrayRangesEq!1195 a2!699 a1!699 (_1!12377 lt!415668) (_2!12377 lt!415668))))

(declare-fun lt!415704 () Unit!19427)

(declare-fun choose!457 (array!15974 array!15974 (_ BitVec 32) (_ BitVec 32)) Unit!19427)

(assert (=> d!95890 (= lt!415704 (choose!457 a1!699 a2!699 (_1!12377 lt!415668) (_2!12377 lt!415668)))))

(assert (=> d!95890 (and (bvsle #b00000000000000000000000000000000 (_1!12377 lt!415668)) (bvsle (_1!12377 lt!415668) (_2!12377 lt!415668)) (bvsle (_2!12377 lt!415668) (size!6909 a1!699)))))

(assert (=> d!95890 (= (arrayRangesEqSymmetricLemma!114 a1!699 a2!699 (_1!12377 lt!415668) (_2!12377 lt!415668)) lt!415704)))

(declare-fun bs!24168 () Bool)

(assert (= bs!24168 d!95890))

(assert (=> bs!24168 m!411041))

(declare-fun m!411119 () Bool)

(assert (=> bs!24168 m!411119))

(assert (=> b!277919 d!95890))

(declare-fun d!95892 () Bool)

(declare-fun res!230890 () Bool)

(declare-fun e!197906 () Bool)

(assert (=> d!95892 (=> res!230890 e!197906)))

(assert (=> d!95892 (= res!230890 (= (_1!12377 lt!415668) (_2!12377 lt!415668)))))

(assert (=> d!95892 (= (arrayRangesEq!1195 a2!699 a1!699 (_1!12377 lt!415668) (_2!12377 lt!415668)) e!197906)))

(declare-fun b!278007 () Bool)

(declare-fun e!197907 () Bool)

(assert (=> b!278007 (= e!197906 e!197907)))

(declare-fun res!230891 () Bool)

(assert (=> b!278007 (=> (not res!230891) (not e!197907))))

(assert (=> b!278007 (= res!230891 (= (select (arr!7905 a2!699) (_1!12377 lt!415668)) (select (arr!7905 a1!699) (_1!12377 lt!415668))))))

(declare-fun b!278008 () Bool)

(assert (=> b!278008 (= e!197907 (arrayRangesEq!1195 a2!699 a1!699 (bvadd (_1!12377 lt!415668) #b00000000000000000000000000000001) (_2!12377 lt!415668)))))

(assert (= (and d!95892 (not res!230890)) b!278007))

(assert (= (and b!278007 res!230891) b!278008))

(assert (=> b!278007 m!411115))

(assert (=> b!278007 m!411113))

(declare-fun m!411121 () Bool)

(assert (=> b!278008 m!411121))

(assert (=> b!277919 d!95892))

(declare-fun d!95894 () Bool)

(assert (=> d!95894 (= (byteRangesEq!0 (select (arr!7905 a1!699) (_3!1082 lt!415668)) (select (arr!7905 a2!699) (_3!1082 lt!415668)) lt!415667 lt!415664) (or (= lt!415667 lt!415664) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7905 a1!699) (_3!1082 lt!415668))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!415664))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!415667)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7905 a2!699) (_3!1082 lt!415668))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!415664))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!415667)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24169 () Bool)

(assert (= bs!24169 d!95894))

(declare-fun m!411123 () Bool)

(assert (=> bs!24169 m!411123))

(declare-fun m!411125 () Bool)

(assert (=> bs!24169 m!411125))

(assert (=> b!277920 d!95894))

(push 1)

(assert (not b!277995))

(assert (not d!95890))

(assert (not b!277994))

(assert (not b!278006))

(assert (not bm!4523))

(assert (not b!277993))

(assert (not b!278008))

(check-sat)

(pop 1)

(push 1)

(check-sat)

