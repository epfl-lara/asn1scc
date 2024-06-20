; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51166 () Bool)

(assert start!51166)

(declare-fun ret!59 () (_ BitVec 32))

(declare-datatypes ((array!12771 0))(
  ( (array!12772 (arr!6599 (Array (_ BitVec 32) (_ BitVec 8))) (size!5612 (_ BitVec 32))) )
))
(declare-fun charSet!5 () array!12771)

(declare-fun ch!5 () (_ BitVec 8))

(declare-fun i!492 () (_ BitVec 32))

(declare-datatypes ((Unit!17453 0))(
  ( (Unit!17454) )
))
(declare-datatypes ((tuple2!20222 0))(
  ( (tuple2!20223 (_1!11027 Unit!17453) (_2!11027 (_ BitVec 32))) )
))
(declare-fun Unit!17455 () Unit!17453)

(declare-fun Unit!17456 () Unit!17453)

(assert (=> start!51166 (and (bvsge i!492 #b00000000000000000000000000000000) (bvsle i!492 (size!5612 charSet!5)) (bvslt ret!59 (size!5612 charSet!5)) (bvslt i!492 (size!5612 charSet!5)) (= ret!59 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!492) (size!5612 charSet!5)) (= (_2!11027 (ite (= ((_ sign_extend 24) ch!5) ((_ sign_extend 24) (select (arr!6599 charSet!5) i!492))) (tuple2!20223 Unit!17455 i!492) (tuple2!20223 Unit!17456 ret!59))) #b00000000000000000000000000000000) (bvsge (bvsub (size!5612 charSet!5) (bvadd #b00000000000000000000000000000001 i!492)) (bvsub (size!5612 charSet!5) i!492)))))

(assert (=> start!51166 true))

(declare-fun array_inv!5353 (array!12771) Bool)

(assert (=> start!51166 (array_inv!5353 charSet!5)))

(declare-fun bs!20181 () Bool)

(assert (= bs!20181 start!51166))

(declare-fun m!361033 () Bool)

(assert (=> bs!20181 m!361033))

(declare-fun m!361035 () Bool)

(assert (=> bs!20181 m!361035))

(check-sat (not start!51166))
(check-sat)
