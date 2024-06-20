; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71664 () Bool)

(assert start!71664)

(declare-fun i!743 () (_ BitVec 32))

(declare-fun b!321843 () Bool)

(declare-fun lt!444661 () (_ BitVec 64))

(declare-fun lt!444662 () (_ BitVec 64))

(declare-fun e!231941 () Bool)

(assert (=> b!321843 (= e!231941 (and (= lt!444662 (bvadd lt!444662 lt!444661)) (bvsgt i!743 #b00000000000000000000000001000000)))))

(declare-datatypes ((array!20510 0))(
  ( (array!20511 (arr!10020 (Array (_ BitVec 32) (_ BitVec 8))) (size!8928 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14018 0))(
  ( (BitStream!14019 (buf!8070 array!20510) (currentByte!14881 (_ BitVec 32)) (currentBit!14876 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14018)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321843 (= lt!444662 (bitIndex!0 (size!8928 (buf!8070 thiss!1793)) (currentByte!14881 thiss!1793) (currentBit!14876 thiss!1793)))))

(declare-fun res!264183 () Bool)

(declare-fun e!231940 () Bool)

(assert (=> start!71664 (=> (not res!264183) (not e!231940))))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> start!71664 (= res!264183 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71664 e!231940))

(assert (=> start!71664 true))

(declare-fun e!231942 () Bool)

(declare-fun inv!12 (BitStream!14018) Bool)

(assert (=> start!71664 (and (inv!12 thiss!1793) e!231942)))

(declare-fun b!321844 () Bool)

(declare-fun res!264182 () Bool)

(assert (=> b!321844 (=> (not res!264182) (not e!231941))))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!321844 (= res!264182 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (= nBits!548 i!743)))))

(declare-fun b!321845 () Bool)

(declare-fun res!264181 () Bool)

(assert (=> b!321845 (=> (not res!264181) (not e!231941))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321845 (= res!264181 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!321846 () Bool)

(assert (=> b!321846 (= e!231940 e!231941)))

(declare-fun res!264184 () Bool)

(assert (=> b!321846 (=> (not res!264184) (not e!231941))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321846 (= res!264184 (validate_offset_bits!1 ((_ sign_extend 32) (size!8928 (buf!8070 thiss!1793))) ((_ sign_extend 32) (currentByte!14881 thiss!1793)) ((_ sign_extend 32) (currentBit!14876 thiss!1793)) lt!444661))))

(assert (=> b!321846 (= lt!444661 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(declare-fun b!321847 () Bool)

(declare-fun array_inv!8480 (array!20510) Bool)

(assert (=> b!321847 (= e!231942 (array_inv!8480 (buf!8070 thiss!1793)))))

(assert (= (and start!71664 res!264183) b!321846))

(assert (= (and b!321846 res!264184) b!321845))

(assert (= (and b!321845 res!264181) b!321844))

(assert (= (and b!321844 res!264182) b!321843))

(assert (= start!71664 b!321847))

(declare-fun m!460151 () Bool)

(assert (=> start!71664 m!460151))

(declare-fun m!460153 () Bool)

(assert (=> b!321843 m!460153))

(declare-fun m!460155 () Bool)

(assert (=> b!321847 m!460155))

(declare-fun m!460157 () Bool)

(assert (=> b!321846 m!460157))

(declare-fun m!460159 () Bool)

(assert (=> b!321845 m!460159))

(push 1)

(assert (not b!321843))

(assert (not start!71664))

(assert (not b!321847))

(assert (not b!321845))

(assert (not b!321846))

(check-sat)

(pop 1)

(push 1)

(check-sat)

