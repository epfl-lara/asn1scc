; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37646 () Bool)

(assert start!37646)

(declare-fun res!141731 () Bool)

(declare-fun e!119197 () Bool)

(assert (=> start!37646 (=> (not res!141731) (not e!119197))))

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(assert (=> start!37646 (= res!141731 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283)))))

(assert (=> start!37646 e!119197))

(assert (=> start!37646 true))

(declare-datatypes ((array!9057 0))(
  ( (array!9058 (arr!4940 (Array (_ BitVec 32) (_ BitVec 8))) (size!4010 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7158 0))(
  ( (BitStream!7159 (buf!4453 array!9057) (currentByte!8440 (_ BitVec 32)) (currentBit!8435 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7158)

(declare-fun e!119196 () Bool)

(declare-fun inv!12 (BitStream!7158) Bool)

(assert (=> start!37646 (and (inv!12 bs!64) e!119196)))

(declare-fun b!170806 () Bool)

(declare-fun res!141732 () Bool)

(assert (=> b!170806 (=> (not res!141732) (not e!119197))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!170806 (= res!141732 (validate_offset_bits!1 ((_ sign_extend 32) (size!4010 (buf!4453 bs!64))) ((_ sign_extend 32) (currentByte!8440 bs!64)) ((_ sign_extend 32) (currentBit!8435 bs!64)) (bvsub nBits!283 from!235)))))

(declare-fun b!170807 () Bool)

(assert (=> b!170807 (= e!119197 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsgt from!235 nBits!283)))))

(declare-fun b!170808 () Bool)

(declare-fun array_inv!3751 (array!9057) Bool)

(assert (=> b!170808 (= e!119196 (array_inv!3751 (buf!4453 bs!64)))))

(assert (= (and start!37646 res!141731) b!170806))

(assert (= (and b!170806 res!141732) b!170807))

(assert (= start!37646 b!170808))

(declare-fun m!269947 () Bool)

(assert (=> start!37646 m!269947))

(declare-fun m!269949 () Bool)

(assert (=> b!170806 m!269949))

(declare-fun m!269951 () Bool)

(assert (=> b!170808 m!269951))

(check-sat (not b!170808) (not b!170806) (not start!37646))
(check-sat)
