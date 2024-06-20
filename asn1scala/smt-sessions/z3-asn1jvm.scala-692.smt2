; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19508 () Bool)

(assert start!19508)

(declare-fun b!97297 () Bool)

(declare-fun e!63754 () Bool)

(declare-datatypes ((array!4545 0))(
  ( (array!4546 (arr!2671 (Array (_ BitVec 32) (_ BitVec 8))) (size!2078 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3630 0))(
  ( (BitStream!3631 (buf!2426 array!4545) (currentByte!4841 (_ BitVec 32)) (currentBit!4836 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3630)

(declare-fun array_inv!1880 (array!4545) Bool)

(assert (=> b!97297 (= e!63754 (array_inv!1880 (buf!2426 thiss!1288)))))

(declare-fun res!79841 () Bool)

(declare-fun e!63756 () Bool)

(assert (=> start!19508 (=> (not res!79841) (not e!63756))))

(declare-fun nBits!388 () (_ BitVec 32))

(assert (=> start!19508 (= res!79841 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19508 e!63756))

(assert (=> start!19508 true))

(declare-fun inv!12 (BitStream!3630) Bool)

(assert (=> start!19508 (and (inv!12 thiss!1288) e!63754)))

(declare-fun b!97298 () Bool)

(declare-fun res!79844 () Bool)

(assert (=> b!97298 (=> (not res!79844) (not e!63756))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!97298 (= res!79844 (validate_offset_bits!1 ((_ sign_extend 32) (size!2078 (buf!2426 thiss!1288))) ((_ sign_extend 32) (currentByte!4841 thiss!1288)) ((_ sign_extend 32) (currentBit!4836 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!97299 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!97299 (= e!63756 (not (invariant!0 (currentBit!4836 thiss!1288) (currentByte!4841 thiss!1288) (size!2078 (buf!2426 thiss!1288)))))))

(declare-fun b!97300 () Bool)

(declare-fun res!79842 () Bool)

(assert (=> b!97300 (=> (not res!79842) (not e!63756))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97300 (= res!79842 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun b!97301 () Bool)

(declare-fun res!79843 () Bool)

(assert (=> b!97301 (=> (not res!79843) (not e!63756))))

(declare-datatypes ((Unit!5914 0))(
  ( (Unit!5915) )
))
(declare-datatypes ((tuple2!7782 0))(
  ( (tuple2!7783 (_1!4143 Unit!5914) (_2!4143 BitStream!3630)) )
))
(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3630 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7782)

(assert (=> b!97301 (= res!79843 (= (size!2078 (buf!2426 thiss!1288)) (size!2078 (buf!2426 (_2!4143 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))))))

(assert (= (and start!19508 res!79841) b!97298))

(assert (= (and b!97298 res!79844) b!97300))

(assert (= (and b!97300 res!79842) b!97301))

(assert (= (and b!97301 res!79843) b!97299))

(assert (= start!19508 b!97297))

(declare-fun m!141451 () Bool)

(assert (=> b!97297 m!141451))

(declare-fun m!141453 () Bool)

(assert (=> start!19508 m!141453))

(declare-fun m!141455 () Bool)

(assert (=> b!97300 m!141455))

(declare-fun m!141457 () Bool)

(assert (=> b!97299 m!141457))

(declare-fun m!141459 () Bool)

(assert (=> b!97298 m!141459))

(declare-fun m!141461 () Bool)

(assert (=> b!97301 m!141461))

(check-sat (not b!97301) (not b!97298) (not b!97299) (not start!19508) (not b!97297) (not b!97300))
(check-sat)
(get-model)

(declare-fun b!97421 () Bool)

(declare-fun e!63823 () (_ BitVec 64))

(assert (=> b!97421 (= e!63823 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!97422 () Bool)

(declare-fun res!79930 () Bool)

(declare-fun e!63826 () Bool)

(assert (=> b!97422 (=> (not res!79930) (not e!63826))))

(declare-fun lt!141231 () (_ BitVec 64))

(declare-fun lt!141213 () (_ BitVec 64))

(declare-fun lt!141254 () tuple2!7782)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97422 (= res!79930 (= (bitIndex!0 (size!2078 (buf!2426 (_2!4143 lt!141254))) (currentByte!4841 (_2!4143 lt!141254)) (currentBit!4836 (_2!4143 lt!141254))) (bvadd lt!141213 lt!141231)))))

(assert (=> b!97422 (or (not (= (bvand lt!141213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!141231 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!141213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!141213 lt!141231) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97422 (= lt!141231 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(assert (=> b!97422 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!97422 (= lt!141213 (bitIndex!0 (size!2078 (buf!2426 thiss!1288)) (currentByte!4841 thiss!1288) (currentBit!4836 thiss!1288)))))

(declare-fun d!30644 () Bool)

(assert (=> d!30644 e!63826))

(declare-fun res!79937 () Bool)

(assert (=> d!30644 (=> (not res!79937) (not e!63826))))

(assert (=> d!30644 (= res!79937 (= (size!2078 (buf!2426 thiss!1288)) (size!2078 (buf!2426 (_2!4143 lt!141254)))))))

(declare-fun e!63828 () tuple2!7782)

(assert (=> d!30644 (= lt!141254 e!63828)))

(declare-fun c!6169 () Bool)

(assert (=> d!30644 (= c!6169 (bvslt #b00000000000000000000000000000000 nBits!388))))

(assert (=> d!30644 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!388) (bvsle nBits!388 #b00000000000000000000000001000000))))

(assert (=> d!30644 (= (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000) lt!141254)))

(declare-fun b!97423 () Bool)

(declare-fun res!79933 () Bool)

(declare-fun lt!141233 () tuple2!7782)

(assert (=> b!97423 (= res!79933 (= (bitIndex!0 (size!2078 (buf!2426 (_2!4143 lt!141233))) (currentByte!4841 (_2!4143 lt!141233)) (currentBit!4836 (_2!4143 lt!141233))) (bvadd (bitIndex!0 (size!2078 (buf!2426 thiss!1288)) (currentByte!4841 thiss!1288) (currentBit!4836 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

