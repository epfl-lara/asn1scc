; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71586 () Bool)

(assert start!71586)

(declare-fun res!264075 () Bool)

(declare-fun e!231852 () Bool)

(assert (=> start!71586 (=> (not res!264075) (not e!231852))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> start!71586 (= res!264075 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71586 e!231852))

(assert (=> start!71586 true))

(declare-datatypes ((array!20486 0))(
  ( (array!20487 (arr!10011 (Array (_ BitVec 32) (_ BitVec 8))) (size!8919 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14000 0))(
  ( (BitStream!14001 (buf!8061 array!20486) (currentByte!14860 (_ BitVec 32)) (currentBit!14855 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14000)

(declare-fun e!231851 () Bool)

(declare-fun inv!12 (BitStream!14000) Bool)

(assert (=> start!71586 (and (inv!12 thiss!1793) e!231851)))

(declare-fun b!321710 () Bool)

(declare-fun res!264076 () Bool)

(assert (=> b!321710 (=> (not res!264076) (not e!231852))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321710 (= res!264076 (validate_offset_bits!1 ((_ sign_extend 32) (size!8919 (buf!8061 thiss!1793))) ((_ sign_extend 32) (currentByte!14860 thiss!1793)) ((_ sign_extend 32) (currentBit!14855 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!321711 () Bool)

(assert (=> b!321711 (= e!231852 (bvsgt #b00000000000000000000000000000000 (bvsub #b00000000000000000000000001000000 i!743)))))

(declare-fun b!321712 () Bool)

(declare-fun array_inv!8471 (array!20486) Bool)

(assert (=> b!321712 (= e!231851 (array_inv!8471 (buf!8061 thiss!1793)))))

(assert (= (and start!71586 res!264075) b!321710))

(assert (= (and b!321710 res!264076) b!321711))

(assert (= start!71586 b!321712))

(declare-fun m!460053 () Bool)

(assert (=> start!71586 m!460053))

(declare-fun m!460055 () Bool)

(assert (=> b!321710 m!460055))

(declare-fun m!460057 () Bool)

(assert (=> b!321712 m!460057))

(push 1)

(assert (not b!321712))

(assert (not start!71586))

(assert (not b!321710))

(check-sat)

(pop 1)

(push 1)

(check-sat)

