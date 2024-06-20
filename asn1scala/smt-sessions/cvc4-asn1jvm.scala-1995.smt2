; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51156 () Bool)

(assert start!51156)

(declare-fun i!492 () (_ BitVec 32))

(declare-datatypes ((array!12761 0))(
  ( (array!12762 (arr!6594 (Array (_ BitVec 32) (_ BitVec 8))) (size!5607 (_ BitVec 32))) )
))
(declare-fun charSet!5 () array!12761)

(declare-fun ret!59 () (_ BitVec 32))

(assert (=> start!51156 (and (bvsge i!492 #b00000000000000000000000000000000) (bvsle i!492 (size!5607 charSet!5)) (bvslt ret!59 (size!5607 charSet!5)) (bvslt i!492 (size!5607 charSet!5)) (= ret!59 #b00000000000000000000000000000000) (not (= (bvand (size!5607 charSet!5) #b10000000000000000000000000000000) (bvand i!492 #b10000000000000000000000000000000))) (not (= (bvand (size!5607 charSet!5) #b10000000000000000000000000000000) (bvand (bvsub (size!5607 charSet!5) i!492) #b10000000000000000000000000000000))))))

(assert (=> start!51156 true))

(declare-fun array_inv!5348 (array!12761) Bool)

(assert (=> start!51156 (array_inv!5348 charSet!5)))

(declare-fun bs!20170 () Bool)

(assert (= bs!20170 start!51156))

(declare-fun m!361021 () Bool)

(assert (=> bs!20170 m!361021))

(push 1)

(assert (not start!51156))

(check-sat)

(pop 1)

(push 1)

(check-sat)

