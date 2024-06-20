; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25070 () Bool)

(assert start!25070)

(declare-fun b!127031 () Bool)

(declare-fun e!83824 () Bool)

(declare-fun e!83820 () Bool)

(assert (=> b!127031 (= e!83824 (not e!83820))))

(declare-fun res!105294 () Bool)

(assert (=> b!127031 (=> res!105294 e!83820)))

(declare-datatypes ((array!5758 0))(
  ( (array!5759 (arr!3217 (Array (_ BitVec 32) (_ BitVec 8))) (size!2606 (_ BitVec 32))) )
))
(declare-fun arr!227 () array!5758)

(declare-datatypes ((BitStream!4536 0))(
  ( (BitStream!4537 (buf!2991 array!5758) (currentByte!5730 (_ BitVec 32)) (currentBit!5725 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10684 0))(
  ( (tuple2!10685 (_1!5627 BitStream!4536) (_2!5627 array!5758)) )
))
(declare-fun lt!198277 () tuple2!10684)

(declare-datatypes ((tuple2!10686 0))(
  ( (tuple2!10687 (_1!5628 BitStream!4536) (_2!5628 BitStream!4536)) )
))
(declare-fun lt!198276 () tuple2!10686)

(assert (=> b!127031 (= res!105294 (or (not (= (size!2606 (_2!5627 lt!198277)) (size!2606 arr!227))) (not (= (_1!5627 lt!198277) (_2!5628 lt!198276)))))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4536 array!5758 (_ BitVec 32) (_ BitVec 32)) tuple2!10684)

(assert (=> b!127031 (= lt!198277 (readByteArrayLoopPure!0 (_1!5628 lt!198276) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-datatypes ((Unit!7812 0))(
  ( (Unit!7813) )
))
(declare-datatypes ((tuple2!10688 0))(
  ( (tuple2!10689 (_1!5629 Unit!7812) (_2!5629 BitStream!4536)) )
))
(declare-fun lt!198274 () tuple2!10688)

(declare-fun thiss!1614 () BitStream!4536)

(declare-fun lt!198278 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!127031 (validate_offset_bits!1 ((_ sign_extend 32) (size!2606 (buf!2991 (_2!5629 lt!198274)))) ((_ sign_extend 32) (currentByte!5730 thiss!1614)) ((_ sign_extend 32) (currentBit!5725 thiss!1614)) lt!198278)))

(declare-fun lt!198273 () Unit!7812)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4536 array!5758 (_ BitVec 64)) Unit!7812)

(assert (=> b!127031 (= lt!198273 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2991 (_2!5629 lt!198274)) lt!198278))))

(declare-fun reader!0 (BitStream!4536 BitStream!4536) tuple2!10686)

(assert (=> b!127031 (= lt!198276 (reader!0 thiss!1614 (_2!5629 lt!198274)))))

(declare-fun b!127032 () Bool)

(declare-fun e!83819 () Bool)

(assert (=> b!127032 (= e!83819 (not (or (= ((_ sign_extend 32) noOfBytes!1) #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1)) ((_ sign_extend 32) noOfBytes!1))))))))

(declare-fun lt!198275 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!127032 (= lt!198275 (bitIndex!0 (size!2606 (buf!2991 thiss!1614)) (currentByte!5730 thiss!1614) (currentBit!5725 thiss!1614)))))

(declare-fun e!83822 () Bool)

(assert (=> b!127032 e!83822))

(declare-fun res!105292 () Bool)

(assert (=> b!127032 (=> (not res!105292) (not e!83822))))

(assert (=> b!127032 (= res!105292 (= (size!2606 (buf!2991 thiss!1614)) (size!2606 (buf!2991 (_2!5629 lt!198274)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4536 array!5758 (_ BitVec 32) (_ BitVec 32)) tuple2!10688)

(assert (=> b!127032 (= lt!198274 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!127033 () Bool)

(declare-fun res!105290 () Bool)

(assert (=> b!127033 (=> (not res!105290) (not e!83819))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!127033 (= res!105290 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2606 (buf!2991 thiss!1614))) ((_ sign_extend 32) (currentByte!5730 thiss!1614)) ((_ sign_extend 32) (currentBit!5725 thiss!1614)) noOfBytes!1))))

(declare-fun b!127034 () Bool)

(declare-fun res!105293 () Bool)

(assert (=> b!127034 (=> (not res!105293) (not e!83824))))

(declare-fun isPrefixOf!0 (BitStream!4536 BitStream!4536) Bool)

(assert (=> b!127034 (= res!105293 (isPrefixOf!0 thiss!1614 (_2!5629 lt!198274)))))

(declare-fun b!127035 () Bool)

(declare-fun arrayRangesEq!90 (array!5758 array!5758 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!127035 (= e!83820 (not (arrayRangesEq!90 arr!227 (_2!5627 lt!198277) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun res!105291 () Bool)

(assert (=> start!25070 (=> (not res!105291) (not e!83819))))

(assert (=> start!25070 (= res!105291 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2606 arr!227))))))

(assert (=> start!25070 e!83819))

(assert (=> start!25070 true))

(declare-fun array_inv!2395 (array!5758) Bool)

(assert (=> start!25070 (array_inv!2395 arr!227)))

(declare-fun e!83823 () Bool)

(declare-fun inv!12 (BitStream!4536) Bool)

(assert (=> start!25070 (and (inv!12 thiss!1614) e!83823)))

(declare-fun b!127036 () Bool)

(assert (=> b!127036 (= e!83822 e!83824)))

(declare-fun res!105295 () Bool)

(assert (=> b!127036 (=> (not res!105295) (not e!83824))))

(assert (=> b!127036 (= res!105295 (= (bitIndex!0 (size!2606 (buf!2991 (_2!5629 lt!198274))) (currentByte!5730 (_2!5629 lt!198274)) (currentBit!5725 (_2!5629 lt!198274))) (bvadd (bitIndex!0 (size!2606 (buf!2991 thiss!1614)) (currentByte!5730 thiss!1614) (currentBit!5725 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!198278))))))

(assert (=> b!127036 (= lt!198278 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!127037 () Bool)

(assert (=> b!127037 (= e!83823 (array_inv!2395 (buf!2991 thiss!1614)))))

(assert (= (and start!25070 res!105291) b!127033))

(assert (= (and b!127033 res!105290) b!127032))

(assert (= (and b!127032 res!105292) b!127036))

(assert (= (and b!127036 res!105295) b!127034))

(assert (= (and b!127034 res!105293) b!127031))

(assert (= (and b!127031 (not res!105294)) b!127035))

(assert (= start!25070 b!127037))

(declare-fun m!192659 () Bool)

(assert (=> b!127033 m!192659))

(declare-fun m!192661 () Bool)

(assert (=> b!127035 m!192661))

(declare-fun m!192663 () Bool)

(assert (=> b!127037 m!192663))

(declare-fun m!192665 () Bool)

(assert (=> start!25070 m!192665))

(declare-fun m!192667 () Bool)

(assert (=> start!25070 m!192667))

(declare-fun m!192669 () Bool)

(assert (=> b!127034 m!192669))

(declare-fun m!192671 () Bool)

(assert (=> b!127032 m!192671))

(declare-fun m!192673 () Bool)

(assert (=> b!127032 m!192673))

(declare-fun m!192675 () Bool)

(assert (=> b!127031 m!192675))

(declare-fun m!192677 () Bool)

(assert (=> b!127031 m!192677))

(declare-fun m!192679 () Bool)

(assert (=> b!127031 m!192679))

(declare-fun m!192681 () Bool)

(assert (=> b!127031 m!192681))

(declare-fun m!192683 () Bool)

(assert (=> b!127036 m!192683))

(assert (=> b!127036 m!192671))

(check-sat (not b!127034) (not b!127033) (not start!25070) (not b!127036) (not b!127031) (not b!127037) (not b!127032) (not b!127035))
(check-sat)
