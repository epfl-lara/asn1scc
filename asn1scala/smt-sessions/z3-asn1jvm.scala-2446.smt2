; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62126 () Bool)

(assert start!62126)

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16047 0))(
  ( (array!16048 (arr!7940 (Array (_ BitVec 32) (_ BitVec 8))) (size!6944 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16047)

(declare-fun a2!699 () array!16047)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!62126 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6944 a1!699) (size!6944 a2!699)) (not (= ((_ sign_extend 32) (size!6944 a1!699)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6944 a1!699))) ((_ sign_extend 32) (size!6944 a1!699))))))))

(assert (=> start!62126 true))

(declare-fun array_inv!6668 (array!16047) Bool)

(assert (=> start!62126 (array_inv!6668 a1!699)))

(assert (=> start!62126 (array_inv!6668 a2!699)))

(declare-fun bs!24207 () Bool)

(assert (= bs!24207 start!62126))

(declare-fun m!411845 () Bool)

(assert (=> bs!24207 m!411845))

(declare-fun m!411847 () Bool)

(assert (=> bs!24207 m!411847))

(check-sat (not start!62126))
(check-sat)
