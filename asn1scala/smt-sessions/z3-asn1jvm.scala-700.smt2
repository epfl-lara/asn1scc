; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19682 () Bool)

(assert start!19682)

(declare-fun b!98231 () Bool)

(declare-fun res!80577 () Bool)

(declare-fun e!64276 () Bool)

(assert (=> b!98231 (=> (not res!80577) (not e!64276))))

(declare-datatypes ((array!4602 0))(
  ( (array!4603 (arr!2695 (Array (_ BitVec 32) (_ BitVec 8))) (size!2102 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3678 0))(
  ( (BitStream!3679 (buf!2453 array!4602) (currentByte!4883 (_ BitVec 32)) (currentBit!4878 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3678)

(declare-datatypes ((Unit!6013 0))(
  ( (Unit!6014) )
))
(declare-datatypes ((tuple2!7904 0))(
  ( (tuple2!7905 (_1!4204 Unit!6013) (_2!4204 BitStream!3678)) )
))
(declare-fun lt!142537 () tuple2!7904)

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!98231 (= res!80577 (= (bitIndex!0 (size!2102 (buf!2453 (_2!4204 lt!142537))) (currentByte!4883 (_2!4204 lt!142537)) (currentBit!4878 (_2!4204 lt!142537))) (bvadd (bitIndex!0 (size!2102 (buf!2453 thiss!1288)) (currentByte!4883 thiss!1288) (currentBit!4878 thiss!1288)) ((_ sign_extend 32) nBits!388))))))

(declare-fun b!98232 () Bool)

(assert (=> b!98232 (= e!64276 false)))

(declare-datatypes ((tuple2!7906 0))(
  ( (tuple2!7907 (_1!4205 BitStream!3678) (_2!4205 BitStream!3678)) )
))
(declare-fun lt!142536 () tuple2!7906)

(declare-fun reader!0 (BitStream!3678 BitStream!3678) tuple2!7906)

(assert (=> b!98232 (= lt!142536 (reader!0 thiss!1288 (_2!4204 lt!142537)))))

(declare-fun b!98233 () Bool)

(declare-fun e!64277 () Bool)

(assert (=> b!98233 (= e!64277 e!64276)))

(declare-fun res!80582 () Bool)

(assert (=> b!98233 (=> (not res!80582) (not e!64276))))

(assert (=> b!98233 (= res!80582 (= (size!2102 (buf!2453 thiss!1288)) (size!2102 (buf!2453 (_2!4204 lt!142537)))))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3678 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7904)

(assert (=> b!98233 (= lt!142537 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(declare-fun b!98234 () Bool)

(declare-fun res!80581 () Bool)

(assert (=> b!98234 (=> (not res!80581) (not e!64277))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!98234 (= res!80581 (validate_offset_bits!1 ((_ sign_extend 32) (size!2102 (buf!2453 thiss!1288))) ((_ sign_extend 32) (currentByte!4883 thiss!1288)) ((_ sign_extend 32) (currentBit!4878 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!98235 () Bool)

(declare-fun res!80579 () Bool)

(assert (=> b!98235 (=> (not res!80579) (not e!64276))))

(declare-fun isPrefixOf!0 (BitStream!3678 BitStream!3678) Bool)

(assert (=> b!98235 (= res!80579 (isPrefixOf!0 thiss!1288 (_2!4204 lt!142537)))))

(declare-fun b!98236 () Bool)

(declare-fun e!64275 () Bool)

(declare-fun array_inv!1904 (array!4602) Bool)

(assert (=> b!98236 (= e!64275 (array_inv!1904 (buf!2453 thiss!1288)))))

(declare-fun b!98237 () Bool)

(declare-fun res!80578 () Bool)

(assert (=> b!98237 (=> (not res!80578) (not e!64277))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!98237 (= res!80578 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun res!80580 () Bool)

(assert (=> start!19682 (=> (not res!80580) (not e!64277))))

(assert (=> start!19682 (= res!80580 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19682 e!64277))

(assert (=> start!19682 true))

(declare-fun inv!12 (BitStream!3678) Bool)

(assert (=> start!19682 (and (inv!12 thiss!1288) e!64275)))

(assert (= (and start!19682 res!80580) b!98234))

(assert (= (and b!98234 res!80581) b!98237))

(assert (= (and b!98237 res!80578) b!98233))

(assert (= (and b!98233 res!80582) b!98231))

(assert (= (and b!98231 res!80577) b!98235))

(assert (= (and b!98235 res!80579) b!98232))

(assert (= start!19682 b!98236))

(declare-fun m!142777 () Bool)

(assert (=> b!98231 m!142777))

(declare-fun m!142779 () Bool)

(assert (=> b!98231 m!142779))

(declare-fun m!142781 () Bool)

(assert (=> start!19682 m!142781))

(declare-fun m!142783 () Bool)

(assert (=> b!98233 m!142783))

(declare-fun m!142785 () Bool)

(assert (=> b!98237 m!142785))

(declare-fun m!142787 () Bool)

(assert (=> b!98232 m!142787))

(declare-fun m!142789 () Bool)

(assert (=> b!98236 m!142789))

(declare-fun m!142791 () Bool)

(assert (=> b!98235 m!142791))

(declare-fun m!142793 () Bool)

(assert (=> b!98234 m!142793))

(check-sat (not b!98234) (not b!98233) (not b!98231) (not b!98232) (not start!19682) (not b!98237) (not b!98235) (not b!98236))
