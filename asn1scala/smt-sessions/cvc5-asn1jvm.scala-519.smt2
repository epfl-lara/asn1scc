; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15200 () Bool)

(assert start!15200)

(declare-fun res!64210 () Bool)

(declare-fun e!50927 () Bool)

(assert (=> start!15200 (=> (not res!64210) (not e!50927))))

(declare-fun nBits!322 () (_ BitVec 64))

(assert (=> start!15200 (= res!64210 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15200 e!50927))

(assert (=> start!15200 true))

(declare-datatypes ((array!3260 0))(
  ( (array!3261 (arr!2115 (Array (_ BitVec 32) (_ BitVec 8))) (size!1514 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2602 0))(
  ( (BitStream!2603 (buf!1910 array!3260) (currentByte!3727 (_ BitVec 32)) (currentBit!3722 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2602)

(declare-fun e!50926 () Bool)

(declare-fun inv!12 (BitStream!2602) Bool)

(assert (=> start!15200 (and (inv!12 thiss!1090) e!50926)))

(declare-fun b!77695 () Bool)

(assert (=> b!77695 (= e!50927 (not true))))

(declare-datatypes ((tuple2!6878 0))(
  ( (tuple2!6879 (_1!3573 BitStream!2602) (_2!3573 BitStream!2602)) )
))
(declare-fun lt!124626 () tuple2!6878)

(declare-datatypes ((Unit!5125 0))(
  ( (Unit!5126) )
))
(declare-datatypes ((tuple2!6880 0))(
  ( (tuple2!6881 (_1!3574 Unit!5125) (_2!3574 BitStream!2602)) )
))
(declare-fun lt!124622 () tuple2!6880)

(declare-fun reader!0 (BitStream!2602 BitStream!2602) tuple2!6878)

(assert (=> b!77695 (= lt!124626 (reader!0 thiss!1090 (_2!3574 lt!124622)))))

(declare-fun lt!124627 () Bool)

(declare-fun isPrefixOf!0 (BitStream!2602 BitStream!2602) Bool)

(assert (=> b!77695 (= lt!124627 (isPrefixOf!0 thiss!1090 (_2!3574 lt!124622)))))

(declare-fun lt!124624 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77695 (= lt!124624 (bitIndex!0 (size!1514 (buf!1910 (_2!3574 lt!124622))) (currentByte!3727 (_2!3574 lt!124622)) (currentBit!3722 (_2!3574 lt!124622))))))

(declare-fun lt!124629 () (_ BitVec 64))

(assert (=> b!77695 (= lt!124629 (bitIndex!0 (size!1514 (buf!1910 thiss!1090)) (currentByte!3727 thiss!1090) (currentBit!3722 thiss!1090)))))

(declare-fun e!50928 () Bool)

(assert (=> b!77695 e!50928))

(declare-fun res!64213 () Bool)

(assert (=> b!77695 (=> (not res!64213) (not e!50928))))

(assert (=> b!77695 (= res!64213 (= (size!1514 (buf!1910 thiss!1090)) (size!1514 (buf!1910 (_2!3574 lt!124622)))))))

(declare-fun appendNBits!0 (BitStream!2602 (_ BitVec 64) Bool) tuple2!6880)

(assert (=> b!77695 (= lt!124622 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun b!77696 () Bool)

(declare-fun res!64211 () Bool)

(assert (=> b!77696 (=> (not res!64211) (not e!50927))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77696 (= res!64211 (validate_offset_bits!1 ((_ sign_extend 32) (size!1514 (buf!1910 thiss!1090))) ((_ sign_extend 32) (currentByte!3727 thiss!1090)) ((_ sign_extend 32) (currentBit!3722 thiss!1090)) nBits!322))))

(declare-fun b!77697 () Bool)

(declare-fun array_inv!1360 (array!3260) Bool)

(assert (=> b!77697 (= e!50926 (array_inv!1360 (buf!1910 thiss!1090)))))

(declare-fun b!77698 () Bool)

(declare-fun res!64212 () Bool)

(assert (=> b!77698 (=> (not res!64212) (not e!50928))))

(assert (=> b!77698 (= res!64212 (isPrefixOf!0 thiss!1090 (_2!3574 lt!124622)))))

(declare-fun b!77699 () Bool)

(declare-fun res!64209 () Bool)

(assert (=> b!77699 (=> (not res!64209) (not e!50928))))

(assert (=> b!77699 (= res!64209 (= (bitIndex!0 (size!1514 (buf!1910 (_2!3574 lt!124622))) (currentByte!3727 (_2!3574 lt!124622)) (currentBit!3722 (_2!3574 lt!124622))) (bvadd (bitIndex!0 (size!1514 (buf!1910 thiss!1090)) (currentByte!3727 thiss!1090) (currentBit!3722 thiss!1090)) nBits!322)))))

(declare-fun b!77700 () Bool)

(declare-datatypes ((tuple2!6882 0))(
  ( (tuple2!6883 (_1!3575 BitStream!2602) (_2!3575 Bool)) )
))
(declare-fun lt!124623 () tuple2!6882)

(declare-fun lt!124625 () tuple2!6878)

(assert (=> b!77700 (= e!50928 (not (or (not (_2!3575 lt!124623)) (not (= (_1!3575 lt!124623) (_2!3573 lt!124625))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2602 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6882)

(assert (=> b!77700 (= lt!124623 (checkBitsLoopPure!0 (_1!3573 lt!124625) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!77700 (validate_offset_bits!1 ((_ sign_extend 32) (size!1514 (buf!1910 (_2!3574 lt!124622)))) ((_ sign_extend 32) (currentByte!3727 thiss!1090)) ((_ sign_extend 32) (currentBit!3722 thiss!1090)) nBits!322)))

(declare-fun lt!124628 () Unit!5125)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2602 array!3260 (_ BitVec 64)) Unit!5125)

(assert (=> b!77700 (= lt!124628 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1910 (_2!3574 lt!124622)) nBits!322))))

(assert (=> b!77700 (= lt!124625 (reader!0 thiss!1090 (_2!3574 lt!124622)))))

(assert (= (and start!15200 res!64210) b!77696))

(assert (= (and b!77696 res!64211) b!77695))

(assert (= (and b!77695 res!64213) b!77699))

(assert (= (and b!77699 res!64209) b!77698))

(assert (= (and b!77698 res!64212) b!77700))

(assert (= start!15200 b!77697))

(declare-fun m!123269 () Bool)

(assert (=> b!77698 m!123269))

(declare-fun m!123271 () Bool)

(assert (=> b!77696 m!123271))

(declare-fun m!123273 () Bool)

(assert (=> b!77699 m!123273))

(declare-fun m!123275 () Bool)

(assert (=> b!77699 m!123275))

(declare-fun m!123277 () Bool)

(assert (=> b!77700 m!123277))

(declare-fun m!123279 () Bool)

(assert (=> b!77700 m!123279))

(declare-fun m!123281 () Bool)

(assert (=> b!77700 m!123281))

(declare-fun m!123283 () Bool)

(assert (=> b!77700 m!123283))

(assert (=> b!77695 m!123283))

(assert (=> b!77695 m!123269))

(declare-fun m!123285 () Bool)

(assert (=> b!77695 m!123285))

(assert (=> b!77695 m!123273))

(assert (=> b!77695 m!123275))

(declare-fun m!123287 () Bool)

(assert (=> b!77697 m!123287))

(declare-fun m!123289 () Bool)

(assert (=> start!15200 m!123289))

(push 1)

(assert (not b!77699))

(assert (not start!15200))

(assert (not b!77695))

(assert (not b!77698))

(assert (not b!77696))

(assert (not b!77700))

(assert (not b!77697))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

