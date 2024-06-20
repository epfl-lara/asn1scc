; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41282 () Bool)

(assert start!41282)

(declare-fun res!160786 () Bool)

(declare-fun e!132634 () Bool)

(assert (=> start!41282 (=> (not res!160786) (not e!132634))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!41282 (= res!160786 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41282 e!132634))

(assert (=> start!41282 true))

(declare-datatypes ((array!9956 0))(
  ( (array!9957 (arr!5320 (Array (_ BitVec 32) (_ BitVec 8))) (size!4390 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7888 0))(
  ( (BitStream!7889 (buf!4870 array!9956) (currentByte!9154 (_ BitVec 32)) (currentBit!9149 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7888)

(declare-fun e!132636 () Bool)

(declare-fun inv!12 (BitStream!7888) Bool)

(assert (=> start!41282 (and (inv!12 thiss!1204) e!132636)))

(declare-fun b!192512 () Bool)

(declare-fun res!160798 () Bool)

(declare-fun e!132629 () Bool)

(assert (=> b!192512 (=> res!160798 e!132629)))

(declare-datatypes ((tuple2!16652 0))(
  ( (tuple2!16653 (_1!8971 BitStream!7888) (_2!8971 (_ BitVec 64))) )
))
(declare-fun lt!299243 () tuple2!16652)

(declare-datatypes ((tuple2!16654 0))(
  ( (tuple2!16655 (_1!8972 BitStream!7888) (_2!8972 BitStream!7888)) )
))
(declare-fun lt!299254 () tuple2!16654)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!192512 (= res!160798 (not (= (bitIndex!0 (size!4390 (buf!4870 (_1!8971 lt!299243))) (currentByte!9154 (_1!8971 lt!299243)) (currentBit!9149 (_1!8971 lt!299243))) (bitIndex!0 (size!4390 (buf!4870 (_2!8972 lt!299254))) (currentByte!9154 (_2!8972 lt!299254)) (currentBit!9149 (_2!8972 lt!299254))))))))

(declare-fun b!192513 () Bool)

(declare-fun res!160790 () Bool)

(declare-fun e!132637 () Bool)

(assert (=> b!192513 (=> res!160790 e!132637)))

(declare-datatypes ((Unit!13657 0))(
  ( (Unit!13658) )
))
(declare-datatypes ((tuple2!16656 0))(
  ( (tuple2!16657 (_1!8973 Unit!13657) (_2!8973 BitStream!7888)) )
))
(declare-fun lt!299245 () tuple2!16656)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!192513 (= res!160790 (not (invariant!0 (currentBit!9149 (_2!8973 lt!299245)) (currentByte!9154 (_2!8973 lt!299245)) (size!4390 (buf!4870 (_2!8973 lt!299245))))))))

(declare-fun b!192514 () Bool)

(declare-fun e!132633 () Bool)

(assert (=> b!192514 (= e!132634 e!132633)))

(declare-fun res!160802 () Bool)

(assert (=> b!192514 (=> (not res!160802) (not e!132633))))

(declare-fun lt!299256 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!192514 (= res!160802 (validate_offset_bits!1 ((_ sign_extend 32) (size!4390 (buf!4870 thiss!1204))) ((_ sign_extend 32) (currentByte!9154 thiss!1204)) ((_ sign_extend 32) (currentBit!9149 thiss!1204)) lt!299256))))

(assert (=> b!192514 (= lt!299256 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!192515 () Bool)

(declare-fun res!160801 () Bool)

(declare-fun e!132640 () Bool)

(assert (=> b!192515 (=> (not res!160801) (not e!132640))))

(declare-fun lt!299258 () tuple2!16656)

(declare-fun isPrefixOf!0 (BitStream!7888 BitStream!7888) Bool)

(assert (=> b!192515 (= res!160801 (isPrefixOf!0 thiss!1204 (_2!8973 lt!299258)))))

(declare-fun b!192516 () Bool)

(declare-fun array_inv!4131 (array!9956) Bool)

(assert (=> b!192516 (= e!132636 (array_inv!4131 (buf!4870 thiss!1204)))))

(declare-fun b!192517 () Bool)

(declare-fun res!160791 () Bool)

(assert (=> b!192517 (=> res!160791 e!132637)))

(assert (=> b!192517 (= res!160791 (not (isPrefixOf!0 (_2!8973 lt!299258) (_2!8973 lt!299245))))))

(declare-fun b!192518 () Bool)

(declare-fun e!132630 () Bool)

(assert (=> b!192518 (= e!132637 e!132630)))

(declare-fun res!160806 () Bool)

(assert (=> b!192518 (=> res!160806 e!132630)))

(declare-fun lt!299259 () tuple2!16652)

(declare-fun lt!299248 () tuple2!16654)

(assert (=> b!192518 (= res!160806 (not (= (_1!8971 lt!299259) (_2!8972 lt!299248))))))

(declare-fun lt!299239 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7888 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16652)

(assert (=> b!192518 (= lt!299259 (readNBitsLSBFirstsLoopPure!0 (_1!8972 lt!299248) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!299239))))

(declare-fun lt!299255 () (_ BitVec 64))

(assert (=> b!192518 (validate_offset_bits!1 ((_ sign_extend 32) (size!4390 (buf!4870 (_2!8973 lt!299245)))) ((_ sign_extend 32) (currentByte!9154 (_2!8973 lt!299258))) ((_ sign_extend 32) (currentBit!9149 (_2!8973 lt!299258))) lt!299255)))

(declare-fun lt!299257 () Unit!13657)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7888 array!9956 (_ BitVec 64)) Unit!13657)

(assert (=> b!192518 (= lt!299257 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8973 lt!299258) (buf!4870 (_2!8973 lt!299245)) lt!299255))))

(assert (=> b!192518 (= lt!299255 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!16658 0))(
  ( (tuple2!16659 (_1!8974 BitStream!7888) (_2!8974 Bool)) )
))
(declare-fun lt!299249 () tuple2!16658)

(declare-fun lt!299247 () (_ BitVec 64))

(declare-fun lt!299237 () (_ BitVec 64))

(assert (=> b!192518 (= lt!299239 (bvor lt!299247 (ite (_2!8974 lt!299249) lt!299237 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!192518 (= lt!299243 (readNBitsLSBFirstsLoopPure!0 (_1!8972 lt!299254) nBits!348 i!590 lt!299247))))

(assert (=> b!192518 (validate_offset_bits!1 ((_ sign_extend 32) (size!4390 (buf!4870 (_2!8973 lt!299245)))) ((_ sign_extend 32) (currentByte!9154 thiss!1204)) ((_ sign_extend 32) (currentBit!9149 thiss!1204)) lt!299256)))

(declare-fun lt!299234 () Unit!13657)

(assert (=> b!192518 (= lt!299234 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4870 (_2!8973 lt!299245)) lt!299256))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!192518 (= lt!299247 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!299252 () Bool)

(assert (=> b!192518 (= (_2!8974 lt!299249) lt!299252)))

(declare-fun readBitPure!0 (BitStream!7888) tuple2!16658)

(assert (=> b!192518 (= lt!299249 (readBitPure!0 (_1!8972 lt!299254)))))

(declare-fun reader!0 (BitStream!7888 BitStream!7888) tuple2!16654)

(assert (=> b!192518 (= lt!299248 (reader!0 (_2!8973 lt!299258) (_2!8973 lt!299245)))))

(assert (=> b!192518 (= lt!299254 (reader!0 thiss!1204 (_2!8973 lt!299245)))))

(declare-fun e!132635 () Bool)

(assert (=> b!192518 e!132635))

(declare-fun res!160783 () Bool)

(assert (=> b!192518 (=> (not res!160783) (not e!132635))))

(declare-fun lt!299241 () tuple2!16658)

(declare-fun lt!299253 () tuple2!16658)

(assert (=> b!192518 (= res!160783 (= (bitIndex!0 (size!4390 (buf!4870 (_1!8974 lt!299241))) (currentByte!9154 (_1!8974 lt!299241)) (currentBit!9149 (_1!8974 lt!299241))) (bitIndex!0 (size!4390 (buf!4870 (_1!8974 lt!299253))) (currentByte!9154 (_1!8974 lt!299253)) (currentBit!9149 (_1!8974 lt!299253)))))))

(declare-fun lt!299238 () Unit!13657)

(declare-fun lt!299235 () BitStream!7888)

(declare-fun readBitPrefixLemma!0 (BitStream!7888 BitStream!7888) Unit!13657)

(assert (=> b!192518 (= lt!299238 (readBitPrefixLemma!0 lt!299235 (_2!8973 lt!299245)))))

(assert (=> b!192518 (= lt!299253 (readBitPure!0 (BitStream!7889 (buf!4870 (_2!8973 lt!299245)) (currentByte!9154 thiss!1204) (currentBit!9149 thiss!1204))))))

(assert (=> b!192518 (= lt!299241 (readBitPure!0 lt!299235))))

(declare-fun e!132638 () Bool)

(assert (=> b!192518 e!132638))

(declare-fun res!160803 () Bool)

(assert (=> b!192518 (=> (not res!160803) (not e!132638))))

(assert (=> b!192518 (= res!160803 (invariant!0 (currentBit!9149 thiss!1204) (currentByte!9154 thiss!1204) (size!4390 (buf!4870 (_2!8973 lt!299258)))))))

(assert (=> b!192518 (= lt!299235 (BitStream!7889 (buf!4870 (_2!8973 lt!299258)) (currentByte!9154 thiss!1204) (currentBit!9149 thiss!1204)))))

(declare-fun b!192519 () Bool)

(assert (=> b!192519 (= e!132629 (bvsle i!590 #b00000000000000000000000001000000))))

(declare-fun e!132631 () Bool)

(assert (=> b!192519 e!132631))

(declare-fun res!160787 () Bool)

(assert (=> b!192519 (=> (not res!160787) (not e!132631))))

(assert (=> b!192519 (= res!160787 (= (size!4390 (buf!4870 thiss!1204)) (size!4390 (buf!4870 (_2!8973 lt!299245)))))))

(declare-fun b!192520 () Bool)

(declare-fun res!160796 () Bool)

(assert (=> b!192520 (=> (not res!160796) (not e!132633))))

(assert (=> b!192520 (= res!160796 (invariant!0 (currentBit!9149 thiss!1204) (currentByte!9154 thiss!1204) (size!4390 (buf!4870 thiss!1204))))))

(declare-fun b!192521 () Bool)

(declare-fun e!132639 () Bool)

(assert (=> b!192521 (= e!132640 e!132639)))

(declare-fun res!160789 () Bool)

(assert (=> b!192521 (=> (not res!160789) (not e!132639))))

(declare-fun lt!299250 () tuple2!16658)

(assert (=> b!192521 (= res!160789 (and (= (_2!8974 lt!299250) lt!299252) (= (_1!8974 lt!299250) (_2!8973 lt!299258))))))

(declare-fun readerFrom!0 (BitStream!7888 (_ BitVec 32) (_ BitVec 32)) BitStream!7888)

(assert (=> b!192521 (= lt!299250 (readBitPure!0 (readerFrom!0 (_2!8973 lt!299258) (currentBit!9149 thiss!1204) (currentByte!9154 thiss!1204))))))

(declare-fun b!192522 () Bool)

(declare-fun e!132627 () Bool)

(assert (=> b!192522 (= e!132633 (not e!132627))))

(declare-fun res!160784 () Bool)

(assert (=> b!192522 (=> res!160784 e!132627)))

(declare-fun lt!299251 () (_ BitVec 64))

(declare-fun lt!299244 () (_ BitVec 64))

(assert (=> b!192522 (= res!160784 (not (= lt!299251 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!299244))))))

(assert (=> b!192522 (= lt!299251 (bitIndex!0 (size!4390 (buf!4870 (_2!8973 lt!299258))) (currentByte!9154 (_2!8973 lt!299258)) (currentBit!9149 (_2!8973 lt!299258))))))

(assert (=> b!192522 (= lt!299244 (bitIndex!0 (size!4390 (buf!4870 thiss!1204)) (currentByte!9154 thiss!1204) (currentBit!9149 thiss!1204)))))

(declare-fun e!132632 () Bool)

(assert (=> b!192522 e!132632))

(declare-fun res!160785 () Bool)

(assert (=> b!192522 (=> (not res!160785) (not e!132632))))

(assert (=> b!192522 (= res!160785 (= (size!4390 (buf!4870 thiss!1204)) (size!4390 (buf!4870 (_2!8973 lt!299258)))))))

(declare-fun appendBit!0 (BitStream!7888 Bool) tuple2!16656)

(assert (=> b!192522 (= lt!299258 (appendBit!0 thiss!1204 lt!299252))))

(assert (=> b!192522 (= lt!299252 (not (= (bvand v!189 lt!299237) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!192522 (= lt!299237 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!192523 () Bool)

(declare-fun res!160793 () Bool)

(assert (=> b!192523 (=> (not res!160793) (not e!132633))))

(assert (=> b!192523 (= res!160793 (not (= i!590 nBits!348)))))

(declare-fun b!192524 () Bool)

(declare-fun res!160797 () Bool)

(assert (=> b!192524 (=> (not res!160797) (not e!132631))))

(assert (=> b!192524 (= res!160797 (= (_2!8971 lt!299243) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun b!192525 () Bool)

(declare-fun lt!299260 () (_ BitVec 64))

(assert (=> b!192525 (= e!132639 (= (bitIndex!0 (size!4390 (buf!4870 (_1!8974 lt!299250))) (currentByte!9154 (_1!8974 lt!299250)) (currentBit!9149 (_1!8974 lt!299250))) lt!299260))))

(declare-fun b!192526 () Bool)

(assert (=> b!192526 (= e!132638 (invariant!0 (currentBit!9149 thiss!1204) (currentByte!9154 thiss!1204) (size!4390 (buf!4870 (_2!8973 lt!299245)))))))

(declare-fun b!192527 () Bool)

(assert (=> b!192527 (= e!132632 e!132640)))

(declare-fun res!160799 () Bool)

(assert (=> b!192527 (=> (not res!160799) (not e!132640))))

(declare-fun lt!299246 () (_ BitVec 64))

(assert (=> b!192527 (= res!160799 (= lt!299260 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!299246)))))

(assert (=> b!192527 (= lt!299260 (bitIndex!0 (size!4390 (buf!4870 (_2!8973 lt!299258))) (currentByte!9154 (_2!8973 lt!299258)) (currentBit!9149 (_2!8973 lt!299258))))))

(assert (=> b!192527 (= lt!299246 (bitIndex!0 (size!4390 (buf!4870 thiss!1204)) (currentByte!9154 thiss!1204) (currentBit!9149 thiss!1204)))))

(declare-fun b!192528 () Bool)

(assert (=> b!192528 (= e!132630 e!132629)))

(declare-fun res!160805 () Bool)

(assert (=> b!192528 (=> res!160805 e!132629)))

(declare-fun lt!299240 () BitStream!7888)

(assert (=> b!192528 (= res!160805 (not (= (_1!8972 lt!299248) lt!299240)))))

(declare-fun e!132641 () Bool)

(assert (=> b!192528 e!132641))

(declare-fun res!160794 () Bool)

(assert (=> b!192528 (=> (not res!160794) (not e!132641))))

(declare-fun lt!299242 () tuple2!16652)

(assert (=> b!192528 (= res!160794 (and (= (_2!8971 lt!299243) (_2!8971 lt!299242)) (= (_1!8971 lt!299243) (_1!8971 lt!299242))))))

(declare-fun lt!299236 () Unit!13657)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7888 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13657)

(assert (=> b!192528 (= lt!299236 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8972 lt!299254) nBits!348 i!590 lt!299247))))

(assert (=> b!192528 (= lt!299242 (readNBitsLSBFirstsLoopPure!0 lt!299240 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!299239))))

(declare-fun withMovedBitIndex!0 (BitStream!7888 (_ BitVec 64)) BitStream!7888)

(assert (=> b!192528 (= lt!299240 (withMovedBitIndex!0 (_1!8972 lt!299254) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!192529 () Bool)

(assert (=> b!192529 (= e!132635 (= (_2!8974 lt!299241) (_2!8974 lt!299253)))))

(declare-fun b!192530 () Bool)

(assert (=> b!192530 (= e!132631 (= (_1!8971 lt!299243) (_2!8972 lt!299254)))))

(declare-fun b!192531 () Bool)

(declare-fun res!160804 () Bool)

(assert (=> b!192531 (=> (not res!160804) (not e!132641))))

(declare-fun lt!299233 () (_ BitVec 64))

(assert (=> b!192531 (= res!160804 (= (_1!8972 lt!299248) (withMovedBitIndex!0 (_2!8972 lt!299248) (bvsub lt!299251 lt!299233))))))

(declare-fun b!192532 () Bool)

(assert (=> b!192532 (= e!132641 (and (= lt!299244 (bvsub lt!299251 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8972 lt!299248) lt!299240)) (= (_2!8971 lt!299243) (_2!8971 lt!299259)))))))

(declare-fun b!192533 () Bool)

(assert (=> b!192533 (= e!132627 e!132637)))

(declare-fun res!160795 () Bool)

(assert (=> b!192533 (=> res!160795 e!132637)))

(assert (=> b!192533 (= res!160795 (not (= lt!299233 (bvsub (bvsub (bvadd lt!299251 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!192533 (= lt!299233 (bitIndex!0 (size!4390 (buf!4870 (_2!8973 lt!299245))) (currentByte!9154 (_2!8973 lt!299245)) (currentBit!9149 (_2!8973 lt!299245))))))

(assert (=> b!192533 (isPrefixOf!0 thiss!1204 (_2!8973 lt!299245))))

(declare-fun lt!299232 () Unit!13657)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7888 BitStream!7888 BitStream!7888) Unit!13657)

(assert (=> b!192533 (= lt!299232 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8973 lt!299258) (_2!8973 lt!299245)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7888 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16656)

(assert (=> b!192533 (= lt!299245 (appendBitsLSBFirstLoopTR!0 (_2!8973 lt!299258) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!192534 () Bool)

(declare-fun res!160792 () Bool)

(assert (=> b!192534 (=> res!160792 e!132637)))

(assert (=> b!192534 (= res!160792 (not (isPrefixOf!0 thiss!1204 (_2!8973 lt!299258))))))

(declare-fun b!192535 () Bool)

(declare-fun res!160800 () Bool)

(assert (=> b!192535 (=> res!160800 e!132637)))

(assert (=> b!192535 (= res!160800 (or (not (= (size!4390 (buf!4870 (_2!8973 lt!299245))) (size!4390 (buf!4870 thiss!1204)))) (not (= lt!299233 (bvsub (bvadd lt!299244 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!192536 () Bool)

(declare-fun res!160788 () Bool)

(assert (=> b!192536 (=> (not res!160788) (not e!132641))))

(assert (=> b!192536 (= res!160788 (= (_1!8972 lt!299254) (withMovedBitIndex!0 (_2!8972 lt!299254) (bvsub lt!299244 lt!299233))))))

(assert (= (and start!41282 res!160786) b!192514))

(assert (= (and b!192514 res!160802) b!192520))

(assert (= (and b!192520 res!160796) b!192523))

(assert (= (and b!192523 res!160793) b!192522))

(assert (= (and b!192522 res!160785) b!192527))

(assert (= (and b!192527 res!160799) b!192515))

(assert (= (and b!192515 res!160801) b!192521))

(assert (= (and b!192521 res!160789) b!192525))

(assert (= (and b!192522 (not res!160784)) b!192533))

(assert (= (and b!192533 (not res!160795)) b!192513))

(assert (= (and b!192513 (not res!160790)) b!192535))

(assert (= (and b!192535 (not res!160800)) b!192517))

(assert (= (and b!192517 (not res!160791)) b!192534))

(assert (= (and b!192534 (not res!160792)) b!192518))

(assert (= (and b!192518 res!160803) b!192526))

(assert (= (and b!192518 res!160783) b!192529))

(assert (= (and b!192518 (not res!160806)) b!192528))

(assert (= (and b!192528 res!160794) b!192536))

(assert (= (and b!192536 res!160788) b!192531))

(assert (= (and b!192531 res!160804) b!192532))

(assert (= (and b!192528 (not res!160805)) b!192512))

(assert (= (and b!192512 (not res!160798)) b!192519))

(assert (= (and b!192519 res!160787) b!192524))

(assert (= (and b!192524 res!160797) b!192530))

(assert (= start!41282 b!192516))

(declare-fun m!298691 () Bool)

(assert (=> b!192526 m!298691))

(declare-fun m!298693 () Bool)

(assert (=> b!192512 m!298693))

(declare-fun m!298695 () Bool)

(assert (=> b!192512 m!298695))

(declare-fun m!298697 () Bool)

(assert (=> b!192528 m!298697))

(declare-fun m!298699 () Bool)

(assert (=> b!192528 m!298699))

(declare-fun m!298701 () Bool)

(assert (=> b!192528 m!298701))

(declare-fun m!298703 () Bool)

(assert (=> b!192520 m!298703))

(declare-fun m!298705 () Bool)

(assert (=> b!192518 m!298705))

(declare-fun m!298707 () Bool)

(assert (=> b!192518 m!298707))

(declare-fun m!298709 () Bool)

(assert (=> b!192518 m!298709))

(declare-fun m!298711 () Bool)

(assert (=> b!192518 m!298711))

(declare-fun m!298713 () Bool)

(assert (=> b!192518 m!298713))

(declare-fun m!298715 () Bool)

(assert (=> b!192518 m!298715))

(declare-fun m!298717 () Bool)

(assert (=> b!192518 m!298717))

(declare-fun m!298719 () Bool)

(assert (=> b!192518 m!298719))

(declare-fun m!298721 () Bool)

(assert (=> b!192518 m!298721))

(declare-fun m!298723 () Bool)

(assert (=> b!192518 m!298723))

(declare-fun m!298725 () Bool)

(assert (=> b!192518 m!298725))

(declare-fun m!298727 () Bool)

(assert (=> b!192518 m!298727))

(declare-fun m!298729 () Bool)

(assert (=> b!192518 m!298729))

(declare-fun m!298731 () Bool)

(assert (=> b!192518 m!298731))

(declare-fun m!298733 () Bool)

(assert (=> b!192518 m!298733))

(declare-fun m!298735 () Bool)

(assert (=> b!192518 m!298735))

(declare-fun m!298737 () Bool)

(assert (=> b!192536 m!298737))

(declare-fun m!298739 () Bool)

(assert (=> b!192521 m!298739))

(assert (=> b!192521 m!298739))

(declare-fun m!298741 () Bool)

(assert (=> b!192521 m!298741))

(declare-fun m!298743 () Bool)

(assert (=> b!192534 m!298743))

(declare-fun m!298745 () Bool)

(assert (=> b!192513 m!298745))

(declare-fun m!298747 () Bool)

(assert (=> b!192525 m!298747))

(declare-fun m!298749 () Bool)

(assert (=> b!192514 m!298749))

(declare-fun m!298751 () Bool)

(assert (=> b!192516 m!298751))

(declare-fun m!298753 () Bool)

(assert (=> b!192531 m!298753))

(declare-fun m!298755 () Bool)

(assert (=> start!41282 m!298755))

(declare-fun m!298757 () Bool)

(assert (=> b!192533 m!298757))

(declare-fun m!298759 () Bool)

(assert (=> b!192533 m!298759))

(declare-fun m!298761 () Bool)

(assert (=> b!192533 m!298761))

(declare-fun m!298763 () Bool)

(assert (=> b!192533 m!298763))

(declare-fun m!298765 () Bool)

(assert (=> b!192524 m!298765))

(declare-fun m!298767 () Bool)

(assert (=> b!192522 m!298767))

(declare-fun m!298769 () Bool)

(assert (=> b!192522 m!298769))

(declare-fun m!298771 () Bool)

(assert (=> b!192522 m!298771))

(assert (=> b!192527 m!298767))

(assert (=> b!192527 m!298769))

(assert (=> b!192515 m!298743))

(declare-fun m!298773 () Bool)

(assert (=> b!192517 m!298773))

(push 1)

(assert (not b!192518))

(assert (not b!192534))

(assert (not b!192528))

(assert (not b!192516))

(assert (not b!192513))

(assert (not b!192522))

(assert (not b!192536))

(assert (not b!192531))

(assert (not b!192512))

(assert (not b!192524))

(assert (not b!192521))

(assert (not b!192526))

(assert (not b!192514))

(assert (not start!41282))

(assert (not b!192525))

(assert (not b!192527))

(assert (not b!192520))

(assert (not b!192533))

(assert (not b!192517))

(assert (not b!192515))

(check-sat)

(pop 1)

(push 1)

(check-sat)

