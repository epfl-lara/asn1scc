; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50820 () Bool)

(assert start!50820)

(declare-fun b!237857 () Bool)

(declare-fun res!198812 () Bool)

(declare-fun e!164357 () Bool)

(assert (=> b!237857 (=> (not res!198812) (not e!164357))))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!237857 (= res!198812 (not (= nBits!581 i!752)))))

(declare-fun b!237858 () Bool)

(declare-fun e!164356 () Bool)

(declare-datatypes ((array!12665 0))(
  ( (array!12666 (arr!6549 (Array (_ BitVec 32) (_ BitVec 8))) (size!5562 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10088 0))(
  ( (BitStream!10089 (buf!6037 array!12665) (currentByte!11217 (_ BitVec 32)) (currentBit!11212 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10088)

(declare-fun array_inv!5303 (array!12665) Bool)

(assert (=> b!237858 (= e!164356 (array_inv!5303 (buf!6037 thiss!1830)))))

(declare-fun b!237860 () Bool)

(declare-fun res!198808 () Bool)

(assert (=> b!237860 (=> (not res!198808) (not e!164357))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237860 (= res!198808 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!237861 () Bool)

(declare-fun res!198813 () Bool)

(assert (=> b!237861 (=> (not res!198813) (not e!164357))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237861 (= res!198813 (validate_offset_bits!1 ((_ sign_extend 32) (size!5562 (buf!6037 thiss!1830))) ((_ sign_extend 32) (currentByte!11217 thiss!1830)) ((_ sign_extend 32) (currentBit!11212 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!237862 () Bool)

(declare-fun res!198811 () Bool)

(assert (=> b!237862 (=> (not res!198811) (not e!164357))))

(declare-datatypes ((tuple2!20050 0))(
  ( (tuple2!20051 (_1!10929 Bool) (_2!10929 BitStream!10088)) )
))
(declare-fun readBit!0 (BitStream!10088) tuple2!20050)

(assert (=> b!237862 (= res!198811 (_1!10929 (readBit!0 thiss!1830)))))

(declare-fun lt!372912 () (_ BitVec 32))

(declare-fun b!237863 () Bool)

(assert (=> b!237863 (= e!164357 (and (not (= lt!372912 (bvand i!752 #b10000000000000000000000000000000))) (not (= lt!372912 (bvand (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752) #b10000000000000000000000000000000)))))))

(assert (=> b!237863 (= lt!372912 (bvand (bvsub nBits!581 #b00000000000000000000000000000001) #b10000000000000000000000000000000))))

(declare-fun b!237859 () Bool)

(declare-fun res!198810 () Bool)

(assert (=> b!237859 (=> (not res!198810) (not e!164357))))

(assert (=> b!237859 (= res!198810 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!198809 () Bool)

(assert (=> start!50820 (=> (not res!198809) (not e!164357))))

(assert (=> start!50820 (= res!198809 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50820 e!164357))

(assert (=> start!50820 true))

(declare-fun inv!12 (BitStream!10088) Bool)

(assert (=> start!50820 (and (inv!12 thiss!1830) e!164356)))

(assert (= (and start!50820 res!198809) b!237861))

(assert (= (and b!237861 res!198813) b!237859))

(assert (= (and b!237859 res!198810) b!237860))

(assert (= (and b!237860 res!198808) b!237857))

(assert (= (and b!237857 res!198812) b!237862))

(assert (= (and b!237862 res!198811) b!237863))

(assert (= start!50820 b!237858))

(declare-fun m!360159 () Bool)

(assert (=> start!50820 m!360159))

(declare-fun m!360161 () Bool)

(assert (=> b!237862 m!360161))

(declare-fun m!360163 () Bool)

(assert (=> b!237860 m!360163))

(declare-fun m!360165 () Bool)

(assert (=> b!237861 m!360165))

(declare-fun m!360167 () Bool)

(assert (=> b!237858 m!360167))

(declare-fun m!360169 () Bool)

(assert (=> b!237859 m!360169))

(push 1)

(assert (not b!237861))

(assert (not start!50820))

(assert (not b!237860))

(assert (not b!237858))

(assert (not b!237859))

(assert (not b!237862))

(check-sat)

(pop 1)

(push 1)

(check-sat)

