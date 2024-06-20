; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61032 () Bool)

(assert start!61032)

(declare-fun res!228793 () Bool)

(declare-fun e!194977 () Bool)

(assert (=> start!61032 (=> (not res!228793) (not e!194977))))

(declare-datatypes ((array!15658 0))(
  ( (array!15659 (arr!7769 (Array (_ BitVec 32) (_ BitVec 8))) (size!6782 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12378 0))(
  ( (BitStream!12379 (buf!7250 array!15658) (currentByte!13408 (_ BitVec 32)) (currentBit!13403 (_ BitVec 32))) )
))
(declare-fun b!177 () BitStream!12378)

(declare-fun diffInBits!14 () (_ BitVec 64))

(assert (=> start!61032 (= res!228793 (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6782 (buf!7250 b!177)))) diffInBits!14))))

(assert (=> start!61032 e!194977))

(declare-fun e!194975 () Bool)

(declare-fun inv!12 (BitStream!12378) Bool)

(assert (=> start!61032 (and (inv!12 b!177) e!194975)))

(assert (=> start!61032 true))

(declare-fun b!275079 () Bool)

(declare-fun array_inv!6506 (array!15658) Bool)

(assert (=> b!275079 (= e!194975 (array_inv!6506 (buf!7250 b!177)))))

(declare-fun b!275076 () Bool)

(declare-fun e!194976 () Bool)

(assert (=> b!275076 (= e!194977 e!194976)))

(declare-fun res!228792 () Bool)

(assert (=> b!275076 (=> (not res!228792) (not e!194976))))

(declare-fun lt!413462 () (_ BitVec 64))

(assert (=> b!275076 (= res!228792 (bvsle diffInBits!14 lt!413462))))

(assert (=> b!275076 (= lt!413462 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6782 (buf!7250 b!177)))))))

(declare-fun b!275077 () Bool)

(declare-fun res!228791 () Bool)

(assert (=> b!275077 (=> (not res!228791) (not e!194976))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275077 (= res!228791 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd (bitIndex!0 (size!6782 (buf!7250 b!177)) (currentByte!13408 b!177) (currentBit!13403 b!177)) diffInBits!14)))))

(declare-fun b!275078 () Bool)

(assert (=> b!275078 (= e!194976 (not (= ((_ sign_extend 32) (size!6782 (buf!7250 b!177))) (bvsdiv lt!413462 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!61032 res!228793) b!275076))

(assert (= (and b!275076 res!228792) b!275077))

(assert (= (and b!275077 res!228791) b!275078))

(assert (= start!61032 b!275079))

(declare-fun m!407633 () Bool)

(assert (=> start!61032 m!407633))

(declare-fun m!407635 () Bool)

(assert (=> b!275079 m!407635))

(declare-fun m!407637 () Bool)

(assert (=> b!275077 m!407637))

(check-sat (not b!275079) (not start!61032) (not b!275077))
(check-sat)
