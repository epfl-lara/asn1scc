; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69182 () Bool)

(assert start!69182)

(declare-fun res!255118 () Bool)

(declare-fun e!223897 () Bool)

(assert (=> start!69182 (=> (not res!255118) (not e!223897))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!19027 0))(
  ( (array!19028 (arr!9334 (Array (_ BitVec 32) (_ BitVec 8))) (size!8254 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13612 0))(
  ( (BitStream!13613 (buf!7867 array!19027) (currentByte!14503 (_ BitVec 32)) (currentBit!14498 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13612)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13612)

(assert (=> start!69182 (= res!255118 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8254 (buf!7867 b1!97)) (size!8254 (buf!7867 b2!97)))))))

(assert (=> start!69182 e!223897))

(assert (=> start!69182 true))

(declare-fun e!223895 () Bool)

(declare-fun inv!12 (BitStream!13612) Bool)

(assert (=> start!69182 (and (inv!12 b1!97) e!223895)))

(declare-fun e!223898 () Bool)

(assert (=> start!69182 (and (inv!12 b2!97) e!223898)))

(declare-fun b!311403 () Bool)

(declare-fun res!255116 () Bool)

(assert (=> b!311403 (=> (not res!255116) (not e!223897))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311403 (= res!255116 (validate_offset_bits!1 ((_ sign_extend 32) (size!8254 (buf!7867 b1!97))) ((_ sign_extend 32) (currentByte!14503 b1!97)) ((_ sign_extend 32) (currentBit!14498 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun lt!441127 () (_ BitVec 64))

(declare-fun lt!441128 () (_ BitVec 64))

(declare-fun b!311404 () Bool)

(assert (=> b!311404 (= e!223897 (and (bvsge (bvsub lt!441127 lt!441128) b1ValidateOffsetBits!10) (let ((bdg!18591 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14503 b2!97))) ((_ sign_extend 32) (currentBit!14498 b2!97))))) (and (bvsle bdg!18591 (bvadd lt!441128 advancedAtMostBits!9)) (bvsge (bvsub lt!441127 bdg!18591) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)) (or (bvsgt ((_ sign_extend 32) (size!8254 (buf!7867 b2!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!14503 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!14498 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111))))))))

(assert (=> b!311404 (= lt!441128 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14503 b1!97))) ((_ sign_extend 32) (currentBit!14498 b1!97))))))

(assert (=> b!311404 (= lt!441127 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8254 (buf!7867 b1!97)))))))

(declare-fun b!311405 () Bool)

(declare-fun array_inv!7806 (array!19027) Bool)

(assert (=> b!311405 (= e!223895 (array_inv!7806 (buf!7867 b1!97)))))

(declare-fun b!311406 () Bool)

(declare-fun res!255115 () Bool)

(assert (=> b!311406 (=> (not res!255115) (not e!223897))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311406 (= res!255115 (bvsle (bitIndex!0 (size!8254 (buf!7867 b2!97)) (currentByte!14503 b2!97) (currentBit!14498 b2!97)) (bvadd (bitIndex!0 (size!8254 (buf!7867 b1!97)) (currentByte!14503 b1!97) (currentBit!14498 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!311407 () Bool)

(assert (=> b!311407 (= e!223898 (array_inv!7806 (buf!7867 b2!97)))))

(declare-fun b!311408 () Bool)

(declare-fun res!255117 () Bool)

(assert (=> b!311408 (=> (not res!255117) (not e!223897))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!311408 (= res!255117 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8254 (buf!7867 b1!97))) ((_ sign_extend 32) (currentByte!14503 b1!97)) ((_ sign_extend 32) (currentBit!14498 b1!97))) b1ValidateOffsetBits!10))))

(assert (= (and start!69182 res!255118) b!311403))

(assert (= (and b!311403 res!255116) b!311406))

(assert (= (and b!311406 res!255115) b!311408))

(assert (= (and b!311408 res!255117) b!311404))

(assert (= start!69182 b!311405))

(assert (= start!69182 b!311407))

(declare-fun m!449285 () Bool)

(assert (=> b!311403 m!449285))

(declare-fun m!449287 () Bool)

(assert (=> b!311408 m!449287))

(declare-fun m!449289 () Bool)

(assert (=> b!311407 m!449289))

(declare-fun m!449291 () Bool)

(assert (=> b!311405 m!449291))

(declare-fun m!449293 () Bool)

(assert (=> b!311406 m!449293))

(declare-fun m!449295 () Bool)

(assert (=> b!311406 m!449295))

(declare-fun m!449297 () Bool)

(assert (=> start!69182 m!449297))

(declare-fun m!449299 () Bool)

(assert (=> start!69182 m!449299))

(push 1)

(assert (not b!311406))

(assert (not start!69182))

(assert (not b!311407))

(assert (not b!311408))

(assert (not b!311403))

(assert (not b!311405))

(check-sat)

(pop 1)

(push 1)

(check-sat)

