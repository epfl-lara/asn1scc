; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29996 () Bool)

(assert start!29996)

(declare-datatypes ((array!6942 0))(
  ( (array!6943 (arr!3952 (Array (_ BitVec 32) (_ BitVec 8))) (size!3129 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5516 0))(
  ( (BitStream!5517 (buf!3632 array!6942) (currentByte!6645 (_ BitVec 32)) (currentBit!6640 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5516)

(declare-fun bs2!18 () BitStream!5516)

(assert (=> start!29996 (and (= (size!3129 (buf!3632 bs1!10)) (size!3129 (buf!3632 bs2!18))) (not (= ((_ sign_extend 32) (size!3129 (buf!3632 bs1!10))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3129 (buf!3632 bs1!10)))) ((_ sign_extend 32) (size!3129 (buf!3632 bs1!10)))))))))

(declare-fun e!103380 () Bool)

(declare-fun inv!12 (BitStream!5516) Bool)

(assert (=> start!29996 (and (inv!12 bs1!10) e!103380)))

(declare-fun e!103382 () Bool)

(assert (=> start!29996 (and (inv!12 bs2!18) e!103382)))

(declare-fun b!153982 () Bool)

(declare-fun array_inv!2918 (array!6942) Bool)

(assert (=> b!153982 (= e!103380 (array_inv!2918 (buf!3632 bs1!10)))))

(declare-fun b!153983 () Bool)

(assert (=> b!153983 (= e!103382 (array_inv!2918 (buf!3632 bs2!18)))))

(assert (= start!29996 b!153982))

(assert (= start!29996 b!153983))

(declare-fun m!239975 () Bool)

(assert (=> start!29996 m!239975))

(declare-fun m!239977 () Bool)

(assert (=> start!29996 m!239977))

(declare-fun m!239979 () Bool)

(assert (=> b!153982 m!239979))

(declare-fun m!239981 () Bool)

(assert (=> b!153983 m!239981))

(push 1)

(assert (not b!153983))

(assert (not b!153982))

(assert (not start!29996))

(check-sat)

(pop 1)

(push 1)

(check-sat)

