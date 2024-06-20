; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17466 () Bool)

(assert start!17466)

(declare-fun res!69097 () Bool)

(declare-fun e!56272 () Bool)

(assert (=> start!17466 (=> (not res!69097) (not e!56272))))

(declare-fun nBits!333 () (_ BitVec 32))

(assert (=> start!17466 (= res!69097 (and (bvsge nBits!333 #b00000000000000000000000000000000) (bvsle nBits!333 #b00000000000000000000000001000000)))))

(assert (=> start!17466 e!56272))

(assert (=> start!17466 true))

(declare-datatypes ((array!3983 0))(
  ( (array!3984 (arr!2440 (Array (_ BitVec 32) (_ BitVec 8))) (size!1803 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3168 0))(
  ( (BitStream!3169 (buf!2193 array!3983) (currentByte!4351 (_ BitVec 32)) (currentBit!4346 (_ BitVec 32))) )
))
(declare-fun thiss!1136 () BitStream!3168)

(declare-fun e!56274 () Bool)

(declare-fun inv!12 (BitStream!3168) Bool)

(assert (=> start!17466 (and (inv!12 thiss!1136) e!56274)))

(declare-fun b!84165 () Bool)

(declare-fun res!69099 () Bool)

(assert (=> b!84165 (=> (not res!69099) (not e!56272))))

(assert (=> b!84165 (= res!69099 (bvslt #b00000000000000000000000000000000 nBits!333))))

(declare-fun b!84166 () Bool)

(declare-fun res!69098 () Bool)

(assert (=> b!84166 (=> (not res!69098) (not e!56272))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!84166 (= res!69098 (validate_offset_bits!1 ((_ sign_extend 32) (size!1803 (buf!2193 thiss!1136))) ((_ sign_extend 32) (currentByte!4351 thiss!1136)) ((_ sign_extend 32) (currentBit!4346 thiss!1136)) ((_ sign_extend 32) nBits!333)))))

(declare-fun b!84167 () Bool)

(assert (=> b!84167 (= e!56272 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!1803 (buf!2193 thiss!1136))) ((_ sign_extend 32) (currentByte!4351 thiss!1136)) ((_ sign_extend 32) (currentBit!4346 thiss!1136)) ((_ sign_extend 32) nBits!333))))))

(declare-fun lt!134166 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!84167 (= lt!134166 (bitIndex!0 (size!1803 (buf!2193 thiss!1136)) (currentByte!4351 thiss!1136) (currentBit!4346 thiss!1136)))))

(declare-fun b!84168 () Bool)

(declare-fun array_inv!1649 (array!3983) Bool)

(assert (=> b!84168 (= e!56274 (array_inv!1649 (buf!2193 thiss!1136)))))

(declare-fun b!84169 () Bool)

(declare-fun res!69100 () Bool)

(assert (=> b!84169 (=> (not res!69100) (not e!56272))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!84169 (= res!69100 (invariant!0 (currentBit!4346 thiss!1136) (currentByte!4351 thiss!1136) (size!1803 (buf!2193 thiss!1136))))))

(assert (= (and start!17466 res!69097) b!84166))

(assert (= (and b!84166 res!69098) b!84169))

(assert (= (and b!84169 res!69100) b!84165))

(assert (= (and b!84165 res!69099) b!84167))

(assert (= start!17466 b!84168))

(declare-fun m!130857 () Bool)

(assert (=> b!84167 m!130857))

(declare-fun m!130859 () Bool)

(assert (=> b!84167 m!130859))

(declare-fun m!130861 () Bool)

(assert (=> b!84168 m!130861))

(declare-fun m!130863 () Bool)

(assert (=> start!17466 m!130863))

(declare-fun m!130865 () Bool)

(assert (=> b!84169 m!130865))

(assert (=> b!84166 m!130857))

(check-sat (not b!84168) (not b!84167) (not b!84169) (not b!84166) (not start!17466))
