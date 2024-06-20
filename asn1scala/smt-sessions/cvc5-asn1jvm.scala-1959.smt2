; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50834 () Bool)

(assert start!50834)

(declare-fun res!198923 () Bool)

(declare-fun e!164419 () Bool)

(assert (=> start!50834 (=> (not res!198923) (not e!164419))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50834 (= res!198923 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50834 e!164419))

(assert (=> start!50834 true))

(declare-datatypes ((array!12679 0))(
  ( (array!12680 (arr!6556 (Array (_ BitVec 32) (_ BitVec 8))) (size!5569 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10102 0))(
  ( (BitStream!10103 (buf!6044 array!12679) (currentByte!11224 (_ BitVec 32)) (currentBit!11219 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10102)

(declare-fun e!164418 () Bool)

(declare-fun inv!12 (BitStream!10102) Bool)

(assert (=> start!50834 (and (inv!12 thiss!1830) e!164418)))

(declare-fun b!237993 () Bool)

(assert (=> b!237993 (= e!164419 (bvsge (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) (bvsub nBits!581 i!752)))))

(declare-datatypes ((tuple2!20064 0))(
  ( (tuple2!20065 (_1!10936 Bool) (_2!10936 BitStream!10102)) )
))
(declare-fun lt!372933 () tuple2!20064)

(declare-fun readBit!0 (BitStream!10102) tuple2!20064)

(assert (=> b!237993 (= lt!372933 (readBit!0 thiss!1830))))

(declare-fun b!237994 () Bool)

(declare-fun res!198926 () Bool)

(assert (=> b!237994 (=> (not res!198926) (not e!164419))))

(assert (=> b!237994 (= res!198926 (not (= nBits!581 i!752)))))

(declare-fun b!237995 () Bool)

(declare-fun array_inv!5310 (array!12679) Bool)

(assert (=> b!237995 (= e!164418 (array_inv!5310 (buf!6044 thiss!1830)))))

(declare-fun b!237996 () Bool)

(declare-fun res!198924 () Bool)

(assert (=> b!237996 (=> (not res!198924) (not e!164419))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237996 (= res!198924 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237997 () Bool)

(declare-fun res!198927 () Bool)

(assert (=> b!237997 (=> (not res!198927) (not e!164419))))

(assert (=> b!237997 (= res!198927 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!237998 () Bool)

(declare-fun res!198925 () Bool)

(assert (=> b!237998 (=> (not res!198925) (not e!164419))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237998 (= res!198925 (validate_offset_bits!1 ((_ sign_extend 32) (size!5569 (buf!6044 thiss!1830))) ((_ sign_extend 32) (currentByte!11224 thiss!1830)) ((_ sign_extend 32) (currentBit!11219 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(assert (= (and start!50834 res!198923) b!237998))

(assert (= (and b!237998 res!198925) b!237996))

(assert (= (and b!237996 res!198924) b!237997))

(assert (= (and b!237997 res!198927) b!237994))

(assert (= (and b!237994 res!198926) b!237993))

(assert (= start!50834 b!237995))

(declare-fun m!360243 () Bool)

(assert (=> b!237996 m!360243))

(declare-fun m!360245 () Bool)

(assert (=> start!50834 m!360245))

(declare-fun m!360247 () Bool)

(assert (=> b!237995 m!360247))

(declare-fun m!360249 () Bool)

(assert (=> b!237998 m!360249))

(declare-fun m!360251 () Bool)

(assert (=> b!237993 m!360251))

(declare-fun m!360253 () Bool)

(assert (=> b!237997 m!360253))

(push 1)

(assert (not b!237997))

(assert (not b!237998))

(assert (not b!237993))

(assert (not b!237996))

(assert (not b!237995))

(assert (not start!50834))

(check-sat)

(pop 1)

(push 1)

(check-sat)

