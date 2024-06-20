; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71670 () Bool)

(assert start!71670)

(declare-fun b!321888 () Bool)

(declare-fun e!231976 () Bool)

(declare-datatypes ((array!20516 0))(
  ( (array!20517 (arr!10023 (Array (_ BitVec 32) (_ BitVec 8))) (size!8931 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14024 0))(
  ( (BitStream!14025 (buf!8073 array!20516) (currentByte!14884 (_ BitVec 32)) (currentBit!14879 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14024)

(declare-fun array_inv!8483 (array!20516) Bool)

(assert (=> b!321888 (= e!231976 (array_inv!8483 (buf!8073 thiss!1793)))))

(declare-fun b!321889 () Bool)

(declare-fun e!231977 () Bool)

(declare-fun e!231975 () Bool)

(assert (=> b!321889 (= e!231977 e!231975)))

(declare-fun res!264219 () Bool)

(assert (=> b!321889 (=> (not res!264219) (not e!231975))))

(declare-fun lt!444679 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321889 (= res!264219 (validate_offset_bits!1 ((_ sign_extend 32) (size!8931 (buf!8073 thiss!1793))) ((_ sign_extend 32) (currentByte!14884 thiss!1793)) ((_ sign_extend 32) (currentBit!14879 thiss!1793)) lt!444679))))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun i!743 () (_ BitVec 32))

(assert (=> b!321889 (= lt!444679 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(declare-fun lt!444680 () (_ BitVec 64))

(declare-fun b!321890 () Bool)

(assert (=> b!321890 (= e!231975 (and (= lt!444680 (bvadd lt!444680 lt!444679)) (bvsgt i!743 #b00000000000000000000000001000000)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321890 (= lt!444680 (bitIndex!0 (size!8931 (buf!8073 thiss!1793)) (currentByte!14884 thiss!1793) (currentBit!14879 thiss!1793)))))

(declare-fun b!321891 () Bool)

(declare-fun res!264218 () Bool)

(assert (=> b!321891 (=> (not res!264218) (not e!231975))))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!321891 (= res!264218 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (= nBits!548 i!743)))))

(declare-fun res!264217 () Bool)

(assert (=> start!71670 (=> (not res!264217) (not e!231977))))

(assert (=> start!71670 (= res!264217 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71670 e!231977))

(assert (=> start!71670 true))

(declare-fun inv!12 (BitStream!14024) Bool)

(assert (=> start!71670 (and (inv!12 thiss!1793) e!231976)))

(declare-fun b!321892 () Bool)

(declare-fun res!264220 () Bool)

(assert (=> b!321892 (=> (not res!264220) (not e!231975))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321892 (= res!264220 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!71670 res!264217) b!321889))

(assert (= (and b!321889 res!264219) b!321892))

(assert (= (and b!321892 res!264220) b!321891))

(assert (= (and b!321891 res!264218) b!321890))

(assert (= start!71670 b!321888))

(declare-fun m!460181 () Bool)

(assert (=> b!321892 m!460181))

(declare-fun m!460183 () Bool)

(assert (=> start!71670 m!460183))

(declare-fun m!460185 () Bool)

(assert (=> b!321888 m!460185))

(declare-fun m!460187 () Bool)

(assert (=> b!321890 m!460187))

(declare-fun m!460189 () Bool)

(assert (=> b!321889 m!460189))

(push 1)

(assert (not b!321892))

(assert (not b!321889))

(assert (not b!321888))

(assert (not b!321890))

(assert (not start!71670))

(check-sat)

(pop 1)

(push 1)

(check-sat)

