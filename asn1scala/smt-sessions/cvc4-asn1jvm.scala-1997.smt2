; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51168 () Bool)

(assert start!51168)

(declare-fun ret!59 () (_ BitVec 32))

(declare-datatypes ((array!12773 0))(
  ( (array!12774 (arr!6600 (Array (_ BitVec 32) (_ BitVec 8))) (size!5613 (_ BitVec 32))) )
))
(declare-fun charSet!5 () array!12773)

(declare-fun ch!5 () (_ BitVec 8))

(declare-fun i!492 () (_ BitVec 32))

(declare-datatypes ((Unit!17457 0))(
  ( (Unit!17458) )
))
(declare-datatypes ((tuple2!20224 0))(
  ( (tuple2!20225 (_1!11028 Unit!17457) (_2!11028 (_ BitVec 32))) )
))
(declare-fun Unit!17459 () Unit!17457)

(declare-fun Unit!17460 () Unit!17457)

(assert (=> start!51168 (and (bvsge i!492 #b00000000000000000000000000000000) (bvsle i!492 (size!5613 charSet!5)) (bvslt ret!59 (size!5613 charSet!5)) (bvslt i!492 (size!5613 charSet!5)) (= ret!59 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!492) (size!5613 charSet!5)) (= (_2!11028 (ite (= ((_ sign_extend 24) ch!5) ((_ sign_extend 24) (select (arr!6600 charSet!5) i!492))) (tuple2!20225 Unit!17459 i!492) (tuple2!20225 Unit!17460 ret!59))) #b00000000000000000000000000000000) (bvsge (bvsub (size!5613 charSet!5) (bvadd #b00000000000000000000000000000001 i!492)) (bvsub (size!5613 charSet!5) i!492)))))

(assert (=> start!51168 true))

(declare-fun array_inv!5354 (array!12773) Bool)

(assert (=> start!51168 (array_inv!5354 charSet!5)))

(declare-fun bs!20182 () Bool)

(assert (= bs!20182 start!51168))

(declare-fun m!361037 () Bool)

(assert (=> bs!20182 m!361037))

(declare-fun m!361039 () Bool)

(assert (=> bs!20182 m!361039))

(push 1)

(assert (not start!51168))

(check-sat)

(pop 1)

(push 1)

(check-sat)

