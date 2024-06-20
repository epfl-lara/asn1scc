; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50814 () Bool)

(assert start!50814)

(declare-fun b!237794 () Bool)

(declare-fun res!198756 () Bool)

(declare-fun e!164328 () Bool)

(assert (=> b!237794 (=> (not res!198756) (not e!164328))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237794 (= res!198756 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237795 () Bool)

(declare-fun res!198757 () Bool)

(assert (=> b!237795 (=> (not res!198757) (not e!164328))))

(declare-datatypes ((array!12659 0))(
  ( (array!12660 (arr!6546 (Array (_ BitVec 32) (_ BitVec 8))) (size!5559 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10082 0))(
  ( (BitStream!10083 (buf!6034 array!12659) (currentByte!11214 (_ BitVec 32)) (currentBit!11209 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10082)

(declare-datatypes ((tuple2!20044 0))(
  ( (tuple2!20045 (_1!10926 Bool) (_2!10926 BitStream!10082)) )
))
(declare-fun readBit!0 (BitStream!10082) tuple2!20044)

(assert (=> b!237795 (= res!198757 (_1!10926 (readBit!0 thiss!1830)))))

(declare-fun b!237796 () Bool)

(assert (=> b!237796 (= e!164328 (and (not (= (bvand nBits!581 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun b!237797 () Bool)

(declare-fun res!198758 () Bool)

(assert (=> b!237797 (=> (not res!198758) (not e!164328))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237797 (= res!198758 (validate_offset_bits!1 ((_ sign_extend 32) (size!5559 (buf!6034 thiss!1830))) ((_ sign_extend 32) (currentByte!11214 thiss!1830)) ((_ sign_extend 32) (currentBit!11209 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!237798 () Bool)

(declare-fun res!198754 () Bool)

(assert (=> b!237798 (=> (not res!198754) (not e!164328))))

(assert (=> b!237798 (= res!198754 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!237799 () Bool)

(declare-fun e!164330 () Bool)

(declare-fun array_inv!5300 (array!12659) Bool)

(assert (=> b!237799 (= e!164330 (array_inv!5300 (buf!6034 thiss!1830)))))

(declare-fun b!237800 () Bool)

(declare-fun res!198755 () Bool)

(assert (=> b!237800 (=> (not res!198755) (not e!164328))))

(assert (=> b!237800 (= res!198755 (not (= nBits!581 i!752)))))

(declare-fun res!198759 () Bool)

(assert (=> start!50814 (=> (not res!198759) (not e!164328))))

(assert (=> start!50814 (= res!198759 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50814 e!164328))

(assert (=> start!50814 true))

(declare-fun inv!12 (BitStream!10082) Bool)

(assert (=> start!50814 (and (inv!12 thiss!1830) e!164330)))

(assert (= (and start!50814 res!198759) b!237797))

(assert (= (and b!237797 res!198758) b!237794))

(assert (= (and b!237794 res!198756) b!237798))

(assert (= (and b!237798 res!198754) b!237800))

(assert (= (and b!237800 res!198755) b!237795))

(assert (= (and b!237795 res!198757) b!237796))

(assert (= start!50814 b!237799))

(declare-fun m!360123 () Bool)

(assert (=> b!237794 m!360123))

(declare-fun m!360125 () Bool)

(assert (=> b!237795 m!360125))

(declare-fun m!360127 () Bool)

(assert (=> b!237798 m!360127))

(declare-fun m!360129 () Bool)

(assert (=> start!50814 m!360129))

(declare-fun m!360131 () Bool)

(assert (=> b!237797 m!360131))

(declare-fun m!360133 () Bool)

(assert (=> b!237799 m!360133))

(push 1)

(assert (not b!237794))

(assert (not b!237799))

(assert (not b!237797))

(assert (not b!237795))

(assert (not start!50814))

(assert (not b!237798))

(check-sat)

(pop 1)

(push 1)

(check-sat)

