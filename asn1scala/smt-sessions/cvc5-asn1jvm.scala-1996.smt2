; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51158 () Bool)

(assert start!51158)

(declare-fun i!492 () (_ BitVec 32))

(declare-datatypes ((array!12763 0))(
  ( (array!12764 (arr!6595 (Array (_ BitVec 32) (_ BitVec 8))) (size!5608 (_ BitVec 32))) )
))
(declare-fun charSet!5 () array!12763)

(declare-fun ret!59 () (_ BitVec 32))

(assert (=> start!51158 (and (bvsge i!492 #b00000000000000000000000000000000) (bvsle i!492 (size!5608 charSet!5)) (bvslt ret!59 (size!5608 charSet!5)) (bvslt i!492 (size!5608 charSet!5)) (= ret!59 #b00000000000000000000000000000000) (= (bvand i!492 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand i!492 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!492) #b10000000000000000000000000000000))))))

(assert (=> start!51158 true))

(declare-fun array_inv!5349 (array!12763) Bool)

(assert (=> start!51158 (array_inv!5349 charSet!5)))

(declare-fun bs!20174 () Bool)

(assert (= bs!20174 start!51158))

(declare-fun m!361023 () Bool)

(assert (=> bs!20174 m!361023))

(push 1)

(assert (not start!51158))

(check-sat)

(pop 1)

(push 1)

(check-sat)

