; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45360 () Bool)

(assert start!45360)

(declare-fun res!185359 () Bool)

(declare-fun e!149414 () Bool)

(assert (=> start!45360 (=> (not res!185359) (not e!149414))))

(declare-datatypes ((array!10701 0))(
  ( (array!10702 (arr!5630 (Array (_ BitVec 32) (_ BitVec 8))) (size!4700 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8508 0))(
  ( (BitStream!8509 (buf!5247 array!10701) (currentByte!9850 (_ BitVec 32)) (currentBit!9845 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8508)

(declare-fun nBits!265 () (_ BitVec 32))

(declare-fun i!541 () (_ BitVec 32))

(assert (=> start!45360 (= res!185359 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!4700 (buf!5247 bs!62))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!9850 bs!62)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!9845 bs!62)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4700 (buf!5247 bs!62))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!9850 bs!62)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!9845 bs!62)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!45360 e!149414))

(assert (=> start!45360 true))

(declare-fun e!149415 () Bool)

(declare-fun inv!12 (BitStream!8508) Bool)

(assert (=> start!45360 (and (inv!12 bs!62) e!149415)))

(declare-fun b!220018 () Bool)

(declare-fun res!185360 () Bool)

(assert (=> b!220018 (=> (not res!185360) (not e!149414))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!220018 (= res!185360 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9845 bs!62))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9850 bs!62))) ((_ extract 31 0) ((_ sign_extend 32) (size!4700 (buf!5247 bs!62))))))))

(declare-fun b!220019 () Bool)

(assert (=> b!220019 (= e!149414 (bvslt ((_ sign_extend 32) (bvsub nBits!265 i!541)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220020 () Bool)

(declare-fun array_inv!4441 (array!10701) Bool)

(assert (=> b!220020 (= e!149415 (array_inv!4441 (buf!5247 bs!62)))))

(assert (= (and start!45360 res!185359) b!220018))

(assert (= (and b!220018 res!185360) b!220019))

(assert (= start!45360 b!220020))

(declare-fun m!338761 () Bool)

(assert (=> start!45360 m!338761))

(declare-fun m!338763 () Bool)

(assert (=> b!220018 m!338763))

(declare-fun m!338765 () Bool)

(assert (=> b!220020 m!338765))

(check-sat (not start!45360) (not b!220018) (not b!220020))
(check-sat)
