; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67300 () Bool)

(assert start!67300)

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18309 0))(
  ( (array!18310 (arr!9033 (Array (_ BitVec 32) (_ BitVec 8))) (size!7950 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18309)

(declare-fun a2!948 () array!18309)

(assert (=> start!67300 (and (bvsle (size!7950 a1!948) (size!7950 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258) (let ((bdg!18226 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7950 a1!948))))) (and (bvsle toBit!258 bdg!18226) (not (= ((_ sign_extend 32) (size!7950 a1!948)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv bdg!18226 ((_ sign_extend 32) (size!7950 a1!948))))))))))

(declare-fun array_inv!7562 (array!18309) Bool)

(assert (=> start!67300 (array_inv!7562 a1!948)))

(assert (=> start!67300 (array_inv!7562 a2!948)))

(assert (=> start!67300 true))

(declare-fun bs!26075 () Bool)

(assert (= bs!26075 start!67300))

(declare-fun m!441095 () Bool)

(assert (=> bs!26075 m!441095))

(declare-fun m!441097 () Bool)

(assert (=> bs!26075 m!441097))

(push 1)

(assert (not start!67300))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

