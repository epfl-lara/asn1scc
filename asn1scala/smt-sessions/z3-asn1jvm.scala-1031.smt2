; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29622 () Bool)

(assert start!29622)

(declare-fun res!127994 () Bool)

(declare-fun e!102212 () Bool)

(assert (=> start!29622 (=> (not res!127994) (not e!102212))))

(declare-datatypes ((array!6841 0))(
  ( (array!6842 (arr!3912 (Array (_ BitVec 32) (_ BitVec 8))) (size!3089 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5436 0))(
  ( (BitStream!5437 (buf!3592 array!6841) (currentByte!6563 (_ BitVec 32)) (currentBit!6558 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5436)

(declare-fun bs2!18 () BitStream!5436)

(assert (=> start!29622 (= res!127994 (= (size!3089 (buf!3592 bs1!10)) (size!3089 (buf!3592 bs2!18))))))

(assert (=> start!29622 e!102212))

(declare-fun e!102215 () Bool)

(declare-fun inv!12 (BitStream!5436) Bool)

(assert (=> start!29622 (and (inv!12 bs1!10) e!102215)))

(declare-fun e!102216 () Bool)

(assert (=> start!29622 (and (inv!12 bs2!18) e!102216)))

(declare-fun b!152717 () Bool)

(declare-fun res!127995 () Bool)

(assert (=> b!152717 (=> (not res!127995) (not e!102212))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!152717 (= res!127995 (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3089 (buf!3592 bs1!10)) (currentByte!6563 bs1!10) (currentBit!6558 bs1!10))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3089 (buf!3592 bs1!10))))))))

(declare-fun b!152719 () Bool)

(declare-fun array_inv!2878 (array!6841) Bool)

(assert (=> b!152719 (= e!102215 (array_inv!2878 (buf!3592 bs1!10)))))

(declare-fun b!152718 () Bool)

(assert (=> b!152718 (= e!102212 false)))

(declare-fun lt!239197 () (_ BitVec 64))

(assert (=> b!152718 (= lt!239197 (bitIndex!0 (size!3089 (buf!3592 bs2!18)) (currentByte!6563 bs2!18) (currentBit!6558 bs2!18)))))

(declare-fun b!152720 () Bool)

(assert (=> b!152720 (= e!102216 (array_inv!2878 (buf!3592 bs2!18)))))

(assert (= (and start!29622 res!127994) b!152717))

(assert (= (and b!152717 res!127995) b!152718))

(assert (= start!29622 b!152719))

(assert (= start!29622 b!152720))

(declare-fun m!238561 () Bool)

(assert (=> b!152720 m!238561))

(declare-fun m!238563 () Bool)

(assert (=> b!152718 m!238563))

(declare-fun m!238565 () Bool)

(assert (=> b!152717 m!238565))

(declare-fun m!238567 () Bool)

(assert (=> start!29622 m!238567))

(declare-fun m!238569 () Bool)

(assert (=> start!29622 m!238569))

(declare-fun m!238571 () Bool)

(assert (=> b!152719 m!238571))

(check-sat (not b!152720) (not start!29622) (not b!152719) (not b!152718) (not b!152717))
