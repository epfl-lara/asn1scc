; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51154 () Bool)

(assert start!51154)

(declare-fun i!492 () (_ BitVec 32))

(declare-datatypes ((array!12759 0))(
  ( (array!12760 (arr!6593 (Array (_ BitVec 32) (_ BitVec 8))) (size!5606 (_ BitVec 32))) )
))
(declare-fun charSet!5 () array!12759)

(declare-fun ret!59 () (_ BitVec 32))

(assert (=> start!51154 (and (bvsge i!492 #b00000000000000000000000000000000) (bvsle i!492 (size!5606 charSet!5)) (bvslt ret!59 (size!5606 charSet!5)) (bvslt i!492 (size!5606 charSet!5)) (= ret!59 #b00000000000000000000000000000000) (not (= (bvand (size!5606 charSet!5) #b10000000000000000000000000000000) (bvand i!492 #b10000000000000000000000000000000))) (not (= (bvand (size!5606 charSet!5) #b10000000000000000000000000000000) (bvand (bvsub (size!5606 charSet!5) i!492) #b10000000000000000000000000000000))))))

(assert (=> start!51154 true))

(declare-fun array_inv!5347 (array!12759) Bool)

(assert (=> start!51154 (array_inv!5347 charSet!5)))

(declare-fun bs!20169 () Bool)

(assert (= bs!20169 start!51154))

(declare-fun m!361019 () Bool)

(assert (=> bs!20169 m!361019))

(check-sat (not start!51154))
(check-sat)
