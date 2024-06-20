; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71522 () Bool)

(assert start!71522)

(declare-fun res!264001 () Bool)

(declare-fun e!231688 () Bool)

(assert (=> start!71522 (=> (not res!264001) (not e!231688))))

(declare-fun i!747 () (_ BitVec 32))

(declare-fun nBits!568 () (_ BitVec 32))

(assert (=> start!71522 (= res!264001 (and (bvsle #b00000000000000000000000000000000 i!747) (bvsle i!747 nBits!568) (bvsle nBits!568 #b00000000000000000000000001000000)))))

(assert (=> start!71522 e!231688))

(assert (=> start!71522 true))

(declare-datatypes ((array!20442 0))(
  ( (array!20443 (arr!9991 (Array (_ BitVec 32) (_ BitVec 8))) (size!8899 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13960 0))(
  ( (BitStream!13961 (buf!8041 array!20442) (currentByte!14838 (_ BitVec 32)) (currentBit!14833 (_ BitVec 32))) )
))
(declare-fun thiss!1811 () BitStream!13960)

(declare-fun e!231690 () Bool)

(declare-fun inv!12 (BitStream!13960) Bool)

(assert (=> start!71522 (and (inv!12 thiss!1811) e!231690)))

(declare-fun b!321575 () Bool)

(declare-fun res!264000 () Bool)

(assert (=> b!321575 (=> (not res!264000) (not e!231688))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321575 (= res!264000 (validate_offset_bits!1 ((_ sign_extend 32) (size!8899 (buf!8041 thiss!1811))) ((_ sign_extend 32) (currentByte!14838 thiss!1811)) ((_ sign_extend 32) (currentBit!14833 thiss!1811)) ((_ sign_extend 32) (bvsub nBits!568 i!747))))))

(declare-fun b!321576 () Bool)

(assert (=> b!321576 (= e!231688 (bvsgt #b00000000000000000000000000000000 (bvsub #b00000000000000000000000001000000 i!747)))))

(declare-fun b!321577 () Bool)

(declare-fun array_inv!8451 (array!20442) Bool)

(assert (=> b!321577 (= e!231690 (array_inv!8451 (buf!8041 thiss!1811)))))

(assert (= (and start!71522 res!264001) b!321575))

(assert (= (and b!321575 res!264000) b!321576))

(assert (= start!71522 b!321577))

(declare-fun m!459939 () Bool)

(assert (=> start!71522 m!459939))

(declare-fun m!459941 () Bool)

(assert (=> b!321575 m!459941))

(declare-fun m!459943 () Bool)

(assert (=> b!321577 m!459943))

(push 1)

(assert (not b!321577))

(assert (not b!321575))

(assert (not start!71522))

(check-sat)

(pop 1)

(push 1)

(check-sat)

