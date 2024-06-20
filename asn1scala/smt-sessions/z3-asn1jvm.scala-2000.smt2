; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51208 () Bool)

(assert start!51208)

(declare-fun ret!59 () (_ BitVec 32))

(declare-datatypes ((array!12795 0))(
  ( (array!12796 (arr!6608 (Array (_ BitVec 32) (_ BitVec 8))) (size!5621 (_ BitVec 32))) )
))
(declare-fun charSet!5 () array!12795)

(declare-fun ch!5 () (_ BitVec 8))

(declare-fun i!492 () (_ BitVec 32))

(declare-datatypes ((Unit!17507 0))(
  ( (Unit!17508) )
))
(declare-datatypes ((tuple2!20240 0))(
  ( (tuple2!20241 (_1!11042 Unit!17507) (_2!11042 (_ BitVec 32))) )
))
(declare-fun Unit!17509 () Unit!17507)

(declare-fun Unit!17510 () Unit!17507)

(assert (=> start!51208 (and (bvsge i!492 #b00000000000000000000000000000000) (bvsle i!492 (size!5621 charSet!5)) (bvslt ret!59 (size!5621 charSet!5)) (bvslt i!492 (size!5621 charSet!5)) (= ret!59 #b00000000000000000000000000000000) (let ((bdg!14635 (ite (= ((_ sign_extend 24) ch!5) ((_ sign_extend 24) (select (arr!6608 charSet!5) i!492))) (tuple2!20241 Unit!17509 i!492) (tuple2!20241 Unit!17510 ret!59)))) (and (or (bvsge (bvadd #b00000000000000000000000000000001 i!492) (size!5621 charSet!5)) (not (= (_2!11042 bdg!14635) #b00000000000000000000000000000000))) (or (bvslt (bvadd #b00000000000000000000000000000001 i!492) #b00000000000000000000000000000000) (bvsge (_2!11042 bdg!14635) (size!5621 charSet!5)) (bvslt (_2!11042 bdg!14635) #b00000000000000000000000000000000)))))))

(assert (=> start!51208 true))

(declare-fun array_inv!5362 (array!12795) Bool)

(assert (=> start!51208 (array_inv!5362 charSet!5)))

(declare-fun bs!20193 () Bool)

(assert (= bs!20193 start!51208))

(declare-fun m!361105 () Bool)

(assert (=> bs!20193 m!361105))

(declare-fun m!361107 () Bool)

(assert (=> bs!20193 m!361107))

(check-sat (not start!51208))
(check-sat)
