; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15048 () Bool)

(assert start!15048)

(declare-fun b!77035 () Bool)

(declare-fun res!63652 () Bool)

(declare-fun e!50530 () Bool)

(assert (=> b!77035 (=> (not res!63652) (not e!50530))))

(declare-datatypes ((array!3210 0))(
  ( (array!3211 (arr!2093 (Array (_ BitVec 32) (_ BitVec 8))) (size!1492 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2558 0))(
  ( (BitStream!2559 (buf!1882 array!3210) (currentByte!3693 (_ BitVec 32)) (currentBit!3688 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2558)

(declare-datatypes ((Unit!5075 0))(
  ( (Unit!5076) )
))
(declare-datatypes ((tuple2!6734 0))(
  ( (tuple2!6735 (_1!3501 Unit!5075) (_2!3501 BitStream!2558)) )
))
(declare-fun lt!123444 () tuple2!6734)

(declare-fun isPrefixOf!0 (BitStream!2558 BitStream!2558) Bool)

(assert (=> b!77035 (= res!63652 (isPrefixOf!0 thiss!1090 (_2!3501 lt!123444)))))

(declare-fun b!77036 () Bool)

(declare-fun e!50531 () Bool)

(assert (=> b!77036 (= e!50531 (not true))))

(declare-datatypes ((tuple2!6736 0))(
  ( (tuple2!6737 (_1!3502 BitStream!2558) (_2!3502 BitStream!2558)) )
))
(declare-fun lt!123440 () tuple2!6736)

(declare-fun reader!0 (BitStream!2558 BitStream!2558) tuple2!6736)

(assert (=> b!77036 (= lt!123440 (reader!0 thiss!1090 (_2!3501 lt!123444)))))

(declare-fun lt!123437 () Bool)

(assert (=> b!77036 (= lt!123437 (isPrefixOf!0 thiss!1090 (_2!3501 lt!123444)))))

(declare-fun lt!123438 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77036 (= lt!123438 (bitIndex!0 (size!1492 (buf!1882 (_2!3501 lt!123444))) (currentByte!3693 (_2!3501 lt!123444)) (currentBit!3688 (_2!3501 lt!123444))))))

(declare-fun lt!123443 () (_ BitVec 64))

(assert (=> b!77036 (= lt!123443 (bitIndex!0 (size!1492 (buf!1882 thiss!1090)) (currentByte!3693 thiss!1090) (currentBit!3688 thiss!1090)))))

(assert (=> b!77036 e!50530))

(declare-fun res!63651 () Bool)

(assert (=> b!77036 (=> (not res!63651) (not e!50530))))

(assert (=> b!77036 (= res!63651 (= (size!1492 (buf!1882 thiss!1090)) (size!1492 (buf!1882 (_2!3501 lt!123444)))))))

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun appendNBits!0 (BitStream!2558 (_ BitVec 64) Bool) tuple2!6734)

(assert (=> b!77036 (= lt!123444 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun b!77037 () Bool)

(declare-datatypes ((tuple2!6738 0))(
  ( (tuple2!6739 (_1!3503 BitStream!2558) (_2!3503 Bool)) )
))
(declare-fun lt!123441 () tuple2!6738)

(declare-fun lt!123439 () tuple2!6736)

(assert (=> b!77037 (= e!50530 (not (or (not (_2!3503 lt!123441)) (not (= (_1!3503 lt!123441) (_2!3502 lt!123439))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2558 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6738)

(assert (=> b!77037 (= lt!123441 (checkBitsLoopPure!0 (_1!3502 lt!123439) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77037 (validate_offset_bits!1 ((_ sign_extend 32) (size!1492 (buf!1882 (_2!3501 lt!123444)))) ((_ sign_extend 32) (currentByte!3693 thiss!1090)) ((_ sign_extend 32) (currentBit!3688 thiss!1090)) nBits!322)))

(declare-fun lt!123442 () Unit!5075)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2558 array!3210 (_ BitVec 64)) Unit!5075)

(assert (=> b!77037 (= lt!123442 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1882 (_2!3501 lt!123444)) nBits!322))))

(assert (=> b!77037 (= lt!123439 (reader!0 thiss!1090 (_2!3501 lt!123444)))))

(declare-fun b!77038 () Bool)

(declare-fun e!50532 () Bool)

(declare-fun array_inv!1338 (array!3210) Bool)

(assert (=> b!77038 (= e!50532 (array_inv!1338 (buf!1882 thiss!1090)))))

(declare-fun b!77039 () Bool)

(declare-fun res!63653 () Bool)

(assert (=> b!77039 (=> (not res!63653) (not e!50530))))

(assert (=> b!77039 (= res!63653 (= (bitIndex!0 (size!1492 (buf!1882 (_2!3501 lt!123444))) (currentByte!3693 (_2!3501 lt!123444)) (currentBit!3688 (_2!3501 lt!123444))) (bvadd (bitIndex!0 (size!1492 (buf!1882 thiss!1090)) (currentByte!3693 thiss!1090) (currentBit!3688 thiss!1090)) nBits!322)))))

(declare-fun res!63654 () Bool)

(assert (=> start!15048 (=> (not res!63654) (not e!50531))))

(assert (=> start!15048 (= res!63654 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15048 e!50531))

(assert (=> start!15048 true))

(declare-fun inv!12 (BitStream!2558) Bool)

(assert (=> start!15048 (and (inv!12 thiss!1090) e!50532)))

(declare-fun b!77040 () Bool)

(declare-fun res!63655 () Bool)

(assert (=> b!77040 (=> (not res!63655) (not e!50531))))

(assert (=> b!77040 (= res!63655 (validate_offset_bits!1 ((_ sign_extend 32) (size!1492 (buf!1882 thiss!1090))) ((_ sign_extend 32) (currentByte!3693 thiss!1090)) ((_ sign_extend 32) (currentBit!3688 thiss!1090)) nBits!322))))

(assert (= (and start!15048 res!63654) b!77040))

(assert (= (and b!77040 res!63655) b!77036))

(assert (= (and b!77036 res!63651) b!77039))

(assert (= (and b!77039 res!63653) b!77035))

(assert (= (and b!77035 res!63652) b!77037))

(assert (= start!15048 b!77038))

(declare-fun m!122413 () Bool)

(assert (=> b!77036 m!122413))

(declare-fun m!122415 () Bool)

(assert (=> b!77036 m!122415))

(declare-fun m!122417 () Bool)

(assert (=> b!77036 m!122417))

(declare-fun m!122419 () Bool)

(assert (=> b!77036 m!122419))

(declare-fun m!122421 () Bool)

(assert (=> b!77036 m!122421))

(assert (=> b!77039 m!122417))

(assert (=> b!77039 m!122413))

(declare-fun m!122423 () Bool)

(assert (=> b!77040 m!122423))

(declare-fun m!122425 () Bool)

(assert (=> b!77038 m!122425))

(declare-fun m!122427 () Bool)

(assert (=> b!77037 m!122427))

(declare-fun m!122429 () Bool)

(assert (=> b!77037 m!122429))

(declare-fun m!122431 () Bool)

(assert (=> b!77037 m!122431))

(assert (=> b!77037 m!122415))

(declare-fun m!122433 () Bool)

(assert (=> start!15048 m!122433))

(assert (=> b!77035 m!122421))

(push 1)

(assert (not b!77035))

(assert (not b!77039))

(assert (not b!77036))

(assert (not b!77037))

(assert (not b!77040))

(assert (not b!77038))

(assert (not start!15048))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

