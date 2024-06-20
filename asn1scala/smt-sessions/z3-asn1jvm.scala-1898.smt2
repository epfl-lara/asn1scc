; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49684 () Bool)

(assert start!49684)

(declare-fun res!196019 () Bool)

(declare-fun e!162027 () Bool)

(assert (=> start!49684 (=> (not res!196019) (not e!162027))))

(declare-fun i!546 () (_ BitVec 32))

(declare-fun nBits!274 () (_ BitVec 32))

(assert (=> start!49684 (= res!196019 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!49684 e!162027))

(assert (=> start!49684 true))

(declare-datatypes ((array!12280 0))(
  ( (array!12281 (arr!6383 (Array (_ BitVec 32) (_ BitVec 8))) (size!5396 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9756 0))(
  ( (BitStream!9757 (buf!5871 array!12280) (currentByte!10926 (_ BitVec 32)) (currentBit!10921 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9756)

(declare-fun e!162029 () Bool)

(declare-fun inv!12 (BitStream!9756) Bool)

(assert (=> start!49684 (and (inv!12 bs!63) e!162029)))

(declare-fun b!234374 () Bool)

(declare-fun res!196018 () Bool)

(assert (=> b!234374 (=> (not res!196018) (not e!162027))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!234374 (= res!196018 (validate_offset_bits!1 ((_ sign_extend 32) (size!5396 (buf!5871 bs!63))) ((_ sign_extend 32) (currentByte!10926 bs!63)) ((_ sign_extend 32) (currentBit!10921 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!234376 () Bool)

(assert (=> b!234376 (= e!162027 (bvsgt #b00000000000000000000000000000000 nBits!274))))

(declare-fun b!234375 () Bool)

(declare-fun res!196020 () Bool)

(assert (=> b!234375 (=> (not res!196020) (not e!162027))))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234375 (= res!196020 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234377 () Bool)

(declare-fun array_inv!5137 (array!12280) Bool)

(assert (=> b!234377 (= e!162029 (array_inv!5137 (buf!5871 bs!63)))))

(assert (= (and start!49684 res!196019) b!234374))

(assert (= (and b!234374 res!196018) b!234375))

(assert (= (and b!234375 res!196020) b!234376))

(assert (= start!49684 b!234377))

(declare-fun m!356997 () Bool)

(assert (=> start!49684 m!356997))

(declare-fun m!356999 () Bool)

(assert (=> b!234374 m!356999))

(declare-fun m!357001 () Bool)

(assert (=> b!234375 m!357001))

(declare-fun m!357003 () Bool)

(assert (=> b!234377 m!357003))

(check-sat (not start!49684) (not b!234374) (not b!234377) (not b!234375))
(check-sat)
