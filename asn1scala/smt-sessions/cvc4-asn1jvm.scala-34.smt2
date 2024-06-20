; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!720 () Bool)

(assert start!720)

(declare-fun b!2280 () Bool)

(declare-fun res!4021 () Bool)

(declare-fun e!1615 () Bool)

(assert (=> b!2280 (=> (not res!4021) (not e!1615))))

(declare-datatypes ((array!217 0))(
  ( (array!218 (arr!474 (Array (_ BitVec 32) (_ BitVec 8))) (size!87 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!152 0))(
  ( (BitStream!153 (buf!396 array!217) (currentByte!1351 (_ BitVec 32)) (currentBit!1346 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!128 0))(
  ( (Unit!129) )
))
(declare-datatypes ((tuple2!168 0))(
  ( (tuple2!169 (_1!91 Unit!128) (_2!91 BitStream!152)) )
))
(declare-fun lt!1780 () tuple2!168)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!152)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2280 (= res!4021 (= (bitIndex!0 (size!87 (buf!396 (_2!91 lt!1780))) (currentByte!1351 (_2!91 lt!1780)) (currentBit!1346 (_2!91 lt!1780))) (bvadd (bitIndex!0 (size!87 (buf!396 thiss!1486)) (currentByte!1351 thiss!1486) (currentBit!1346 thiss!1486)) nBits!460)))))

(declare-fun b!2282 () Bool)

(declare-fun res!4020 () Bool)

(declare-fun e!1617 () Bool)

(assert (=> b!2282 (=> (not res!4020) (not e!1617))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2282 (= res!4020 (validate_offset_bits!1 ((_ sign_extend 32) (size!87 (buf!396 thiss!1486))) ((_ sign_extend 32) (currentByte!1351 thiss!1486)) ((_ sign_extend 32) (currentBit!1346 thiss!1486)) nBits!460))))

(declare-fun b!2283 () Bool)

(declare-fun e!1616 () Bool)

(declare-fun array_inv!82 (array!217) Bool)

(assert (=> b!2283 (= e!1616 (array_inv!82 (buf!396 thiss!1486)))))

(declare-fun b!2284 () Bool)

(declare-fun res!4019 () Bool)

(assert (=> b!2284 (=> (not res!4019) (not e!1615))))

(assert (=> b!2284 (= res!4019 (= (size!87 (buf!396 thiss!1486)) (size!87 (buf!396 (_2!91 lt!1780)))))))

(declare-fun b!2285 () Bool)

(assert (=> b!2285 (= e!1615 false)))

(declare-datatypes ((tuple2!170 0))(
  ( (tuple2!171 (_1!92 BitStream!152) (_2!92 BitStream!152)) )
))
(declare-fun lt!1781 () tuple2!170)

(declare-fun reader!0 (BitStream!152 BitStream!152) tuple2!170)

(assert (=> b!2285 (= lt!1781 (reader!0 thiss!1486 (_2!91 lt!1780)))))

(declare-fun b!2286 () Bool)

(assert (=> b!2286 (= e!1617 e!1615)))

(declare-fun res!4016 () Bool)

(assert (=> b!2286 (=> (not res!4016) (not e!1615))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2286 (= res!4016 (invariant!0 (currentBit!1346 (_2!91 lt!1780)) (currentByte!1351 (_2!91 lt!1780)) (size!87 (buf!396 (_2!91 lt!1780)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!217)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!152 array!217 (_ BitVec 64) (_ BitVec 64)) tuple2!168)

(assert (=> b!2286 (= lt!1780 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun res!4017 () Bool)

(assert (=> start!720 (=> (not res!4017) (not e!1617))))

(assert (=> start!720 (= res!4017 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!87 srcBuffer!6))))))))

(assert (=> start!720 e!1617))

(assert (=> start!720 true))

(assert (=> start!720 (array_inv!82 srcBuffer!6)))

(declare-fun inv!12 (BitStream!152) Bool)

(assert (=> start!720 (and (inv!12 thiss!1486) e!1616)))

(declare-fun b!2281 () Bool)

(declare-fun res!4018 () Bool)

(assert (=> b!2281 (=> (not res!4018) (not e!1615))))

(declare-fun isPrefixOf!0 (BitStream!152 BitStream!152) Bool)

(assert (=> b!2281 (= res!4018 (isPrefixOf!0 thiss!1486 (_2!91 lt!1780)))))

(assert (= (and start!720 res!4017) b!2282))

(assert (= (and b!2282 res!4020) b!2286))

(assert (= (and b!2286 res!4016) b!2284))

(assert (= (and b!2284 res!4019) b!2280))

(assert (= (and b!2280 res!4021) b!2281))

(assert (= (and b!2281 res!4018) b!2285))

(assert (= start!720 b!2283))

(declare-fun m!1915 () Bool)

(assert (=> b!2285 m!1915))

(declare-fun m!1917 () Bool)

(assert (=> start!720 m!1917))

(declare-fun m!1919 () Bool)

(assert (=> start!720 m!1919))

(declare-fun m!1921 () Bool)

(assert (=> b!2281 m!1921))

(declare-fun m!1923 () Bool)

(assert (=> b!2286 m!1923))

(declare-fun m!1925 () Bool)

(assert (=> b!2286 m!1925))

(declare-fun m!1927 () Bool)

(assert (=> b!2280 m!1927))

(declare-fun m!1929 () Bool)

(assert (=> b!2280 m!1929))

(declare-fun m!1931 () Bool)

(assert (=> b!2283 m!1931))

(declare-fun m!1933 () Bool)

(assert (=> b!2282 m!1933))

(push 1)

(assert (not b!2285))

(assert (not b!2280))

(assert (not b!2282))

(assert (not b!2286))

(assert (not b!2281))

(assert (not b!2283))

(assert (not start!720))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

