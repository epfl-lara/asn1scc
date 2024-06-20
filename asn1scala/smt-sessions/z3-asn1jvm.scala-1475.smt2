; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40744 () Bool)

(assert start!40744)

(declare-fun b!187490 () Bool)

(declare-fun e!129634 () Bool)

(declare-fun e!129630 () Bool)

(assert (=> b!187490 (= e!129634 e!129630)))

(declare-fun res!156171 () Bool)

(assert (=> b!187490 (=> (not res!156171) (not e!129630))))

(declare-fun lt!290439 () (_ BitVec 64))

(declare-fun lt!290418 () (_ BitVec 64))

(assert (=> b!187490 (= res!156171 (= lt!290439 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!290418)))))

(declare-datatypes ((array!9844 0))(
  ( (array!9845 (arr!5270 (Array (_ BitVec 32) (_ BitVec 8))) (size!4340 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7788 0))(
  ( (BitStream!7789 (buf!4808 array!9844) (currentByte!9068 (_ BitVec 32)) (currentBit!9063 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13401 0))(
  ( (Unit!13402) )
))
(declare-datatypes ((tuple2!16204 0))(
  ( (tuple2!16205 (_1!8747 Unit!13401) (_2!8747 BitStream!7788)) )
))
(declare-fun lt!290420 () tuple2!16204)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!187490 (= lt!290439 (bitIndex!0 (size!4340 (buf!4808 (_2!8747 lt!290420))) (currentByte!9068 (_2!8747 lt!290420)) (currentBit!9063 (_2!8747 lt!290420))))))

(declare-fun thiss!1204 () BitStream!7788)

(assert (=> b!187490 (= lt!290418 (bitIndex!0 (size!4340 (buf!4808 thiss!1204)) (currentByte!9068 thiss!1204) (currentBit!9063 thiss!1204)))))

(declare-fun b!187491 () Bool)

(declare-fun e!129637 () Bool)

(declare-fun lt!290422 () tuple2!16204)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!187491 (= e!129637 (invariant!0 (currentBit!9063 thiss!1204) (currentByte!9068 thiss!1204) (size!4340 (buf!4808 (_2!8747 lt!290422)))))))

(declare-fun b!187492 () Bool)

(declare-fun e!129641 () Bool)

(declare-datatypes ((tuple2!16206 0))(
  ( (tuple2!16207 (_1!8748 BitStream!7788) (_2!8748 (_ BitVec 64))) )
))
(declare-fun lt!290438 () tuple2!16206)

(assert (=> b!187492 (= e!129641 (invariant!0 (currentBit!9063 (_1!8748 lt!290438)) (currentByte!9068 (_1!8748 lt!290438)) (size!4340 (buf!4808 (_1!8748 lt!290438)))))))

(declare-fun b!187493 () Bool)

(declare-fun res!156164 () Bool)

(declare-fun e!129629 () Bool)

(assert (=> b!187493 (=> res!156164 e!129629)))

(declare-fun isPrefixOf!0 (BitStream!7788 BitStream!7788) Bool)

(assert (=> b!187493 (= res!156164 (not (isPrefixOf!0 (_2!8747 lt!290420) (_2!8747 lt!290422))))))

(declare-fun b!187494 () Bool)

(declare-fun res!156168 () Bool)

(declare-fun e!129639 () Bool)

(assert (=> b!187494 (=> (not res!156168) (not e!129639))))

(declare-fun lt!290441 () (_ BitVec 64))

(declare-datatypes ((tuple2!16208 0))(
  ( (tuple2!16209 (_1!8749 BitStream!7788) (_2!8749 BitStream!7788)) )
))
(declare-fun lt!290427 () tuple2!16208)

(declare-fun lt!290442 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7788 (_ BitVec 64)) BitStream!7788)

(assert (=> b!187494 (= res!156168 (= (_1!8749 lt!290427) (withMovedBitIndex!0 (_2!8749 lt!290427) (bvsub lt!290441 lt!290442))))))

(declare-fun b!187495 () Bool)

(declare-fun res!156167 () Bool)

(declare-fun e!129638 () Bool)

(assert (=> b!187495 (=> (not res!156167) (not e!129638))))

(assert (=> b!187495 (= res!156167 (invariant!0 (currentBit!9063 thiss!1204) (currentByte!9068 thiss!1204) (size!4340 (buf!4808 thiss!1204))))))

(declare-fun b!187496 () Bool)

(declare-fun e!129635 () Bool)

(declare-fun array_inv!4081 (array!9844) Bool)

(assert (=> b!187496 (= e!129635 (array_inv!4081 (buf!4808 thiss!1204)))))

(declare-fun b!187497 () Bool)

(declare-fun e!129636 () Bool)

(assert (=> b!187497 (= e!129636 e!129641)))

(declare-fun res!156151 () Bool)

(assert (=> b!187497 (=> res!156151 e!129641)))

(declare-fun lt!290445 () BitStream!7788)

(assert (=> b!187497 (= res!156151 (not (= (_1!8749 lt!290427) lt!290445)))))

(assert (=> b!187497 e!129639))

(declare-fun res!156157 () Bool)

(assert (=> b!187497 (=> (not res!156157) (not e!129639))))

(declare-fun lt!290434 () tuple2!16206)

(assert (=> b!187497 (= res!156157 (and (= (_2!8748 lt!290438) (_2!8748 lt!290434)) (= (_1!8748 lt!290438) (_1!8748 lt!290434))))))

(declare-fun lt!290444 () Unit!13401)

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!290429 () tuple2!16208)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!290421 () (_ BitVec 64))

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7788 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13401)

(assert (=> b!187497 (= lt!290444 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8749 lt!290429) nBits!348 i!590 lt!290421))))

(declare-fun lt!290430 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7788 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16206)

(assert (=> b!187497 (= lt!290434 (readNBitsLSBFirstsLoopPure!0 lt!290445 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!290430))))

(assert (=> b!187497 (= lt!290445 (withMovedBitIndex!0 (_1!8749 lt!290429) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!187499 () Bool)

(declare-fun e!129640 () Bool)

(assert (=> b!187499 (= e!129630 e!129640)))

(declare-fun res!156159 () Bool)

(assert (=> b!187499 (=> (not res!156159) (not e!129640))))

(declare-datatypes ((tuple2!16210 0))(
  ( (tuple2!16211 (_1!8750 BitStream!7788) (_2!8750 Bool)) )
))
(declare-fun lt!290426 () tuple2!16210)

(declare-fun lt!290437 () Bool)

(assert (=> b!187499 (= res!156159 (and (= (_2!8750 lt!290426) lt!290437) (= (_1!8750 lt!290426) (_2!8747 lt!290420))))))

(declare-fun readBitPure!0 (BitStream!7788) tuple2!16210)

(declare-fun readerFrom!0 (BitStream!7788 (_ BitVec 32) (_ BitVec 32)) BitStream!7788)

(assert (=> b!187499 (= lt!290426 (readBitPure!0 (readerFrom!0 (_2!8747 lt!290420) (currentBit!9063 thiss!1204) (currentByte!9068 thiss!1204))))))

(declare-fun b!187500 () Bool)

(declare-fun e!129633 () Bool)

(declare-fun lt!290425 () tuple2!16210)

(declare-fun lt!290424 () tuple2!16210)

(assert (=> b!187500 (= e!129633 (= (_2!8750 lt!290425) (_2!8750 lt!290424)))))

(declare-fun b!187501 () Bool)

(declare-fun res!156162 () Bool)

(assert (=> b!187501 (=> (not res!156162) (not e!129638))))

(assert (=> b!187501 (= res!156162 (not (= i!590 nBits!348)))))

(declare-fun b!187502 () Bool)

(declare-fun res!156154 () Bool)

(assert (=> b!187502 (=> (not res!156154) (not e!129630))))

(assert (=> b!187502 (= res!156154 (isPrefixOf!0 thiss!1204 (_2!8747 lt!290420)))))

(declare-fun b!187503 () Bool)

(declare-fun res!156166 () Bool)

(assert (=> b!187503 (=> res!156166 e!129629)))

(assert (=> b!187503 (= res!156166 (not (invariant!0 (currentBit!9063 (_2!8747 lt!290422)) (currentByte!9068 (_2!8747 lt!290422)) (size!4340 (buf!4808 (_2!8747 lt!290422))))))))

(declare-fun b!187504 () Bool)

(declare-fun e!129632 () Bool)

(assert (=> b!187504 (= e!129632 e!129629)))

(declare-fun res!156155 () Bool)

(assert (=> b!187504 (=> res!156155 e!129629)))

(assert (=> b!187504 (= res!156155 (not (= lt!290442 (bvsub (bvsub (bvadd lt!290441 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!187504 (= lt!290442 (bitIndex!0 (size!4340 (buf!4808 (_2!8747 lt!290422))) (currentByte!9068 (_2!8747 lt!290422)) (currentBit!9063 (_2!8747 lt!290422))))))

(assert (=> b!187504 (isPrefixOf!0 thiss!1204 (_2!8747 lt!290422))))

(declare-fun lt!290423 () Unit!13401)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7788 BitStream!7788 BitStream!7788) Unit!13401)

(assert (=> b!187504 (= lt!290423 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8747 lt!290420) (_2!8747 lt!290422)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7788 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16204)

(assert (=> b!187504 (= lt!290422 (appendBitsLSBFirstLoopTR!0 (_2!8747 lt!290420) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!187505 () Bool)

(declare-fun res!156152 () Bool)

(assert (=> b!187505 (=> (not res!156152) (not e!129639))))

(declare-fun lt!290431 () (_ BitVec 64))

(assert (=> b!187505 (= res!156152 (= (_1!8749 lt!290429) (withMovedBitIndex!0 (_2!8749 lt!290429) (bvsub lt!290431 lt!290442))))))

(declare-fun lt!290446 () tuple2!16206)

(declare-fun b!187506 () Bool)

(assert (=> b!187506 (= e!129639 (and (= lt!290431 (bvsub lt!290441 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8749 lt!290427) lt!290445)) (= (_2!8748 lt!290438) (_2!8748 lt!290446)))))))

(declare-fun b!187507 () Bool)

(declare-fun e!129628 () Bool)

(assert (=> b!187507 (= e!129628 e!129638)))

(declare-fun res!156169 () Bool)

(assert (=> b!187507 (=> (not res!156169) (not e!129638))))

(declare-fun lt!290432 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!187507 (= res!156169 (validate_offset_bits!1 ((_ sign_extend 32) (size!4340 (buf!4808 thiss!1204))) ((_ sign_extend 32) (currentByte!9068 thiss!1204)) ((_ sign_extend 32) (currentBit!9063 thiss!1204)) lt!290432))))

(assert (=> b!187507 (= lt!290432 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!187508 () Bool)

(assert (=> b!187508 (= e!129629 e!129636)))

(declare-fun res!156156 () Bool)

(assert (=> b!187508 (=> res!156156 e!129636)))

(assert (=> b!187508 (= res!156156 (not (= (_1!8748 lt!290446) (_2!8749 lt!290427))))))

(assert (=> b!187508 (= lt!290446 (readNBitsLSBFirstsLoopPure!0 (_1!8749 lt!290427) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!290430))))

(declare-fun lt!290436 () (_ BitVec 64))

(assert (=> b!187508 (validate_offset_bits!1 ((_ sign_extend 32) (size!4340 (buf!4808 (_2!8747 lt!290422)))) ((_ sign_extend 32) (currentByte!9068 (_2!8747 lt!290420))) ((_ sign_extend 32) (currentBit!9063 (_2!8747 lt!290420))) lt!290436)))

(declare-fun lt!290440 () Unit!13401)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7788 array!9844 (_ BitVec 64)) Unit!13401)

(assert (=> b!187508 (= lt!290440 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8747 lt!290420) (buf!4808 (_2!8747 lt!290422)) lt!290436))))

(assert (=> b!187508 (= lt!290436 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!290443 () tuple2!16210)

(declare-fun lt!290433 () (_ BitVec 64))

(assert (=> b!187508 (= lt!290430 (bvor lt!290421 (ite (_2!8750 lt!290443) lt!290433 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187508 (= lt!290438 (readNBitsLSBFirstsLoopPure!0 (_1!8749 lt!290429) nBits!348 i!590 lt!290421))))

(assert (=> b!187508 (validate_offset_bits!1 ((_ sign_extend 32) (size!4340 (buf!4808 (_2!8747 lt!290422)))) ((_ sign_extend 32) (currentByte!9068 thiss!1204)) ((_ sign_extend 32) (currentBit!9063 thiss!1204)) lt!290432)))

(declare-fun lt!290435 () Unit!13401)

(assert (=> b!187508 (= lt!290435 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4808 (_2!8747 lt!290422)) lt!290432))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!187508 (= lt!290421 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!187508 (= (_2!8750 lt!290443) lt!290437)))

(assert (=> b!187508 (= lt!290443 (readBitPure!0 (_1!8749 lt!290429)))))

(declare-fun reader!0 (BitStream!7788 BitStream!7788) tuple2!16208)

(assert (=> b!187508 (= lt!290427 (reader!0 (_2!8747 lt!290420) (_2!8747 lt!290422)))))

(assert (=> b!187508 (= lt!290429 (reader!0 thiss!1204 (_2!8747 lt!290422)))))

(assert (=> b!187508 e!129633))

(declare-fun res!156170 () Bool)

(assert (=> b!187508 (=> (not res!156170) (not e!129633))))

(assert (=> b!187508 (= res!156170 (= (bitIndex!0 (size!4340 (buf!4808 (_1!8750 lt!290425))) (currentByte!9068 (_1!8750 lt!290425)) (currentBit!9063 (_1!8750 lt!290425))) (bitIndex!0 (size!4340 (buf!4808 (_1!8750 lt!290424))) (currentByte!9068 (_1!8750 lt!290424)) (currentBit!9063 (_1!8750 lt!290424)))))))

(declare-fun lt!290419 () Unit!13401)

(declare-fun lt!290428 () BitStream!7788)

(declare-fun readBitPrefixLemma!0 (BitStream!7788 BitStream!7788) Unit!13401)

(assert (=> b!187508 (= lt!290419 (readBitPrefixLemma!0 lt!290428 (_2!8747 lt!290422)))))

(assert (=> b!187508 (= lt!290424 (readBitPure!0 (BitStream!7789 (buf!4808 (_2!8747 lt!290422)) (currentByte!9068 thiss!1204) (currentBit!9063 thiss!1204))))))

(assert (=> b!187508 (= lt!290425 (readBitPure!0 lt!290428))))

(assert (=> b!187508 e!129637))

(declare-fun res!156161 () Bool)

(assert (=> b!187508 (=> (not res!156161) (not e!129637))))

(assert (=> b!187508 (= res!156161 (invariant!0 (currentBit!9063 thiss!1204) (currentByte!9068 thiss!1204) (size!4340 (buf!4808 (_2!8747 lt!290420)))))))

(assert (=> b!187508 (= lt!290428 (BitStream!7789 (buf!4808 (_2!8747 lt!290420)) (currentByte!9068 thiss!1204) (currentBit!9063 thiss!1204)))))

(declare-fun b!187509 () Bool)

(declare-fun res!156163 () Bool)

(assert (=> b!187509 (=> res!156163 e!129629)))

(assert (=> b!187509 (= res!156163 (not (isPrefixOf!0 thiss!1204 (_2!8747 lt!290420))))))

(declare-fun b!187510 () Bool)

(assert (=> b!187510 (= e!129638 (not e!129632))))

(declare-fun res!156165 () Bool)

(assert (=> b!187510 (=> res!156165 e!129632)))

(assert (=> b!187510 (= res!156165 (not (= lt!290441 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!290431))))))

(assert (=> b!187510 (= lt!290441 (bitIndex!0 (size!4340 (buf!4808 (_2!8747 lt!290420))) (currentByte!9068 (_2!8747 lt!290420)) (currentBit!9063 (_2!8747 lt!290420))))))

(assert (=> b!187510 (= lt!290431 (bitIndex!0 (size!4340 (buf!4808 thiss!1204)) (currentByte!9068 thiss!1204) (currentBit!9063 thiss!1204)))))

(assert (=> b!187510 e!129634))

(declare-fun res!156153 () Bool)

(assert (=> b!187510 (=> (not res!156153) (not e!129634))))

(assert (=> b!187510 (= res!156153 (= (size!4340 (buf!4808 thiss!1204)) (size!4340 (buf!4808 (_2!8747 lt!290420)))))))

(declare-fun appendBit!0 (BitStream!7788 Bool) tuple2!16204)

(assert (=> b!187510 (= lt!290420 (appendBit!0 thiss!1204 lt!290437))))

(assert (=> b!187510 (= lt!290437 (not (= (bvand v!189 lt!290433) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187510 (= lt!290433 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!187511 () Bool)

(declare-fun res!156158 () Bool)

(assert (=> b!187511 (=> res!156158 e!129629)))

(assert (=> b!187511 (= res!156158 (or (not (= (size!4340 (buf!4808 (_2!8747 lt!290422))) (size!4340 (buf!4808 thiss!1204)))) (not (= lt!290442 (bvsub (bvadd lt!290431 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun res!156160 () Bool)

(assert (=> start!40744 (=> (not res!156160) (not e!129628))))

(assert (=> start!40744 (= res!156160 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40744 e!129628))

(assert (=> start!40744 true))

(declare-fun inv!12 (BitStream!7788) Bool)

(assert (=> start!40744 (and (inv!12 thiss!1204) e!129635)))

(declare-fun b!187498 () Bool)

(assert (=> b!187498 (= e!129640 (= (bitIndex!0 (size!4340 (buf!4808 (_1!8750 lt!290426))) (currentByte!9068 (_1!8750 lt!290426)) (currentBit!9063 (_1!8750 lt!290426))) lt!290439))))

(assert (= (and start!40744 res!156160) b!187507))

(assert (= (and b!187507 res!156169) b!187495))

(assert (= (and b!187495 res!156167) b!187501))

(assert (= (and b!187501 res!156162) b!187510))

(assert (= (and b!187510 res!156153) b!187490))

(assert (= (and b!187490 res!156171) b!187502))

(assert (= (and b!187502 res!156154) b!187499))

(assert (= (and b!187499 res!156159) b!187498))

(assert (= (and b!187510 (not res!156165)) b!187504))

(assert (= (and b!187504 (not res!156155)) b!187503))

(assert (= (and b!187503 (not res!156166)) b!187511))

(assert (= (and b!187511 (not res!156158)) b!187493))

(assert (= (and b!187493 (not res!156164)) b!187509))

(assert (= (and b!187509 (not res!156163)) b!187508))

(assert (= (and b!187508 res!156161) b!187491))

(assert (= (and b!187508 res!156170) b!187500))

(assert (= (and b!187508 (not res!156156)) b!187497))

(assert (= (and b!187497 res!156157) b!187505))

(assert (= (and b!187505 res!156152) b!187494))

(assert (= (and b!187494 res!156168) b!187506))

(assert (= (and b!187497 (not res!156151)) b!187492))

(assert (= start!40744 b!187496))

(declare-fun m!291505 () Bool)

(assert (=> b!187495 m!291505))

(declare-fun m!291507 () Bool)

(assert (=> b!187508 m!291507))

(declare-fun m!291509 () Bool)

(assert (=> b!187508 m!291509))

(declare-fun m!291511 () Bool)

(assert (=> b!187508 m!291511))

(declare-fun m!291513 () Bool)

(assert (=> b!187508 m!291513))

(declare-fun m!291515 () Bool)

(assert (=> b!187508 m!291515))

(declare-fun m!291517 () Bool)

(assert (=> b!187508 m!291517))

(declare-fun m!291519 () Bool)

(assert (=> b!187508 m!291519))

(declare-fun m!291521 () Bool)

(assert (=> b!187508 m!291521))

(declare-fun m!291523 () Bool)

(assert (=> b!187508 m!291523))

(declare-fun m!291525 () Bool)

(assert (=> b!187508 m!291525))

(declare-fun m!291527 () Bool)

(assert (=> b!187508 m!291527))

(declare-fun m!291529 () Bool)

(assert (=> b!187508 m!291529))

(declare-fun m!291531 () Bool)

(assert (=> b!187508 m!291531))

(declare-fun m!291533 () Bool)

(assert (=> b!187508 m!291533))

(declare-fun m!291535 () Bool)

(assert (=> b!187508 m!291535))

(declare-fun m!291537 () Bool)

(assert (=> b!187508 m!291537))

(declare-fun m!291539 () Bool)

(assert (=> b!187499 m!291539))

(assert (=> b!187499 m!291539))

(declare-fun m!291541 () Bool)

(assert (=> b!187499 m!291541))

(declare-fun m!291543 () Bool)

(assert (=> b!187492 m!291543))

(declare-fun m!291545 () Bool)

(assert (=> start!40744 m!291545))

(declare-fun m!291547 () Bool)

(assert (=> b!187509 m!291547))

(declare-fun m!291549 () Bool)

(assert (=> b!187504 m!291549))

(declare-fun m!291551 () Bool)

(assert (=> b!187504 m!291551))

(declare-fun m!291553 () Bool)

(assert (=> b!187504 m!291553))

(declare-fun m!291555 () Bool)

(assert (=> b!187504 m!291555))

(declare-fun m!291557 () Bool)

(assert (=> b!187510 m!291557))

(declare-fun m!291559 () Bool)

(assert (=> b!187510 m!291559))

(declare-fun m!291561 () Bool)

(assert (=> b!187510 m!291561))

(declare-fun m!291563 () Bool)

(assert (=> b!187507 m!291563))

(declare-fun m!291565 () Bool)

(assert (=> b!187498 m!291565))

(assert (=> b!187490 m!291557))

(assert (=> b!187490 m!291559))

(declare-fun m!291567 () Bool)

(assert (=> b!187505 m!291567))

(declare-fun m!291569 () Bool)

(assert (=> b!187497 m!291569))

(declare-fun m!291571 () Bool)

(assert (=> b!187497 m!291571))

(declare-fun m!291573 () Bool)

(assert (=> b!187497 m!291573))

(declare-fun m!291575 () Bool)

(assert (=> b!187493 m!291575))

(declare-fun m!291577 () Bool)

(assert (=> b!187503 m!291577))

(declare-fun m!291579 () Bool)

(assert (=> b!187491 m!291579))

(declare-fun m!291581 () Bool)

(assert (=> b!187496 m!291581))

(assert (=> b!187502 m!291547))

(declare-fun m!291583 () Bool)

(assert (=> b!187494 m!291583))

(check-sat (not start!40744) (not b!187490) (not b!187510) (not b!187494) (not b!187504) (not b!187507) (not b!187497) (not b!187508) (not b!187493) (not b!187509) (not b!187499) (not b!187505) (not b!187492) (not b!187503) (not b!187498) (not b!187495) (not b!187496) (not b!187502) (not b!187491))
(check-sat)
(get-model)

(declare-fun d!64655 () Bool)

(assert (=> d!64655 (= (invariant!0 (currentBit!9063 (_2!8747 lt!290422)) (currentByte!9068 (_2!8747 lt!290422)) (size!4340 (buf!4808 (_2!8747 lt!290422)))) (and (bvsge (currentBit!9063 (_2!8747 lt!290422)) #b00000000000000000000000000000000) (bvslt (currentBit!9063 (_2!8747 lt!290422)) #b00000000000000000000000000001000) (bvsge (currentByte!9068 (_2!8747 lt!290422)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9068 (_2!8747 lt!290422)) (size!4340 (buf!4808 (_2!8747 lt!290422)))) (and (= (currentBit!9063 (_2!8747 lt!290422)) #b00000000000000000000000000000000) (= (currentByte!9068 (_2!8747 lt!290422)) (size!4340 (buf!4808 (_2!8747 lt!290422))))))))))

(assert (=> b!187503 d!64655))

(declare-fun d!64657 () Bool)

(assert (=> d!64657 (= (invariant!0 (currentBit!9063 (_1!8748 lt!290438)) (currentByte!9068 (_1!8748 lt!290438)) (size!4340 (buf!4808 (_1!8748 lt!290438)))) (and (bvsge (currentBit!9063 (_1!8748 lt!290438)) #b00000000000000000000000000000000) (bvslt (currentBit!9063 (_1!8748 lt!290438)) #b00000000000000000000000000001000) (bvsge (currentByte!9068 (_1!8748 lt!290438)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9068 (_1!8748 lt!290438)) (size!4340 (buf!4808 (_1!8748 lt!290438)))) (and (= (currentBit!9063 (_1!8748 lt!290438)) #b00000000000000000000000000000000) (= (currentByte!9068 (_1!8748 lt!290438)) (size!4340 (buf!4808 (_1!8748 lt!290438))))))))))

(assert (=> b!187492 d!64657))

(declare-fun d!64659 () Bool)

(declare-fun res!156241 () Bool)

(declare-fun e!129689 () Bool)

(assert (=> d!64659 (=> (not res!156241) (not e!129689))))

(assert (=> d!64659 (= res!156241 (= (size!4340 (buf!4808 thiss!1204)) (size!4340 (buf!4808 (_2!8747 lt!290420)))))))

(assert (=> d!64659 (= (isPrefixOf!0 thiss!1204 (_2!8747 lt!290420)) e!129689)))

(declare-fun b!187584 () Bool)

(declare-fun res!156243 () Bool)

(assert (=> b!187584 (=> (not res!156243) (not e!129689))))

(assert (=> b!187584 (= res!156243 (bvsle (bitIndex!0 (size!4340 (buf!4808 thiss!1204)) (currentByte!9068 thiss!1204) (currentBit!9063 thiss!1204)) (bitIndex!0 (size!4340 (buf!4808 (_2!8747 lt!290420))) (currentByte!9068 (_2!8747 lt!290420)) (currentBit!9063 (_2!8747 lt!290420)))))))

(declare-fun b!187585 () Bool)

(declare-fun e!129688 () Bool)

(assert (=> b!187585 (= e!129689 e!129688)))

(declare-fun res!156242 () Bool)

(assert (=> b!187585 (=> res!156242 e!129688)))

(assert (=> b!187585 (= res!156242 (= (size!4340 (buf!4808 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!187586 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9844 array!9844 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!187586 (= e!129688 (arrayBitRangesEq!0 (buf!4808 thiss!1204) (buf!4808 (_2!8747 lt!290420)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4340 (buf!4808 thiss!1204)) (currentByte!9068 thiss!1204) (currentBit!9063 thiss!1204))))))

(assert (= (and d!64659 res!156241) b!187584))

(assert (= (and b!187584 res!156243) b!187585))

(assert (= (and b!187585 (not res!156242)) b!187586))

(assert (=> b!187584 m!291559))

(assert (=> b!187584 m!291557))

(assert (=> b!187586 m!291559))

(assert (=> b!187586 m!291559))

(declare-fun m!291665 () Bool)

(assert (=> b!187586 m!291665))

(assert (=> b!187502 d!64659))

(declare-fun d!64661 () Bool)

(assert (=> d!64661 (= (invariant!0 (currentBit!9063 thiss!1204) (currentByte!9068 thiss!1204) (size!4340 (buf!4808 (_2!8747 lt!290422)))) (and (bvsge (currentBit!9063 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9063 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9068 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9068 thiss!1204) (size!4340 (buf!4808 (_2!8747 lt!290422)))) (and (= (currentBit!9063 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9068 thiss!1204) (size!4340 (buf!4808 (_2!8747 lt!290422))))))))))

(assert (=> b!187491 d!64661))

(declare-fun d!64663 () Bool)

(declare-fun e!129692 () Bool)

(assert (=> d!64663 e!129692))

(declare-fun res!156248 () Bool)

(assert (=> d!64663 (=> (not res!156248) (not e!129692))))

(declare-fun lt!290546 () (_ BitVec 64))

(declare-fun lt!290550 () (_ BitVec 64))

(declare-fun lt!290548 () (_ BitVec 64))

(assert (=> d!64663 (= res!156248 (= lt!290550 (bvsub lt!290548 lt!290546)))))

(assert (=> d!64663 (or (= (bvand lt!290548 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!290546 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!290548 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!290548 lt!290546) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!64663 (= lt!290546 (remainingBits!0 ((_ sign_extend 32) (size!4340 (buf!4808 (_2!8747 lt!290420)))) ((_ sign_extend 32) (currentByte!9068 (_2!8747 lt!290420))) ((_ sign_extend 32) (currentBit!9063 (_2!8747 lt!290420)))))))

(declare-fun lt!290547 () (_ BitVec 64))

(declare-fun lt!290549 () (_ BitVec 64))

(assert (=> d!64663 (= lt!290548 (bvmul lt!290547 lt!290549))))

(assert (=> d!64663 (or (= lt!290547 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!290549 (bvsdiv (bvmul lt!290547 lt!290549) lt!290547)))))

(assert (=> d!64663 (= lt!290549 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64663 (= lt!290547 ((_ sign_extend 32) (size!4340 (buf!4808 (_2!8747 lt!290420)))))))

(assert (=> d!64663 (= lt!290550 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9068 (_2!8747 lt!290420))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9063 (_2!8747 lt!290420)))))))

(assert (=> d!64663 (invariant!0 (currentBit!9063 (_2!8747 lt!290420)) (currentByte!9068 (_2!8747 lt!290420)) (size!4340 (buf!4808 (_2!8747 lt!290420))))))

(assert (=> d!64663 (= (bitIndex!0 (size!4340 (buf!4808 (_2!8747 lt!290420))) (currentByte!9068 (_2!8747 lt!290420)) (currentBit!9063 (_2!8747 lt!290420))) lt!290550)))

(declare-fun b!187591 () Bool)

(declare-fun res!156249 () Bool)

(assert (=> b!187591 (=> (not res!156249) (not e!129692))))

(assert (=> b!187591 (= res!156249 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!290550))))

(declare-fun b!187592 () Bool)

(declare-fun lt!290551 () (_ BitVec 64))

(assert (=> b!187592 (= e!129692 (bvsle lt!290550 (bvmul lt!290551 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!187592 (or (= lt!290551 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!290551 #b0000000000000000000000000000000000000000000000000000000000001000) lt!290551)))))

(assert (=> b!187592 (= lt!290551 ((_ sign_extend 32) (size!4340 (buf!4808 (_2!8747 lt!290420)))))))

(assert (= (and d!64663 res!156248) b!187591))

(assert (= (and b!187591 res!156249) b!187592))

(declare-fun m!291667 () Bool)

(assert (=> d!64663 m!291667))

(declare-fun m!291669 () Bool)

(assert (=> d!64663 m!291669))

(assert (=> b!187490 d!64663))

(declare-fun d!64665 () Bool)

(declare-fun e!129693 () Bool)

(assert (=> d!64665 e!129693))

(declare-fun res!156250 () Bool)

(assert (=> d!64665 (=> (not res!156250) (not e!129693))))

(declare-fun lt!290552 () (_ BitVec 64))

(declare-fun lt!290554 () (_ BitVec 64))

(declare-fun lt!290556 () (_ BitVec 64))

(assert (=> d!64665 (= res!156250 (= lt!290556 (bvsub lt!290554 lt!290552)))))

(assert (=> d!64665 (or (= (bvand lt!290554 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!290552 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!290554 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!290554 lt!290552) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64665 (= lt!290552 (remainingBits!0 ((_ sign_extend 32) (size!4340 (buf!4808 thiss!1204))) ((_ sign_extend 32) (currentByte!9068 thiss!1204)) ((_ sign_extend 32) (currentBit!9063 thiss!1204))))))

(declare-fun lt!290553 () (_ BitVec 64))

(declare-fun lt!290555 () (_ BitVec 64))

(assert (=> d!64665 (= lt!290554 (bvmul lt!290553 lt!290555))))

(assert (=> d!64665 (or (= lt!290553 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!290555 (bvsdiv (bvmul lt!290553 lt!290555) lt!290553)))))

(assert (=> d!64665 (= lt!290555 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64665 (= lt!290553 ((_ sign_extend 32) (size!4340 (buf!4808 thiss!1204))))))

(assert (=> d!64665 (= lt!290556 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9068 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9063 thiss!1204))))))

(assert (=> d!64665 (invariant!0 (currentBit!9063 thiss!1204) (currentByte!9068 thiss!1204) (size!4340 (buf!4808 thiss!1204)))))

(assert (=> d!64665 (= (bitIndex!0 (size!4340 (buf!4808 thiss!1204)) (currentByte!9068 thiss!1204) (currentBit!9063 thiss!1204)) lt!290556)))

(declare-fun b!187593 () Bool)

(declare-fun res!156251 () Bool)

(assert (=> b!187593 (=> (not res!156251) (not e!129693))))

(assert (=> b!187593 (= res!156251 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!290556))))

(declare-fun b!187594 () Bool)

(declare-fun lt!290557 () (_ BitVec 64))

(assert (=> b!187594 (= e!129693 (bvsle lt!290556 (bvmul lt!290557 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!187594 (or (= lt!290557 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!290557 #b0000000000000000000000000000000000000000000000000000000000001000) lt!290557)))))

(assert (=> b!187594 (= lt!290557 ((_ sign_extend 32) (size!4340 (buf!4808 thiss!1204))))))

(assert (= (and d!64665 res!156250) b!187593))

(assert (= (and b!187593 res!156251) b!187594))

(declare-fun m!291671 () Bool)

(assert (=> d!64665 m!291671))

(assert (=> d!64665 m!291505))

(assert (=> b!187490 d!64665))

(assert (=> b!187510 d!64663))

(assert (=> b!187510 d!64665))

(declare-fun b!187606 () Bool)

(declare-fun e!129698 () Bool)

(declare-fun e!129699 () Bool)

(assert (=> b!187606 (= e!129698 e!129699)))

(declare-fun res!156261 () Bool)

(assert (=> b!187606 (=> (not res!156261) (not e!129699))))

(declare-fun lt!290568 () tuple2!16210)

(declare-fun lt!290566 () tuple2!16204)

(assert (=> b!187606 (= res!156261 (and (= (_2!8750 lt!290568) lt!290437) (= (_1!8750 lt!290568) (_2!8747 lt!290566))))))

(assert (=> b!187606 (= lt!290568 (readBitPure!0 (readerFrom!0 (_2!8747 lt!290566) (currentBit!9063 thiss!1204) (currentByte!9068 thiss!1204))))))

(declare-fun b!187604 () Bool)

(declare-fun res!156262 () Bool)

(assert (=> b!187604 (=> (not res!156262) (not e!129698))))

(declare-fun lt!290569 () (_ BitVec 64))

(declare-fun lt!290567 () (_ BitVec 64))

(assert (=> b!187604 (= res!156262 (= (bitIndex!0 (size!4340 (buf!4808 (_2!8747 lt!290566))) (currentByte!9068 (_2!8747 lt!290566)) (currentBit!9063 (_2!8747 lt!290566))) (bvadd lt!290569 lt!290567)))))

(assert (=> b!187604 (or (not (= (bvand lt!290569 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!290567 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!290569 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!290569 lt!290567) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187604 (= lt!290567 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!187604 (= lt!290569 (bitIndex!0 (size!4340 (buf!4808 thiss!1204)) (currentByte!9068 thiss!1204) (currentBit!9063 thiss!1204)))))

(declare-fun d!64667 () Bool)

(assert (=> d!64667 e!129698))

(declare-fun res!156260 () Bool)

(assert (=> d!64667 (=> (not res!156260) (not e!129698))))

(assert (=> d!64667 (= res!156260 (= (size!4340 (buf!4808 thiss!1204)) (size!4340 (buf!4808 (_2!8747 lt!290566)))))))

(declare-fun choose!16 (BitStream!7788 Bool) tuple2!16204)

(assert (=> d!64667 (= lt!290566 (choose!16 thiss!1204 lt!290437))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!64667 (validate_offset_bit!0 ((_ sign_extend 32) (size!4340 (buf!4808 thiss!1204))) ((_ sign_extend 32) (currentByte!9068 thiss!1204)) ((_ sign_extend 32) (currentBit!9063 thiss!1204)))))

(assert (=> d!64667 (= (appendBit!0 thiss!1204 lt!290437) lt!290566)))

(declare-fun b!187607 () Bool)

(assert (=> b!187607 (= e!129699 (= (bitIndex!0 (size!4340 (buf!4808 (_1!8750 lt!290568))) (currentByte!9068 (_1!8750 lt!290568)) (currentBit!9063 (_1!8750 lt!290568))) (bitIndex!0 (size!4340 (buf!4808 (_2!8747 lt!290566))) (currentByte!9068 (_2!8747 lt!290566)) (currentBit!9063 (_2!8747 lt!290566)))))))

(declare-fun b!187605 () Bool)

(declare-fun res!156263 () Bool)

(assert (=> b!187605 (=> (not res!156263) (not e!129698))))

(assert (=> b!187605 (= res!156263 (isPrefixOf!0 thiss!1204 (_2!8747 lt!290566)))))

(assert (= (and d!64667 res!156260) b!187604))

(assert (= (and b!187604 res!156262) b!187605))

(assert (= (and b!187605 res!156263) b!187606))

(assert (= (and b!187606 res!156261) b!187607))

(declare-fun m!291673 () Bool)

(assert (=> b!187605 m!291673))

(declare-fun m!291675 () Bool)

(assert (=> b!187604 m!291675))

(assert (=> b!187604 m!291559))

(declare-fun m!291677 () Bool)

(assert (=> d!64667 m!291677))

(declare-fun m!291679 () Bool)

(assert (=> d!64667 m!291679))

(declare-fun m!291681 () Bool)

(assert (=> b!187606 m!291681))

(assert (=> b!187606 m!291681))

(declare-fun m!291683 () Bool)

(assert (=> b!187606 m!291683))

(declare-fun m!291685 () Bool)

(assert (=> b!187607 m!291685))

(assert (=> b!187607 m!291675))

(assert (=> b!187510 d!64667))

(declare-fun d!64669 () Bool)

(declare-datatypes ((tuple2!16220 0))(
  ( (tuple2!16221 (_1!8755 Bool) (_2!8755 BitStream!7788)) )
))
(declare-fun lt!290572 () tuple2!16220)

(declare-fun readBit!0 (BitStream!7788) tuple2!16220)

(assert (=> d!64669 (= lt!290572 (readBit!0 (readerFrom!0 (_2!8747 lt!290420) (currentBit!9063 thiss!1204) (currentByte!9068 thiss!1204))))))

(assert (=> d!64669 (= (readBitPure!0 (readerFrom!0 (_2!8747 lt!290420) (currentBit!9063 thiss!1204) (currentByte!9068 thiss!1204))) (tuple2!16211 (_2!8755 lt!290572) (_1!8755 lt!290572)))))

(declare-fun bs!16080 () Bool)

(assert (= bs!16080 d!64669))

(assert (=> bs!16080 m!291539))

(declare-fun m!291687 () Bool)

(assert (=> bs!16080 m!291687))

(assert (=> b!187499 d!64669))

(declare-fun d!64671 () Bool)

(declare-fun e!129702 () Bool)

(assert (=> d!64671 e!129702))

(declare-fun res!156267 () Bool)

(assert (=> d!64671 (=> (not res!156267) (not e!129702))))

(assert (=> d!64671 (= res!156267 (invariant!0 (currentBit!9063 (_2!8747 lt!290420)) (currentByte!9068 (_2!8747 lt!290420)) (size!4340 (buf!4808 (_2!8747 lt!290420)))))))

(assert (=> d!64671 (= (readerFrom!0 (_2!8747 lt!290420) (currentBit!9063 thiss!1204) (currentByte!9068 thiss!1204)) (BitStream!7789 (buf!4808 (_2!8747 lt!290420)) (currentByte!9068 thiss!1204) (currentBit!9063 thiss!1204)))))

(declare-fun b!187610 () Bool)

(assert (=> b!187610 (= e!129702 (invariant!0 (currentBit!9063 thiss!1204) (currentByte!9068 thiss!1204) (size!4340 (buf!4808 (_2!8747 lt!290420)))))))

(assert (= (and d!64671 res!156267) b!187610))

(assert (=> d!64671 m!291669))

(assert (=> b!187610 m!291509))

(assert (=> b!187499 d!64671))

(assert (=> b!187509 d!64659))

(declare-fun d!64673 () Bool)

(assert (=> d!64673 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9063 thiss!1204) (currentByte!9068 thiss!1204) (size!4340 (buf!4808 thiss!1204))))))

(declare-fun bs!16081 () Bool)

(assert (= bs!16081 d!64673))

(assert (=> bs!16081 m!291505))

(assert (=> start!40744 d!64673))

(declare-fun d!64675 () Bool)

(declare-fun e!129703 () Bool)

(assert (=> d!64675 e!129703))

(declare-fun res!156268 () Bool)

(assert (=> d!64675 (=> (not res!156268) (not e!129703))))

(declare-fun lt!290575 () (_ BitVec 64))

(declare-fun lt!290577 () (_ BitVec 64))

(declare-fun lt!290573 () (_ BitVec 64))

(assert (=> d!64675 (= res!156268 (= lt!290577 (bvsub lt!290575 lt!290573)))))

(assert (=> d!64675 (or (= (bvand lt!290575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!290573 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!290575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!290575 lt!290573) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64675 (= lt!290573 (remainingBits!0 ((_ sign_extend 32) (size!4340 (buf!4808 (_1!8750 lt!290426)))) ((_ sign_extend 32) (currentByte!9068 (_1!8750 lt!290426))) ((_ sign_extend 32) (currentBit!9063 (_1!8750 lt!290426)))))))

(declare-fun lt!290574 () (_ BitVec 64))

(declare-fun lt!290576 () (_ BitVec 64))

(assert (=> d!64675 (= lt!290575 (bvmul lt!290574 lt!290576))))

(assert (=> d!64675 (or (= lt!290574 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!290576 (bvsdiv (bvmul lt!290574 lt!290576) lt!290574)))))

(assert (=> d!64675 (= lt!290576 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64675 (= lt!290574 ((_ sign_extend 32) (size!4340 (buf!4808 (_1!8750 lt!290426)))))))

(assert (=> d!64675 (= lt!290577 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9068 (_1!8750 lt!290426))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9063 (_1!8750 lt!290426)))))))

(assert (=> d!64675 (invariant!0 (currentBit!9063 (_1!8750 lt!290426)) (currentByte!9068 (_1!8750 lt!290426)) (size!4340 (buf!4808 (_1!8750 lt!290426))))))

(assert (=> d!64675 (= (bitIndex!0 (size!4340 (buf!4808 (_1!8750 lt!290426))) (currentByte!9068 (_1!8750 lt!290426)) (currentBit!9063 (_1!8750 lt!290426))) lt!290577)))

(declare-fun b!187611 () Bool)

(declare-fun res!156269 () Bool)

(assert (=> b!187611 (=> (not res!156269) (not e!129703))))

(assert (=> b!187611 (= res!156269 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!290577))))

(declare-fun b!187612 () Bool)

(declare-fun lt!290578 () (_ BitVec 64))

(assert (=> b!187612 (= e!129703 (bvsle lt!290577 (bvmul lt!290578 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!187612 (or (= lt!290578 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!290578 #b0000000000000000000000000000000000000000000000000000000000001000) lt!290578)))))

(assert (=> b!187612 (= lt!290578 ((_ sign_extend 32) (size!4340 (buf!4808 (_1!8750 lt!290426)))))))

(assert (= (and d!64675 res!156268) b!187611))

(assert (= (and b!187611 res!156269) b!187612))

(declare-fun m!291689 () Bool)

(assert (=> d!64675 m!291689))

(declare-fun m!291691 () Bool)

(assert (=> d!64675 m!291691))

(assert (=> b!187498 d!64675))

(declare-fun d!64677 () Bool)

(declare-fun e!129708 () Bool)

(assert (=> d!64677 e!129708))

(declare-fun res!156278 () Bool)

(assert (=> d!64677 (=> (not res!156278) (not e!129708))))

(declare-fun lt!290623 () tuple2!16208)

(assert (=> d!64677 (= res!156278 (isPrefixOf!0 (_1!8749 lt!290623) (_2!8749 lt!290623)))))

(declare-fun lt!290630 () BitStream!7788)

(assert (=> d!64677 (= lt!290623 (tuple2!16209 lt!290630 (_2!8747 lt!290422)))))

(declare-fun lt!290634 () Unit!13401)

(declare-fun lt!290627 () Unit!13401)

(assert (=> d!64677 (= lt!290634 lt!290627)))

(assert (=> d!64677 (isPrefixOf!0 lt!290630 (_2!8747 lt!290422))))

(assert (=> d!64677 (= lt!290627 (lemmaIsPrefixTransitive!0 lt!290630 (_2!8747 lt!290422) (_2!8747 lt!290422)))))

(declare-fun lt!290622 () Unit!13401)

(declare-fun lt!290624 () Unit!13401)

(assert (=> d!64677 (= lt!290622 lt!290624)))

(assert (=> d!64677 (isPrefixOf!0 lt!290630 (_2!8747 lt!290422))))

(assert (=> d!64677 (= lt!290624 (lemmaIsPrefixTransitive!0 lt!290630 (_2!8747 lt!290420) (_2!8747 lt!290422)))))

(declare-fun lt!290629 () Unit!13401)

(declare-fun e!129709 () Unit!13401)

(assert (=> d!64677 (= lt!290629 e!129709)))

(declare-fun c!9562 () Bool)

(assert (=> d!64677 (= c!9562 (not (= (size!4340 (buf!4808 (_2!8747 lt!290420))) #b00000000000000000000000000000000)))))

(declare-fun lt!290628 () Unit!13401)

(declare-fun lt!290626 () Unit!13401)

(assert (=> d!64677 (= lt!290628 lt!290626)))

(assert (=> d!64677 (isPrefixOf!0 (_2!8747 lt!290422) (_2!8747 lt!290422))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7788) Unit!13401)

(assert (=> d!64677 (= lt!290626 (lemmaIsPrefixRefl!0 (_2!8747 lt!290422)))))

(declare-fun lt!290635 () Unit!13401)

(declare-fun lt!290632 () Unit!13401)

(assert (=> d!64677 (= lt!290635 lt!290632)))

(assert (=> d!64677 (= lt!290632 (lemmaIsPrefixRefl!0 (_2!8747 lt!290422)))))

(declare-fun lt!290619 () Unit!13401)

(declare-fun lt!290625 () Unit!13401)

(assert (=> d!64677 (= lt!290619 lt!290625)))

(assert (=> d!64677 (isPrefixOf!0 lt!290630 lt!290630)))

(assert (=> d!64677 (= lt!290625 (lemmaIsPrefixRefl!0 lt!290630))))

(declare-fun lt!290636 () Unit!13401)

(declare-fun lt!290633 () Unit!13401)

(assert (=> d!64677 (= lt!290636 lt!290633)))

(assert (=> d!64677 (isPrefixOf!0 (_2!8747 lt!290420) (_2!8747 lt!290420))))

(assert (=> d!64677 (= lt!290633 (lemmaIsPrefixRefl!0 (_2!8747 lt!290420)))))

(assert (=> d!64677 (= lt!290630 (BitStream!7789 (buf!4808 (_2!8747 lt!290422)) (currentByte!9068 (_2!8747 lt!290420)) (currentBit!9063 (_2!8747 lt!290420))))))

(assert (=> d!64677 (isPrefixOf!0 (_2!8747 lt!290420) (_2!8747 lt!290422))))

(assert (=> d!64677 (= (reader!0 (_2!8747 lt!290420) (_2!8747 lt!290422)) lt!290623)))

(declare-fun b!187623 () Bool)

(declare-fun res!156276 () Bool)

(assert (=> b!187623 (=> (not res!156276) (not e!129708))))

(assert (=> b!187623 (= res!156276 (isPrefixOf!0 (_2!8749 lt!290623) (_2!8747 lt!290422)))))

(declare-fun b!187624 () Bool)

(declare-fun res!156277 () Bool)

(assert (=> b!187624 (=> (not res!156277) (not e!129708))))

(assert (=> b!187624 (= res!156277 (isPrefixOf!0 (_1!8749 lt!290623) (_2!8747 lt!290420)))))

(declare-fun lt!290621 () (_ BitVec 64))

(declare-fun lt!290620 () (_ BitVec 64))

(declare-fun b!187625 () Bool)

(assert (=> b!187625 (= e!129708 (= (_1!8749 lt!290623) (withMovedBitIndex!0 (_2!8749 lt!290623) (bvsub lt!290620 lt!290621))))))

(assert (=> b!187625 (or (= (bvand lt!290620 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!290621 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!290620 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!290620 lt!290621) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187625 (= lt!290621 (bitIndex!0 (size!4340 (buf!4808 (_2!8747 lt!290422))) (currentByte!9068 (_2!8747 lt!290422)) (currentBit!9063 (_2!8747 lt!290422))))))

(assert (=> b!187625 (= lt!290620 (bitIndex!0 (size!4340 (buf!4808 (_2!8747 lt!290420))) (currentByte!9068 (_2!8747 lt!290420)) (currentBit!9063 (_2!8747 lt!290420))))))

(declare-fun b!187626 () Bool)

(declare-fun Unit!13405 () Unit!13401)

(assert (=> b!187626 (= e!129709 Unit!13405)))

(declare-fun b!187627 () Bool)

(declare-fun lt!290637 () Unit!13401)

(assert (=> b!187627 (= e!129709 lt!290637)))

(declare-fun lt!290638 () (_ BitVec 64))

(assert (=> b!187627 (= lt!290638 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!290631 () (_ BitVec 64))

(assert (=> b!187627 (= lt!290631 (bitIndex!0 (size!4340 (buf!4808 (_2!8747 lt!290420))) (currentByte!9068 (_2!8747 lt!290420)) (currentBit!9063 (_2!8747 lt!290420))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9844 array!9844 (_ BitVec 64) (_ BitVec 64)) Unit!13401)

(assert (=> b!187627 (= lt!290637 (arrayBitRangesEqSymmetric!0 (buf!4808 (_2!8747 lt!290420)) (buf!4808 (_2!8747 lt!290422)) lt!290638 lt!290631))))

(assert (=> b!187627 (arrayBitRangesEq!0 (buf!4808 (_2!8747 lt!290422)) (buf!4808 (_2!8747 lt!290420)) lt!290638 lt!290631)))

(assert (= (and d!64677 c!9562) b!187627))

(assert (= (and d!64677 (not c!9562)) b!187626))

(assert (= (and d!64677 res!156278) b!187624))

(assert (= (and b!187624 res!156277) b!187623))

(assert (= (and b!187623 res!156276) b!187625))

(declare-fun m!291693 () Bool)

(assert (=> b!187623 m!291693))

(assert (=> b!187627 m!291557))

(declare-fun m!291695 () Bool)

(assert (=> b!187627 m!291695))

(declare-fun m!291697 () Bool)

(assert (=> b!187627 m!291697))

(declare-fun m!291699 () Bool)

(assert (=> b!187624 m!291699))

(declare-fun m!291701 () Bool)

(assert (=> b!187625 m!291701))

(assert (=> b!187625 m!291549))

(assert (=> b!187625 m!291557))

(declare-fun m!291703 () Bool)

(assert (=> d!64677 m!291703))

(declare-fun m!291705 () Bool)

(assert (=> d!64677 m!291705))

(declare-fun m!291707 () Bool)

(assert (=> d!64677 m!291707))

(declare-fun m!291709 () Bool)

(assert (=> d!64677 m!291709))

(declare-fun m!291711 () Bool)

(assert (=> d!64677 m!291711))

(declare-fun m!291713 () Bool)

(assert (=> d!64677 m!291713))

(assert (=> d!64677 m!291575))

(declare-fun m!291715 () Bool)

(assert (=> d!64677 m!291715))

(declare-fun m!291717 () Bool)

(assert (=> d!64677 m!291717))

(declare-fun m!291719 () Bool)

(assert (=> d!64677 m!291719))

(declare-fun m!291721 () Bool)

(assert (=> d!64677 m!291721))

(assert (=> b!187508 d!64677))

(declare-fun d!64679 () Bool)

(assert (=> d!64679 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!187508 d!64679))

(declare-fun d!64681 () Bool)

(declare-fun e!129710 () Bool)

(assert (=> d!64681 e!129710))

(declare-fun res!156279 () Bool)

(assert (=> d!64681 (=> (not res!156279) (not e!129710))))

(declare-fun lt!290641 () (_ BitVec 64))

(declare-fun lt!290639 () (_ BitVec 64))

(declare-fun lt!290643 () (_ BitVec 64))

(assert (=> d!64681 (= res!156279 (= lt!290643 (bvsub lt!290641 lt!290639)))))

(assert (=> d!64681 (or (= (bvand lt!290641 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!290639 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!290641 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!290641 lt!290639) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64681 (= lt!290639 (remainingBits!0 ((_ sign_extend 32) (size!4340 (buf!4808 (_1!8750 lt!290425)))) ((_ sign_extend 32) (currentByte!9068 (_1!8750 lt!290425))) ((_ sign_extend 32) (currentBit!9063 (_1!8750 lt!290425)))))))

(declare-fun lt!290640 () (_ BitVec 64))

(declare-fun lt!290642 () (_ BitVec 64))

(assert (=> d!64681 (= lt!290641 (bvmul lt!290640 lt!290642))))

(assert (=> d!64681 (or (= lt!290640 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!290642 (bvsdiv (bvmul lt!290640 lt!290642) lt!290640)))))

(assert (=> d!64681 (= lt!290642 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64681 (= lt!290640 ((_ sign_extend 32) (size!4340 (buf!4808 (_1!8750 lt!290425)))))))

(assert (=> d!64681 (= lt!290643 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9068 (_1!8750 lt!290425))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9063 (_1!8750 lt!290425)))))))

(assert (=> d!64681 (invariant!0 (currentBit!9063 (_1!8750 lt!290425)) (currentByte!9068 (_1!8750 lt!290425)) (size!4340 (buf!4808 (_1!8750 lt!290425))))))

(assert (=> d!64681 (= (bitIndex!0 (size!4340 (buf!4808 (_1!8750 lt!290425))) (currentByte!9068 (_1!8750 lt!290425)) (currentBit!9063 (_1!8750 lt!290425))) lt!290643)))

(declare-fun b!187628 () Bool)

(declare-fun res!156280 () Bool)

(assert (=> b!187628 (=> (not res!156280) (not e!129710))))

(assert (=> b!187628 (= res!156280 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!290643))))

(declare-fun b!187629 () Bool)

(declare-fun lt!290644 () (_ BitVec 64))

(assert (=> b!187629 (= e!129710 (bvsle lt!290643 (bvmul lt!290644 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!187629 (or (= lt!290644 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!290644 #b0000000000000000000000000000000000000000000000000000000000001000) lt!290644)))))

(assert (=> b!187629 (= lt!290644 ((_ sign_extend 32) (size!4340 (buf!4808 (_1!8750 lt!290425)))))))

(assert (= (and d!64681 res!156279) b!187628))

(assert (= (and b!187628 res!156280) b!187629))

(declare-fun m!291723 () Bool)

(assert (=> d!64681 m!291723))

(declare-fun m!291725 () Bool)

(assert (=> d!64681 m!291725))

(assert (=> b!187508 d!64681))

(declare-fun d!64683 () Bool)

(assert (=> d!64683 (validate_offset_bits!1 ((_ sign_extend 32) (size!4340 (buf!4808 (_2!8747 lt!290422)))) ((_ sign_extend 32) (currentByte!9068 (_2!8747 lt!290420))) ((_ sign_extend 32) (currentBit!9063 (_2!8747 lt!290420))) lt!290436)))

(declare-fun lt!290647 () Unit!13401)

(declare-fun choose!9 (BitStream!7788 array!9844 (_ BitVec 64) BitStream!7788) Unit!13401)

(assert (=> d!64683 (= lt!290647 (choose!9 (_2!8747 lt!290420) (buf!4808 (_2!8747 lt!290422)) lt!290436 (BitStream!7789 (buf!4808 (_2!8747 lt!290422)) (currentByte!9068 (_2!8747 lt!290420)) (currentBit!9063 (_2!8747 lt!290420)))))))

(assert (=> d!64683 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8747 lt!290420) (buf!4808 (_2!8747 lt!290422)) lt!290436) lt!290647)))

(declare-fun bs!16082 () Bool)

(assert (= bs!16082 d!64683))

(assert (=> bs!16082 m!291533))

(declare-fun m!291727 () Bool)

(assert (=> bs!16082 m!291727))

(assert (=> b!187508 d!64683))

(declare-fun d!64685 () Bool)

(assert (=> d!64685 (validate_offset_bits!1 ((_ sign_extend 32) (size!4340 (buf!4808 (_2!8747 lt!290422)))) ((_ sign_extend 32) (currentByte!9068 thiss!1204)) ((_ sign_extend 32) (currentBit!9063 thiss!1204)) lt!290432)))

(declare-fun lt!290648 () Unit!13401)

(assert (=> d!64685 (= lt!290648 (choose!9 thiss!1204 (buf!4808 (_2!8747 lt!290422)) lt!290432 (BitStream!7789 (buf!4808 (_2!8747 lt!290422)) (currentByte!9068 thiss!1204) (currentBit!9063 thiss!1204))))))

(assert (=> d!64685 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4808 (_2!8747 lt!290422)) lt!290432) lt!290648)))

(declare-fun bs!16083 () Bool)

(assert (= bs!16083 d!64685))

(assert (=> bs!16083 m!291525))

(declare-fun m!291729 () Bool)

(assert (=> bs!16083 m!291729))

(assert (=> b!187508 d!64685))

(declare-fun d!64687 () Bool)

(assert (=> d!64687 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4340 (buf!4808 (_2!8747 lt!290422)))) ((_ sign_extend 32) (currentByte!9068 thiss!1204)) ((_ sign_extend 32) (currentBit!9063 thiss!1204)) lt!290432) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4340 (buf!4808 (_2!8747 lt!290422)))) ((_ sign_extend 32) (currentByte!9068 thiss!1204)) ((_ sign_extend 32) (currentBit!9063 thiss!1204))) lt!290432))))

(declare-fun bs!16084 () Bool)

(assert (= bs!16084 d!64687))

(declare-fun m!291731 () Bool)

(assert (=> bs!16084 m!291731))

(assert (=> b!187508 d!64687))

(declare-fun d!64689 () Bool)

(declare-fun lt!290649 () tuple2!16220)

(assert (=> d!64689 (= lt!290649 (readBit!0 (BitStream!7789 (buf!4808 (_2!8747 lt!290422)) (currentByte!9068 thiss!1204) (currentBit!9063 thiss!1204))))))

(assert (=> d!64689 (= (readBitPure!0 (BitStream!7789 (buf!4808 (_2!8747 lt!290422)) (currentByte!9068 thiss!1204) (currentBit!9063 thiss!1204))) (tuple2!16211 (_2!8755 lt!290649) (_1!8755 lt!290649)))))

(declare-fun bs!16085 () Bool)

(assert (= bs!16085 d!64689))

(declare-fun m!291733 () Bool)

(assert (=> bs!16085 m!291733))

(assert (=> b!187508 d!64689))

(declare-datatypes ((tuple2!16222 0))(
  ( (tuple2!16223 (_1!8756 (_ BitVec 64)) (_2!8756 BitStream!7788)) )
))
(declare-fun lt!290652 () tuple2!16222)

(declare-fun d!64691 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7788 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16222)

(assert (=> d!64691 (= lt!290652 (readNBitsLSBFirstsLoop!0 (_1!8749 lt!290427) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!290430))))

(assert (=> d!64691 (= (readNBitsLSBFirstsLoopPure!0 (_1!8749 lt!290427) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!290430) (tuple2!16207 (_2!8756 lt!290652) (_1!8756 lt!290652)))))

(declare-fun bs!16086 () Bool)

(assert (= bs!16086 d!64691))

(declare-fun m!291735 () Bool)

(assert (=> bs!16086 m!291735))

(assert (=> b!187508 d!64691))

(declare-fun d!64693 () Bool)

(assert (=> d!64693 (= (invariant!0 (currentBit!9063 thiss!1204) (currentByte!9068 thiss!1204) (size!4340 (buf!4808 (_2!8747 lt!290420)))) (and (bvsge (currentBit!9063 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9063 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9068 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9068 thiss!1204) (size!4340 (buf!4808 (_2!8747 lt!290420)))) (and (= (currentBit!9063 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9068 thiss!1204) (size!4340 (buf!4808 (_2!8747 lt!290420))))))))))

(assert (=> b!187508 d!64693))

(declare-fun d!64695 () Bool)

(declare-fun lt!290653 () tuple2!16220)

(assert (=> d!64695 (= lt!290653 (readBit!0 lt!290428))))

(assert (=> d!64695 (= (readBitPure!0 lt!290428) (tuple2!16211 (_2!8755 lt!290653) (_1!8755 lt!290653)))))

(declare-fun bs!16087 () Bool)

(assert (= bs!16087 d!64695))

(declare-fun m!291737 () Bool)

(assert (=> bs!16087 m!291737))

(assert (=> b!187508 d!64695))

(declare-fun d!64697 () Bool)

(declare-fun e!129711 () Bool)

(assert (=> d!64697 e!129711))

(declare-fun res!156281 () Bool)

(assert (=> d!64697 (=> (not res!156281) (not e!129711))))

(declare-fun lt!290658 () (_ BitVec 64))

(declare-fun lt!290654 () (_ BitVec 64))

(declare-fun lt!290656 () (_ BitVec 64))

(assert (=> d!64697 (= res!156281 (= lt!290658 (bvsub lt!290656 lt!290654)))))

(assert (=> d!64697 (or (= (bvand lt!290656 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!290654 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!290656 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!290656 lt!290654) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64697 (= lt!290654 (remainingBits!0 ((_ sign_extend 32) (size!4340 (buf!4808 (_1!8750 lt!290424)))) ((_ sign_extend 32) (currentByte!9068 (_1!8750 lt!290424))) ((_ sign_extend 32) (currentBit!9063 (_1!8750 lt!290424)))))))

(declare-fun lt!290655 () (_ BitVec 64))

(declare-fun lt!290657 () (_ BitVec 64))

(assert (=> d!64697 (= lt!290656 (bvmul lt!290655 lt!290657))))

(assert (=> d!64697 (or (= lt!290655 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!290657 (bvsdiv (bvmul lt!290655 lt!290657) lt!290655)))))

(assert (=> d!64697 (= lt!290657 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64697 (= lt!290655 ((_ sign_extend 32) (size!4340 (buf!4808 (_1!8750 lt!290424)))))))

(assert (=> d!64697 (= lt!290658 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9068 (_1!8750 lt!290424))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9063 (_1!8750 lt!290424)))))))

(assert (=> d!64697 (invariant!0 (currentBit!9063 (_1!8750 lt!290424)) (currentByte!9068 (_1!8750 lt!290424)) (size!4340 (buf!4808 (_1!8750 lt!290424))))))

(assert (=> d!64697 (= (bitIndex!0 (size!4340 (buf!4808 (_1!8750 lt!290424))) (currentByte!9068 (_1!8750 lt!290424)) (currentBit!9063 (_1!8750 lt!290424))) lt!290658)))

(declare-fun b!187630 () Bool)

(declare-fun res!156282 () Bool)

(assert (=> b!187630 (=> (not res!156282) (not e!129711))))

(assert (=> b!187630 (= res!156282 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!290658))))

(declare-fun b!187631 () Bool)

(declare-fun lt!290659 () (_ BitVec 64))

(assert (=> b!187631 (= e!129711 (bvsle lt!290658 (bvmul lt!290659 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!187631 (or (= lt!290659 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!290659 #b0000000000000000000000000000000000000000000000000000000000001000) lt!290659)))))

(assert (=> b!187631 (= lt!290659 ((_ sign_extend 32) (size!4340 (buf!4808 (_1!8750 lt!290424)))))))

(assert (= (and d!64697 res!156281) b!187630))

(assert (= (and b!187630 res!156282) b!187631))

(declare-fun m!291739 () Bool)

(assert (=> d!64697 m!291739))

(declare-fun m!291741 () Bool)

(assert (=> d!64697 m!291741))

(assert (=> b!187508 d!64697))

(declare-fun d!64699 () Bool)

(declare-fun lt!290660 () tuple2!16220)

(assert (=> d!64699 (= lt!290660 (readBit!0 (_1!8749 lt!290429)))))

(assert (=> d!64699 (= (readBitPure!0 (_1!8749 lt!290429)) (tuple2!16211 (_2!8755 lt!290660) (_1!8755 lt!290660)))))

(declare-fun bs!16088 () Bool)

(assert (= bs!16088 d!64699))

(declare-fun m!291743 () Bool)

(assert (=> bs!16088 m!291743))

(assert (=> b!187508 d!64699))

(declare-fun d!64701 () Bool)

(declare-fun e!129714 () Bool)

(assert (=> d!64701 e!129714))

(declare-fun res!156285 () Bool)

(assert (=> d!64701 (=> (not res!156285) (not e!129714))))

(declare-fun lt!290670 () tuple2!16210)

(declare-fun lt!290672 () tuple2!16210)

(assert (=> d!64701 (= res!156285 (= (bitIndex!0 (size!4340 (buf!4808 (_1!8750 lt!290670))) (currentByte!9068 (_1!8750 lt!290670)) (currentBit!9063 (_1!8750 lt!290670))) (bitIndex!0 (size!4340 (buf!4808 (_1!8750 lt!290672))) (currentByte!9068 (_1!8750 lt!290672)) (currentBit!9063 (_1!8750 lt!290672)))))))

(declare-fun lt!290671 () Unit!13401)

(declare-fun lt!290669 () BitStream!7788)

(declare-fun choose!50 (BitStream!7788 BitStream!7788 BitStream!7788 tuple2!16210 tuple2!16210 BitStream!7788 Bool tuple2!16210 tuple2!16210 BitStream!7788 Bool) Unit!13401)

(assert (=> d!64701 (= lt!290671 (choose!50 lt!290428 (_2!8747 lt!290422) lt!290669 lt!290670 (tuple2!16211 (_1!8750 lt!290670) (_2!8750 lt!290670)) (_1!8750 lt!290670) (_2!8750 lt!290670) lt!290672 (tuple2!16211 (_1!8750 lt!290672) (_2!8750 lt!290672)) (_1!8750 lt!290672) (_2!8750 lt!290672)))))

(assert (=> d!64701 (= lt!290672 (readBitPure!0 lt!290669))))

(assert (=> d!64701 (= lt!290670 (readBitPure!0 lt!290428))))

(assert (=> d!64701 (= lt!290669 (BitStream!7789 (buf!4808 (_2!8747 lt!290422)) (currentByte!9068 lt!290428) (currentBit!9063 lt!290428)))))

(assert (=> d!64701 (invariant!0 (currentBit!9063 lt!290428) (currentByte!9068 lt!290428) (size!4340 (buf!4808 (_2!8747 lt!290422))))))

(assert (=> d!64701 (= (readBitPrefixLemma!0 lt!290428 (_2!8747 lt!290422)) lt!290671)))

(declare-fun b!187634 () Bool)

(assert (=> b!187634 (= e!129714 (= (_2!8750 lt!290670) (_2!8750 lt!290672)))))

(assert (= (and d!64701 res!156285) b!187634))

(declare-fun m!291745 () Bool)

(assert (=> d!64701 m!291745))

(declare-fun m!291747 () Bool)

(assert (=> d!64701 m!291747))

(declare-fun m!291749 () Bool)

(assert (=> d!64701 m!291749))

(declare-fun m!291751 () Bool)

(assert (=> d!64701 m!291751))

(assert (=> d!64701 m!291531))

(declare-fun m!291753 () Bool)

(assert (=> d!64701 m!291753))

(assert (=> b!187508 d!64701))

(declare-fun lt!290673 () tuple2!16222)

(declare-fun d!64703 () Bool)

(assert (=> d!64703 (= lt!290673 (readNBitsLSBFirstsLoop!0 (_1!8749 lt!290429) nBits!348 i!590 lt!290421))))

(assert (=> d!64703 (= (readNBitsLSBFirstsLoopPure!0 (_1!8749 lt!290429) nBits!348 i!590 lt!290421) (tuple2!16207 (_2!8756 lt!290673) (_1!8756 lt!290673)))))

(declare-fun bs!16089 () Bool)

(assert (= bs!16089 d!64703))

(declare-fun m!291755 () Bool)

(assert (=> bs!16089 m!291755))

(assert (=> b!187508 d!64703))

(declare-fun d!64705 () Bool)

(assert (=> d!64705 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4340 (buf!4808 (_2!8747 lt!290422)))) ((_ sign_extend 32) (currentByte!9068 (_2!8747 lt!290420))) ((_ sign_extend 32) (currentBit!9063 (_2!8747 lt!290420))) lt!290436) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4340 (buf!4808 (_2!8747 lt!290422)))) ((_ sign_extend 32) (currentByte!9068 (_2!8747 lt!290420))) ((_ sign_extend 32) (currentBit!9063 (_2!8747 lt!290420)))) lt!290436))))

(declare-fun bs!16090 () Bool)

(assert (= bs!16090 d!64705))

(declare-fun m!291757 () Bool)

(assert (=> bs!16090 m!291757))

(assert (=> b!187508 d!64705))

(declare-fun d!64707 () Bool)

(declare-fun e!129715 () Bool)

(assert (=> d!64707 e!129715))

(declare-fun res!156288 () Bool)

(assert (=> d!64707 (=> (not res!156288) (not e!129715))))

(declare-fun lt!290678 () tuple2!16208)

(assert (=> d!64707 (= res!156288 (isPrefixOf!0 (_1!8749 lt!290678) (_2!8749 lt!290678)))))

(declare-fun lt!290685 () BitStream!7788)

(assert (=> d!64707 (= lt!290678 (tuple2!16209 lt!290685 (_2!8747 lt!290422)))))

(declare-fun lt!290689 () Unit!13401)

(declare-fun lt!290682 () Unit!13401)

(assert (=> d!64707 (= lt!290689 lt!290682)))

(assert (=> d!64707 (isPrefixOf!0 lt!290685 (_2!8747 lt!290422))))

(assert (=> d!64707 (= lt!290682 (lemmaIsPrefixTransitive!0 lt!290685 (_2!8747 lt!290422) (_2!8747 lt!290422)))))

(declare-fun lt!290677 () Unit!13401)

(declare-fun lt!290679 () Unit!13401)

(assert (=> d!64707 (= lt!290677 lt!290679)))

(assert (=> d!64707 (isPrefixOf!0 lt!290685 (_2!8747 lt!290422))))

(assert (=> d!64707 (= lt!290679 (lemmaIsPrefixTransitive!0 lt!290685 thiss!1204 (_2!8747 lt!290422)))))

(declare-fun lt!290684 () Unit!13401)

(declare-fun e!129716 () Unit!13401)

(assert (=> d!64707 (= lt!290684 e!129716)))

(declare-fun c!9563 () Bool)

(assert (=> d!64707 (= c!9563 (not (= (size!4340 (buf!4808 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!290683 () Unit!13401)

(declare-fun lt!290681 () Unit!13401)

(assert (=> d!64707 (= lt!290683 lt!290681)))

(assert (=> d!64707 (isPrefixOf!0 (_2!8747 lt!290422) (_2!8747 lt!290422))))

(assert (=> d!64707 (= lt!290681 (lemmaIsPrefixRefl!0 (_2!8747 lt!290422)))))

(declare-fun lt!290690 () Unit!13401)

(declare-fun lt!290687 () Unit!13401)

(assert (=> d!64707 (= lt!290690 lt!290687)))

(assert (=> d!64707 (= lt!290687 (lemmaIsPrefixRefl!0 (_2!8747 lt!290422)))))

(declare-fun lt!290674 () Unit!13401)

(declare-fun lt!290680 () Unit!13401)

(assert (=> d!64707 (= lt!290674 lt!290680)))

(assert (=> d!64707 (isPrefixOf!0 lt!290685 lt!290685)))

(assert (=> d!64707 (= lt!290680 (lemmaIsPrefixRefl!0 lt!290685))))

(declare-fun lt!290691 () Unit!13401)

(declare-fun lt!290688 () Unit!13401)

(assert (=> d!64707 (= lt!290691 lt!290688)))

(assert (=> d!64707 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!64707 (= lt!290688 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!64707 (= lt!290685 (BitStream!7789 (buf!4808 (_2!8747 lt!290422)) (currentByte!9068 thiss!1204) (currentBit!9063 thiss!1204)))))

(assert (=> d!64707 (isPrefixOf!0 thiss!1204 (_2!8747 lt!290422))))

(assert (=> d!64707 (= (reader!0 thiss!1204 (_2!8747 lt!290422)) lt!290678)))

(declare-fun b!187635 () Bool)

(declare-fun res!156286 () Bool)

(assert (=> b!187635 (=> (not res!156286) (not e!129715))))

(assert (=> b!187635 (= res!156286 (isPrefixOf!0 (_2!8749 lt!290678) (_2!8747 lt!290422)))))

(declare-fun b!187636 () Bool)

(declare-fun res!156287 () Bool)

(assert (=> b!187636 (=> (not res!156287) (not e!129715))))

(assert (=> b!187636 (= res!156287 (isPrefixOf!0 (_1!8749 lt!290678) thiss!1204))))

(declare-fun lt!290675 () (_ BitVec 64))

(declare-fun lt!290676 () (_ BitVec 64))

(declare-fun b!187637 () Bool)

(assert (=> b!187637 (= e!129715 (= (_1!8749 lt!290678) (withMovedBitIndex!0 (_2!8749 lt!290678) (bvsub lt!290675 lt!290676))))))

(assert (=> b!187637 (or (= (bvand lt!290675 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!290676 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!290675 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!290675 lt!290676) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187637 (= lt!290676 (bitIndex!0 (size!4340 (buf!4808 (_2!8747 lt!290422))) (currentByte!9068 (_2!8747 lt!290422)) (currentBit!9063 (_2!8747 lt!290422))))))

(assert (=> b!187637 (= lt!290675 (bitIndex!0 (size!4340 (buf!4808 thiss!1204)) (currentByte!9068 thiss!1204) (currentBit!9063 thiss!1204)))))

(declare-fun b!187638 () Bool)

(declare-fun Unit!13406 () Unit!13401)

(assert (=> b!187638 (= e!129716 Unit!13406)))

(declare-fun b!187639 () Bool)

(declare-fun lt!290692 () Unit!13401)

(assert (=> b!187639 (= e!129716 lt!290692)))

(declare-fun lt!290693 () (_ BitVec 64))

(assert (=> b!187639 (= lt!290693 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!290686 () (_ BitVec 64))

(assert (=> b!187639 (= lt!290686 (bitIndex!0 (size!4340 (buf!4808 thiss!1204)) (currentByte!9068 thiss!1204) (currentBit!9063 thiss!1204)))))

(assert (=> b!187639 (= lt!290692 (arrayBitRangesEqSymmetric!0 (buf!4808 thiss!1204) (buf!4808 (_2!8747 lt!290422)) lt!290693 lt!290686))))

(assert (=> b!187639 (arrayBitRangesEq!0 (buf!4808 (_2!8747 lt!290422)) (buf!4808 thiss!1204) lt!290693 lt!290686)))

(assert (= (and d!64707 c!9563) b!187639))

(assert (= (and d!64707 (not c!9563)) b!187638))

(assert (= (and d!64707 res!156288) b!187636))

(assert (= (and b!187636 res!156287) b!187635))

(assert (= (and b!187635 res!156286) b!187637))

(declare-fun m!291759 () Bool)

(assert (=> b!187635 m!291759))

(assert (=> b!187639 m!291559))

(declare-fun m!291761 () Bool)

(assert (=> b!187639 m!291761))

(declare-fun m!291763 () Bool)

(assert (=> b!187639 m!291763))

(declare-fun m!291765 () Bool)

(assert (=> b!187636 m!291765))

(declare-fun m!291767 () Bool)

(assert (=> b!187637 m!291767))

(assert (=> b!187637 m!291549))

(assert (=> b!187637 m!291559))

(assert (=> d!64707 m!291703))

(declare-fun m!291769 () Bool)

(assert (=> d!64707 m!291769))

(declare-fun m!291771 () Bool)

(assert (=> d!64707 m!291771))

(declare-fun m!291773 () Bool)

(assert (=> d!64707 m!291773))

(declare-fun m!291775 () Bool)

(assert (=> d!64707 m!291775))

(declare-fun m!291777 () Bool)

(assert (=> d!64707 m!291777))

(assert (=> d!64707 m!291551))

(assert (=> d!64707 m!291715))

(declare-fun m!291779 () Bool)

(assert (=> d!64707 m!291779))

(declare-fun m!291781 () Bool)

(assert (=> d!64707 m!291781))

(declare-fun m!291783 () Bool)

(assert (=> d!64707 m!291783))

(assert (=> b!187508 d!64707))

(declare-fun d!64709 () Bool)

(declare-fun lt!290711 () tuple2!16206)

(declare-fun lt!290707 () tuple2!16206)

(assert (=> d!64709 (and (= (_2!8748 lt!290711) (_2!8748 lt!290707)) (= (_1!8748 lt!290711) (_1!8748 lt!290707)))))

(declare-fun lt!290709 () Bool)

(declare-fun lt!290710 () BitStream!7788)

(declare-fun lt!290708 () (_ BitVec 64))

(declare-fun lt!290706 () Unit!13401)

(declare-fun choose!56 (BitStream!7788 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!16206 tuple2!16206 BitStream!7788 (_ BitVec 64) Bool BitStream!7788 (_ BitVec 64) tuple2!16206 tuple2!16206 BitStream!7788 (_ BitVec 64)) Unit!13401)

(assert (=> d!64709 (= lt!290706 (choose!56 (_1!8749 lt!290429) nBits!348 i!590 lt!290421 lt!290711 (tuple2!16207 (_1!8748 lt!290711) (_2!8748 lt!290711)) (_1!8748 lt!290711) (_2!8748 lt!290711) lt!290709 lt!290710 lt!290708 lt!290707 (tuple2!16207 (_1!8748 lt!290707) (_2!8748 lt!290707)) (_1!8748 lt!290707) (_2!8748 lt!290707)))))

(assert (=> d!64709 (= lt!290707 (readNBitsLSBFirstsLoopPure!0 lt!290710 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!290708))))

(assert (=> d!64709 (= lt!290708 (bvor lt!290421 (ite lt!290709 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64709 (= lt!290710 (withMovedBitIndex!0 (_1!8749 lt!290429) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!64709 (= lt!290709 (_2!8750 (readBitPure!0 (_1!8749 lt!290429))))))

(assert (=> d!64709 (= lt!290711 (readNBitsLSBFirstsLoopPure!0 (_1!8749 lt!290429) nBits!348 i!590 lt!290421))))

(assert (=> d!64709 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8749 lt!290429) nBits!348 i!590 lt!290421) lt!290706)))

(declare-fun bs!16092 () Bool)

(assert (= bs!16092 d!64709))

(assert (=> bs!16092 m!291537))

(assert (=> bs!16092 m!291573))

(declare-fun m!291785 () Bool)

(assert (=> bs!16092 m!291785))

(declare-fun m!291787 () Bool)

(assert (=> bs!16092 m!291787))

(assert (=> bs!16092 m!291513))

(assert (=> b!187497 d!64709))

(declare-fun d!64711 () Bool)

(declare-fun lt!290712 () tuple2!16222)

(assert (=> d!64711 (= lt!290712 (readNBitsLSBFirstsLoop!0 lt!290445 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!290430))))

(assert (=> d!64711 (= (readNBitsLSBFirstsLoopPure!0 lt!290445 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!290430) (tuple2!16207 (_2!8756 lt!290712) (_1!8756 lt!290712)))))

(declare-fun bs!16093 () Bool)

(assert (= bs!16093 d!64711))

(declare-fun m!291789 () Bool)

(assert (=> bs!16093 m!291789))

(assert (=> b!187497 d!64711))

(declare-fun d!64713 () Bool)

(declare-fun e!129719 () Bool)

(assert (=> d!64713 e!129719))

(declare-fun res!156291 () Bool)

(assert (=> d!64713 (=> (not res!156291) (not e!129719))))

(declare-fun lt!290718 () (_ BitVec 64))

(declare-fun lt!290717 () BitStream!7788)

(assert (=> d!64713 (= res!156291 (= (bvadd lt!290718 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4340 (buf!4808 lt!290717)) (currentByte!9068 lt!290717) (currentBit!9063 lt!290717))))))

(assert (=> d!64713 (or (not (= (bvand lt!290718 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!290718 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!290718 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64713 (= lt!290718 (bitIndex!0 (size!4340 (buf!4808 (_1!8749 lt!290429))) (currentByte!9068 (_1!8749 lt!290429)) (currentBit!9063 (_1!8749 lt!290429))))))

(declare-fun moveBitIndex!0 (BitStream!7788 (_ BitVec 64)) tuple2!16204)

(assert (=> d!64713 (= lt!290717 (_2!8747 (moveBitIndex!0 (_1!8749 lt!290429) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7788 (_ BitVec 64)) Bool)

(assert (=> d!64713 (moveBitIndexPrecond!0 (_1!8749 lt!290429) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!64713 (= (withMovedBitIndex!0 (_1!8749 lt!290429) #b0000000000000000000000000000000000000000000000000000000000000001) lt!290717)))

(declare-fun b!187642 () Bool)

(assert (=> b!187642 (= e!129719 (= (size!4340 (buf!4808 (_1!8749 lt!290429))) (size!4340 (buf!4808 lt!290717))))))

(assert (= (and d!64713 res!156291) b!187642))

(declare-fun m!291791 () Bool)

(assert (=> d!64713 m!291791))

(declare-fun m!291793 () Bool)

(assert (=> d!64713 m!291793))

(declare-fun m!291795 () Bool)

(assert (=> d!64713 m!291795))

(declare-fun m!291797 () Bool)

(assert (=> d!64713 m!291797))

(assert (=> b!187497 d!64713))

(declare-fun d!64715 () Bool)

(assert (=> d!64715 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4340 (buf!4808 thiss!1204))) ((_ sign_extend 32) (currentByte!9068 thiss!1204)) ((_ sign_extend 32) (currentBit!9063 thiss!1204)) lt!290432) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4340 (buf!4808 thiss!1204))) ((_ sign_extend 32) (currentByte!9068 thiss!1204)) ((_ sign_extend 32) (currentBit!9063 thiss!1204))) lt!290432))))

(declare-fun bs!16094 () Bool)

(assert (= bs!16094 d!64715))

(assert (=> bs!16094 m!291671))

(assert (=> b!187507 d!64715))

(declare-fun d!64717 () Bool)

(assert (=> d!64717 (= (array_inv!4081 (buf!4808 thiss!1204)) (bvsge (size!4340 (buf!4808 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!187496 d!64717))

(declare-fun d!64719 () Bool)

(assert (=> d!64719 (= (invariant!0 (currentBit!9063 thiss!1204) (currentByte!9068 thiss!1204) (size!4340 (buf!4808 thiss!1204))) (and (bvsge (currentBit!9063 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9063 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9068 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9068 thiss!1204) (size!4340 (buf!4808 thiss!1204))) (and (= (currentBit!9063 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9068 thiss!1204) (size!4340 (buf!4808 thiss!1204)))))))))

(assert (=> b!187495 d!64719))

(declare-fun d!64721 () Bool)

(declare-fun e!129720 () Bool)

(assert (=> d!64721 e!129720))

(declare-fun res!156292 () Bool)

(assert (=> d!64721 (=> (not res!156292) (not e!129720))))

(declare-fun lt!290720 () (_ BitVec 64))

(declare-fun lt!290719 () BitStream!7788)

(assert (=> d!64721 (= res!156292 (= (bvadd lt!290720 (bvsub lt!290431 lt!290442)) (bitIndex!0 (size!4340 (buf!4808 lt!290719)) (currentByte!9068 lt!290719) (currentBit!9063 lt!290719))))))

(assert (=> d!64721 (or (not (= (bvand lt!290720 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!290431 lt!290442) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!290720 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!290720 (bvsub lt!290431 lt!290442)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64721 (= lt!290720 (bitIndex!0 (size!4340 (buf!4808 (_2!8749 lt!290429))) (currentByte!9068 (_2!8749 lt!290429)) (currentBit!9063 (_2!8749 lt!290429))))))

(assert (=> d!64721 (= lt!290719 (_2!8747 (moveBitIndex!0 (_2!8749 lt!290429) (bvsub lt!290431 lt!290442))))))

(assert (=> d!64721 (moveBitIndexPrecond!0 (_2!8749 lt!290429) (bvsub lt!290431 lt!290442))))

(assert (=> d!64721 (= (withMovedBitIndex!0 (_2!8749 lt!290429) (bvsub lt!290431 lt!290442)) lt!290719)))

(declare-fun b!187643 () Bool)

(assert (=> b!187643 (= e!129720 (= (size!4340 (buf!4808 (_2!8749 lt!290429))) (size!4340 (buf!4808 lt!290719))))))

(assert (= (and d!64721 res!156292) b!187643))

(declare-fun m!291799 () Bool)

(assert (=> d!64721 m!291799))

(declare-fun m!291801 () Bool)

(assert (=> d!64721 m!291801))

(declare-fun m!291803 () Bool)

(assert (=> d!64721 m!291803))

(declare-fun m!291805 () Bool)

(assert (=> d!64721 m!291805))

(assert (=> b!187505 d!64721))

(declare-fun d!64723 () Bool)

(declare-fun e!129721 () Bool)

(assert (=> d!64723 e!129721))

(declare-fun res!156293 () Bool)

(assert (=> d!64723 (=> (not res!156293) (not e!129721))))

(declare-fun lt!290722 () (_ BitVec 64))

(declare-fun lt!290721 () BitStream!7788)

(assert (=> d!64723 (= res!156293 (= (bvadd lt!290722 (bvsub lt!290441 lt!290442)) (bitIndex!0 (size!4340 (buf!4808 lt!290721)) (currentByte!9068 lt!290721) (currentBit!9063 lt!290721))))))

(assert (=> d!64723 (or (not (= (bvand lt!290722 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!290441 lt!290442) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!290722 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!290722 (bvsub lt!290441 lt!290442)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64723 (= lt!290722 (bitIndex!0 (size!4340 (buf!4808 (_2!8749 lt!290427))) (currentByte!9068 (_2!8749 lt!290427)) (currentBit!9063 (_2!8749 lt!290427))))))

(assert (=> d!64723 (= lt!290721 (_2!8747 (moveBitIndex!0 (_2!8749 lt!290427) (bvsub lt!290441 lt!290442))))))

(assert (=> d!64723 (moveBitIndexPrecond!0 (_2!8749 lt!290427) (bvsub lt!290441 lt!290442))))

(assert (=> d!64723 (= (withMovedBitIndex!0 (_2!8749 lt!290427) (bvsub lt!290441 lt!290442)) lt!290721)))

(declare-fun b!187644 () Bool)

(assert (=> b!187644 (= e!129721 (= (size!4340 (buf!4808 (_2!8749 lt!290427))) (size!4340 (buf!4808 lt!290721))))))

(assert (= (and d!64723 res!156293) b!187644))

(declare-fun m!291807 () Bool)

(assert (=> d!64723 m!291807))

(declare-fun m!291809 () Bool)

(assert (=> d!64723 m!291809))

(declare-fun m!291811 () Bool)

(assert (=> d!64723 m!291811))

(declare-fun m!291813 () Bool)

(assert (=> d!64723 m!291813))

(assert (=> b!187494 d!64723))

(declare-fun d!64725 () Bool)

(declare-fun e!129722 () Bool)

(assert (=> d!64725 e!129722))

(declare-fun res!156294 () Bool)

(assert (=> d!64725 (=> (not res!156294) (not e!129722))))

(declare-fun lt!290727 () (_ BitVec 64))

(declare-fun lt!290725 () (_ BitVec 64))

(declare-fun lt!290723 () (_ BitVec 64))

(assert (=> d!64725 (= res!156294 (= lt!290727 (bvsub lt!290725 lt!290723)))))

(assert (=> d!64725 (or (= (bvand lt!290725 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!290723 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!290725 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!290725 lt!290723) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64725 (= lt!290723 (remainingBits!0 ((_ sign_extend 32) (size!4340 (buf!4808 (_2!8747 lt!290422)))) ((_ sign_extend 32) (currentByte!9068 (_2!8747 lt!290422))) ((_ sign_extend 32) (currentBit!9063 (_2!8747 lt!290422)))))))

(declare-fun lt!290724 () (_ BitVec 64))

(declare-fun lt!290726 () (_ BitVec 64))

(assert (=> d!64725 (= lt!290725 (bvmul lt!290724 lt!290726))))

(assert (=> d!64725 (or (= lt!290724 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!290726 (bvsdiv (bvmul lt!290724 lt!290726) lt!290724)))))

(assert (=> d!64725 (= lt!290726 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64725 (= lt!290724 ((_ sign_extend 32) (size!4340 (buf!4808 (_2!8747 lt!290422)))))))

(assert (=> d!64725 (= lt!290727 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9068 (_2!8747 lt!290422))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9063 (_2!8747 lt!290422)))))))

(assert (=> d!64725 (invariant!0 (currentBit!9063 (_2!8747 lt!290422)) (currentByte!9068 (_2!8747 lt!290422)) (size!4340 (buf!4808 (_2!8747 lt!290422))))))

(assert (=> d!64725 (= (bitIndex!0 (size!4340 (buf!4808 (_2!8747 lt!290422))) (currentByte!9068 (_2!8747 lt!290422)) (currentBit!9063 (_2!8747 lt!290422))) lt!290727)))

(declare-fun b!187645 () Bool)

(declare-fun res!156295 () Bool)

(assert (=> b!187645 (=> (not res!156295) (not e!129722))))

(assert (=> b!187645 (= res!156295 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!290727))))

(declare-fun b!187646 () Bool)

(declare-fun lt!290728 () (_ BitVec 64))

(assert (=> b!187646 (= e!129722 (bvsle lt!290727 (bvmul lt!290728 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!187646 (or (= lt!290728 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!290728 #b0000000000000000000000000000000000000000000000000000000000001000) lt!290728)))))

(assert (=> b!187646 (= lt!290728 ((_ sign_extend 32) (size!4340 (buf!4808 (_2!8747 lt!290422)))))))

(assert (= (and d!64725 res!156294) b!187645))

(assert (= (and b!187645 res!156295) b!187646))

(declare-fun m!291815 () Bool)

(assert (=> d!64725 m!291815))

(assert (=> d!64725 m!291577))

(assert (=> b!187504 d!64725))

(declare-fun d!64727 () Bool)

(declare-fun res!156296 () Bool)

(declare-fun e!129724 () Bool)

(assert (=> d!64727 (=> (not res!156296) (not e!129724))))

(assert (=> d!64727 (= res!156296 (= (size!4340 (buf!4808 thiss!1204)) (size!4340 (buf!4808 (_2!8747 lt!290422)))))))

(assert (=> d!64727 (= (isPrefixOf!0 thiss!1204 (_2!8747 lt!290422)) e!129724)))

(declare-fun b!187647 () Bool)

(declare-fun res!156298 () Bool)

(assert (=> b!187647 (=> (not res!156298) (not e!129724))))

(assert (=> b!187647 (= res!156298 (bvsle (bitIndex!0 (size!4340 (buf!4808 thiss!1204)) (currentByte!9068 thiss!1204) (currentBit!9063 thiss!1204)) (bitIndex!0 (size!4340 (buf!4808 (_2!8747 lt!290422))) (currentByte!9068 (_2!8747 lt!290422)) (currentBit!9063 (_2!8747 lt!290422)))))))

(declare-fun b!187648 () Bool)

(declare-fun e!129723 () Bool)

(assert (=> b!187648 (= e!129724 e!129723)))

(declare-fun res!156297 () Bool)

(assert (=> b!187648 (=> res!156297 e!129723)))

(assert (=> b!187648 (= res!156297 (= (size!4340 (buf!4808 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!187649 () Bool)

(assert (=> b!187649 (= e!129723 (arrayBitRangesEq!0 (buf!4808 thiss!1204) (buf!4808 (_2!8747 lt!290422)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4340 (buf!4808 thiss!1204)) (currentByte!9068 thiss!1204) (currentBit!9063 thiss!1204))))))

(assert (= (and d!64727 res!156296) b!187647))

(assert (= (and b!187647 res!156298) b!187648))

(assert (= (and b!187648 (not res!156297)) b!187649))

(assert (=> b!187647 m!291559))

(assert (=> b!187647 m!291549))

(assert (=> b!187649 m!291559))

(assert (=> b!187649 m!291559))

(declare-fun m!291817 () Bool)

(assert (=> b!187649 m!291817))

(assert (=> b!187504 d!64727))

(declare-fun d!64729 () Bool)

(assert (=> d!64729 (isPrefixOf!0 thiss!1204 (_2!8747 lt!290422))))

(declare-fun lt!290731 () Unit!13401)

(declare-fun choose!30 (BitStream!7788 BitStream!7788 BitStream!7788) Unit!13401)

(assert (=> d!64729 (= lt!290731 (choose!30 thiss!1204 (_2!8747 lt!290420) (_2!8747 lt!290422)))))

(assert (=> d!64729 (isPrefixOf!0 thiss!1204 (_2!8747 lt!290420))))

(assert (=> d!64729 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8747 lt!290420) (_2!8747 lt!290422)) lt!290731)))

(declare-fun bs!16095 () Bool)

(assert (= bs!16095 d!64729))

(assert (=> bs!16095 m!291551))

(declare-fun m!291819 () Bool)

(assert (=> bs!16095 m!291819))

(assert (=> bs!16095 m!291547))

(assert (=> b!187504 d!64729))

(declare-fun b!187778 () Bool)

(declare-fun e!129807 () Bool)

(declare-fun e!129808 () Bool)

(assert (=> b!187778 (= e!129807 e!129808)))

(declare-fun res!156415 () Bool)

(assert (=> b!187778 (=> (not res!156415) (not e!129808))))

(declare-fun lt!291097 () tuple2!16206)

(assert (=> b!187778 (= res!156415 (= (_2!8748 lt!291097) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!291105 () tuple2!16208)

(assert (=> b!187778 (= lt!291097 (readNBitsLSBFirstsLoopPure!0 (_1!8749 lt!291105) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!291092 () Unit!13401)

(declare-fun lt!291084 () Unit!13401)

(assert (=> b!187778 (= lt!291092 lt!291084)))

(declare-fun lt!291120 () tuple2!16204)

(declare-fun lt!291093 () (_ BitVec 64))

(assert (=> b!187778 (validate_offset_bits!1 ((_ sign_extend 32) (size!4340 (buf!4808 (_2!8747 lt!291120)))) ((_ sign_extend 32) (currentByte!9068 (_2!8747 lt!290420))) ((_ sign_extend 32) (currentBit!9063 (_2!8747 lt!290420))) lt!291093)))

(assert (=> b!187778 (= lt!291084 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8747 lt!290420) (buf!4808 (_2!8747 lt!291120)) lt!291093))))

(declare-fun e!129800 () Bool)

(assert (=> b!187778 e!129800))

(declare-fun res!156421 () Bool)

(assert (=> b!187778 (=> (not res!156421) (not e!129800))))

(assert (=> b!187778 (= res!156421 (and (= (size!4340 (buf!4808 (_2!8747 lt!290420))) (size!4340 (buf!4808 (_2!8747 lt!291120)))) (bvsge lt!291093 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187778 (= lt!291093 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!187778 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!187778 (= lt!291105 (reader!0 (_2!8747 lt!290420) (_2!8747 lt!291120)))))

(declare-fun b!187779 () Bool)

(declare-fun e!129805 () tuple2!16204)

(declare-fun Unit!13407 () Unit!13401)

(assert (=> b!187779 (= e!129805 (tuple2!16205 Unit!13407 (_2!8747 lt!290420)))))

(declare-fun lt!291100 () Unit!13401)

(assert (=> b!187779 (= lt!291100 (lemmaIsPrefixRefl!0 (_2!8747 lt!290420)))))

(declare-fun call!3014 () Bool)

(assert (=> b!187779 call!3014))

(declare-fun lt!291106 () Unit!13401)

(assert (=> b!187779 (= lt!291106 lt!291100)))

(declare-fun b!187780 () Bool)

(assert (=> b!187780 (= e!129808 (= (_1!8748 lt!291097) (_2!8749 lt!291105)))))

(declare-fun b!187781 () Bool)

(assert (=> b!187781 (= e!129800 (validate_offset_bits!1 ((_ sign_extend 32) (size!4340 (buf!4808 (_2!8747 lt!290420)))) ((_ sign_extend 32) (currentByte!9068 (_2!8747 lt!290420))) ((_ sign_extend 32) (currentBit!9063 (_2!8747 lt!290420))) lt!291093))))

(declare-fun b!187782 () Bool)

(declare-fun e!129806 () Bool)

(declare-fun lt!291101 () tuple2!16210)

(declare-fun lt!291096 () tuple2!16210)

(assert (=> b!187782 (= e!129806 (= (_2!8750 lt!291101) (_2!8750 lt!291096)))))

(declare-fun b!187783 () Bool)

(declare-fun lt!291115 () tuple2!16210)

(declare-fun lt!291072 () tuple2!16204)

(assert (=> b!187783 (= lt!291115 (readBitPure!0 (readerFrom!0 (_2!8747 lt!291072) (currentBit!9063 (_2!8747 lt!290420)) (currentByte!9068 (_2!8747 lt!290420)))))))

(declare-fun lt!291117 () Bool)

(declare-fun res!156418 () Bool)

(assert (=> b!187783 (= res!156418 (and (= (_2!8750 lt!291115) lt!291117) (= (_1!8750 lt!291115) (_2!8747 lt!291072))))))

(declare-fun e!129801 () Bool)

(assert (=> b!187783 (=> (not res!156418) (not e!129801))))

(declare-fun e!129804 () Bool)

(assert (=> b!187783 (= e!129804 e!129801)))

(declare-fun b!187784 () Bool)

(declare-fun e!129803 () (_ BitVec 64))

(assert (=> b!187784 (= e!129803 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!187785 () Bool)

(declare-fun res!156411 () Bool)

(assert (=> b!187785 (= res!156411 (isPrefixOf!0 (_2!8747 lt!290420) (_2!8747 lt!291072)))))

(assert (=> b!187785 (=> (not res!156411) (not e!129804))))

(declare-fun b!187786 () Bool)

(assert (=> b!187786 (= e!129801 (= (bitIndex!0 (size!4340 (buf!4808 (_1!8750 lt!291115))) (currentByte!9068 (_1!8750 lt!291115)) (currentBit!9063 (_1!8750 lt!291115))) (bitIndex!0 (size!4340 (buf!4808 (_2!8747 lt!291072))) (currentByte!9068 (_2!8747 lt!291072)) (currentBit!9063 (_2!8747 lt!291072)))))))

(declare-fun b!187787 () Bool)

(declare-fun res!156419 () Bool)

(assert (=> b!187787 (=> (not res!156419) (not e!129807))))

(assert (=> b!187787 (= res!156419 (isPrefixOf!0 (_2!8747 lt!290420) (_2!8747 lt!291120)))))

(declare-fun b!187788 () Bool)

(declare-fun lt!291080 () tuple2!16204)

(assert (=> b!187788 (= e!129805 (tuple2!16205 (_1!8747 lt!291080) (_2!8747 lt!291080)))))

(assert (=> b!187788 (= lt!291117 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187788 (= lt!291072 (appendBit!0 (_2!8747 lt!290420) lt!291117))))

(declare-fun res!156412 () Bool)

(assert (=> b!187788 (= res!156412 (= (size!4340 (buf!4808 (_2!8747 lt!290420))) (size!4340 (buf!4808 (_2!8747 lt!291072)))))))

(assert (=> b!187788 (=> (not res!156412) (not e!129804))))

(assert (=> b!187788 e!129804))

(declare-fun lt!291081 () tuple2!16204)

(assert (=> b!187788 (= lt!291081 lt!291072)))

(assert (=> b!187788 (= lt!291080 (appendBitsLSBFirstLoopTR!0 (_2!8747 lt!291081) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!291124 () Unit!13401)

(assert (=> b!187788 (= lt!291124 (lemmaIsPrefixTransitive!0 (_2!8747 lt!290420) (_2!8747 lt!291081) (_2!8747 lt!291080)))))

(assert (=> b!187788 call!3014))

(declare-fun lt!291109 () Unit!13401)

(assert (=> b!187788 (= lt!291109 lt!291124)))

(assert (=> b!187788 (invariant!0 (currentBit!9063 (_2!8747 lt!290420)) (currentByte!9068 (_2!8747 lt!290420)) (size!4340 (buf!4808 (_2!8747 lt!291081))))))

(declare-fun lt!291123 () BitStream!7788)

(assert (=> b!187788 (= lt!291123 (BitStream!7789 (buf!4808 (_2!8747 lt!291081)) (currentByte!9068 (_2!8747 lt!290420)) (currentBit!9063 (_2!8747 lt!290420))))))

(assert (=> b!187788 (invariant!0 (currentBit!9063 lt!291123) (currentByte!9068 lt!291123) (size!4340 (buf!4808 (_2!8747 lt!291080))))))

(declare-fun lt!291077 () BitStream!7788)

(assert (=> b!187788 (= lt!291077 (BitStream!7789 (buf!4808 (_2!8747 lt!291080)) (currentByte!9068 lt!291123) (currentBit!9063 lt!291123)))))

(assert (=> b!187788 (= lt!291101 (readBitPure!0 lt!291123))))

(assert (=> b!187788 (= lt!291096 (readBitPure!0 lt!291077))))

(declare-fun lt!291112 () Unit!13401)

(assert (=> b!187788 (= lt!291112 (readBitPrefixLemma!0 lt!291123 (_2!8747 lt!291080)))))

(declare-fun res!156420 () Bool)

(assert (=> b!187788 (= res!156420 (= (bitIndex!0 (size!4340 (buf!4808 (_1!8750 lt!291101))) (currentByte!9068 (_1!8750 lt!291101)) (currentBit!9063 (_1!8750 lt!291101))) (bitIndex!0 (size!4340 (buf!4808 (_1!8750 lt!291096))) (currentByte!9068 (_1!8750 lt!291096)) (currentBit!9063 (_1!8750 lt!291096)))))))

(assert (=> b!187788 (=> (not res!156420) (not e!129806))))

(assert (=> b!187788 e!129806))

(declare-fun lt!291076 () Unit!13401)

(assert (=> b!187788 (= lt!291076 lt!291112)))

(declare-fun lt!291091 () tuple2!16208)

(assert (=> b!187788 (= lt!291091 (reader!0 (_2!8747 lt!290420) (_2!8747 lt!291080)))))

(declare-fun lt!291069 () tuple2!16208)

(assert (=> b!187788 (= lt!291069 (reader!0 (_2!8747 lt!291081) (_2!8747 lt!291080)))))

(declare-fun lt!291118 () tuple2!16210)

(assert (=> b!187788 (= lt!291118 (readBitPure!0 (_1!8749 lt!291091)))))

(assert (=> b!187788 (= (_2!8750 lt!291118) lt!291117)))

(declare-fun lt!291114 () Unit!13401)

(declare-fun Unit!13408 () Unit!13401)

(assert (=> b!187788 (= lt!291114 Unit!13408)))

(declare-fun lt!291099 () (_ BitVec 64))

(assert (=> b!187788 (= lt!291099 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!291088 () (_ BitVec 64))

(assert (=> b!187788 (= lt!291088 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!291086 () Unit!13401)

(assert (=> b!187788 (= lt!291086 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8747 lt!290420) (buf!4808 (_2!8747 lt!291080)) lt!291088))))

(assert (=> b!187788 (validate_offset_bits!1 ((_ sign_extend 32) (size!4340 (buf!4808 (_2!8747 lt!291080)))) ((_ sign_extend 32) (currentByte!9068 (_2!8747 lt!290420))) ((_ sign_extend 32) (currentBit!9063 (_2!8747 lt!290420))) lt!291088)))

(declare-fun lt!291111 () Unit!13401)

(assert (=> b!187788 (= lt!291111 lt!291086)))

(declare-fun lt!291104 () tuple2!16206)

(assert (=> b!187788 (= lt!291104 (readNBitsLSBFirstsLoopPure!0 (_1!8749 lt!291091) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!291099))))

(declare-fun lt!291108 () (_ BitVec 64))

(assert (=> b!187788 (= lt!291108 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!291094 () Unit!13401)

(assert (=> b!187788 (= lt!291094 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8747 lt!291081) (buf!4808 (_2!8747 lt!291080)) lt!291108))))

(assert (=> b!187788 (validate_offset_bits!1 ((_ sign_extend 32) (size!4340 (buf!4808 (_2!8747 lt!291080)))) ((_ sign_extend 32) (currentByte!9068 (_2!8747 lt!291081))) ((_ sign_extend 32) (currentBit!9063 (_2!8747 lt!291081))) lt!291108)))

(declare-fun lt!291119 () Unit!13401)

(assert (=> b!187788 (= lt!291119 lt!291094)))

(declare-fun lt!291075 () tuple2!16206)

(assert (=> b!187788 (= lt!291075 (readNBitsLSBFirstsLoopPure!0 (_1!8749 lt!291069) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!291099 (ite (_2!8750 lt!291118) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!291078 () tuple2!16206)

(assert (=> b!187788 (= lt!291078 (readNBitsLSBFirstsLoopPure!0 (_1!8749 lt!291091) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!291099))))

(declare-fun c!9572 () Bool)

(assert (=> b!187788 (= c!9572 (_2!8750 (readBitPure!0 (_1!8749 lt!291091))))))

(declare-fun lt!291102 () tuple2!16206)

(assert (=> b!187788 (= lt!291102 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8749 lt!291091) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!291099 e!129803)))))

(declare-fun lt!291121 () Unit!13401)

(assert (=> b!187788 (= lt!291121 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8749 lt!291091) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!291099))))

(assert (=> b!187788 (and (= (_2!8748 lt!291078) (_2!8748 lt!291102)) (= (_1!8748 lt!291078) (_1!8748 lt!291102)))))

(declare-fun lt!291087 () Unit!13401)

(assert (=> b!187788 (= lt!291087 lt!291121)))

(assert (=> b!187788 (= (_1!8749 lt!291091) (withMovedBitIndex!0 (_2!8749 lt!291091) (bvsub (bitIndex!0 (size!4340 (buf!4808 (_2!8747 lt!290420))) (currentByte!9068 (_2!8747 lt!290420)) (currentBit!9063 (_2!8747 lt!290420))) (bitIndex!0 (size!4340 (buf!4808 (_2!8747 lt!291080))) (currentByte!9068 (_2!8747 lt!291080)) (currentBit!9063 (_2!8747 lt!291080))))))))

(declare-fun lt!291095 () Unit!13401)

(declare-fun Unit!13409 () Unit!13401)

(assert (=> b!187788 (= lt!291095 Unit!13409)))

(assert (=> b!187788 (= (_1!8749 lt!291069) (withMovedBitIndex!0 (_2!8749 lt!291069) (bvsub (bitIndex!0 (size!4340 (buf!4808 (_2!8747 lt!291081))) (currentByte!9068 (_2!8747 lt!291081)) (currentBit!9063 (_2!8747 lt!291081))) (bitIndex!0 (size!4340 (buf!4808 (_2!8747 lt!291080))) (currentByte!9068 (_2!8747 lt!291080)) (currentBit!9063 (_2!8747 lt!291080))))))))

(declare-fun lt!291110 () Unit!13401)

(declare-fun Unit!13410 () Unit!13401)

(assert (=> b!187788 (= lt!291110 Unit!13410)))

(assert (=> b!187788 (= (bitIndex!0 (size!4340 (buf!4808 (_2!8747 lt!290420))) (currentByte!9068 (_2!8747 lt!290420)) (currentBit!9063 (_2!8747 lt!290420))) (bvsub (bitIndex!0 (size!4340 (buf!4808 (_2!8747 lt!291081))) (currentByte!9068 (_2!8747 lt!291081)) (currentBit!9063 (_2!8747 lt!291081))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!291103 () Unit!13401)

(declare-fun Unit!13411 () Unit!13401)

(assert (=> b!187788 (= lt!291103 Unit!13411)))

(assert (=> b!187788 (= (_2!8748 lt!291104) (_2!8748 lt!291075))))

(declare-fun lt!291085 () Unit!13401)

(declare-fun Unit!13412 () Unit!13401)

(assert (=> b!187788 (= lt!291085 Unit!13412)))

(assert (=> b!187788 (invariant!0 (currentBit!9063 (_2!8747 lt!291080)) (currentByte!9068 (_2!8747 lt!291080)) (size!4340 (buf!4808 (_2!8747 lt!291080))))))

(declare-fun lt!291074 () Unit!13401)

(declare-fun Unit!13413 () Unit!13401)

(assert (=> b!187788 (= lt!291074 Unit!13413)))

(assert (=> b!187788 (= (size!4340 (buf!4808 (_2!8747 lt!290420))) (size!4340 (buf!4808 (_2!8747 lt!291080))))))

(declare-fun lt!291089 () Unit!13401)

(declare-fun Unit!13414 () Unit!13401)

(assert (=> b!187788 (= lt!291089 Unit!13414)))

(assert (=> b!187788 (= (bitIndex!0 (size!4340 (buf!4808 (_2!8747 lt!291080))) (currentByte!9068 (_2!8747 lt!291080)) (currentBit!9063 (_2!8747 lt!291080))) (bvsub (bvadd (bitIndex!0 (size!4340 (buf!4808 (_2!8747 lt!290420))) (currentByte!9068 (_2!8747 lt!290420)) (currentBit!9063 (_2!8747 lt!290420))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!291116 () Unit!13401)

(declare-fun Unit!13415 () Unit!13401)

(assert (=> b!187788 (= lt!291116 Unit!13415)))

(declare-fun lt!291083 () Unit!13401)

(declare-fun Unit!13416 () Unit!13401)

(assert (=> b!187788 (= lt!291083 Unit!13416)))

(declare-fun lt!291122 () tuple2!16208)

(assert (=> b!187788 (= lt!291122 (reader!0 (_2!8747 lt!290420) (_2!8747 lt!291080)))))

(declare-fun lt!291082 () (_ BitVec 64))

(assert (=> b!187788 (= lt!291082 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!291090 () Unit!13401)

(assert (=> b!187788 (= lt!291090 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8747 lt!290420) (buf!4808 (_2!8747 lt!291080)) lt!291082))))

(assert (=> b!187788 (validate_offset_bits!1 ((_ sign_extend 32) (size!4340 (buf!4808 (_2!8747 lt!291080)))) ((_ sign_extend 32) (currentByte!9068 (_2!8747 lt!290420))) ((_ sign_extend 32) (currentBit!9063 (_2!8747 lt!290420))) lt!291082)))

(declare-fun lt!291113 () Unit!13401)

(assert (=> b!187788 (= lt!291113 lt!291090)))

(declare-fun lt!291098 () tuple2!16206)

(assert (=> b!187788 (= lt!291098 (readNBitsLSBFirstsLoopPure!0 (_1!8749 lt!291122) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!156414 () Bool)

(assert (=> b!187788 (= res!156414 (= (_2!8748 lt!291098) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!129802 () Bool)

(assert (=> b!187788 (=> (not res!156414) (not e!129802))))

(assert (=> b!187788 e!129802))

(declare-fun lt!291107 () Unit!13401)

(declare-fun Unit!13417 () Unit!13401)

(assert (=> b!187788 (= lt!291107 Unit!13417)))

(declare-fun d!64731 () Bool)

(assert (=> d!64731 e!129807))

(declare-fun res!156422 () Bool)

(assert (=> d!64731 (=> (not res!156422) (not e!129807))))

(assert (=> d!64731 (= res!156422 (invariant!0 (currentBit!9063 (_2!8747 lt!291120)) (currentByte!9068 (_2!8747 lt!291120)) (size!4340 (buf!4808 (_2!8747 lt!291120)))))))

(assert (=> d!64731 (= lt!291120 e!129805)))

(declare-fun c!9573 () Bool)

(assert (=> d!64731 (= c!9573 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!64731 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!64731 (= (appendBitsLSBFirstLoopTR!0 (_2!8747 lt!290420) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!291120)))

(declare-fun bm!3011 () Bool)

(assert (=> bm!3011 (= call!3014 (isPrefixOf!0 (_2!8747 lt!290420) (ite c!9573 (_2!8747 lt!290420) (_2!8747 lt!291080))))))

(declare-fun b!187789 () Bool)

(assert (=> b!187789 (= e!129802 (= (_1!8748 lt!291098) (_2!8749 lt!291122)))))

(declare-fun b!187790 () Bool)

(declare-fun res!156417 () Bool)

(assert (=> b!187790 (=> (not res!156417) (not e!129807))))

(assert (=> b!187790 (= res!156417 (= (size!4340 (buf!4808 (_2!8747 lt!290420))) (size!4340 (buf!4808 (_2!8747 lt!291120)))))))

(declare-fun b!187791 () Bool)

(declare-fun res!156413 () Bool)

(assert (=> b!187791 (= res!156413 (= (bitIndex!0 (size!4340 (buf!4808 (_2!8747 lt!291072))) (currentByte!9068 (_2!8747 lt!291072)) (currentBit!9063 (_2!8747 lt!291072))) (bvadd (bitIndex!0 (size!4340 (buf!4808 (_2!8747 lt!290420))) (currentByte!9068 (_2!8747 lt!290420)) (currentBit!9063 (_2!8747 lt!290420))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!187791 (=> (not res!156413) (not e!129804))))

(declare-fun b!187792 () Bool)

(assert (=> b!187792 (= e!129803 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!187793 () Bool)

(declare-fun res!156416 () Bool)

(assert (=> b!187793 (=> (not res!156416) (not e!129807))))

(declare-fun lt!291070 () (_ BitVec 64))

(declare-fun lt!291071 () (_ BitVec 64))

(assert (=> b!187793 (= res!156416 (= (bitIndex!0 (size!4340 (buf!4808 (_2!8747 lt!291120))) (currentByte!9068 (_2!8747 lt!291120)) (currentBit!9063 (_2!8747 lt!291120))) (bvsub lt!291070 lt!291071)))))

(assert (=> b!187793 (or (= (bvand lt!291070 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!291071 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!291070 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!291070 lt!291071) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187793 (= lt!291071 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!291079 () (_ BitVec 64))

(declare-fun lt!291073 () (_ BitVec 64))

(assert (=> b!187793 (= lt!291070 (bvadd lt!291079 lt!291073))))

(assert (=> b!187793 (or (not (= (bvand lt!291079 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!291073 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!291079 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!291079 lt!291073) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187793 (= lt!291073 ((_ sign_extend 32) nBits!348))))

(assert (=> b!187793 (= lt!291079 (bitIndex!0 (size!4340 (buf!4808 (_2!8747 lt!290420))) (currentByte!9068 (_2!8747 lt!290420)) (currentBit!9063 (_2!8747 lt!290420))))))

(assert (= (and d!64731 c!9573) b!187779))

(assert (= (and d!64731 (not c!9573)) b!187788))

(assert (= (and b!187788 res!156412) b!187791))

(assert (= (and b!187791 res!156413) b!187785))

(assert (= (and b!187785 res!156411) b!187783))

(assert (= (and b!187783 res!156418) b!187786))

(assert (= (and b!187788 res!156420) b!187782))

(assert (= (and b!187788 c!9572) b!187792))

(assert (= (and b!187788 (not c!9572)) b!187784))

(assert (= (and b!187788 res!156414) b!187789))

(assert (= (or b!187779 b!187788) bm!3011))

(assert (= (and d!64731 res!156422) b!187790))

(assert (= (and b!187790 res!156417) b!187793))

(assert (= (and b!187793 res!156416) b!187787))

(assert (= (and b!187787 res!156419) b!187778))

(assert (= (and b!187778 res!156421) b!187781))

(assert (= (and b!187778 res!156415) b!187780))

(declare-fun m!291995 () Bool)

(assert (=> b!187793 m!291995))

(assert (=> b!187793 m!291557))

(declare-fun m!291997 () Bool)

(assert (=> d!64731 m!291997))

(declare-fun m!291999 () Bool)

(assert (=> b!187791 m!291999))

(assert (=> b!187791 m!291557))

(declare-fun m!292001 () Bool)

(assert (=> b!187787 m!292001))

(declare-fun m!292003 () Bool)

(assert (=> b!187781 m!292003))

(declare-fun m!292005 () Bool)

(assert (=> b!187788 m!292005))

(declare-fun m!292007 () Bool)

(assert (=> b!187788 m!292007))

(declare-fun m!292009 () Bool)

(assert (=> b!187788 m!292009))

(declare-fun m!292011 () Bool)

(assert (=> b!187788 m!292011))

(declare-fun m!292013 () Bool)

(assert (=> b!187788 m!292013))

(declare-fun m!292015 () Bool)

(assert (=> b!187788 m!292015))

(declare-fun m!292017 () Bool)

(assert (=> b!187788 m!292017))

(declare-fun m!292019 () Bool)

(assert (=> b!187788 m!292019))

(declare-fun m!292021 () Bool)

(assert (=> b!187788 m!292021))

(declare-fun m!292023 () Bool)

(assert (=> b!187788 m!292023))

(declare-fun m!292025 () Bool)

(assert (=> b!187788 m!292025))

(declare-fun m!292027 () Bool)

(assert (=> b!187788 m!292027))

(declare-fun m!292029 () Bool)

(assert (=> b!187788 m!292029))

(declare-fun m!292031 () Bool)

(assert (=> b!187788 m!292031))

(declare-fun m!292033 () Bool)

(assert (=> b!187788 m!292033))

(assert (=> b!187788 m!291557))

(declare-fun m!292035 () Bool)

(assert (=> b!187788 m!292035))

(declare-fun m!292037 () Bool)

(assert (=> b!187788 m!292037))

(declare-fun m!292039 () Bool)

(assert (=> b!187788 m!292039))

(declare-fun m!292041 () Bool)

(assert (=> b!187788 m!292041))

(declare-fun m!292043 () Bool)

(assert (=> b!187788 m!292043))

(declare-fun m!292045 () Bool)

(assert (=> b!187788 m!292045))

(declare-fun m!292047 () Bool)

(assert (=> b!187788 m!292047))

(declare-fun m!292049 () Bool)

(assert (=> b!187788 m!292049))

(declare-fun m!292051 () Bool)

(assert (=> b!187788 m!292051))

(declare-fun m!292053 () Bool)

(assert (=> b!187788 m!292053))

(declare-fun m!292055 () Bool)

(assert (=> b!187788 m!292055))

(declare-fun m!292057 () Bool)

(assert (=> b!187788 m!292057))

(declare-fun m!292059 () Bool)

(assert (=> b!187788 m!292059))

(declare-fun m!292061 () Bool)

(assert (=> b!187788 m!292061))

(declare-fun m!292063 () Bool)

(assert (=> b!187788 m!292063))

(assert (=> b!187788 m!292029))

(declare-fun m!292065 () Bool)

(assert (=> b!187788 m!292065))

(declare-fun m!292067 () Bool)

(assert (=> b!187788 m!292067))

(declare-fun m!292069 () Bool)

(assert (=> b!187786 m!292069))

(assert (=> b!187786 m!291999))

(declare-fun m!292071 () Bool)

(assert (=> bm!3011 m!292071))

(assert (=> b!187778 m!292045))

(declare-fun m!292073 () Bool)

(assert (=> b!187778 m!292073))

(declare-fun m!292075 () Bool)

(assert (=> b!187778 m!292075))

(assert (=> b!187778 m!292023))

(declare-fun m!292077 () Bool)

(assert (=> b!187778 m!292077))

(declare-fun m!292079 () Bool)

(assert (=> b!187778 m!292079))

(declare-fun m!292081 () Bool)

(assert (=> b!187783 m!292081))

(assert (=> b!187783 m!292081))

(declare-fun m!292083 () Bool)

(assert (=> b!187783 m!292083))

(declare-fun m!292085 () Bool)

(assert (=> b!187785 m!292085))

(assert (=> b!187779 m!291719))

(assert (=> b!187504 d!64731))

(declare-fun d!64825 () Bool)

(declare-fun res!156423 () Bool)

(declare-fun e!129810 () Bool)

(assert (=> d!64825 (=> (not res!156423) (not e!129810))))

(assert (=> d!64825 (= res!156423 (= (size!4340 (buf!4808 (_2!8747 lt!290420))) (size!4340 (buf!4808 (_2!8747 lt!290422)))))))

(assert (=> d!64825 (= (isPrefixOf!0 (_2!8747 lt!290420) (_2!8747 lt!290422)) e!129810)))

(declare-fun b!187794 () Bool)

(declare-fun res!156425 () Bool)

(assert (=> b!187794 (=> (not res!156425) (not e!129810))))

(assert (=> b!187794 (= res!156425 (bvsle (bitIndex!0 (size!4340 (buf!4808 (_2!8747 lt!290420))) (currentByte!9068 (_2!8747 lt!290420)) (currentBit!9063 (_2!8747 lt!290420))) (bitIndex!0 (size!4340 (buf!4808 (_2!8747 lt!290422))) (currentByte!9068 (_2!8747 lt!290422)) (currentBit!9063 (_2!8747 lt!290422)))))))

(declare-fun b!187795 () Bool)

(declare-fun e!129809 () Bool)

(assert (=> b!187795 (= e!129810 e!129809)))

(declare-fun res!156424 () Bool)

(assert (=> b!187795 (=> res!156424 e!129809)))

(assert (=> b!187795 (= res!156424 (= (size!4340 (buf!4808 (_2!8747 lt!290420))) #b00000000000000000000000000000000))))

(declare-fun b!187796 () Bool)

(assert (=> b!187796 (= e!129809 (arrayBitRangesEq!0 (buf!4808 (_2!8747 lt!290420)) (buf!4808 (_2!8747 lt!290422)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4340 (buf!4808 (_2!8747 lt!290420))) (currentByte!9068 (_2!8747 lt!290420)) (currentBit!9063 (_2!8747 lt!290420)))))))

(assert (= (and d!64825 res!156423) b!187794))

(assert (= (and b!187794 res!156425) b!187795))

(assert (= (and b!187795 (not res!156424)) b!187796))

(assert (=> b!187794 m!291557))

(assert (=> b!187794 m!291549))

(assert (=> b!187796 m!291557))

(assert (=> b!187796 m!291557))

(declare-fun m!292087 () Bool)

(assert (=> b!187796 m!292087))

(assert (=> b!187493 d!64825))

(check-sat (not b!187606) (not d!64705) (not d!64665) (not b!187624) (not b!187637) (not b!187607) (not d!64669) (not d!64711) (not d!64697) (not d!64685) (not b!187786) (not d!64715) (not d!64709) (not d!64667) (not d!64687) (not d!64721) (not b!187636) (not b!187788) (not b!187796) (not b!187778) (not b!187639) (not b!187604) (not bm!3011) (not d!64707) (not b!187610) (not b!187623) (not d!64675) (not b!187781) (not b!187783) (not d!64671) (not b!187794) (not b!187635) (not d!64695) (not d!64673) (not b!187787) (not d!64689) (not d!64677) (not d!64725) (not d!64729) (not b!187785) (not d!64699) (not b!187584) (not d!64703) (not d!64713) (not b!187793) (not b!187649) (not d!64723) (not d!64683) (not b!187586) (not b!187625) (not d!64681) (not d!64701) (not d!64731) (not d!64663) (not b!187605) (not d!64691) (not b!187627) (not b!187791) (not b!187779) (not b!187647))
