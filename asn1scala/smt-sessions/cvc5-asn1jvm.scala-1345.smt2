; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37532 () Bool)

(assert start!37532)

(declare-datatypes ((Unit!12002 0))(
  ( (Unit!12003) )
))
(declare-datatypes ((ControlFlow!97 0))(
  ( (Return!96 (value!6988 (_ BitVec 32))) (Proceed!96 (value!6989 Unit!12002)) )
))
(declare-fun lt!262345 () ControlFlow!97)

(declare-fun vv!44 () (_ BitVec 64))

(declare-fun Unit!12004 () Unit!12002)

(assert (=> start!37532 (= lt!262345 (ite (bvslt vv!44 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!96 #b00000000000000000000000001000000) (Proceed!96 Unit!12004)))))

(assert (=> start!37532 (and (is-Return!96 lt!262345) (bvsge (value!6988 lt!262345) #b00000000000000000000000000000000) (bvsle (value!6988 lt!262345) #b00000000000000000000000001000000) (or (not (= (value!6988 lt!262345) #b00000000000000000000000001000000)) (bvsge vv!44 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvslt ((_ sign_extend 32) (value!6988 lt!262345)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt ((_ sign_extend 32) (value!6988 lt!262345)) #b0000000000000000000000000000000000000000000000000000000001000000)))))

(assert (=> start!37532 true))

(push 1)

(check-sat)

(pop 1)

