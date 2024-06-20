; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51162 () Bool)

(assert start!51162)

(declare-fun i!492 () (_ BitVec 32))

(declare-datatypes ((array!12767 0))(
  ( (array!12768 (arr!6597 (Array (_ BitVec 32) (_ BitVec 8))) (size!5610 (_ BitVec 32))) )
))
(declare-fun charSet!5 () array!12767)

(declare-fun ret!59 () (_ BitVec 32))

(assert (=> start!51162 (and (bvsge i!492 #b00000000000000000000000000000000) (bvsle i!492 (size!5610 charSet!5)) (bvslt ret!59 (size!5610 charSet!5)) (bvslt i!492 (size!5610 charSet!5)) (= ret!59 #b00000000000000000000000000000000) (= (bvand i!492 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand i!492 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!492) #b10000000000000000000000000000000))))))

(assert (=> start!51162 true))

(declare-fun array_inv!5351 (array!12767) Bool)

(assert (=> start!51162 (array_inv!5351 charSet!5)))

(declare-fun bs!20176 () Bool)

(assert (= bs!20176 start!51162))

(declare-fun m!361027 () Bool)

(assert (=> bs!20176 m!361027))

(push 1)

(assert (not start!51162))

(check-sat)

(pop 1)

(push 1)

(check-sat)

