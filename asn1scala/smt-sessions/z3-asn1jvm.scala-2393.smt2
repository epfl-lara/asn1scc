; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61038 () Bool)

(assert start!61038)

(declare-datatypes ((array!15664 0))(
  ( (array!15665 (arr!7772 (Array (_ BitVec 32) (_ BitVec 8))) (size!6785 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12384 0))(
  ( (BitStream!12385 (buf!7253 array!15664) (currentByte!13411 (_ BitVec 32)) (currentBit!13406 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12384)

(declare-fun bs2!19 () BitStream!12384)

(assert (=> start!61038 (and (= (size!6785 (buf!7253 bs1!11)) (size!6785 (buf!7253 bs2!19))) (or (bvsgt ((_ sign_extend 32) (size!6785 (buf!7253 bs1!11))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!13411 bs1!11)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!13406 bs1!11)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun e!195010 () Bool)

(declare-fun inv!12 (BitStream!12384) Bool)

(assert (=> start!61038 (and (inv!12 bs1!11) e!195010)))

(declare-fun e!195012 () Bool)

(assert (=> start!61038 (and (inv!12 bs2!19) e!195012)))

(declare-fun b!275102 () Bool)

(declare-fun array_inv!6509 (array!15664) Bool)

(assert (=> b!275102 (= e!195010 (array_inv!6509 (buf!7253 bs1!11)))))

(declare-fun b!275103 () Bool)

(assert (=> b!275103 (= e!195012 (array_inv!6509 (buf!7253 bs2!19)))))

(assert (= start!61038 b!275102))

(assert (= start!61038 b!275103))

(declare-fun m!407653 () Bool)

(assert (=> start!61038 m!407653))

(declare-fun m!407655 () Bool)

(assert (=> start!61038 m!407655))

(declare-fun m!407657 () Bool)

(assert (=> b!275102 m!407657))

(declare-fun m!407659 () Bool)

(assert (=> b!275103 m!407659))

(check-sat (not b!275103) (not b!275102) (not start!61038))
(check-sat)
