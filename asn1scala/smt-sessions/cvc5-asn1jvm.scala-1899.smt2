; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49688 () Bool)

(assert start!49688)

(declare-fun b!234400 () Bool)

(declare-fun res!196040 () Bool)

(declare-fun e!162046 () Bool)

(assert (=> b!234400 (=> (not res!196040) (not e!162046))))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun i!546 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234400 (= res!196040 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234401 () Bool)

(declare-fun e!162045 () Bool)

(declare-datatypes ((array!12284 0))(
  ( (array!12285 (arr!6385 (Array (_ BitVec 32) (_ BitVec 8))) (size!5398 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9760 0))(
  ( (BitStream!9761 (buf!5873 array!12284) (currentByte!10928 (_ BitVec 32)) (currentBit!10923 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9760)

(declare-fun array_inv!5139 (array!12284) Bool)

(assert (=> b!234401 (= e!162045 (array_inv!5139 (buf!5873 bs!63)))))

(declare-fun b!234402 () Bool)

(declare-fun res!196041 () Bool)

(assert (=> b!234402 (=> (not res!196041) (not e!162046))))

(assert (=> b!234402 (= res!196041 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun b!234403 () Bool)

(assert (=> b!234403 (= e!162046 (bvsgt i!546 nBits!274))))

(declare-fun b!234404 () Bool)

(declare-fun res!196039 () Bool)

(assert (=> b!234404 (=> (not res!196039) (not e!162046))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!234404 (= res!196039 (validate_offset_bits!1 ((_ sign_extend 32) (size!5398 (buf!5873 bs!63))) ((_ sign_extend 32) (currentByte!10928 bs!63)) ((_ sign_extend 32) (currentBit!10923 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun res!196038 () Bool)

(assert (=> start!49688 (=> (not res!196038) (not e!162046))))

(assert (=> start!49688 (= res!196038 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!49688 e!162046))

(assert (=> start!49688 true))

(declare-fun inv!12 (BitStream!9760) Bool)

(assert (=> start!49688 (and (inv!12 bs!63) e!162045)))

(assert (= (and start!49688 res!196038) b!234404))

(assert (= (and b!234404 res!196039) b!234400))

(assert (= (and b!234400 res!196040) b!234402))

(assert (= (and b!234402 res!196041) b!234403))

(assert (= start!49688 b!234401))

(declare-fun m!357013 () Bool)

(assert (=> b!234400 m!357013))

(declare-fun m!357015 () Bool)

(assert (=> b!234402 m!357015))

(declare-fun m!357017 () Bool)

(assert (=> b!234401 m!357017))

(declare-fun m!357019 () Bool)

(assert (=> b!234404 m!357019))

(declare-fun m!357021 () Bool)

(assert (=> start!49688 m!357021))

(push 1)

(assert (not b!234401))

(assert (not b!234402))

(assert (not start!49688))

(assert (not b!234400))

(assert (not b!234404))

(check-sat)

(pop 1)

(push 1)

(check-sat)

