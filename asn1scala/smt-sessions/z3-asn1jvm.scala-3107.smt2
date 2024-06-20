; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71524 () Bool)

(assert start!71524)

(declare-fun res!264007 () Bool)

(declare-fun e!231699 () Bool)

(assert (=> start!71524 (=> (not res!264007) (not e!231699))))

(declare-fun i!747 () (_ BitVec 32))

(declare-fun nBits!568 () (_ BitVec 32))

(assert (=> start!71524 (= res!264007 (and (bvsle #b00000000000000000000000000000000 i!747) (bvsle i!747 nBits!568) (bvsle nBits!568 #b00000000000000000000000001000000)))))

(assert (=> start!71524 e!231699))

(assert (=> start!71524 true))

(declare-datatypes ((array!20444 0))(
  ( (array!20445 (arr!9992 (Array (_ BitVec 32) (_ BitVec 8))) (size!8900 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13962 0))(
  ( (BitStream!13963 (buf!8042 array!20444) (currentByte!14839 (_ BitVec 32)) (currentBit!14834 (_ BitVec 32))) )
))
(declare-fun thiss!1811 () BitStream!13962)

(declare-fun e!231697 () Bool)

(declare-fun inv!12 (BitStream!13962) Bool)

(assert (=> start!71524 (and (inv!12 thiss!1811) e!231697)))

(declare-fun b!321584 () Bool)

(declare-fun res!264006 () Bool)

(assert (=> b!321584 (=> (not res!264006) (not e!231699))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321584 (= res!264006 (validate_offset_bits!1 ((_ sign_extend 32) (size!8900 (buf!8042 thiss!1811))) ((_ sign_extend 32) (currentByte!14839 thiss!1811)) ((_ sign_extend 32) (currentBit!14834 thiss!1811)) ((_ sign_extend 32) (bvsub nBits!568 i!747))))))

(declare-fun b!321585 () Bool)

(assert (=> b!321585 (= e!231699 (bvsgt #b00000000000000000000000000000000 (bvsub #b00000000000000000000000001000000 i!747)))))

(declare-fun b!321586 () Bool)

(declare-fun array_inv!8452 (array!20444) Bool)

(assert (=> b!321586 (= e!231697 (array_inv!8452 (buf!8042 thiss!1811)))))

(assert (= (and start!71524 res!264007) b!321584))

(assert (= (and b!321584 res!264006) b!321585))

(assert (= start!71524 b!321586))

(declare-fun m!459945 () Bool)

(assert (=> start!71524 m!459945))

(declare-fun m!459947 () Bool)

(assert (=> b!321584 m!459947))

(declare-fun m!459949 () Bool)

(assert (=> b!321586 m!459949))

(check-sat (not b!321586) (not b!321584) (not start!71524))
(check-sat)
