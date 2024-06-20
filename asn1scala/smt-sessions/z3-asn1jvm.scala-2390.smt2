; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61002 () Bool)

(assert start!61002)

(declare-datatypes ((array!15643 0))(
  ( (array!15644 (arr!7763 (Array (_ BitVec 32) (_ BitVec 8))) (size!6776 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12366 0))(
  ( (BitStream!12367 (buf!7244 array!15643) (currentByte!13399 (_ BitVec 32)) (currentBit!13394 (_ BitVec 32))) )
))
(declare-fun b!177 () BitStream!12366)

(declare-fun diffInBits!14 () (_ BitVec 64))

(assert (=> start!61002 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6776 (buf!7244 b!177)))) diffInBits!14) (not (= ((_ sign_extend 32) (size!6776 (buf!7244 b!177))) (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6776 (buf!7244 b!177)))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun e!194910 () Bool)

(declare-fun inv!12 (BitStream!12366) Bool)

(assert (=> start!61002 (and (inv!12 b!177) e!194910)))

(assert (=> start!61002 true))

(declare-fun b!275016 () Bool)

(declare-fun array_inv!6500 (array!15643) Bool)

(assert (=> b!275016 (= e!194910 (array_inv!6500 (buf!7244 b!177)))))

(assert (= start!61002 b!275016))

(declare-fun m!407589 () Bool)

(assert (=> start!61002 m!407589))

(declare-fun m!407591 () Bool)

(assert (=> b!275016 m!407591))

(check-sat (not start!61002) (not b!275016))
(check-sat)
