; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71660 () Bool)

(assert start!71660)

(declare-fun b!321813 () Bool)

(declare-fun res!264157 () Bool)

(declare-fun e!231917 () Bool)

(assert (=> b!321813 (=> (not res!264157) (not e!231917))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!321813 (= res!264157 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (= nBits!548 i!743)))))

(declare-fun b!321814 () Bool)

(declare-fun e!231916 () Bool)

(declare-datatypes ((array!20506 0))(
  ( (array!20507 (arr!10018 (Array (_ BitVec 32) (_ BitVec 8))) (size!8926 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14014 0))(
  ( (BitStream!14015 (buf!8068 array!20506) (currentByte!14879 (_ BitVec 32)) (currentBit!14874 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14014)

(declare-fun array_inv!8478 (array!20506) Bool)

(assert (=> b!321814 (= e!231916 (array_inv!8478 (buf!8068 thiss!1793)))))

(declare-fun lt!444649 () (_ BitVec 64))

(declare-fun lt!444650 () (_ BitVec 64))

(declare-fun b!321815 () Bool)

(assert (=> b!321815 (= e!231917 (and (= lt!444649 (bvadd lt!444649 lt!444650)) (bvsgt i!743 #b00000000000000000000000001000000)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321815 (= lt!444649 (bitIndex!0 (size!8926 (buf!8068 thiss!1793)) (currentByte!14879 thiss!1793) (currentBit!14874 thiss!1793)))))

(declare-fun b!321816 () Bool)

(declare-fun e!231915 () Bool)

(assert (=> b!321816 (= e!231915 e!231917)))

(declare-fun res!264160 () Bool)

(assert (=> b!321816 (=> (not res!264160) (not e!231917))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321816 (= res!264160 (validate_offset_bits!1 ((_ sign_extend 32) (size!8926 (buf!8068 thiss!1793))) ((_ sign_extend 32) (currentByte!14879 thiss!1793)) ((_ sign_extend 32) (currentBit!14874 thiss!1793)) lt!444650))))

(assert (=> b!321816 (= lt!444650 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(declare-fun b!321817 () Bool)

(declare-fun res!264158 () Bool)

(assert (=> b!321817 (=> (not res!264158) (not e!231917))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321817 (= res!264158 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!264159 () Bool)

(assert (=> start!71660 (=> (not res!264159) (not e!231915))))

(assert (=> start!71660 (= res!264159 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71660 e!231915))

(assert (=> start!71660 true))

(declare-fun inv!12 (BitStream!14014) Bool)

(assert (=> start!71660 (and (inv!12 thiss!1793) e!231916)))

(assert (= (and start!71660 res!264159) b!321816))

(assert (= (and b!321816 res!264160) b!321817))

(assert (= (and b!321817 res!264158) b!321813))

(assert (= (and b!321813 res!264157) b!321815))

(assert (= start!71660 b!321814))

(declare-fun m!460131 () Bool)

(assert (=> b!321817 m!460131))

(declare-fun m!460133 () Bool)

(assert (=> b!321814 m!460133))

(declare-fun m!460135 () Bool)

(assert (=> b!321815 m!460135))

(declare-fun m!460137 () Bool)

(assert (=> start!71660 m!460137))

(declare-fun m!460139 () Bool)

(assert (=> b!321816 m!460139))

(push 1)

(assert (not start!71660))

(assert (not b!321817))

(assert (not b!321814))

(assert (not b!321816))

(assert (not b!321815))

(check-sat)

(pop 1)

(push 1)

(check-sat)

