; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37338 () Bool)

(assert start!37338)

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8975 0))(
  ( (array!8976 (arr!4898 (Array (_ BitVec 32) (_ BitVec 8))) (size!3974 (_ BitVec 32))) )
))
(declare-fun arr1!28 () array!8975)

(declare-fun arr2!28 () array!8975)

(declare-fun fromArr2!3 () (_ BitVec 64))

(assert (=> start!37338 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3974 arr1!28)))) (not (= ((_ sign_extend 32) (size!3974 arr2!28)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3974 arr2!28))) ((_ sign_extend 32) (size!3974 arr2!28))))))))

(assert (=> start!37338 true))

(declare-fun array_inv!3715 (array!8975) Bool)

(assert (=> start!37338 (array_inv!3715 arr1!28)))

(assert (=> start!37338 (array_inv!3715 arr2!28)))

(declare-fun bs!14884 () Bool)

(assert (= bs!14884 start!37338))

(declare-fun m!269179 () Bool)

(assert (=> bs!14884 m!269179))

(declare-fun m!269181 () Bool)

(assert (=> bs!14884 m!269181))

(check-sat (not start!37338))
(check-sat)
