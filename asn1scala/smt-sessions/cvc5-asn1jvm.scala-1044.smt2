; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29992 () Bool)

(assert start!29992)

(declare-datatypes ((array!6938 0))(
  ( (array!6939 (arr!3950 (Array (_ BitVec 32) (_ BitVec 8))) (size!3127 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5512 0))(
  ( (BitStream!5513 (buf!3630 array!6938) (currentByte!6643 (_ BitVec 32)) (currentBit!6638 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5512)

(declare-fun bs2!18 () BitStream!5512)

(assert (=> start!29992 (and (= (size!3127 (buf!3630 bs1!10)) (size!3127 (buf!3630 bs2!18))) (not (= ((_ sign_extend 32) (size!3127 (buf!3630 bs1!10))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3127 (buf!3630 bs1!10)))) ((_ sign_extend 32) (size!3127 (buf!3630 bs1!10)))))))))

(declare-fun e!103356 () Bool)

(declare-fun inv!12 (BitStream!5512) Bool)

(assert (=> start!29992 (and (inv!12 bs1!10) e!103356)))

(declare-fun e!103358 () Bool)

(assert (=> start!29992 (and (inv!12 bs2!18) e!103358)))

(declare-fun b!153970 () Bool)

(declare-fun array_inv!2916 (array!6938) Bool)

(assert (=> b!153970 (= e!103356 (array_inv!2916 (buf!3630 bs1!10)))))

(declare-fun b!153971 () Bool)

(assert (=> b!153971 (= e!103358 (array_inv!2916 (buf!3630 bs2!18)))))

(assert (= start!29992 b!153970))

(assert (= start!29992 b!153971))

(declare-fun m!239959 () Bool)

(assert (=> start!29992 m!239959))

(declare-fun m!239961 () Bool)

(assert (=> start!29992 m!239961))

(declare-fun m!239963 () Bool)

(assert (=> b!153970 m!239963))

(declare-fun m!239965 () Bool)

(assert (=> b!153971 m!239965))

(push 1)

(assert (not start!29992))

(assert (not b!153971))

(assert (not b!153970))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

