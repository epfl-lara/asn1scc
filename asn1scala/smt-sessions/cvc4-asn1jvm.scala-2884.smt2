; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69052 () Bool)

(assert start!69052)

(declare-fun b!311161 () Bool)

(declare-fun e!223679 () Bool)

(declare-datatypes ((array!18989 0))(
  ( (array!18990 (arr!9321 (Array (_ BitVec 32) (_ BitVec 8))) (size!8241 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13586 0))(
  ( (BitStream!13587 (buf!7854 array!18989) (currentByte!14461 (_ BitVec 32)) (currentBit!14456 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13586)

(declare-fun array_inv!7793 (array!18989) Bool)

(assert (=> b!311161 (= e!223679 (array_inv!7793 (buf!7854 b1!97)))))

(declare-fun b!311162 () Bool)

(declare-fun e!223677 () Bool)

(declare-fun b2!97 () BitStream!13586)

(assert (=> b!311162 (= e!223677 (array_inv!7793 (buf!7854 b2!97)))))

(declare-fun res!254949 () Bool)

(declare-fun e!223676 () Bool)

(assert (=> start!69052 (=> (not res!254949) (not e!223676))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(assert (=> start!69052 (= res!254949 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8241 (buf!7854 b1!97)) (size!8241 (buf!7854 b2!97)))))))

(assert (=> start!69052 e!223676))

(assert (=> start!69052 true))

(declare-fun inv!12 (BitStream!13586) Bool)

(assert (=> start!69052 (and (inv!12 b1!97) e!223679)))

(assert (=> start!69052 (and (inv!12 b2!97) e!223677)))

(declare-fun b!311160 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!311160 (= e!223676 (not (invariant!0 (currentBit!14456 b2!97) (currentByte!14461 b2!97) (size!8241 (buf!7854 b2!97)))))))

(declare-fun b!311159 () Bool)

(declare-fun res!254950 () Bool)

(assert (=> b!311159 (=> (not res!254950) (not e!223676))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311159 (= res!254950 (validate_offset_bits!1 ((_ sign_extend 32) (size!8241 (buf!7854 b1!97))) ((_ sign_extend 32) (currentByte!14461 b1!97)) ((_ sign_extend 32) (currentBit!14456 b1!97)) b1ValidateOffsetBits!10))))

(assert (= (and start!69052 res!254949) b!311159))

(assert (= (and b!311159 res!254950) b!311160))

(assert (= start!69052 b!311161))

(assert (= start!69052 b!311162))

(declare-fun m!449035 () Bool)

(assert (=> b!311160 m!449035))

(declare-fun m!449037 () Bool)

(assert (=> start!69052 m!449037))

(declare-fun m!449039 () Bool)

(assert (=> start!69052 m!449039))

(declare-fun m!449041 () Bool)

(assert (=> b!311161 m!449041))

(declare-fun m!449043 () Bool)

(assert (=> b!311162 m!449043))

(declare-fun m!449045 () Bool)

(assert (=> b!311159 m!449045))

(push 1)

(assert (not b!311159))

(assert (not start!69052))

(assert (not b!311162))

(assert (not b!311160))

(assert (not b!311161))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

