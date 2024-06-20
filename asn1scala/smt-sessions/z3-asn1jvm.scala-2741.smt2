; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66738 () Bool)

(assert start!66738)

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!18001 0))(
  ( (array!18002 (arr!8891 (Array (_ BitVec 32) (_ BitVec 8))) (size!7808 (_ BitVec 32))) )
))
(declare-fun a!429 () array!18001)

(declare-fun b!315 () Bool)

(assert (=> start!66738 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (bvslt at!281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7808 a!429)))) (let ((bdg!17852 ((_ extract 31 0) (bvsrem at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))) (and b!315 (or (bvslt bdg!17852 #b00000000000000000000000000000000) (bvsge bdg!17852 #b00000000000000000000000000001000)))))))

(assert (=> start!66738 true))

(declare-fun array_inv!7420 (array!18001) Bool)

(assert (=> start!66738 (array_inv!7420 a!429)))

(declare-fun bs!25816 () Bool)

(assert (= bs!25816 start!66738))

(declare-fun m!437481 () Bool)

(assert (=> bs!25816 m!437481))

(check-sat (not start!66738))
(check-sat)
