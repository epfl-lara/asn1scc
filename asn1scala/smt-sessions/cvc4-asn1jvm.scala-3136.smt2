; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72072 () Bool)

(assert start!72072)

(declare-fun res!265291 () Bool)

(declare-fun e!232845 () Bool)

(assert (=> start!72072 (=> (not res!265291) (not e!232845))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> start!72072 (= res!265291 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72072 e!232845))

(assert (=> start!72072 true))

(declare-datatypes ((array!20636 0))(
  ( (array!20637 (arr!10074 (Array (_ BitVec 32) (_ BitVec 8))) (size!8982 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14126 0))(
  ( (BitStream!14127 (buf!8124 array!20636) (currentByte!14989 (_ BitVec 32)) (currentBit!14984 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14126)

(declare-fun e!232848 () Bool)

(declare-fun inv!12 (BitStream!14126) Bool)

(assert (=> start!72072 (and (inv!12 thiss!1793) e!232848)))

(declare-fun b!323175 () Bool)

(declare-fun array_inv!8534 (array!20636) Bool)

(assert (=> b!323175 (= e!232848 (array_inv!8534 (buf!8124 thiss!1793)))))

(declare-fun b!323176 () Bool)

(declare-fun res!265293 () Bool)

(declare-fun e!232847 () Bool)

(assert (=> b!323176 (=> (not res!265293) (not e!232847))))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!323176 (= res!265293 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (= nBits!548 i!743)))))

(declare-fun b!323177 () Bool)

(declare-fun res!265294 () Bool)

(assert (=> b!323177 (=> (not res!265294) (not e!232847))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323177 (= res!265294 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!323178 () Bool)

(declare-fun lt!445817 () (_ BitVec 64))

(declare-fun lt!445816 () (_ BitVec 64))

(declare-fun lt!445815 () (_ BitVec 64))

(assert (=> b!323178 (= e!232847 (and (= lt!445815 (bvand lt!445817 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!445815 (bvand (bvadd lt!445816 lt!445817) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!323178 (= lt!445815 (bvand lt!445816 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323178 (= lt!445816 (bitIndex!0 (size!8982 (buf!8124 thiss!1793)) (currentByte!14989 thiss!1793) (currentBit!14984 thiss!1793)))))

(declare-fun b!323179 () Bool)

(assert (=> b!323179 (= e!232845 e!232847)))

(declare-fun res!265292 () Bool)

(assert (=> b!323179 (=> (not res!265292) (not e!232847))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323179 (= res!265292 (validate_offset_bits!1 ((_ sign_extend 32) (size!8982 (buf!8124 thiss!1793))) ((_ sign_extend 32) (currentByte!14989 thiss!1793)) ((_ sign_extend 32) (currentBit!14984 thiss!1793)) lt!445817))))

(assert (=> b!323179 (= lt!445817 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(assert (= (and start!72072 res!265291) b!323179))

(assert (= (and b!323179 res!265292) b!323177))

(assert (= (and b!323177 res!265294) b!323176))

(assert (= (and b!323176 res!265293) b!323178))

(assert (= start!72072 b!323175))

(declare-fun m!461339 () Bool)

(assert (=> b!323175 m!461339))

(declare-fun m!461341 () Bool)

(assert (=> b!323177 m!461341))

(declare-fun m!461343 () Bool)

(assert (=> b!323179 m!461343))

(declare-fun m!461345 () Bool)

(assert (=> b!323178 m!461345))

(declare-fun m!461347 () Bool)

(assert (=> start!72072 m!461347))

(push 1)

(assert (not b!323175))

(assert (not b!323178))

(assert (not b!323177))

(assert (not start!72072))

(assert (not b!323179))

(check-sat)

(pop 1)

(push 1)

(check-sat)

