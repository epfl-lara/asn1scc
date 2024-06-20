; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16370 () Bool)

(assert start!16370)

(declare-fun b!81884 () Bool)

(declare-fun e!53943 () Bool)

(declare-datatypes ((array!3655 0))(
  ( (array!3656 (arr!2314 (Array (_ BitVec 32) (_ BitVec 8))) (size!1677 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2916 0))(
  ( (BitStream!2917 (buf!2067 array!3655) (currentByte!4013 (_ BitVec 32)) (currentBit!4008 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!2916)

(declare-fun array_inv!1523 (array!3655) Bool)

(assert (=> b!81884 (= e!53943 (array_inv!1523 (buf!2067 b1!98)))))

(declare-fun b!81885 () Bool)

(declare-fun res!67527 () Bool)

(declare-fun e!53940 () Bool)

(assert (=> b!81885 (=> (not res!67527) (not e!53940))))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!81885 (= res!67527 (validate_offset_bits!1 ((_ sign_extend 32) (size!1677 (buf!2067 b1!98))) ((_ sign_extend 32) (currentByte!4013 b1!98)) ((_ sign_extend 32) (currentBit!4008 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!81886 () Bool)

(declare-fun e!53938 () Bool)

(assert (=> b!81886 (= e!53940 e!53938)))

(declare-fun res!67528 () Bool)

(assert (=> b!81886 (=> (not res!67528) (not e!53938))))

(declare-fun lt!130218 () (_ BitVec 64))

(declare-fun b2!98 () BitStream!2916)

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!81886 (= res!67528 (= (bvadd lt!130218 b1b2Diff!1) (bitIndex!0 (size!1677 (buf!2067 b2!98)) (currentByte!4013 b2!98) (currentBit!4008 b2!98))))))

(assert (=> b!81886 (= lt!130218 (bitIndex!0 (size!1677 (buf!2067 b1!98)) (currentByte!4013 b1!98) (currentBit!4008 b1!98)))))

(declare-fun res!67526 () Bool)

(assert (=> start!16370 (=> (not res!67526) (not e!53940))))

(assert (=> start!16370 (= res!67526 (and (= (size!1677 (buf!2067 b1!98)) (size!1677 (buf!2067 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16370 e!53940))

(declare-fun inv!12 (BitStream!2916) Bool)

(assert (=> start!16370 (and (inv!12 b1!98) e!53943)))

(declare-fun e!53942 () Bool)

(assert (=> start!16370 (and (inv!12 b2!98) e!53942)))

(assert (=> start!16370 true))

(declare-fun b!81887 () Bool)

(assert (=> b!81887 (= e!53942 (array_inv!1523 (buf!2067 b2!98)))))

(declare-fun b!81888 () Bool)

(assert (=> b!81888 (= e!53938 (not (and (bvsle ((_ sign_extend 32) (size!1677 (buf!2067 b1!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4013 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4008 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111))))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!81888 (= (remainingBits!0 ((_ sign_extend 32) (size!1677 (buf!2067 b1!98))) ((_ sign_extend 32) (currentByte!4013 b1!98)) ((_ sign_extend 32) (currentBit!4008 b1!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1677 (buf!2067 b1!98)))) lt!130218))))

(declare-datatypes ((Unit!5463 0))(
  ( (Unit!5464) )
))
(declare-fun lt!130217 () Unit!5463)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2916) Unit!5463)

(assert (=> b!81888 (= lt!130217 (remainingBitsBitIndexLemma!0 b1!98))))

(assert (= (and start!16370 res!67526) b!81885))

(assert (= (and b!81885 res!67527) b!81886))

(assert (= (and b!81886 res!67528) b!81888))

(assert (= start!16370 b!81884))

(assert (= start!16370 b!81887))

(declare-fun m!128289 () Bool)

(assert (=> b!81886 m!128289))

(declare-fun m!128291 () Bool)

(assert (=> b!81886 m!128291))

(declare-fun m!128293 () Bool)

(assert (=> b!81885 m!128293))

(declare-fun m!128295 () Bool)

(assert (=> start!16370 m!128295))

(declare-fun m!128297 () Bool)

(assert (=> start!16370 m!128297))

(declare-fun m!128299 () Bool)

(assert (=> b!81887 m!128299))

(declare-fun m!128301 () Bool)

(assert (=> b!81884 m!128301))

(declare-fun m!128303 () Bool)

(assert (=> b!81888 m!128303))

(declare-fun m!128305 () Bool)

(assert (=> b!81888 m!128305))

(check-sat (not b!81885) (not b!81884) (not b!81887) (not start!16370) (not b!81888) (not b!81886))
(check-sat)
