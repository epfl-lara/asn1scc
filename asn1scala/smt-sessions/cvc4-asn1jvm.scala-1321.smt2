; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37328 () Bool)

(assert start!37328)

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8965 0))(
  ( (array!8966 (arr!4893 (Array (_ BitVec 32) (_ BitVec 8))) (size!3969 (_ BitVec 32))) )
))
(declare-fun arr1!28 () array!8965)

(declare-fun fromArr2!3 () (_ BitVec 64))

(assert (=> start!37328 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (not (= ((_ sign_extend 32) (size!3969 arr1!28)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3969 arr1!28))) ((_ sign_extend 32) (size!3969 arr1!28))))))))

(assert (=> start!37328 true))

(declare-fun array_inv!3710 (array!8965) Bool)

(assert (=> start!37328 (array_inv!3710 arr1!28)))

(declare-fun bs!14873 () Bool)

(assert (= bs!14873 start!37328))

(declare-fun m!269167 () Bool)

(assert (=> bs!14873 m!269167))

(push 1)

(assert (not start!37328))

(check-sat)

(pop 1)

(push 1)

(check-sat)

