; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50754 () Bool)

(assert start!50754)

(declare-fun b!237246 () Bool)

(declare-fun res!198300 () Bool)

(declare-fun e!164005 () Bool)

(assert (=> b!237246 (=> (not res!198300) (not e!164005))))

(declare-datatypes ((array!12599 0))(
  ( (array!12600 (arr!6516 (Array (_ BitVec 32) (_ BitVec 8))) (size!5529 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10022 0))(
  ( (BitStream!10023 (buf!6004 array!12599) (currentByte!11184 (_ BitVec 32)) (currentBit!11179 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10022)

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237246 (= res!198300 (validate_offset_bits!1 ((_ sign_extend 32) (size!5529 (buf!6004 thiss!1830))) ((_ sign_extend 32) (currentByte!11184 thiss!1830)) ((_ sign_extend 32) (currentBit!11179 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!237247 () Bool)

(assert (=> b!237247 (= e!164005 (and (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand i!752 #b10000000000000000000000000000000))) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 i!752) #b10000000000000000000000000000000)))))))

(declare-fun lt!372759 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237247 (= lt!372759 (bitIndex!0 (size!5529 (buf!6004 thiss!1830)) (currentByte!11184 thiss!1830) (currentBit!11179 thiss!1830)))))

(declare-fun b!237248 () Bool)

(declare-fun e!164004 () Bool)

(declare-fun array_inv!5270 (array!12599) Bool)

(assert (=> b!237248 (= e!164004 (array_inv!5270 (buf!6004 thiss!1830)))))

(declare-fun b!237249 () Bool)

(declare-fun res!198296 () Bool)

(assert (=> b!237249 (=> (not res!198296) (not e!164005))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237249 (= res!198296 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237251 () Bool)

(declare-fun res!198297 () Bool)

(assert (=> b!237251 (=> (not res!198297) (not e!164005))))

(assert (=> b!237251 (= res!198297 (= nBits!581 i!752))))

(declare-fun b!237250 () Bool)

(declare-fun res!198298 () Bool)

(assert (=> b!237250 (=> (not res!198298) (not e!164005))))

(assert (=> b!237250 (= res!198298 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun res!198299 () Bool)

(assert (=> start!50754 (=> (not res!198299) (not e!164005))))

(assert (=> start!50754 (= res!198299 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50754 e!164005))

(assert (=> start!50754 true))

(declare-fun inv!12 (BitStream!10022) Bool)

(assert (=> start!50754 (and (inv!12 thiss!1830) e!164004)))

(assert (= (and start!50754 res!198299) b!237246))

(assert (= (and b!237246 res!198300) b!237249))

(assert (= (and b!237249 res!198296) b!237250))

(assert (= (and b!237250 res!198298) b!237251))

(assert (= (and b!237251 res!198297) b!237247))

(assert (= start!50754 b!237248))

(declare-fun m!359763 () Bool)

(assert (=> b!237250 m!359763))

(declare-fun m!359765 () Bool)

(assert (=> b!237247 m!359765))

(declare-fun m!359767 () Bool)

(assert (=> b!237248 m!359767))

(declare-fun m!359769 () Bool)

(assert (=> start!50754 m!359769))

(declare-fun m!359771 () Bool)

(assert (=> b!237246 m!359771))

(declare-fun m!359773 () Bool)

(assert (=> b!237249 m!359773))

(push 1)

(assert (not b!237246))

(assert (not b!237248))

(assert (not b!237250))

(assert (not b!237249))

(assert (not start!50754))

(assert (not b!237247))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

