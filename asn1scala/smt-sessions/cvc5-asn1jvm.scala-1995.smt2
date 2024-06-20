; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51152 () Bool)

(assert start!51152)

(declare-fun i!492 () (_ BitVec 32))

(declare-datatypes ((array!12757 0))(
  ( (array!12758 (arr!6592 (Array (_ BitVec 32) (_ BitVec 8))) (size!5605 (_ BitVec 32))) )
))
(declare-fun charSet!5 () array!12757)

(declare-fun ret!59 () (_ BitVec 32))

(assert (=> start!51152 (and (bvsge i!492 #b00000000000000000000000000000000) (bvsle i!492 (size!5605 charSet!5)) (bvslt ret!59 (size!5605 charSet!5)) (bvslt i!492 (size!5605 charSet!5)) (= ret!59 #b00000000000000000000000000000000) (not (= (bvand (size!5605 charSet!5) #b10000000000000000000000000000000) (bvand i!492 #b10000000000000000000000000000000))) (not (= (bvand (size!5605 charSet!5) #b10000000000000000000000000000000) (bvand (bvsub (size!5605 charSet!5) i!492) #b10000000000000000000000000000000))))))

(assert (=> start!51152 true))

(declare-fun array_inv!5346 (array!12757) Bool)

(assert (=> start!51152 (array_inv!5346 charSet!5)))

(declare-fun bs!20168 () Bool)

(assert (= bs!20168 start!51152))

(declare-fun m!361017 () Bool)

(assert (=> bs!20168 m!361017))

(push 1)

(assert (not start!51152))

(check-sat)

(pop 1)

(push 1)

(check-sat)

