; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15196 () Bool)

(assert start!15196)

(declare-fun res!64180 () Bool)

(declare-fun e!50902 () Bool)

(assert (=> start!15196 (=> (not res!64180) (not e!50902))))

(declare-fun nBits!322 () (_ BitVec 64))

(assert (=> start!15196 (= res!64180 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15196 e!50902))

(assert (=> start!15196 true))

(declare-datatypes ((array!3256 0))(
  ( (array!3257 (arr!2113 (Array (_ BitVec 32) (_ BitVec 8))) (size!1512 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2598 0))(
  ( (BitStream!2599 (buf!1908 array!3256) (currentByte!3725 (_ BitVec 32)) (currentBit!3720 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2598)

(declare-fun e!50904 () Bool)

(declare-fun inv!12 (BitStream!2598) Bool)

(assert (=> start!15196 (and (inv!12 thiss!1090) e!50904)))

(declare-fun b!77659 () Bool)

(declare-fun array_inv!1358 (array!3256) Bool)

(assert (=> b!77659 (= e!50904 (array_inv!1358 (buf!1908 thiss!1090)))))

(declare-fun b!77660 () Bool)

(declare-fun res!64183 () Bool)

(assert (=> b!77660 (=> (not res!64183) (not e!50902))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77660 (= res!64183 (validate_offset_bits!1 ((_ sign_extend 32) (size!1512 (buf!1908 thiss!1090))) ((_ sign_extend 32) (currentByte!3725 thiss!1090)) ((_ sign_extend 32) (currentBit!3720 thiss!1090)) nBits!322))))

(declare-fun b!77661 () Bool)

(assert (=> b!77661 (= e!50902 (not true))))

(declare-datatypes ((tuple2!6866 0))(
  ( (tuple2!6867 (_1!3567 BitStream!2598) (_2!3567 BitStream!2598)) )
))
(declare-fun lt!124575 () tuple2!6866)

(declare-datatypes ((Unit!5121 0))(
  ( (Unit!5122) )
))
(declare-datatypes ((tuple2!6868 0))(
  ( (tuple2!6869 (_1!3568 Unit!5121) (_2!3568 BitStream!2598)) )
))
(declare-fun lt!124580 () tuple2!6868)

(declare-fun reader!0 (BitStream!2598 BitStream!2598) tuple2!6866)

(assert (=> b!77661 (= lt!124575 (reader!0 thiss!1090 (_2!3568 lt!124580)))))

(declare-fun lt!124574 () Bool)

(declare-fun isPrefixOf!0 (BitStream!2598 BitStream!2598) Bool)

(assert (=> b!77661 (= lt!124574 (isPrefixOf!0 thiss!1090 (_2!3568 lt!124580)))))

(declare-fun lt!124577 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77661 (= lt!124577 (bitIndex!0 (size!1512 (buf!1908 (_2!3568 lt!124580))) (currentByte!3725 (_2!3568 lt!124580)) (currentBit!3720 (_2!3568 lt!124580))))))

(declare-fun lt!124581 () (_ BitVec 64))

(assert (=> b!77661 (= lt!124581 (bitIndex!0 (size!1512 (buf!1908 thiss!1090)) (currentByte!3725 thiss!1090) (currentBit!3720 thiss!1090)))))

(declare-fun e!50903 () Bool)

(assert (=> b!77661 e!50903))

(declare-fun res!64181 () Bool)

(assert (=> b!77661 (=> (not res!64181) (not e!50903))))

(assert (=> b!77661 (= res!64181 (= (size!1512 (buf!1908 thiss!1090)) (size!1512 (buf!1908 (_2!3568 lt!124580)))))))

(declare-fun appendNBits!0 (BitStream!2598 (_ BitVec 64) Bool) tuple2!6868)

(assert (=> b!77661 (= lt!124580 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun b!77662 () Bool)

(declare-fun res!64179 () Bool)

(assert (=> b!77662 (=> (not res!64179) (not e!50903))))

(assert (=> b!77662 (= res!64179 (isPrefixOf!0 thiss!1090 (_2!3568 lt!124580)))))

(declare-fun b!77663 () Bool)

(declare-fun res!64182 () Bool)

(assert (=> b!77663 (=> (not res!64182) (not e!50903))))

(assert (=> b!77663 (= res!64182 (= (bitIndex!0 (size!1512 (buf!1908 (_2!3568 lt!124580))) (currentByte!3725 (_2!3568 lt!124580)) (currentBit!3720 (_2!3568 lt!124580))) (bvadd (bitIndex!0 (size!1512 (buf!1908 thiss!1090)) (currentByte!3725 thiss!1090) (currentBit!3720 thiss!1090)) nBits!322)))))

(declare-fun b!77664 () Bool)

(declare-datatypes ((tuple2!6870 0))(
  ( (tuple2!6871 (_1!3569 BitStream!2598) (_2!3569 Bool)) )
))
(declare-fun lt!124578 () tuple2!6870)

(declare-fun lt!124579 () tuple2!6866)

(assert (=> b!77664 (= e!50903 (not (or (not (_2!3569 lt!124578)) (not (= (_1!3569 lt!124578) (_2!3567 lt!124579))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2598 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6870)

(assert (=> b!77664 (= lt!124578 (checkBitsLoopPure!0 (_1!3567 lt!124579) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!77664 (validate_offset_bits!1 ((_ sign_extend 32) (size!1512 (buf!1908 (_2!3568 lt!124580)))) ((_ sign_extend 32) (currentByte!3725 thiss!1090)) ((_ sign_extend 32) (currentBit!3720 thiss!1090)) nBits!322)))

(declare-fun lt!124576 () Unit!5121)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2598 array!3256 (_ BitVec 64)) Unit!5121)

(assert (=> b!77664 (= lt!124576 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1908 (_2!3568 lt!124580)) nBits!322))))

(assert (=> b!77664 (= lt!124579 (reader!0 thiss!1090 (_2!3568 lt!124580)))))

(assert (= (and start!15196 res!64180) b!77660))

(assert (= (and b!77660 res!64183) b!77661))

(assert (= (and b!77661 res!64181) b!77663))

(assert (= (and b!77663 res!64182) b!77662))

(assert (= (and b!77662 res!64179) b!77664))

(assert (= start!15196 b!77659))

(declare-fun m!123225 () Bool)

(assert (=> b!77664 m!123225))

(declare-fun m!123227 () Bool)

(assert (=> b!77664 m!123227))

(declare-fun m!123229 () Bool)

(assert (=> b!77664 m!123229))

(declare-fun m!123231 () Bool)

(assert (=> b!77664 m!123231))

(declare-fun m!123233 () Bool)

(assert (=> b!77661 m!123233))

(declare-fun m!123235 () Bool)

(assert (=> b!77661 m!123235))

(assert (=> b!77661 m!123231))

(declare-fun m!123237 () Bool)

(assert (=> b!77661 m!123237))

(declare-fun m!123239 () Bool)

(assert (=> b!77661 m!123239))

(assert (=> b!77663 m!123233))

(assert (=> b!77663 m!123235))

(declare-fun m!123241 () Bool)

(assert (=> start!15196 m!123241))

(declare-fun m!123243 () Bool)

(assert (=> b!77659 m!123243))

(assert (=> b!77662 m!123237))

(declare-fun m!123245 () Bool)

(assert (=> b!77660 m!123245))

(check-sat (not b!77660) (not b!77662) (not b!77664) (not b!77663) (not start!15196) (not b!77661) (not b!77659))
