; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19550 () Bool)

(assert start!19550)

(declare-fun b!97464 () Bool)

(declare-fun res!79966 () Bool)

(declare-fun e!63851 () Bool)

(assert (=> b!97464 (=> (not res!79966) (not e!63851))))

(declare-datatypes ((array!4554 0))(
  ( (array!4555 (arr!2674 (Array (_ BitVec 32) (_ BitVec 8))) (size!2081 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3636 0))(
  ( (BitStream!3637 (buf!2429 array!4554) (currentByte!4850 (_ BitVec 32)) (currentBit!4845 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3636)

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!97464 (= res!79966 (validate_offset_bits!1 ((_ sign_extend 32) (size!2081 (buf!2429 thiss!1288))) ((_ sign_extend 32) (currentByte!4850 thiss!1288)) ((_ sign_extend 32) (currentBit!4845 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun res!79963 () Bool)

(assert (=> start!19550 (=> (not res!79963) (not e!63851))))

(assert (=> start!19550 (= res!79963 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19550 e!63851))

(assert (=> start!19550 true))

(declare-fun e!63852 () Bool)

(declare-fun inv!12 (BitStream!3636) Bool)

(assert (=> start!19550 (and (inv!12 thiss!1288) e!63852)))

(declare-fun b!97465 () Bool)

(declare-fun res!79965 () Bool)

(declare-fun e!63849 () Bool)

(assert (=> b!97465 (=> (not res!79965) (not e!63849))))

(declare-datatypes ((Unit!5932 0))(
  ( (Unit!5933) )
))
(declare-datatypes ((tuple2!7800 0))(
  ( (tuple2!7801 (_1!4152 Unit!5932) (_2!4152 BitStream!3636)) )
))
(declare-fun lt!141268 () tuple2!7800)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97465 (= res!79965 (= (bitIndex!0 (size!2081 (buf!2429 (_2!4152 lt!141268))) (currentByte!4850 (_2!4152 lt!141268)) (currentBit!4845 (_2!4152 lt!141268))) (bvadd (bitIndex!0 (size!2081 (buf!2429 thiss!1288)) (currentByte!4850 thiss!1288) (currentBit!4845 thiss!1288)) ((_ sign_extend 32) nBits!388))))))

(declare-fun b!97466 () Bool)

(assert (=> b!97466 (= e!63849 false)))

(declare-fun lt!141267 () Bool)

(declare-fun isPrefixOf!0 (BitStream!3636 BitStream!3636) Bool)

(assert (=> b!97466 (= lt!141267 (isPrefixOf!0 thiss!1288 (_2!4152 lt!141268)))))

(declare-fun b!97467 () Bool)

(declare-fun array_inv!1883 (array!4554) Bool)

(assert (=> b!97467 (= e!63852 (array_inv!1883 (buf!2429 thiss!1288)))))

(declare-fun b!97468 () Bool)

(assert (=> b!97468 (= e!63851 e!63849)))

(declare-fun res!79964 () Bool)

(assert (=> b!97468 (=> (not res!79964) (not e!63849))))

(assert (=> b!97468 (= res!79964 (= (size!2081 (buf!2429 thiss!1288)) (size!2081 (buf!2429 (_2!4152 lt!141268)))))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3636 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7800)

(assert (=> b!97468 (= lt!141268 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(declare-fun b!97469 () Bool)

(declare-fun res!79967 () Bool)

(assert (=> b!97469 (=> (not res!79967) (not e!63851))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97469 (= res!79967 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(assert (= (and start!19550 res!79963) b!97464))

(assert (= (and b!97464 res!79966) b!97469))

(assert (= (and b!97469 res!79967) b!97468))

(assert (= (and b!97468 res!79964) b!97465))

(assert (= (and b!97465 res!79965) b!97466))

(assert (= start!19550 b!97467))

(declare-fun m!141749 () Bool)

(assert (=> b!97466 m!141749))

(declare-fun m!141751 () Bool)

(assert (=> b!97468 m!141751))

(declare-fun m!141753 () Bool)

(assert (=> b!97465 m!141753))

(declare-fun m!141755 () Bool)

(assert (=> b!97465 m!141755))

(declare-fun m!141757 () Bool)

(assert (=> b!97467 m!141757))

(declare-fun m!141759 () Bool)

(assert (=> start!19550 m!141759))

(declare-fun m!141761 () Bool)

(assert (=> b!97464 m!141761))

(declare-fun m!141763 () Bool)

(assert (=> b!97469 m!141763))

(check-sat (not b!97464) (not b!97467) (not b!97469) (not b!97466) (not b!97465) (not start!19550) (not b!97468))
