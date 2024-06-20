; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37634 () Bool)

(assert start!37634)

(declare-fun res!141696 () Bool)

(declare-fun e!119143 () Bool)

(assert (=> start!37634 (=> (not res!141696) (not e!119143))))

(declare-datatypes ((array!9045 0))(
  ( (array!9046 (arr!4934 (Array (_ BitVec 32) (_ BitVec 8))) (size!4004 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7146 0))(
  ( (BitStream!7147 (buf!4447 array!9045) (currentByte!8434 (_ BitVec 32)) (currentBit!8429 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7146)

(declare-fun from!235 () (_ BitVec 64))

(declare-fun nBits!283 () (_ BitVec 64))

(assert (=> start!37634 (= res!141696 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283) (bvsle ((_ sign_extend 32) (size!4004 (buf!4447 bs!64))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8434 bs!64)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8429 bs!64)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4004 (buf!4447 bs!64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8434 bs!64)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8429 bs!64)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!37634 e!119143))

(assert (=> start!37634 true))

(declare-fun e!119142 () Bool)

(declare-fun inv!12 (BitStream!7146) Bool)

(assert (=> start!37634 (and (inv!12 bs!64) e!119142)))

(declare-fun b!170752 () Bool)

(declare-fun res!141695 () Bool)

(assert (=> b!170752 (=> (not res!141695) (not e!119143))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!170752 (= res!141695 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8429 bs!64))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8434 bs!64))) ((_ extract 31 0) ((_ sign_extend 32) (size!4004 (buf!4447 bs!64))))))))

(declare-fun b!170753 () Bool)

(assert (=> b!170753 (= e!119143 (bvslt (bvsub nBits!283 from!235) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!170754 () Bool)

(declare-fun array_inv!3745 (array!9045) Bool)

(assert (=> b!170754 (= e!119142 (array_inv!3745 (buf!4447 bs!64)))))

(assert (= (and start!37634 res!141696) b!170752))

(assert (= (and b!170752 res!141695) b!170753))

(assert (= start!37634 b!170754))

(declare-fun m!269911 () Bool)

(assert (=> start!37634 m!269911))

(declare-fun m!269913 () Bool)

(assert (=> b!170752 m!269913))

(declare-fun m!269915 () Bool)

(assert (=> b!170754 m!269915))

(check-sat (not b!170754) (not b!170752) (not start!37634))
(check-sat)
