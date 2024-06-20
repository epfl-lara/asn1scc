; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10376 () Bool)

(assert start!10376)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((array!2397 0))(
  ( (array!2398 (arr!1629 (Array (_ BitVec 32) (_ BitVec 8))) (size!1093 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2397)

(assert (=> start!10376 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (not (= ((_ sign_extend 32) (size!1093 srcBuffer!2)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1093 srcBuffer!2))) ((_ sign_extend 32) (size!1093 srcBuffer!2))))))))

(assert (=> start!10376 true))

(declare-fun array_inv!998 (array!2397) Bool)

(assert (=> start!10376 (array_inv!998 srcBuffer!2)))

(declare-fun bs!4171 () Bool)

(assert (= bs!4171 start!10376))

(declare-fun m!82407 () Bool)

(assert (=> bs!4171 m!82407))

(check-sat (not start!10376))
(check-sat)
