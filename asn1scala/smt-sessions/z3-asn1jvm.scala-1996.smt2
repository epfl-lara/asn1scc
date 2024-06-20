; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51160 () Bool)

(assert start!51160)

(declare-fun i!492 () (_ BitVec 32))

(declare-datatypes ((array!12765 0))(
  ( (array!12766 (arr!6596 (Array (_ BitVec 32) (_ BitVec 8))) (size!5609 (_ BitVec 32))) )
))
(declare-fun charSet!5 () array!12765)

(declare-fun ret!59 () (_ BitVec 32))

(assert (=> start!51160 (and (bvsge i!492 #b00000000000000000000000000000000) (bvsle i!492 (size!5609 charSet!5)) (bvslt ret!59 (size!5609 charSet!5)) (bvslt i!492 (size!5609 charSet!5)) (= ret!59 #b00000000000000000000000000000000) (= (bvand i!492 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand i!492 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!492) #b10000000000000000000000000000000))))))

(assert (=> start!51160 true))

(declare-fun array_inv!5350 (array!12765) Bool)

(assert (=> start!51160 (array_inv!5350 charSet!5)))

(declare-fun bs!20175 () Bool)

(assert (= bs!20175 start!51160))

(declare-fun m!361025 () Bool)

(assert (=> bs!20175 m!361025))

(check-sat (not start!51160))
(check-sat)
