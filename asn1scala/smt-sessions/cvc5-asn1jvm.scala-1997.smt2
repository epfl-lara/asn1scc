; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51164 () Bool)

(assert start!51164)

(declare-fun ret!59 () (_ BitVec 32))

(declare-fun ch!5 () (_ BitVec 8))

(declare-fun i!492 () (_ BitVec 32))

(declare-datatypes ((array!12769 0))(
  ( (array!12770 (arr!6598 (Array (_ BitVec 32) (_ BitVec 8))) (size!5611 (_ BitVec 32))) )
))
(declare-fun charSet!5 () array!12769)

(declare-datatypes ((Unit!17449 0))(
  ( (Unit!17450) )
))
(declare-datatypes ((tuple2!20220 0))(
  ( (tuple2!20221 (_1!11026 Unit!17449) (_2!11026 (_ BitVec 32))) )
))
(declare-fun Unit!17451 () Unit!17449)

(declare-fun Unit!17452 () Unit!17449)

(assert (=> start!51164 (and (bvsge i!492 #b00000000000000000000000000000000) (bvsle i!492 (size!5611 charSet!5)) (bvslt ret!59 (size!5611 charSet!5)) (bvslt i!492 (size!5611 charSet!5)) (= ret!59 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!492) (size!5611 charSet!5)) (= (_2!11026 (ite (= ((_ sign_extend 24) ch!5) ((_ sign_extend 24) (select (arr!6598 charSet!5) i!492))) (tuple2!20221 Unit!17451 i!492) (tuple2!20221 Unit!17452 ret!59))) #b00000000000000000000000000000000) (bvsge (bvsub (size!5611 charSet!5) (bvadd #b00000000000000000000000000000001 i!492)) (bvsub (size!5611 charSet!5) i!492)))))

(assert (=> start!51164 true))

(declare-fun array_inv!5352 (array!12769) Bool)

(assert (=> start!51164 (array_inv!5352 charSet!5)))

(declare-fun bs!20180 () Bool)

(assert (= bs!20180 start!51164))

(declare-fun m!361029 () Bool)

(assert (=> bs!20180 m!361029))

(declare-fun m!361031 () Bool)

(assert (=> bs!20180 m!361031))

(push 1)

(assert (not start!51164))

(check-sat)

(pop 1)

(push 1)

(check-sat)

