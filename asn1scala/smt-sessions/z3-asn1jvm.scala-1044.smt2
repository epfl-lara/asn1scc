; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29994 () Bool)

(assert start!29994)

(declare-datatypes ((array!6940 0))(
  ( (array!6941 (arr!3951 (Array (_ BitVec 32) (_ BitVec 8))) (size!3128 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5514 0))(
  ( (BitStream!5515 (buf!3631 array!6940) (currentByte!6644 (_ BitVec 32)) (currentBit!6639 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5514)

(declare-fun bs2!18 () BitStream!5514)

(assert (=> start!29994 (and (= (size!3128 (buf!3631 bs1!10)) (size!3128 (buf!3631 bs2!18))) (not (= ((_ sign_extend 32) (size!3128 (buf!3631 bs1!10))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3128 (buf!3631 bs1!10)))) ((_ sign_extend 32) (size!3128 (buf!3631 bs1!10)))))))))

(declare-fun e!103368 () Bool)

(declare-fun inv!12 (BitStream!5514) Bool)

(assert (=> start!29994 (and (inv!12 bs1!10) e!103368)))

(declare-fun e!103370 () Bool)

(assert (=> start!29994 (and (inv!12 bs2!18) e!103370)))

(declare-fun b!153976 () Bool)

(declare-fun array_inv!2917 (array!6940) Bool)

(assert (=> b!153976 (= e!103368 (array_inv!2917 (buf!3631 bs1!10)))))

(declare-fun b!153977 () Bool)

(assert (=> b!153977 (= e!103370 (array_inv!2917 (buf!3631 bs2!18)))))

(assert (= start!29994 b!153976))

(assert (= start!29994 b!153977))

(declare-fun m!239967 () Bool)

(assert (=> start!29994 m!239967))

(declare-fun m!239969 () Bool)

(assert (=> start!29994 m!239969))

(declare-fun m!239971 () Bool)

(assert (=> b!153976 m!239971))

(declare-fun m!239973 () Bool)

(assert (=> b!153977 m!239973))

(check-sat (not b!153977) (not b!153976) (not start!29994))
(check-sat)
