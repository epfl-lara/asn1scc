; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69184 () Bool)

(assert start!69184)

(declare-fun b!311421 () Bool)

(declare-fun e!223912 () Bool)

(declare-datatypes ((array!19029 0))(
  ( (array!19030 (arr!9335 (Array (_ BitVec 32) (_ BitVec 8))) (size!8255 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13614 0))(
  ( (BitStream!13615 (buf!7868 array!19029) (currentByte!14504 (_ BitVec 32)) (currentBit!14499 (_ BitVec 32))) )
))
(declare-fun b2!97 () BitStream!13614)

(declare-fun array_inv!7807 (array!19029) Bool)

(assert (=> b!311421 (= e!223912 (array_inv!7807 (buf!7868 b2!97)))))

(declare-fun b!311422 () Bool)

(declare-fun res!255130 () Bool)

(declare-fun e!223913 () Bool)

(assert (=> b!311422 (=> (not res!255130) (not e!223913))))

(declare-fun b1!97 () BitStream!13614)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311422 (= res!255130 (validate_offset_bits!1 ((_ sign_extend 32) (size!8255 (buf!7868 b1!97))) ((_ sign_extend 32) (currentByte!14504 b1!97)) ((_ sign_extend 32) (currentBit!14499 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!311423 () Bool)

(declare-fun res!255128 () Bool)

(assert (=> b!311423 (=> (not res!255128) (not e!223913))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!311423 (= res!255128 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8255 (buf!7868 b1!97))) ((_ sign_extend 32) (currentByte!14504 b1!97)) ((_ sign_extend 32) (currentBit!14499 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!311424 () Bool)

(declare-fun e!223910 () Bool)

(assert (=> b!311424 (= e!223910 (array_inv!7807 (buf!7868 b1!97)))))

(declare-fun res!255129 () Bool)

(assert (=> start!69184 (=> (not res!255129) (not e!223913))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(assert (=> start!69184 (= res!255129 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8255 (buf!7868 b1!97)) (size!8255 (buf!7868 b2!97)))))))

(assert (=> start!69184 e!223913))

(assert (=> start!69184 true))

(declare-fun inv!12 (BitStream!13614) Bool)

(assert (=> start!69184 (and (inv!12 b1!97) e!223910)))

(assert (=> start!69184 (and (inv!12 b2!97) e!223912)))

(declare-fun b!311425 () Bool)

(declare-fun res!255127 () Bool)

(assert (=> b!311425 (=> (not res!255127) (not e!223913))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311425 (= res!255127 (bvsle (bitIndex!0 (size!8255 (buf!7868 b2!97)) (currentByte!14504 b2!97) (currentBit!14499 b2!97)) (bvadd (bitIndex!0 (size!8255 (buf!7868 b1!97)) (currentByte!14504 b1!97) (currentBit!14499 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!311426 () Bool)

(declare-fun lt!441134 () (_ BitVec 64))

(declare-fun lt!441133 () (_ BitVec 64))

(assert (=> b!311426 (= e!223913 (and (bvsge (bvsub lt!441133 lt!441134) b1ValidateOffsetBits!10) (let ((bdg!18591 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14504 b2!97))) ((_ sign_extend 32) (currentBit!14499 b2!97))))) (and (bvsle bdg!18591 (bvadd lt!441134 advancedAtMostBits!9)) (bvsge (bvsub lt!441133 bdg!18591) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)) (or (bvsgt ((_ sign_extend 32) (size!8255 (buf!7868 b2!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!14504 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!14499 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111))))))))

(assert (=> b!311426 (= lt!441134 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14504 b1!97))) ((_ sign_extend 32) (currentBit!14499 b1!97))))))

(assert (=> b!311426 (= lt!441133 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8255 (buf!7868 b1!97)))))))

(assert (= (and start!69184 res!255129) b!311422))

(assert (= (and b!311422 res!255130) b!311425))

(assert (= (and b!311425 res!255127) b!311423))

(assert (= (and b!311423 res!255128) b!311426))

(assert (= start!69184 b!311424))

(assert (= start!69184 b!311421))

(declare-fun m!449301 () Bool)

(assert (=> b!311424 m!449301))

(declare-fun m!449303 () Bool)

(assert (=> start!69184 m!449303))

(declare-fun m!449305 () Bool)

(assert (=> start!69184 m!449305))

(declare-fun m!449307 () Bool)

(assert (=> b!311421 m!449307))

(declare-fun m!449309 () Bool)

(assert (=> b!311422 m!449309))

(declare-fun m!449311 () Bool)

(assert (=> b!311425 m!449311))

(declare-fun m!449313 () Bool)

(assert (=> b!311425 m!449313))

(declare-fun m!449315 () Bool)

(assert (=> b!311423 m!449315))

(check-sat (not b!311421) (not b!311425) (not b!311422) (not start!69184) (not b!311424) (not b!311423))
(check-sat)
