; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69108 () Bool)

(assert start!69108)

(declare-fun b!311224 () Bool)

(declare-fun e!223750 () Bool)

(declare-datatypes ((array!19005 0))(
  ( (array!19006 (arr!9326 (Array (_ BitVec 32) (_ BitVec 8))) (size!8246 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13596 0))(
  ( (BitStream!13597 (buf!7859 array!19005) (currentByte!14478 (_ BitVec 32)) (currentBit!14473 (_ BitVec 32))) )
))
(declare-fun b2!97 () BitStream!13596)

(declare-fun array_inv!7798 (array!19005) Bool)

(assert (=> b!311224 (= e!223750 (array_inv!7798 (buf!7859 b2!97)))))

(declare-fun b!311225 () Bool)

(declare-fun e!223751 () Bool)

(declare-fun b1!97 () BitStream!13596)

(assert (=> b!311225 (= e!223751 (array_inv!7798 (buf!7859 b1!97)))))

(declare-fun b!311226 () Bool)

(declare-fun res!254986 () Bool)

(declare-fun e!223754 () Bool)

(assert (=> b!311226 (=> (not res!254986) (not e!223754))))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311226 (= res!254986 (validate_offset_bits!1 ((_ sign_extend 32) (size!8246 (buf!7859 b1!97))) ((_ sign_extend 32) (currentByte!14478 b1!97)) ((_ sign_extend 32) (currentBit!14473 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun res!254984 () Bool)

(assert (=> start!69108 (=> (not res!254984) (not e!223754))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(assert (=> start!69108 (= res!254984 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8246 (buf!7859 b1!97)) (size!8246 (buf!7859 b2!97)))))))

(assert (=> start!69108 e!223754))

(assert (=> start!69108 true))

(declare-fun inv!12 (BitStream!13596) Bool)

(assert (=> start!69108 (and (inv!12 b1!97) e!223751)))

(assert (=> start!69108 (and (inv!12 b2!97) e!223750)))

(declare-fun b!311227 () Bool)

(declare-fun res!254985 () Bool)

(assert (=> b!311227 (=> (not res!254985) (not e!223754))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311227 (= res!254985 (bvsle (bitIndex!0 (size!8246 (buf!7859 b2!97)) (currentByte!14478 b2!97) (currentBit!14473 b2!97)) (bvadd (bitIndex!0 (size!8246 (buf!7859 b1!97)) (currentByte!14478 b1!97) (currentBit!14473 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!311228 () Bool)

(assert (=> b!311228 (= e!223754 (or (bvsgt ((_ sign_extend 32) (size!8246 (buf!7859 b1!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!14478 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!14473 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (= (and start!69108 res!254984) b!311226))

(assert (= (and b!311226 res!254986) b!311227))

(assert (= (and b!311227 res!254985) b!311228))

(assert (= start!69108 b!311225))

(assert (= start!69108 b!311224))

(declare-fun m!449119 () Bool)

(assert (=> b!311225 m!449119))

(declare-fun m!449121 () Bool)

(assert (=> b!311226 m!449121))

(declare-fun m!449123 () Bool)

(assert (=> start!69108 m!449123))

(declare-fun m!449125 () Bool)

(assert (=> start!69108 m!449125))

(declare-fun m!449127 () Bool)

(assert (=> b!311224 m!449127))

(declare-fun m!449129 () Bool)

(assert (=> b!311227 m!449129))

(declare-fun m!449131 () Bool)

(assert (=> b!311227 m!449131))

(check-sat (not b!311227) (not start!69108) (not b!311224) (not b!311225) (not b!311226))
(check-sat)
