; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71334 () Bool)

(assert start!71334)

(declare-datatypes ((array!20360 0))(
  ( (array!20361 (arr!9959 (Array (_ BitVec 32) (_ BitVec 8))) (size!8867 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13896 0))(
  ( (BitStream!13897 (buf!8009 array!20360) (currentByte!14780 (_ BitVec 32)) (currentBit!14775 (_ BitVec 32))) )
))
(declare-fun b!176 () BitStream!13896)

(assert (=> start!71334 (= (size!8867 (buf!8009 b!176)) #b10000000000000000000000000000000)))

(declare-fun e!231449 () Bool)

(declare-fun inv!12 (BitStream!13896) Bool)

(assert (=> start!71334 (and (inv!12 b!176) e!231449)))

(declare-fun b!321421 () Bool)

(declare-fun array_inv!8419 (array!20360) Bool)

(assert (=> b!321421 (= e!231449 (array_inv!8419 (buf!8009 b!176)))))

(assert (= start!71334 b!321421))

(declare-fun m!459733 () Bool)

(assert (=> start!71334 m!459733))

(declare-fun m!459735 () Bool)

(assert (=> b!321421 m!459735))

(check-sat (not b!321421) (not start!71334))
(check-sat)
(get-model)

(declare-fun d!105356 () Bool)

(assert (=> d!105356 (= (array_inv!8419 (buf!8009 b!176)) (bvsge (size!8867 (buf!8009 b!176)) #b00000000000000000000000000000000))))

(assert (=> b!321421 d!105356))

(declare-fun d!105360 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105360 (= (inv!12 b!176) (invariant!0 (currentBit!14775 b!176) (currentByte!14780 b!176) (size!8867 (buf!8009 b!176))))))

(declare-fun bs!27706 () Bool)

(assert (= bs!27706 d!105360))

(declare-fun m!459743 () Bool)

(assert (=> bs!27706 m!459743))

(assert (=> start!71334 d!105360))

(check-sat (not d!105360))
(check-sat)
