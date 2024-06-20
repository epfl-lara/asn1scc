; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67980 () Bool)

(assert start!67980)

(declare-fun b!305158 () Bool)

(declare-fun res!250885 () Bool)

(declare-fun lt!438801 () (_ BitVec 32))

(assert (=> b!305158 (= res!250885 (= lt!438801 #b00000000000000000000000000000000))))

(declare-fun e!219759 () Bool)

(assert (=> b!305158 (=> res!250885 e!219759)))

(declare-fun e!219754 () Bool)

(assert (=> b!305158 (= e!219754 e!219759)))

(declare-fun b!305159 () Bool)

(declare-fun e!219757 () Bool)

(declare-fun e!219751 () Bool)

(assert (=> b!305159 (= e!219757 e!219751)))

(declare-fun res!250887 () Bool)

(assert (=> b!305159 (=> (not res!250887) (not e!219751))))

(declare-fun e!219753 () Bool)

(assert (=> b!305159 (= res!250887 e!219753)))

(declare-fun c!14720 () Bool)

(declare-datatypes ((tuple4!1212 0))(
  ( (tuple4!1213 (_1!13261 (_ BitVec 32)) (_2!13261 (_ BitVec 32)) (_3!1563 (_ BitVec 32)) (_4!606 (_ BitVec 32))) )
))
(declare-fun lt!438803 () tuple4!1212)

(assert (=> b!305159 (= c!14720 (= (_3!1563 lt!438803) (_4!606 lt!438803)))))

(declare-datatypes ((Unit!21295 0))(
  ( (Unit!21296) )
))
(declare-fun lt!438804 () Unit!21295)

(declare-fun e!219755 () Unit!21295)

(assert (=> b!305159 (= lt!438804 e!219755)))

(declare-fun c!14721 () Bool)

(declare-fun lt!438796 () tuple4!1212)

(assert (=> b!305159 (= c!14721 (bvslt (_1!13261 lt!438796) (_2!13261 lt!438796)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1212)

(assert (=> b!305159 (= lt!438796 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> b!305159 (= lt!438801 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!438798 () (_ BitVec 32))

(declare-fun fromBit!258 () (_ BitVec 64))

(assert (=> b!305159 (= lt!438798 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305159 (= lt!438803 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!305160 () Bool)

(declare-fun e!219752 () Unit!21295)

(declare-fun lt!438797 () Unit!21295)

(assert (=> b!305160 (= e!219752 lt!438797)))

(declare-datatypes ((array!18530 0))(
  ( (array!18531 (arr!9118 (Array (_ BitVec 32) (_ BitVec 8))) (size!8035 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18530)

(declare-fun a2!948 () array!18530)

(declare-fun arrayRangesEqImpliesEq!268 (array!18530 array!18530 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21295)

(assert (=> b!305160 (= lt!438797 (arrayRangesEqImpliesEq!268 a1!948 a2!948 (_1!13261 lt!438803) (_3!1563 lt!438796) (_2!13261 lt!438803)))))

(assert (=> b!305160 (= (select (arr!9118 a1!948) (_3!1563 lt!438796)) (select (arr!9118 a2!948) (_3!1563 lt!438796)))))

(declare-fun b!305161 () Bool)

(declare-fun lt!438799 () Unit!21295)

(assert (=> b!305161 (= e!219755 lt!438799)))

(declare-fun arrayRangesEqSlicedLemma!259 (array!18530 array!18530 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21295)

(assert (=> b!305161 (= lt!438799 (arrayRangesEqSlicedLemma!259 a1!948 a2!948 (_1!13261 lt!438803) (_2!13261 lt!438803) (_1!13261 lt!438796) (_2!13261 lt!438796)))))

(declare-fun arrayRangesEq!1664 (array!18530 array!18530 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!305161 (arrayRangesEq!1664 a1!948 a2!948 (_1!13261 lt!438796) (_2!13261 lt!438796))))

(declare-fun b!305162 () Bool)

(declare-fun Unit!21297 () Unit!21295)

(assert (=> b!305162 (= e!219752 Unit!21297)))

(declare-fun b!305163 () Bool)

(assert (=> b!305163 (= e!219751 (and (bvslt (_4!606 lt!438796) (_4!606 lt!438803)) (bvslt (_3!1563 lt!438803) (_4!606 lt!438796)) (bvsle #b00000000000000000000000000000000 (_1!13261 lt!438803)) (bvsle (_1!13261 lt!438803) (_2!13261 lt!438803)) (bvsle (_2!13261 lt!438803) (size!8035 a1!948)) (or (bvsgt (_1!13261 lt!438803) (_4!606 lt!438796)) (bvsge (_4!606 lt!438796) (_2!13261 lt!438803)))))))

(declare-fun lt!438800 () Unit!21295)

(assert (=> b!305163 (= lt!438800 e!219752)))

(declare-fun c!14719 () Bool)

(assert (=> b!305163 (= c!14719 (and (bvslt (_3!1563 lt!438803) (_3!1563 lt!438796)) (bvslt (_3!1563 lt!438796) (_4!606 lt!438803))))))

(declare-fun b!305164 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!305164 (= e!219759 (byteRangesEq!0 (select (arr!9118 a1!948) (_4!606 lt!438803)) (select (arr!9118 a2!948) (_4!606 lt!438803)) #b00000000000000000000000000000000 lt!438801))))

(declare-fun b!305165 () Bool)

(declare-fun res!250888 () Bool)

(assert (=> b!305165 (=> (not res!250888) (not e!219757))))

(declare-fun lt!438802 () (_ BitVec 64))

(assert (=> b!305165 (= res!250888 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!438802) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!305166 () Bool)

(assert (=> b!305166 (= e!219753 e!219754)))

(declare-fun res!250890 () Bool)

(declare-fun call!5732 () Bool)

(assert (=> b!305166 (= res!250890 call!5732)))

(assert (=> b!305166 (=> (not res!250890) (not e!219754))))

(declare-fun b!305167 () Bool)

(assert (=> b!305167 (= e!219753 call!5732)))

(declare-fun b!305168 () Bool)

(declare-fun res!250884 () Bool)

(assert (=> b!305168 (=> (not res!250884) (not e!219757))))

(declare-fun arrayBitRangesEq!0 (array!18530 array!18530 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!305168 (= res!250884 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!305169 () Bool)

(declare-fun e!219760 () Bool)

(assert (=> b!305169 (= e!219760 e!219757)))

(declare-fun res!250889 () Bool)

(assert (=> b!305169 (=> (not res!250889) (not e!219757))))

(assert (=> b!305169 (= res!250889 (and (bvsle toBit!258 lt!438802) (bvsle fromBit!258 lt!438802)))))

(assert (=> b!305169 (= lt!438802 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8035 a1!948))))))

(declare-fun b!305170 () Bool)

(declare-fun Unit!21298 () Unit!21295)

(assert (=> b!305170 (= e!219755 Unit!21298)))

(declare-fun bm!5729 () Bool)

(assert (=> bm!5729 (= call!5732 (byteRangesEq!0 (select (arr!9118 a1!948) (_3!1563 lt!438803)) (select (arr!9118 a2!948) (_3!1563 lt!438803)) lt!438798 (ite c!14720 lt!438801 #b00000000000000000000000000000111)))))

(declare-fun res!250886 () Bool)

(assert (=> start!67980 (=> (not res!250886) (not e!219760))))

(assert (=> start!67980 (= res!250886 (and (bvsle (size!8035 a1!948) (size!8035 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67980 e!219760))

(assert (=> start!67980 true))

(declare-fun array_inv!7647 (array!18530) Bool)

(assert (=> start!67980 (array_inv!7647 a1!948)))

(assert (=> start!67980 (array_inv!7647 a2!948)))

(assert (= (and start!67980 res!250886) b!305169))

(assert (= (and b!305169 res!250889) b!305168))

(assert (= (and b!305168 res!250884) b!305165))

(assert (= (and b!305165 res!250888) b!305159))

(assert (= (and b!305159 c!14721) b!305161))

(assert (= (and b!305159 (not c!14721)) b!305170))

(assert (= (and b!305159 c!14720) b!305167))

(assert (= (and b!305159 (not c!14720)) b!305166))

(assert (= (and b!305166 res!250890) b!305158))

(assert (= (and b!305158 (not res!250885)) b!305164))

(assert (= (or b!305167 b!305166) bm!5729))

(assert (= (and b!305159 res!250887) b!305163))

(assert (= (and b!305163 c!14719) b!305160))

(assert (= (and b!305163 (not c!14719)) b!305162))

(declare-fun m!443619 () Bool)

(assert (=> b!305159 m!443619))

(declare-fun m!443621 () Bool)

(assert (=> b!305159 m!443621))

(declare-fun m!443623 () Bool)

(assert (=> start!67980 m!443623))

(declare-fun m!443625 () Bool)

(assert (=> start!67980 m!443625))

(declare-fun m!443627 () Bool)

(assert (=> b!305161 m!443627))

(declare-fun m!443629 () Bool)

(assert (=> b!305161 m!443629))

(declare-fun m!443631 () Bool)

(assert (=> b!305164 m!443631))

(declare-fun m!443633 () Bool)

(assert (=> b!305164 m!443633))

(assert (=> b!305164 m!443631))

(assert (=> b!305164 m!443633))

(declare-fun m!443635 () Bool)

(assert (=> b!305164 m!443635))

(declare-fun m!443637 () Bool)

(assert (=> bm!5729 m!443637))

(declare-fun m!443639 () Bool)

(assert (=> bm!5729 m!443639))

(assert (=> bm!5729 m!443637))

(assert (=> bm!5729 m!443639))

(declare-fun m!443641 () Bool)

(assert (=> bm!5729 m!443641))

(declare-fun m!443643 () Bool)

(assert (=> b!305160 m!443643))

(declare-fun m!443645 () Bool)

(assert (=> b!305160 m!443645))

(declare-fun m!443647 () Bool)

(assert (=> b!305160 m!443647))

(declare-fun m!443649 () Bool)

(assert (=> b!305168 m!443649))

(push 1)

(assert (not b!305159))

(assert (not start!67980))

(assert (not b!305161))

(assert (not bm!5729))

(assert (not b!305160))

(assert (not b!305164))

(assert (not b!305168))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101876 () Bool)

(assert (=> d!101876 (arrayRangesEq!1664 a1!948 a2!948 (_1!13261 lt!438796) (_2!13261 lt!438796))))

(declare-fun lt!438876 () Unit!21295)

(declare-fun choose!592 (array!18530 array!18530 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21295)

(assert (=> d!101876 (= lt!438876 (choose!592 a1!948 a2!948 (_1!13261 lt!438803) (_2!13261 lt!438803) (_1!13261 lt!438796) (_2!13261 lt!438796)))))

(assert (=> d!101876 (and (bvsle #b00000000000000000000000000000000 (_1!13261 lt!438803)) (bvsle (_1!13261 lt!438803) (_2!13261 lt!438803)))))

(assert (=> d!101876 (= (arrayRangesEqSlicedLemma!259 a1!948 a2!948 (_1!13261 lt!438803) (_2!13261 lt!438803) (_1!13261 lt!438796) (_2!13261 lt!438796)) lt!438876)))

(declare-fun bs!26251 () Bool)

(assert (= bs!26251 d!101876))

(assert (=> bs!26251 m!443629))

(declare-fun m!443747 () Bool)

(assert (=> bs!26251 m!443747))

(assert (=> b!305161 d!101876))

(declare-fun d!101878 () Bool)

(declare-fun res!250958 () Bool)

(declare-fun e!219849 () Bool)

(assert (=> d!101878 (=> res!250958 e!219849)))

(assert (=> d!101878 (= res!250958 (= (_1!13261 lt!438796) (_2!13261 lt!438796)))))

(assert (=> d!101878 (= (arrayRangesEq!1664 a1!948 a2!948 (_1!13261 lt!438796) (_2!13261 lt!438796)) e!219849)))

(declare-fun b!305280 () Bool)

(declare-fun e!219850 () Bool)

(assert (=> b!305280 (= e!219849 e!219850)))

(declare-fun res!250959 () Bool)

(assert (=> b!305280 (=> (not res!250959) (not e!219850))))

(assert (=> b!305280 (= res!250959 (= (select (arr!9118 a1!948) (_1!13261 lt!438796)) (select (arr!9118 a2!948) (_1!13261 lt!438796))))))

(declare-fun b!305281 () Bool)

(assert (=> b!305281 (= e!219850 (arrayRangesEq!1664 a1!948 a2!948 (bvadd (_1!13261 lt!438796) #b00000000000000000000000000000001) (_2!13261 lt!438796)))))

(assert (= (and d!101878 (not res!250958)) b!305280))

(assert (= (and b!305280 res!250959) b!305281))

(declare-fun m!443749 () Bool)

(assert (=> b!305280 m!443749))

(declare-fun m!443751 () Bool)

(assert (=> b!305280 m!443751))

(declare-fun m!443753 () Bool)

(assert (=> b!305281 m!443753))

(assert (=> b!305161 d!101878))

(declare-fun b!305296 () Bool)

(declare-fun e!219868 () Bool)

(declare-fun call!5744 () Bool)

(assert (=> b!305296 (= e!219868 call!5744)))

(declare-fun d!101880 () Bool)

(declare-fun res!250971 () Bool)

(declare-fun e!219864 () Bool)

(assert (=> d!101880 (=> res!250971 e!219864)))

(assert (=> d!101880 (= res!250971 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101880 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!219864)))

(declare-fun b!305297 () Bool)

(declare-fun e!219865 () Bool)

(declare-fun lt!438883 () tuple4!1212)

(assert (=> b!305297 (= e!219865 (arrayRangesEq!1664 a1!948 a2!948 (_1!13261 lt!438883) (_2!13261 lt!438883)))))

(declare-fun b!305298 () Bool)

(declare-fun e!219866 () Bool)

(declare-fun e!219863 () Bool)

(assert (=> b!305298 (= e!219866 e!219863)))

(declare-fun res!250972 () Bool)

(declare-fun lt!438884 () (_ BitVec 32))

(assert (=> b!305298 (= res!250972 (byteRangesEq!0 (select (arr!9118 a1!948) (_3!1563 lt!438883)) (select (arr!9118 a2!948) (_3!1563 lt!438883)) lt!438884 #b00000000000000000000000000001000))))

(assert (=> b!305298 (=> (not res!250972) (not e!219863))))

(declare-fun b!305299 () Bool)

(declare-fun e!219867 () Bool)

(assert (=> b!305299 (= e!219864 e!219867)))

(declare-fun res!250973 () Bool)

(assert (=> b!305299 (=> (not res!250973) (not e!219867))))

(assert (=> b!305299 (= res!250973 e!219865)))

(declare-fun res!250970 () Bool)

(assert (=> b!305299 (=> res!250970 e!219865)))

(assert (=> b!305299 (= res!250970 (bvsge (_1!13261 lt!438883) (_2!13261 lt!438883)))))

(declare-fun lt!438885 () (_ BitVec 32))

(assert (=> b!305299 (= lt!438885 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305299 (= lt!438884 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305299 (= lt!438883 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun bm!5741 () Bool)

(declare-fun c!14745 () Bool)

(assert (=> bm!5741 (= call!5744 (byteRangesEq!0 (ite c!14745 (select (arr!9118 a1!948) (_3!1563 lt!438883)) (select (arr!9118 a1!948) (_4!606 lt!438883))) (ite c!14745 (select (arr!9118 a2!948) (_3!1563 lt!438883)) (select (arr!9118 a2!948) (_4!606 lt!438883))) (ite c!14745 lt!438884 #b00000000000000000000000000000000) lt!438885))))

(declare-fun b!305300 () Bool)

(assert (=> b!305300 (= e!219866 call!5744)))

(declare-fun b!305301 () Bool)

(declare-fun res!250974 () Bool)

(assert (=> b!305301 (= res!250974 (= lt!438885 #b00000000000000000000000000000000))))

(assert (=> b!305301 (=> res!250974 e!219868)))

(assert (=> b!305301 (= e!219863 e!219868)))

(declare-fun b!305302 () Bool)

(assert (=> b!305302 (= e!219867 e!219866)))

(assert (=> b!305302 (= c!14745 (= (_3!1563 lt!438883) (_4!606 lt!438883)))))

(assert (= (and d!101880 (not res!250971)) b!305299))

(assert (= (and b!305299 (not res!250970)) b!305297))

(assert (= (and b!305299 res!250973) b!305302))

(assert (= (and b!305302 c!14745) b!305300))

(assert (= (and b!305302 (not c!14745)) b!305298))

(assert (= (and b!305298 res!250972) b!305301))

(assert (= (and b!305301 (not res!250974)) b!305296))

(assert (= (or b!305300 b!305296) bm!5741))

(declare-fun m!443755 () Bool)

(assert (=> b!305297 m!443755))

(declare-fun m!443757 () Bool)

(assert (=> b!305298 m!443757))

(declare-fun m!443759 () Bool)

(assert (=> b!305298 m!443759))

(assert (=> b!305298 m!443757))

(assert (=> b!305298 m!443759))

(declare-fun m!443761 () Bool)

(assert (=> b!305298 m!443761))

(assert (=> b!305299 m!443621))

(declare-fun m!443763 () Bool)

(assert (=> bm!5741 m!443763))

(declare-fun m!443765 () Bool)

(assert (=> bm!5741 m!443765))

(assert (=> bm!5741 m!443757))

(declare-fun m!443767 () Bool)

(assert (=> bm!5741 m!443767))

(assert (=> bm!5741 m!443759))

(assert (=> b!305168 d!101880))

(declare-fun d!101882 () Bool)

(assert (=> d!101882 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1213 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!305159 d!101882))

(declare-fun d!101884 () Bool)

(assert (=> d!101884 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1213 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!305159 d!101884))

(declare-fun d!101886 () Bool)

(assert (=> d!101886 (= (byteRangesEq!0 (select (arr!9118 a1!948) (_4!606 lt!438803)) (select (arr!9118 a2!948) (_4!606 lt!438803)) #b00000000000000000000000000000000 lt!438801) (or (= #b00000000000000000000000000000000 lt!438801) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9118 a1!948) (_4!606 lt!438803))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438801))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9118 a2!948) (_4!606 lt!438803))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438801))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26252 () Bool)

(assert (= bs!26252 d!101886))

(declare-fun m!443769 () Bool)

(assert (=> bs!26252 m!443769))

(declare-fun m!443771 () Bool)

(assert (=> bs!26252 m!443771))

(assert (=> b!305164 d!101886))

(declare-fun d!101894 () Bool)

(assert (=> d!101894 (= (byteRangesEq!0 (select (arr!9118 a1!948) (_3!1563 lt!438803)) (select (arr!9118 a2!948) (_3!1563 lt!438803)) lt!438798 (ite c!14720 lt!438801 #b00000000000000000000000000000111)) (or (= lt!438798 (ite c!14720 lt!438801 #b00000000000000000000000000000111)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9118 a1!948) (_3!1563 lt!438803))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14720 lt!438801 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438798)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9118 a2!948) (_3!1563 lt!438803))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14720 lt!438801 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438798)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26253 () Bool)

(assert (= bs!26253 d!101894))

(declare-fun m!443773 () Bool)

(assert (=> bs!26253 m!443773))

(declare-fun m!443775 () Bool)

(assert (=> bs!26253 m!443775))

(assert (=> bm!5729 d!101894))

(declare-fun d!101896 () Bool)

(assert (=> d!101896 (and (bvsge (_3!1563 lt!438796) #b00000000000000000000000000000000) (bvslt (_3!1563 lt!438796) (size!8035 a1!948)) (bvslt (_3!1563 lt!438796) (size!8035 a2!948)) (= (select (arr!9118 a1!948) (_3!1563 lt!438796)) (select (arr!9118 a2!948) (_3!1563 lt!438796))))))

(declare-fun lt!438888 () Unit!21295)

(declare-fun choose!593 (array!18530 array!18530 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21295)

(assert (=> d!101896 (= lt!438888 (choose!593 a1!948 a2!948 (_1!13261 lt!438803) (_3!1563 lt!438796) (_2!13261 lt!438803)))))

(assert (=> d!101896 (and (bvsle #b00000000000000000000000000000000 (_1!13261 lt!438803)) (bvsle (_1!13261 lt!438803) (_2!13261 lt!438803)))))

(assert (=> d!101896 (= (arrayRangesEqImpliesEq!268 a1!948 a2!948 (_1!13261 lt!438803) (_3!1563 lt!438796) (_2!13261 lt!438803)) lt!438888)))

(declare-fun bs!26256 () Bool)

(assert (= bs!26256 d!101896))

(assert (=> bs!26256 m!443645))

(assert (=> bs!26256 m!443647))

(declare-fun m!443785 () Bool)

(assert (=> bs!26256 m!443785))

(assert (=> b!305160 d!101896))

(declare-fun d!101902 () Bool)

(assert (=> d!101902 (= (array_inv!7647 a1!948) (bvsge (size!8035 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67980 d!101902))

(declare-fun d!101904 () Bool)

(assert (=> d!101904 (= (array_inv!7647 a2!948) (bvsge (size!8035 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67980 d!101904))

(push 1)

(assert (not b!305297))

(assert (not b!305298))

(assert (not bm!5741))

(assert (not b!305299))

(assert (not d!101896))

(assert (not b!305281))

(assert (not d!101876))

(check-sat)

(pop 1)

(push 1)

(check-sat)

