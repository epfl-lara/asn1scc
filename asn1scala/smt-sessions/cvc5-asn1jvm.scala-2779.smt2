; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67078 () Bool)

(assert start!67078)

(declare-fun b!300766 () Bool)

(declare-datatypes ((Unit!21046 0))(
  ( (Unit!21047) )
))
(declare-fun e!215993 () Unit!21046)

(declare-fun lt!436229 () Unit!21046)

(assert (=> b!300766 (= e!215993 lt!436229)))

(declare-datatypes ((tuple4!1050 0))(
  ( (tuple4!1051 (_1!13180 (_ BitVec 32)) (_2!13180 (_ BitVec 32)) (_3!1482 (_ BitVec 32)) (_4!525 (_ BitVec 32))) )
))
(declare-fun lt!436239 () tuple4!1050)

(declare-fun lt!436235 () tuple4!1050)

(declare-datatypes ((array!18239 0))(
  ( (array!18240 (arr!9004 (Array (_ BitVec 32) (_ BitVec 8))) (size!7921 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18239)

(declare-fun a2!948 () array!18239)

(declare-fun arrayRangesEqImpliesEq!238 (array!18239 array!18239 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21046)

(assert (=> b!300766 (= lt!436229 (arrayRangesEqImpliesEq!238 a1!948 a2!948 (_1!13180 lt!436239) (_4!525 lt!436235) (_2!13180 lt!436239)))))

(assert (=> b!300766 (= (select (arr!9004 a1!948) (_4!525 lt!436235)) (select (arr!9004 a2!948) (_4!525 lt!436235)))))

(declare-fun b!300767 () Bool)

(declare-fun e!215990 () Bool)

(declare-fun call!5405 () Bool)

(assert (=> b!300767 (= e!215990 call!5405)))

(declare-fun b!300768 () Bool)

(declare-fun res!247845 () Bool)

(declare-fun e!215994 () Bool)

(assert (=> b!300768 (=> (not res!247845) (not e!215994))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!436230 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!300768 (= res!247845 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!436230) (not (= fromSlice!52 toSlice!52))))))

(declare-fun bm!5402 () Bool)

(declare-fun lt!436228 () (_ BitVec 32))

(declare-fun c!14046 () Bool)

(declare-fun lt!436238 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5402 (= call!5405 (byteRangesEq!0 (ite c!14046 (select (arr!9004 a1!948) (_3!1482 lt!436239)) (select (arr!9004 a1!948) (_4!525 lt!436239))) (ite c!14046 (select (arr!9004 a2!948) (_3!1482 lt!436239)) (select (arr!9004 a2!948) (_4!525 lt!436239))) (ite c!14046 lt!436238 #b00000000000000000000000000000000) lt!436228))))

(declare-fun b!300769 () Bool)

(declare-fun e!215996 () Unit!21046)

(declare-fun lt!436231 () Unit!21046)

(assert (=> b!300769 (= e!215996 lt!436231)))

(declare-fun arrayRangesEqSlicedLemma!193 (array!18239 array!18239 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21046)

(assert (=> b!300769 (= lt!436231 (arrayRangesEqSlicedLemma!193 a1!948 a2!948 (_1!13180 lt!436239) (_2!13180 lt!436239) (_1!13180 lt!436235) (_2!13180 lt!436235)))))

(declare-fun arrayRangesEq!1583 (array!18239 array!18239 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!300769 (arrayRangesEq!1583 a1!948 a2!948 (_1!13180 lt!436235) (_2!13180 lt!436235))))

(declare-fun b!300770 () Bool)

(declare-fun e!215995 () Bool)

(assert (=> b!300770 (= e!215995 call!5405)))

(declare-fun b!300771 () Bool)

(declare-fun e!216000 () Bool)

(assert (=> b!300771 (= e!215990 e!216000)))

(declare-fun res!247848 () Bool)

(assert (=> b!300771 (= res!247848 (byteRangesEq!0 (select (arr!9004 a1!948) (_3!1482 lt!436239)) (select (arr!9004 a2!948) (_3!1482 lt!436239)) lt!436238 #b00000000000000000000000000000111))))

(assert (=> b!300771 (=> (not res!247848) (not e!216000))))

(declare-fun b!300772 () Bool)

(declare-fun e!215991 () Unit!21046)

(declare-fun Unit!21048 () Unit!21046)

(assert (=> b!300772 (= e!215991 Unit!21048)))

(declare-fun b!300773 () Bool)

(declare-fun Unit!21049 () Unit!21046)

(assert (=> b!300773 (= e!215996 Unit!21049)))

(declare-fun res!247844 () Bool)

(declare-fun e!215992 () Bool)

(assert (=> start!67078 (=> (not res!247844) (not e!215992))))

(assert (=> start!67078 (= res!247844 (and (bvsle (size!7921 a1!948) (size!7921 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67078 e!215992))

(assert (=> start!67078 true))

(declare-fun array_inv!7533 (array!18239) Bool)

(assert (=> start!67078 (array_inv!7533 a1!948)))

(assert (=> start!67078 (array_inv!7533 a2!948)))

(declare-fun b!300774 () Bool)

(declare-fun res!247847 () Bool)

(assert (=> b!300774 (= res!247847 (= lt!436228 #b00000000000000000000000000000000))))

(assert (=> b!300774 (=> res!247847 e!215995)))

(assert (=> b!300774 (= e!216000 e!215995)))

(declare-fun b!300775 () Bool)

(declare-fun res!247849 () Bool)

(assert (=> b!300775 (=> (not res!247849) (not e!215994))))

(declare-fun arrayBitRangesEq!0 (array!18239 array!18239 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!300775 (= res!247849 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!300776 () Bool)

(declare-fun e!215998 () Bool)

(declare-fun lt!436232 () (_ BitVec 32))

(assert (=> b!300776 (= e!215998 (and (not (= (_3!1482 lt!436235) (_4!525 lt!436235))) (or (bvsgt #b00000000000000000000000000000000 lt!436232) (bvsgt lt!436232 #b00000000000000000000000000000111))))))

(declare-fun lt!436233 () Unit!21046)

(assert (=> b!300776 (= lt!436233 e!215993)))

(declare-fun c!14044 () Bool)

(assert (=> b!300776 (= c!14044 (and (bvslt (_4!525 lt!436235) (_4!525 lt!436239)) (bvslt (_3!1482 lt!436239) (_4!525 lt!436235))))))

(declare-fun lt!436234 () Unit!21046)

(assert (=> b!300776 (= lt!436234 e!215991)))

(declare-fun c!14043 () Bool)

(assert (=> b!300776 (= c!14043 (and (bvslt (_3!1482 lt!436239) (_3!1482 lt!436235)) (bvslt (_3!1482 lt!436235) (_4!525 lt!436239))))))

(declare-fun b!300777 () Bool)

(declare-fun lt!436237 () Unit!21046)

(assert (=> b!300777 (= e!215991 lt!436237)))

(assert (=> b!300777 (= lt!436237 (arrayRangesEqImpliesEq!238 a1!948 a2!948 (_1!13180 lt!436239) (_3!1482 lt!436235) (_2!13180 lt!436239)))))

(assert (=> b!300777 (= (select (arr!9004 a1!948) (_3!1482 lt!436235)) (select (arr!9004 a2!948) (_3!1482 lt!436235)))))

(declare-fun b!300778 () Bool)

(assert (=> b!300778 (= e!215992 e!215994)))

(declare-fun res!247850 () Bool)

(assert (=> b!300778 (=> (not res!247850) (not e!215994))))

(assert (=> b!300778 (= res!247850 (and (bvsle toBit!258 lt!436230) (bvsle fromBit!258 lt!436230)))))

(assert (=> b!300778 (= lt!436230 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7921 a1!948))))))

(declare-fun b!300779 () Bool)

(declare-fun Unit!21050 () Unit!21046)

(assert (=> b!300779 (= e!215993 Unit!21050)))

(declare-fun b!300780 () Bool)

(assert (=> b!300780 (= e!215994 e!215998)))

(declare-fun res!247846 () Bool)

(assert (=> b!300780 (=> (not res!247846) (not e!215998))))

(assert (=> b!300780 (= res!247846 e!215990)))

(assert (=> b!300780 (= c!14046 (= (_3!1482 lt!436239) (_4!525 lt!436239)))))

(declare-fun lt!436236 () Unit!21046)

(assert (=> b!300780 (= lt!436236 e!215996)))

(declare-fun c!14045 () Bool)

(assert (=> b!300780 (= c!14045 (bvslt (_1!13180 lt!436235) (_2!13180 lt!436235)))))

(assert (=> b!300780 (= lt!436232 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1050)

(assert (=> b!300780 (= lt!436235 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!300780 (= lt!436228 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300780 (= lt!436238 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300780 (= lt!436239 (arrayBitIndices!0 fromBit!258 toBit!258))))

(assert (= (and start!67078 res!247844) b!300778))

(assert (= (and b!300778 res!247850) b!300775))

(assert (= (and b!300775 res!247849) b!300768))

(assert (= (and b!300768 res!247845) b!300780))

(assert (= (and b!300780 c!14045) b!300769))

(assert (= (and b!300780 (not c!14045)) b!300773))

(assert (= (and b!300780 c!14046) b!300767))

(assert (= (and b!300780 (not c!14046)) b!300771))

(assert (= (and b!300771 res!247848) b!300774))

(assert (= (and b!300774 (not res!247847)) b!300770))

(assert (= (or b!300767 b!300770) bm!5402))

(assert (= (and b!300780 res!247846) b!300776))

(assert (= (and b!300776 c!14043) b!300777))

(assert (= (and b!300776 (not c!14043)) b!300772))

(assert (= (and b!300776 c!14044) b!300766))

(assert (= (and b!300776 (not c!14044)) b!300779))

(declare-fun m!439705 () Bool)

(assert (=> b!300775 m!439705))

(declare-fun m!439707 () Bool)

(assert (=> b!300769 m!439707))

(declare-fun m!439709 () Bool)

(assert (=> b!300769 m!439709))

(declare-fun m!439711 () Bool)

(assert (=> b!300771 m!439711))

(declare-fun m!439713 () Bool)

(assert (=> b!300771 m!439713))

(assert (=> b!300771 m!439711))

(assert (=> b!300771 m!439713))

(declare-fun m!439715 () Bool)

(assert (=> b!300771 m!439715))

(declare-fun m!439717 () Bool)

(assert (=> b!300780 m!439717))

(declare-fun m!439719 () Bool)

(assert (=> b!300780 m!439719))

(declare-fun m!439721 () Bool)

(assert (=> bm!5402 m!439721))

(declare-fun m!439723 () Bool)

(assert (=> bm!5402 m!439723))

(assert (=> bm!5402 m!439711))

(declare-fun m!439725 () Bool)

(assert (=> bm!5402 m!439725))

(assert (=> bm!5402 m!439713))

(declare-fun m!439727 () Bool)

(assert (=> b!300777 m!439727))

(declare-fun m!439729 () Bool)

(assert (=> b!300777 m!439729))

(declare-fun m!439731 () Bool)

(assert (=> b!300777 m!439731))

(declare-fun m!439733 () Bool)

(assert (=> start!67078 m!439733))

(declare-fun m!439735 () Bool)

(assert (=> start!67078 m!439735))

(declare-fun m!439737 () Bool)

(assert (=> b!300766 m!439737))

(declare-fun m!439739 () Bool)

(assert (=> b!300766 m!439739))

(declare-fun m!439741 () Bool)

(assert (=> b!300766 m!439741))

(push 1)

(assert (not bm!5402))

(assert (not b!300771))

(assert (not b!300775))

(assert (not b!300780))

(assert (not start!67078))

(assert (not b!300766))

(assert (not b!300769))

(assert (not b!300777))

(check-sat)

(pop 1)

(push 1)

(check-sat)

