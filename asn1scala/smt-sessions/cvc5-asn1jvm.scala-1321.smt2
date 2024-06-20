; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37324 () Bool)

(assert start!37324)

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8961 0))(
  ( (array!8962 (arr!4891 (Array (_ BitVec 32) (_ BitVec 8))) (size!3967 (_ BitVec 32))) )
))
(declare-fun arr1!28 () array!8961)

(declare-fun fromArr2!3 () (_ BitVec 64))

(assert (=> start!37324 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (not (= ((_ sign_extend 32) (size!3967 arr1!28)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3967 arr1!28))) ((_ sign_extend 32) (size!3967 arr1!28))))))))

(assert (=> start!37324 true))

(declare-fun array_inv!3708 (array!8961) Bool)

(assert (=> start!37324 (array_inv!3708 arr1!28)))

(declare-fun bs!14871 () Bool)

(assert (= bs!14871 start!37324))

(declare-fun m!269163 () Bool)

(assert (=> bs!14871 m!269163))

(push 1)

(assert (not start!37324))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

