; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67984 () Bool)

(assert start!67984)

(declare-fun b!305236 () Bool)

(declare-datatypes ((Unit!21303 0))(
  ( (Unit!21304) )
))
(declare-fun e!219811 () Unit!21303)

(declare-fun Unit!21305 () Unit!21303)

(assert (=> b!305236 (= e!219811 Unit!21305)))

(declare-datatypes ((tuple4!1216 0))(
  ( (tuple4!1217 (_1!13263 (_ BitVec 32)) (_2!13263 (_ BitVec 32)) (_3!1565 (_ BitVec 32)) (_4!608 (_ BitVec 32))) )
))
(declare-fun lt!438850 () tuple4!1216)

(declare-fun lt!438858 () (_ BitVec 32))

(declare-fun lt!438853 () (_ BitVec 32))

(declare-fun c!14737 () Bool)

(declare-datatypes ((array!18534 0))(
  ( (array!18535 (arr!9120 (Array (_ BitVec 32) (_ BitVec 8))) (size!8037 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18534)

(declare-fun a2!948 () array!18534)

(declare-fun call!5738 () Bool)

(declare-fun bm!5735 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5735 (= call!5738 (byteRangesEq!0 (select (arr!9120 a1!948) (_3!1565 lt!438850)) (select (arr!9120 a2!948) (_3!1565 lt!438850)) lt!438858 (ite c!14737 lt!438853 #b00000000000000000000000000000111)))))

(declare-fun b!305237 () Bool)

(declare-fun e!219819 () Unit!21303)

(declare-fun lt!438857 () Unit!21303)

(assert (=> b!305237 (= e!219819 lt!438857)))

(declare-fun lt!438856 () tuple4!1216)

(declare-fun arrayRangesEqImpliesEq!270 (array!18534 array!18534 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21303)

(assert (=> b!305237 (= lt!438857 (arrayRangesEqImpliesEq!270 a1!948 a2!948 (_1!13263 lt!438850) (_3!1565 lt!438856) (_2!13263 lt!438850)))))

(assert (=> b!305237 (= (select (arr!9120 a1!948) (_3!1565 lt!438856)) (select (arr!9120 a2!948) (_3!1565 lt!438856)))))

(declare-fun b!305239 () Bool)

(declare-fun e!219815 () Bool)

(assert (=> b!305239 (= e!219815 call!5738)))

(declare-fun b!305240 () Bool)

(declare-fun e!219816 () Bool)

(declare-fun e!219814 () Bool)

(assert (=> b!305240 (= e!219816 e!219814)))

(declare-fun res!250927 () Bool)

(assert (=> b!305240 (=> (not res!250927) (not e!219814))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!438855 () (_ BitVec 64))

(assert (=> b!305240 (= res!250927 (and (bvsle toBit!258 lt!438855) (bvsle fromBit!258 lt!438855)))))

(assert (=> b!305240 (= lt!438855 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8037 a1!948))))))

(declare-fun b!305241 () Bool)

(declare-fun res!250930 () Bool)

(assert (=> b!305241 (=> (not res!250930) (not e!219814))))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!305241 (= res!250930 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!438855) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!305242 () Bool)

(declare-fun e!219818 () Bool)

(assert (=> b!305242 (= e!219818 (byteRangesEq!0 (select (arr!9120 a1!948) (_4!608 lt!438850)) (select (arr!9120 a2!948) (_4!608 lt!438850)) #b00000000000000000000000000000000 lt!438853))))

(declare-fun b!305243 () Bool)

(declare-fun res!250932 () Bool)

(assert (=> b!305243 (= res!250932 (= lt!438853 #b00000000000000000000000000000000))))

(assert (=> b!305243 (=> res!250932 e!219818)))

(declare-fun e!219820 () Bool)

(assert (=> b!305243 (= e!219820 e!219818)))

(declare-fun b!305244 () Bool)

(declare-fun res!250928 () Bool)

(assert (=> b!305244 (=> (not res!250928) (not e!219814))))

(declare-fun arrayBitRangesEq!0 (array!18534 array!18534 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!305244 (= res!250928 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun res!250929 () Bool)

(assert (=> start!67984 (=> (not res!250929) (not e!219816))))

(assert (=> start!67984 (= res!250929 (and (bvsle (size!8037 a1!948) (size!8037 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67984 e!219816))

(assert (=> start!67984 true))

(declare-fun array_inv!7649 (array!18534) Bool)

(assert (=> start!67984 (array_inv!7649 a1!948)))

(assert (=> start!67984 (array_inv!7649 a2!948)))

(declare-fun b!305238 () Bool)

(assert (=> b!305238 (= e!219815 e!219820)))

(declare-fun res!250926 () Bool)

(assert (=> b!305238 (= res!250926 call!5738)))

(assert (=> b!305238 (=> (not res!250926) (not e!219820))))

(declare-fun b!305245 () Bool)

(declare-fun e!219812 () Bool)

(assert (=> b!305245 (= e!219814 e!219812)))

(declare-fun res!250931 () Bool)

(assert (=> b!305245 (=> (not res!250931) (not e!219812))))

(assert (=> b!305245 (= res!250931 e!219815)))

(assert (=> b!305245 (= c!14737 (= (_3!1565 lt!438850) (_4!608 lt!438850)))))

(declare-fun lt!438852 () Unit!21303)

(assert (=> b!305245 (= lt!438852 e!219811)))

(declare-fun c!14738 () Bool)

(assert (=> b!305245 (= c!14738 (bvslt (_1!13263 lt!438856) (_2!13263 lt!438856)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1216)

(assert (=> b!305245 (= lt!438856 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!305245 (= lt!438853 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305245 (= lt!438858 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305245 (= lt!438850 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!305246 () Bool)

(assert (=> b!305246 (= e!219812 (and (bvslt (_4!608 lt!438856) (_4!608 lt!438850)) (bvslt (_3!1565 lt!438850) (_4!608 lt!438856)) (bvsle #b00000000000000000000000000000000 (_1!13263 lt!438850)) (bvsle (_1!13263 lt!438850) (_2!13263 lt!438850)) (bvsle (_2!13263 lt!438850) (size!8037 a1!948)) (or (bvsgt (_1!13263 lt!438850) (_4!608 lt!438856)) (bvsge (_4!608 lt!438856) (_2!13263 lt!438850)))))))

(declare-fun lt!438851 () Unit!21303)

(assert (=> b!305246 (= lt!438851 e!219819)))

(declare-fun c!14739 () Bool)

(assert (=> b!305246 (= c!14739 (and (bvslt (_3!1565 lt!438850) (_3!1565 lt!438856)) (bvslt (_3!1565 lt!438856) (_4!608 lt!438850))))))

(declare-fun b!305247 () Bool)

(declare-fun Unit!21306 () Unit!21303)

(assert (=> b!305247 (= e!219819 Unit!21306)))

(declare-fun b!305248 () Bool)

(declare-fun lt!438854 () Unit!21303)

(assert (=> b!305248 (= e!219811 lt!438854)))

(declare-fun arrayRangesEqSlicedLemma!261 (array!18534 array!18534 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21303)

(assert (=> b!305248 (= lt!438854 (arrayRangesEqSlicedLemma!261 a1!948 a2!948 (_1!13263 lt!438850) (_2!13263 lt!438850) (_1!13263 lt!438856) (_2!13263 lt!438856)))))

(declare-fun arrayRangesEq!1666 (array!18534 array!18534 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!305248 (arrayRangesEq!1666 a1!948 a2!948 (_1!13263 lt!438856) (_2!13263 lt!438856))))

(assert (= (and start!67984 res!250929) b!305240))

(assert (= (and b!305240 res!250927) b!305244))

(assert (= (and b!305244 res!250928) b!305241))

(assert (= (and b!305241 res!250930) b!305245))

(assert (= (and b!305245 c!14738) b!305248))

(assert (= (and b!305245 (not c!14738)) b!305236))

(assert (= (and b!305245 c!14737) b!305239))

(assert (= (and b!305245 (not c!14737)) b!305238))

(assert (= (and b!305238 res!250926) b!305243))

(assert (= (and b!305243 (not res!250932)) b!305242))

(assert (= (or b!305239 b!305238) bm!5735))

(assert (= (and b!305245 res!250931) b!305246))

(assert (= (and b!305246 c!14739) b!305237))

(assert (= (and b!305246 (not c!14739)) b!305247))

(declare-fun m!443683 () Bool)

(assert (=> b!305245 m!443683))

(declare-fun m!443685 () Bool)

(assert (=> b!305245 m!443685))

(declare-fun m!443687 () Bool)

(assert (=> bm!5735 m!443687))

(declare-fun m!443689 () Bool)

(assert (=> bm!5735 m!443689))

(assert (=> bm!5735 m!443687))

(assert (=> bm!5735 m!443689))

(declare-fun m!443691 () Bool)

(assert (=> bm!5735 m!443691))

(declare-fun m!443693 () Bool)

(assert (=> b!305248 m!443693))

(declare-fun m!443695 () Bool)

(assert (=> b!305248 m!443695))

(declare-fun m!443697 () Bool)

(assert (=> b!305242 m!443697))

(declare-fun m!443699 () Bool)

(assert (=> b!305242 m!443699))

(assert (=> b!305242 m!443697))

(assert (=> b!305242 m!443699))

(declare-fun m!443701 () Bool)

(assert (=> b!305242 m!443701))

(declare-fun m!443703 () Bool)

(assert (=> b!305244 m!443703))

(declare-fun m!443705 () Bool)

(assert (=> b!305237 m!443705))

(declare-fun m!443707 () Bool)

(assert (=> b!305237 m!443707))

(declare-fun m!443709 () Bool)

(assert (=> b!305237 m!443709))

(declare-fun m!443711 () Bool)

(assert (=> start!67984 m!443711))

(declare-fun m!443713 () Bool)

(assert (=> start!67984 m!443713))

(push 1)

(assert (not b!305245))

(assert (not b!305242))

(assert (not b!305237))

(assert (not bm!5735))

(assert (not b!305248))

(assert (not start!67984))

(assert (not b!305244))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101888 () Bool)

(assert (=> d!101888 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1217 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!305245 d!101888))

(declare-fun d!101890 () Bool)

(assert (=> d!101890 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1217 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!305245 d!101890))

(declare-fun d!101892 () Bool)

(assert (=> d!101892 (= (byteRangesEq!0 (select (arr!9120 a1!948) (_3!1565 lt!438850)) (select (arr!9120 a2!948) (_3!1565 lt!438850)) lt!438858 (ite c!14737 lt!438853 #b00000000000000000000000000000111)) (or (= lt!438858 (ite c!14737 lt!438853 #b00000000000000000000000000000111)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9120 a1!948) (_3!1565 lt!438850))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14737 lt!438853 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438858)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9120 a2!948) (_3!1565 lt!438850))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14737 lt!438853 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438858)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26254 () Bool)

(assert (= bs!26254 d!101892))

(declare-fun m!443777 () Bool)

(assert (=> bs!26254 m!443777))

(declare-fun m!443779 () Bool)

(assert (=> bs!26254 m!443779))

(assert (=> bm!5735 d!101892))

(declare-fun d!101898 () Bool)

(assert (=> d!101898 (= (byteRangesEq!0 (select (arr!9120 a1!948) (_4!608 lt!438850)) (select (arr!9120 a2!948) (_4!608 lt!438850)) #b00000000000000000000000000000000 lt!438853) (or (= #b00000000000000000000000000000000 lt!438853) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9120 a1!948) (_4!608 lt!438850))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438853))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9120 a2!948) (_4!608 lt!438850))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438853))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26255 () Bool)

(assert (= bs!26255 d!101898))

(declare-fun m!443781 () Bool)

(assert (=> bs!26255 m!443781))

(declare-fun m!443783 () Bool)

(assert (=> bs!26255 m!443783))

(assert (=> b!305242 d!101898))

(declare-fun d!101900 () Bool)

(assert (=> d!101900 (arrayRangesEq!1666 a1!948 a2!948 (_1!13263 lt!438856) (_2!13263 lt!438856))))

(declare-fun lt!438891 () Unit!21303)

(declare-fun choose!594 (array!18534 array!18534 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21303)

(assert (=> d!101900 (= lt!438891 (choose!594 a1!948 a2!948 (_1!13263 lt!438850) (_2!13263 lt!438850) (_1!13263 lt!438856) (_2!13263 lt!438856)))))

(assert (=> d!101900 (and (bvsle #b00000000000000000000000000000000 (_1!13263 lt!438850)) (bvsle (_1!13263 lt!438850) (_2!13263 lt!438850)))))

(assert (=> d!101900 (= (arrayRangesEqSlicedLemma!261 a1!948 a2!948 (_1!13263 lt!438850) (_2!13263 lt!438850) (_1!13263 lt!438856) (_2!13263 lt!438856)) lt!438891)))

(declare-fun bs!26257 () Bool)

(assert (= bs!26257 d!101900))

(assert (=> bs!26257 m!443695))

(declare-fun m!443787 () Bool)

(assert (=> bs!26257 m!443787))

(assert (=> b!305248 d!101900))

(declare-fun d!101906 () Bool)

(declare-fun res!250979 () Bool)

(declare-fun e!219873 () Bool)

(assert (=> d!101906 (=> res!250979 e!219873)))

(assert (=> d!101906 (= res!250979 (= (_1!13263 lt!438856) (_2!13263 lt!438856)))))

(assert (=> d!101906 (= (arrayRangesEq!1666 a1!948 a2!948 (_1!13263 lt!438856) (_2!13263 lt!438856)) e!219873)))

(declare-fun b!305307 () Bool)

(declare-fun e!219874 () Bool)

(assert (=> b!305307 (= e!219873 e!219874)))

(declare-fun res!250980 () Bool)

(assert (=> b!305307 (=> (not res!250980) (not e!219874))))

(assert (=> b!305307 (= res!250980 (= (select (arr!9120 a1!948) (_1!13263 lt!438856)) (select (arr!9120 a2!948) (_1!13263 lt!438856))))))

(declare-fun b!305308 () Bool)

(assert (=> b!305308 (= e!219874 (arrayRangesEq!1666 a1!948 a2!948 (bvadd (_1!13263 lt!438856) #b00000000000000000000000000000001) (_2!13263 lt!438856)))))

(assert (= (and d!101906 (not res!250979)) b!305307))

(assert (= (and b!305307 res!250980) b!305308))

(declare-fun m!443789 () Bool)

(assert (=> b!305307 m!443789))

(declare-fun m!443791 () Bool)

(assert (=> b!305307 m!443791))

(declare-fun m!443793 () Bool)

(assert (=> b!305308 m!443793))

(assert (=> b!305248 d!101906))

(declare-fun d!101908 () Bool)

(assert (=> d!101908 (and (bvsge (_3!1565 lt!438856) #b00000000000000000000000000000000) (bvslt (_3!1565 lt!438856) (size!8037 a1!948)) (bvslt (_3!1565 lt!438856) (size!8037 a2!948)) (= (select (arr!9120 a1!948) (_3!1565 lt!438856)) (select (arr!9120 a2!948) (_3!1565 lt!438856))))))

(declare-fun lt!438894 () Unit!21303)

(declare-fun choose!595 (array!18534 array!18534 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21303)

(assert (=> d!101908 (= lt!438894 (choose!595 a1!948 a2!948 (_1!13263 lt!438850) (_3!1565 lt!438856) (_2!13263 lt!438850)))))

(assert (=> d!101908 (and (bvsle #b00000000000000000000000000000000 (_1!13263 lt!438850)) (bvsle (_1!13263 lt!438850) (_2!13263 lt!438850)))))

(assert (=> d!101908 (= (arrayRangesEqImpliesEq!270 a1!948 a2!948 (_1!13263 lt!438850) (_3!1565 lt!438856) (_2!13263 lt!438850)) lt!438894)))

(declare-fun bs!26258 () Bool)

(assert (= bs!26258 d!101908))

(assert (=> bs!26258 m!443707))

(assert (=> bs!26258 m!443709))

(declare-fun m!443795 () Bool)

(assert (=> bs!26258 m!443795))

(assert (=> b!305237 d!101908))

(declare-fun b!305324 () Bool)

(declare-fun e!219889 () Bool)

(declare-fun e!219892 () Bool)

(assert (=> b!305324 (= e!219889 e!219892)))

(declare-fun c!14748 () Bool)

(declare-fun lt!438901 () tuple4!1216)

(assert (=> b!305324 (= c!14748 (= (_3!1565 lt!438901) (_4!608 lt!438901)))))

(declare-fun e!219887 () Bool)

(declare-fun b!305325 () Bool)

(assert (=> b!305325 (= e!219887 (arrayRangesEq!1666 a1!948 a2!948 (_1!13263 lt!438901) (_2!13263 lt!438901)))))

(declare-fun call!5747 () Bool)

(declare-fun lt!438903 () (_ BitVec 32))

(declare-fun lt!438902 () (_ BitVec 32))

(declare-fun bm!5744 () Bool)

(assert (=> bm!5744 (= call!5747 (byteRangesEq!0 (ite c!14748 (select (arr!9120 a1!948) (_3!1565 lt!438901)) (select (arr!9120 a1!948) (_4!608 lt!438901))) (ite c!14748 (select (arr!9120 a2!948) (_3!1565 lt!438901)) (select (arr!9120 a2!948) (_4!608 lt!438901))) (ite c!14748 lt!438903 #b00000000000000000000000000000000) lt!438902))))

(declare-fun b!305326 () Bool)

(assert (=> b!305326 (= e!219892 call!5747)))

(declare-fun b!305327 () Bool)

(declare-fun e!219888 () Bool)

(assert (=> b!305327 (= e!219888 call!5747)))

(declare-fun b!305328 () Bool)

(declare-fun e!219890 () Bool)

(assert (=> b!305328 (= e!219890 e!219889)))

(declare-fun res!250992 () Bool)

(assert (=> b!305328 (=> (not res!250992) (not e!219889))))

(assert (=> b!305328 (= res!250992 e!219887)))

(declare-fun res!250991 () Bool)

(assert (=> b!305328 (=> res!250991 e!219887)))

(assert (=> b!305328 (= res!250991 (bvsge (_1!13263 lt!438901) (_2!13263 lt!438901)))))

(assert (=> b!305328 (= lt!438902 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305328 (= lt!438903 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!305328 (= lt!438901 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!305329 () Bool)

(declare-fun res!250995 () Bool)

(assert (=> b!305329 (= res!250995 (= lt!438902 #b00000000000000000000000000000000))))

(assert (=> b!305329 (=> res!250995 e!219888)))

(declare-fun e!219891 () Bool)

(assert (=> b!305329 (= e!219891 e!219888)))

(declare-fun d!101910 () Bool)

(declare-fun res!250993 () Bool)

(assert (=> d!101910 (=> res!250993 e!219890)))

(assert (=> d!101910 (= res!250993 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101910 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!219890)))

(declare-fun b!305323 () Bool)

(assert (=> b!305323 (= e!219892 e!219891)))

(declare-fun res!250994 () Bool)

(assert (=> b!305323 (= res!250994 (byteRangesEq!0 (select (arr!9120 a1!948) (_3!1565 lt!438901)) (select (arr!9120 a2!948) (_3!1565 lt!438901)) lt!438903 #b00000000000000000000000000001000))))

(assert (=> b!305323 (=> (not res!250994) (not e!219891))))

(assert (= (and d!101910 (not res!250993)) b!305328))

(assert (= (and b!305328 (not res!250991)) b!305325))

(assert (= (and b!305328 res!250992) b!305324))

(assert (= (and b!305324 c!14748) b!305326))

(assert (= (and b!305324 (not c!14748)) b!305323))

(assert (= (and b!305323 res!250994) b!305329))

(assert (= (and b!305329 (not res!250995)) b!305327))

(assert (= (or b!305326 b!305327) bm!5744))

(declare-fun m!443797 () Bool)

(assert (=> b!305325 m!443797))

(declare-fun m!443799 () Bool)

(assert (=> bm!5744 m!443799))

(declare-fun m!443801 () Bool)

(assert (=> bm!5744 m!443801))

(declare-fun m!443803 () Bool)

(assert (=> bm!5744 m!443803))

(declare-fun m!443805 () Bool)

(assert (=> bm!5744 m!443805))

(declare-fun m!443807 () Bool)

(assert (=> bm!5744 m!443807))

(assert (=> b!305328 m!443685))

(assert (=> b!305323 m!443807))

(assert (=> b!305323 m!443801))

(assert (=> b!305323 m!443807))

(assert (=> b!305323 m!443801))

(declare-fun m!443809 () Bool)

(assert (=> b!305323 m!443809))

(assert (=> b!305244 d!101910))

(declare-fun d!101912 () Bool)

(assert (=> d!101912 (= (array_inv!7649 a1!948) (bvsge (size!8037 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67984 d!101912))

(declare-fun d!101914 () Bool)

(assert (=> d!101914 (= (array_inv!7649 a2!948) (bvsge (size!8037 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67984 d!101914))

(push 1)

(assert (not d!101900))

(assert (not d!101908))

(assert (not b!305325))

(assert (not b!305328))

(assert (not bm!5744))

(assert (not b!305308))

(assert (not b!305323))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

