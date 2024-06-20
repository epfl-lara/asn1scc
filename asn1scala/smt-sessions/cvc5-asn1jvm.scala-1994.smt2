; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51146 () Bool)

(assert start!51146)

(declare-fun ret!59 () (_ BitVec 32))

(declare-datatypes ((array!12751 0))(
  ( (array!12752 (arr!6589 (Array (_ BitVec 32) (_ BitVec 8))) (size!5602 (_ BitVec 32))) )
))
(declare-fun charSet!5 () array!12751)

(declare-fun ch!5 () (_ BitVec 8))

(declare-fun i!492 () (_ BitVec 32))

(declare-datatypes ((Unit!17437 0))(
  ( (Unit!17438) )
))
(declare-datatypes ((tuple2!20214 0))(
  ( (tuple2!20215 (_1!11023 Unit!17437) (_2!11023 (_ BitVec 32))) )
))
(declare-fun Unit!17439 () Unit!17437)

(declare-fun Unit!17440 () Unit!17437)

(assert (=> start!51146 (and (bvsge i!492 #b00000000000000000000000000000000) (bvsle i!492 (size!5602 charSet!5)) (bvslt ret!59 (size!5602 charSet!5)) (bvslt i!492 (size!5602 charSet!5)) (= ret!59 #b00000000000000000000000000000000) (let ((bdg!14630 (ite (= ((_ sign_extend 24) ch!5) ((_ sign_extend 24) (select (arr!6589 charSet!5) i!492))) (tuple2!20215 Unit!17439 i!492) (tuple2!20215 Unit!17440 ret!59)))) (and (bvslt (bvadd #b00000000000000000000000000000001 i!492) (size!5602 charSet!5)) (= (_2!11023 bdg!14630) #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 i!492) #b00000000000000000000000000000000) (bvsge (_2!11023 bdg!14630) (size!5602 charSet!5)) (bvslt (_2!11023 bdg!14630) #b00000000000000000000000000000000)))))))

(assert (=> start!51146 true))

(declare-fun array_inv!5343 (array!12751) Bool)

(assert (=> start!51146 (array_inv!5343 charSet!5)))

(declare-fun bs!20162 () Bool)

(assert (= bs!20162 start!51146))

(declare-fun m!361005 () Bool)

(assert (=> bs!20162 m!361005))

(declare-fun m!361007 () Bool)

(assert (=> bs!20162 m!361007))

(push 1)

(assert (not start!51146))

(check-sat)

(pop 1)

(push 1)

(check-sat)

