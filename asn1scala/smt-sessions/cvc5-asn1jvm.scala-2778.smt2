; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67072 () Bool)

(assert start!67072)

(declare-fun b!300617 () Bool)

(declare-fun res!247769 () Bool)

(declare-fun e!215886 () Bool)

(assert (=> b!300617 (=> (not res!247769) (not e!215886))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18233 0))(
  ( (array!18234 (arr!9001 (Array (_ BitVec 32) (_ BitVec 8))) (size!7918 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18233)

(declare-fun a2!948 () array!18233)

(declare-fun arrayBitRangesEq!0 (array!18233 array!18233 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!300617 (= res!247769 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!300618 () Bool)

(declare-fun e!215891 () Bool)

(declare-fun call!5396 () Bool)

(assert (=> b!300618 (= e!215891 call!5396)))

(declare-fun b!300619 () Bool)

(declare-datatypes ((Unit!21031 0))(
  ( (Unit!21032) )
))
(declare-fun e!215893 () Unit!21031)

(declare-fun lt!436129 () Unit!21031)

(assert (=> b!300619 (= e!215893 lt!436129)))

(declare-datatypes ((tuple4!1044 0))(
  ( (tuple4!1045 (_1!13177 (_ BitVec 32)) (_2!13177 (_ BitVec 32)) (_3!1479 (_ BitVec 32)) (_4!522 (_ BitVec 32))) )
))
(declare-fun lt!436131 () tuple4!1044)

(declare-fun lt!436133 () tuple4!1044)

(declare-fun arrayRangesEqImpliesEq!235 (array!18233 array!18233 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21031)

(assert (=> b!300619 (= lt!436129 (arrayRangesEqImpliesEq!235 a1!948 a2!948 (_1!13177 lt!436131) (_3!1479 lt!436133) (_2!13177 lt!436131)))))

(assert (=> b!300619 (= (select (arr!9001 a1!948) (_3!1479 lt!436133)) (select (arr!9001 a2!948) (_3!1479 lt!436133)))))

(declare-fun b!300620 () Bool)

(declare-fun res!247767 () Bool)

(assert (=> b!300620 (=> (not res!247767) (not e!215886))))

(declare-fun lt!436137 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!300620 (= res!247767 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!436137) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!300621 () Bool)

(declare-fun e!215885 () Bool)

(assert (=> b!300621 (= e!215885 call!5396)))

(declare-fun b!300622 () Bool)

(declare-fun e!215887 () Bool)

(assert (=> b!300622 (= e!215885 e!215887)))

(declare-fun res!247770 () Bool)

(declare-fun lt!436130 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!300622 (= res!247770 (byteRangesEq!0 (select (arr!9001 a1!948) (_3!1479 lt!436131)) (select (arr!9001 a2!948) (_3!1479 lt!436131)) lt!436130 #b00000000000000000000000000000111))))

(assert (=> b!300622 (=> (not res!247770) (not e!215887))))

(declare-fun b!300623 () Bool)

(declare-fun res!247774 () Bool)

(declare-fun lt!436134 () (_ BitVec 32))

(assert (=> b!300623 (= res!247774 (= lt!436134 #b00000000000000000000000000000000))))

(assert (=> b!300623 (=> res!247774 e!215891)))

(assert (=> b!300623 (= e!215887 e!215891)))

(declare-fun b!300624 () Bool)

(declare-fun e!215889 () Unit!21031)

(declare-fun lt!436128 () Unit!21031)

(assert (=> b!300624 (= e!215889 lt!436128)))

(declare-fun arrayRangesEqSlicedLemma!190 (array!18233 array!18233 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21031)

(assert (=> b!300624 (= lt!436128 (arrayRangesEqSlicedLemma!190 a1!948 a2!948 (_1!13177 lt!436131) (_2!13177 lt!436131) (_1!13177 lt!436133) (_2!13177 lt!436133)))))

(declare-fun arrayRangesEq!1580 (array!18233 array!18233 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!300624 (arrayRangesEq!1580 a1!948 a2!948 (_1!13177 lt!436133) (_2!13177 lt!436133))))

(declare-fun b!300625 () Bool)

(declare-fun Unit!21033 () Unit!21031)

(assert (=> b!300625 (= e!215889 Unit!21033)))

(declare-fun res!247773 () Bool)

(declare-fun e!215892 () Bool)

(assert (=> start!67072 (=> (not res!247773) (not e!215892))))

(assert (=> start!67072 (= res!247773 (and (bvsle (size!7918 a1!948) (size!7918 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67072 e!215892))

(assert (=> start!67072 true))

(declare-fun array_inv!7530 (array!18233) Bool)

(assert (=> start!67072 (array_inv!7530 a1!948)))

(assert (=> start!67072 (array_inv!7530 a2!948)))

(declare-fun b!300626 () Bool)

(declare-fun e!215894 () Unit!21031)

(declare-fun Unit!21034 () Unit!21031)

(assert (=> b!300626 (= e!215894 Unit!21034)))

(declare-fun b!300627 () Bool)

(declare-fun e!215895 () Bool)

(assert (=> b!300627 (= e!215886 e!215895)))

(declare-fun res!247775 () Bool)

(assert (=> b!300627 (=> (not res!247775) (not e!215895))))

(assert (=> b!300627 (= res!247775 e!215885)))

(declare-fun c!14008 () Bool)

(assert (=> b!300627 (= c!14008 (= (_3!1479 lt!436131) (_4!522 lt!436131)))))

(declare-fun lt!436135 () Unit!21031)

(assert (=> b!300627 (= lt!436135 e!215889)))

(declare-fun c!14010 () Bool)

(assert (=> b!300627 (= c!14010 (bvslt (_1!13177 lt!436133) (_2!13177 lt!436133)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1044)

(assert (=> b!300627 (= lt!436133 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!300627 (= lt!436134 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300627 (= lt!436130 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300627 (= lt!436131 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!300628 () Bool)

(declare-fun lt!436132 () Unit!21031)

(assert (=> b!300628 (= e!215894 lt!436132)))

(assert (=> b!300628 (= lt!436132 (arrayRangesEqImpliesEq!235 a1!948 a2!948 (_1!13177 lt!436131) (_4!522 lt!436133) (_2!13177 lt!436131)))))

(assert (=> b!300628 (= (select (arr!9001 a1!948) (_4!522 lt!436133)) (select (arr!9001 a2!948) (_4!522 lt!436133)))))

(declare-fun e!215890 () Bool)

(declare-fun b!300629 () Bool)

(assert (=> b!300629 (= e!215890 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 fromSlice!52) (bvsgt toSlice!52 lt!436137)))))

(declare-fun b!300630 () Bool)

(assert (=> b!300630 (= e!215895 e!215890)))

(declare-fun res!247771 () Bool)

(assert (=> b!300630 (=> (not res!247771) (not e!215890))))

(assert (=> b!300630 (= res!247771 (= (_3!1479 lt!436133) (_4!522 lt!436133)))))

(declare-fun lt!436136 () Unit!21031)

(assert (=> b!300630 (= lt!436136 e!215894)))

(declare-fun c!14009 () Bool)

(assert (=> b!300630 (= c!14009 (and (bvslt (_4!522 lt!436133) (_4!522 lt!436131)) (bvslt (_3!1479 lt!436131) (_4!522 lt!436133))))))

(declare-fun lt!436127 () Unit!21031)

(assert (=> b!300630 (= lt!436127 e!215893)))

(declare-fun c!14007 () Bool)

(assert (=> b!300630 (= c!14007 (and (bvslt (_3!1479 lt!436131) (_3!1479 lt!436133)) (bvslt (_3!1479 lt!436133) (_4!522 lt!436131))))))

(declare-fun b!300631 () Bool)

(assert (=> b!300631 (= e!215892 e!215886)))

(declare-fun res!247772 () Bool)

(assert (=> b!300631 (=> (not res!247772) (not e!215886))))

(assert (=> b!300631 (= res!247772 (and (bvsle toBit!258 lt!436137) (bvsle fromBit!258 lt!436137)))))

(assert (=> b!300631 (= lt!436137 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7918 a1!948))))))

(declare-fun bm!5393 () Bool)

(assert (=> bm!5393 (= call!5396 (byteRangesEq!0 (ite c!14008 (select (arr!9001 a1!948) (_3!1479 lt!436131)) (select (arr!9001 a1!948) (_4!522 lt!436131))) (ite c!14008 (select (arr!9001 a2!948) (_3!1479 lt!436131)) (select (arr!9001 a2!948) (_4!522 lt!436131))) (ite c!14008 lt!436130 #b00000000000000000000000000000000) lt!436134))))

(declare-fun b!300632 () Bool)

(declare-fun res!247768 () Bool)

(assert (=> b!300632 (=> (not res!247768) (not e!215890))))

(assert (=> b!300632 (= res!247768 (byteRangesEq!0 (select (arr!9001 a1!948) (_3!1479 lt!436133)) (select (arr!9001 a2!948) (_3!1479 lt!436133)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!300633 () Bool)

(declare-fun Unit!21035 () Unit!21031)

(assert (=> b!300633 (= e!215893 Unit!21035)))

(assert (= (and start!67072 res!247773) b!300631))

(assert (= (and b!300631 res!247772) b!300617))

(assert (= (and b!300617 res!247769) b!300620))

(assert (= (and b!300620 res!247767) b!300627))

(assert (= (and b!300627 c!14010) b!300624))

(assert (= (and b!300627 (not c!14010)) b!300625))

(assert (= (and b!300627 c!14008) b!300621))

(assert (= (and b!300627 (not c!14008)) b!300622))

(assert (= (and b!300622 res!247770) b!300623))

(assert (= (and b!300623 (not res!247774)) b!300618))

(assert (= (or b!300621 b!300618) bm!5393))

(assert (= (and b!300627 res!247775) b!300630))

(assert (= (and b!300630 c!14007) b!300619))

(assert (= (and b!300630 (not c!14007)) b!300633))

(assert (= (and b!300630 c!14009) b!300628))

(assert (= (and b!300630 (not c!14009)) b!300626))

(assert (= (and b!300630 res!247771) b!300632))

(assert (= (and b!300632 res!247768) b!300629))

(declare-fun m!439585 () Bool)

(assert (=> b!300627 m!439585))

(declare-fun m!439587 () Bool)

(assert (=> b!300627 m!439587))

(declare-fun m!439589 () Bool)

(assert (=> b!300628 m!439589))

(declare-fun m!439591 () Bool)

(assert (=> b!300628 m!439591))

(declare-fun m!439593 () Bool)

(assert (=> b!300628 m!439593))

(declare-fun m!439595 () Bool)

(assert (=> b!300619 m!439595))

(declare-fun m!439597 () Bool)

(assert (=> b!300619 m!439597))

(declare-fun m!439599 () Bool)

(assert (=> b!300619 m!439599))

(declare-fun m!439601 () Bool)

(assert (=> start!67072 m!439601))

(declare-fun m!439603 () Bool)

(assert (=> start!67072 m!439603))

(declare-fun m!439605 () Bool)

(assert (=> bm!5393 m!439605))

(declare-fun m!439607 () Bool)

(assert (=> bm!5393 m!439607))

(declare-fun m!439609 () Bool)

(assert (=> bm!5393 m!439609))

(declare-fun m!439611 () Bool)

(assert (=> bm!5393 m!439611))

(declare-fun m!439613 () Bool)

(assert (=> bm!5393 m!439613))

(declare-fun m!439615 () Bool)

(assert (=> b!300617 m!439615))

(assert (=> b!300622 m!439609))

(assert (=> b!300622 m!439607))

(assert (=> b!300622 m!439609))

(assert (=> b!300622 m!439607))

(declare-fun m!439617 () Bool)

(assert (=> b!300622 m!439617))

(declare-fun m!439619 () Bool)

(assert (=> b!300624 m!439619))

(declare-fun m!439621 () Bool)

(assert (=> b!300624 m!439621))

(assert (=> b!300632 m!439597))

(assert (=> b!300632 m!439599))

(assert (=> b!300632 m!439597))

(assert (=> b!300632 m!439599))

(declare-fun m!439623 () Bool)

(assert (=> b!300632 m!439623))

(push 1)

(assert (not b!300632))

(assert (not b!300624))

(assert (not bm!5393))

(assert (not b!300628))

(assert (not b!300617))

(assert (not b!300627))

(assert (not b!300619))

(assert (not start!67072))

(assert (not b!300622))

(check-sat)

(pop 1)

(push 1)

(check-sat)

