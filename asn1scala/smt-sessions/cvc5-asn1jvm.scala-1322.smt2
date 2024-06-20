; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37330 () Bool)

(assert start!37330)

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8967 0))(
  ( (array!8968 (arr!4894 (Array (_ BitVec 32) (_ BitVec 8))) (size!3970 (_ BitVec 32))) )
))
(declare-fun arr1!28 () array!8967)

(declare-fun fromArr2!3 () (_ BitVec 64))

(assert (=> start!37330 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3970 arr1!28)))) (= (bvand fromArr2!3 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!499 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand fromArr2!3 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd fromArr2!3 nBits!499) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!37330 true))

(declare-fun array_inv!3711 (array!8967) Bool)

(assert (=> start!37330 (array_inv!3711 arr1!28)))

(declare-fun bs!14877 () Bool)

(assert (= bs!14877 start!37330))

(declare-fun m!269169 () Bool)

(assert (=> bs!14877 m!269169))

(push 1)

(assert (not start!37330))

(check-sat)

(pop 1)

(push 1)

(check-sat)

