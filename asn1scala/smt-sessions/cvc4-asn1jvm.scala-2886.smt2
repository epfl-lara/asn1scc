; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69110 () Bool)

(assert start!69110)

(declare-fun b!311239 () Bool)

(declare-fun e!223768 () Bool)

(declare-datatypes ((array!19007 0))(
  ( (array!19008 (arr!9327 (Array (_ BitVec 32) (_ BitVec 8))) (size!8247 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13598 0))(
  ( (BitStream!13599 (buf!7860 array!19007) (currentByte!14479 (_ BitVec 32)) (currentBit!14474 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13598)

(assert (=> b!311239 (= e!223768 (or (bvsgt ((_ sign_extend 32) (size!8247 (buf!7860 b1!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!14479 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!14474 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!311241 () Bool)

(declare-fun res!254994 () Bool)

(assert (=> b!311241 (=> (not res!254994) (not e!223768))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13598)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311241 (= res!254994 (bvsle (bitIndex!0 (size!8247 (buf!7860 b2!97)) (currentByte!14479 b2!97) (currentBit!14474 b2!97)) (bvadd (bitIndex!0 (size!8247 (buf!7860 b1!97)) (currentByte!14479 b1!97) (currentBit!14474 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!311242 () Bool)

(declare-fun res!254993 () Bool)

(assert (=> b!311242 (=> (not res!254993) (not e!223768))))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311242 (= res!254993 (validate_offset_bits!1 ((_ sign_extend 32) (size!8247 (buf!7860 b1!97))) ((_ sign_extend 32) (currentByte!14479 b1!97)) ((_ sign_extend 32) (currentBit!14474 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!311243 () Bool)

(declare-fun e!223767 () Bool)

(declare-fun array_inv!7799 (array!19007) Bool)

(assert (=> b!311243 (= e!223767 (array_inv!7799 (buf!7860 b2!97)))))

(declare-fun res!254995 () Bool)

(assert (=> start!69110 (=> (not res!254995) (not e!223768))))

(assert (=> start!69110 (= res!254995 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8247 (buf!7860 b1!97)) (size!8247 (buf!7860 b2!97)))))))

(assert (=> start!69110 e!223768))

(assert (=> start!69110 true))

(declare-fun e!223766 () Bool)

(declare-fun inv!12 (BitStream!13598) Bool)

(assert (=> start!69110 (and (inv!12 b1!97) e!223766)))

(assert (=> start!69110 (and (inv!12 b2!97) e!223767)))

(declare-fun b!311240 () Bool)

(assert (=> b!311240 (= e!223766 (array_inv!7799 (buf!7860 b1!97)))))

(assert (= (and start!69110 res!254995) b!311242))

(assert (= (and b!311242 res!254993) b!311241))

(assert (= (and b!311241 res!254994) b!311239))

(assert (= start!69110 b!311240))

(assert (= start!69110 b!311243))

(declare-fun m!449133 () Bool)

(assert (=> b!311240 m!449133))

(declare-fun m!449135 () Bool)

(assert (=> b!311242 m!449135))

(declare-fun m!449137 () Bool)

(assert (=> start!69110 m!449137))

(declare-fun m!449139 () Bool)

(assert (=> start!69110 m!449139))

(declare-fun m!449141 () Bool)

(assert (=> b!311243 m!449141))

(declare-fun m!449143 () Bool)

(assert (=> b!311241 m!449143))

(declare-fun m!449145 () Bool)

(assert (=> b!311241 m!449145))

(push 1)

(assert (not b!311241))

(assert (not b!311240))

(assert (not start!69110))

(assert (not b!311242))

(assert (not b!311243))

(check-sat)

(pop 1)

(push 1)

(check-sat)

