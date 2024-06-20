; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50804 () Bool)

(assert start!50804)

(declare-fun b!237696 () Bool)

(declare-fun res!198675 () Bool)

(declare-fun e!164278 () Bool)

(assert (=> b!237696 (=> (not res!198675) (not e!164278))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237696 (= res!198675 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237697 () Bool)

(declare-fun res!198674 () Bool)

(assert (=> b!237697 (=> (not res!198674) (not e!164278))))

(assert (=> b!237697 (= res!198674 (= nBits!581 i!752))))

(declare-fun b!237698 () Bool)

(declare-fun lt!372890 () (_ BitVec 64))

(declare-fun lt!372891 () (_ BitVec 64))

(assert (=> b!237698 (= e!164278 (not (= lt!372890 (bvadd lt!372890 lt!372891))))))

(declare-datatypes ((array!12649 0))(
  ( (array!12650 (arr!6541 (Array (_ BitVec 32) (_ BitVec 8))) (size!5554 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10072 0))(
  ( (BitStream!10073 (buf!6029 array!12649) (currentByte!11209 (_ BitVec 32)) (currentBit!11204 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10072)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237698 (= lt!372890 (bitIndex!0 (size!5554 (buf!6029 thiss!1830)) (currentByte!11209 thiss!1830) (currentBit!11204 thiss!1830)))))

(declare-fun b!237699 () Bool)

(declare-fun res!198671 () Bool)

(assert (=> b!237699 (=> (not res!198671) (not e!164278))))

(assert (=> b!237699 (= res!198671 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun res!198672 () Bool)

(declare-fun e!164279 () Bool)

(assert (=> start!50804 (=> (not res!198672) (not e!164279))))

(assert (=> start!50804 (= res!198672 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50804 e!164279))

(assert (=> start!50804 true))

(declare-fun e!164276 () Bool)

(declare-fun inv!12 (BitStream!10072) Bool)

(assert (=> start!50804 (and (inv!12 thiss!1830) e!164276)))

(declare-fun b!237700 () Bool)

(declare-fun array_inv!5295 (array!12649) Bool)

(assert (=> b!237700 (= e!164276 (array_inv!5295 (buf!6029 thiss!1830)))))

(declare-fun b!237701 () Bool)

(assert (=> b!237701 (= e!164279 e!164278)))

(declare-fun res!198673 () Bool)

(assert (=> b!237701 (=> (not res!198673) (not e!164278))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237701 (= res!198673 (validate_offset_bits!1 ((_ sign_extend 32) (size!5554 (buf!6029 thiss!1830))) ((_ sign_extend 32) (currentByte!11209 thiss!1830)) ((_ sign_extend 32) (currentBit!11204 thiss!1830)) lt!372891))))

(assert (=> b!237701 (= lt!372891 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(assert (= (and start!50804 res!198672) b!237701))

(assert (= (and b!237701 res!198673) b!237696))

(assert (= (and b!237696 res!198675) b!237699))

(assert (= (and b!237699 res!198671) b!237697))

(assert (= (and b!237697 res!198674) b!237698))

(assert (= start!50804 b!237700))

(declare-fun m!360063 () Bool)

(assert (=> start!50804 m!360063))

(declare-fun m!360065 () Bool)

(assert (=> b!237696 m!360065))

(declare-fun m!360067 () Bool)

(assert (=> b!237698 m!360067))

(declare-fun m!360069 () Bool)

(assert (=> b!237699 m!360069))

(declare-fun m!360071 () Bool)

(assert (=> b!237701 m!360071))

(declare-fun m!360073 () Bool)

(assert (=> b!237700 m!360073))

(push 1)

(assert (not b!237698))

(assert (not b!237701))

(assert (not b!237699))

(assert (not b!237696))

(assert (not start!50804))

(assert (not b!237700))

(check-sat)

(pop 1)

(push 1)

(check-sat)

