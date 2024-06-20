; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72126 () Bool)

(assert start!72126)

(declare-fun b!323345 () Bool)

(declare-fun e!232956 () Bool)

(declare-fun i!743 () (_ BitVec 32))

(assert (=> b!323345 (= e!232956 (or (bvslt ((_ sign_extend 32) i!743) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt ((_ sign_extend 32) i!743) #b0000000000000000000000000000000000000000000000000000000001000000)))))

(declare-fun b!323346 () Bool)

(declare-fun res!265436 () Bool)

(assert (=> b!323346 (=> (not res!265436) (not e!232956))))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-datatypes ((array!20657 0))(
  ( (array!20658 (arr!10083 (Array (_ BitVec 32) (_ BitVec 8))) (size!8991 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14144 0))(
  ( (BitStream!14145 (buf!8133 array!20657) (currentByte!15004 (_ BitVec 32)) (currentBit!14999 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14144)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323346 (= res!265436 (validate_offset_bits!1 ((_ sign_extend 32) (size!8991 (buf!8133 thiss!1793))) ((_ sign_extend 32) (currentByte!15004 thiss!1793)) ((_ sign_extend 32) (currentBit!14999 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun res!265434 () Bool)

(assert (=> start!72126 (=> (not res!265434) (not e!232956))))

(assert (=> start!72126 (= res!265434 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72126 e!232956))

(assert (=> start!72126 true))

(declare-fun e!232955 () Bool)

(declare-fun inv!12 (BitStream!14144) Bool)

(assert (=> start!72126 (and (inv!12 thiss!1793) e!232955)))

(declare-fun b!323347 () Bool)

(declare-fun res!265437 () Bool)

(assert (=> b!323347 (=> (not res!265437) (not e!232956))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323347 (= res!265437 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!323348 () Bool)

(declare-fun res!265435 () Bool)

(assert (=> b!323348 (=> (not res!265435) (not e!232956))))

(assert (=> b!323348 (= res!265435 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!323349 () Bool)

(declare-fun res!265438 () Bool)

(assert (=> b!323349 (=> (not res!265438) (not e!232956))))

(declare-datatypes ((tuple2!23658 0))(
  ( (tuple2!23659 (_1!13458 Bool) (_2!13458 BitStream!14144)) )
))
(declare-fun readBit!0 (BitStream!14144) tuple2!23658)

(assert (=> b!323349 (= res!265438 (_1!13458 (readBit!0 thiss!1793)))))

(declare-fun b!323350 () Bool)

(declare-fun array_inv!8543 (array!20657) Bool)

(assert (=> b!323350 (= e!232955 (array_inv!8543 (buf!8133 thiss!1793)))))

(assert (= (and start!72126 res!265434) b!323346))

(assert (= (and b!323346 res!265436) b!323347))

(assert (= (and b!323347 res!265437) b!323348))

(assert (= (and b!323348 res!265435) b!323349))

(assert (= (and b!323349 res!265438) b!323345))

(assert (= start!72126 b!323350))

(declare-fun m!461447 () Bool)

(assert (=> start!72126 m!461447))

(declare-fun m!461449 () Bool)

(assert (=> b!323346 m!461449))

(declare-fun m!461451 () Bool)

(assert (=> b!323350 m!461451))

(declare-fun m!461453 () Bool)

(assert (=> b!323349 m!461453))

(declare-fun m!461455 () Bool)

(assert (=> b!323347 m!461455))

(push 1)

(assert (not b!323346))

(assert (not start!72126))

(assert (not b!323349))

(assert (not b!323350))

(assert (not b!323347))

(check-sat)

(pop 1)

(push 1)

(check-sat)

