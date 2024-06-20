; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51210 () Bool)

(assert start!51210)

(declare-fun ret!59 () (_ BitVec 32))

(declare-datatypes ((array!12797 0))(
  ( (array!12798 (arr!6609 (Array (_ BitVec 32) (_ BitVec 8))) (size!5622 (_ BitVec 32))) )
))
(declare-fun charSet!5 () array!12797)

(declare-fun ch!5 () (_ BitVec 8))

(declare-fun i!492 () (_ BitVec 32))

(declare-datatypes ((Unit!17511 0))(
  ( (Unit!17512) )
))
(declare-datatypes ((tuple2!20242 0))(
  ( (tuple2!20243 (_1!11043 Unit!17511) (_2!11043 (_ BitVec 32))) )
))
(declare-fun Unit!17513 () Unit!17511)

(declare-fun Unit!17514 () Unit!17511)

(assert (=> start!51210 (and (bvsge i!492 #b00000000000000000000000000000000) (bvsle i!492 (size!5622 charSet!5)) (bvslt ret!59 (size!5622 charSet!5)) (bvslt i!492 (size!5622 charSet!5)) (= ret!59 #b00000000000000000000000000000000) (let ((bdg!14635 (ite (= ((_ sign_extend 24) ch!5) ((_ sign_extend 24) (select (arr!6609 charSet!5) i!492))) (tuple2!20243 Unit!17513 i!492) (tuple2!20243 Unit!17514 ret!59)))) (and (or (bvsge (bvadd #b00000000000000000000000000000001 i!492) (size!5622 charSet!5)) (not (= (_2!11043 bdg!14635) #b00000000000000000000000000000000))) (or (bvslt (bvadd #b00000000000000000000000000000001 i!492) #b00000000000000000000000000000000) (bvsge (_2!11043 bdg!14635) (size!5622 charSet!5)) (bvslt (_2!11043 bdg!14635) #b00000000000000000000000000000000)))))))

(assert (=> start!51210 true))

(declare-fun array_inv!5363 (array!12797) Bool)

(assert (=> start!51210 (array_inv!5363 charSet!5)))

(declare-fun bs!20194 () Bool)

(assert (= bs!20194 start!51210))

(declare-fun m!361109 () Bool)

(assert (=> bs!20194 m!361109))

(declare-fun m!361111 () Bool)

(assert (=> bs!20194 m!361111))

(push 1)

(assert (not start!51210))

(check-sat)

(pop 1)

(push 1)

(check-sat)

