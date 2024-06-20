; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15054 () Bool)

(assert start!15054)

(declare-fun res!63700 () Bool)

(declare-fun e!50567 () Bool)

(assert (=> start!15054 (=> (not res!63700) (not e!50567))))

(declare-fun nBits!322 () (_ BitVec 64))

(assert (=> start!15054 (= res!63700 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15054 e!50567))

(assert (=> start!15054 true))

(declare-datatypes ((array!3216 0))(
  ( (array!3217 (arr!2096 (Array (_ BitVec 32) (_ BitVec 8))) (size!1495 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2564 0))(
  ( (BitStream!2565 (buf!1885 array!3216) (currentByte!3696 (_ BitVec 32)) (currentBit!3691 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2564)

(declare-fun e!50566 () Bool)

(declare-fun inv!12 (BitStream!2564) Bool)

(assert (=> start!15054 (and (inv!12 thiss!1090) e!50566)))

(declare-fun b!77089 () Bool)

(declare-fun array_inv!1341 (array!3216) Bool)

(assert (=> b!77089 (= e!50566 (array_inv!1341 (buf!1885 thiss!1090)))))

(declare-fun b!77090 () Bool)

(declare-fun e!50568 () Bool)

(declare-datatypes ((tuple2!6752 0))(
  ( (tuple2!6753 (_1!3510 BitStream!2564) (_2!3510 Bool)) )
))
(declare-fun lt!123513 () tuple2!6752)

(declare-datatypes ((tuple2!6754 0))(
  ( (tuple2!6755 (_1!3511 BitStream!2564) (_2!3511 BitStream!2564)) )
))
(declare-fun lt!123515 () tuple2!6754)

(assert (=> b!77090 (= e!50568 (not (or (not (_2!3510 lt!123513)) (not (= (_1!3510 lt!123513) (_2!3511 lt!123515))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2564 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6752)

(assert (=> b!77090 (= lt!123513 (checkBitsLoopPure!0 (_1!3511 lt!123515) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!5081 0))(
  ( (Unit!5082) )
))
(declare-datatypes ((tuple2!6756 0))(
  ( (tuple2!6757 (_1!3512 Unit!5081) (_2!3512 BitStream!2564)) )
))
(declare-fun lt!123509 () tuple2!6756)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77090 (validate_offset_bits!1 ((_ sign_extend 32) (size!1495 (buf!1885 (_2!3512 lt!123509)))) ((_ sign_extend 32) (currentByte!3696 thiss!1090)) ((_ sign_extend 32) (currentBit!3691 thiss!1090)) nBits!322)))

(declare-fun lt!123516 () Unit!5081)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2564 array!3216 (_ BitVec 64)) Unit!5081)

(assert (=> b!77090 (= lt!123516 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1885 (_2!3512 lt!123509)) nBits!322))))

(declare-fun reader!0 (BitStream!2564 BitStream!2564) tuple2!6754)

(assert (=> b!77090 (= lt!123515 (reader!0 thiss!1090 (_2!3512 lt!123509)))))

(declare-fun b!77091 () Bool)

(assert (=> b!77091 (= e!50567 (not true))))

(declare-fun lt!123510 () tuple2!6754)

(assert (=> b!77091 (= lt!123510 (reader!0 thiss!1090 (_2!3512 lt!123509)))))

(declare-fun lt!123512 () Bool)

(declare-fun isPrefixOf!0 (BitStream!2564 BitStream!2564) Bool)

(assert (=> b!77091 (= lt!123512 (isPrefixOf!0 thiss!1090 (_2!3512 lt!123509)))))

(declare-fun lt!123514 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77091 (= lt!123514 (bitIndex!0 (size!1495 (buf!1885 (_2!3512 lt!123509))) (currentByte!3696 (_2!3512 lt!123509)) (currentBit!3691 (_2!3512 lt!123509))))))

(declare-fun lt!123511 () (_ BitVec 64))

(assert (=> b!77091 (= lt!123511 (bitIndex!0 (size!1495 (buf!1885 thiss!1090)) (currentByte!3696 thiss!1090) (currentBit!3691 thiss!1090)))))

(assert (=> b!77091 e!50568))

(declare-fun res!63697 () Bool)

(assert (=> b!77091 (=> (not res!63697) (not e!50568))))

(assert (=> b!77091 (= res!63697 (= (size!1495 (buf!1885 thiss!1090)) (size!1495 (buf!1885 (_2!3512 lt!123509)))))))

(declare-fun appendNBits!0 (BitStream!2564 (_ BitVec 64) Bool) tuple2!6756)

(assert (=> b!77091 (= lt!123509 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun b!77092 () Bool)

(declare-fun res!63698 () Bool)

(assert (=> b!77092 (=> (not res!63698) (not e!50568))))

(assert (=> b!77092 (= res!63698 (= (bitIndex!0 (size!1495 (buf!1885 (_2!3512 lt!123509))) (currentByte!3696 (_2!3512 lt!123509)) (currentBit!3691 (_2!3512 lt!123509))) (bvadd (bitIndex!0 (size!1495 (buf!1885 thiss!1090)) (currentByte!3696 thiss!1090) (currentBit!3691 thiss!1090)) nBits!322)))))

(declare-fun b!77093 () Bool)

(declare-fun res!63699 () Bool)

(assert (=> b!77093 (=> (not res!63699) (not e!50567))))

(assert (=> b!77093 (= res!63699 (validate_offset_bits!1 ((_ sign_extend 32) (size!1495 (buf!1885 thiss!1090))) ((_ sign_extend 32) (currentByte!3696 thiss!1090)) ((_ sign_extend 32) (currentBit!3691 thiss!1090)) nBits!322))))

(declare-fun b!77094 () Bool)

(declare-fun res!63696 () Bool)

(assert (=> b!77094 (=> (not res!63696) (not e!50568))))

(assert (=> b!77094 (= res!63696 (isPrefixOf!0 thiss!1090 (_2!3512 lt!123509)))))

(assert (= (and start!15054 res!63700) b!77093))

(assert (= (and b!77093 res!63699) b!77091))

(assert (= (and b!77091 res!63697) b!77092))

(assert (= (and b!77092 res!63698) b!77094))

(assert (= (and b!77094 res!63696) b!77090))

(assert (= start!15054 b!77089))

(declare-fun m!122479 () Bool)

(assert (=> b!77093 m!122479))

(declare-fun m!122481 () Bool)

(assert (=> b!77094 m!122481))

(declare-fun m!122483 () Bool)

(assert (=> b!77092 m!122483))

(declare-fun m!122485 () Bool)

(assert (=> b!77092 m!122485))

(assert (=> b!77091 m!122483))

(assert (=> b!77091 m!122485))

(assert (=> b!77091 m!122481))

(declare-fun m!122487 () Bool)

(assert (=> b!77091 m!122487))

(declare-fun m!122489 () Bool)

(assert (=> b!77091 m!122489))

(declare-fun m!122491 () Bool)

(assert (=> b!77090 m!122491))

(declare-fun m!122493 () Bool)

(assert (=> b!77090 m!122493))

(declare-fun m!122495 () Bool)

(assert (=> b!77090 m!122495))

(assert (=> b!77090 m!122489))

(declare-fun m!122497 () Bool)

(assert (=> start!15054 m!122497))

(declare-fun m!122499 () Bool)

(assert (=> b!77089 m!122499))

(push 1)

(assert (not start!15054))

(assert (not b!77092))

(assert (not b!77093))

(assert (not b!77094))

(assert (not b!77091))

(assert (not b!77089))

(assert (not b!77090))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

