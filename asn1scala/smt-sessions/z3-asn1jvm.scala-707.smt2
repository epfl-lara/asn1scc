; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19902 () Bool)

(assert start!19902)

(declare-fun res!81272 () Bool)

(declare-fun e!64844 () Bool)

(assert (=> start!19902 (=> (not res!81272) (not e!64844))))

(declare-datatypes ((array!4652 0))(
  ( (array!4653 (arr!2716 (Array (_ BitVec 32) (_ BitVec 8))) (size!2123 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3720 0))(
  ( (BitStream!3721 (buf!2480 array!4652) (currentByte!4920 (_ BitVec 32)) (currentBit!4915 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3720)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> start!19902 (= res!81272 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!2123 (buf!2480 thiss!1305))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4920 thiss!1305)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4915 thiss!1305)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!2123 (buf!2480 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4920 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4915 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!19902 e!64844))

(assert (=> start!19902 true))

(declare-fun e!64843 () Bool)

(declare-fun inv!12 (BitStream!3720) Bool)

(assert (=> start!19902 (and (inv!12 thiss!1305) e!64843)))

(declare-fun b!99096 () Bool)

(declare-fun res!81271 () Bool)

(assert (=> b!99096 (=> (not res!81271) (not e!64844))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!99096 (= res!81271 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4915 thiss!1305))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4920 thiss!1305))) ((_ extract 31 0) ((_ sign_extend 32) (size!2123 (buf!2480 thiss!1305))))))))

(declare-fun b!99097 () Bool)

(assert (=> b!99097 (= e!64844 (bvslt ((_ sign_extend 32) (bvsub nBits!396 i!615)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!99098 () Bool)

(declare-fun array_inv!1925 (array!4652) Bool)

(assert (=> b!99098 (= e!64843 (array_inv!1925 (buf!2480 thiss!1305)))))

(assert (= (and start!19902 res!81272) b!99096))

(assert (= (and b!99096 res!81271) b!99097))

(assert (= start!19902 b!99098))

(declare-fun m!144535 () Bool)

(assert (=> start!19902 m!144535))

(declare-fun m!144537 () Bool)

(assert (=> b!99096 m!144537))

(declare-fun m!144539 () Bool)

(assert (=> b!99098 m!144539))

(check-sat (not start!19902) (not b!99096) (not b!99098))
(check-sat)
