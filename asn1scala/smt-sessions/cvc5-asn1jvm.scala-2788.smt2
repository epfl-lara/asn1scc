; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67296 () Bool)

(assert start!67296)

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18305 0))(
  ( (array!18306 (arr!9031 (Array (_ BitVec 32) (_ BitVec 8))) (size!7948 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18305)

(declare-fun a2!948 () array!18305)

(assert (=> start!67296 (and (bvsle (size!7948 a1!948) (size!7948 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258) (let ((bdg!18226 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7948 a1!948))))) (and (bvsle toBit!258 bdg!18226) (not (= ((_ sign_extend 32) (size!7948 a1!948)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv bdg!18226 ((_ sign_extend 32) (size!7948 a1!948))))))))))

(declare-fun array_inv!7560 (array!18305) Bool)

(assert (=> start!67296 (array_inv!7560 a1!948)))

(assert (=> start!67296 (array_inv!7560 a2!948)))

(assert (=> start!67296 true))

(declare-fun bs!26073 () Bool)

(assert (= bs!26073 start!67296))

(declare-fun m!441087 () Bool)

(assert (=> bs!26073 m!441087))

(declare-fun m!441089 () Bool)

(assert (=> bs!26073 m!441089))

(push 1)

(assert (not start!67296))

(check-sat)

(pop 1)

(push 1)

(check-sat)

