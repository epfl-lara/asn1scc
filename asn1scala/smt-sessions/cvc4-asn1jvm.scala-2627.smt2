; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64838 () Bool)

(assert start!64838)

(declare-fun b!291049 () Bool)

(declare-fun e!207385 () Bool)

(declare-fun lt!422723 () Bool)

(declare-datatypes ((array!17277 0))(
  ( (array!17278 (arr!8493 (Array (_ BitVec 32) (_ BitVec 8))) (size!7479 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12968 0))(
  ( (BitStream!12969 (buf!7545 array!17277) (currentByte!13970 (_ BitVec 32)) (currentBit!13965 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22854 0))(
  ( (tuple2!22855 (_1!12698 Bool) (_2!12698 BitStream!12968)) )
))
(declare-fun lt!422719 () tuple2!22854)

(assert (=> b!291049 (= e!207385 (= lt!422723 (_1!12698 lt!422719)))))

(declare-fun b!291050 () Bool)

(declare-fun res!240441 () Bool)

(declare-fun e!207389 () Bool)

(assert (=> b!291050 (=> (not res!240441) (not e!207389))))

(declare-fun thiss!1728 () BitStream!12968)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291050 (= res!240441 (validate_offset_bits!1 ((_ sign_extend 32) (size!7479 (buf!7545 thiss!1728))) ((_ sign_extend 32) (currentByte!13970 thiss!1728)) ((_ sign_extend 32) (currentBit!13965 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!291051 () Bool)

(declare-fun res!240440 () Bool)

(assert (=> b!291051 (=> (not res!240440) (not e!207389))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!291051 (= res!240440 (bvslt from!505 to!474))))

(declare-fun b!291052 () Bool)

(declare-fun e!207390 () Bool)

(declare-fun array_inv!7091 (array!17277) Bool)

(assert (=> b!291052 (= e!207390 (array_inv!7091 (buf!7545 thiss!1728)))))

(declare-fun b!291053 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291053 (= e!207389 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!7479 (buf!7545 thiss!1728))) ((_ sign_extend 32) (currentByte!13970 thiss!1728)) ((_ sign_extend 32) (currentBit!13965 thiss!1728)))))))

(assert (=> b!291053 e!207385))

(declare-fun res!240439 () Bool)

(assert (=> b!291053 (=> (not res!240439) (not e!207385))))

(declare-fun lt!422722 () array!17277)

(declare-fun bitAt!0 (array!17277 (_ BitVec 64)) Bool)

(assert (=> b!291053 (= res!240439 (= (bitAt!0 lt!422722 from!505) lt!422723))))

(declare-datatypes ((Unit!20223 0))(
  ( (Unit!20224) )
))
(declare-datatypes ((tuple3!1702 0))(
  ( (tuple3!1703 (_1!12699 Unit!20223) (_2!12699 BitStream!12968) (_3!1271 array!17277)) )
))
(declare-fun lt!422720 () tuple3!1702)

(assert (=> b!291053 (= lt!422723 (bitAt!0 (_3!1271 lt!422720) from!505))))

(declare-fun lt!422724 () Unit!20223)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17277 array!17277 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20223)

(assert (=> b!291053 (= lt!422724 (arrayBitRangesEqImpliesEq!0 lt!422722 (_3!1271 lt!422720) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arr!273 () array!17277)

(declare-fun arrayBitRangesEq!0 (array!17277 array!17277 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291053 (arrayBitRangesEq!0 arr!273 (_3!1271 lt!422720) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!422721 () Unit!20223)

(declare-fun arrayBitRangesEqTransitive!0 (array!17277 array!17277 array!17277 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20223)

(assert (=> b!291053 (= lt!422721 (arrayBitRangesEqTransitive!0 arr!273 lt!422722 (_3!1271 lt!422720) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!291053 (arrayBitRangesEq!0 arr!273 lt!422722 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!422725 () Unit!20223)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17277 (_ BitVec 64) Bool) Unit!20223)

(assert (=> b!291053 (= lt!422725 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12698 lt!422719)))))

(declare-fun e!207386 () Bool)

(assert (=> b!291053 e!207386))

(declare-fun res!240443 () Bool)

(assert (=> b!291053 (=> (not res!240443) (not e!207386))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!291053 (= res!240443 (= (bvsub (bvadd (bitIndex!0 (size!7479 (buf!7545 thiss!1728)) (currentByte!13970 thiss!1728) (currentBit!13965 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7479 (buf!7545 (_2!12699 lt!422720))) (currentByte!13970 (_2!12699 lt!422720)) (currentBit!13965 (_2!12699 lt!422720)))))))

(declare-fun readBitsLoop!0 (BitStream!12968 (_ BitVec 64) array!17277 (_ BitVec 64) (_ BitVec 64)) tuple3!1702)

(assert (=> b!291053 (= lt!422720 (readBitsLoop!0 (_2!12698 lt!422719) nBits!523 lt!422722 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!291053 (validate_offset_bits!1 ((_ sign_extend 32) (size!7479 (buf!7545 (_2!12698 lt!422719)))) ((_ sign_extend 32) (currentByte!13970 (_2!12698 lt!422719))) ((_ sign_extend 32) (currentBit!13965 (_2!12698 lt!422719))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!422726 () Unit!20223)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12968 BitStream!12968 (_ BitVec 64) (_ BitVec 64)) Unit!20223)

(assert (=> b!291053 (= lt!422726 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12698 lt!422719) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!422718 () (_ BitVec 32))

(declare-fun lt!422727 () (_ BitVec 32))

(assert (=> b!291053 (= lt!422722 (array!17278 (store (arr!8493 arr!273) lt!422727 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8493 arr!273) lt!422727)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422718)))) ((_ sign_extend 24) (ite (_1!12698 lt!422719) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422718) #b00000000))))) (size!7479 arr!273)))))

(assert (=> b!291053 (= lt!422718 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291053 (= lt!422727 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12968) tuple2!22854)

(assert (=> b!291053 (= lt!422719 (readBit!0 thiss!1728))))

(declare-fun b!291054 () Bool)

(assert (=> b!291054 (= e!207386 (and (= (buf!7545 thiss!1728) (buf!7545 (_2!12699 lt!422720))) (= (size!7479 arr!273) (size!7479 (_3!1271 lt!422720)))))))

(declare-fun res!240442 () Bool)

(assert (=> start!64838 (=> (not res!240442) (not e!207389))))

(assert (=> start!64838 (= res!240442 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7479 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64838 e!207389))

(declare-fun inv!12 (BitStream!12968) Bool)

(assert (=> start!64838 (and (inv!12 thiss!1728) e!207390)))

(assert (=> start!64838 true))

(assert (=> start!64838 (array_inv!7091 arr!273)))

(assert (= (and start!64838 res!240442) b!291050))

(assert (= (and b!291050 res!240441) b!291051))

(assert (= (and b!291051 res!240440) b!291053))

(assert (= (and b!291053 res!240443) b!291054))

(assert (= (and b!291053 res!240439) b!291049))

(assert (= start!64838 b!291052))

(declare-fun m!425719 () Bool)

(assert (=> b!291050 m!425719))

(declare-fun m!425721 () Bool)

(assert (=> b!291052 m!425721))

(declare-fun m!425723 () Bool)

(assert (=> b!291053 m!425723))

(declare-fun m!425725 () Bool)

(assert (=> b!291053 m!425725))

(declare-fun m!425727 () Bool)

(assert (=> b!291053 m!425727))

(declare-fun m!425729 () Bool)

(assert (=> b!291053 m!425729))

(declare-fun m!425731 () Bool)

(assert (=> b!291053 m!425731))

(declare-fun m!425733 () Bool)

(assert (=> b!291053 m!425733))

(declare-fun m!425735 () Bool)

(assert (=> b!291053 m!425735))

(declare-fun m!425737 () Bool)

(assert (=> b!291053 m!425737))

(declare-fun m!425739 () Bool)

(assert (=> b!291053 m!425739))

(declare-fun m!425741 () Bool)

(assert (=> b!291053 m!425741))

(declare-fun m!425743 () Bool)

(assert (=> b!291053 m!425743))

(declare-fun m!425745 () Bool)

(assert (=> b!291053 m!425745))

(declare-fun m!425747 () Bool)

(assert (=> b!291053 m!425747))

(declare-fun m!425749 () Bool)

(assert (=> b!291053 m!425749))

(declare-fun m!425751 () Bool)

(assert (=> b!291053 m!425751))

(declare-fun m!425753 () Bool)

(assert (=> b!291053 m!425753))

(declare-fun m!425755 () Bool)

(assert (=> b!291053 m!425755))

(declare-fun m!425757 () Bool)

(assert (=> start!64838 m!425757))

(declare-fun m!425759 () Bool)

(assert (=> start!64838 m!425759))

(push 1)

(assert (not b!291052))

(assert (not b!291053))

(assert (not start!64838))

(assert (not b!291050))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98612 () Bool)

(assert (=> d!98612 (= (array_inv!7091 (buf!7545 thiss!1728)) (bvsge (size!7479 (buf!7545 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!291052 d!98612))

(declare-fun d!98614 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!98614 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!7479 (buf!7545 thiss!1728))) ((_ sign_extend 32) (currentByte!13970 thiss!1728)) ((_ sign_extend 32) (currentBit!13965 thiss!1728))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7479 (buf!7545 thiss!1728))) ((_ sign_extend 32) (currentByte!13970 thiss!1728)) ((_ sign_extend 32) (currentBit!13965 thiss!1728))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!25123 () Bool)

(assert (= bs!25123 d!98614))

(declare-fun m!425831 () Bool)

(assert (=> bs!25123 m!425831))

(assert (=> b!291053 d!98614))

(declare-fun b!291113 () Bool)

(declare-fun res!240489 () Bool)

(declare-fun lt!422809 () (_ BitVec 32))

(assert (=> b!291113 (= res!240489 (= lt!422809 #b00000000000000000000000000000000))))

(declare-fun e!207446 () Bool)

(assert (=> b!291113 (=> res!240489 e!207446)))

(declare-fun e!207444 () Bool)

(assert (=> b!291113 (= e!207444 e!207446)))

(declare-fun b!291114 () Bool)

(declare-fun e!207443 () Bool)

(declare-fun e!207447 () Bool)

(assert (=> b!291114 (= e!207443 e!207447)))

(declare-fun res!240492 () Bool)

(assert (=> b!291114 (=> (not res!240492) (not e!207447))))

(declare-fun e!207445 () Bool)

(assert (=> b!291114 (= res!240492 e!207445)))

(declare-fun res!240493 () Bool)

(assert (=> b!291114 (=> res!240493 e!207445)))

(declare-datatypes ((tuple4!842 0))(
  ( (tuple4!843 (_1!12704 (_ BitVec 32)) (_2!12704 (_ BitVec 32)) (_3!1273 (_ BitVec 32)) (_4!421 (_ BitVec 32))) )
))
(declare-fun lt!422811 () tuple4!842)

(assert (=> b!291114 (= res!240493 (bvsge (_1!12704 lt!422811) (_2!12704 lt!422811)))))

(assert (=> b!291114 (= lt!422809 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!422810 () (_ BitVec 32))

(assert (=> b!291114 (= lt!422810 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!842)

(assert (=> b!291114 (= lt!422811 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!291115 () Bool)

(declare-fun arrayRangesEq!1479 (array!17277 array!17277 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!291115 (= e!207445 (arrayRangesEq!1479 arr!273 (_3!1271 lt!422720) (_1!12704 lt!422811) (_2!12704 lt!422811)))))

(declare-fun b!291116 () Bool)

(declare-fun e!207448 () Bool)

(assert (=> b!291116 (= e!207448 e!207444)))

(declare-fun res!240490 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!291116 (= res!240490 (byteRangesEq!0 (select (arr!8493 arr!273) (_3!1273 lt!422811)) (select (arr!8493 (_3!1271 lt!422720)) (_3!1273 lt!422811)) lt!422810 #b00000000000000000000000000001000))))

(assert (=> b!291116 (=> (not res!240490) (not e!207444))))

(declare-fun call!4857 () Bool)

(declare-fun bm!4854 () Bool)

(declare-fun c!13309 () Bool)

(assert (=> bm!4854 (= call!4857 (byteRangesEq!0 (ite c!13309 (select (arr!8493 arr!273) (_3!1273 lt!422811)) (select (arr!8493 arr!273) (_4!421 lt!422811))) (ite c!13309 (select (arr!8493 (_3!1271 lt!422720)) (_3!1273 lt!422811)) (select (arr!8493 (_3!1271 lt!422720)) (_4!421 lt!422811))) (ite c!13309 lt!422810 #b00000000000000000000000000000000) lt!422809))))

(declare-fun b!291117 () Bool)

(assert (=> b!291117 (= e!207448 call!4857)))

(declare-fun b!291118 () Bool)

(assert (=> b!291118 (= e!207447 e!207448)))

(assert (=> b!291118 (= c!13309 (= (_3!1273 lt!422811) (_4!421 lt!422811)))))

(declare-fun b!291119 () Bool)

(assert (=> b!291119 (= e!207446 call!4857)))

(declare-fun d!98616 () Bool)

(declare-fun res!240491 () Bool)

(assert (=> d!98616 (=> res!240491 e!207443)))

(assert (=> d!98616 (= res!240491 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98616 (= (arrayBitRangesEq!0 arr!273 (_3!1271 lt!422720) #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!207443)))

(assert (= (and d!98616 (not res!240491)) b!291114))

(assert (= (and b!291114 (not res!240493)) b!291115))

(assert (= (and b!291114 res!240492) b!291118))

(assert (= (and b!291118 c!13309) b!291117))

(assert (= (and b!291118 (not c!13309)) b!291116))

(assert (= (and b!291116 res!240490) b!291113))

(assert (= (and b!291113 (not res!240489)) b!291119))

(assert (= (or b!291117 b!291119) bm!4854))

(declare-fun m!425833 () Bool)

(assert (=> b!291114 m!425833))

(declare-fun m!425835 () Bool)

(assert (=> b!291115 m!425835))

(declare-fun m!425837 () Bool)

(assert (=> b!291116 m!425837))

(declare-fun m!425839 () Bool)

(assert (=> b!291116 m!425839))

(assert (=> b!291116 m!425837))

(assert (=> b!291116 m!425839))

(declare-fun m!425841 () Bool)

(assert (=> b!291116 m!425841))

(assert (=> bm!4854 m!425837))

(declare-fun m!425843 () Bool)

(assert (=> bm!4854 m!425843))

(declare-fun m!425845 () Bool)

(assert (=> bm!4854 m!425845))

(assert (=> bm!4854 m!425839))

(declare-fun m!425847 () Bool)

(assert (=> bm!4854 m!425847))

(assert (=> b!291053 d!98616))

(declare-fun b!291120 () Bool)

(declare-fun res!240494 () Bool)

(declare-fun lt!422812 () (_ BitVec 32))

(assert (=> b!291120 (= res!240494 (= lt!422812 #b00000000000000000000000000000000))))

(declare-fun e!207452 () Bool)

(assert (=> b!291120 (=> res!240494 e!207452)))

(declare-fun e!207450 () Bool)

(assert (=> b!291120 (= e!207450 e!207452)))

(declare-fun b!291121 () Bool)

(declare-fun e!207449 () Bool)

(declare-fun e!207453 () Bool)

(assert (=> b!291121 (= e!207449 e!207453)))

(declare-fun res!240497 () Bool)

(assert (=> b!291121 (=> (not res!240497) (not e!207453))))

(declare-fun e!207451 () Bool)

(assert (=> b!291121 (= res!240497 e!207451)))

(declare-fun res!240498 () Bool)

(assert (=> b!291121 (=> res!240498 e!207451)))

(declare-fun lt!422814 () tuple4!842)

(assert (=> b!291121 (= res!240498 (bvsge (_1!12704 lt!422814) (_2!12704 lt!422814)))))

(assert (=> b!291121 (= lt!422812 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!422813 () (_ BitVec 32))

(assert (=> b!291121 (= lt!422813 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291121 (= lt!422814 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!291122 () Bool)

(assert (=> b!291122 (= e!207451 (arrayRangesEq!1479 arr!273 lt!422722 (_1!12704 lt!422814) (_2!12704 lt!422814)))))

(declare-fun b!291123 () Bool)

(declare-fun e!207454 () Bool)

(assert (=> b!291123 (= e!207454 e!207450)))

(declare-fun res!240495 () Bool)

(assert (=> b!291123 (= res!240495 (byteRangesEq!0 (select (arr!8493 arr!273) (_3!1273 lt!422814)) (select (arr!8493 lt!422722) (_3!1273 lt!422814)) lt!422813 #b00000000000000000000000000001000))))

(assert (=> b!291123 (=> (not res!240495) (not e!207450))))

(declare-fun bm!4855 () Bool)

(declare-fun c!13310 () Bool)

(declare-fun call!4858 () Bool)

(assert (=> bm!4855 (= call!4858 (byteRangesEq!0 (ite c!13310 (select (arr!8493 arr!273) (_3!1273 lt!422814)) (select (arr!8493 arr!273) (_4!421 lt!422814))) (ite c!13310 (select (arr!8493 lt!422722) (_3!1273 lt!422814)) (select (arr!8493 lt!422722) (_4!421 lt!422814))) (ite c!13310 lt!422813 #b00000000000000000000000000000000) lt!422812))))

(declare-fun b!291124 () Bool)

(assert (=> b!291124 (= e!207454 call!4858)))

(declare-fun b!291125 () Bool)

(assert (=> b!291125 (= e!207453 e!207454)))

(assert (=> b!291125 (= c!13310 (= (_3!1273 lt!422814) (_4!421 lt!422814)))))

(declare-fun b!291126 () Bool)

(assert (=> b!291126 (= e!207452 call!4858)))

(declare-fun d!98618 () Bool)

(declare-fun res!240496 () Bool)

(assert (=> d!98618 (=> res!240496 e!207449)))

(assert (=> d!98618 (= res!240496 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98618 (= (arrayBitRangesEq!0 arr!273 lt!422722 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!207449)))

(assert (= (and d!98618 (not res!240496)) b!291121))

(assert (= (and b!291121 (not res!240498)) b!291122))

(assert (= (and b!291121 res!240497) b!291125))

(assert (= (and b!291125 c!13310) b!291124))

(assert (= (and b!291125 (not c!13310)) b!291123))

(assert (= (and b!291123 res!240495) b!291120))

(assert (= (and b!291120 (not res!240494)) b!291126))

(assert (= (or b!291124 b!291126) bm!4855))

(assert (=> b!291121 m!425833))

(declare-fun m!425849 () Bool)

(assert (=> b!291122 m!425849))

(declare-fun m!425851 () Bool)

(assert (=> b!291123 m!425851))

(declare-fun m!425853 () Bool)

(assert (=> b!291123 m!425853))

(assert (=> b!291123 m!425851))

(assert (=> b!291123 m!425853))

(declare-fun m!425855 () Bool)

(assert (=> b!291123 m!425855))

(assert (=> bm!4855 m!425851))

(declare-fun m!425857 () Bool)

(assert (=> bm!4855 m!425857))

(declare-fun m!425859 () Bool)

(assert (=> bm!4855 m!425859))

(assert (=> bm!4855 m!425853))

(declare-fun m!425861 () Bool)

(assert (=> bm!4855 m!425861))

(assert (=> b!291053 d!98618))

(declare-fun d!98620 () Bool)

(declare-fun e!207457 () Bool)

(assert (=> d!98620 e!207457))

(declare-fun res!240501 () Bool)

(assert (=> d!98620 (=> (not res!240501) (not e!207457))))

(assert (=> d!98620 (= res!240501 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!422817 () Unit!20223)

(declare-fun choose!27 (BitStream!12968 BitStream!12968 (_ BitVec 64) (_ BitVec 64)) Unit!20223)

(assert (=> d!98620 (= lt!422817 (choose!27 thiss!1728 (_2!12698 lt!422719) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!98620 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!98620 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12698 lt!422719) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!422817)))

(declare-fun b!291129 () Bool)

(assert (=> b!291129 (= e!207457 (validate_offset_bits!1 ((_ sign_extend 32) (size!7479 (buf!7545 (_2!12698 lt!422719)))) ((_ sign_extend 32) (currentByte!13970 (_2!12698 lt!422719))) ((_ sign_extend 32) (currentBit!13965 (_2!12698 lt!422719))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!98620 res!240501) b!291129))

(declare-fun m!425863 () Bool)

(assert (=> d!98620 m!425863))

(assert (=> b!291129 m!425725))

(assert (=> b!291053 d!98620))

(declare-fun d!98622 () Bool)

(assert (=> d!98622 (arrayBitRangesEq!0 arr!273 (_3!1271 lt!422720) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!422820 () Unit!20223)

(declare-fun choose!49 (array!17277 array!17277 array!17277 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20223)

(assert (=> d!98622 (= lt!422820 (choose!49 arr!273 lt!422722 (_3!1271 lt!422720) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98622 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98622 (= (arrayBitRangesEqTransitive!0 arr!273 lt!422722 (_3!1271 lt!422720) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!422820)))

(declare-fun bs!25124 () Bool)

(assert (= bs!25124 d!98622))

(assert (=> bs!25124 m!425745))

(declare-fun m!425865 () Bool)

(assert (=> bs!25124 m!425865))

(assert (=> b!291053 d!98622))

(declare-fun b!291244 () Bool)

(declare-fun res!240595 () Bool)

(declare-fun e!207527 () Bool)

(assert (=> b!291244 (=> (not res!240595) (not e!207527))))

(declare-fun lt!423182 () tuple3!1702)

(assert (=> b!291244 (= res!240595 (and (= (buf!7545 (_2!12698 lt!422719)) (buf!7545 (_2!12699 lt!423182))) (= (size!7479 lt!422722) (size!7479 (_3!1271 lt!423182)))))))

(declare-fun lt!423184 () tuple3!1702)

(declare-fun b!291245 () Bool)

(declare-fun e!207529 () Bool)

(assert (=> b!291245 (= e!207529 (and (= (buf!7545 (_2!12698 lt!422719)) (buf!7545 (_2!12699 lt!423184))) (= (size!7479 lt!422722) (size!7479 (_3!1271 lt!423184)))))))

(declare-fun b!291246 () Bool)

(declare-fun e!207528 () Bool)

(declare-datatypes ((tuple2!22862 0))(
  ( (tuple2!22863 (_1!12706 BitStream!12968) (_2!12706 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!12968) tuple2!22862)

(assert (=> b!291246 (= e!207528 (= (bitAt!0 (_3!1271 lt!423182) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!12706 (readBitPure!0 (_2!12698 lt!422719)))))))

(declare-fun c!13323 () Bool)

(declare-fun lt!423188 () (_ BitVec 64))

(declare-fun lt!423179 () (_ BitVec 32))

(declare-fun lt!423180 () (_ BitVec 32))

(declare-fun lt!423177 () array!17277)

(declare-fun call!4880 () Bool)

(declare-fun lt!423197 () tuple2!22854)

(declare-fun lt!423199 () (_ BitVec 64))

(declare-fun lt!423185 () array!17277)

(declare-fun bm!4877 () Bool)

(assert (=> bm!4877 (= call!4880 (arrayBitRangesEq!0 (ite c!13323 lt!422722 lt!423177) (ite c!13323 (array!17278 (store (arr!8493 lt!422722) lt!423180 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8493 lt!422722) lt!423180)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423179)))) ((_ sign_extend 24) (ite (_1!12698 lt!423197) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423179) #b00000000))))) (size!7479 lt!422722)) lt!423185) (ite c!13323 #b0000000000000000000000000000000000000000000000000000000000000000 lt!423199) (ite c!13323 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!423188)))))

(declare-fun b!291247 () Bool)

(declare-datatypes ((List!962 0))(
  ( (Nil!959) (Cons!958 (h!1077 Bool) (t!1847 List!962)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!12968 array!17277 (_ BitVec 64) (_ BitVec 64)) List!962)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!12968 BitStream!12968 (_ BitVec 64)) List!962)

(assert (=> b!291247 (= e!207527 (= (byteArrayBitContentToList!0 (_2!12699 lt!423182) (_3!1271 lt!423182) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!12699 lt!423182) (_2!12698 lt!422719) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!291247 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!291247 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!291248 () Bool)

(declare-fun res!240597 () Bool)

(assert (=> b!291248 (=> (not res!240597) (not e!207527))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!291248 (= res!240597 (invariant!0 (currentBit!13965 (_2!12699 lt!423182)) (currentByte!13970 (_2!12699 lt!423182)) (size!7479 (buf!7545 (_2!12699 lt!423182)))))))

(declare-fun b!291249 () Bool)

(declare-fun res!240593 () Bool)

(assert (=> b!291249 (=> (not res!240593) (not e!207527))))

(assert (=> b!291249 (= res!240593 (arrayBitRangesEq!0 lt!422722 (_3!1271 lt!423182) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!423201 () Unit!20223)

(declare-fun b!291250 () Bool)

(declare-fun e!207526 () tuple3!1702)

(assert (=> b!291250 (= e!207526 (tuple3!1703 lt!423201 (_2!12698 lt!422719) lt!422722))))

(declare-fun lt!423178 () Unit!20223)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17277) Unit!20223)

(assert (=> b!291250 (= lt!423178 (arrayBitRangesEqReflexiveLemma!0 lt!422722))))

(declare-fun call!4879 () Bool)

(assert (=> b!291250 call!4879))

(declare-fun lt!423170 () Unit!20223)

(assert (=> b!291250 (= lt!423170 lt!423178)))

(assert (=> b!291250 (= lt!423177 lt!422722)))

(assert (=> b!291250 (= lt!423185 lt!422722)))

(declare-fun lt!423190 () (_ BitVec 64))

(assert (=> b!291250 (= lt!423190 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423187 () (_ BitVec 64))

(assert (=> b!291250 (= lt!423187 ((_ sign_extend 32) (size!7479 lt!422722)))))

(declare-fun lt!423193 () (_ BitVec 64))

(assert (=> b!291250 (= lt!423193 (bvmul lt!423187 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!291250 (= lt!423199 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!291250 (= lt!423188 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17277 array!17277 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20223)

(assert (=> b!291250 (= lt!423201 (arrayBitRangesEqSlicedLemma!0 lt!423177 lt!423185 lt!423190 lt!423193 lt!423199 lt!423188))))

(assert (=> b!291250 call!4880))

(declare-fun bm!4876 () Bool)

(assert (=> bm!4876 (= call!4879 (arrayBitRangesEq!0 lt!422722 (ite c!13323 (_3!1271 lt!423184) lt!422722) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!13323 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7479 lt!422722)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun d!98624 () Bool)

(assert (=> d!98624 e!207527))

(declare-fun res!240594 () Bool)

(assert (=> d!98624 (=> (not res!240594) (not e!207527))))

(declare-fun lt!423175 () (_ BitVec 64))

(assert (=> d!98624 (= res!240594 (= (bvsub lt!423175 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7479 (buf!7545 (_2!12699 lt!423182))) (currentByte!13970 (_2!12699 lt!423182)) (currentBit!13965 (_2!12699 lt!423182)))))))

(assert (=> d!98624 (or (= (bvand lt!423175 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!423175 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!423175 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!423183 () (_ BitVec 64))

(assert (=> d!98624 (= lt!423175 (bvadd lt!423183 to!474))))

(assert (=> d!98624 (or (not (= (bvand lt!423183 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!423183 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!423183 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98624 (= lt!423183 (bitIndex!0 (size!7479 (buf!7545 (_2!12698 lt!422719))) (currentByte!13970 (_2!12698 lt!422719)) (currentBit!13965 (_2!12698 lt!422719))))))

(assert (=> d!98624 (= lt!423182 e!207526)))

(assert (=> d!98624 (= c!13323 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!98624 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!98624 (= (readBitsLoop!0 (_2!12698 lt!422719) nBits!523 lt!422722 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!423182)))

(declare-fun b!291251 () Bool)

(declare-fun lt!423186 () Unit!20223)

(assert (=> b!291251 (= e!207526 (tuple3!1703 lt!423186 (_2!12699 lt!423184) (_3!1271 lt!423184)))))

(assert (=> b!291251 (= lt!423197 (readBit!0 (_2!12698 lt!422719)))))

(declare-fun lt!423191 () (_ BitVec 32))

(assert (=> b!291251 (= lt!423191 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!423167 () (_ BitVec 32))

(assert (=> b!291251 (= lt!423167 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!423200 () array!17277)

(assert (=> b!291251 (= lt!423200 (array!17278 (store (arr!8493 lt!422722) lt!423191 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8493 lt!422722) lt!423191)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423167)))) ((_ sign_extend 24) (ite (_1!12698 lt!423197) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423167) #b00000000))))) (size!7479 lt!422722)))))

(declare-fun lt!423195 () (_ BitVec 64))

(assert (=> b!291251 (= lt!423195 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!423172 () (_ BitVec 64))

(assert (=> b!291251 (= lt!423172 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!423194 () Unit!20223)

(assert (=> b!291251 (= lt!423194 (validateOffsetBitsIneqLemma!0 (_2!12698 lt!422719) (_2!12698 lt!423197) lt!423195 lt!423172))))

(assert (=> b!291251 (validate_offset_bits!1 ((_ sign_extend 32) (size!7479 (buf!7545 (_2!12698 lt!423197)))) ((_ sign_extend 32) (currentByte!13970 (_2!12698 lt!423197))) ((_ sign_extend 32) (currentBit!13965 (_2!12698 lt!423197))) (bvsub lt!423195 lt!423172))))

(declare-fun lt!423174 () Unit!20223)

(assert (=> b!291251 (= lt!423174 lt!423194)))

(assert (=> b!291251 (= lt!423184 (readBitsLoop!0 (_2!12698 lt!423197) nBits!523 lt!423200 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!240592 () Bool)

(assert (=> b!291251 (= res!240592 (= (bvsub (bvadd (bitIndex!0 (size!7479 (buf!7545 (_2!12698 lt!422719))) (currentByte!13970 (_2!12698 lt!422719)) (currentBit!13965 (_2!12698 lt!422719))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7479 (buf!7545 (_2!12699 lt!423184))) (currentByte!13970 (_2!12699 lt!423184)) (currentBit!13965 (_2!12699 lt!423184)))))))

(assert (=> b!291251 (=> (not res!240592) (not e!207529))))

(assert (=> b!291251 e!207529))

(declare-fun lt!423169 () Unit!20223)

(declare-fun Unit!20233 () Unit!20223)

(assert (=> b!291251 (= lt!423169 Unit!20233)))

(assert (=> b!291251 (= lt!423180 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291251 (= lt!423179 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!423192 () Unit!20223)

(assert (=> b!291251 (= lt!423192 (arrayBitRangesUpdatedAtLemma!0 lt!422722 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!12698 lt!423197)))))

(assert (=> b!291251 call!4880))

(declare-fun lt!423166 () Unit!20223)

(assert (=> b!291251 (= lt!423166 lt!423192)))

(declare-fun lt!423181 () (_ BitVec 64))

(assert (=> b!291251 (= lt!423181 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423168 () Unit!20223)

(assert (=> b!291251 (= lt!423168 (arrayBitRangesEqTransitive!0 lt!422722 lt!423200 (_3!1271 lt!423184) lt!423181 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!291251 (arrayBitRangesEq!0 lt!422722 (_3!1271 lt!423184) lt!423181 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!423198 () Unit!20223)

(assert (=> b!291251 (= lt!423198 lt!423168)))

(assert (=> b!291251 call!4879))

(declare-fun lt!423196 () Unit!20223)

(declare-fun Unit!20234 () Unit!20223)

(assert (=> b!291251 (= lt!423196 Unit!20234)))

(declare-fun lt!423171 () Unit!20223)

(assert (=> b!291251 (= lt!423171 (arrayBitRangesEqImpliesEq!0 lt!423200 (_3!1271 lt!423184) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!291251 (= (bitAt!0 lt!423200 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1271 lt!423184) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!423189 () Unit!20223)

(assert (=> b!291251 (= lt!423189 lt!423171)))

(declare-fun lt!423176 () Unit!20223)

(declare-fun Unit!20235 () Unit!20223)

(assert (=> b!291251 (= lt!423176 Unit!20235)))

(declare-fun lt!423173 () Bool)

(assert (=> b!291251 (= lt!423173 (= (bitAt!0 (_3!1271 lt!423184) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!12698 lt!423197)))))

(declare-fun Unit!20236 () Unit!20223)

(assert (=> b!291251 (= lt!423186 Unit!20236)))

(assert (=> b!291251 lt!423173))

(declare-fun b!291252 () Bool)

(declare-fun res!240591 () Bool)

(assert (=> b!291252 (=> (not res!240591) (not e!207527))))

(assert (=> b!291252 (= res!240591 e!207528)))

(declare-fun res!240596 () Bool)

(assert (=> b!291252 (=> res!240596 e!207528)))

(assert (=> b!291252 (= res!240596 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(assert (= (and d!98624 c!13323) b!291251))

(assert (= (and d!98624 (not c!13323)) b!291250))

(assert (= (and b!291251 res!240592) b!291245))

(assert (= (or b!291251 b!291250) bm!4877))

(assert (= (or b!291251 b!291250) bm!4876))

(assert (= (and d!98624 res!240594) b!291244))

(assert (= (and b!291244 res!240595) b!291249))

(assert (= (and b!291249 res!240593) b!291252))

(assert (= (and b!291252 (not res!240596)) b!291246))

(assert (= (and b!291252 res!240591) b!291248))

(assert (= (and b!291248 res!240597) b!291247))

(declare-fun m!426041 () Bool)

(assert (=> b!291247 m!426041))

(declare-fun m!426043 () Bool)

(assert (=> b!291247 m!426043))

(declare-fun m!426045 () Bool)

(assert (=> b!291248 m!426045))

(declare-fun m!426047 () Bool)

(assert (=> bm!4877 m!426047))

(declare-fun m!426049 () Bool)

(assert (=> bm!4877 m!426049))

(declare-fun m!426051 () Bool)

(assert (=> bm!4877 m!426051))

(declare-fun m!426053 () Bool)

(assert (=> bm!4877 m!426053))

(declare-fun m!426055 () Bool)

(assert (=> b!291251 m!426055))

(declare-fun m!426057 () Bool)

(assert (=> b!291251 m!426057))

(declare-fun m!426059 () Bool)

(assert (=> b!291251 m!426059))

(declare-fun m!426061 () Bool)

(assert (=> b!291251 m!426061))

(declare-fun m!426063 () Bool)

(assert (=> b!291251 m!426063))

(declare-fun m!426065 () Bool)

(assert (=> b!291251 m!426065))

(declare-fun m!426067 () Bool)

(assert (=> b!291251 m!426067))

(declare-fun m!426069 () Bool)

(assert (=> b!291251 m!426069))

(declare-fun m!426071 () Bool)

(assert (=> b!291251 m!426071))

(declare-fun m!426073 () Bool)

(assert (=> b!291251 m!426073))

(declare-fun m!426075 () Bool)

(assert (=> b!291251 m!426075))

(declare-fun m!426077 () Bool)

(assert (=> b!291251 m!426077))

(declare-fun m!426079 () Bool)

(assert (=> b!291251 m!426079))

(declare-fun m!426081 () Bool)

(assert (=> b!291251 m!426081))

(declare-fun m!426083 () Bool)

(assert (=> b!291251 m!426083))

(declare-fun m!426085 () Bool)

(assert (=> b!291250 m!426085))

(declare-fun m!426087 () Bool)

(assert (=> b!291250 m!426087))

(declare-fun m!426089 () Bool)

(assert (=> bm!4876 m!426089))

(declare-fun m!426091 () Bool)

(assert (=> b!291249 m!426091))

(declare-fun m!426093 () Bool)

(assert (=> b!291246 m!426093))

(declare-fun m!426095 () Bool)

(assert (=> b!291246 m!426095))

(declare-fun m!426097 () Bool)

(assert (=> d!98624 m!426097))

(assert (=> d!98624 m!426077))

(assert (=> b!291053 d!98624))

(declare-fun d!98650 () Bool)

(assert (=> d!98650 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7479 (buf!7545 (_2!12698 lt!422719)))) ((_ sign_extend 32) (currentByte!13970 (_2!12698 lt!422719))) ((_ sign_extend 32) (currentBit!13965 (_2!12698 lt!422719))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7479 (buf!7545 (_2!12698 lt!422719)))) ((_ sign_extend 32) (currentByte!13970 (_2!12698 lt!422719))) ((_ sign_extend 32) (currentBit!13965 (_2!12698 lt!422719)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25129 () Bool)

(assert (= bs!25129 d!98650))

(declare-fun m!426099 () Bool)

(assert (=> bs!25129 m!426099))

(assert (=> b!291053 d!98650))

(declare-fun d!98652 () Bool)

(declare-fun e!207537 () Bool)

(assert (=> d!98652 e!207537))

(declare-fun res!240607 () Bool)

(assert (=> d!98652 (=> (not res!240607) (not e!207537))))

(declare-fun lt!423238 () (_ BitVec 64))

(declare-fun lt!423237 () (_ BitVec 64))

(declare-fun lt!423240 () (_ BitVec 64))

(assert (=> d!98652 (= res!240607 (= lt!423237 (bvsub lt!423238 lt!423240)))))

(assert (=> d!98652 (or (= (bvand lt!423238 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!423240 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!423238 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!423238 lt!423240) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98652 (= lt!423240 (remainingBits!0 ((_ sign_extend 32) (size!7479 (buf!7545 thiss!1728))) ((_ sign_extend 32) (currentByte!13970 thiss!1728)) ((_ sign_extend 32) (currentBit!13965 thiss!1728))))))

(declare-fun lt!423241 () (_ BitVec 64))

(declare-fun lt!423239 () (_ BitVec 64))

(assert (=> d!98652 (= lt!423238 (bvmul lt!423241 lt!423239))))

(assert (=> d!98652 (or (= lt!423241 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!423239 (bvsdiv (bvmul lt!423241 lt!423239) lt!423241)))))

(assert (=> d!98652 (= lt!423239 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!98652 (= lt!423241 ((_ sign_extend 32) (size!7479 (buf!7545 thiss!1728))))))

(assert (=> d!98652 (= lt!423237 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13970 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13965 thiss!1728))))))

(assert (=> d!98652 (invariant!0 (currentBit!13965 thiss!1728) (currentByte!13970 thiss!1728) (size!7479 (buf!7545 thiss!1728)))))

(assert (=> d!98652 (= (bitIndex!0 (size!7479 (buf!7545 thiss!1728)) (currentByte!13970 thiss!1728) (currentBit!13965 thiss!1728)) lt!423237)))

(declare-fun b!291262 () Bool)

(declare-fun res!240608 () Bool)

(assert (=> b!291262 (=> (not res!240608) (not e!207537))))

(assert (=> b!291262 (= res!240608 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!423237))))

(declare-fun b!291263 () Bool)

(declare-fun lt!423242 () (_ BitVec 64))

(assert (=> b!291263 (= e!207537 (bvsle lt!423237 (bvmul lt!423242 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291263 (or (= lt!423242 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!423242 #b0000000000000000000000000000000000000000000000000000000000001000) lt!423242)))))

(assert (=> b!291263 (= lt!423242 ((_ sign_extend 32) (size!7479 (buf!7545 thiss!1728))))))

(assert (= (and d!98652 res!240607) b!291262))

(assert (= (and b!291262 res!240608) b!291263))

(assert (=> d!98652 m!425831))

(declare-fun m!426111 () Bool)

(assert (=> d!98652 m!426111))

(assert (=> b!291053 d!98652))

(declare-fun d!98658 () Bool)

(assert (=> d!98658 (= (bitAt!0 lt!422722 from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8493 lt!422722) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25132 () Bool)

(assert (= bs!25132 d!98658))

(declare-fun m!426115 () Bool)

(assert (=> bs!25132 m!426115))

(declare-fun m!426117 () Bool)

(assert (=> bs!25132 m!426117))

(assert (=> b!291053 d!98658))

(declare-fun d!98664 () Bool)

(declare-fun e!207539 () Bool)

(assert (=> d!98664 e!207539))

(declare-fun res!240610 () Bool)

(assert (=> d!98664 (=> (not res!240610) (not e!207539))))

(declare-fun lt!423247 () (_ BitVec 64))

(declare-fun lt!423245 () (_ BitVec 64))

(declare-fun lt!423244 () (_ BitVec 64))

(assert (=> d!98664 (= res!240610 (= lt!423244 (bvsub lt!423245 lt!423247)))))

(assert (=> d!98664 (or (= (bvand lt!423245 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!423247 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!423245 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!423245 lt!423247) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98664 (= lt!423247 (remainingBits!0 ((_ sign_extend 32) (size!7479 (buf!7545 (_2!12699 lt!422720)))) ((_ sign_extend 32) (currentByte!13970 (_2!12699 lt!422720))) ((_ sign_extend 32) (currentBit!13965 (_2!12699 lt!422720)))))))

(declare-fun lt!423248 () (_ BitVec 64))

(declare-fun lt!423246 () (_ BitVec 64))

(assert (=> d!98664 (= lt!423245 (bvmul lt!423248 lt!423246))))

(assert (=> d!98664 (or (= lt!423248 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!423246 (bvsdiv (bvmul lt!423248 lt!423246) lt!423248)))))

(assert (=> d!98664 (= lt!423246 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!98664 (= lt!423248 ((_ sign_extend 32) (size!7479 (buf!7545 (_2!12699 lt!422720)))))))

(assert (=> d!98664 (= lt!423244 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13970 (_2!12699 lt!422720))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13965 (_2!12699 lt!422720)))))))

(assert (=> d!98664 (invariant!0 (currentBit!13965 (_2!12699 lt!422720)) (currentByte!13970 (_2!12699 lt!422720)) (size!7479 (buf!7545 (_2!12699 lt!422720))))))

(assert (=> d!98664 (= (bitIndex!0 (size!7479 (buf!7545 (_2!12699 lt!422720))) (currentByte!13970 (_2!12699 lt!422720)) (currentBit!13965 (_2!12699 lt!422720))) lt!423244)))

(declare-fun b!291265 () Bool)

(declare-fun res!240611 () Bool)

(assert (=> b!291265 (=> (not res!240611) (not e!207539))))

(assert (=> b!291265 (= res!240611 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!423244))))

(declare-fun b!291266 () Bool)

(declare-fun lt!423249 () (_ BitVec 64))

(assert (=> b!291266 (= e!207539 (bvsle lt!423244 (bvmul lt!423249 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291266 (or (= lt!423249 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!423249 #b0000000000000000000000000000000000000000000000000000000000001000) lt!423249)))))

(assert (=> b!291266 (= lt!423249 ((_ sign_extend 32) (size!7479 (buf!7545 (_2!12699 lt!422720)))))))

(assert (= (and d!98664 res!240610) b!291265))

(assert (= (and b!291265 res!240611) b!291266))

(declare-fun m!426119 () Bool)

(assert (=> d!98664 m!426119))

(declare-fun m!426121 () Bool)

(assert (=> d!98664 m!426121))

(assert (=> b!291053 d!98664))

(declare-fun d!98666 () Bool)

(assert (=> d!98666 (= (bitAt!0 (_3!1271 lt!422720) from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8493 (_3!1271 lt!422720)) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25133 () Bool)

(assert (= bs!25133 d!98666))

(declare-fun m!426123 () Bool)

(assert (=> bs!25133 m!426123))

(assert (=> bs!25133 m!426117))

(assert (=> b!291053 d!98666))

(declare-fun d!98668 () Bool)

(assert (=> d!98668 (= (bitAt!0 lt!422722 from!505) (bitAt!0 (_3!1271 lt!422720) from!505))))

(declare-fun lt!423252 () Unit!20223)

(declare-fun choose!31 (array!17277 array!17277 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20223)

(assert (=> d!98668 (= lt!423252 (choose!31 lt!422722 (_3!1271 lt!422720) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98668 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98668 (= (arrayBitRangesEqImpliesEq!0 lt!422722 (_3!1271 lt!422720) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!423252)))

(declare-fun bs!25134 () Bool)

(assert (= bs!25134 d!98668))

(assert (=> bs!25134 m!425735))

(assert (=> bs!25134 m!425755))

(declare-fun m!426125 () Bool)

(assert (=> bs!25134 m!426125))

(assert (=> b!291053 d!98668))

(declare-fun d!98670 () Bool)

(declare-fun e!207546 () Bool)

(assert (=> d!98670 e!207546))

(declare-fun res!240614 () Bool)

(assert (=> d!98670 (=> (not res!240614) (not e!207546))))

(declare-datatypes ((tuple2!22866 0))(
  ( (tuple2!22867 (_1!12708 Unit!20223) (_2!12708 BitStream!12968)) )
))
(declare-fun increaseBitIndex!0 (BitStream!12968) tuple2!22866)

(assert (=> d!98670 (= res!240614 (= (buf!7545 (_2!12708 (increaseBitIndex!0 thiss!1728))) (buf!7545 thiss!1728)))))

(declare-fun lt!423267 () Bool)

(assert (=> d!98670 (= lt!423267 (not (= (bvand ((_ sign_extend 24) (select (arr!8493 (buf!7545 thiss!1728)) (currentByte!13970 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13965 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!423269 () tuple2!22854)

(assert (=> d!98670 (= lt!423269 (tuple2!22855 (not (= (bvand ((_ sign_extend 24) (select (arr!8493 (buf!7545 thiss!1728)) (currentByte!13970 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13965 thiss!1728)))) #b00000000000000000000000000000000)) (_2!12708 (increaseBitIndex!0 thiss!1728))))))

(assert (=> d!98670 (validate_offset_bit!0 ((_ sign_extend 32) (size!7479 (buf!7545 thiss!1728))) ((_ sign_extend 32) (currentByte!13970 thiss!1728)) ((_ sign_extend 32) (currentBit!13965 thiss!1728)))))

(assert (=> d!98670 (= (readBit!0 thiss!1728) lt!423269)))

(declare-fun lt!423273 () (_ BitVec 64))

(declare-fun b!291269 () Bool)

(declare-fun lt!423268 () (_ BitVec 64))

(assert (=> b!291269 (= e!207546 (= (bitIndex!0 (size!7479 (buf!7545 (_2!12708 (increaseBitIndex!0 thiss!1728)))) (currentByte!13970 (_2!12708 (increaseBitIndex!0 thiss!1728))) (currentBit!13965 (_2!12708 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!423268 lt!423273)))))

(assert (=> b!291269 (or (not (= (bvand lt!423268 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!423273 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!423268 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!423268 lt!423273) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!291269 (= lt!423273 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!291269 (= lt!423268 (bitIndex!0 (size!7479 (buf!7545 thiss!1728)) (currentByte!13970 thiss!1728) (currentBit!13965 thiss!1728)))))

(declare-fun lt!423270 () Bool)

(assert (=> b!291269 (= lt!423270 (not (= (bvand ((_ sign_extend 24) (select (arr!8493 (buf!7545 thiss!1728)) (currentByte!13970 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13965 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!423272 () Bool)

(assert (=> b!291269 (= lt!423272 (not (= (bvand ((_ sign_extend 24) (select (arr!8493 (buf!7545 thiss!1728)) (currentByte!13970 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13965 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!423271 () Bool)

(assert (=> b!291269 (= lt!423271 (not (= (bvand ((_ sign_extend 24) (select (arr!8493 (buf!7545 thiss!1728)) (currentByte!13970 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13965 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!98670 res!240614) b!291269))

(declare-fun m!426127 () Bool)

(assert (=> d!98670 m!426127))

(declare-fun m!426129 () Bool)

(assert (=> d!98670 m!426129))

(declare-fun m!426131 () Bool)

(assert (=> d!98670 m!426131))

(assert (=> d!98670 m!425729))

(assert (=> b!291269 m!426131))

(assert (=> b!291269 