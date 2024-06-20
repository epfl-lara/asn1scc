; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37336 () Bool)

(assert start!37336)

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8973 0))(
  ( (array!8974 (arr!4897 (Array (_ BitVec 32) (_ BitVec 8))) (size!3973 (_ BitVec 32))) )
))
(declare-fun arr1!28 () array!8973)

(declare-fun arr2!28 () array!8973)

(declare-fun fromArr2!3 () (_ BitVec 64))

(assert (=> start!37336 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3973 arr1!28)))) (not (= ((_ sign_extend 32) (size!3973 arr2!28)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3973 arr2!28))) ((_ sign_extend 32) (size!3973 arr2!28))))))))

(assert (=> start!37336 true))

(declare-fun array_inv!3714 (array!8973) Bool)

(assert (=> start!37336 (array_inv!3714 arr1!28)))

(assert (=> start!37336 (array_inv!3714 arr2!28)))

(declare-fun bs!14883 () Bool)

(assert (= bs!14883 start!37336))

(declare-fun m!269175 () Bool)

(assert (=> bs!14883 m!269175))

(declare-fun m!269177 () Bool)

(assert (=> bs!14883 m!269177))

(push 1)

(assert (not start!37336))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

