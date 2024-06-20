; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51150 () Bool)

(assert start!51150)

(declare-fun ret!59 () (_ BitVec 32))

(declare-datatypes ((array!12755 0))(
  ( (array!12756 (arr!6591 (Array (_ BitVec 32) (_ BitVec 8))) (size!5604 (_ BitVec 32))) )
))
(declare-fun charSet!5 () array!12755)

(declare-fun ch!5 () (_ BitVec 8))

(declare-fun i!492 () (_ BitVec 32))

(declare-datatypes ((Unit!17445 0))(
  ( (Unit!17446) )
))
(declare-datatypes ((tuple2!20218 0))(
  ( (tuple2!20219 (_1!11025 Unit!17445) (_2!11025 (_ BitVec 32))) )
))
(declare-fun Unit!17447 () Unit!17445)

(declare-fun Unit!17448 () Unit!17445)

(assert (=> start!51150 (and (bvsge i!492 #b00000000000000000000000000000000) (bvsle i!492 (size!5604 charSet!5)) (bvslt ret!59 (size!5604 charSet!5)) (bvslt i!492 (size!5604 charSet!5)) (= ret!59 #b00000000000000000000000000000000) (let ((bdg!14630 (ite (= ((_ sign_extend 24) ch!5) ((_ sign_extend 24) (select (arr!6591 charSet!5) i!492))) (tuple2!20219 Unit!17447 i!492) (tuple2!20219 Unit!17448 ret!59)))) (and (bvslt (bvadd #b00000000000000000000000000000001 i!492) (size!5604 charSet!5)) (= (_2!11025 bdg!14630) #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 i!492) #b00000000000000000000000000000000) (bvsge (_2!11025 bdg!14630) (size!5604 charSet!5)) (bvslt (_2!11025 bdg!14630) #b00000000000000000000000000000000)))))))

(assert (=> start!51150 true))

(declare-fun array_inv!5345 (array!12755) Bool)

(assert (=> start!51150 (array_inv!5345 charSet!5)))

(declare-fun bs!20164 () Bool)

(assert (= bs!20164 start!51150))

(declare-fun m!361013 () Bool)

(assert (=> bs!20164 m!361013))

(declare-fun m!361015 () Bool)

(assert (=> bs!20164 m!361015))

(push 1)

(assert (not start!51150))

(check-sat)

(pop 1)

(push 1)

(check-sat)

