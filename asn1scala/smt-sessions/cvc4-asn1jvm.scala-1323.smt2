; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37340 () Bool)

(assert start!37340)

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8977 0))(
  ( (array!8978 (arr!4899 (Array (_ BitVec 32) (_ BitVec 8))) (size!3975 (_ BitVec 32))) )
))
(declare-fun arr1!28 () array!8977)

(declare-fun arr2!28 () array!8977)

(declare-fun fromArr2!3 () (_ BitVec 64))

(assert (=> start!37340 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3975 arr1!28)))) (not (= ((_ sign_extend 32) (size!3975 arr2!28)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3975 arr2!28))) ((_ sign_extend 32) (size!3975 arr2!28))))))))

(assert (=> start!37340 true))

(declare-fun array_inv!3716 (array!8977) Bool)

(assert (=> start!37340 (array_inv!3716 arr1!28)))

(assert (=> start!37340 (array_inv!3716 arr2!28)))

(declare-fun bs!14885 () Bool)

(assert (= bs!14885 start!37340))

(declare-fun m!269183 () Bool)

(assert (=> bs!14885 m!269183))

(declare-fun m!269185 () Bool)

(assert (=> bs!14885 m!269185))

(push 1)

(assert (not start!37340))

(check-sat)

(pop 1)

(push 1)

(check-sat)

