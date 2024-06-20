; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37326 () Bool)

(assert start!37326)

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8963 0))(
  ( (array!8964 (arr!4892 (Array (_ BitVec 32) (_ BitVec 8))) (size!3968 (_ BitVec 32))) )
))
(declare-fun arr1!28 () array!8963)

(declare-fun fromArr2!3 () (_ BitVec 64))

(assert (=> start!37326 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (not (= ((_ sign_extend 32) (size!3968 arr1!28)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3968 arr1!28))) ((_ sign_extend 32) (size!3968 arr1!28))))))))

(assert (=> start!37326 true))

(declare-fun array_inv!3709 (array!8963) Bool)

(assert (=> start!37326 (array_inv!3709 arr1!28)))

(declare-fun bs!14872 () Bool)

(assert (= bs!14872 start!37326))

(declare-fun m!269165 () Bool)

(assert (=> bs!14872 m!269165))

(check-sat (not start!37326))
(check-sat)
