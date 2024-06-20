; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45148 () Bool)

(assert start!45148)

(declare-fun b!217535 () Bool)

(declare-fun res!183068 () Bool)

(declare-fun e!147897 () Bool)

(assert (=> b!217535 (=> res!183068 e!147897)))

(declare-datatypes ((array!10617 0))(
  ( (array!10618 (arr!5592 (Array (_ BitVec 32) (_ BitVec 8))) (size!4662 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8432 0))(
  ( (BitStream!8433 (buf!5206 array!10617) (currentByte!9799 (_ BitVec 32)) (currentBit!9794 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!15482 0))(
  ( (Unit!15483) )
))
(declare-datatypes ((tuple2!18546 0))(
  ( (tuple2!18547 (_1!9931 Unit!15482) (_2!9931 BitStream!8432)) )
))
(declare-fun lt!344375 () tuple2!18546)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!217535 (= res!183068 (not (invariant!0 (currentBit!9794 (_2!9931 lt!344375)) (currentByte!9799 (_2!9931 lt!344375)) (size!4662 (buf!5206 (_2!9931 lt!344375))))))))

(declare-fun b!217536 () Bool)

(declare-fun res!183055 () Bool)

(declare-fun e!147894 () Bool)

(assert (=> b!217536 (=> (not res!183055) (not e!147894))))

(declare-fun thiss!1204 () BitStream!8432)

(assert (=> b!217536 (= res!183055 (invariant!0 (currentBit!9794 thiss!1204) (currentByte!9799 thiss!1204) (size!4662 (buf!5206 thiss!1204))))))

(declare-fun b!217537 () Bool)

(declare-fun e!147896 () Bool)

(declare-fun array_inv!4403 (array!10617) Bool)

(assert (=> b!217537 (= e!147896 (array_inv!4403 (buf!5206 thiss!1204)))))

(declare-fun b!217538 () Bool)

(declare-fun e!147898 () Bool)

(declare-fun e!147891 () Bool)

(assert (=> b!217538 (= e!147898 e!147891)))

(declare-fun res!183054 () Bool)

(assert (=> b!217538 (=> (not res!183054) (not e!147891))))

(declare-fun lt!344405 () (_ BitVec 64))

(declare-fun lt!344395 () (_ BitVec 64))

(assert (=> b!217538 (= res!183054 (= lt!344405 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!344395)))))

(declare-fun lt!344379 () tuple2!18546)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!217538 (= lt!344405 (bitIndex!0 (size!4662 (buf!5206 (_2!9931 lt!344379))) (currentByte!9799 (_2!9931 lt!344379)) (currentBit!9794 (_2!9931 lt!344379))))))

(assert (=> b!217538 (= lt!344395 (bitIndex!0 (size!4662 (buf!5206 thiss!1204)) (currentByte!9799 thiss!1204) (currentBit!9794 thiss!1204)))))

(declare-fun b!217539 () Bool)

(declare-fun e!147893 () Bool)

(assert (=> b!217539 (= e!147893 e!147894)))

(declare-fun res!183073 () Bool)

(assert (=> b!217539 (=> (not res!183073) (not e!147894))))

(declare-fun lt!344374 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!217539 (= res!183073 (validate_offset_bits!1 ((_ sign_extend 32) (size!4662 (buf!5206 thiss!1204))) ((_ sign_extend 32) (currentByte!9799 thiss!1204)) ((_ sign_extend 32) (currentBit!9794 thiss!1204)) lt!344374))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!217539 (= lt!344374 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!217540 () Bool)

(declare-fun res!183063 () Bool)

(declare-fun e!147902 () Bool)

(assert (=> b!217540 (=> (not res!183063) (not e!147902))))

(declare-fun lt!344382 () (_ BitVec 64))

(declare-datatypes ((tuple2!18548 0))(
  ( (tuple2!18549 (_1!9932 BitStream!8432) (_2!9932 BitStream!8432)) )
))
(declare-fun lt!344392 () tuple2!18548)

(declare-fun lt!344399 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8432 (_ BitVec 64)) BitStream!8432)

(assert (=> b!217540 (= res!183063 (= (_1!9932 lt!344392) (withMovedBitIndex!0 (_2!9932 lt!344392) (bvsub lt!344382 lt!344399))))))

(declare-fun b!217541 () Bool)

(declare-fun res!183074 () Bool)

(assert (=> b!217541 (=> res!183074 e!147897)))

(assert (=> b!217541 (= res!183074 (not (= (size!4662 (buf!5206 (_2!9931 lt!344375))) (size!4662 (buf!5206 thiss!1204)))))))

(declare-fun b!217542 () Bool)

(declare-fun e!147889 () Bool)

(declare-datatypes ((tuple2!18550 0))(
  ( (tuple2!18551 (_1!9933 BitStream!8432) (_2!9933 Bool)) )
))
(declare-fun lt!344377 () tuple2!18550)

(declare-fun lt!344383 () tuple2!18550)

(assert (=> b!217542 (= e!147889 (= (_2!9933 lt!344377) (_2!9933 lt!344383)))))

(declare-fun b!217543 () Bool)

(declare-fun res!183069 () Bool)

(declare-fun e!147892 () Bool)

(assert (=> b!217543 (=> res!183069 e!147892)))

(declare-fun isPrefixOf!0 (BitStream!8432 BitStream!8432) Bool)

(assert (=> b!217543 (= res!183069 (not (isPrefixOf!0 thiss!1204 (_2!9931 lt!344379))))))

(declare-fun b!217544 () Bool)

(declare-datatypes ((tuple2!18552 0))(
  ( (tuple2!18553 (_1!9934 BitStream!8432) (_2!9934 (_ BitVec 64))) )
))
(declare-fun lt!344387 () tuple2!18552)

(declare-fun lt!344385 () (_ BitVec 64))

(declare-fun lt!344380 () BitStream!8432)

(declare-fun lt!344402 () tuple2!18552)

(assert (=> b!217544 (= e!147902 (and (= lt!344385 (bvsub lt!344382 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9932 lt!344392) lt!344380)) (= (_2!9934 lt!344387) (_2!9934 lt!344402)))))))

(declare-fun b!217545 () Bool)

(declare-fun res!183062 () Bool)

(assert (=> b!217545 (=> (not res!183062) (not e!147891))))

(assert (=> b!217545 (= res!183062 (isPrefixOf!0 thiss!1204 (_2!9931 lt!344379)))))

(declare-fun b!217546 () Bool)

(declare-fun res!183071 () Bool)

(declare-fun e!147903 () Bool)

(assert (=> b!217546 (=> res!183071 e!147903)))

(declare-fun lt!344378 () tuple2!18548)

(assert (=> b!217546 (= res!183071 (not (= (bitIndex!0 (size!4662 (buf!5206 (_1!9934 lt!344387))) (currentByte!9799 (_1!9934 lt!344387)) (currentBit!9794 (_1!9934 lt!344387))) (bitIndex!0 (size!4662 (buf!5206 (_2!9932 lt!344378))) (currentByte!9799 (_2!9932 lt!344378)) (currentBit!9794 (_2!9932 lt!344378))))))))

(declare-fun b!217547 () Bool)

(declare-fun e!147900 () Bool)

(assert (=> b!217547 (= e!147900 e!147903)))

(declare-fun res!183052 () Bool)

(assert (=> b!217547 (=> res!183052 e!147903)))

(assert (=> b!217547 (= res!183052 (not (= (_1!9932 lt!344392) lt!344380)))))

(assert (=> b!217547 e!147902))

(declare-fun res!183056 () Bool)

(assert (=> b!217547 (=> (not res!183056) (not e!147902))))

(declare-fun lt!344391 () tuple2!18552)

(assert (=> b!217547 (= res!183056 (and (= (_2!9934 lt!344387) (_2!9934 lt!344391)) (= (_1!9934 lt!344387) (_1!9934 lt!344391))))))

(declare-fun lt!344404 () Unit!15482)

(declare-fun lt!344390 () (_ BitVec 64))

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8432 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15482)

(assert (=> b!217547 (= lt!344404 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9932 lt!344378) nBits!348 i!590 lt!344390))))

(declare-fun lt!344376 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8432 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18552)

(assert (=> b!217547 (= lt!344391 (readNBitsLSBFirstsLoopPure!0 lt!344380 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!344376))))

(assert (=> b!217547 (= lt!344380 (withMovedBitIndex!0 (_1!9932 lt!344378) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!217548 () Bool)

(assert (=> b!217548 (= e!147897 e!147892)))

(declare-fun res!183051 () Bool)

(assert (=> b!217548 (=> res!183051 e!147892)))

(declare-fun lt!344388 () (_ BitVec 64))

(assert (=> b!217548 (= res!183051 (not (= lt!344399 lt!344388)))))

(declare-fun lt!344403 () (_ BitVec 64))

(assert (=> b!217548 (= lt!344388 (bvsub lt!344403 ((_ sign_extend 32) i!590)))))

(assert (=> b!217548 (= lt!344403 (bvadd lt!344385 ((_ sign_extend 32) nBits!348)))))

(declare-fun lt!344381 () (_ BitVec 64))

(declare-fun b!217549 () Bool)

(assert (=> b!217549 (= e!147903 (or (= lt!344381 (bvand ((_ sign_extend 32) i!590) #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!344381 (bvand lt!344388 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!217549 (= lt!344381 (bvand lt!344403 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!147895 () Bool)

(assert (=> b!217549 e!147895))

(declare-fun res!183058 () Bool)

(assert (=> b!217549 (=> (not res!183058) (not e!147895))))

(assert (=> b!217549 (= res!183058 (= (size!4662 (buf!5206 thiss!1204)) (size!4662 (buf!5206 (_2!9931 lt!344375)))))))

(declare-fun b!217550 () Bool)

(declare-fun res!183067 () Bool)

(assert (=> b!217550 (=> (not res!183067) (not e!147895))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!217550 (= res!183067 (= (_2!9934 lt!344387) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun b!217551 () Bool)

(declare-fun res!183064 () Bool)

(assert (=> b!217551 (=> res!183064 e!147892)))

(assert (=> b!217551 (= res!183064 (not (isPrefixOf!0 (_2!9931 lt!344379) (_2!9931 lt!344375))))))

(declare-fun b!217552 () Bool)

(declare-fun e!147899 () Bool)

(assert (=> b!217552 (= e!147899 (invariant!0 (currentBit!9794 thiss!1204) (currentByte!9799 thiss!1204) (size!4662 (buf!5206 (_2!9931 lt!344375)))))))

(declare-fun b!217553 () Bool)

(declare-fun res!183070 () Bool)

(assert (=> b!217553 (=> (not res!183070) (not e!147902))))

(assert (=> b!217553 (= res!183070 (= (_1!9932 lt!344378) (withMovedBitIndex!0 (_2!9932 lt!344378) (bvsub lt!344385 lt!344399))))))

(declare-fun b!217554 () Bool)

(declare-fun e!147901 () Bool)

(assert (=> b!217554 (= e!147891 e!147901)))

(declare-fun res!183066 () Bool)

(assert (=> b!217554 (=> (not res!183066) (not e!147901))))

(declare-fun lt!344384 () tuple2!18550)

(declare-fun lt!344401 () Bool)

(assert (=> b!217554 (= res!183066 (and (= (_2!9933 lt!344384) lt!344401) (= (_1!9933 lt!344384) (_2!9931 lt!344379))))))

(declare-fun readBitPure!0 (BitStream!8432) tuple2!18550)

(declare-fun readerFrom!0 (BitStream!8432 (_ BitVec 32) (_ BitVec 32)) BitStream!8432)

(assert (=> b!217554 (= lt!344384 (readBitPure!0 (readerFrom!0 (_2!9931 lt!344379) (currentBit!9794 thiss!1204) (currentByte!9799 thiss!1204))))))

(declare-fun b!217555 () Bool)

(declare-fun res!183065 () Bool)

(assert (=> b!217555 (=> (not res!183065) (not e!147894))))

(assert (=> b!217555 (= res!183065 (not (= i!590 nBits!348)))))

(declare-fun res!183072 () Bool)

(assert (=> start!45148 (=> (not res!183072) (not e!147893))))

(assert (=> start!45148 (= res!183072 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!45148 e!147893))

(assert (=> start!45148 true))

(declare-fun inv!12 (BitStream!8432) Bool)

(assert (=> start!45148 (and (inv!12 thiss!1204) e!147896)))

(declare-fun b!217556 () Bool)

(assert (=> b!217556 (= e!147901 (= (bitIndex!0 (size!4662 (buf!5206 (_1!9933 lt!344384))) (currentByte!9799 (_1!9933 lt!344384)) (currentBit!9794 (_1!9933 lt!344384))) lt!344405))))

(declare-fun b!217557 () Bool)

(declare-fun e!147890 () Bool)

(assert (=> b!217557 (= e!147890 e!147897)))

(declare-fun res!183050 () Bool)

(assert (=> b!217557 (=> res!183050 e!147897)))

(assert (=> b!217557 (= res!183050 (not (= lt!344399 (bvsub (bvsub (bvadd lt!344382 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!217557 (= lt!344399 (bitIndex!0 (size!4662 (buf!5206 (_2!9931 lt!344375))) (currentByte!9799 (_2!9931 lt!344375)) (currentBit!9794 (_2!9931 lt!344375))))))

(assert (=> b!217557 (isPrefixOf!0 thiss!1204 (_2!9931 lt!344375))))

(declare-fun lt!344394 () Unit!15482)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8432 BitStream!8432 BitStream!8432) Unit!15482)

(assert (=> b!217557 (= lt!344394 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9931 lt!344379) (_2!9931 lt!344375)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8432 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18546)

(assert (=> b!217557 (= lt!344375 (appendBitsLSBFirstLoopTR!0 (_2!9931 lt!344379) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!217558 () Bool)

(assert (=> b!217558 (= e!147892 e!147900)))

(declare-fun res!183060 () Bool)

(assert (=> b!217558 (=> res!183060 e!147900)))

(assert (=> b!217558 (= res!183060 (not (= (_1!9934 lt!344402) (_2!9932 lt!344392))))))

(assert (=> b!217558 (= lt!344402 (readNBitsLSBFirstsLoopPure!0 (_1!9932 lt!344392) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!344376))))

(declare-fun lt!344398 () (_ BitVec 64))

(assert (=> b!217558 (validate_offset_bits!1 ((_ sign_extend 32) (size!4662 (buf!5206 (_2!9931 lt!344375)))) ((_ sign_extend 32) (currentByte!9799 (_2!9931 lt!344379))) ((_ sign_extend 32) (currentBit!9794 (_2!9931 lt!344379))) lt!344398)))

(declare-fun lt!344400 () Unit!15482)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8432 array!10617 (_ BitVec 64)) Unit!15482)

(assert (=> b!217558 (= lt!344400 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9931 lt!344379) (buf!5206 (_2!9931 lt!344375)) lt!344398))))

(assert (=> b!217558 (= lt!344398 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!344393 () (_ BitVec 64))

(declare-fun lt!344397 () tuple2!18550)

(assert (=> b!217558 (= lt!344376 (bvor lt!344390 (ite (_2!9933 lt!344397) lt!344393 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217558 (= lt!344387 (readNBitsLSBFirstsLoopPure!0 (_1!9932 lt!344378) nBits!348 i!590 lt!344390))))

(assert (=> b!217558 (validate_offset_bits!1 ((_ sign_extend 32) (size!4662 (buf!5206 (_2!9931 lt!344375)))) ((_ sign_extend 32) (currentByte!9799 thiss!1204)) ((_ sign_extend 32) (currentBit!9794 thiss!1204)) lt!344374)))

(declare-fun lt!344389 () Unit!15482)

(assert (=> b!217558 (= lt!344389 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5206 (_2!9931 lt!344375)) lt!344374))))

(assert (=> b!217558 (= lt!344390 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!217558 (= (_2!9933 lt!344397) lt!344401)))

(assert (=> b!217558 (= lt!344397 (readBitPure!0 (_1!9932 lt!344378)))))

(declare-fun reader!0 (BitStream!8432 BitStream!8432) tuple2!18548)

(assert (=> b!217558 (= lt!344392 (reader!0 (_2!9931 lt!344379) (_2!9931 lt!344375)))))

(assert (=> b!217558 (= lt!344378 (reader!0 thiss!1204 (_2!9931 lt!344375)))))

(assert (=> b!217558 e!147889))

(declare-fun res!183059 () Bool)

(assert (=> b!217558 (=> (not res!183059) (not e!147889))))

(assert (=> b!217558 (= res!183059 (= (bitIndex!0 (size!4662 (buf!5206 (_1!9933 lt!344377))) (currentByte!9799 (_1!9933 lt!344377)) (currentBit!9794 (_1!9933 lt!344377))) (bitIndex!0 (size!4662 (buf!5206 (_1!9933 lt!344383))) (currentByte!9799 (_1!9933 lt!344383)) (currentBit!9794 (_1!9933 lt!344383)))))))

(declare-fun lt!344386 () Unit!15482)

(declare-fun lt!344396 () BitStream!8432)

(declare-fun readBitPrefixLemma!0 (BitStream!8432 BitStream!8432) Unit!15482)

(assert (=> b!217558 (= lt!344386 (readBitPrefixLemma!0 lt!344396 (_2!9931 lt!344375)))))

(assert (=> b!217558 (= lt!344383 (readBitPure!0 (BitStream!8433 (buf!5206 (_2!9931 lt!344375)) (currentByte!9799 thiss!1204) (currentBit!9794 thiss!1204))))))

(assert (=> b!217558 (= lt!344377 (readBitPure!0 lt!344396))))

(assert (=> b!217558 e!147899))

(declare-fun res!183057 () Bool)

(assert (=> b!217558 (=> (not res!183057) (not e!147899))))

(assert (=> b!217558 (= res!183057 (invariant!0 (currentBit!9794 thiss!1204) (currentByte!9799 thiss!1204) (size!4662 (buf!5206 (_2!9931 lt!344379)))))))

(assert (=> b!217558 (= lt!344396 (BitStream!8433 (buf!5206 (_2!9931 lt!344379)) (currentByte!9799 thiss!1204) (currentBit!9794 thiss!1204)))))

(declare-fun b!217559 () Bool)

(assert (=> b!217559 (= e!147895 (= (_1!9934 lt!344387) (_2!9932 lt!344378)))))

(declare-fun b!217560 () Bool)

(assert (=> b!217560 (= e!147894 (not e!147890))))

(declare-fun res!183053 () Bool)

(assert (=> b!217560 (=> res!183053 e!147890)))

(assert (=> b!217560 (= res!183053 (not (= lt!344382 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!344385))))))

(assert (=> b!217560 (= lt!344382 (bitIndex!0 (size!4662 (buf!5206 (_2!9931 lt!344379))) (currentByte!9799 (_2!9931 lt!344379)) (currentBit!9794 (_2!9931 lt!344379))))))

(assert (=> b!217560 (= lt!344385 (bitIndex!0 (size!4662 (buf!5206 thiss!1204)) (currentByte!9799 thiss!1204) (currentBit!9794 thiss!1204)))))

(assert (=> b!217560 e!147898))

(declare-fun res!183061 () Bool)

(assert (=> b!217560 (=> (not res!183061) (not e!147898))))

(assert (=> b!217560 (= res!183061 (= (size!4662 (buf!5206 thiss!1204)) (size!4662 (buf!5206 (_2!9931 lt!344379)))))))

(declare-fun appendBit!0 (BitStream!8432 Bool) tuple2!18546)

(assert (=> b!217560 (= lt!344379 (appendBit!0 thiss!1204 lt!344401))))

(assert (=> b!217560 (= lt!344401 (not (= (bvand v!189 lt!344393) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217560 (= lt!344393 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(assert (= (and start!45148 res!183072) b!217539))

(assert (= (and b!217539 res!183073) b!217536))

(assert (= (and b!217536 res!183055) b!217555))

(assert (= (and b!217555 res!183065) b!217560))

(assert (= (and b!217560 res!183061) b!217538))

(assert (= (and b!217538 res!183054) b!217545))

(assert (= (and b!217545 res!183062) b!217554))

(assert (= (and b!217554 res!183066) b!217556))

(assert (= (and b!217560 (not res!183053)) b!217557))

(assert (= (and b!217557 (not res!183050)) b!217535))

(assert (= (and b!217535 (not res!183068)) b!217541))

(assert (= (and b!217541 (not res!183074)) b!217548))

(assert (= (and b!217548 (not res!183051)) b!217551))

(assert (= (and b!217551 (not res!183064)) b!217543))

(assert (= (and b!217543 (not res!183069)) b!217558))

(assert (= (and b!217558 res!183057) b!217552))

(assert (= (and b!217558 res!183059) b!217542))

(assert (= (and b!217558 (not res!183060)) b!217547))

(assert (= (and b!217547 res!183056) b!217553))

(assert (= (and b!217553 res!183070) b!217540))

(assert (= (and b!217540 res!183063) b!217544))

(assert (= (and b!217547 (not res!183052)) b!217546))

(assert (= (and b!217546 (not res!183071)) b!217549))

(assert (= (and b!217549 res!183058) b!217550))

(assert (= (and b!217550 res!183067) b!217559))

(assert (= start!45148 b!217537))

(declare-fun m!335589 () Bool)

(assert (=> b!217543 m!335589))

(declare-fun m!335591 () Bool)

(assert (=> b!217554 m!335591))

(assert (=> b!217554 m!335591))

(declare-fun m!335593 () Bool)

(assert (=> b!217554 m!335593))

(declare-fun m!335595 () Bool)

(assert (=> start!45148 m!335595))

(declare-fun m!335597 () Bool)

(assert (=> b!217540 m!335597))

(declare-fun m!335599 () Bool)

(assert (=> b!217550 m!335599))

(declare-fun m!335601 () Bool)

(assert (=> b!217556 m!335601))

(declare-fun m!335603 () Bool)

(assert (=> b!217537 m!335603))

(declare-fun m!335605 () Bool)

(assert (=> b!217547 m!335605))

(declare-fun m!335607 () Bool)

(assert (=> b!217547 m!335607))

(declare-fun m!335609 () Bool)

(assert (=> b!217547 m!335609))

(declare-fun m!335611 () Bool)

(assert (=> b!217553 m!335611))

(assert (=> b!217545 m!335589))

(declare-fun m!335613 () Bool)

(assert (=> b!217552 m!335613))

(declare-fun m!335615 () Bool)

(assert (=> b!217536 m!335615))

(declare-fun m!335617 () Bool)

(assert (=> b!217558 m!335617))

(declare-fun m!335619 () Bool)

(assert (=> b!217558 m!335619))

(declare-fun m!335621 () Bool)

(assert (=> b!217558 m!335621))

(declare-fun m!335623 () Bool)

(assert (=> b!217558 m!335623))

(declare-fun m!335625 () Bool)

(assert (=> b!217558 m!335625))

(declare-fun m!335627 () Bool)

(assert (=> b!217558 m!335627))

(declare-fun m!335629 () Bool)

(assert (=> b!217558 m!335629))

(declare-fun m!335631 () Bool)

(assert (=> b!217558 m!335631))

(declare-fun m!335633 () Bool)

(assert (=> b!217558 m!335633))

(declare-fun m!335635 () Bool)

(assert (=> b!217558 m!335635))

(declare-fun m!335637 () Bool)

(assert (=> b!217558 m!335637))

(declare-fun m!335639 () Bool)

(assert (=> b!217558 m!335639))

(declare-fun m!335641 () Bool)

(assert (=> b!217558 m!335641))

(declare-fun m!335643 () Bool)

(assert (=> b!217558 m!335643))

(declare-fun m!335645 () Bool)

(assert (=> b!217558 m!335645))

(declare-fun m!335647 () Bool)

(assert (=> b!217558 m!335647))

(declare-fun m!335649 () Bool)

(assert (=> b!217546 m!335649))

(declare-fun m!335651 () Bool)

(assert (=> b!217546 m!335651))

(declare-fun m!335653 () Bool)

(assert (=> b!217560 m!335653))

(declare-fun m!335655 () Bool)

(assert (=> b!217560 m!335655))

(declare-fun m!335657 () Bool)

(assert (=> b!217560 m!335657))

(declare-fun m!335659 () Bool)

(assert (=> b!217557 m!335659))

(declare-fun m!335661 () Bool)

(assert (=> b!217557 m!335661))

(declare-fun m!335663 () Bool)

(assert (=> b!217557 m!335663))

(declare-fun m!335665 () Bool)

(assert (=> b!217557 m!335665))

(assert (=> b!217538 m!335653))

(assert (=> b!217538 m!335655))

(declare-fun m!335667 () Bool)

(assert (=> b!217539 m!335667))

(declare-fun m!335669 () Bool)

(assert (=> b!217535 m!335669))

(declare-fun m!335671 () Bool)

(assert (=> b!217551 m!335671))

(push 1)

(assert (not b!217547))

(assert (not b!217537))

(assert (not b!217536))

(assert (not b!217535))

(assert (not b!217543))

(assert (not start!45148))

(assert (not b!217545))

(assert (not b!217553))

(assert (not b!217539))

(assert (not b!217554))

(assert (not b!217557))

(assert (not b!217540))

(assert (not b!217560))

(assert (not b!217558))

(assert (not b!217552))

(assert (not b!217550))

(assert (not b!217551))

(assert (not b!217538))

(assert (not b!217556))

(assert (not b!217546))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!73783 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!73783 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4662 (buf!5206 thiss!1204))) ((_ sign_extend 32) (currentByte!9799 thiss!1204)) ((_ sign_extend 32) (currentBit!9794 thiss!1204)) lt!344374) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4662 (buf!5206 thiss!1204))) ((_ sign_extend 32) (currentByte!9799 thiss!1204)) ((_ sign_extend 32) (currentBit!9794 thiss!1204))) lt!344374))))

(declare-fun bs!18012 () Bool)

(assert (= bs!18012 d!73783))

(declare-fun m!335719 () Bool)

(assert (=> bs!18012 m!335719))

(assert (=> b!217539 d!73783))

(declare-fun d!73785 () Bool)

(assert (=> d!73785 (= (onesLSBLong!0 nBits!348) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!348))))))

(assert (=> b!217550 d!73785))

(declare-fun d!73787 () Bool)

(declare-fun e!147927 () Bool)

(assert (=> d!73787 e!147927))

(declare-fun res!183109 () Bool)

(assert (=> d!73787 (=> (not res!183109) (not e!147927))))

(declare-fun lt!344482 () (_ BitVec 64))

(declare-fun lt!344481 () BitStream!8432)

(assert (=> d!73787 (= res!183109 (= (bvadd lt!344482 (bvsub lt!344382 lt!344399)) (bitIndex!0 (size!4662 (buf!5206 lt!344481)) (currentByte!9799 lt!344481) (currentBit!9794 lt!344481))))))

(assert (=> d!73787 (or (not (= (bvand lt!344482 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!344382 lt!344399) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!344482 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!344482 (bvsub lt!344382 lt!344399)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73787 (= lt!344482 (bitIndex!0 (size!4662 (buf!5206 (_2!9932 lt!344392))) (currentByte!9799 (_2!9932 lt!344392)) (currentBit!9794 (_2!9932 lt!344392))))))

(declare-fun moveBitIndex!0 (BitStream!8432 (_ BitVec 64)) tuple2!18546)

(assert (=> d!73787 (= lt!344481 (_2!9931 (moveBitIndex!0 (_2!9932 lt!344392) (bvsub lt!344382 lt!344399))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8432 (_ BitVec 64)) Bool)

(assert (=> d!73787 (moveBitIndexPrecond!0 (_2!9932 lt!344392) (bvsub lt!344382 lt!344399))))

(assert (=> d!73787 (= (withMovedBitIndex!0 (_2!9932 lt!344392) (bvsub lt!344382 lt!344399)) lt!344481)))

(declare-fun b!217594 () Bool)

(assert (=> b!217594 (= e!147927 (= (size!4662 (buf!5206 (_2!9932 lt!344392))) (size!4662 (buf!5206 lt!344481))))))

(assert (= (and d!73787 res!183109) b!217594))

(declare-fun m!335721 () Bool)

(assert (=> d!73787 m!335721))

(declare-fun m!335723 () Bool)

(assert (=> d!73787 m!335723))

(declare-fun m!335725 () Bool)

(assert (=> d!73787 m!335725))

(declare-fun m!335727 () Bool)

(assert (=> d!73787 m!335727))

(assert (=> b!217540 d!73787))

(declare-fun d!73791 () Bool)

(declare-fun res!183127 () Bool)

(declare-fun e!147938 () Bool)

(assert (=> d!73791 (=> (not res!183127) (not e!147938))))

(assert (=> d!73791 (= res!183127 (= (size!4662 (buf!5206 (_2!9931 lt!344379))) (size!4662 (buf!5206 (_2!9931 lt!344375)))))))

(assert (=> d!73791 (= (isPrefixOf!0 (_2!9931 lt!344379) (_2!9931 lt!344375)) e!147938)))

(declare-fun b!217610 () Bool)

(declare-fun res!183125 () Bool)

(assert (=> b!217610 (=> (not res!183125) (not e!147938))))

(assert (=> b!217610 (= res!183125 (bvsle (bitIndex!0 (size!4662 (buf!5206 (_2!9931 lt!344379))) (currentByte!9799 (_2!9931 lt!344379)) (currentBit!9794 (_2!9931 lt!344379))) (bitIndex!0 (size!4662 (buf!5206 (_2!9931 lt!344375))) (currentByte!9799 (_2!9931 lt!344375)) (currentBit!9794 (_2!9931 lt!344375)))))))

(declare-fun b!217611 () Bool)

(declare-fun e!147939 () Bool)

(assert (=> b!217611 (= e!147938 e!147939)))

(declare-fun res!183126 () Bool)

(assert (=> b!217611 (=> res!183126 e!147939)))

(assert (=> b!217611 (= res!183126 (= (size!4662 (buf!5206 (_2!9931 lt!344379))) #b00000000000000000000000000000000))))

(declare-fun b!217612 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10617 array!10617 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!217612 (= e!147939 (arrayBitRangesEq!0 (buf!5206 (_2!9931 lt!344379)) (buf!5206 (_2!9931 lt!344375)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4662 (buf!5206 (_2!9931 lt!344379))) (currentByte!9799 (_2!9931 lt!344379)) (currentBit!9794 (_2!9931 lt!344379)))))))

(assert (= (and d!73791 res!183127) b!217610))

(assert (= (and b!217610 res!183125) b!217611))

(assert (= (and b!217611 (not res!183126)) b!217612))

(assert (=> b!217610 m!335653))

(assert (=> b!217610 m!335659))

(assert (=> b!217612 m!335653))

(assert (=> b!217612 m!335653))

(declare-fun m!335733 () Bool)

(assert (=> b!217612 m!335733))

(assert (=> b!217551 d!73791))

(declare-fun d!73799 () Bool)

(assert (=> d!73799 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9794 thiss!1204) (currentByte!9799 thiss!1204) (size!4662 (buf!5206 thiss!1204))))))

(declare-fun bs!18015 () Bool)

(assert (= bs!18015 d!73799))

(assert (=> bs!18015 m!335615))

(assert (=> start!45148 d!73799))

(declare-fun d!73801 () Bool)

(assert (=> d!73801 (= (invariant!0 (currentBit!9794 thiss!1204) (currentByte!9799 thiss!1204) (size!4662 (buf!5206 (_2!9931 lt!344375)))) (and (bvsge (currentBit!9794 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9794 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9799 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9799 thiss!1204) (size!4662 (buf!5206 (_2!9931 lt!344375)))) (and (= (currentBit!9794 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9799 thiss!1204) (size!4662 (buf!5206 (_2!9931 lt!344375))))))))))

(assert (=> b!217552 d!73801))

(declare-fun d!73803 () Bool)

(declare-fun e!147940 () Bool)

(assert (=> d!73803 e!147940))

(declare-fun res!183128 () Bool)

(assert (=> d!73803 (=> (not res!183128) (not e!147940))))

(declare-fun lt!344484 () (_ BitVec 64))

(declare-fun lt!344483 () BitStream!8432)

(assert (=> d!73803 (= res!183128 (= (bvadd lt!344484 (bvsub lt!344385 lt!344399)) (bitIndex!0 (size!4662 (buf!5206 lt!344483)) (currentByte!9799 lt!344483) (currentBit!9794 lt!344483))))))

(assert (=> d!73803 (or (not (= (bvand lt!344484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!344385 lt!344399) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!344484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!344484 (bvsub lt!344385 lt!344399)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73803 (= lt!344484 (bitIndex!0 (size!4662 (buf!5206 (_2!9932 lt!344378))) (currentByte!9799 (_2!9932 lt!344378)) (currentBit!9794 (_2!9932 lt!344378))))))

(assert (=> d!73803 (= lt!344483 (_2!9931 (moveBitIndex!0 (_2!9932 lt!344378) (bvsub lt!344385 lt!344399))))))

(assert (=> d!73803 (moveBitIndexPrecond!0 (_2!9932 lt!344378) (bvsub lt!344385 lt!344399))))

(assert (=> d!73803 (= (withMovedBitIndex!0 (_2!9932 lt!344378) (bvsub lt!344385 lt!344399)) lt!344483)))

(declare-fun b!217613 () Bool)

(assert (=> b!217613 (= e!147940 (= (size!4662 (buf!5206 (_2!9932 lt!344378))) (size!4662 (buf!5206 lt!344483))))))

(assert (= (and d!73803 res!183128) b!217613))

(declare-fun m!335735 () Bool)

(assert (=> d!73803 m!335735))

(assert (=> d!73803 m!335651))

(declare-fun m!335737 () Bool)

(assert (=> d!73803 m!335737))

(declare-fun m!335739 () Bool)

(assert (=> d!73803 m!335739))

(assert (=> b!217553 d!73803))

(declare-fun d!73805 () Bool)

(declare-fun res!183131 () Bool)

(declare-fun e!147941 () Bool)

(assert (=> d!73805 (=> (not res!183131) (not e!147941))))

(assert (=> d!73805 (= res!183131 (= (size!4662 (buf!5206 thiss!1204)) (size!4662 (buf!5206 (_2!9931 lt!344379)))))))

(assert (=> d!73805 (= (isPrefixOf!0 thiss!1204 (_2!9931 lt!344379)) e!147941)))

(declare-fun b!217614 () Bool)

(declare-fun res!183129 () Bool)

(assert (=> b!217614 (=> (not res!183129) (not e!147941))))

(assert (=> b!217614 (= res!183129 (bvsle (bitIndex!0 (size!4662 (buf!5206 thiss!1204)) (currentByte!9799 thiss!1204) (currentBit!9794 thiss!1204)) (bitIndex!0 (size!4662 (buf!5206 (_2!9931 lt!344379))) (currentByte!9799 (_2!9931 lt!344379)) (currentBit!9794 (_2!9931 lt!344379)))))))

(declare-fun b!217615 () Bool)

(declare-fun e!147942 () Bool)

(assert (=> b!217615 (= e!147941 e!147942)))

(declare-fun res!183130 () Bool)

(assert (=> b!217615 (=> res!183130 e!147942)))

(assert (=> b!217615 (= res!183130 (= (size!4662 (buf!5206 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!217616 () Bool)

(assert (=> b!217616 (= e!147942 (arrayBitRangesEq!0 (buf!5206 thiss!1204) (buf!5206 (_2!9931 lt!344379)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4662 (buf!5206 thiss!1204)) (currentByte!9799 thiss!1204) (currentBit!9794 thiss!1204))))))

(assert (= (and d!73805 res!183131) b!217614))

(assert (= (and b!217614 res!183129) b!217615))

(assert (= (and b!217615 (not res!183130)) b!217616))

(assert (=> b!217614 m!335655))

(assert (=> b!217614 m!335653))

(assert (=> b!217616 m!335655))

(assert (=> b!217616 m!335655))

(declare-fun m!335741 () Bool)

(assert (=> b!217616 m!335741))

(assert (=> b!217543 d!73805))

(declare-fun d!73807 () Bool)

(declare-datatypes ((tuple2!18558 0))(
  ( (tuple2!18559 (_1!9937 Bool) (_2!9937 BitStream!8432)) )
))
(declare-fun lt!344487 () tuple2!18558)

(declare-fun readBit!0 (BitStream!8432) tuple2!18558)

(assert (=> d!73807 (= lt!344487 (readBit!0 (readerFrom!0 (_2!9931 lt!344379) (currentBit!9794 thiss!1204) (currentByte!9799 thiss!1204))))))

(assert (=> d!73807 (= (readBitPure!0 (readerFrom!0 (_2!9931 lt!344379) (currentBit!9794 thiss!1204) (currentByte!9799 thiss!1204))) (tuple2!18551 (_2!9937 lt!344487) (_1!9937 lt!344487)))))

(declare-fun bs!18016 () Bool)

(assert (= bs!18016 d!73807))

(assert (=> bs!18016 m!335591))

(declare-fun m!335743 () Bool)

(assert (=> bs!18016 m!335743))

(assert (=> b!217554 d!73807))

(declare-fun d!73809 () Bool)

(declare-fun e!147950 () Bool)

(assert (=> d!73809 e!147950))

(declare-fun res!183144 () Bool)

(assert (=> d!73809 (=> (not res!183144) (not e!147950))))

(assert (=> d!73809 (= res!183144 (invariant!0 (currentBit!9794 (_2!9931 lt!344379)) (currentByte!9799 (_2!9931 lt!344379)) (size!4662 (buf!5206 (_2!9931 lt!344379)))))))

(assert (=> d!73809 (= (readerFrom!0 (_2!9931 lt!344379) (currentBit!9794 thiss!1204) (currentByte!9799 thiss!1204)) (BitStream!8433 (buf!5206 (_2!9931 lt!344379)) (currentByte!9799 thiss!1204) (currentBit!9794 thiss!1204)))))

(declare-fun b!217628 () Bool)

(assert (=> b!217628 (= e!147950 (invariant!0 (currentBit!9794 thiss!1204) (currentByte!9799 thiss!1204) (size!4662 (buf!5206 (_2!9931 lt!344379)))))))

(assert (= (and d!73809 res!183144) b!217628))

(declare-fun m!335747 () Bool)

(assert (=> d!73809 m!335747))

(assert (=> b!217628 m!335617))

(assert (=> b!217554 d!73809))

(assert (=> b!217545 d!73805))

(declare-fun d!73813 () Bool)

(declare-fun e!147953 () Bool)

(assert (=> d!73813 e!147953))

(declare-fun res!183150 () Bool)

(assert (=> d!73813 (=> (not res!183150) (not e!147953))))

(declare-fun lt!344525 () (_ BitVec 64))

(declare-fun lt!344521 () (_ BitVec 64))

(declare-fun lt!344523 () (_ BitVec 64))

(assert (=> d!73813 (= res!183150 (= lt!344521 (bvsub lt!344523 lt!344525)))))

(assert (=> d!73813 (or (= (bvand lt!344523 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!344525 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!344523 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!344523 lt!344525) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73813 (= lt!344525 (remainingBits!0 ((_ sign_extend 32) (size!4662 (buf!5206 (_1!9933 lt!344384)))) ((_ sign_extend 32) (currentByte!9799 (_1!9933 lt!344384))) ((_ sign_extend 32) (currentBit!9794 (_1!9933 lt!344384)))))))

(declare-fun lt!344524 () (_ BitVec 64))

(declare-fun lt!344522 () (_ BitVec 64))

(assert (=> d!73813 (= lt!344523 (bvmul lt!344524 lt!344522))))

(assert (=> d!73813 (or (= lt!344524 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!344522 (bvsdiv (bvmul lt!344524 lt!344522) lt!344524)))))

(assert (=> d!73813 (= lt!344522 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73813 (= lt!344524 ((_ sign_extend 32) (size!4662 (buf!5206 (_1!9933 lt!344384)))))))

(assert (=> d!73813 (= lt!344521 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9799 (_1!9933 lt!344384))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9794 (_1!9933 lt!344384)))))))

(assert (=> d!73813 (invariant!0 (currentBit!9794 (_1!9933 lt!344384)) (currentByte!9799 (_1!9933 lt!344384)) (size!4662 (buf!5206 (_1!9933 lt!344384))))))

(assert (=> d!73813 (= (bitIndex!0 (size!4662 (buf!5206 (_1!9933 lt!344384))) (currentByte!9799 (_1!9933 lt!344384)) (currentBit!9794 (_1!9933 lt!344384))) lt!344521)))

(declare-fun b!217633 () Bool)

(declare-fun res!183149 () Bool)

(assert (=> b!217633 (=> (not res!183149) (not e!147953))))

(assert (=> b!217633 (= res!183149 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!344521))))

(declare-fun b!217634 () Bool)

(declare-fun lt!344526 () (_ BitVec 64))

(assert (=> b!217634 (= e!147953 (bvsle lt!344521 (bvmul lt!344526 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217634 (or (= lt!344526 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!344526 #b0000000000000000000000000000000000000000000000000000000000001000) lt!344526)))))

(assert (=> b!217634 (= lt!344526 ((_ sign_extend 32) (size!4662 (buf!5206 (_1!9933 lt!344384)))))))

(assert (= (and d!73813 res!183150) b!217633))

(assert (= (and b!217633 res!183149) b!217634))

(declare-fun m!335753 () Bool)

(assert (=> d!73813 m!335753))

(declare-fun m!335755 () Bool)

(assert (=> d!73813 m!335755))

(assert (=> b!217556 d!73813))

(declare-fun d!73819 () Bool)

(assert (=> d!73819 (= (invariant!0 (currentBit!9794 (_2!9931 lt!344375)) (currentByte!9799 (_2!9931 lt!344375)) (size!4662 (buf!5206 (_2!9931 lt!344375)))) (and (bvsge (currentBit!9794 (_2!9931 lt!344375)) #b00000000000000000000000000000000) (bvslt (currentBit!9794 (_2!9931 lt!344375)) #b00000000000000000000000000001000) (bvsge (currentByte!9799 (_2!9931 lt!344375)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9799 (_2!9931 lt!344375)) (size!4662 (buf!5206 (_2!9931 lt!344375)))) (and (= (currentBit!9794 (_2!9931 lt!344375)) #b00000000000000000000000000000000) (= (currentByte!9799 (_2!9931 lt!344375)) (size!4662 (buf!5206 (_2!9931 lt!344375))))))))))

(assert (=> b!217535 d!73819))

(declare-fun d!73821 () Bool)

(declare-fun e!147954 () Bool)

(assert (=> d!73821 e!147954))

(declare-fun res!183152 () Bool)

(assert (=> d!73821 (=> (not res!183152) (not e!147954))))

(declare-fun lt!344531 () (_ BitVec 64))

(declare-fun lt!344527 () (_ BitVec 64))

(declare-fun lt!344529 () (_ BitVec 64))

(assert (=> d!73821 (= res!183152 (= lt!344527 (bvsub lt!344529 lt!344531)))))

(assert (=> d!73821 (or (= (bvand lt!344529 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!344531 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!344529 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!344529 lt!344531) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73821 (= lt!344531 (remainingBits!0 ((_ sign_extend 32) (size!4662 (buf!5206 (_1!9934 lt!344387)))) ((_ sign_extend 32) (currentByte!9799 (_1!9934 lt!344387))) ((_ sign_extend 32) (currentBit!9794 (_1!9934 lt!344387)))))))

(declare-fun lt!344530 () (_ BitVec 64))

(declare-fun lt!344528 () (_ BitVec 64))

(assert (=> d!73821 (= lt!344529 (bvmul lt!344530 lt!344528))))

(assert (=> d!73821 (or (= lt!344530 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!344528 (bvsdiv (bvmul lt!344530 lt!344528) lt!344530)))))

(assert (=> d!73821 (= lt!344528 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73821 (= lt!344530 ((_ sign_extend 32) (size!4662 (buf!5206 (_1!9934 lt!344387)))))))

(assert (=> d!73821 (= lt!344527 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9799 (_1!9934 lt!344387))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9794 (_1!9934 lt!344387)))))))

(assert (=> d!73821 (invariant!0 (currentBit!9794 (_1!9934 lt!344387)) (currentByte!9799 (_1!9934 lt!344387)) (size!4662 (buf!5206 (_1!9934 lt!344387))))))

(assert (=> d!73821 (= (bitIndex!0 (size!4662 (buf!5206 (_1!9934 lt!344387))) (currentByte!9799 (_1!9934 lt!344387)) (currentBit!9794 (_1!9934 lt!344387))) lt!344527)))

(declare-fun b!217635 () Bool)

(declare-fun res!183151 () Bool)

(assert (=> b!217635 (=> (not res!183151) (not e!147954))))

(assert (=> b!217635 (= res!183151 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!344527))))

(declare-fun b!217636 () Bool)

(declare-fun lt!344532 () (_ BitVec 64))

(assert (=> b!217636 (= e!147954 (bvsle lt!344527 (bvmul lt!344532 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217636 (or (= lt!344532 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!344532 #b0000000000000000000000000000000000000000000000000000000000001000) lt!344532)))))

(assert (=> b!217636 (= lt!344532 ((_ sign_extend 32) (size!4662 (buf!5206 (_1!9934 lt!344387)))))))

(assert (= (and d!73821 res!183152) b!217635))

(assert (= (and b!217635 res!183151) b!217636))

(declare-fun m!335757 () Bool)

(assert (=> d!73821 m!335757))

(declare-fun m!335759 () Bool)

(assert (=> d!73821 m!335759))

(assert (=> b!217546 d!73821))

(declare-fun d!73823 () Bool)

(declare-fun e!147955 () Bool)

(assert (=> d!73823 e!147955))

(declare-fun res!183154 () Bool)

(assert (=> d!73823 (=> (not res!183154) (not e!147955))))

(declare-fun lt!344535 () (_ BitVec 64))

(declare-fun lt!344533 () (_ BitVec 64))

(declare-fun lt!344537 () (_ BitVec 64))

(assert (=> d!73823 (= res!183154 (= lt!344533 (bvsub lt!344535 lt!344537)))))

(assert (=> d!73823 (or (= (bvand lt!344535 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!344537 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!344535 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!344535 lt!344537) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73823 (= lt!344537 (remainingBits!0 ((_ sign_extend 32) (size!4662 (buf!5206 (_2!9932 lt!344378)))) ((_ sign_extend 32) (currentByte!9799 (_2!9932 lt!344378))) ((_ sign_extend 32) (currentBit!9794 (_2!9932 lt!344378)))))))

(declare-fun lt!344536 () (_ BitVec 64))

(declare-fun lt!344534 () (_ BitVec 64))

(assert (=> d!73823 (= lt!344535 (bvmul lt!344536 lt!344534))))

(assert (=> d!73823 (or (= lt!344536 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!344534 (bvsdiv (bvmul lt!344536 lt!344534) lt!344536)))))

(assert (=> d!73823 (= lt!344534 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73823 (= lt!344536 ((_ sign_extend 32) (size!4662 (buf!5206 (_2!9932 lt!344378)))))))

(assert (=> d!73823 (= lt!344533 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9799 (_2!9932 lt!344378))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9794 (_2!9932 lt!344378)))))))

(assert (=> d!73823 (invariant!0 (currentBit!9794 (_2!9932 lt!344378)) (currentByte!9799 (_2!9932 lt!344378)) (size!4662 (buf!5206 (_2!9932 lt!344378))))))

(assert (=> d!73823 (= (bitIndex!0 (size!4662 (buf!5206 (_2!9932 lt!344378))) (currentByte!9799 (_2!9932 lt!344378)) (currentBit!9794 (_2!9932 lt!344378))) lt!344533)))

(declare-fun b!217637 () Bool)

(declare-fun res!183153 () Bool)

(assert (=> b!217637 (=> (not res!183153) (not e!147955))))

(assert (=> b!217637 (= res!183153 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!344533))))

(declare-fun b!217638 () Bool)

(declare-fun lt!344538 () (_ BitVec 64))

(assert (=> b!217638 (= e!147955 (bvsle lt!344533 (bvmul lt!344538 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217638 (or (= lt!344538 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!344538 #b0000000000000000000000000000000000000000000000000000000000001000) lt!344538)))))

(assert (=> b!217638 (= lt!344538 ((_ sign_extend 32) (size!4662 (buf!5206 (_2!9932 lt!344378)))))))

(assert (= (and d!73823 res!183154) b!217637))

(assert (= (and b!217637 res!183153) b!217638))

(declare-fun m!335761 () Bool)

(assert (=> d!73823 m!335761))

(declare-fun m!335763 () Bool)

(assert (=> d!73823 m!335763))

(assert (=> b!217546 d!73823))

(declare-fun d!73825 () Bool)

(declare-fun e!147956 () Bool)

(assert (=> d!73825 e!147956))

(declare-fun res!183156 () Bool)

(assert (=> d!73825 (=> (not res!183156) (not e!147956))))

(declare-fun lt!344539 () (_ BitVec 64))

(declare-fun lt!344543 () (_ BitVec 64))

(declare-fun lt!344541 () (_ BitVec 64))

(assert (=> d!73825 (= res!183156 (= lt!344539 (bvsub lt!344541 lt!344543)))))

(assert (=> d!73825 (or (= (bvand lt!344541 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!344543 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!344541 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!344541 lt!344543) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73825 (= lt!344543 (remainingBits!0 ((_ sign_extend 32) (size!4662 (buf!5206 (_2!9931 lt!344375)))) ((_ sign_extend 32) (currentByte!9799 (_2!9931 lt!344375))) ((_ sign_extend 32) (currentBit!9794 (_2!9931 lt!344375)))))))

(declare-fun lt!344542 () (_ BitVec 64))

(declare-fun lt!344540 () (_ BitVec 64))

(assert (=> d!73825 (= lt!344541 (bvmul lt!344542 lt!344540))))

(assert (=> d!73825 (or (= lt!344542 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!344540 (bvsdiv (bvmul lt!344542 lt!344540) lt!344542)))))

(assert (=> d!73825 (= lt!344540 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73825 (= lt!344542 ((_ sign_extend 32) (size!4662 (buf!5206 (_2!9931 lt!344375)))))))

(assert (=> d!73825 (= lt!344539 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9799 (_2!9931 lt!344375))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9794 (_2!9931 lt!344375)))))))

(assert (=> d!73825 (invariant!0 (currentBit!9794 (_2!9931 lt!344375)) (currentByte!9799 (_2!9931 lt!344375)) (size!4662 (buf!5206 (_2!9931 lt!344375))))))

(assert (=> d!73825 (= (bitIndex!0 (size!4662 (buf!5206 (_2!9931 lt!344375))) (currentByte!9799 (_2!9931 lt!344375)) (currentBit!9794 (_2!9931 lt!344375))) lt!344539)))

(declare-fun b!217639 () Bool)

(declare-fun res!183155 () Bool)

(assert (=> b!217639 (=> (not res!183155) (not e!147956))))

(assert (=> b!217639 (= res!183155 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!344539))))

(declare-fun b!217640 () Bool)

(declare-fun lt!344544 () (_ BitVec 64))

(assert (=> b!217640 (= e!147956 (bvsle lt!344539 (bvmul lt!344544 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217640 (or (= lt!344544 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!344544 #b0000000000000000000000000000000000000000000000000000000000001000) lt!344544)))))

(assert (=> b!217640 (= lt!344544 ((_ sign_extend 32) (size!4662 (buf!5206 (_2!9931 lt!344375)))))))

(assert (= (and d!73825 res!183156) b!217639))

(assert (= (and b!217639 res!183155) b!217640))

(declare-fun m!335765 () Bool)

(assert (=> d!73825 m!335765))

(assert (=> d!73825 m!335669))

(assert (=> b!217557 d!73825))

(declare-fun d!73827 () Bool)

(declare-fun res!183159 () Bool)

(declare-fun e!147957 () Bool)

(assert (=> d!73827 (=> (not res!183159) (not e!147957))))

(assert (=> d!73827 (= res!183159 (= (size!4662 (buf!5206 thiss!1204)) (size!4662 (buf!5206 (_2!9931 lt!344375)))))))

(assert (=> d!73827 (= (isPrefixOf!0 thiss!1204 (_2!9931 lt!344375)) e!147957)))

(declare-fun b!217641 () Bool)

(declare-fun res!183157 () Bool)

(assert (=> b!217641 (=> (not res!183157) (not e!147957))))

(assert (=> b!217641 (= res!183157 (bvsle (bitIndex!0 (size!4662 (buf!5206 thiss!1204)) (currentByte!9799 thiss!1204) (currentBit!9794 thiss!1204)) (bitIndex!0 (size!4662 (buf!5206 (_2!9931 lt!344375))) (currentByte!9799 (_2!9931 lt!344375)) (currentBit!9794 (_2!9931 lt!344375)))))))

(declare-fun b!217642 () Bool)

(declare-fun e!147958 () Bool)

(assert (=> b!217642 (= e!147957 e!147958)))

(declare-fun res!183158 () Bool)

(assert (=> b!217642 (=> res!183158 e!147958)))

(assert (=> b!217642 (= res!183158 (= (size!4662 (buf!5206 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!217643 () Bool)

(assert (=> b!217643 (= e!147958 (arrayBitRangesEq!0 (buf!5206 thiss!1204) (buf!5206 (_2!9931 lt!344375)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4662 (buf!5206 thiss!1204)) (currentByte!9799 thiss!1204) (currentBit!9794 thiss!1204))))))

(assert (= (and d!73827 res!183159) b!217641))

(assert (= (and b!217641 res!183157) b!217642))

(assert (= (and b!217642 (not res!183158)) b!217643))

(assert (=> b!217641 m!335655))

(assert (=> b!217641 m!335659))

(assert (=> b!217643 m!335655))

(assert (=> b!217643 m!335655))

(declare-fun m!335767 () Bool)

(assert (=> b!217643 m!335767))

(assert (=> b!217557 d!73827))

(declare-fun d!73829 () Bool)

(assert (=> d!73829 (isPrefixOf!0 thiss!1204 (_2!9931 lt!344375))))

(declare-fun lt!344547 () Unit!15482)

(declare-fun choose!30 (BitStream!8432 BitStream!8432 BitStream!8432) Unit!15482)

(assert (=> d!73829 (= lt!344547 (choose!30 thiss!1204 (_2!9931 lt!344379) (_2!9931 lt!344375)))))

(assert (=> d!73829 (isPrefixOf!0 thiss!1204 (_2!9931 lt!344379))))

(assert (=> d!73829 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9931 lt!344379) (_2!9931 lt!344375)) lt!344547)))

(declare-fun bs!18018 () Bool)

(assert (= bs!18018 d!73829))

(assert (=> bs!18018 m!335661))

(declare-fun m!335769 () Bool)

(assert (=> bs!18018 m!335769))

(assert (=> bs!18018 m!335589))

(assert (=> b!217557 d!73829))

(declare-fun b!217851 () Bool)

(declare-fun e!148081 () Bool)

(declare-fun e!148074 () Bool)

(assert (=> b!217851 (= e!148081 e!148074)))

(declare-fun res!183327 () Bool)

(assert (=> b!217851 (=> (not res!183327) (not e!148074))))

(declare-fun lt!345220 () tuple2!18552)

(assert (=> b!217851 (= res!183327 (= (_2!9934 lt!345220) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!345206 () tuple2!18548)

(assert (=> b!217851 (= lt!345220 (readNBitsLSBFirstsLoopPure!0 (_1!9932 lt!345206) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!345182 () Unit!15482)

(declare-fun lt!345223 () Unit!15482)

(assert (=> b!217851 (= lt!345182 lt!345223)))

(declare-fun lt!345193 () tuple2!18546)

(declare-fun lt!345236 () (_ BitVec 64))

(assert (=> b!217851 (validate_offset_bits!1 ((_ sign_extend 32) (size!4662 (buf!5206 (_2!9931 lt!345193)))) ((_ sign_extend 32) (currentByte!9799 (_2!9931 lt!344379))) ((_ sign_extend 32) (currentBit!9794 (_2!9931 lt!344379))) lt!345236)))

(assert (=> b!217851 (= lt!345223 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9931 lt!344379) (buf!5206 (_2!9931 lt!345193)) lt!345236))))

(declare-fun e!148080 () Bool)

(assert (=> b!217851 e!148080))

(declare-fun res!183337 () Bool)

(assert (=> b!217851 (=> (not res!183337) (not e!148080))))

(assert (=> b!217851 (= res!183337 (and (= (size!4662 (buf!5206 (_2!9931 lt!344379))) (size!4662 (buf!5206 (_2!9931 lt!345193)))) (bvsge lt!345236 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217851 (= lt!345236 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!217851 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!217851 (= lt!345206 (reader!0 (_2!9931 lt!344379) (_2!9931 lt!345193)))))

(declare-fun b!217852 () Bool)

(declare-fun res!183336 () Bool)

(assert (=> b!217852 (=> (not res!183336) (not e!148081))))

(assert (=> b!217852 (= res!183336 (= (size!4662 (buf!5206 (_2!9931 lt!344379))) (size!4662 (buf!5206 (_2!9931 lt!345193)))))))

(declare-fun b!217853 () Bool)

(declare-fun lt!345187 () tuple2!18550)

(declare-fun lt!345200 () tuple2!18546)

(assert (=> b!217853 (= lt!345187 (readBitPure!0 (readerFrom!0 (_2!9931 lt!345200) (currentBit!9794 (_2!9931 lt!344379)) (currentByte!9799 (_2!9931 lt!344379)))))))

(declare-fun res!183330 () Bool)

(declare-fun lt!345229 () Bool)

(assert (=> b!217853 (= res!183330 (and (= (_2!9933 lt!345187) lt!345229) (= (_1!9933 lt!345187) (_2!9931 lt!345200))))))

(declare-fun e!148078 () Bool)

(assert (=> b!217853 (=> (not res!183330) (not e!148078))))

(declare-fun e!148082 () Bool)

(assert (=> b!217853 (= e!148082 e!148078)))

(declare-fun b!217854 () Bool)

(declare-fun e!148076 () (_ BitVec 64))

(assert (=> b!217854 (= e!148076 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!217855 () Bool)

(assert (=> b!217855 (= e!148076 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!217856 () Bool)

(declare-fun res!183328 () Bool)

(assert (=> b!217856 (=> (not res!183328) (not e!148081))))

(declare-fun lt!345222 () (_ BitVec 64))

(declare-fun lt!345189 () (_ BitVec 64))

(assert (=> b!217856 (= res!183328 (= (bitIndex!0 (size!4662 (buf!5206 (_2!9931 lt!345193))) (currentByte!9799 (_2!9931 lt!345193)) (currentBit!9794 (_2!9931 lt!345193))) (bvsub lt!345222 lt!345189)))))

(assert (=> b!217856 (or (= (bvand lt!345222 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!345189 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!345222 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!345222 lt!345189) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217856 (= lt!345189 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!345199 () (_ BitVec 64))

(declare-fun lt!345213 () (_ BitVec 64))

(assert (=> b!217856 (= lt!345222 (bvadd lt!345199 lt!345213))))

(assert (=> b!217856 (or (not (= (bvand lt!345199 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!345213 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!345199 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!345199 lt!345213) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217856 (= lt!345213 ((_ sign_extend 32) nBits!348))))

(assert (=> b!217856 (= lt!345199 (bitIndex!0 (size!4662 (buf!5206 (_2!9931 lt!344379))) (currentByte!9799 (_2!9931 lt!344379)) (currentBit!9794 (_2!9931 lt!344379))))))

(declare-fun b!217857 () Bool)

(declare-fun e!148077 () Bool)

(declare-fun lt!345202 () tuple2!18550)

(declare-fun lt!345237 () tuple2!18550)

(assert (=> b!217857 (= e!148077 (= (_2!9933 lt!345202) (_2!9933 lt!345237)))))

(declare-fun b!217858 () Bool)

(declare-fun res!183332 () Bool)

(declare-fun call!3411 () Bool)

(assert (=> b!217858 (= res!183332 call!3411)))

(assert (=> b!217858 (=> (not res!183332) (not e!148082))))

(declare-fun b!217859 () Bool)

(assert (=> b!217859 (= e!148074 (= (_1!9934 lt!345220) (_2!9932 lt!345206)))))

(declare-fun b!217860 () Bool)

(declare-fun e!148075 () tuple2!18546)

(declare-fun Unit!15508 () Unit!15482)

(assert (=> b!217860 (= e!148075 (tuple2!18547 Unit!15508 (_2!9931 lt!344379)))))

(declare-fun lt!345230 () Unit!15482)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8432) Unit!15482)

(assert (=> b!217860 (= lt!345230 (lemmaIsPrefixRefl!0 (_2!9931 lt!344379)))))

(assert (=> b!217860 call!3411))

(declare-fun lt!345218 () Unit!15482)

(assert (=> b!217860 (= lt!345218 lt!345230)))

(declare-fun b!217861 () Bool)

(assert (=> b!217861 (= e!148080 (validate_offset_bits!1 ((_ sign_extend 32) (size!4662 (buf!5206 (_2!9931 lt!344379)))) ((_ sign_extend 32) (currentByte!9799 (_2!9931 lt!344379))) ((_ sign_extend 32) (currentBit!9794 (_2!9931 lt!344379))) lt!345236))))

(declare-fun b!217862 () Bool)

(declare-fun lt!345233 () tuple2!18546)

(assert (=> b!217862 (= e!148075 (tuple2!18547 (_1!9931 lt!345233) (_2!9931 lt!345233)))))

(assert (=> b!217862 (= lt!345229 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217862 (= lt!345200 (appendBit!0 (_2!9931 lt!344379) lt!345229))))

(declare-fun res!183326 () Bool)

(assert (=> b!217862 (= res!183326 (= (size!4662 (buf!5206 (_2!9931 lt!344379))) (size!4662 (buf!5206 (_2!9931 lt!345200)))))))

(assert (=> b!217862 (=> (not res!183326) (not e!148082))))

(assert (=> b!217862 e!148082))

(declare-fun lt!345225 () tuple2!18546)

(assert (=> b!217862 (= lt!345225 lt!345200)))

(assert (=> b!217862 (= lt!345233 (appendBitsLSBFirstLoopTR!0 (_2!9931 lt!345225) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!345216 () Unit!15482)

(assert (=> b!217862 (= lt!345216 (lemmaIsPrefixTransitive!0 (_2!9931 lt!344379) (_2!9931 lt!345225) (_2!9931 lt!345233)))))

(assert (=> b!217862 (isPrefixOf!0 (_2!9931 lt!344379) (_2!9931 lt!345233))))

(declare-fun lt!345191 () Unit!15482)

(assert (=> b!217862 (= lt!345191 lt!345216)))

(assert (=> b!217862 (invariant!0 (currentBit!9794 (_2!9931 lt!344379)) (currentByte!9799 (_2!9931 lt!344379)) (size!4662 (buf!5206 (_2!9931 lt!345225))))))

(declare-fun lt!345228 () BitStream!8432)

(assert (=> b!217862 (= lt!345228 (BitStream!8433 (buf!5206 (_2!9931 lt!345225)) (currentByte!9799 (_2!9931 lt!344379)) (currentBit!9794 (_2!9931 lt!344379))))))

(assert (=> b!217862 (invariant!0 (currentBit!9794 lt!345228) (currentByte!9799 lt!345228) (size!4662 (buf!5206 (_2!9931 lt!345233))))))

(declare-fun lt!345232 () BitStream!8432)

(assert (=> b!217862 (= lt!345232 (BitStream!8433 (buf!5206 (_2!9931 lt!345233)) (currentByte!9799 lt!345228) (currentBit!9794 lt!345228)))))

(assert (=> b!217862 (= lt!345202 (readBitPure!0 lt!345228))))

(assert (=> b!217862 (= lt!345237 (readBitPure!0 lt!345232))))

(declare-fun lt!345205 () Unit!15482)

(assert (=> b!217862 (= lt!345205 (readBitPrefixLemma!0 lt!345228 (_2!9931 lt!345233)))))

(declare-fun res!183331 () Bool)

(assert (=> b!217862 (= res!183331 (= (bitIndex!0 (size!4662 (buf!5206 (_1!9933 lt!345202))) (currentByte!9799 (_1!9933 lt!345202)) (currentBit!9794 (_1!9933 lt!345202))) (bitIndex!0 (size!4662 (buf!5206 (_1!9933 lt!345237))) (currentByte!9799 (_1!9933 lt!345237)) (currentBit!9794 (_1!9933 lt!345237)))))))

(assert (=> b!217862 (=> (not res!183331) (not e!148077))))

(assert (=> b!217862 e!148077))

(declare-fun lt!345224 () Unit!15482)

(assert (=> b!217862 (= lt!345224 lt!345205)))

(declare-fun lt!345183 () tuple2!18548)

(assert (=> b!217862 (= lt!345183 (reader!0 (_2!9931 lt!344379) (_2!9931 lt!345233)))))

(declare-fun lt!345214 () tuple2!18548)

(assert (=> b!217862 (= lt!345214 (reader!0 (_2!9931 lt!345225) (_2!9931 lt!345233)))))

(declare-fun lt!345226 () tuple2!18550)

(assert (=> b!217862 (= lt!345226 (readBitPure!0 (_1!9932 lt!345183)))))

(assert (=> b!217862 (= (_2!9933 lt!345226) lt!345229)))

(declare-fun lt!345192 () Unit!15482)

(declare-fun Unit!15509 () Unit!15482)

(assert (=> b!217862 (= lt!345192 Unit!15509)))

(declare-fun lt!345208 () (_ BitVec 64))

(assert (=> b!217862 (= lt!345208 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!345197 () (_ BitVec 64))

(assert (=> b!217862 (= lt!345197 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!345215 () Unit!15482)

(assert (=> b!217862 (= lt!345215 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9931 lt!344379) (buf!5206 (_2!9931 lt!345233)) lt!345197))))

(assert (=> b!217862 (validate_offset_bits!1 ((_ sign_extend 32) (size!4662 (buf!5206 (_2!9931 lt!345233)))) ((_ sign_extend 32) (currentByte!9799 (_2!9931 lt!344379))) ((_ sign_extend 32) (currentBit!9794 (_2!9931 lt!344379))) lt!345197)))

(declare-fun lt!345234 () Unit!15482)

(assert (=> b!217862 (= lt!345234 lt!345215)))

(declare-fun lt!345219 () tuple2!18552)

(assert (=> b!217862 (= lt!345219 (readNBitsLSBFirstsLoopPure!0 (_1!9932 lt!345183) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!345208))))

(declare-fun lt!345195 () (_ BitVec 64))

(assert (=> b!217862 (= lt!345195 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!345201 () Unit!15482)

(assert (=> b!217862 (= lt!345201 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9931 lt!345225) (buf!5206 (_2!9931 lt!345233)) lt!345195))))

(assert (=> b!217862 (validate_offset_bits!1 ((_ sign_extend 32) (size!4662 (buf!5206 (_2!9931 lt!345233)))) ((_ sign_extend 32) (currentByte!9799 (_2!9931 lt!345225))) ((_ sign_extend 32) (currentBit!9794 (_2!9931 lt!345225))) lt!345195)))

(declare-fun lt!345210 () Unit!15482)

(assert (=> b!217862 (= lt!345210 lt!345201)))

(declare-fun lt!345231 () tuple2!18552)

(assert (=> b!217862 (= lt!345231 (readNBitsLSBFirstsLoopPure!0 (_1!9932 lt!345214) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!345208 (ite (_2!9933 lt!345226) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!345198 () tuple2!18552)

(assert (=> b!217862 (= lt!345198 (readNBitsLSBFirstsLoopPure!0 (_1!9932 lt!345183) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!345208))))

(declare-fun c!10650 () Bool)

(assert (=> b!217862 (= c!10650 (_2!9933 (readBitPure!0 (_1!9932 lt!345183))))))

(declare-fun lt!345204 () tuple2!18552)

(assert (=> b!217862 (= lt!345204 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9932 lt!345183) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!345208 e!148076)))))

(declare-fun lt!345186 () Unit!15482)

(assert (=> b!217862 (= lt!345186 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9932 lt!345183) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!345208))))

(assert (=> b!217862 (and (= (_2!9934 lt!345198) (_2!9934 lt!345204)) (= (_1!9934 lt!345198) (_1!9934 lt!345204)))))

(declare-fun lt!345221 () Unit!15482)

(assert (=> b!217862 (= lt!345221 lt!345186)))

(assert (=> b!217862 (= (_1!9932 lt!345183) (withMovedBitIndex!0 (_2!9932 lt!345183) (bvsub (bitIndex!0 (size!4662 (buf!5206 (_2!9931 lt!344379))) (currentByte!9799 (_2!9931 lt!344379)) (currentBit!9794 (_2!9931 lt!344379))) (bitIndex!0 (size!4662 (buf!5206 (_2!9931 lt!345233))) (currentByte!9799 (_2!9931 lt!345233)) (currentBit!9794 (_2!9931 lt!345233))))))))

(declare-fun lt!345190 () Unit!15482)

(declare-fun Unit!15511 () Unit!15482)

(assert (=> b!217862 (= lt!345190 Unit!15511)))

(assert (=> b!217862 (= (_1!9932 lt!345214) (withMovedBitIndex!0 (_2!9932 lt!345214) (bvsub (bitIndex!0 (size!4662 (buf!5206 (_2!9931 lt!345225))) (currentByte!9799 (_2!9931 lt!345225)) (currentBit!9794 (_2!9931 lt!345225))) (bitIndex!0 (size!4662 (buf!5206 (_2!9931 lt!345233))) (currentByte!9799 (_2!9931 lt!345233)) (currentBit!9794 (_2!9931 lt!345233))))))))

(declare-fun lt!345212 () Unit!15482)

(declare-fun Unit!15512 () Unit!15482)

(assert (=> b!217862 (= lt!345212 Unit!15512)))

(assert (=> b!217862 (= (bitIndex!0 (size!4662 (buf!5206 (_2!9931 lt!344379))) (currentByte!9799 (_2!9931 lt!344379)) (currentBit!9794 (_2!9931 lt!344379))) (bvsub (bitIndex!0 (size!4662 (buf!5206 (_2!9931 lt!345225))) (currentByte!9799 (_2!9931 lt!345225)) (currentBit!9794 (_2!9931 lt!345225))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!345227 () Unit!15482)

(declare-fun Unit!15513 () Unit!15482)

(assert (=> b!217862 (= lt!345227 Unit!15513)))

(assert (=> b!217862 (= (_2!9934 lt!345219) (_2!9934 lt!345231))))

(declare-fun lt!345211 () Unit!15482)

(declare-fun Unit!15514 () Unit!15482)

(assert (=> b!217862 (= lt!345211 Unit!15514)))

(assert (=> b!217862 (invariant!0 (currentBit!9794 (_2!9931 lt!345233)) (currentByte!9799 (_2!9931 lt!345233)) (size!4662 (buf!5206 (_2!9931 lt!345233))))))

(declare-fun lt!345207 () Unit!15482)

(declare-fun Unit!15515 () Unit!15482)

(assert (=> b!217862 (= lt!345207 Unit!15515)))

(assert (=> b!217862 (= (size!4662 (buf!5206 (_2!9931 lt!344379))) (size!4662 (buf!5206 (_2!9931 lt!345233))))))

(declare-fun lt!345217 () Unit!15482)

(declare-fun Unit!15516 () Unit!15482)

(assert (=> b!217862 (= lt!345217 Unit!15516)))

(assert (=> b!217862 (= (bitIndex!0 (size!4662 (buf!5206 (_2!9931 lt!345233))) (currentByte!9799 (_2!9931 lt!345233)) (currentBit!9794 (_2!9931 lt!345233))) (bvsub (bvadd (bitIndex!0 (size!4662 (buf!5206 (_2!9931 lt!344379))) (currentByte!9799 (_2!9931 lt!344379)) (currentBit!9794 (_2!9931 lt!344379))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!345209 () Unit!15482)

(declare-fun Unit!15517 () Unit!15482)

(assert (=> b!217862 (= lt!345209 Unit!15517)))

(declare-fun lt!345188 () Unit!15482)

(declare-fun Unit!15518 () Unit!15482)

(assert (=> b!217862 (= lt!345188 Unit!15518)))

(declare-fun lt!345203 () tuple2!18548)

(assert (=> b!217862 (= lt!345203 (reader!0 (_2!9931 lt!344379) (_2!9931 lt!345233)))))

(declare-fun lt!345235 () (_ BitVec 64))

(assert (=> b!217862 (= lt!345235 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!345185 () Unit!15482)

(assert (=> b!217862 (= lt!345185 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9931 lt!344379) (buf!5206 (_2!9931 lt!345233)) lt!345235))))

(assert (=> b!217862 (validate_offset_bits!1 ((_ sign_extend 32) (size!4662 (buf!5206 (_2!9931 lt!345233)))) ((_ sign_extend 32) (currentByte!9799 (_2!9931 lt!344379))) ((_ sign_extend 32) (currentBit!9794 (_2!9931 lt!344379))) lt!345235)))

(declare-fun lt!345194 () Unit!15482)

(assert (=> b!217862 (= lt!345194 lt!345185)))

(declare-fun lt!345184 () tuple2!18552)

(assert (=> b!217862 (= lt!345184 (readNBitsLSBFirstsLoopPure!0 (_1!9932 lt!345203) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!183334 () Bool)

(assert (=> b!217862 (= res!183334 (= (_2!9934 lt!345184) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!148079 () Bool)

(assert (=> b!217862 (=> (not res!183334) (not e!148079))))

(assert (=> b!217862 e!148079))

(declare-fun lt!345196 () Unit!15482)

(declare-fun Unit!15519 () Unit!15482)

(assert (=> b!217862 (= lt!345196 Unit!15519)))

(declare-fun d!73831 () Bool)

(assert (=> d!73831 e!148081))

(declare-fun res!183333 () Bool)

(assert (=> d!73831 (=> (not res!183333) (not e!148081))))

(assert (=> d!73831 (= res!183333 (invariant!0 (currentBit!9794 (_2!9931 lt!345193)) (currentByte!9799 (_2!9931 lt!345193)) (size!4662 (buf!5206 (_2!9931 lt!345193)))))))

(assert (=> d!73831 (= lt!345193 e!148075)))

(declare-fun c!10649 () Bool)

(assert (=> d!73831 (= c!10649 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!73831 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!73831 (= (appendBitsLSBFirstLoopTR!0 (_2!9931 lt!344379) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!345193)))

(declare-fun b!217863 () Bool)

(declare-fun res!183335 () Bool)

(assert (=> b!217863 (=> (not res!183335) (not e!148081))))

(assert (=> b!217863 (= res!183335 (isPrefixOf!0 (_2!9931 lt!344379) (_2!9931 lt!345193)))))

(declare-fun b!217864 () Bool)

(assert (=> b!217864 (= e!148079 (= (_1!9934 lt!345184) (_2!9932 lt!345203)))))

(declare-fun b!217865 () Bool)

(declare-fun res!183329 () Bool)

(assert (=> b!217865 (= res!183329 (= (bitIndex!0 (size!4662 (buf!5206 (_2!9931 lt!345200))) (currentByte!9799 (_2!9931 lt!345200)) (currentBit!9794 (_2!9931 lt!345200))) (bvadd (bitIndex!0 (size!4662 (buf!5206 (_2!9931 lt!344379))) (currentByte!9799 (_2!9931 lt!344379)) (currentBit!9794 (_2!9931 lt!344379))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!217865 (=> (not res!183329) (not e!148082))))

(declare-fun b!217866 () Bool)

(assert (=> b!217866 (= e!148078 (= (bitIndex!0 (size!4662 (buf!5206 (_1!9933 lt!345187))) (currentByte!9799 (_1!9933 lt!345187)) (currentBit!9794 (_1!9933 lt!345187))) (bitIndex!0 (size!4662 (buf!5206 (_2!9931 lt!345200))) (currentByte!9799 (_2!9931 lt!345200)) (currentBit!9794 (_2!9931 lt!345200)))))))

(declare-fun bm!3408 () Bool)

(assert (=> bm!3408 (= call!3411 (isPrefixOf!0 (_2!9931 lt!344379) (ite c!10649 (_2!9931 lt!344379) (_2!9931 lt!345200))))))

(assert (= (and d!73831 c!10649) b!217860))

(assert (= (and d!73831 (not c!10649)) b!217862))

(assert (= (and b!217862 res!183326) b!217865))

(assert (= (and b!217865 res!183329) b!217858))

(assert (= (and b!217858 res!183332) b!217853))

(assert (= (and b!217853 res!183330) b!217866))

(assert (= (and b!217862 res!183331) b!217857))

(assert (= (and b!217862 c!10650) b!217855))

(assert (= (and b!217862 (not c!10650)) b!217854))

(assert (= (and b!217862 res!183334) b!217864))

(assert (= (or b!217860 b!217858) bm!3408))

(assert (= (and d!73831 res!183333) b!217852))

(assert (= (and b!217852 res!183336) b!217856))

(assert (= (and b!217856 res!183328) b!217863))

(assert (= (and b!217863 res!183335) b!217851))

(assert (= (and b!217851 res!183337) b!217861))

(assert (= (and b!217851 res!183327) b!217859))

(declare-fun m!336115 () Bool)

(assert (=> b!217865 m!336115))

(assert (=> b!217865 m!335653))

(declare-fun m!336117 () Bool)

(assert (=> b!217853 m!336117))

(assert (=> b!217853 m!336117))

(declare-fun m!336119 () Bool)

(assert (=> b!217853 m!336119))

(declare-fun m!336121 () Bool)

(assert (=> b!217851 m!336121))

(assert (=> b!217851 m!335599))

(declare-fun m!336123 () Bool)

(assert (=> b!217851 m!336123))

(declare-fun m!336125 () Bool)

(assert (=> b!217851 m!336125))

(declare-fun m!336129 () Bool)

(assert (=> b!217851 m!336129))

(declare-fun m!336131 () Bool)

(assert (=> b!217851 m!336131))

(declare-fun m!336133 () Bool)

(assert (=> b!217863 m!336133))

(declare-fun m!336137 () Bool)

(assert (=> b!217866 m!336137))

(assert (=> b!217866 m!336115))

(declare-fun m!336139 () Bool)

(assert (=> b!217862 m!336139))

(declare-fun m!336141 () Bool)

(assert (=> b!217862 m!336141))

(declare-fun m!336143 () Bool)

(assert (=> b!217862 m!336143))

(declare-fun m!336145 () Bool)

(assert (=> b!217862 m!336145))

(assert (=> b!217862 m!335599))

(declare-fun m!336147 () Bool)

(assert (=> b!217862 m!336147))

(declare-fun m!336149 () Bool)

(assert (=> b!217862 m!336149))

(declare-fun m!336151 () Bool)

(assert (=> b!217862 m!336151))

(declare-fun m!336153 () Bool)

(assert (=> b!217862 m!336153))

(declare-fun m!336155 () Bool)

(assert (=> b!217862 m!336155))

(declare-fun m!336157 () Bool)

(assert (=> b!217862 m!336157))

(declare-fun m!336159 () Bool)

(assert (=> b!217862 m!336159))

(declare-fun m!336161 () Bool)

(assert (=> b!217862 m!336161))

(declare-fun m!336163 () Bool)

(assert (=> b!217862 m!336163))

(declare-fun m!336165 () Bool)

(assert (=> b!217862 m!336165))

(declare-fun m!336167 () Bool)

(assert (=> b!217862 m!336167))

(declare-fun m!336169 () Bool)

(assert (=> b!217862 m!336169))

(declare-fun m!336171 () Bool)

(assert (=> b!217862 m!336171))

(assert (=> b!217862 m!336141))

(declare-fun m!336173 () Bool)

(assert (=> b!217862 m!336173))

(declare-fun m!336175 () Bool)

(assert (=> b!217862 m!336175))

(declare-fun m!336177 () Bool)

(assert (=> b!217862 m!336177))

(declare-fun m!336179 () Bool)

(assert (=> b!217862 m!336179))

(declare-fun m!336181 () Bool)

(assert (=> b!217862 m!336181))

(declare-fun m!336183 () Bool)

(assert (=> b!217862 m!336183))

(declare-fun m!336185 () Bool)

(assert (=> b!217862 m!336185))

(declare-fun m!336187 () Bool)

(assert (=> b!217862 m!336187))

(assert (=> b!217862 m!336131))

(declare-fun m!336189 () Bool)

(assert (=> b!217862 m!336189))

(declare-fun m!336191 () Bool)

(assert (=> b!217862 m!336191))

(declare-fun m!336193 () Bool)

(assert (=> b!217862 m!336193))

(declare-fun m!336195 () Bool)

(assert (=> b!217862 m!336195))

(assert (=> b!217862 m!335653))

(declare-fun m!336197 () Bool)

(assert (=> b!217862 m!336197))

(declare-fun m!336199 () Bool)

(assert (=> b!217862 m!336199))

(declare-fun m!336201 () Bool)

(assert (=> d!73831 m!336201))

(declare-fun m!336203 () Bool)

(assert (=> b!217856 m!336203))

(assert (=> b!217856 m!335653))

(declare-fun m!336205 () Bool)

(assert (=> b!217861 m!336205))

(declare-fun m!336207 () Bool)

(assert (=> b!217860 m!336207))

(declare-fun m!336209 () Bool)

(assert (=> bm!3408 m!336209))

(assert (=> b!217557 d!73831))

(declare-fun d!73917 () Bool)

(assert (=> d!73917 (= (invariant!0 (currentBit!9794 thiss!1204) (currentByte!9799 thiss!1204) (size!4662 (buf!5206 thiss!1204))) (and (bvsge (currentBit!9794 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9794 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9799 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9799 thiss!1204) (size!4662 (buf!5206 thiss!1204))) (and (= (currentBit!9794 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9799 thiss!1204) (size!4662 (buf!5206 thiss!1204)))))))))

(assert (=> b!217536 d!73917))

(declare-fun d!73919 () Bool)

(declare-fun lt!345279 () tuple2!18552)

(declare-fun lt!345282 () tuple2!18552)

(assert (=> d!73919 (and (= (_2!9934 lt!345279) (_2!9934 lt!345282)) (= (_1!9934 lt!345279) (_1!9934 lt!345282)))))

(declare-fun lt!345283 () (_ BitVec 64))

(declare-fun lt!345284 () Unit!15482)

(declare-fun lt!345281 () Bool)

(declare-fun lt!345280 () BitStream!8432)

(declare-fun choose!56 (BitStream!8432 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!18552 tuple2!18552 BitStream!8432 (_ BitVec 64) Bool BitStream!8432 (_ BitVec 64) tuple2!18552 tuple2!18552 BitStream!8432 (_ BitVec 64)) Unit!15482)

(assert (=> d!73919 (= lt!345284 (choose!56 (_1!9932 lt!344378) nBits!348 i!590 lt!344390 lt!345279 (tuple2!18553 (_1!9934 lt!345279) (_2!9934 lt!345279)) (_1!9934 lt!345279) (_2!9934 lt!345279) lt!345281 lt!345280 lt!345283 lt!345282 (tuple2!18553 (_1!9934 lt!345282) (_2!9934 lt!345282)) (_1!9934 lt!345282) (_2!9934 lt!345282)))))

(assert (=> d!73919 (= lt!345282 (readNBitsLSBFirstsLoopPure!0 lt!345280 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!345283))))

(assert (=> d!73919 (= lt!345283 (bvor lt!344390 (ite lt!345281 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73919 (= lt!345280 (withMovedBitIndex!0 (_1!9932 lt!344378) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!73919 (= lt!345281 (_2!9933 (readBitPure!0 (_1!9932 lt!344378))))))

(assert (=> d!73919 (= lt!345279 (readNBitsLSBFirstsLoopPure!0 (_1!9932 lt!344378) nBits!348 i!590 lt!344390))))

(assert (=> d!73919 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9932 lt!344378) nBits!348 i!590 lt!344390) lt!345284)))

(declare-fun bs!18034 () Bool)

(assert (= bs!18034 d!73919))

(assert (=> bs!18034 m!335643))

(declare-fun m!336225 () Bool)

(assert (=> bs!18034 m!336225))

(assert (=> bs!18034 m!335609))

(declare-fun m!336227 () Bool)

(assert (=> bs!18034 m!336227))

(assert (=> bs!18034 m!335627))

(assert (=> b!217547 d!73919))

(declare-datatypes ((tuple2!18564 0))(
  ( (tuple2!18565 (_1!9940 (_ BitVec 64)) (_2!9940 BitStream!8432)) )
))
(declare-fun lt!345287 () tuple2!18564)

(declare-fun d!73929 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8432 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18564)

(assert (=> d!73929 (= lt!345287 (readNBitsLSBFirstsLoop!0 lt!344380 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!344376))))

(assert (=> d!73929 (= (readNBitsLSBFirstsLoopPure!0 lt!344380 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!344376) (tuple2!18553 (_2!9940 lt!345287) (_1!9940 lt!345287)))))

(declare-fun bs!18035 () Bool)

(assert (= bs!18035 d!73929))

(declare-fun m!336229 () Bool)

(assert (=> bs!18035 m!336229))

(assert (=> b!217547 d!73929))

(declare-fun d!73931 () Bool)

(declare-fun e!148085 () Bool)

(assert (=> d!73931 e!148085))

(declare-fun res!183341 () Bool)

(assert (=> d!73931 (=> (not res!183341) (not e!148085))))

(declare-fun lt!345289 () (_ BitVec 64))

(declare-fun lt!345288 () BitStream!8432)

(assert (=> d!73931 (= res!183341 (= (bvadd lt!345289 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4662 (buf!5206 lt!345288)) (currentByte!9799 lt!345288) (currentBit!9794 lt!345288))))))

(assert (=> d!73931 (or (not (= (bvand lt!345289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!345289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!345289 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73931 (= lt!345289 (bitIndex!0 (size!4662 (buf!5206 (_1!9932 lt!344378))) (currentByte!9799 (_1!9932 lt!344378)) (currentBit!9794 (_1!9932 lt!344378))))))

(assert (=> d!73931 (= lt!345288 (_2!9931 (moveBitIndex!0 (_1!9932 lt!344378) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!73931 (moveBitIndexPrecond!0 (_1!9932 lt!344378) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!73931 (= (withMovedBitIndex!0 (_1!9932 lt!344378) #b0000000000000000000000000000000000000000000000000000000000000001) lt!345288)))

(declare-fun b!217870 () Bool)

(assert (=> b!217870 (= e!148085 (= (size!4662 (buf!5206 (_1!9932 lt!344378))) (size!4662 (buf!5206 lt!345288))))))

(assert (= (and d!73931 res!183341) b!217870))

(declare-fun m!336231 () Bool)

(assert (=> d!73931 m!336231))

(declare-fun m!336233 () Bool)

(assert (=> d!73931 m!336233))

(declare-fun m!336235 () Bool)

(assert (=> d!73931 m!336235))

(declare-fun m!336237 () Bool)

(assert (=> d!73931 m!336237))

(assert (=> b!217547 d!73931))

(declare-fun d!73933 () Bool)

(assert (=> d!73933 (validate_offset_bits!1 ((_ sign_extend 32) (size!4662 (buf!5206 (_2!9931 lt!344375)))) ((_ sign_extend 32) (currentByte!9799 thiss!1204)) ((_ sign_extend 32) (currentBit!9794 thiss!1204)) lt!344374)))

(declare-fun lt!345292 () Unit!15482)

(declare-fun choose!9 (BitStream!8432 array!10617 (_ BitVec 64) BitStream!8432) Unit!15482)

(assert (=> d!73933 (= lt!345292 (choose!9 thiss!1204 (buf!5206 (_2!9931 lt!344375)) lt!344374 (BitStream!8433 (buf!5206 (_2!9931 lt!344375)) (currentByte!9799 thiss!1204) (currentBit!9794 thiss!1204))))))

(assert (=> d!73933 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5206 (_2!9931 lt!344375)) lt!344374) lt!345292)))

(declare-fun bs!18036 () Bool)

(assert (= bs!18036 d!73933))

(assert (=> bs!18036 m!335647))

(declare-fun m!336239 () Bool)

(assert (=> bs!18036 m!336239))

(assert (=> b!217558 d!73933))

(declare-fun b!217905 () Bool)

(declare-fun res!183364 () Bool)

(declare-fun e!148101 () Bool)

(assert (=> b!217905 (=> (not res!183364) (not e!148101))))

(declare-fun lt!345441 () tuple2!18548)

(assert (=> b!217905 (= res!183364 (isPrefixOf!0 (_2!9932 lt!345441) (_2!9931 lt!344375)))))

(declare-fun b!217906 () Bool)

(declare-fun e!148100 () Unit!15482)

(declare-fun Unit!15521 () Unit!15482)

(assert (=> b!217906 (= e!148100 Unit!15521)))

(declare-fun b!217907 () Bool)

(declare-fun res!183365 () Bool)

(assert (=> b!217907 (=> (not res!183365) (not e!148101))))

(assert (=> b!217907 (= res!183365 (isPrefixOf!0 (_1!9932 lt!345441) thiss!1204))))

(declare-fun b!217908 () Bool)

(declare-fun lt!345436 () Unit!15482)

(assert (=> b!217908 (= e!148100 lt!345436)))

(declare-fun lt!345444 () (_ BitVec 64))

(assert (=> b!217908 (= lt!345444 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!345445 () (_ BitVec 64))

(assert (=> b!217908 (= lt!345445 (bitIndex!0 (size!4662 (buf!5206 thiss!1204)) (currentByte!9799 thiss!1204) (currentBit!9794 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10617 array!10617 (_ BitVec 64) (_ BitVec 64)) Unit!15482)

(assert (=> b!217908 (= lt!345436 (arrayBitRangesEqSymmetric!0 (buf!5206 thiss!1204) (buf!5206 (_2!9931 lt!344375)) lt!345444 lt!345445))))

(assert (=> b!217908 (arrayBitRangesEq!0 (buf!5206 (_2!9931 lt!344375)) (buf!5206 thiss!1204) lt!345444 lt!345445)))

(declare-fun d!73935 () Bool)

(assert (=> d!73935 e!148101))

(declare-fun res!183366 () Bool)

(assert (=> d!73935 (=> (not res!183366) (not e!148101))))

(assert (=> d!73935 (= res!183366 (isPrefixOf!0 (_1!9932 lt!345441) (_2!9932 lt!345441)))))

(declare-fun lt!345451 () BitStream!8432)

(assert (=> d!73935 (= lt!345441 (tuple2!18549 lt!345451 (_2!9931 lt!344375)))))

(declare-fun lt!345442 () Unit!15482)

(declare-fun lt!345439 () Unit!15482)

(assert (=> d!73935 (= lt!345442 lt!345439)))

(assert (=> d!73935 (isPrefixOf!0 lt!345451 (_2!9931 lt!344375))))

(assert (=> d!73935 (= lt!345439 (lemmaIsPrefixTransitive!0 lt!345451 (_2!9931 lt!344375) (_2!9931 lt!344375)))))

(declare-fun lt!345438 () Unit!15482)

(declare-fun lt!345435 () Unit!15482)

(assert (=> d!73935 (= lt!345438 lt!345435)))

(assert (=> d!73935 (isPrefixOf!0 lt!345451 (_2!9931 lt!344375))))

(assert (=> d!73935 (= lt!345435 (lemmaIsPrefixTransitive!0 lt!345451 thiss!1204 (_2!9931 lt!344375)))))

(declare-fun lt!345443 () Unit!15482)

(assert (=> d!73935 (= lt!345443 e!148100)))

(declare-fun c!10657 () Bool)

(assert (=> d!73935 (= c!10657 (not (= (size!4662 (buf!5206 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!345449 () Unit!15482)

(declare-fun lt!345452 () Unit!15482)

(assert (=> d!73935 (= lt!345449 lt!345452)))

(assert (=> d!73935 (isPrefixOf!0 (_2!9931 lt!344375) (_2!9931 lt!344375))))

(assert (=> d!73935 (= lt!345452 (lemmaIsPrefixRefl!0 (_2!9931 lt!344375)))))

(declare-fun lt!345440 () Unit!15482)

(declare-fun lt!345453 () Unit!15482)

(assert (=> d!73935 (= lt!345440 lt!345453)))

(assert (=> d!73935 (= lt!345453 (lemmaIsPrefixRefl!0 (_2!9931 lt!344375)))))

(declare-fun lt!345448 () Unit!15482)

(declare-fun lt!345446 () Unit!15482)

(assert (=> d!73935 (= lt!345448 lt!345446)))

(assert (=> d!73935 (isPrefixOf!0 lt!345451 lt!345451)))

(assert (=> d!73935 (= lt!345446 (lemmaIsPrefixRefl!0 lt!345451))))

(declare-fun lt!345447 () Unit!15482)

(declare-fun lt!345450 () Unit!15482)

(assert (=> d!73935 (= lt!345447 lt!345450)))

(assert (=> d!73935 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!73935 (= lt!345450 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!73935 (= lt!345451 (BitStream!8433 (buf!5206 (_2!9931 lt!344375)) (currentByte!9799 thiss!1204) (currentBit!9794 thiss!1204)))))

(assert (=> d!73935 (isPrefixOf!0 thiss!1204 (_2!9931 lt!344375))))

(assert (=> d!73935 (= (reader!0 thiss!1204 (_2!9931 lt!344375)) lt!345441)))

(declare-fun lt!345434 () (_ BitVec 64))

(declare-fun b!217909 () Bool)

(declare-fun lt!345437 () (_ BitVec 64))

(assert (=> b!217909 (= e!148101 (= (_1!9932 lt!345441) (withMovedBitIndex!0 (_2!9932 lt!345441) (bvsub lt!345434 lt!345437))))))

(assert (=> b!217909 (or (= (bvand lt!345434 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!345437 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!345434 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!345434 lt!345437) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217909 (= lt!345437 (bitIndex!0 (size!4662 (buf!5206 (_2!9931 lt!344375))) (currentByte!9799 (_2!9931 lt!344375)) (currentBit!9794 (_2!9931 lt!344375))))))

(assert (=> b!217909 (= lt!345434 (bitIndex!0 (size!4662 (buf!5206 thiss!1204)) (currentByte!9799 thiss!1204) (currentBit!9794 thiss!1204)))))

(assert (= (and d!73935 c!10657) b!217908))

(assert (= (and d!73935 (not c!10657)) b!217906))

(assert (= (and d!73935 res!183366) b!217907))

(assert (= (and b!217907 res!183365) b!217905))

(assert (= (and b!217905 res!183364) b!217909))

(declare-fun m!336321 () Bool)

(assert (=> b!217905 m!336321))

(declare-fun m!336323 () Bool)

(assert (=> d!73935 m!336323))

(declare-fun m!336325 () Bool)

(assert (=> d!73935 m!336325))

(declare-fun m!336327 () Bool)

(assert (=> d!73935 m!336327))

(declare-fun m!336329 () Bool)

(assert (=> d!73935 m!336329))

(declare-fun m!336331 () Bool)

(assert (=> d!73935 m!336331))

(declare-fun m!336333 () Bool)

(assert (=> d!73935 m!336333))

(declare-fun m!336335 () Bool)

(assert (=> d!73935 m!336335))

(assert (=> d!73935 m!335661))

(declare-fun m!336337 () Bool)

(assert (=> d!73935 m!336337))

(declare-fun m!336339 () Bool)

(assert (=> d!73935 m!336339))

(declare-fun m!336341 () Bool)

(assert (=> d!73935 m!336341))

(assert (=> b!217908 m!335655))

(declare-fun m!336343 () Bool)

(assert (=> b!217908 m!336343))

(declare-fun m!336345 () Bool)

(assert (=> b!217908 m!336345))

(declare-fun m!336347 () Bool)

(assert (=> b!217907 m!336347))

(declare-fun m!336349 () Bool)

(assert (=> b!217909 m!336349))

(assert (=> b!217909 m!335659))

(assert (=> b!217909 m!335655))

(assert (=> b!217558 d!73935))

(declare-fun d!73967 () Bool)

(assert (=> d!73967 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!217558 d!73967))

(declare-fun d!73969 () Bool)

(declare-fun lt!345454 () tuple2!18558)

(assert (=> d!73969 (= lt!345454 (readBit!0 lt!344396))))

(assert (=> d!73969 (= (readBitPure!0 lt!344396) (tuple2!18551 (_2!9937 lt!345454) (_1!9937 lt!345454)))))

(declare-fun bs!18046 () Bool)

(assert (= bs!18046 d!73969))

(declare-fun m!336351 () Bool)

(assert (=> bs!18046 m!336351))

(assert (=> b!217558 d!73969))

(declare-fun lt!345455 () tuple2!18564)

(declare-fun d!73971 () Bool)

(assert (=> d!73971 (= lt!345455 (readNBitsLSBFirstsLoop!0 (_1!9932 lt!344378) nBits!348 i!590 lt!344390))))

(assert (=> d!73971 (= (readNBitsLSBFirstsLoopPure!0 (_1!9932 lt!344378) nBits!348 i!590 lt!344390) (tuple2!18553 (_2!9940 lt!345455) (_1!9940 lt!345455)))))

(declare-fun bs!18047 () Bool)

(assert (= bs!18047 d!73971))

(declare-fun m!336353 () Bool)

(assert (=> bs!18047 m!336353))

(assert (=> b!217558 d!73971))

(declare-fun d!73973 () Bool)

(declare-fun e!148107 () Bool)

(assert (=> d!73973 e!148107))

(declare-fun res!183372 () Bool)

(assert (=> d!73973 (=> (not res!183372) (not e!148107))))

(declare-fun lt!345476 () tuple2!18550)

(declare-fun lt!345479 () tuple2!18550)

(assert (=> d!73973 (= res!183372 (= (bitIndex!0 (size!4662 (buf!5206 (_1!9933 lt!345476))) (currentByte!9799 (_1!9933 lt!345476)) (currentBit!9794 (_1!9933 lt!345476))) (bitIndex!0 (size!4662 (buf!5206 (_1!9933 lt!345479))) (currentByte!9799 (_1!9933 lt!345479)) (currentBit!9794 (_1!9933 lt!345479)))))))

(declare-fun lt!345477 () Unit!15482)

(declare-fun lt!345478 () BitStream!8432)

(declare-fun choose!50 (BitStream!8432 BitStream!8432 BitStream!8432 tuple2!18550 tuple2!18550 BitStream!8432 Bool tuple2!18550 tuple2!18550 BitStream!8432 Bool) Unit!15482)

(assert (=> d!73973 (= lt!345477 (choose!50 lt!344396 (_2!9931 lt!344375) lt!345478 lt!345476 (tuple2!18551 (_1!9933 lt!345476) (_2!9933 lt!345476)) (_1!9933 lt!345476) (_2!9933 lt!345476) lt!345479 (tuple2!18551 (_1!9933 lt!345479) (_2!9933 lt!345479)) (_1!9933 lt!345479) (_2!9933 lt!345479)))))

(assert (=> d!73973 (= lt!345479 (readBitPure!0 lt!345478))))

(assert (=> d!73973 (= lt!345476 (readBitPure!0 lt!344396))))

(assert (=> d!73973 (= lt!345478 (BitStream!8433 (buf!5206 (_2!9931 lt!344375)) (currentByte!9799 lt!344396) (currentBit!9794 lt!344396)))))

(assert (=> d!73973 (invariant!0 (currentBit!9794 lt!344396) (currentByte!9799 lt!344396) (size!4662 (buf!5206 (_2!9931 lt!344375))))))

(assert (=> d!73973 (= (readBitPrefixLemma!0 lt!344396 (_2!9931 lt!344375)) lt!345477)))

(declare-fun b!217915 () Bool)

(assert (=> b!217915 (= e!148107 (= (_2!9933 lt!345476) (_2!9933 lt!345479)))))

(assert (= (and d!73973 res!183372) b!217915))

(declare-fun m!336365 () Bool)

(assert (=> d!73973 m!336365))

(declare-fun m!336367 () Bool)

(assert (=> d!73973 m!336367))

(declare-fun m!336369 () Bool)

(assert (=> d!73973 m!336369))

(assert (=> d!73973 m!335619))

(declare-fun m!336371 () Bool)

(assert (=> d!73973 m!336371))

(declare-fun m!336373 () Bool)

(assert (=> d!73973 m!336373))

(assert (=> b!217558 d!73973))

(declare-fun d!73975 () Bool)

(declare-fun lt!345480 () tuple2!18558)

(assert (=> d!73975 (= lt!345480 (readBit!0 (_1!9932 lt!344378)))))

(assert (=> d!73975 (= (readBitPure!0 (_1!9932 lt!344378)) (tuple2!18551 (_2!9937 lt!345480) (_1!9937 lt!345480)))))

(declare-fun bs!18048 () Bool)

(assert (= bs!18048 d!73975))

(declare-fun m!336375 () Bool)

(assert (=> bs!18048 m!336375))

(assert (=> b!217558 d!73975))

(declare-fun d!73977 () Bool)

(assert (=> d!73977 (= (invariant!0 (currentBit!9794 thiss!1204) (currentByte!9799 thiss!1204) (size!4662 (buf!5206 (_2!9931 lt!344379)))) (and (bvsge (currentBit!9794 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9794 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9799 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9799 thiss!1204) (size!4662 (buf!5206 (_2!9931 lt!344379)))) (and (= (currentBit!9794 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9799 thiss!1204) (size!4662 (buf!5206 (_2!9931 lt!344379))))))))))

(assert (=> b!217558 d!73977))

(declare-fun d!73979 () Bool)

(assert (=> d!73979 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4662 (buf!5206 (_2!9931 lt!344375)))) ((_ sign_extend 32) (currentByte!9799 (_2!9931 lt!344379))) ((_ sign_extend 32) (currentBit!9794 (_2!9931 lt!344379))) lt!344398) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4662 (buf!5206 (_2!9931 lt!344375)))) ((_ sign_extend 32) (currentByte!9799 (_2!9931 lt!344379))) ((_ sign_extend 32) (currentBit!9794 (_2!9931 lt!344379)))) lt!344398))))

(declare-fun bs!18049 () Bool)

(assert (= bs!18049 d!73979))

(declare-fun m!336377 () Bool)

(assert (=> bs!18049 m!336377))

(assert (=> b!217558 d!73979))

(declare-fun d!73981 () Bool)

(declare-fun e!148108 () Bool)

(assert (=> d!73981 e!148108))

(declare-fun res!183374 () Bool)

(assert (=> d!73981 (=> (not res!183374) (not e!148108))))

(declare-fun lt!345483 () (_ BitVec 64))

(declare-fun lt!345481 () (_ BitVec 64))

(declare-fun lt!345485 () (_ BitVec 64))

(assert (=> d!73981 (= res!183374 (= lt!345481 (bvsub lt!345483 lt!345485)))))

(assert (=> d!73981 (or (= (bvand lt!345483 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!345485 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!345483 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!345483 lt!345485) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73981 (= lt!345485 (remainingBits!0 ((_ sign_extend 32) (size!4662 (buf!5206 (_1!9933 lt!344377)))) ((_ sign_extend 32) (currentByte!9799 (_1!9933 lt!344377))) ((_ sign_extend 32) (currentBit!9794 (_1!9933 lt!344377)))))))

(declare-fun lt!345484 () (_ BitVec 64))

(declare-fun lt!345482 () (_ BitVec 64))

(assert (=> d!73981 (= lt!345483 (bvmul lt!345484 lt!345482))))

(assert (=> d!73981 (or (= lt!345484 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!345482 (bvsdiv (bvmul lt!345484 lt!345482) lt!345484)))))

(assert (=> d!73981 (= lt!345482 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73981 (= lt!345484 ((_ sign_extend 32) (size!4662 (buf!5206 (_1!9933 lt!344377)))))))

(assert (=> d!73981 (= lt!345481 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9799 (_1!9933 lt!344377))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9794 (_1!9933 lt!344377)))))))

(assert (=> d!73981 (invariant!0 (currentBit!9794 (_1!9933 lt!344377)) (currentByte!9799 (_1!9933 lt!344377)) (size!4662 (buf!5206 (_1!9933 lt!344377))))))

(assert (=> d!73981 (= (bitIndex!0 (size!4662 (buf!5206 (_1!9933 lt!344377))) (currentByte!9799 (_1!9933 lt!344377)) (currentBit!9794 (_1!9933 lt!344377))) lt!345481)))

(declare-fun b!217916 () Bool)

(declare-fun res!183373 () Bool)

(assert (=> b!217916 (=> (not res!183373) (not e!148108))))

(assert (=> b!217916 (= res!183373 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!345481))))

(declare-fun b!217917 () Bool)

(declare-fun lt!345486 () (_ BitVec 64))

(assert (=> b!217917 (= e!148108 (bvsle lt!345481 (bvmul lt!345486 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217917 (or (= lt!345486 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!345486 #b0000000000000000000000000000000000000000000000000000000000001000) lt!345486)))))

(assert (=> b!217917 (= lt!345486 ((_ sign_extend 32) (size!4662 (buf!5206 (_1!9933 lt!344377)))))))

(assert (= (and d!73981 res!183374) b!217916))

(assert (= (and b!217916 res!183373) b!217917))

(declare-fun m!336379 () Bool)

(assert (=> d!73981 m!336379))

(declare-fun m!336381 () Bool)

(assert (=> d!73981 m!336381))

(assert (=> b!217558 d!73981))

(declare-fun d!73983 () Bool)

(declare-fun e!148109 () Bool)

(assert (=> d!73983 e!148109))

(declare-fun res!183376 () Bool)

(assert (=> d!73983 (=> (not res!183376) (not e!148109))))

(declare-fun lt!345487 () (_ BitVec 64))

(declare-fun lt!345489 () (_ BitVec 64))

(declare-fun lt!345491 () (_ BitVec 64))

(assert (=> d!73983 (= res!183376 (= lt!345487 (bvsub lt!345489 lt!345491)))))

(assert (=> d!73983 (or (= (bvand lt!345489 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!345491 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!345489 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!345489 lt!345491) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73983 (= lt!345491 (remainingBits!0 ((_ sign_extend 32) (size!4662 (buf!5206 (_1!9933 lt!344383)))) ((_ sign_extend 32) (currentByte!9799 (_1!9933 lt!344383))) ((_ sign_extend 32) (currentBit!9794 (_1!9933 lt!344383)))))))

(declare-fun lt!345490 () (_ BitVec 64))

(declare-fun lt!345488 () (_ BitVec 64))

(assert (=> d!73983 (= lt!345489 (bvmul lt!345490 lt!345488))))

(assert (=> d!73983 (or (= lt!345490 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!345488 (bvsdiv (bvmul lt!345490 lt!345488) lt!345490)))))

(assert (=> d!73983 (= lt!345488 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73983 (= lt!345490 ((_ sign_extend 32) (size!4662 (buf!5206 (_1!9933 lt!344383)))))))

(assert (=> d!73983 (= lt!345487 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9799 (_1!9933 lt!344383))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9794 (_1!9933 lt!344383)))))))

(assert (=> d!73983 (invariant!0 (currentBit!9794 (_1!9933 lt!344383)) (currentByte!9799 (_1!9933 lt!344383)) (size!4662 (buf!5206 (_1!9933 lt!344383))))))

(assert (=> d!73983 (= (bitIndex!0 (size!4662 (buf!5206 (_1!9933 lt!344383))) (currentByte!9799 (_1!9933 lt!344383)) (currentBit!9794 (_1!9933 lt!344383))) lt!345487)))

(declare-fun b!217918 () Bool)

(declare-fun res!183375 () Bool)

(assert (=> b!217918 (=> (not res!183375) (not e!148109))))

(assert (=> b!217918 (= res!183375 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!345487))))

(declare-fun b!217919 () Bool)

(declare-fun lt!345492 () (_ BitVec 64))

(assert (=> b!217919 (= e!148109 (bvsle lt!345487 (bvmul lt!345492 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217919 (or (= lt!345492 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!345492 #b0000000000000000000000000000000000000000000000000000000000001000) lt!345492)))))

(assert (=> b!217919 (= lt!345492 ((_ sign_extend 32) (size!4662 (buf!5206 (_1!9933 lt!344383)))))))

(assert (= (and d!73983 res!183376) b!217918))

(assert (= (and b!217918 res!183375) b!217919))

(declare-fun m!336383 () Bool)

(assert (=> d!73983 m!336383))

(declare-fun m!336385 () Bool)

(assert (=> d!73983 m!336385))

(assert (=> b!217558 d!73983))

(declare-fun d!73985 () Bool)

(assert (=> d!73985 (validate_offset_bits!1 ((_ sign_extend 32) (size!4662 (buf!5206 (_2!9931 lt!344375)))) ((_ sign_extend 32) (currentByte!9799 (_2!9931 lt!344379))) ((_ sign_extend 32) (currentBit!9794 (_2!9931 lt!344379))) lt!344398)))

(declare-fun lt!345493 () Unit!15482)

(assert (=> d!73985 (= lt!345493 (choose!9 (_2!9931 lt!344379) (buf!5206 (_2!9931 lt!344375)) lt!344398 (BitStream!8433 (buf!5206 (_2!9931 lt!344375)) (currentByte!9799 (_2!9931 lt!344379)) (currentBit!9794 (_2!9931 lt!344379)))))))

(assert (=> d!73985 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9931 lt!344379) (buf!5206 (_2!9931 lt!344375)) lt!344398) lt!345493)))

(declare-fun bs!18050 () Bool)

(assert (= bs!18050 d!73985))

(assert (=> bs!18050 m!335635))

(declare-fun m!336387 () Bool)

(assert (=> bs!18050 m!336387))

(assert (=> b!217558 d!73985))

(declare-fun d!73987 () Bool)

(declare-fun lt!345494 () tuple2!18558)

(assert (=> d!73987 (= lt!345494 (readBit!0 (BitStream!8433 (buf!5206 (_2!9931 lt!344375)) (currentByte!9799 thiss!1204) (currentBit!9794 thiss!1204))))))

(assert (=> d!73987 (= (readBitPure!0 (BitStream!8433 (buf!5206 (_2!9931 lt!344375)) (currentByte!9799 thiss!1204) (currentBit!9794 thiss!1204))) (tuple2!18551 (_2!9937 lt!345494) (_1!9937 lt!345494)))))

(declare-fun bs!18051 () Bool)

(assert (= bs!18051 d!73987))

(declare-fun m!336389 () Bool)

(assert (=> bs!18051 m!336389))

(assert (=> b!217558 d!73987))

(declare-fun b!217920 () Bool)

(declare-fun res!183377 () Bool)

(declare-fun e!148111 () Bool)

(assert (=> b!217920 (=> (not res!183377) (not e!148111))))

(declare-fun lt!345502 () tuple2!18548)

(assert (=> b!217920 (= res!183377 (isPrefixOf!0 (_2!9932 lt!345502) (_2!9931 lt!344375)))))

(declare-fun b!217921 () Bool)

(declare-fun e!148110 () Unit!15482)

(declare-fun Unit!15522 () Unit!15482)

(assert (=> b!217921 (= e!148110 Unit!15522)))

(declare-fun b!217922 () Bool)

(declare-fun res!183378 () Bool)

(assert (=> b!217922 (=> (not res!183378) (not e!148111))))

(assert (=> b!217922 (= res!183378 (isPrefixOf!0 (_1!9932 lt!345502) (_2!9931 lt!344379)))))

(declare-fun b!217923 () Bool)

(declare-fun lt!345497 () Unit!15482)

(assert (=> b!217923 (= e!148110 lt!345497)))

(declare-fun lt!345505 () (_ BitVec 64))

(assert (=> b!217923 (= lt!345505 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!345506 () (_ BitVec 64))

(assert (=> b!217923 (= lt!345506 (bitIndex!0 (size!4662 (buf!5206 (_2!9931 lt!344379))) (currentByte!9799 (_2!9931 lt!344379)) (currentBit!9794 (_2!9931 lt!344379))))))

(assert (=> b!217923 (= lt!345497 (arrayBitRangesEqSymmetric!0 (buf!5206 (_2!9931 lt!344379)) (buf!5206 (_2!9931 lt!344375)) lt!345505 lt!345506))))

(assert (=> b!217923 (arrayBitRangesEq!0 (buf!5206 (_2!9931 lt!344375)) (buf!5206 (_2!9931 lt!344379)) lt!345505 lt!345506)))

(declare-fun d!73989 () Bool)

(assert (=> d!73989 e!148111))

(declare-fun res!183379 () Bool)

(assert (=> d!73989 (=> (not res!183379) (not e!148111))))

(assert (=> d!73989 (= res!183379 (isPrefixOf!0 (_1!9932 lt!345502) (_2!9932 lt!345502)))))

(declare-fun lt!345512 () BitStream!8432)

(assert (=> d!73989 (= lt!345502 (tuple2!18549 lt!345512 (_2!9931 lt!344375)))))

(declare-fun lt!345503 () Unit!15482)

(declare-fun lt!345500 () Unit!15482)

(assert (=> d!73989 (= lt!345503 lt!345500)))

(assert (=> d!73989 (isPrefixOf!0 lt!345512 (_2!9931 lt!344375))))

(assert (=> d!73989 (= lt!345500 (lemmaIsPrefixTransitive!0 lt!345512 (_2!9931 lt!344375) (_2!9931 lt!344375)))))

(declare-fun lt!345499 () Unit!15482)

(declare-fun lt!345496 () Unit!15482)

(assert (=> d!73989 (= lt!345499 lt!345496)))

(assert (=> d!73989 (isPrefixOf!0 lt!345512 (_2!9931 lt!344375))))

(assert (=> d!73989 (= lt!345496 (lemmaIsPrefixTransitive!0 lt!345512 (_2!9931 lt!344379) (_2!9931 lt!344375)))))

(declare-fun lt!345504 () Unit!15482)

(assert (=> d!73989 (= lt!345504 e!148110)))

(declare-fun c!10658 () Bool)

(assert (=> d!73989 (= c!10658 (not (= (size!4662 (buf!5206 (_2!9931 lt!344379))) #b00000000000000000000000000000000)))))

(declare-fun lt!345510 () Unit!15482)

(declare-fun lt!345513 () Unit!15482)

(assert (=> d!73989 (= lt!345510 lt!345513)))

(assert (=> d!73989 (isPrefixOf!0 (_2!9931 lt!344375) (_2!9931 lt!344375))))

(assert (=> d!73989 (= lt!345513 (lemmaIsPrefixRefl!0 (_2!9931 lt!344375)))))

(declare-fun lt!345501 () Unit!15482)

(declare-fun lt!345514 () Unit!15482)

(assert (=> d!73989 (= lt!345501 lt!345514)))

(assert (=> d!73989 (= lt!345514 (lemmaIsPrefixRefl!0 (_2!9931 lt!344375)))))

(declare-fun lt!345509 () Unit!15482)

(declare-fun lt!345507 () Unit!15482)

(assert (=> d!73989 (= lt!345509 lt!345507)))

(assert (=> d!73989 (isPrefixOf!0 lt!345512 lt!345512)))

(assert (=> d!73989 (= lt!345507 (lemmaIsPrefixRefl!0 lt!345512))))

(declare-fun lt!345508 () Unit!15482)

(declare-fun lt!345511 () Unit!15482)

(assert (=> d!73989 (= lt!345508 lt!345511)))

(assert (=> d!73989 (isPrefixOf!0 (_2!9931 lt!344379) (_2!9931 lt!344379))))

(assert (=> d!73989 (= lt!345511 (lemmaIsPrefixRefl!0 (_2!9931 lt!344379)))))

(assert (=> d!73989 (= lt!345512 (BitStream!8433 (buf!5206 (_2!9931 lt!344375)) (currentByte!9799 (_2!9931 lt!344379)) (currentBit!9794 (_2!9931 lt!344379))))))

(assert (=> d!73989 (isPrefixOf!0 (_2!9931 lt!344379) (_2!9931 lt!344375))))

(assert (=> d!73989 (= (reader!0 (_2!9931 lt!344379) (_2!9931 lt!344375)) lt!345502)))

(declare-fun lt!345498 () (_ BitVec 64))

(declare-fun b!217924 () Bool)

(declare-fun lt!345495 () (_ BitVec 64))

(assert (=> b!217924 (= e!148111 (= (_1!9932 lt!345502) (withMovedBitIndex!0 (_2!9932 lt!345502) (bvsub lt!345495 lt!345498))))))

(assert (=> b!217924 (or (= (bvand lt!345495 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!345498 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!345495 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!345495 lt!345498) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217924 (= lt!345498 (bitIndex!0 (size!4662 (buf!5206 (_2!9931 lt!344375))) (currentByte!9799 (_2!9931 lt!344375)) (currentBit!9794 (_2!9931 lt!344375))))))

(assert (=> b!217924 (= lt!345495 (bitIndex!0 (size!4662 (buf!5206 (_2!9931 lt!344379))) (currentByte!9799 (_2!9931 lt!344379)) (currentBit!9794 (_2!9931 lt!344379))))))

(assert (= (and d!73989 c!10658) b!217923))

(assert (= (and d!73989 (not c!10658)) b!217921))

(assert (= (and d!73989 res!183379) b!217922))

(assert (= (and b!217922 res!183378) b!217920))

(assert (= (and b!217920 res!183377) b!217924))

(declare-fun m!336391 () Bool)

(assert (=> b!217920 m!336391))

(assert (=> d!73989 m!336323))

(declare-fun m!336393 () Bool)

(assert (=> d!73989 m!336393))

(declare-fun m!336395 () Bool)

(assert (=> d!73989 m!336395))

(declare-fun m!336397 () Bool)

(assert (=> d!73989 m!336397))

(declare-fun m!336399 () Bool)

(assert (=> d!73989 m!336399))

(declare-fun m!336401 () Bool)

(assert (=> d!73989 m!336401))

(declare-fun m!336403 () Bool)

(assert (=> d!73989 m!336403))

(assert (=> d!73989 m!335671))

(assert (=> d!73989 m!336207))

(declare-fun m!336405 () Bool)

(assert (=> d!73989 m!336405))

(assert (=> d!73989 m!336341))

(assert (=> b!217923 m!335653))

(declare-fun m!336407 () Bool)

(assert (=> b!217923 m!336407))

(declare-fun m!336409 () Bool)

(assert (=> b!217923 m!336409))

(declare-fun m!336411 () Bool)

(assert (=> b!217922 m!336411))

(declare-fun m!336413 () Bool)

(assert (=> b!217924 m!336413))

(assert (=> b!217924 m!335659))

(assert (=> b!217924 m!335653))

(assert (=> b!217558 d!73989))

(declare-fun d!73991 () Bool)

(declare-fun lt!345515 () tuple2!18564)

(assert (=> d!73991 (= lt!345515 (readNBitsLSBFirstsLoop!0 (_1!9932 lt!344392) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!344376))))

(assert (=> d!73991 (= (readNBitsLSBFirstsLoopPure!0 (_1!9932 lt!344392) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!344376) (tuple2!18553 (_2!9940 lt!345515) (_1!9940 lt!345515)))))

(declare-fun bs!18052 () Bool)

(assert (= bs!18052 d!73991))

(declare-fun m!336415 () Bool)

(assert (=> bs!18052 m!336415))

(assert (=> b!217558 d!73991))

(declare-fun d!73993 () Bool)

(assert (=> d!73993 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4662 (buf!5206 (_2!9931 lt!344375)))) ((_ sign_extend 32) (currentByte!9799 thiss!1204)) ((_ sign_extend 32) (currentBit!9794 thiss!1204)) lt!344374) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4662 (buf!5206 (_2!9931 lt!344375)))) ((_ sign_extend 32) (currentByte!9799 thiss!1204)) ((_ sign_extend 32) (currentBit!9794 thiss!1204))) lt!344374))))

(declare-fun bs!18053 () Bool)

(assert (= bs!18053 d!73993))

(declare-fun m!336417 () Bool)

(assert (=> bs!18053 m!336417))

(assert (=> b!217558 d!73993))

(declare-fun d!73995 () Bool)

(assert (=> d!73995 (= (array_inv!4403 (buf!5206 thiss!1204)) (bvsge (size!4662 (buf!5206 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!217537 d!73995))

(declare-fun d!73997 () Bool)

(declare-fun e!148112 () Bool)

(assert (=> d!73997 e!148112))

(declare-fun res!183381 () Bool)

(assert (=> d!73997 (=> (not res!183381) (not e!148112))))

(declare-fun lt!345520 () (_ BitVec 64))

(declare-fun lt!345516 () (_ BitVec 64))

(declare-fun lt!345518 () (_ BitVec 64))

(assert (=> d!73997 (= res!183381 (= lt!345516 (bvsub lt!345518 lt!345520)))))

(assert (=> d!73997 (or (= (bvand lt!345518 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!345520 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!345518 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!345518 lt!345520) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73997 (= lt!345520 (remainingBits!0 ((_ sign_extend 32) (size!4662 (buf!5206 (_2!9931 lt!344379)))) ((_ sign_extend 32) (currentByte!9799 (_2!9931 lt!344379))) ((_ sign_extend 32) (currentBit!9794 (_2!9931 lt!344379)))))))

(declare-fun lt!345519 () (_ BitVec 64))

(declare-fun lt!345517 () (_ BitVec 64))

(assert (=> d!73997 (= lt!345518 (bvmul lt!345519 lt!345517))))

(assert (=> d!73997 (or (= lt!345519 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!345517 (bvsdiv (bvmul lt!345519 lt!345517) lt!345519)))))

(assert (=> d!73997 (= lt!345517 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73997 (= lt!345519 ((_ sign_extend 32) (size!4662 (buf!5206 (_2!9931 lt!344379)))))))

(assert (=> d!73997 (= lt!345516 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9799 (_2!9931 lt!344379))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9794 (_2!9931 lt!344379)))))))

(assert (=> d!73997 (invariant!0 (currentBit!9794 (_2!9931 lt!344379)) (currentByte!9799 (_2!9931 lt!344379)) (size!4662 (buf!5206 (_2!9931 lt!344379))))))

(assert (=> d!73997 (= (bitIndex!0 (size!4662 (buf!5206 (_2!9931 lt!344379))) (currentByte!9799 (_2!9931 lt!344379)) (currentBit!9794 (_2!9931 lt!344379))) lt!345516)))

(declare-fun b!217925 () Bool)

(declare-fun res!183380 () Bool)

(assert (=> b!217925 (=> (not res!183380) (not e!148112))))

(assert (=> b!217925 (= res!183380 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!345516))))

(declare-fun b!217926 () Bool)

(declare-fun lt!345521 () (_ BitVec 64))

(assert (=> b!217926 (= e!148112 (bvsle lt!345516 (bvmul lt!345521 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217926 (or (= lt!345521 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!345521 #b0000000000000000000000000000000000000000000000000000000000001000) lt!345521)))))

(assert (=> b!217926 (= lt!345521 ((_ sign_extend 32) (size!4662 (buf!5206 (_2!9931 lt!344379)))))))

(assert (= (and d!73997 res!183381) b!217925))

(assert (= (and b!217925 res!183380) b!217926))

(declare-fun m!336419 () Bool)

(assert (=> d!73997 m!336419))

(assert (=> d!73997 m!335747))

(assert (=> b!217538 d!73997))

(declare-fun d!73999 () Bool)

(declare-fun e!148113 () Bool)

(assert (=> d!73999 e!148113))

(declare-fun res!183383 () Bool)

(assert (=> d!73999 (=> (not res!183383) (not e!148113))))

(declare-fun lt!345524 () (_ BitVec 64))

(declare-fun lt!345522 () (_ BitVec 64))

(declare-fun lt!345526 () (_ BitVec 64))

(assert (=> d!73999 (= res!183383 (= lt!345522 (bvsub lt!345524 lt!345526)))))

(assert (=> d!73999 (or (= (bvand lt!345524 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!345526 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!345524 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!345524 lt!345526) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73999 (= lt!345526 (remainingBits!0 ((_ sign_extend 32) (size!4662 (buf!5206 thiss!1204))) ((_ sign_extend 32) (currentByte!9799 thiss!1204)) ((_ sign_extend 32) (currentBit!9794 thiss!1204))))))

(declare-fun lt!345525 () (_ BitVec 64))

(declare-fun lt!345523 () (_ BitVec 64))

(assert (=> d!73999 (= lt!345524 (bvmul lt!345525 lt!345523))))

(assert (=> d!73999 (or (= lt!345525 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!345523 (bvsdiv (bvmul lt!345525 lt!345523) lt!345525)))))

(assert (=> d!73999 (= lt!345523 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73999 (= lt!345525 ((_ sign_extend 32) (size!4662 (buf!5206 thiss!1204))))))

(assert (=> d!73999 (= lt!345522 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9799 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9794 thiss!1204))))))

(assert (=> d!73999 (invariant!0 (currentBit!9794 thiss!1204) (currentByte!9799 thiss!1204) (size!4662 (buf!5206 thiss!1204)))))

(assert (=> d!73999 (= (bitIndex!0 (size!4662 (buf!5206 thiss!1204)) (currentByte!9799 thiss!1204) (currentBit!9794 thiss!1204)) lt!345522)))

(declare-fun b!217927 () Bool)

(declare-fun res!183382 () Bool)

(assert (=> b!217927 (=> (not res!183382) (not e!148113))))

(assert (=> b!217927 (= res!183382 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!345522))))

(declare-fun b!217928 () Bool)

(declare-fun lt!345527 () (_ BitVec 64))

(assert (=> b!217928 (= e!148113 (bvsle lt!345522 (bvmul lt!345527 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217928 (or (= lt!345527 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!345527 #b0000000000000000000000000000000000000000000000000000000000001000) lt!345527)))))

(assert (=> b!217928 (= lt!345527 ((_ sign_extend 32) (size!4662 (buf!5206 thiss!1204))))))

(assert (= (and d!73999 res!183383) b!217927))

(assert (= (and b!217927 res!183382) b!217928))

(assert (=> d!73999 m!335719))

(assert (=> d!73999 m!335615))

(assert (=> b!217538 d!73999))

(assert (=> b!217560 d!73997))

(assert (=> b!217560 d!73999))

(declare-fun b!217939 () Bool)

(declare-fun res!183394 () Bool)

(declare-fun e!148119 () Bool)

(assert (=> b!217939 (=> (not res!183394) (not e!148119))))

(declare-fun lt!345536 () tuple2!18546)

(assert (=> b!217939 (= res!183394 (isPrefixOf!0 thiss!1204 (_2!9931 lt!345536)))))

(declare-fun b!217940 () Bool)

(declare-fun e!148118 () Bool)

(assert (=> b!217940 (= e!148119 e!148118)))

(declare-fun res!183395 () Bool)

(assert (=> b!217940 (=> (not res!183395) (not e!148118))))

(declare-fun lt!345537 () tuple2!18550)

(assert (=> b!217940 (= res!183395 (and (= (_2!9933 lt!345537) lt!344401) (= (_1!9933 lt!345537) (_2!9931 lt!345536))))))

(assert (=> b!217940 (= lt!345537 (readBitPure!0 (readerFrom!0 (_2!9931 lt!345536) (currentBit!9794 thiss!1204) (currentByte!9799 thiss!1204))))))

(declare-fun b!217941 () Bool)

(assert (=> b!217941 (= e!148118 (= (bitIndex!0 (size!4662 (buf!5206 (_1!9933 lt!345537))) (currentByte!9799 (_1!9933 lt!345537)) (currentBit!9794 (_1!9933 lt!345537))) (bitIndex!0 (size!4662 (buf!5206 (_2!9931 lt!345536))) (currentByte!9799 (_2!9931 lt!345536)) (currentBit!9794 (_2!9931 lt!345536)))))))

(declare-fun b!217938 () Bool)

(declare-fun res!183392 () Bool)

(assert (=> b!217938 (=> (not res!183392) (not e!148119))))

(declare-fun lt!345538 () (_ BitVec 64))

(declare-fun lt!345539 () (_ BitVec 64))

(assert (=> b!217938 (= res!183392 (= (bitIndex!0 (size!4662 (buf!5206 (_2!9931 lt!345536))) (currentByte!9799 (_2!9931 lt!345536)) (currentBit!9794 (_2!9931 lt!345536))) (bvadd lt!345538 lt!345539)))))

(assert (=> b!217938 (or (not (= (bvand lt!345538 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!345539 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!345538 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!345538 lt!345539) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217938 (= lt!345539 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!217938 (= lt!345538 (bitIndex!0 (size!4662 (buf!5206 thiss!1204)) (currentByte!9799 thiss!1204) (currentBit!9794 thiss!1204)))))

(declare-fun d!74001 () Bool)

(assert (=> d!74001 e!148119))

(declare-fun res!183393 () Bool)

(assert (=> d!74001 (=> (not res!183393) (not e!148119))))

(assert (=> d!74001 (= res!183393 (= (size!4662 (buf!5206 thiss!1204)) (size!4662 (buf!5206 (_2!9931 lt!345536)))))))

(declare-fun choose!16 (BitStream!8432 Bool) tuple2!18546)

(assert (=> d!74001 (= lt!345536 (choose!16 thiss!1204 lt!344401))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!74001 (validate_offset_bit!0 ((_ sign_extend 32) (size!4662 (buf!5206 thiss!1204))) ((_ sign_extend 32) (currentByte!9799 thiss!1204)) ((_ sign_extend 32) (currentBit!9794 thiss!1204)))))

(assert (=> d!74001 (= (appendBit!0 thiss!1204 lt!344401) lt!345536)))

(assert (= (and d!74001 res!183393) b!217938))

(assert (= (and b!217938 res!183392) b!217939))

(assert (= (and b!217939 res!183394) b!217940))

(assert (= (and b!217940 res!183395) b!217941))

(declare-fun m!336421 () Bool)

(assert (=> b!217938 m!336421))

(assert (=> b!217938 m!335655))

(declare-fun m!336423 () Bool)

(assert (=> d!74001 m!336423))

(declare-fun m!336425 () Bool)

(assert (=> d!74001 m!336425))

(declare-fun m!336427 () Bool)

(assert (=> b!217940 m!336427))

(assert (=> b!217940 m!336427))

(declare-fun m!336429 () Bool)

(assert (=> b!217940 m!336429))

(declare-fun m!336431 () Bool)

(assert (=> b!217941 m!336431))

(assert (=> b!217941 m!336421))

(declare-fun m!336433 () Bool)

(assert (=> b!217939 m!336433))

(assert (=> b!217560 d!74001))

(push 1)

(assert (not d!73829))

(assert (not d!73787))

(assert (not b!217866))

(assert (not d!73969))

(assert (not d!73979))

(assert (not b!217861))

(assert (not b!217865))

(assert (not d!73997))

(assert (not b!217940))

(assert (not d!73807))

(assert (not b!217938))

(assert (not b!217939))

(assert (not b!217856))

(assert (not d!73993))

(assert (not b!217922))

(assert (not b!217610))

(assert (not d!73981))

(assert (not b!217862))

(assert (not b!217612))

(assert (not d!73987))

(assert (not b!217924))

(assert (not d!73823))

(assert (not b!217851))

(assert (not d!73991))

(assert (not b!217853))

(assert (not b!217628))

(assert (not d!73975))

(assert (not d!73999))

(assert (not d!73933))

(assert (not d!73919))

(assert (not bm!3408))

(assert (not b!217643))

(assert (not b!217860))

(assert (not d!73989))

(assert (not b!217909))

(assert (not b!217614))

(assert (not b!217907))

(assert (not d!73821))

(assert (not d!74001))

(assert (not d!73971))

(assert (not b!217616))

(assert (not b!217920))

(assert (not d!73931))

(assert (not b!217905))

(assert (not d!73831))

(assert (not b!217923))

(assert (not d!73783))

(assert (not b!217641))

(assert (not b!217863))

(assert (not d!73809))

(assert (not d!73985))

(assert (not d!73813))

(assert (not d!73983))

(assert (not b!217908))

(assert (not d!73799))

(assert (not d!73929))

(assert (not b!217941))

(assert (not d!73825))

(assert (not d!73803))

(assert (not d!73935))

(assert (not d!73973))

(check-sat)

(pop 1)

(push 1)

(check-sat)

