; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19688 () Bool)

(assert start!19688)

(declare-fun res!80632 () Bool)

(declare-fun e!64314 () Bool)

(assert (=> start!19688 (=> (not res!80632) (not e!64314))))

(declare-fun nBits!388 () (_ BitVec 32))

(assert (=> start!19688 (= res!80632 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19688 e!64314))

(assert (=> start!19688 true))

(declare-datatypes ((array!4608 0))(
  ( (array!4609 (arr!2698 (Array (_ BitVec 32) (_ BitVec 8))) (size!2105 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3684 0))(
  ( (BitStream!3685 (buf!2456 array!4608) (currentByte!4886 (_ BitVec 32)) (currentBit!4881 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3684)

(declare-fun e!64312 () Bool)

(declare-fun inv!12 (BitStream!3684) Bool)

(assert (=> start!19688 (and (inv!12 thiss!1288) e!64312)))

(declare-fun b!98294 () Bool)

(declare-fun e!64313 () Bool)

(assert (=> b!98294 (= e!64313 (bvslt ((_ sign_extend 32) nBits!388) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!7916 0))(
  ( (tuple2!7917 (_1!4210 BitStream!3684) (_2!4210 BitStream!3684)) )
))
(declare-fun lt!142554 () tuple2!7916)

(declare-datatypes ((Unit!6019 0))(
  ( (Unit!6020) )
))
(declare-datatypes ((tuple2!7918 0))(
  ( (tuple2!7919 (_1!4211 Unit!6019) (_2!4211 BitStream!3684)) )
))
(declare-fun lt!142555 () tuple2!7918)

(declare-fun reader!0 (BitStream!3684 BitStream!3684) tuple2!7916)

(assert (=> b!98294 (= lt!142554 (reader!0 thiss!1288 (_2!4211 lt!142555)))))

(declare-fun b!98295 () Bool)

(declare-fun res!80634 () Bool)

(assert (=> b!98295 (=> (not res!80634) (not e!64313))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!98295 (= res!80634 (= (bitIndex!0 (size!2105 (buf!2456 (_2!4211 lt!142555))) (currentByte!4886 (_2!4211 lt!142555)) (currentBit!4881 (_2!4211 lt!142555))) (bvadd (bitIndex!0 (size!2105 (buf!2456 thiss!1288)) (currentByte!4886 thiss!1288) (currentBit!4881 thiss!1288)) ((_ sign_extend 32) nBits!388))))))

(declare-fun b!98296 () Bool)

(assert (=> b!98296 (= e!64314 e!64313)))

(declare-fun res!80635 () Bool)

(assert (=> b!98296 (=> (not res!80635) (not e!64313))))

(assert (=> b!98296 (= res!80635 (= (size!2105 (buf!2456 thiss!1288)) (size!2105 (buf!2456 (_2!4211 lt!142555)))))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3684 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7918)

(assert (=> b!98296 (= lt!142555 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(declare-fun b!98297 () Bool)

(declare-fun res!80631 () Bool)

(assert (=> b!98297 (=> (not res!80631) (not e!64313))))

(declare-fun isPrefixOf!0 (BitStream!3684 BitStream!3684) Bool)

(assert (=> b!98297 (= res!80631 (isPrefixOf!0 thiss!1288 (_2!4211 lt!142555)))))

(declare-fun b!98298 () Bool)

(declare-fun res!80636 () Bool)

(assert (=> b!98298 (=> (not res!80636) (not e!64314))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!98298 (= res!80636 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun b!98299 () Bool)

(declare-fun res!80633 () Bool)

(assert (=> b!98299 (=> (not res!80633) (not e!64314))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!98299 (= res!80633 (validate_offset_bits!1 ((_ sign_extend 32) (size!2105 (buf!2456 thiss!1288))) ((_ sign_extend 32) (currentByte!4886 thiss!1288)) ((_ sign_extend 32) (currentBit!4881 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!98300 () Bool)

(declare-fun array_inv!1907 (array!4608) Bool)

(assert (=> b!98300 (= e!64312 (array_inv!1907 (buf!2456 thiss!1288)))))

(assert (= (and start!19688 res!80632) b!98299))

(assert (= (and b!98299 res!80633) b!98298))

(assert (= (and b!98298 res!80636) b!98296))

(assert (= (and b!98296 res!80635) b!98295))

(assert (= (and b!98295 res!80634) b!98297))

(assert (= (and b!98297 res!80631) b!98294))

(assert (= start!19688 b!98300))

(declare-fun m!142831 () Bool)

(assert (=> b!98296 m!142831))

(declare-fun m!142833 () Bool)

(assert (=> start!19688 m!142833))

(declare-fun m!142835 () Bool)

(assert (=> b!98300 m!142835))

(declare-fun m!142837 () Bool)

(assert (=> b!98295 m!142837))

(declare-fun m!142839 () Bool)

(assert (=> b!98295 m!142839))

(declare-fun m!142841 () Bool)

(assert (=> b!98298 m!142841))

(declare-fun m!142843 () Bool)

(assert (=> b!98294 m!142843))

(declare-fun m!142845 () Bool)

(assert (=> b!98297 m!142845))

(declare-fun m!142847 () Bool)

(assert (=> b!98299 m!142847))

(check-sat (not b!98294) (not b!98296) (not b!98300) (not b!98298) (not b!98295) (not b!98297) (not start!19688) (not b!98299))
(check-sat)
