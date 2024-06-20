; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15066 () Bool)

(assert start!15066)

(declare-fun b!77197 () Bool)

(declare-fun res!63789 () Bool)

(declare-fun e!50637 () Bool)

(assert (=> b!77197 (=> (not res!63789) (not e!50637))))

(declare-datatypes ((array!3228 0))(
  ( (array!3229 (arr!2102 (Array (_ BitVec 32) (_ BitVec 8))) (size!1501 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2576 0))(
  ( (BitStream!2577 (buf!1891 array!3228) (currentByte!3702 (_ BitVec 32)) (currentBit!3697 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2576)

(declare-datatypes ((Unit!5093 0))(
  ( (Unit!5094) )
))
(declare-datatypes ((tuple2!6788 0))(
  ( (tuple2!6789 (_1!3528 Unit!5093) (_2!3528 BitStream!2576)) )
))
(declare-fun lt!123667 () tuple2!6788)

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77197 (= res!63789 (= (bitIndex!0 (size!1501 (buf!1891 (_2!3528 lt!123667))) (currentByte!3702 (_2!3528 lt!123667)) (currentBit!3697 (_2!3528 lt!123667))) (bvadd (bitIndex!0 (size!1501 (buf!1891 thiss!1090)) (currentByte!3702 thiss!1090) (currentBit!3697 thiss!1090)) nBits!322)))))

(declare-fun res!63787 () Bool)

(declare-fun e!50638 () Bool)

(assert (=> start!15066 (=> (not res!63787) (not e!50638))))

(assert (=> start!15066 (= res!63787 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15066 e!50638))

(assert (=> start!15066 true))

(declare-fun e!50639 () Bool)

(declare-fun inv!12 (BitStream!2576) Bool)

(assert (=> start!15066 (and (inv!12 thiss!1090) e!50639)))

(declare-fun b!77198 () Bool)

(assert (=> b!77198 (= e!50638 (not true))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77198 (validate_offset_bits!1 ((_ sign_extend 32) (size!1501 (buf!1891 (_2!3528 lt!123667)))) ((_ sign_extend 32) (currentByte!3702 thiss!1090)) ((_ sign_extend 32) (currentBit!3697 thiss!1090)) nBits!322)))

(declare-fun lt!123666 () Unit!5093)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2576 array!3228 (_ BitVec 64)) Unit!5093)

(assert (=> b!77198 (= lt!123666 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1891 (_2!3528 lt!123667)) nBits!322))))

(declare-datatypes ((tuple2!6790 0))(
  ( (tuple2!6791 (_1!3529 BitStream!2576) (_2!3529 BitStream!2576)) )
))
(declare-fun lt!123662 () tuple2!6790)

(declare-fun reader!0 (BitStream!2576 BitStream!2576) tuple2!6790)

(assert (=> b!77198 (= lt!123662 (reader!0 thiss!1090 (_2!3528 lt!123667)))))

(declare-fun lt!123664 () Bool)

(declare-fun isPrefixOf!0 (BitStream!2576 BitStream!2576) Bool)

(assert (=> b!77198 (= lt!123664 (isPrefixOf!0 thiss!1090 (_2!3528 lt!123667)))))

(declare-fun lt!123661 () (_ BitVec 64))

(assert (=> b!77198 (= lt!123661 (bitIndex!0 (size!1501 (buf!1891 (_2!3528 lt!123667))) (currentByte!3702 (_2!3528 lt!123667)) (currentBit!3697 (_2!3528 lt!123667))))))

(declare-fun lt!123663 () (_ BitVec 64))

(assert (=> b!77198 (= lt!123663 (bitIndex!0 (size!1501 (buf!1891 thiss!1090)) (currentByte!3702 thiss!1090) (currentBit!3697 thiss!1090)))))

(assert (=> b!77198 e!50637))

(declare-fun res!63790 () Bool)

(assert (=> b!77198 (=> (not res!63790) (not e!50637))))

(assert (=> b!77198 (= res!63790 (= (size!1501 (buf!1891 thiss!1090)) (size!1501 (buf!1891 (_2!3528 lt!123667)))))))

(declare-fun appendNBits!0 (BitStream!2576 (_ BitVec 64) Bool) tuple2!6788)

(assert (=> b!77198 (= lt!123667 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun b!77199 () Bool)

(declare-fun res!63786 () Bool)

(assert (=> b!77199 (=> (not res!63786) (not e!50637))))

(assert (=> b!77199 (= res!63786 (isPrefixOf!0 thiss!1090 (_2!3528 lt!123667)))))

(declare-fun b!77200 () Bool)

(declare-datatypes ((tuple2!6792 0))(
  ( (tuple2!6793 (_1!3530 BitStream!2576) (_2!3530 Bool)) )
))
(declare-fun lt!123669 () tuple2!6792)

(declare-fun lt!123668 () tuple2!6790)

(assert (=> b!77200 (= e!50637 (not (or (not (_2!3530 lt!123669)) (not (= (_1!3530 lt!123669) (_2!3529 lt!123668))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2576 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6792)

(assert (=> b!77200 (= lt!123669 (checkBitsLoopPure!0 (_1!3529 lt!123668) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!77200 (validate_offset_bits!1 ((_ sign_extend 32) (size!1501 (buf!1891 (_2!3528 lt!123667)))) ((_ sign_extend 32) (currentByte!3702 thiss!1090)) ((_ sign_extend 32) (currentBit!3697 thiss!1090)) nBits!322)))

(declare-fun lt!123665 () Unit!5093)

(assert (=> b!77200 (= lt!123665 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1891 (_2!3528 lt!123667)) nBits!322))))

(assert (=> b!77200 (= lt!123668 (reader!0 thiss!1090 (_2!3528 lt!123667)))))

(declare-fun b!77201 () Bool)

(declare-fun array_inv!1347 (array!3228) Bool)

(assert (=> b!77201 (= e!50639 (array_inv!1347 (buf!1891 thiss!1090)))))

(declare-fun b!77202 () Bool)

(declare-fun res!63788 () Bool)

(assert (=> b!77202 (=> (not res!63788) (not e!50638))))

(assert (=> b!77202 (= res!63788 (validate_offset_bits!1 ((_ sign_extend 32) (size!1501 (buf!1891 thiss!1090))) ((_ sign_extend 32) (currentByte!3702 thiss!1090)) ((_ sign_extend 32) (currentBit!3697 thiss!1090)) nBits!322))))

(assert (= (and start!15066 res!63787) b!77202))

(assert (= (and b!77202 res!63788) b!77198))

(assert (= (and b!77198 res!63790) b!77197))

(assert (= (and b!77197 res!63789) b!77199))

(assert (= (and b!77199 res!63786) b!77200))

(assert (= start!15066 b!77201))

(declare-fun m!122611 () Bool)

(assert (=> b!77198 m!122611))

(declare-fun m!122613 () Bool)

(assert (=> b!77198 m!122613))

(declare-fun m!122615 () Bool)

(assert (=> b!77198 m!122615))

(declare-fun m!122617 () Bool)

(assert (=> b!77198 m!122617))

(declare-fun m!122619 () Bool)

(assert (=> b!77198 m!122619))

(declare-fun m!122621 () Bool)

(assert (=> b!77198 m!122621))

(declare-fun m!122623 () Bool)

(assert (=> b!77198 m!122623))

(declare-fun m!122625 () Bool)

(assert (=> start!15066 m!122625))

(declare-fun m!122627 () Bool)

(assert (=> b!77201 m!122627))

(declare-fun m!122629 () Bool)

(assert (=> b!77202 m!122629))

(assert (=> b!77197 m!122613))

(assert (=> b!77197 m!122611))

(assert (=> b!77199 m!122619))

(declare-fun m!122631 () Bool)

(assert (=> b!77200 m!122631))

(assert (=> b!77200 m!122623))

(assert (=> b!77200 m!122621))

(assert (=> b!77200 m!122615))

(push 1)

(assert (not b!77200))

(assert (not b!77198))

(assert (not b!77202))

(assert (not start!15066))

(assert (not b!77201))

