; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71668 () Bool)

(assert start!71668)

(declare-fun res!264205 () Bool)

(declare-fun e!231965 () Bool)

(assert (=> start!71668 (=> (not res!264205) (not e!231965))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> start!71668 (= res!264205 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71668 e!231965))

(assert (=> start!71668 true))

(declare-datatypes ((array!20514 0))(
  ( (array!20515 (arr!10022 (Array (_ BitVec 32) (_ BitVec 8))) (size!8930 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14022 0))(
  ( (BitStream!14023 (buf!8072 array!20514) (currentByte!14883 (_ BitVec 32)) (currentBit!14878 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14022)

(declare-fun e!231963 () Bool)

(declare-fun inv!12 (BitStream!14022) Bool)

(assert (=> start!71668 (and (inv!12 thiss!1793) e!231963)))

(declare-fun b!321873 () Bool)

(declare-fun e!231964 () Bool)

(assert (=> b!321873 (= e!231965 e!231964)))

(declare-fun res!264206 () Bool)

(assert (=> b!321873 (=> (not res!264206) (not e!231964))))

(declare-fun lt!444674 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321873 (= res!264206 (validate_offset_bits!1 ((_ sign_extend 32) (size!8930 (buf!8072 thiss!1793))) ((_ sign_extend 32) (currentByte!14883 thiss!1793)) ((_ sign_extend 32) (currentBit!14878 thiss!1793)) lt!444674))))

(assert (=> b!321873 (= lt!444674 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(declare-fun b!321874 () Bool)

(declare-fun lt!444673 () (_ BitVec 64))

(assert (=> b!321874 (= e!231964 (and (= lt!444673 (bvadd lt!444673 lt!444674)) (bvsgt i!743 #b00000000000000000000000001000000)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321874 (= lt!444673 (bitIndex!0 (size!8930 (buf!8072 thiss!1793)) (currentByte!14883 thiss!1793) (currentBit!14878 thiss!1793)))))

(declare-fun b!321875 () Bool)

(declare-fun res!264208 () Bool)

(assert (=> b!321875 (=> (not res!264208) (not e!231964))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321875 (= res!264208 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!321876 () Bool)

(declare-fun array_inv!8482 (array!20514) Bool)

(assert (=> b!321876 (= e!231963 (array_inv!8482 (buf!8072 thiss!1793)))))

(declare-fun b!321877 () Bool)

(declare-fun res!264207 () Bool)

(assert (=> b!321877 (=> (not res!264207) (not e!231964))))

(assert (=> b!321877 (= res!264207 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (= nBits!548 i!743)))))

(assert (= (and start!71668 res!264205) b!321873))

(assert (= (and b!321873 res!264206) b!321875))

(assert (= (and b!321875 res!264208) b!321877))

(assert (= (and b!321877 res!264207) b!321874))

(assert (= start!71668 b!321876))

(declare-fun m!460171 () Bool)

(assert (=> b!321873 m!460171))

(declare-fun m!460173 () Bool)

(assert (=> b!321874 m!460173))

(declare-fun m!460175 () Bool)

(assert (=> b!321875 m!460175))

(declare-fun m!460177 () Bool)

(assert (=> b!321876 m!460177))

(declare-fun m!460179 () Bool)

(assert (=> start!71668 m!460179))

(check-sat (not b!321873) (not b!321875) (not start!71668) (not b!321874) (not b!321876))
(check-sat)
