; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40980 () Bool)

(assert start!40980)

(declare-fun res!157416 () Bool)

(declare-fun e!130473 () Bool)

(assert (=> start!40980 (=> (not res!157416) (not e!130473))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!40980 (= res!157416 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40980 e!130473))

(assert (=> start!40980 true))

(declare-datatypes ((array!9870 0))(
  ( (array!9871 (arr!5280 (Array (_ BitVec 32) (_ BitVec 8))) (size!4350 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7808 0))(
  ( (BitStream!7809 (buf!4824 array!9870) (currentByte!9096 (_ BitVec 32)) (currentBit!9091 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7808)

(declare-fun e!130480 () Bool)

(declare-fun inv!12 (BitStream!7808) Bool)

(assert (=> start!40980 (and (inv!12 thiss!1204) e!130480)))

(declare-fun b!188905 () Bool)

(declare-fun res!157424 () Bool)

(declare-fun e!130476 () Bool)

(assert (=> b!188905 (=> res!157424 e!130476)))

(declare-fun lt!293491 () (_ BitVec 64))

(declare-fun lt!293486 () (_ BitVec 64))

(declare-datatypes ((Unit!13499 0))(
  ( (Unit!13500) )
))
(declare-datatypes ((tuple2!16308 0))(
  ( (tuple2!16309 (_1!8799 Unit!13499) (_2!8799 BitStream!7808)) )
))
(declare-fun lt!293489 () tuple2!16308)

(assert (=> b!188905 (= res!157424 (or (not (= (size!4350 (buf!4824 (_2!8799 lt!293489))) (size!4350 (buf!4824 thiss!1204)))) (not (= lt!293491 (bvsub (bvadd lt!293486 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!188906 () Bool)

(declare-fun e!130471 () Bool)

(assert (=> b!188906 (= e!130471 e!130476)))

(declare-fun res!157418 () Bool)

(assert (=> b!188906 (=> res!157418 e!130476)))

(declare-fun lt!293500 () (_ BitVec 64))

(assert (=> b!188906 (= res!157418 (not (= lt!293491 (bvsub (bvsub (bvadd lt!293500 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!188906 (= lt!293491 (bitIndex!0 (size!4350 (buf!4824 (_2!8799 lt!293489))) (currentByte!9096 (_2!8799 lt!293489)) (currentBit!9091 (_2!8799 lt!293489))))))

(declare-fun isPrefixOf!0 (BitStream!7808 BitStream!7808) Bool)

(assert (=> b!188906 (isPrefixOf!0 thiss!1204 (_2!8799 lt!293489))))

(declare-fun lt!293507 () Unit!13499)

(declare-fun lt!293488 () tuple2!16308)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7808 BitStream!7808 BitStream!7808) Unit!13499)

(assert (=> b!188906 (= lt!293507 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8799 lt!293488) (_2!8799 lt!293489)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7808 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16308)

(assert (=> b!188906 (= lt!293489 (appendBitsLSBFirstLoopTR!0 (_2!8799 lt!293488) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!188907 () Bool)

(declare-fun res!157437 () Bool)

(declare-fun e!130472 () Bool)

(assert (=> b!188907 (=> res!157437 e!130472)))

(declare-datatypes ((tuple2!16310 0))(
  ( (tuple2!16311 (_1!8800 BitStream!7808) (_2!8800 (_ BitVec 64))) )
))
(declare-fun lt!293504 () tuple2!16310)

(declare-datatypes ((tuple2!16312 0))(
  ( (tuple2!16313 (_1!8801 BitStream!7808) (_2!8801 BitStream!7808)) )
))
(declare-fun lt!293497 () tuple2!16312)

(assert (=> b!188907 (= res!157437 (not (= (bitIndex!0 (size!4350 (buf!4824 (_1!8800 lt!293504))) (currentByte!9096 (_1!8800 lt!293504)) (currentBit!9091 (_1!8800 lt!293504))) (bitIndex!0 (size!4350 (buf!4824 (_2!8801 lt!293497))) (currentByte!9096 (_2!8801 lt!293497)) (currentBit!9091 (_2!8801 lt!293497))))))))

(declare-fun b!188908 () Bool)

(declare-fun e!130481 () Bool)

(declare-datatypes ((tuple2!16314 0))(
  ( (tuple2!16315 (_1!8802 BitStream!7808) (_2!8802 Bool)) )
))
(declare-fun lt!293498 () tuple2!16314)

(declare-fun lt!293490 () (_ BitVec 64))

(assert (=> b!188908 (= e!130481 (= (bitIndex!0 (size!4350 (buf!4824 (_1!8802 lt!293498))) (currentByte!9096 (_1!8802 lt!293498)) (currentBit!9091 (_1!8802 lt!293498))) lt!293490))))

(declare-fun b!188909 () Bool)

(declare-fun e!130469 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!188909 (= e!130469 (invariant!0 (currentBit!9091 thiss!1204) (currentByte!9096 thiss!1204) (size!4350 (buf!4824 (_2!8799 lt!293489)))))))

(declare-fun b!188910 () Bool)

(assert (=> b!188910 (= e!130472 true)))

(assert (=> b!188910 (= (size!4350 (buf!4824 thiss!1204)) (size!4350 (buf!4824 (_2!8799 lt!293489))))))

(declare-fun b!188911 () Bool)

(declare-fun res!157419 () Bool)

(declare-fun e!130474 () Bool)

(assert (=> b!188911 (=> (not res!157419) (not e!130474))))

(assert (=> b!188911 (= res!157419 (isPrefixOf!0 thiss!1204 (_2!8799 lt!293488)))))

(declare-fun b!188912 () Bool)

(declare-fun e!130475 () Bool)

(assert (=> b!188912 (= e!130475 e!130472)))

(declare-fun res!157426 () Bool)

(assert (=> b!188912 (=> res!157426 e!130472)))

(declare-fun lt!293494 () tuple2!16312)

(declare-fun lt!293503 () BitStream!7808)

(assert (=> b!188912 (= res!157426 (not (= (_1!8801 lt!293494) lt!293503)))))

(declare-fun e!130470 () Bool)

(assert (=> b!188912 e!130470))

(declare-fun res!157421 () Bool)

(assert (=> b!188912 (=> (not res!157421) (not e!130470))))

(declare-fun lt!293505 () tuple2!16310)

(assert (=> b!188912 (= res!157421 (and (= (_2!8800 lt!293504) (_2!8800 lt!293505)) (= (_1!8800 lt!293504) (_1!8800 lt!293505))))))

(declare-fun lt!293502 () Unit!13499)

(declare-fun lt!293511 () (_ BitVec 64))

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7808 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13499)

(assert (=> b!188912 (= lt!293502 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8801 lt!293497) nBits!348 i!590 lt!293511))))

(declare-fun lt!293506 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7808 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16310)

(assert (=> b!188912 (= lt!293505 (readNBitsLSBFirstsLoopPure!0 lt!293503 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!293506))))

(declare-fun withMovedBitIndex!0 (BitStream!7808 (_ BitVec 64)) BitStream!7808)

(assert (=> b!188912 (= lt!293503 (withMovedBitIndex!0 (_1!8801 lt!293497) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!188913 () Bool)

(declare-fun array_inv!4091 (array!9870) Bool)

(assert (=> b!188913 (= e!130480 (array_inv!4091 (buf!4824 thiss!1204)))))

(declare-fun b!188914 () Bool)

(declare-fun res!157425 () Bool)

(assert (=> b!188914 (=> res!157425 e!130476)))

(assert (=> b!188914 (= res!157425 (not (isPrefixOf!0 (_2!8799 lt!293488) (_2!8799 lt!293489))))))

(declare-fun b!188915 () Bool)

(assert (=> b!188915 (= e!130474 e!130481)))

(declare-fun res!157431 () Bool)

(assert (=> b!188915 (=> (not res!157431) (not e!130481))))

(declare-fun lt!293499 () Bool)

(assert (=> b!188915 (= res!157431 (and (= (_2!8802 lt!293498) lt!293499) (= (_1!8802 lt!293498) (_2!8799 lt!293488))))))

(declare-fun readBitPure!0 (BitStream!7808) tuple2!16314)

(declare-fun readerFrom!0 (BitStream!7808 (_ BitVec 32) (_ BitVec 32)) BitStream!7808)

(assert (=> b!188915 (= lt!293498 (readBitPure!0 (readerFrom!0 (_2!8799 lt!293488) (currentBit!9091 thiss!1204) (currentByte!9096 thiss!1204))))))

(declare-fun b!188916 () Bool)

(declare-fun lt!293509 () tuple2!16310)

(assert (=> b!188916 (= e!130470 (and (= lt!293486 (bvsub lt!293500 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8801 lt!293494) lt!293503)) (= (_2!8800 lt!293504) (_2!8800 lt!293509)))))))

(declare-fun b!188917 () Bool)

(declare-fun res!157436 () Bool)

(declare-fun e!130478 () Bool)

(assert (=> b!188917 (=> (not res!157436) (not e!130478))))

(assert (=> b!188917 (= res!157436 (not (= i!590 nBits!348)))))

(declare-fun b!188918 () Bool)

(declare-fun e!130479 () Bool)

(assert (=> b!188918 (= e!130479 e!130474)))

(declare-fun res!157422 () Bool)

(assert (=> b!188918 (=> (not res!157422) (not e!130474))))

(declare-fun lt!293493 () (_ BitVec 64))

(assert (=> b!188918 (= res!157422 (= lt!293490 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!293493)))))

(assert (=> b!188918 (= lt!293490 (bitIndex!0 (size!4350 (buf!4824 (_2!8799 lt!293488))) (currentByte!9096 (_2!8799 lt!293488)) (currentBit!9091 (_2!8799 lt!293488))))))

(assert (=> b!188918 (= lt!293493 (bitIndex!0 (size!4350 (buf!4824 thiss!1204)) (currentByte!9096 thiss!1204) (currentBit!9091 thiss!1204)))))

(declare-fun b!188919 () Bool)

(declare-fun res!157417 () Bool)

(assert (=> b!188919 (=> res!157417 e!130476)))

(assert (=> b!188919 (= res!157417 (not (isPrefixOf!0 thiss!1204 (_2!8799 lt!293488))))))

(declare-fun b!188920 () Bool)

(assert (=> b!188920 (= e!130476 e!130475)))

(declare-fun res!157427 () Bool)

(assert (=> b!188920 (=> res!157427 e!130475)))

(assert (=> b!188920 (= res!157427 (not (= (_1!8800 lt!293509) (_2!8801 lt!293494))))))

(assert (=> b!188920 (= lt!293509 (readNBitsLSBFirstsLoopPure!0 (_1!8801 lt!293494) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!293506))))

(declare-fun lt!293485 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!188920 (validate_offset_bits!1 ((_ sign_extend 32) (size!4350 (buf!4824 (_2!8799 lt!293489)))) ((_ sign_extend 32) (currentByte!9096 (_2!8799 lt!293488))) ((_ sign_extend 32) (currentBit!9091 (_2!8799 lt!293488))) lt!293485)))

(declare-fun lt!293492 () Unit!13499)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7808 array!9870 (_ BitVec 64)) Unit!13499)

(assert (=> b!188920 (= lt!293492 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8799 lt!293488) (buf!4824 (_2!8799 lt!293489)) lt!293485))))

(assert (=> b!188920 (= lt!293485 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!293495 () (_ BitVec 64))

(declare-fun lt!293508 () tuple2!16314)

(assert (=> b!188920 (= lt!293506 (bvor lt!293511 (ite (_2!8802 lt!293508) lt!293495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!188920 (= lt!293504 (readNBitsLSBFirstsLoopPure!0 (_1!8801 lt!293497) nBits!348 i!590 lt!293511))))

(declare-fun lt!293512 () (_ BitVec 64))

(assert (=> b!188920 (validate_offset_bits!1 ((_ sign_extend 32) (size!4350 (buf!4824 (_2!8799 lt!293489)))) ((_ sign_extend 32) (currentByte!9096 thiss!1204)) ((_ sign_extend 32) (currentBit!9091 thiss!1204)) lt!293512)))

(declare-fun lt!293496 () Unit!13499)

(assert (=> b!188920 (= lt!293496 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4824 (_2!8799 lt!293489)) lt!293512))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!188920 (= lt!293511 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!188920 (= (_2!8802 lt!293508) lt!293499)))

(assert (=> b!188920 (= lt!293508 (readBitPure!0 (_1!8801 lt!293497)))))

(declare-fun reader!0 (BitStream!7808 BitStream!7808) tuple2!16312)

(assert (=> b!188920 (= lt!293494 (reader!0 (_2!8799 lt!293488) (_2!8799 lt!293489)))))

(assert (=> b!188920 (= lt!293497 (reader!0 thiss!1204 (_2!8799 lt!293489)))))

(declare-fun e!130477 () Bool)

(assert (=> b!188920 e!130477))

(declare-fun res!157433 () Bool)

(assert (=> b!188920 (=> (not res!157433) (not e!130477))))

(declare-fun lt!293510 () tuple2!16314)

(declare-fun lt!293484 () tuple2!16314)

(assert (=> b!188920 (= res!157433 (= (bitIndex!0 (size!4350 (buf!4824 (_1!8802 lt!293510))) (currentByte!9096 (_1!8802 lt!293510)) (currentBit!9091 (_1!8802 lt!293510))) (bitIndex!0 (size!4350 (buf!4824 (_1!8802 lt!293484))) (currentByte!9096 (_1!8802 lt!293484)) (currentBit!9091 (_1!8802 lt!293484)))))))

(declare-fun lt!293487 () Unit!13499)

(declare-fun lt!293501 () BitStream!7808)

(declare-fun readBitPrefixLemma!0 (BitStream!7808 BitStream!7808) Unit!13499)

(assert (=> b!188920 (= lt!293487 (readBitPrefixLemma!0 lt!293501 (_2!8799 lt!293489)))))

(assert (=> b!188920 (= lt!293484 (readBitPure!0 (BitStream!7809 (buf!4824 (_2!8799 lt!293489)) (currentByte!9096 thiss!1204) (currentBit!9091 thiss!1204))))))

(assert (=> b!188920 (= lt!293510 (readBitPure!0 lt!293501))))

(assert (=> b!188920 e!130469))

(declare-fun res!157429 () Bool)

(assert (=> b!188920 (=> (not res!157429) (not e!130469))))

(assert (=> b!188920 (= res!157429 (invariant!0 (currentBit!9091 thiss!1204) (currentByte!9096 thiss!1204) (size!4350 (buf!4824 (_2!8799 lt!293488)))))))

(assert (=> b!188920 (= lt!293501 (BitStream!7809 (buf!4824 (_2!8799 lt!293488)) (currentByte!9096 thiss!1204) (currentBit!9091 thiss!1204)))))

(declare-fun b!188921 () Bool)

(assert (=> b!188921 (= e!130477 (= (_2!8802 lt!293510) (_2!8802 lt!293484)))))

(declare-fun b!188922 () Bool)

(assert (=> b!188922 (= e!130478 (not e!130471))))

(declare-fun res!157432 () Bool)

(assert (=> b!188922 (=> res!157432 e!130471)))

(assert (=> b!188922 (= res!157432 (not (= lt!293500 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!293486))))))

(assert (=> b!188922 (= lt!293500 (bitIndex!0 (size!4350 (buf!4824 (_2!8799 lt!293488))) (currentByte!9096 (_2!8799 lt!293488)) (currentBit!9091 (_2!8799 lt!293488))))))

(assert (=> b!188922 (= lt!293486 (bitIndex!0 (size!4350 (buf!4824 thiss!1204)) (currentByte!9096 thiss!1204) (currentBit!9091 thiss!1204)))))

(assert (=> b!188922 e!130479))

(declare-fun res!157428 () Bool)

(assert (=> b!188922 (=> (not res!157428) (not e!130479))))

(assert (=> b!188922 (= res!157428 (= (size!4350 (buf!4824 thiss!1204)) (size!4350 (buf!4824 (_2!8799 lt!293488)))))))

(declare-fun appendBit!0 (BitStream!7808 Bool) tuple2!16308)

(assert (=> b!188922 (= lt!293488 (appendBit!0 thiss!1204 lt!293499))))

(assert (=> b!188922 (= lt!293499 (not (= (bvand v!189 lt!293495) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!188922 (= lt!293495 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!188923 () Bool)

(declare-fun res!157434 () Bool)

(assert (=> b!188923 (=> (not res!157434) (not e!130470))))

(assert (=> b!188923 (= res!157434 (= (_1!8801 lt!293497) (withMovedBitIndex!0 (_2!8801 lt!293497) (bvsub lt!293486 lt!293491))))))

(declare-fun b!188924 () Bool)

(declare-fun res!157423 () Bool)

(assert (=> b!188924 (=> (not res!157423) (not e!130478))))

(assert (=> b!188924 (= res!157423 (invariant!0 (currentBit!9091 thiss!1204) (currentByte!9096 thiss!1204) (size!4350 (buf!4824 thiss!1204))))))

(declare-fun b!188925 () Bool)

(assert (=> b!188925 (= e!130473 e!130478)))

(declare-fun res!157435 () Bool)

(assert (=> b!188925 (=> (not res!157435) (not e!130478))))

(assert (=> b!188925 (= res!157435 (validate_offset_bits!1 ((_ sign_extend 32) (size!4350 (buf!4824 thiss!1204))) ((_ sign_extend 32) (currentByte!9096 thiss!1204)) ((_ sign_extend 32) (currentBit!9091 thiss!1204)) lt!293512))))

(assert (=> b!188925 (= lt!293512 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!188926 () Bool)

(declare-fun res!157430 () Bool)

(assert (=> b!188926 (=> res!157430 e!130476)))

(assert (=> b!188926 (= res!157430 (not (invariant!0 (currentBit!9091 (_2!8799 lt!293489)) (currentByte!9096 (_2!8799 lt!293489)) (size!4350 (buf!4824 (_2!8799 lt!293489))))))))

(declare-fun b!188927 () Bool)

(declare-fun res!157420 () Bool)

(assert (=> b!188927 (=> (not res!157420) (not e!130470))))

(assert (=> b!188927 (= res!157420 (= (_1!8801 lt!293494) (withMovedBitIndex!0 (_2!8801 lt!293494) (bvsub lt!293500 lt!293491))))))

(assert (= (and start!40980 res!157416) b!188925))

(assert (= (and b!188925 res!157435) b!188924))

(assert (= (and b!188924 res!157423) b!188917))

(assert (= (and b!188917 res!157436) b!188922))

(assert (= (and b!188922 res!157428) b!188918))

(assert (= (and b!188918 res!157422) b!188911))

(assert (= (and b!188911 res!157419) b!188915))

(assert (= (and b!188915 res!157431) b!188908))

(assert (= (and b!188922 (not res!157432)) b!188906))

(assert (= (and b!188906 (not res!157418)) b!188926))

(assert (= (and b!188926 (not res!157430)) b!188905))

(assert (= (and b!188905 (not res!157424)) b!188914))

(assert (= (and b!188914 (not res!157425)) b!188919))

(assert (= (and b!188919 (not res!157417)) b!188920))

(assert (= (and b!188920 res!157429) b!188909))

(assert (= (and b!188920 res!157433) b!188921))

(assert (= (and b!188920 (not res!157427)) b!188912))

(assert (= (and b!188912 res!157421) b!188923))

(assert (= (and b!188923 res!157434) b!188927))

(assert (= (and b!188927 res!157420) b!188916))

(assert (= (and b!188912 (not res!157426)) b!188907))

(assert (= (and b!188907 (not res!157437)) b!188910))

(assert (= start!40980 b!188913))

(declare-fun m!293815 () Bool)

(assert (=> b!188915 m!293815))

(assert (=> b!188915 m!293815))

(declare-fun m!293817 () Bool)

(assert (=> b!188915 m!293817))

(declare-fun m!293819 () Bool)

(assert (=> start!40980 m!293819))

(declare-fun m!293821 () Bool)

(assert (=> b!188923 m!293821))

(declare-fun m!293823 () Bool)

(assert (=> b!188911 m!293823))

(declare-fun m!293825 () Bool)

(assert (=> b!188925 m!293825))

(declare-fun m!293827 () Bool)

(assert (=> b!188907 m!293827))

(declare-fun m!293829 () Bool)

(assert (=> b!188907 m!293829))

(declare-fun m!293831 () Bool)

(assert (=> b!188913 m!293831))

(declare-fun m!293833 () Bool)

(assert (=> b!188912 m!293833))

(declare-fun m!293835 () Bool)

(assert (=> b!188912 m!293835))

(declare-fun m!293837 () Bool)

(assert (=> b!188912 m!293837))

(declare-fun m!293839 () Bool)

(assert (=> b!188908 m!293839))

(assert (=> b!188919 m!293823))

(declare-fun m!293841 () Bool)

(assert (=> b!188927 m!293841))

(declare-fun m!293843 () Bool)

(assert (=> b!188906 m!293843))

(declare-fun m!293845 () Bool)

(assert (=> b!188906 m!293845))

(declare-fun m!293847 () Bool)

(assert (=> b!188906 m!293847))

(declare-fun m!293849 () Bool)

(assert (=> b!188906 m!293849))

(declare-fun m!293851 () Bool)

(assert (=> b!188922 m!293851))

(declare-fun m!293853 () Bool)

(assert (=> b!188922 m!293853))

(declare-fun m!293855 () Bool)

(assert (=> b!188922 m!293855))

(declare-fun m!293857 () Bool)

(assert (=> b!188914 m!293857))

(declare-fun m!293859 () Bool)

(assert (=> b!188920 m!293859))

(declare-fun m!293861 () Bool)

(assert (=> b!188920 m!293861))

(declare-fun m!293863 () Bool)

(assert (=> b!188920 m!293863))

(declare-fun m!293865 () Bool)

(assert (=> b!188920 m!293865))

(declare-fun m!293867 () Bool)

(assert (=> b!188920 m!293867))

(declare-fun m!293869 () Bool)

(assert (=> b!188920 m!293869))

(declare-fun m!293871 () Bool)

(assert (=> b!188920 m!293871))

(declare-fun m!293873 () Bool)

(assert (=> b!188920 m!293873))

(declare-fun m!293875 () Bool)

(assert (=> b!188920 m!293875))

(declare-fun m!293877 () Bool)

(assert (=> b!188920 m!293877))

(declare-fun m!293879 () Bool)

(assert (=> b!188920 m!293879))

(declare-fun m!293881 () Bool)

(assert (=> b!188920 m!293881))

(declare-fun m!293883 () Bool)

(assert (=> b!188920 m!293883))

(declare-fun m!293885 () Bool)

(assert (=> b!188920 m!293885))

(declare-fun m!293887 () Bool)

(assert (=> b!188920 m!293887))

(declare-fun m!293889 () Bool)

(assert (=> b!188920 m!293889))

(assert (=> b!188918 m!293851))

(assert (=> b!188918 m!293853))

(declare-fun m!293891 () Bool)

(assert (=> b!188924 m!293891))

(declare-fun m!293893 () Bool)

(assert (=> b!188909 m!293893))

(declare-fun m!293895 () Bool)

(assert (=> b!188926 m!293895))

(push 1)

(assert (not b!188918))

(assert (not b!188909))

(assert (not b!188912))

(assert (not b!188915))

(assert (not b!188920))

(assert (not b!188906))

(assert (not b!188907))

(assert (not b!188908))

(assert (not b!188919))

(assert (not b!188923))

(assert (not start!40980))

(assert (not b!188927))

(assert (not b!188924))

(assert (not b!188913))

(assert (not b!188926))

(assert (not b!188911))

(assert (not b!188914))

(assert (not b!188925))

(assert (not b!188922))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

