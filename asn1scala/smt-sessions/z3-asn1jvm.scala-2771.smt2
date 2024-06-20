; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66990 () Bool)

(assert start!66990)

(declare-fun b!299713 () Bool)

(declare-fun res!247280 () Bool)

(declare-fun e!215194 () Bool)

(assert (=> b!299713 (=> (not res!247280) (not e!215194))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!435481 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!299713 (= res!247280 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435481) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!299714 () Bool)

(declare-fun e!215192 () Bool)

(assert (=> b!299714 (= e!215192 e!215194)))

(declare-fun res!247284 () Bool)

(assert (=> b!299714 (=> (not res!247284) (not e!215194))))

(assert (=> b!299714 (= res!247284 (and (bvsle toBit!258 lt!435481) (bvsle fromBit!258 lt!435481)))))

(declare-datatypes ((array!18190 0))(
  ( (array!18191 (arr!8981 (Array (_ BitVec 32) (_ BitVec 8))) (size!7898 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18190)

(assert (=> b!299714 (= lt!435481 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7898 a1!948))))))

(declare-fun b!299715 () Bool)

(declare-fun e!215190 () Bool)

(declare-fun call!5327 () Bool)

(assert (=> b!299715 (= e!215190 call!5327)))

(declare-fun b!299716 () Bool)

(declare-fun e!215198 () Bool)

(assert (=> b!299716 (= e!215198 call!5327)))

(declare-fun b!299717 () Bool)

(declare-fun res!247282 () Bool)

(declare-fun lt!435489 () (_ BitVec 32))

(assert (=> b!299717 (= res!247282 (= lt!435489 #b00000000000000000000000000000000))))

(assert (=> b!299717 (=> res!247282 e!215190)))

(declare-fun e!215197 () Bool)

(assert (=> b!299717 (= e!215197 e!215190)))

(declare-fun b!299718 () Bool)

(declare-fun e!215195 () Bool)

(assert (=> b!299718 (= e!215195 false)))

(declare-datatypes ((Unit!20945 0))(
  ( (Unit!20946) )
))
(declare-fun lt!435487 () Unit!20945)

(declare-fun e!215196 () Unit!20945)

(assert (=> b!299718 (= lt!435487 e!215196)))

(declare-fun c!13800 () Bool)

(declare-datatypes ((tuple4!1004 0))(
  ( (tuple4!1005 (_1!13157 (_ BitVec 32)) (_2!13157 (_ BitVec 32)) (_3!1459 (_ BitVec 32)) (_4!502 (_ BitVec 32))) )
))
(declare-fun lt!435485 () tuple4!1004)

(declare-fun lt!435483 () tuple4!1004)

(assert (=> b!299718 (= c!13800 (and (bvslt (_3!1459 lt!435485) (_3!1459 lt!435483)) (bvslt (_3!1459 lt!435483) (_4!502 lt!435485))))))

(declare-fun b!299719 () Bool)

(declare-fun e!215199 () Unit!20945)

(declare-fun lt!435482 () Unit!20945)

(assert (=> b!299719 (= e!215199 lt!435482)))

(declare-fun a2!948 () array!18190)

(declare-fun arrayRangesEqSlicedLemma!170 (array!18190 array!18190 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20945)

(assert (=> b!299719 (= lt!435482 (arrayRangesEqSlicedLemma!170 a1!948 a2!948 (_1!13157 lt!435485) (_2!13157 lt!435485) (_1!13157 lt!435483) (_2!13157 lt!435483)))))

(declare-fun arrayRangesEq!1560 (array!18190 array!18190 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299719 (arrayRangesEq!1560 a1!948 a2!948 (_1!13157 lt!435483) (_2!13157 lt!435483))))

(declare-fun b!299720 () Bool)

(declare-fun Unit!20947 () Unit!20945)

(assert (=> b!299720 (= e!215199 Unit!20947)))

(declare-fun b!299721 () Bool)

(assert (=> b!299721 (= e!215194 e!215195)))

(declare-fun res!247281 () Bool)

(assert (=> b!299721 (=> (not res!247281) (not e!215195))))

(assert (=> b!299721 (= res!247281 e!215198)))

(declare-fun c!13798 () Bool)

(assert (=> b!299721 (= c!13798 (= (_3!1459 lt!435485) (_4!502 lt!435485)))))

(declare-fun lt!435488 () Unit!20945)

(assert (=> b!299721 (= lt!435488 e!215199)))

(declare-fun c!13799 () Bool)

(assert (=> b!299721 (= c!13799 (bvslt (_1!13157 lt!435483) (_2!13157 lt!435483)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1004)

(assert (=> b!299721 (= lt!435483 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!299721 (= lt!435489 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!435484 () (_ BitVec 32))

(assert (=> b!299721 (= lt!435484 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!299721 (= lt!435485 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun bm!5324 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5324 (= call!5327 (byteRangesEq!0 (ite c!13798 (select (arr!8981 a1!948) (_3!1459 lt!435485)) (select (arr!8981 a1!948) (_4!502 lt!435485))) (ite c!13798 (select (arr!8981 a2!948) (_3!1459 lt!435485)) (select (arr!8981 a2!948) (_4!502 lt!435485))) (ite c!13798 lt!435484 #b00000000000000000000000000000000) lt!435489))))

(declare-fun b!299722 () Bool)

(declare-fun lt!435486 () Unit!20945)

(assert (=> b!299722 (= e!215196 lt!435486)))

(declare-fun arrayRangesEqImpliesEq!215 (array!18190 array!18190 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20945)

(assert (=> b!299722 (= lt!435486 (arrayRangesEqImpliesEq!215 a1!948 a2!948 (_1!13157 lt!435485) (_3!1459 lt!435483) (_2!13157 lt!435485)))))

(assert (=> b!299722 (= (select (arr!8981 a1!948) (_3!1459 lt!435483)) (select (arr!8981 a2!948) (_3!1459 lt!435483)))))

(declare-fun b!299723 () Bool)

(assert (=> b!299723 (= e!215198 e!215197)))

(declare-fun res!247285 () Bool)

(assert (=> b!299723 (= res!247285 (byteRangesEq!0 (select (arr!8981 a1!948) (_3!1459 lt!435485)) (select (arr!8981 a2!948) (_3!1459 lt!435485)) lt!435484 #b00000000000000000000000000000111))))

(assert (=> b!299723 (=> (not res!247285) (not e!215197))))

(declare-fun b!299724 () Bool)

(declare-fun res!247283 () Bool)

(assert (=> b!299724 (=> (not res!247283) (not e!215194))))

(declare-fun arrayBitRangesEq!0 (array!18190 array!18190 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299724 (= res!247283 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299712 () Bool)

(declare-fun Unit!20948 () Unit!20945)

(assert (=> b!299712 (= e!215196 Unit!20948)))

(declare-fun res!247286 () Bool)

(assert (=> start!66990 (=> (not res!247286) (not e!215192))))

(assert (=> start!66990 (= res!247286 (and (bvsle (size!7898 a1!948) (size!7898 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66990 e!215192))

(assert (=> start!66990 true))

(declare-fun array_inv!7510 (array!18190) Bool)

(assert (=> start!66990 (array_inv!7510 a1!948)))

(assert (=> start!66990 (array_inv!7510 a2!948)))

(assert (= (and start!66990 res!247286) b!299714))

(assert (= (and b!299714 res!247284) b!299724))

(assert (= (and b!299724 res!247283) b!299713))

(assert (= (and b!299713 res!247280) b!299721))

(assert (= (and b!299721 c!13799) b!299719))

(assert (= (and b!299721 (not c!13799)) b!299720))

(assert (= (and b!299721 c!13798) b!299716))

(assert (= (and b!299721 (not c!13798)) b!299723))

(assert (= (and b!299723 res!247285) b!299717))

(assert (= (and b!299717 (not res!247282)) b!299715))

(assert (= (or b!299716 b!299715) bm!5324))

(assert (= (and b!299721 res!247281) b!299718))

(assert (= (and b!299718 c!13800) b!299722))

(assert (= (and b!299718 (not c!13800)) b!299712))

(declare-fun m!438807 () Bool)

(assert (=> b!299723 m!438807))

(declare-fun m!438809 () Bool)

(assert (=> b!299723 m!438809))

(assert (=> b!299723 m!438807))

(assert (=> b!299723 m!438809))

(declare-fun m!438811 () Bool)

(assert (=> b!299723 m!438811))

(declare-fun m!438813 () Bool)

(assert (=> b!299721 m!438813))

(declare-fun m!438815 () Bool)

(assert (=> b!299721 m!438815))

(declare-fun m!438817 () Bool)

(assert (=> start!66990 m!438817))

(declare-fun m!438819 () Bool)

(assert (=> start!66990 m!438819))

(declare-fun m!438821 () Bool)

(assert (=> b!299722 m!438821))

(declare-fun m!438823 () Bool)

(assert (=> b!299722 m!438823))

(declare-fun m!438825 () Bool)

(assert (=> b!299722 m!438825))

(declare-fun m!438827 () Bool)

(assert (=> b!299719 m!438827))

(declare-fun m!438829 () Bool)

(assert (=> b!299719 m!438829))

(declare-fun m!438831 () Bool)

(assert (=> b!299724 m!438831))

(declare-fun m!438833 () Bool)

(assert (=> bm!5324 m!438833))

(assert (=> bm!5324 m!438809))

(assert (=> bm!5324 m!438807))

(declare-fun m!438835 () Bool)

(assert (=> bm!5324 m!438835))

(declare-fun m!438837 () Bool)

(assert (=> bm!5324 m!438837))

(check-sat (not start!66990) (not bm!5324) (not b!299723) (not b!299724) (not b!299722) (not b!299719) (not b!299721))
