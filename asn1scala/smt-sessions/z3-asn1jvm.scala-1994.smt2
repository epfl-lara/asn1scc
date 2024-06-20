; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51148 () Bool)

(assert start!51148)

(declare-fun ret!59 () (_ BitVec 32))

(declare-datatypes ((array!12753 0))(
  ( (array!12754 (arr!6590 (Array (_ BitVec 32) (_ BitVec 8))) (size!5603 (_ BitVec 32))) )
))
(declare-fun charSet!5 () array!12753)

(declare-fun ch!5 () (_ BitVec 8))

(declare-fun i!492 () (_ BitVec 32))

(declare-datatypes ((Unit!17441 0))(
  ( (Unit!17442) )
))
(declare-datatypes ((tuple2!20216 0))(
  ( (tuple2!20217 (_1!11024 Unit!17441) (_2!11024 (_ BitVec 32))) )
))
(declare-fun Unit!17443 () Unit!17441)

(declare-fun Unit!17444 () Unit!17441)

(assert (=> start!51148 (and (bvsge i!492 #b00000000000000000000000000000000) (bvsle i!492 (size!5603 charSet!5)) (bvslt ret!59 (size!5603 charSet!5)) (bvslt i!492 (size!5603 charSet!5)) (= ret!59 #b00000000000000000000000000000000) (let ((bdg!14630 (ite (= ((_ sign_extend 24) ch!5) ((_ sign_extend 24) (select (arr!6590 charSet!5) i!492))) (tuple2!20217 Unit!17443 i!492) (tuple2!20217 Unit!17444 ret!59)))) (and (bvslt (bvadd #b00000000000000000000000000000001 i!492) (size!5603 charSet!5)) (= (_2!11024 bdg!14630) #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 i!492) #b00000000000000000000000000000000) (bvsge (_2!11024 bdg!14630) (size!5603 charSet!5)) (bvslt (_2!11024 bdg!14630) #b00000000000000000000000000000000)))))))

(assert (=> start!51148 true))

(declare-fun array_inv!5344 (array!12753) Bool)

(assert (=> start!51148 (array_inv!5344 charSet!5)))

(declare-fun bs!20163 () Bool)

(assert (= bs!20163 start!51148))

(declare-fun m!361009 () Bool)

(assert (=> bs!20163 m!361009))

(declare-fun m!361011 () Bool)

(assert (=> bs!20163 m!361011))

(check-sat (not start!51148))
(check-sat)
