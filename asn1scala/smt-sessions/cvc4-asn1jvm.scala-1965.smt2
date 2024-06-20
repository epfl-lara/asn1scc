; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50916 () Bool)

(assert start!50916)

(declare-fun res!199387 () Bool)

(declare-fun e!164754 () Bool)

(assert (=> start!50916 (=> (not res!199387) (not e!164754))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50916 (= res!199387 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50916 e!164754))

(assert (=> start!50916 true))

(declare-datatypes ((array!12722 0))(
  ( (array!12723 (arr!6576 (Array (_ BitVec 32) (_ BitVec 8))) (size!5589 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10142 0))(
  ( (BitStream!10143 (buf!6064 array!12722) (currentByte!11250 (_ BitVec 32)) (currentBit!11245 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10142)

(declare-fun e!164753 () Bool)

(declare-fun inv!12 (BitStream!10142) Bool)

(assert (=> start!50916 (and (inv!12 thiss!1830) e!164753)))

(declare-fun b!238531 () Bool)

(declare-fun res!199388 () Bool)

(declare-fun e!164752 () Bool)

(assert (=> b!238531 (=> (not res!199388) (not e!164752))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238531 (= res!199388 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238532 () Bool)

(assert (=> b!238532 (= e!164754 e!164752)))

(declare-fun res!199389 () Bool)

(assert (=> b!238532 (=> (not res!199389) (not e!164752))))

(declare-fun lt!373299 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238532 (= res!199389 (validate_offset_bits!1 ((_ sign_extend 32) (size!5589 (buf!6064 thiss!1830))) ((_ sign_extend 32) (currentByte!11250 thiss!1830)) ((_ sign_extend 32) (currentBit!11245 thiss!1830)) lt!373299))))

(assert (=> b!238532 (= lt!373299 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!238533 () Bool)

(declare-fun res!199384 () Bool)

(declare-fun e!164755 () Bool)

(assert (=> b!238533 (=> (not res!199384) (not e!164755))))

(declare-datatypes ((tuple2!20150 0))(
  ( (tuple2!20151 (_1!10979 (_ BitVec 64)) (_2!10979 BitStream!10142)) )
))
(declare-fun lt!373297 () tuple2!20150)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238533 (= res!199384 (= (bitIndex!0 (size!5589 (buf!6064 (_2!10979 lt!373297))) (currentByte!11250 (_2!10979 lt!373297)) (currentBit!11245 (_2!10979 lt!373297))) (bvadd (bitIndex!0 (size!5589 (buf!6064 thiss!1830)) (currentByte!11250 thiss!1830) (currentBit!11245 thiss!1830)) lt!373299)))))

(declare-fun b!238534 () Bool)

(declare-fun res!199386 () Bool)

(assert (=> b!238534 (=> (not res!199386) (not e!164752))))

(assert (=> b!238534 (= res!199386 (not (= nBits!581 i!752)))))

(declare-fun b!238535 () Bool)

(assert (=> b!238535 (= e!164752 e!164755)))

(declare-fun res!199383 () Bool)

(assert (=> b!238535 (=> (not res!199383) (not e!164755))))

(assert (=> b!238535 (= res!199383 (= (buf!6064 (_2!10979 lt!373297)) (buf!6064 thiss!1830)))))

(declare-datatypes ((tuple2!20152 0))(
  ( (tuple2!20153 (_1!10980 Bool) (_2!10980 BitStream!10142)) )
))
(declare-fun lt!373298 () tuple2!20152)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10142 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20150)

(assert (=> b!238535 (= lt!373297 (readNLeastSignificantBitsLoop!0 (_2!10980 lt!373298) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10980 lt!373298) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!10142) tuple2!20152)

(assert (=> b!238535 (= lt!373298 (readBit!0 thiss!1830))))

(declare-fun b!238536 () Bool)

(declare-fun array_inv!5330 (array!12722) Bool)

(assert (=> b!238536 (= e!164753 (array_inv!5330 (buf!6064 thiss!1830)))))

(declare-fun b!238537 () Bool)

(declare-fun res!199385 () Bool)

(assert (=> b!238537 (=> (not res!199385) (not e!164752))))

(assert (=> b!238537 (= res!199385 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!238538 () Bool)

(assert (=> b!238538 (= e!164755 (or (bvslt lt!373299 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt lt!373299 #b0000000000000000000000000000000000000000000000000000000001000000)))))

(assert (= (and start!50916 res!199387) b!238532))

(assert (= (and b!238532 res!199389) b!238531))

(assert (= (and b!238531 res!199388) b!238537))

(assert (= (and b!238537 res!199385) b!238534))

(assert (= (and b!238534 res!199386) b!238535))

(assert (= (and b!238535 res!199383) b!238533))

(assert (= (and b!238533 res!199384) b!238538))

(assert (= start!50916 b!238536))

(declare-fun m!360645 () Bool)

(assert (=> b!238531 m!360645))

(declare-fun m!360647 () Bool)

(assert (=> b!238535 m!360647))

(declare-fun m!360649 () Bool)

(assert (=> b!238535 m!360649))

(declare-fun m!360651 () Bool)

(assert (=> b!238533 m!360651))

(declare-fun m!360653 () Bool)

(assert (=> b!238533 m!360653))

(declare-fun m!360655 () Bool)

(assert (=> b!238536 m!360655))

(declare-fun m!360657 () Bool)

(assert (=> b!238532 m!360657))

(declare-fun m!360659 () Bool)

(assert (=> start!50916 m!360659))

(declare-fun m!360661 () Bool)

(assert (=> b!238537 m!360661))

(push 1)

(assert (not b!238536))

(assert (not b!238535))

(assert (not b!238533))

(assert (not b!238532))

(assert (not b!238531))

(assert (not b!238537))

(assert (not start!50916))

(check-sat)

(pop 1)

(push 1)

(check-sat)

