; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51206 () Bool)

(assert start!51206)

(declare-fun ret!59 () (_ BitVec 32))

(declare-datatypes ((array!12793 0))(
  ( (array!12794 (arr!6607 (Array (_ BitVec 32) (_ BitVec 8))) (size!5620 (_ BitVec 32))) )
))
(declare-fun charSet!5 () array!12793)

(declare-fun ch!5 () (_ BitVec 8))

(declare-fun i!492 () (_ BitVec 32))

(declare-datatypes ((Unit!17503 0))(
  ( (Unit!17504) )
))
(declare-datatypes ((tuple2!20238 0))(
  ( (tuple2!20239 (_1!11041 Unit!17503) (_2!11041 (_ BitVec 32))) )
))
(declare-fun Unit!17505 () Unit!17503)

(declare-fun Unit!17506 () Unit!17503)

(assert (=> start!51206 (and (bvsge i!492 #b00000000000000000000000000000000) (bvsle i!492 (size!5620 charSet!5)) (bvslt ret!59 (size!5620 charSet!5)) (bvslt i!492 (size!5620 charSet!5)) (= ret!59 #b00000000000000000000000000000000) (let ((bdg!14635 (ite (= ((_ sign_extend 24) ch!5) ((_ sign_extend 24) (select (arr!6607 charSet!5) i!492))) (tuple2!20239 Unit!17505 i!492) (tuple2!20239 Unit!17506 ret!59)))) (and (or (bvsge (bvadd #b00000000000000000000000000000001 i!492) (size!5620 charSet!5)) (not (= (_2!11041 bdg!14635) #b00000000000000000000000000000000))) (or (bvslt (bvadd #b00000000000000000000000000000001 i!492) #b00000000000000000000000000000000) (bvsge (_2!11041 bdg!14635) (size!5620 charSet!5)) (bvslt (_2!11041 bdg!14635) #b00000000000000000000000000000000)))))))

(assert (=> start!51206 true))

(declare-fun array_inv!5361 (array!12793) Bool)

(assert (=> start!51206 (array_inv!5361 charSet!5)))

(declare-fun bs!20192 () Bool)

(assert (= bs!20192 start!51206))

(declare-fun m!361101 () Bool)

(assert (=> bs!20192 m!361101))

(declare-fun m!361103 () Bool)

(assert (=> bs!20192 m!361103))

(push 1)

(assert (not start!51206))

(check-sat)

(pop 1)

(push 1)

(check-sat)

