; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67292 () Bool)

(assert start!67292)

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18301 0))(
  ( (array!18302 (arr!9029 (Array (_ BitVec 32) (_ BitVec 8))) (size!7946 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18301)

(declare-fun a2!948 () array!18301)

(assert (=> start!67292 (and (bvsle (size!7946 a1!948) (size!7946 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258) (not (= ((_ sign_extend 32) (size!7946 a1!948)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7946 a1!948))) ((_ sign_extend 32) (size!7946 a1!948))))))))

(declare-fun array_inv!7558 (array!18301) Bool)

(assert (=> start!67292 (array_inv!7558 a1!948)))

(assert (=> start!67292 (array_inv!7558 a2!948)))

(assert (=> start!67292 true))

(declare-fun bs!26068 () Bool)

(assert (= bs!26068 start!67292))

(declare-fun m!441079 () Bool)

(assert (=> bs!26068 m!441079))

(declare-fun m!441081 () Bool)

(assert (=> bs!26068 m!441081))

(check-sat (not start!67292))
(check-sat)
