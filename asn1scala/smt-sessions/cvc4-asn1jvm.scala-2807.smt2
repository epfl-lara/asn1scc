; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67624 () Bool)

(assert start!67624)

(declare-fun b!303588 () Bool)

(declare-fun res!249814 () Bool)

(declare-fun e!218454 () Bool)

(assert (=> b!303588 (=> (not res!249814) (not e!218454))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!437882 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!303588 (= res!249814 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437882) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!303590 () Bool)

(declare-fun e!218455 () Bool)

(assert (=> b!303590 (= e!218454 e!218455)))

(declare-fun res!249817 () Bool)

(assert (=> b!303590 (=> (not res!249817) (not e!218455))))

(declare-datatypes ((tuple4!1156 0))(
  ( (tuple4!1157 (_1!13233 (_ BitVec 32)) (_2!13233 (_ BitVec 32)) (_3!1535 (_ BitVec 32)) (_4!578 (_ BitVec 32))) )
))
(declare-fun lt!437886 () tuple4!1156)

(assert (=> b!303590 (= res!249817 (not (= (_3!1535 lt!437886) (_4!578 lt!437886))))))

(declare-datatypes ((Unit!21202 0))(
  ( (Unit!21203) )
))
(declare-fun lt!437885 () Unit!21202)

(declare-fun e!218453 () Unit!21202)

(assert (=> b!303590 (= lt!437885 e!218453)))

(declare-fun c!14469 () Bool)

(declare-fun lt!437883 () tuple4!1156)

(assert (=> b!303590 (= c!14469 (bvslt (_1!13233 lt!437883) (_2!13233 lt!437883)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1156)

(assert (=> b!303590 (= lt!437883 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!303590 (= lt!437886 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!303591 () Bool)

(declare-fun res!249815 () Bool)

(assert (=> b!303591 (=> (not res!249815) (not e!218454))))

(declare-datatypes ((array!18450 0))(
  ( (array!18451 (arr!9090 (Array (_ BitVec 32) (_ BitVec 8))) (size!8007 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18450)

(declare-fun a2!948 () array!18450)

(declare-fun arrayBitRangesEq!0 (array!18450 array!18450 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!303591 (= res!249815 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!303592 () Bool)

(declare-fun Unit!21204 () Unit!21202)

(assert (=> b!303592 (= e!218453 Unit!21204)))

(declare-fun b!303593 () Bool)

(declare-fun e!218450 () Bool)

(assert (=> b!303593 (= e!218450 e!218454)))

(declare-fun res!249816 () Bool)

(assert (=> b!303593 (=> (not res!249816) (not e!218454))))

(assert (=> b!303593 (= res!249816 (and (bvsle toBit!258 lt!437882) (bvsle fromBit!258 lt!437882)))))

(assert (=> b!303593 (= lt!437882 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8007 a1!948))))))

(declare-fun res!249819 () Bool)

(assert (=> start!67624 (=> (not res!249819) (not e!218450))))

(assert (=> start!67624 (= res!249819 (and (bvsle (size!8007 a1!948) (size!8007 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67624 e!218450))

(assert (=> start!67624 true))

(declare-fun array_inv!7619 (array!18450) Bool)

(assert (=> start!67624 (array_inv!7619 a1!948)))

(assert (=> start!67624 (array_inv!7619 a2!948)))

(declare-fun b!303589 () Bool)

(assert (=> b!303589 (= e!218455 (and (not (= ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000)) (or (bvslt (_4!578 lt!437886) #b00000000000000000000000000000000) (bvsge (_4!578 lt!437886) (size!8007 a1!948)))))))

(declare-fun b!303594 () Bool)

(declare-fun lt!437884 () Unit!21202)

(assert (=> b!303594 (= e!218453 lt!437884)))

(declare-fun arrayRangesEqSlicedLemma!231 (array!18450 array!18450 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21202)

(assert (=> b!303594 (= lt!437884 (arrayRangesEqSlicedLemma!231 a1!948 a2!948 (_1!13233 lt!437886) (_2!13233 lt!437886) (_1!13233 lt!437883) (_2!13233 lt!437883)))))

(declare-fun arrayRangesEq!1636 (array!18450 array!18450 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303594 (arrayRangesEq!1636 a1!948 a2!948 (_1!13233 lt!437883) (_2!13233 lt!437883))))

(declare-fun b!303595 () Bool)

(declare-fun res!249818 () Bool)

(assert (=> b!303595 (=> (not res!249818) (not e!218455))))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303595 (= res!249818 (byteRangesEq!0 (select (arr!9090 a1!948) (_3!1535 lt!437886)) (select (arr!9090 a2!948) (_3!1535 lt!437886)) ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111))))

(assert (= (and start!67624 res!249819) b!303593))

(assert (= (and b!303593 res!249816) b!303591))

(assert (= (and b!303591 res!249815) b!303588))

(assert (= (and b!303588 res!249814) b!303590))

(assert (= (and b!303590 c!14469) b!303594))

(assert (= (and b!303590 (not c!14469)) b!303592))

(assert (= (and b!303590 res!249817) b!303595))

(assert (= (and b!303595 res!249818) b!303589))

(declare-fun m!442165 () Bool)

(assert (=> start!67624 m!442165))

(declare-fun m!442167 () Bool)

(assert (=> start!67624 m!442167))

(declare-fun m!442169 () Bool)

(assert (=> b!303594 m!442169))

(declare-fun m!442171 () Bool)

(assert (=> b!303594 m!442171))

(declare-fun m!442173 () Bool)

(assert (=> b!303595 m!442173))

(declare-fun m!442175 () Bool)

(assert (=> b!303595 m!442175))

(assert (=> b!303595 m!442173))

(assert (=> b!303595 m!442175))

(declare-fun m!442177 () Bool)

(assert (=> b!303595 m!442177))

(declare-fun m!442179 () Bool)

(assert (=> b!303591 m!442179))

(declare-fun m!442181 () Bool)

(assert (=> b!303590 m!442181))

(declare-fun m!442183 () Bool)

(assert (=> b!303590 m!442183))

(push 1)

(assert (not b!303591))

(assert (not start!67624))

(assert (not b!303595))

(assert (not b!303590))

(assert (not b!303594))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!303664 () Bool)

(declare-fun e!218521 () Bool)

(declare-fun call!5603 () Bool)

(assert (=> b!303664 (= e!218521 call!5603)))

(declare-fun b!303665 () Bool)

(declare-fun e!218519 () Bool)

(declare-fun e!218518 () Bool)

(assert (=> b!303665 (= e!218519 e!218518)))

(declare-fun res!249875 () Bool)

(assert (=> b!303665 (=> (not res!249875) (not e!218518))))

(declare-fun e!218517 () Bool)

(assert (=> b!303665 (= res!249875 e!218517)))

(declare-fun res!249874 () Bool)

(assert (=> b!303665 (=> res!249874 e!218517)))

(declare-fun lt!437919 () tuple4!1156)

(assert (=> b!303665 (= res!249874 (bvsge (_1!13233 lt!437919) (_2!13233 lt!437919)))))

(declare-fun lt!437918 () (_ BitVec 32))

(assert (=> b!303665 (= lt!437918 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!437917 () (_ BitVec 32))

(assert (=> b!303665 (= lt!437917 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303665 (= lt!437919 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun d!101430 () Bool)

(declare-fun res!249873 () Bool)

(assert (=> d!101430 (=> res!249873 e!218519)))

(assert (=> d!101430 (= res!249873 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101430 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!218519)))

(declare-fun bm!5600 () Bool)

(declare-fun c!14478 () Bool)

(assert (=> bm!5600 (= call!5603 (byteRangesEq!0 (ite c!14478 (select (arr!9090 a1!948) (_3!1535 lt!437919)) (select (arr!9090 a1!948) (_4!578 lt!437919))) (ite c!14478 (select (arr!9090 a2!948) (_3!1535 lt!437919)) (select (arr!9090 a2!948) (_4!578 lt!437919))) (ite c!14478 lt!437917 #b00000000000000000000000000000000) lt!437918))))

(declare-fun b!303666 () Bool)

(assert (=> b!303666 (= e!218517 (arrayRangesEq!1636 a1!948 a2!948 (_1!13233 lt!437919) (_2!13233 lt!437919)))))

(declare-fun b!303667 () Bool)

(declare-fun e!218520 () Bool)

(assert (=> b!303667 (= e!218520 call!5603)))

(declare-fun b!303668 () Bool)

(declare-fun res!249876 () Bool)

(assert (=> b!303668 (= res!249876 (= lt!437918 #b00000000000000000000000000000000))))

(assert (=> b!303668 (=> res!249876 e!218520)))

(declare-fun e!218516 () Bool)

(assert (=> b!303668 (= e!218516 e!218520)))

(declare-fun b!303669 () Bool)

(assert (=> b!303669 (= e!218521 e!218516)))

(declare-fun res!249872 () Bool)

(assert (=> b!303669 (= res!249872 (byteRangesEq!0 (select (arr!9090 a1!948) (_3!1535 lt!437919)) (select (arr!9090 a2!948) (_3!1535 lt!437919)) lt!437917 #b00000000000000000000000000001000))))

(assert (=> b!303669 (=> (not res!249872) (not e!218516))))

(declare-fun b!303670 () Bool)

(assert (=> b!303670 (= e!218518 e!218521)))

(assert (=> b!303670 (= c!14478 (= (_3!1535 lt!437919) (_4!578 lt!437919)))))

(assert (= (and d!101430 (not res!249873)) b!303665))

(assert (= (and b!303665 (not res!249874)) b!303666))

(assert (= (and b!303665 res!249875) b!303670))

(assert (= (and b!303670 c!14478) b!303664))

(assert (= (and b!303670 (not c!14478)) b!303669))

(assert (= (and b!303669 res!249872) b!303668))

(assert (= (and b!303668 (not res!249876)) b!303667))

(assert (= (or b!303664 b!303667) bm!5600))

(assert (=> b!303665 m!442183))

(declare-fun m!442237 () Bool)

(assert (=> bm!5600 m!442237))

(declare-fun m!442239 () Bool)

(assert (=> bm!5600 m!442239))

(declare-fun m!442241 () Bool)

(assert (=> bm!5600 m!442241))

(declare-fun m!442243 () Bool)

(assert (=> bm!5600 m!442243))

(declare-fun m!442245 () Bool)

(assert (=> bm!5600 m!442245))

(declare-fun m!442247 () Bool)

(assert (=> b!303666 m!442247))

(assert (=> b!303669 m!442237))

(assert (=> b!303669 m!442243))

(assert (=> b!303669 m!442237))

(assert (=> b!303669 m!442243))

(declare-fun m!442249 () Bool)

(assert (=> b!303669 m!442249))

(assert (=> b!303591 d!101430))

(declare-fun d!101432 () Bool)

(assert (=> d!101432 (= (array_inv!7619 a1!948) (bvsge (size!8007 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67624 d!101432))

(declare-fun d!101434 () Bool)

(assert (=> d!101434 (= (array_inv!7619 a2!948) (bvsge (size!8007 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67624 d!101434))

(declare-fun d!101436 () Bool)

(assert (=> d!101436 (arrayRangesEq!1636 a1!948 a2!948 (_1!13233 lt!437883) (_2!13233 lt!437883))))

(declare-fun lt!437922 () Unit!21202)

(declare-fun choose!562 (array!18450 array!18450 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21202)

(assert (=> d!101436 (= lt!437922 (choose!562 a1!948 a2!948 (_1!13233 lt!437886) (_2!13233 lt!437886) (_1!13233 lt!437883) (_2!13233 lt!437883)))))

(assert (=> d!101436 (and (bvsle #b00000000000000000000000000000000 (_1!13233 lt!437886)) (bvsle (_1!13233 lt!437886) (_2!13233 lt!437886)))))

(assert (=> d!101436 (= (arrayRangesEqSlicedLemma!231 a1!948 a2!948 (_1!13233 lt!437886) (_2!13233 lt!437886) (_1!13233 lt!437883) (_2!13233 lt!437883)) lt!437922)))

(declare-fun bs!26149 () Bool)

(assert (= bs!26149 d!101436))

(assert (=> bs!26149 m!442171))

(declare-fun m!442251 () Bool)

(assert (=> bs!26149 m!442251))

(assert (=> b!303594 d!101436))

(declare-fun d!101438 () Bool)

(declare-fun res!249881 () Bool)

(declare-fun e!218526 () Bool)

(assert (=> d!101438 (=> res!249881 e!218526)))

(assert (=> d!101438 (= res!249881 (= (_1!13233 lt!437883) (_2!13233 lt!437883)))))

(assert (=> d!101438 (= (arrayRangesEq!1636 a1!948 a2!948 (_1!13233 lt!437883) (_2!13233 lt!437883)) e!218526)))

(declare-fun b!303675 () Bool)

(declare-fun e!218527 () Bool)

(assert (=> b!303675 (= e!218526 e!218527)))

(declare-fun res!249882 () Bool)

(assert (=> b!303675 (=> (not res!249882) (not e!218527))))

(assert (=> b!303675 (= res!249882 (= (select (arr!9090 a1!948) (_1!13233 lt!437883)) (select (arr!9090 a2!948) (_1!13233 lt!437883))))))

(declare-fun b!303676 () Bool)

(assert (=> b!303676 (= e!218527 (arrayRangesEq!1636 a1!948 a2!948 (bvadd (_1!13233 lt!437883) #b00000000000000000000000000000001) (_2!13233 lt!437883)))))

(assert (= (and d!101438 (not res!249881)) b!303675))

(assert (= (and b!303675 res!249882) b!303676))

(declare-fun m!442253 () Bool)

(assert (=> b!303675 m!442253))

(declare-fun m!442255 () Bool)

(assert (=> b!303675 m!442255))

(declare-fun m!442257 () Bool)

(assert (=> b!303676 m!442257))

(assert (=> b!303594 d!101438))

(declare-fun d!101440 () Bool)

(assert (=> d!101440 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1157 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303590 d!101440))

(declare-fun d!101442 () Bool)

(assert (=> d!101442 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1157 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303590 d!101442))

(declare-fun d!101444 () Bool)

(assert (=> d!101444 (= (byteRangesEq!0 (select (arr!9090 a1!948) (_3!1535 lt!437886)) (select (arr!9090 a2!948) (_3!1535 lt!437886)) ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (or (= ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9090 a1!948) (_3!1535 lt!437886))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9090 a2!948) (_3!1535 lt!437886))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26150 () Bool)

(assert (= bs!26150 d!101444))

(declare-fun m!442259 () Bool)

(assert (=> bs!26150 m!442259))

(declare-fun m!442261 () Bool)

(assert (=> bs!26150 m!442261))

(assert (=> b!303595 d!101444))

(push 1)

(assert (not b!303669))

(assert (not bm!5600))

(assert (not b!303676))

(assert (not d!101436))

(assert (not b!303665))

(assert (not b!303666))

(check-sat)

