; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67620 () Bool)

(assert start!67620)

(declare-fun b!303540 () Bool)

(declare-fun e!218417 () Bool)

(declare-fun e!218416 () Bool)

(assert (=> b!303540 (= e!218417 e!218416)))

(declare-fun res!249780 () Bool)

(assert (=> b!303540 (=> (not res!249780) (not e!218416))))

(declare-datatypes ((tuple4!1152 0))(
  ( (tuple4!1153 (_1!13231 (_ BitVec 32)) (_2!13231 (_ BitVec 32)) (_3!1533 (_ BitVec 32)) (_4!576 (_ BitVec 32))) )
))
(declare-fun lt!437854 () tuple4!1152)

(assert (=> b!303540 (= res!249780 (not (= (_3!1533 lt!437854) (_4!576 lt!437854))))))

(declare-datatypes ((Unit!21196 0))(
  ( (Unit!21197) )
))
(declare-fun lt!437852 () Unit!21196)

(declare-fun e!218418 () Unit!21196)

(assert (=> b!303540 (= lt!437852 e!218418)))

(declare-fun c!14463 () Bool)

(declare-fun lt!437856 () tuple4!1152)

(assert (=> b!303540 (= c!14463 (bvslt (_1!13231 lt!437856) (_2!13231 lt!437856)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1152)

(assert (=> b!303540 (= lt!437856 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> b!303540 (= lt!437854 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!303541 () Bool)

(declare-fun e!218414 () Bool)

(assert (=> b!303541 (= e!218414 e!218417)))

(declare-fun res!249782 () Bool)

(assert (=> b!303541 (=> (not res!249782) (not e!218417))))

(declare-fun lt!437855 () (_ BitVec 64))

(assert (=> b!303541 (= res!249782 (and (bvsle toBit!258 lt!437855) (bvsle fromBit!258 lt!437855)))))

(declare-datatypes ((array!18446 0))(
  ( (array!18447 (arr!9088 (Array (_ BitVec 32) (_ BitVec 8))) (size!8005 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18446)

(assert (=> b!303541 (= lt!437855 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8005 a1!948))))))

(declare-fun b!303542 () Bool)

(assert (=> b!303542 (= e!218416 (and (not (= ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000)) (or (bvslt (_4!576 lt!437854) #b00000000000000000000000000000000) (bvsge (_4!576 lt!437854) (size!8005 a1!948)))))))

(declare-fun b!303543 () Bool)

(declare-fun lt!437853 () Unit!21196)

(assert (=> b!303543 (= e!218418 lt!437853)))

(declare-fun a2!948 () array!18446)

(declare-fun arrayRangesEqSlicedLemma!229 (array!18446 array!18446 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21196)

(assert (=> b!303543 (= lt!437853 (arrayRangesEqSlicedLemma!229 a1!948 a2!948 (_1!13231 lt!437854) (_2!13231 lt!437854) (_1!13231 lt!437856) (_2!13231 lt!437856)))))

(declare-fun arrayRangesEq!1634 (array!18446 array!18446 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303543 (arrayRangesEq!1634 a1!948 a2!948 (_1!13231 lt!437856) (_2!13231 lt!437856))))

(declare-fun res!249779 () Bool)

(assert (=> start!67620 (=> (not res!249779) (not e!218414))))

(assert (=> start!67620 (= res!249779 (and (bvsle (size!8005 a1!948) (size!8005 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67620 e!218414))

(assert (=> start!67620 true))

(declare-fun array_inv!7617 (array!18446) Bool)

(assert (=> start!67620 (array_inv!7617 a1!948)))

(assert (=> start!67620 (array_inv!7617 a2!948)))

(declare-fun b!303544 () Bool)

(declare-fun res!249778 () Bool)

(assert (=> b!303544 (=> (not res!249778) (not e!218416))))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303544 (= res!249778 (byteRangesEq!0 (select (arr!9088 a1!948) (_3!1533 lt!437854)) (select (arr!9088 a2!948) (_3!1533 lt!437854)) ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111))))

(declare-fun b!303545 () Bool)

(declare-fun res!249783 () Bool)

(assert (=> b!303545 (=> (not res!249783) (not e!218417))))

(assert (=> b!303545 (= res!249783 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437855) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!303546 () Bool)

(declare-fun res!249781 () Bool)

(assert (=> b!303546 (=> (not res!249781) (not e!218417))))

(declare-fun arrayBitRangesEq!0 (array!18446 array!18446 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!303546 (= res!249781 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!303547 () Bool)

(declare-fun Unit!21198 () Unit!21196)

(assert (=> b!303547 (= e!218418 Unit!21198)))

(assert (= (and start!67620 res!249779) b!303541))

(assert (= (and b!303541 res!249782) b!303546))

(assert (= (and b!303546 res!249781) b!303545))

(assert (= (and b!303545 res!249783) b!303540))

(assert (= (and b!303540 c!14463) b!303543))

(assert (= (and b!303540 (not c!14463)) b!303547))

(assert (= (and b!303540 res!249780) b!303544))

(assert (= (and b!303544 res!249778) b!303542))

(declare-fun m!442125 () Bool)

(assert (=> start!67620 m!442125))

(declare-fun m!442127 () Bool)

(assert (=> start!67620 m!442127))

(declare-fun m!442129 () Bool)

(assert (=> b!303540 m!442129))

(declare-fun m!442131 () Bool)

(assert (=> b!303540 m!442131))

(declare-fun m!442133 () Bool)

(assert (=> b!303543 m!442133))

(declare-fun m!442135 () Bool)

(assert (=> b!303543 m!442135))

(declare-fun m!442137 () Bool)

(assert (=> b!303546 m!442137))

(declare-fun m!442139 () Bool)

(assert (=> b!303544 m!442139))

(declare-fun m!442141 () Bool)

(assert (=> b!303544 m!442141))

(assert (=> b!303544 m!442139))

(assert (=> b!303544 m!442141))

(declare-fun m!442143 () Bool)

(assert (=> b!303544 m!442143))

(push 1)

(assert (not b!303546))

(assert (not b!303540))

(assert (not start!67620))

(assert (not b!303544))

(assert (not b!303543))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!303637 () Bool)

(declare-fun e!218495 () Bool)

(declare-fun e!218492 () Bool)

(assert (=> b!303637 (= e!218495 e!218492)))

(declare-fun lt!437907 () tuple4!1152)

(declare-fun lt!437905 () (_ BitVec 32))

(declare-fun res!249853 () Bool)

(assert (=> b!303637 (= res!249853 (byteRangesEq!0 (select (arr!9088 a1!948) (_3!1533 lt!437907)) (select (arr!9088 a2!948) (_3!1533 lt!437907)) lt!437905 #b00000000000000000000000000001000))))

(assert (=> b!303637 (=> (not res!249853) (not e!218492))))

(declare-fun b!303638 () Bool)

(declare-fun e!218493 () Bool)

(assert (=> b!303638 (= e!218493 e!218495)))

(declare-fun c!14475 () Bool)

(assert (=> b!303638 (= c!14475 (= (_3!1533 lt!437907) (_4!576 lt!437907)))))

(declare-fun d!101414 () Bool)

(declare-fun res!249854 () Bool)

(declare-fun e!218496 () Bool)

(assert (=> d!101414 (=> res!249854 e!218496)))

(assert (=> d!101414 (= res!249854 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101414 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!218496)))

(declare-fun bm!5597 () Bool)

(declare-fun call!5600 () Bool)

(declare-fun lt!437906 () (_ BitVec 32))

(assert (=> bm!5597 (= call!5600 (byteRangesEq!0 (ite c!14475 (select (arr!9088 a1!948) (_3!1533 lt!437907)) (select (arr!9088 a1!948) (_4!576 lt!437907))) (ite c!14475 (select (arr!9088 a2!948) (_3!1533 lt!437907)) (select (arr!9088 a2!948) (_4!576 lt!437907))) (ite c!14475 lt!437905 #b00000000000000000000000000000000) lt!437906))))

(declare-fun b!303639 () Bool)

(declare-fun e!218497 () Bool)

(assert (=> b!303639 (= e!218497 (arrayRangesEq!1634 a1!948 a2!948 (_1!13231 lt!437907) (_2!13231 lt!437907)))))

(declare-fun b!303640 () Bool)

(declare-fun res!249855 () Bool)

(assert (=> b!303640 (= res!249855 (= lt!437906 #b00000000000000000000000000000000))))

(declare-fun e!218494 () Bool)

(assert (=> b!303640 (=> res!249855 e!218494)))

(assert (=> b!303640 (= e!218492 e!218494)))

(declare-fun b!303641 () Bool)

(assert (=> b!303641 (= e!218494 call!5600)))

(declare-fun b!303642 () Bool)

(assert (=> b!303642 (= e!218495 call!5600)))

(declare-fun b!303643 () Bool)

(assert (=> b!303643 (= e!218496 e!218493)))

(declare-fun res!249852 () Bool)

(assert (=> b!303643 (=> (not res!249852) (not e!218493))))

(assert (=> b!303643 (= res!249852 e!218497)))

(declare-fun res!249851 () Bool)

(assert (=> b!303643 (=> res!249851 e!218497)))

(assert (=> b!303643 (= res!249851 (bvsge (_1!13231 lt!437907) (_2!13231 lt!437907)))))

(assert (=> b!303643 (= lt!437906 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303643 (= lt!437905 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303643 (= lt!437907 (arrayBitIndices!0 fromBit!258 toBit!258))))

(assert (= (and d!101414 (not res!249854)) b!303643))

(assert (= (and b!303643 (not res!249851)) b!303639))

(assert (= (and b!303643 res!249852) b!303638))

(assert (= (and b!303638 c!14475) b!303642))

(assert (= (and b!303638 (not c!14475)) b!303637))

(assert (= (and b!303637 res!249853) b!303640))

(assert (= (and b!303640 (not res!249855)) b!303641))

(assert (= (or b!303642 b!303641) bm!5597))

(declare-fun m!442211 () Bool)

(assert (=> b!303637 m!442211))

(declare-fun m!442213 () Bool)

(assert (=> b!303637 m!442213))

(assert (=> b!303637 m!442211))

(assert (=> b!303637 m!442213))

(declare-fun m!442215 () Bool)

(assert (=> b!303637 m!442215))

(declare-fun m!442217 () Bool)

(assert (=> bm!5597 m!442217))

(assert (=> bm!5597 m!442211))

(declare-fun m!442219 () Bool)

(assert (=> bm!5597 m!442219))

(assert (=> bm!5597 m!442213))

(declare-fun m!442221 () Bool)

(assert (=> bm!5597 m!442221))

(declare-fun m!442223 () Bool)

(assert (=> b!303639 m!442223))

(assert (=> b!303643 m!442131))

(assert (=> b!303546 d!101414))

(declare-fun d!101416 () Bool)

(assert (=> d!101416 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1153 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303540 d!101416))

(declare-fun d!101418 () Bool)

(assert (=> d!101418 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1153 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303540 d!101418))

(declare-fun d!101420 () Bool)

(assert (=> d!101420 (arrayRangesEq!1634 a1!948 a2!948 (_1!13231 lt!437856) (_2!13231 lt!437856))))

(declare-fun lt!437910 () Unit!21196)

(declare-fun choose!561 (array!18446 array!18446 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21196)

(assert (=> d!101420 (= lt!437910 (choose!561 a1!948 a2!948 (_1!13231 lt!437854) (_2!13231 lt!437854) (_1!13231 lt!437856) (_2!13231 lt!437856)))))

(assert (=> d!101420 (and (bvsle #b00000000000000000000000000000000 (_1!13231 lt!437854)) (bvsle (_1!13231 lt!437854) (_2!13231 lt!437854)))))

(assert (=> d!101420 (= (arrayRangesEqSlicedLemma!229 a1!948 a2!948 (_1!13231 lt!437854) (_2!13231 lt!437854) (_1!13231 lt!437856) (_2!13231 lt!437856)) lt!437910)))

(declare-fun bs!26147 () Bool)

(assert (= bs!26147 d!101420))

(assert (=> bs!26147 m!442135))

(declare-fun m!442225 () Bool)

(assert (=> bs!26147 m!442225))

(assert (=> b!303543 d!101420))

(declare-fun d!101422 () Bool)

(declare-fun res!249860 () Bool)

(declare-fun e!218502 () Bool)

(assert (=> d!101422 (=> res!249860 e!218502)))

(assert (=> d!101422 (= res!249860 (= (_1!13231 lt!437856) (_2!13231 lt!437856)))))

(assert (=> d!101422 (= (arrayRangesEq!1634 a1!948 a2!948 (_1!13231 lt!437856) (_2!13231 lt!437856)) e!218502)))

(declare-fun b!303648 () Bool)

(declare-fun e!218503 () Bool)

(assert (=> b!303648 (= e!218502 e!218503)))

(declare-fun res!249861 () Bool)

(assert (=> b!303648 (=> (not res!249861) (not e!218503))))

(assert (=> b!303648 (= res!249861 (= (select (arr!9088 a1!948) (_1!13231 lt!437856)) (select (arr!9088 a2!948) (_1!13231 lt!437856))))))

(declare-fun b!303649 () Bool)

(assert (=> b!303649 (= e!218503 (arrayRangesEq!1634 a1!948 a2!948 (bvadd (_1!13231 lt!437856) #b00000000000000000000000000000001) (_2!13231 lt!437856)))))

(assert (= (and d!101422 (not res!249860)) b!303648))

(assert (= (and b!303648 res!249861) b!303649))

(declare-fun m!442227 () Bool)

(assert (=> b!303648 m!442227))

(declare-fun m!442229 () Bool)

(assert (=> b!303648 m!442229))

(declare-fun m!442231 () Bool)

(assert (=> b!303649 m!442231))

(assert (=> b!303543 d!101422))

(declare-fun d!101424 () Bool)

(assert (=> d!101424 (= (byteRangesEq!0 (select (arr!9088 a1!948) (_3!1533 lt!437854)) (select (arr!9088 a2!948) (_3!1533 lt!437854)) ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (or (= ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9088 a1!948) (_3!1533 lt!437854))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9088 a2!948) (_3!1533 lt!437854))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26148 () Bool)

(assert (= bs!26148 d!101424))

(declare-fun m!442233 () Bool)

(assert (=> bs!26148 m!442233))

(declare-fun m!442235 () Bool)

(assert (=> bs!26148 m!442235))

(assert (=> b!303544 d!101424))

(declare-fun d!101426 () Bool)

(assert (=> d!101426 (= (array_inv!7617 a1!948) (bvsge (size!8005 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67620 d!101426))

(declare-fun d!101428 () Bool)

(assert (=> d!101428 (= (array_inv!7617 a2!948) (bvsge (size!8005 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67620 d!101428))

(push 1)

(assert (not bm!5597))

(assert (not b!303649))

(assert (not d!101420))

(assert (not b!303639))

(assert (not b!303643))

(assert (not b!303637))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

