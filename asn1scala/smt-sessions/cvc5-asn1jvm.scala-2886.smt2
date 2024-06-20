; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69106 () Bool)

(assert start!69106)

(declare-fun res!254976 () Bool)

(declare-fun e!223738 () Bool)

(assert (=> start!69106 (=> (not res!254976) (not e!223738))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!19003 0))(
  ( (array!19004 (arr!9325 (Array (_ BitVec 32) (_ BitVec 8))) (size!8245 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13594 0))(
  ( (BitStream!13595 (buf!7858 array!19003) (currentByte!14477 (_ BitVec 32)) (currentBit!14472 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13594)

(declare-fun b2!97 () BitStream!13594)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(assert (=> start!69106 (= res!254976 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8245 (buf!7858 b1!97)) (size!8245 (buf!7858 b2!97)))))))

(assert (=> start!69106 e!223738))

(assert (=> start!69106 true))

(declare-fun e!223739 () Bool)

(declare-fun inv!12 (BitStream!13594) Bool)

(assert (=> start!69106 (and (inv!12 b1!97) e!223739)))

(declare-fun e!223737 () Bool)

(assert (=> start!69106 (and (inv!12 b2!97) e!223737)))

(declare-fun b!311209 () Bool)

(declare-fun res!254977 () Bool)

(assert (=> b!311209 (=> (not res!254977) (not e!223738))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311209 (= res!254977 (validate_offset_bits!1 ((_ sign_extend 32) (size!8245 (buf!7858 b1!97))) ((_ sign_extend 32) (currentByte!14477 b1!97)) ((_ sign_extend 32) (currentBit!14472 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!311210 () Bool)

(declare-fun array_inv!7797 (array!19003) Bool)

(assert (=> b!311210 (= e!223739 (array_inv!7797 (buf!7858 b1!97)))))

(declare-fun b!311211 () Bool)

(declare-fun res!254975 () Bool)

(assert (=> b!311211 (=> (not res!254975) (not e!223738))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311211 (= res!254975 (bvsle (bitIndex!0 (size!8245 (buf!7858 b2!97)) (currentByte!14477 b2!97) (currentBit!14472 b2!97)) (bvadd (bitIndex!0 (size!8245 (buf!7858 b1!97)) (currentByte!14477 b1!97) (currentBit!14472 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!311212 () Bool)

(assert (=> b!311212 (= e!223737 (array_inv!7797 (buf!7858 b2!97)))))

(declare-fun b!311213 () Bool)

(assert (=> b!311213 (= e!223738 (or (bvsgt ((_ sign_extend 32) (size!8245 (buf!7858 b1!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!14477 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!14472 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (= (and start!69106 res!254976) b!311209))

(assert (= (and b!311209 res!254977) b!311211))

(assert (= (and b!311211 res!254975) b!311213))

(assert (= start!69106 b!311210))

(assert (= start!69106 b!311212))

(declare-fun m!449105 () Bool)

(assert (=> b!311212 m!449105))

(declare-fun m!449107 () Bool)

(assert (=> b!311210 m!449107))

(declare-fun m!449109 () Bool)

(assert (=> start!69106 m!449109))

(declare-fun m!449111 () Bool)

(assert (=> start!69106 m!449111))

(declare-fun m!449113 () Bool)

(assert (=> b!311211 m!449113))

(declare-fun m!449115 () Bool)

(assert (=> b!311211 m!449115))

(declare-fun m!449117 () Bool)

(assert (=> b!311209 m!449117))

(push 1)

(assert (not b!311211))

(assert (not b!311210))

(assert (not b!311209))

(assert (not b!311212))

(assert (not start!69106))

(check-sat)

(pop 1)

(push 1)

(check-sat)

