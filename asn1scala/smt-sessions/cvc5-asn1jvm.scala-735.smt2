; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20578 () Bool)

(assert start!20578)

(declare-fun b!103603 () Bool)

(declare-fun e!67803 () Bool)

(declare-fun e!67793 () Bool)

(assert (=> b!103603 (= e!67803 e!67793)))

(declare-fun res!85245 () Bool)

(assert (=> b!103603 (=> (not res!85245) (not e!67793))))

(declare-fun lt!151615 () Bool)

(declare-datatypes ((array!4836 0))(
  ( (array!4837 (arr!2799 (Array (_ BitVec 32) (_ BitVec 8))) (size!2206 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3886 0))(
  ( (BitStream!3887 (buf!2572 array!4836) (currentByte!5057 (_ BitVec 32)) (currentBit!5052 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6356 0))(
  ( (Unit!6357) )
))
(declare-datatypes ((tuple2!8494 0))(
  ( (tuple2!8495 (_1!4502 Unit!6356) (_2!4502 BitStream!3886)) )
))
(declare-fun lt!151632 () tuple2!8494)

(declare-datatypes ((tuple2!8496 0))(
  ( (tuple2!8497 (_1!4503 BitStream!3886) (_2!4503 Bool)) )
))
(declare-fun lt!151628 () tuple2!8496)

(assert (=> b!103603 (= res!85245 (and (= (_2!4503 lt!151628) lt!151615) (= (_1!4503 lt!151628) (_2!4502 lt!151632))))))

(declare-fun thiss!1305 () BitStream!3886)

(declare-fun readBitPure!0 (BitStream!3886) tuple2!8496)

(declare-fun readerFrom!0 (BitStream!3886 (_ BitVec 32) (_ BitVec 32)) BitStream!3886)

(assert (=> b!103603 (= lt!151628 (readBitPure!0 (readerFrom!0 (_2!4502 lt!151632) (currentBit!5052 thiss!1305) (currentByte!5057 thiss!1305))))))

(declare-fun res!85239 () Bool)

(declare-fun e!67797 () Bool)

(assert (=> start!20578 (=> (not res!85239) (not e!67797))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!20578 (= res!85239 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20578 e!67797))

(assert (=> start!20578 true))

(declare-fun e!67796 () Bool)

(declare-fun inv!12 (BitStream!3886) Bool)

(assert (=> start!20578 (and (inv!12 thiss!1305) e!67796)))

(declare-fun b!103604 () Bool)

(declare-fun array_inv!2008 (array!4836) Bool)

(assert (=> b!103604 (= e!67796 (array_inv!2008 (buf!2572 thiss!1305)))))

(declare-fun b!103605 () Bool)

(declare-fun e!67799 () Bool)

(declare-fun lt!151639 () tuple2!8496)

(declare-fun lt!151629 () tuple2!8496)

(assert (=> b!103605 (= e!67799 (= (_2!4503 lt!151639) (_2!4503 lt!151629)))))

(declare-fun b!103606 () Bool)

(declare-fun e!67795 () Bool)

(declare-fun lt!151617 () tuple2!8494)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!103606 (= e!67795 (invariant!0 (currentBit!5052 thiss!1305) (currentByte!5057 thiss!1305) (size!2206 (buf!2572 (_2!4502 lt!151617)))))))

(declare-fun b!103607 () Bool)

(declare-fun e!67794 () Bool)

(declare-fun e!67802 () Bool)

(assert (=> b!103607 (= e!67794 e!67802)))

(declare-fun res!85247 () Bool)

(assert (=> b!103607 (=> (not res!85247) (not e!67802))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun lt!151619 () (_ BitVec 64))

(assert (=> b!103607 (= res!85247 (and (= (bvand v!199 lt!151619) v!199) (bvslt i!615 nBits!396)))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103607 (= lt!151619 (onesLSBLong!0 nBits!396))))

(declare-fun b!103608 () Bool)

(declare-fun e!67800 () Bool)

(assert (=> b!103608 (= e!67802 (not e!67800))))

(declare-fun res!85235 () Bool)

(assert (=> b!103608 (=> res!85235 e!67800)))

(declare-fun lt!151633 () (_ BitVec 64))

(declare-datatypes ((tuple2!8498 0))(
  ( (tuple2!8499 (_1!4504 BitStream!3886) (_2!4504 BitStream!3886)) )
))
(declare-fun lt!151636 () tuple2!8498)

(declare-datatypes ((tuple2!8500 0))(
  ( (tuple2!8501 (_1!4505 BitStream!3886) (_2!4505 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3886 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8500)

(assert (=> b!103608 (= res!85235 (not (= (_1!4505 (readNLeastSignificantBitsLoopPure!0 (_1!4504 lt!151636) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!151633)) (_2!4504 lt!151636))))))

(declare-fun lt!151638 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!103608 (validate_offset_bits!1 ((_ sign_extend 32) (size!2206 (buf!2572 (_2!4502 lt!151617)))) ((_ sign_extend 32) (currentByte!5057 (_2!4502 lt!151632))) ((_ sign_extend 32) (currentBit!5052 (_2!4502 lt!151632))) lt!151638)))

(declare-fun lt!151622 () Unit!6356)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3886 array!4836 (_ BitVec 64)) Unit!6356)

(assert (=> b!103608 (= lt!151622 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4502 lt!151632) (buf!2572 (_2!4502 lt!151617)) lt!151638))))

(assert (=> b!103608 (= lt!151638 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!151637 () (_ BitVec 64))

(declare-fun lt!151627 () tuple2!8496)

(declare-fun lt!151634 () (_ BitVec 64))

(assert (=> b!103608 (= lt!151633 (bvor lt!151634 (ite (_2!4503 lt!151627) lt!151637 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!151630 () tuple2!8500)

(declare-fun lt!151625 () tuple2!8498)

(assert (=> b!103608 (= lt!151630 (readNLeastSignificantBitsLoopPure!0 (_1!4504 lt!151625) nBits!396 i!615 lt!151634))))

(declare-fun lt!151620 () (_ BitVec 64))

(assert (=> b!103608 (validate_offset_bits!1 ((_ sign_extend 32) (size!2206 (buf!2572 (_2!4502 lt!151617)))) ((_ sign_extend 32) (currentByte!5057 thiss!1305)) ((_ sign_extend 32) (currentBit!5052 thiss!1305)) lt!151620)))

(declare-fun lt!151635 () Unit!6356)

(assert (=> b!103608 (= lt!151635 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2572 (_2!4502 lt!151617)) lt!151620))))

(declare-fun lt!151623 () (_ BitVec 64))

(assert (=> b!103608 (= lt!151634 (bvand v!199 (bvnot lt!151623)))))

(assert (=> b!103608 (= lt!151623 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(assert (=> b!103608 (= (_2!4503 lt!151627) lt!151615)))

(assert (=> b!103608 (= lt!151627 (readBitPure!0 (_1!4504 lt!151625)))))

(declare-fun reader!0 (BitStream!3886 BitStream!3886) tuple2!8498)

(assert (=> b!103608 (= lt!151636 (reader!0 (_2!4502 lt!151632) (_2!4502 lt!151617)))))

(assert (=> b!103608 (= lt!151625 (reader!0 thiss!1305 (_2!4502 lt!151617)))))

(assert (=> b!103608 e!67799))

(declare-fun res!85246 () Bool)

(assert (=> b!103608 (=> (not res!85246) (not e!67799))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103608 (= res!85246 (= (bitIndex!0 (size!2206 (buf!2572 (_1!4503 lt!151639))) (currentByte!5057 (_1!4503 lt!151639)) (currentBit!5052 (_1!4503 lt!151639))) (bitIndex!0 (size!2206 (buf!2572 (_1!4503 lt!151629))) (currentByte!5057 (_1!4503 lt!151629)) (currentBit!5052 (_1!4503 lt!151629)))))))

(declare-fun lt!151631 () Unit!6356)

(declare-fun lt!151618 () BitStream!3886)

(declare-fun readBitPrefixLemma!0 (BitStream!3886 BitStream!3886) Unit!6356)

(assert (=> b!103608 (= lt!151631 (readBitPrefixLemma!0 lt!151618 (_2!4502 lt!151617)))))

(assert (=> b!103608 (= lt!151629 (readBitPure!0 (BitStream!3887 (buf!2572 (_2!4502 lt!151617)) (currentByte!5057 thiss!1305) (currentBit!5052 thiss!1305))))))

(assert (=> b!103608 (= lt!151639 (readBitPure!0 lt!151618))))

(assert (=> b!103608 (= lt!151618 (BitStream!3887 (buf!2572 (_2!4502 lt!151632)) (currentByte!5057 thiss!1305) (currentBit!5052 thiss!1305)))))

(assert (=> b!103608 e!67795))

(declare-fun res!85240 () Bool)

(assert (=> b!103608 (=> (not res!85240) (not e!67795))))

(declare-fun isPrefixOf!0 (BitStream!3886 BitStream!3886) Bool)

(assert (=> b!103608 (= res!85240 (isPrefixOf!0 thiss!1305 (_2!4502 lt!151617)))))

(declare-fun lt!151616 () Unit!6356)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3886 BitStream!3886 BitStream!3886) Unit!6356)

(assert (=> b!103608 (= lt!151616 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4502 lt!151632) (_2!4502 lt!151617)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3886 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8494)

(assert (=> b!103608 (= lt!151617 (appendNLeastSignificantBitsLoop!0 (_2!4502 lt!151632) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!67798 () Bool)

(assert (=> b!103608 e!67798))

(declare-fun res!85241 () Bool)

(assert (=> b!103608 (=> (not res!85241) (not e!67798))))

(assert (=> b!103608 (= res!85241 (= (size!2206 (buf!2572 thiss!1305)) (size!2206 (buf!2572 (_2!4502 lt!151632)))))))

(declare-fun appendBit!0 (BitStream!3886 Bool) tuple2!8494)

(assert (=> b!103608 (= lt!151632 (appendBit!0 thiss!1305 lt!151615))))

(assert (=> b!103608 (= lt!151615 (not (= (bvand v!199 lt!151637) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103608 (= lt!151637 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!103609 () Bool)

(declare-fun res!85238 () Bool)

(assert (=> b!103609 (=> (not res!85238) (not e!67803))))

(assert (=> b!103609 (= res!85238 (isPrefixOf!0 thiss!1305 (_2!4502 lt!151632)))))

(declare-fun b!103610 () Bool)

(declare-fun lt!151621 () (_ BitVec 64))

(assert (=> b!103610 (= e!67793 (= (bitIndex!0 (size!2206 (buf!2572 (_1!4503 lt!151628))) (currentByte!5057 (_1!4503 lt!151628)) (currentBit!5052 (_1!4503 lt!151628))) lt!151621))))

(declare-fun b!103611 () Bool)

(assert (=> b!103611 (= e!67800 true)))

(declare-fun lt!151626 () tuple2!8500)

(declare-fun withMovedBitIndex!0 (BitStream!3886 (_ BitVec 64)) BitStream!3886)

(assert (=> b!103611 (= lt!151626 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4504 lt!151625) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!151633))))

(declare-fun b!103612 () Bool)

(assert (=> b!103612 (= e!67798 e!67803)))

(declare-fun res!85237 () Bool)

(assert (=> b!103612 (=> (not res!85237) (not e!67803))))

(declare-fun lt!151624 () (_ BitVec 64))

(assert (=> b!103612 (= res!85237 (= lt!151621 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!151624)))))

(assert (=> b!103612 (= lt!151621 (bitIndex!0 (size!2206 (buf!2572 (_2!4502 lt!151632))) (currentByte!5057 (_2!4502 lt!151632)) (currentBit!5052 (_2!4502 lt!151632))))))

(assert (=> b!103612 (= lt!151624 (bitIndex!0 (size!2206 (buf!2572 thiss!1305)) (currentByte!5057 thiss!1305) (currentBit!5052 thiss!1305)))))

(declare-fun b!103613 () Bool)

(declare-fun res!85242 () Bool)

(assert (=> b!103613 (=> (not res!85242) (not e!67795))))

(assert (=> b!103613 (= res!85242 (invariant!0 (currentBit!5052 thiss!1305) (currentByte!5057 thiss!1305) (size!2206 (buf!2572 (_2!4502 lt!151632)))))))

(declare-fun b!103614 () Bool)

(declare-fun res!85243 () Bool)

(assert (=> b!103614 (=> res!85243 e!67800)))

(assert (=> b!103614 (= res!85243 (or (not (= (bvand lt!151634 lt!151623) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand lt!151634 lt!151619) lt!151634))))))

(declare-fun b!103615 () Bool)

(declare-fun res!85236 () Bool)

(assert (=> b!103615 (=> res!85236 e!67800)))

(assert (=> b!103615 (= res!85236 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2206 (buf!2572 (_1!4504 lt!151625)))) ((_ sign_extend 32) (currentByte!5057 (_1!4504 lt!151625))) ((_ sign_extend 32) (currentBit!5052 (_1!4504 lt!151625))) lt!151620)))))

(declare-fun b!103616 () Bool)

(assert (=> b!103616 (= e!67797 e!67794)))

(declare-fun res!85244 () Bool)

(assert (=> b!103616 (=> (not res!85244) (not e!67794))))

(assert (=> b!103616 (= res!85244 (validate_offset_bits!1 ((_ sign_extend 32) (size!2206 (buf!2572 thiss!1305))) ((_ sign_extend 32) (currentByte!5057 thiss!1305)) ((_ sign_extend 32) (currentBit!5052 thiss!1305)) lt!151620))))

(assert (=> b!103616 (= lt!151620 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (= (and start!20578 res!85239) b!103616))

(assert (= (and b!103616 res!85244) b!103607))

(assert (= (and b!103607 res!85247) b!103608))

(assert (= (and b!103608 res!85241) b!103612))

(assert (= (and b!103612 res!85237) b!103609))

(assert (= (and b!103609 res!85238) b!103603))

(assert (= (and b!103603 res!85245) b!103610))

(assert (= (and b!103608 res!85240) b!103613))

(assert (= (and b!103613 res!85242) b!103606))

(assert (= (and b!103608 res!85246) b!103605))

(assert (= (and b!103608 (not res!85235)) b!103615))

(assert (= (and b!103615 (not res!85236)) b!103614))

(assert (= (and b!103614 (not res!85243)) b!103611))

(assert (= start!20578 b!103604))

(declare-fun m!151297 () Bool)

(assert (=> b!103611 m!151297))

(assert (=> b!103611 m!151297))

(declare-fun m!151299 () Bool)

(assert (=> b!103611 m!151299))

(declare-fun m!151301 () Bool)

(assert (=> b!103609 m!151301))

(declare-fun m!151303 () Bool)

(assert (=> b!103608 m!151303))

(declare-fun m!151305 () Bool)

(assert (=> b!103608 m!151305))

(declare-fun m!151307 () Bool)

(assert (=> b!103608 m!151307))

(declare-fun m!151309 () Bool)

(assert (=> b!103608 m!151309))

(declare-fun m!151311 () Bool)

(assert (=> b!103608 m!151311))

(declare-fun m!151313 () Bool)

(assert (=> b!103608 m!151313))

(declare-fun m!151315 () Bool)

(assert (=> b!103608 m!151315))

(declare-fun m!151317 () Bool)

(assert (=> b!103608 m!151317))

(declare-fun m!151319 () Bool)

(assert (=> b!103608 m!151319))

(declare-fun m!151321 () Bool)

(assert (=> b!103608 m!151321))

(declare-fun m!151323 () Bool)

(assert (=> b!103608 m!151323))

(declare-fun m!151325 () Bool)

(assert (=> b!103608 m!151325))

(declare-fun m!151327 () Bool)

(assert (=> b!103608 m!151327))

(declare-fun m!151329 () Bool)

(assert (=> b!103608 m!151329))

(declare-fun m!151331 () Bool)

(assert (=> b!103608 m!151331))

(declare-fun m!151333 () Bool)

(assert (=> b!103608 m!151333))

(declare-fun m!151335 () Bool)

(assert (=> b!103608 m!151335))

(declare-fun m!151337 () Bool)

(assert (=> b!103608 m!151337))

(declare-fun m!151339 () Bool)

(assert (=> b!103608 m!151339))

(declare-fun m!151341 () Bool)

(assert (=> start!20578 m!151341))

(declare-fun m!151343 () Bool)

(assert (=> b!103610 m!151343))

(declare-fun m!151345 () Bool)

(assert (=> b!103607 m!151345))

(declare-fun m!151347 () Bool)

(assert (=> b!103612 m!151347))

(declare-fun m!151349 () Bool)

(assert (=> b!103612 m!151349))

(declare-fun m!151351 () Bool)

(assert (=> b!103615 m!151351))

(declare-fun m!151353 () Bool)

(assert (=> b!103606 m!151353))

(declare-fun m!151355 () Bool)

(assert (=> b!103613 m!151355))

(declare-fun m!151357 () Bool)

(assert (=> b!103603 m!151357))

(assert (=> b!103603 m!151357))

(declare-fun m!151359 () Bool)

(assert (=> b!103603 m!151359))

(declare-fun m!151361 () Bool)

(assert (=> b!103604 m!151361))

(declare-fun m!151363 () Bool)

(assert (=> b!103616 m!151363))

(push 1)

(assert (not b!103609))

(assert (not b!103608))

(assert (not b!103613))

(assert (not b!103603))

(assert (not b!103604))

(assert (not b!103615))

