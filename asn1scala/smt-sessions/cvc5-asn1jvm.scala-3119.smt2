; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71672 () Bool)

(assert start!71672)

(declare-fun b!321903 () Bool)

(declare-fun res!264229 () Bool)

(declare-fun e!231990 () Bool)

(assert (=> b!321903 (=> (not res!264229) (not e!231990))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321903 (= res!264229 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!321904 () Bool)

(declare-fun e!231987 () Bool)

(declare-datatypes ((array!20518 0))(
  ( (array!20519 (arr!10024 (Array (_ BitVec 32) (_ BitVec 8))) (size!8932 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14026 0))(
  ( (BitStream!14027 (buf!8074 array!20518) (currentByte!14885 (_ BitVec 32)) (currentBit!14880 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14026)

(declare-fun array_inv!8484 (array!20518) Bool)

(assert (=> b!321904 (= e!231987 (array_inv!8484 (buf!8074 thiss!1793)))))

(declare-fun b!321905 () Bool)

(declare-fun res!264232 () Bool)

(assert (=> b!321905 (=> (not res!264232) (not e!231990))))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> b!321905 (= res!264232 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (= nBits!548 i!743)))))

(declare-fun res!264231 () Bool)

(declare-fun e!231989 () Bool)

(assert (=> start!71672 (=> (not res!264231) (not e!231989))))

(assert (=> start!71672 (= res!264231 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71672 e!231989))

(assert (=> start!71672 true))

(declare-fun inv!12 (BitStream!14026) Bool)

(assert (=> start!71672 (and (inv!12 thiss!1793) e!231987)))

(declare-fun lt!444685 () (_ BitVec 64))

(declare-fun b!321906 () Bool)

(declare-fun lt!444686 () (_ BitVec 64))

(assert (=> b!321906 (= e!231990 (and (= lt!444685 (bvadd lt!444685 lt!444686)) (bvsgt #b00000000000000000000000000000000 nBits!548)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321906 (= lt!444685 (bitIndex!0 (size!8932 (buf!8074 thiss!1793)) (currentByte!14885 thiss!1793) (currentBit!14880 thiss!1793)))))

(declare-fun b!321907 () Bool)

(assert (=> b!321907 (= e!231989 e!231990)))

(declare-fun res!264230 () Bool)

(assert (=> b!321907 (=> (not res!264230) (not e!231990))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321907 (= res!264230 (validate_offset_bits!1 ((_ sign_extend 32) (size!8932 (buf!8074 thiss!1793))) ((_ sign_extend 32) (currentByte!14885 thiss!1793)) ((_ sign_extend 32) (currentBit!14880 thiss!1793)) lt!444686))))

(assert (=> b!321907 (= lt!444686 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(assert (= (and start!71672 res!264231) b!321907))

(assert (= (and b!321907 res!264230) b!321903))

(assert (= (and b!321903 res!264229) b!321905))

(assert (= (and b!321905 res!264232) b!321906))

(assert (= start!71672 b!321904))

(declare-fun m!460191 () Bool)

(assert (=> start!71672 m!460191))

(declare-fun m!460193 () Bool)

(assert (=> b!321907 m!460193))

(declare-fun m!460195 () Bool)

(assert (=> b!321903 m!460195))

(declare-fun m!460197 () Bool)

(assert (=> b!321906 m!460197))

(declare-fun m!460199 () Bool)

(assert (=> b!321904 m!460199))

(push 1)

(assert (not start!71672))

(assert (not b!321904))

(assert (not b!321903))

(assert (not b!321906))

(assert (not b!321907))

(check-sat)

(pop 1)

(push 1)

(check-sat)

