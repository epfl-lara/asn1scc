; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49690 () Bool)

(assert start!49690)

(declare-fun b!234415 () Bool)

(declare-fun e!162054 () Bool)

(declare-fun i!546 () (_ BitVec 32))

(declare-fun nBits!274 () (_ BitVec 32))

(assert (=> b!234415 (= e!162054 (bvsgt i!546 nBits!274))))

(declare-fun b!234416 () Bool)

(declare-fun res!196053 () Bool)

(assert (=> b!234416 (=> (not res!196053) (not e!162054))))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234416 (= res!196053 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun b!234417 () Bool)

(declare-fun res!196050 () Bool)

(assert (=> b!234417 (=> (not res!196050) (not e!162054))))

(assert (=> b!234417 (= res!196050 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234418 () Bool)

(declare-fun res!196052 () Bool)

(assert (=> b!234418 (=> (not res!196052) (not e!162054))))

(declare-datatypes ((array!12286 0))(
  ( (array!12287 (arr!6386 (Array (_ BitVec 32) (_ BitVec 8))) (size!5399 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9762 0))(
  ( (BitStream!9763 (buf!5874 array!12286) (currentByte!10929 (_ BitVec 32)) (currentBit!10924 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9762)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!234418 (= res!196052 (validate_offset_bits!1 ((_ sign_extend 32) (size!5399 (buf!5874 bs!63))) ((_ sign_extend 32) (currentByte!10929 bs!63)) ((_ sign_extend 32) (currentBit!10924 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!234419 () Bool)

(declare-fun e!162055 () Bool)

(declare-fun array_inv!5140 (array!12286) Bool)

(assert (=> b!234419 (= e!162055 (array_inv!5140 (buf!5874 bs!63)))))

(declare-fun res!196051 () Bool)

(assert (=> start!49690 (=> (not res!196051) (not e!162054))))

(assert (=> start!49690 (= res!196051 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!49690 e!162054))

(assert (=> start!49690 true))

(declare-fun inv!12 (BitStream!9762) Bool)

(assert (=> start!49690 (and (inv!12 bs!63) e!162055)))

(assert (= (and start!49690 res!196051) b!234418))

(assert (= (and b!234418 res!196052) b!234417))

(assert (= (and b!234417 res!196050) b!234416))

(assert (= (and b!234416 res!196053) b!234415))

(assert (= start!49690 b!234419))

(declare-fun m!357023 () Bool)

(assert (=> b!234416 m!357023))

(declare-fun m!357025 () Bool)

(assert (=> start!49690 m!357025))

(declare-fun m!357027 () Bool)

(assert (=> b!234418 m!357027))

(declare-fun m!357029 () Bool)

(assert (=> b!234417 m!357029))

(declare-fun m!357031 () Bool)

(assert (=> b!234419 m!357031))

(check-sat (not b!234418) (not b!234416) (not start!49690) (not b!234417) (not b!234419))
(check-sat)
