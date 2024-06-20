; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50836 () Bool)

(assert start!50836)

(declare-fun res!198942 () Bool)

(declare-fun e!164429 () Bool)

(assert (=> start!50836 (=> (not res!198942) (not e!164429))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50836 (= res!198942 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50836 e!164429))

(assert (=> start!50836 true))

(declare-datatypes ((array!12681 0))(
  ( (array!12682 (arr!6557 (Array (_ BitVec 32) (_ BitVec 8))) (size!5570 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10104 0))(
  ( (BitStream!10105 (buf!6045 array!12681) (currentByte!11225 (_ BitVec 32)) (currentBit!11220 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10104)

(declare-fun e!164427 () Bool)

(declare-fun inv!12 (BitStream!10104) Bool)

(assert (=> start!50836 (and (inv!12 thiss!1830) e!164427)))

(declare-fun b!238011 () Bool)

(declare-fun res!198940 () Bool)

(assert (=> b!238011 (=> (not res!198940) (not e!164429))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238011 (= res!198940 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238012 () Bool)

(declare-fun array_inv!5311 (array!12681) Bool)

(assert (=> b!238012 (= e!164427 (array_inv!5311 (buf!6045 thiss!1830)))))

(declare-fun b!238013 () Bool)

(declare-fun res!198939 () Bool)

(assert (=> b!238013 (=> (not res!198939) (not e!164429))))

(assert (=> b!238013 (= res!198939 (not (= nBits!581 i!752)))))

(declare-fun b!238014 () Bool)

(declare-fun res!198941 () Bool)

(assert (=> b!238014 (=> (not res!198941) (not e!164429))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238014 (= res!198941 (validate_offset_bits!1 ((_ sign_extend 32) (size!5570 (buf!6045 thiss!1830))) ((_ sign_extend 32) (currentByte!11225 thiss!1830)) ((_ sign_extend 32) (currentBit!11220 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!238015 () Bool)

(declare-fun res!198938 () Bool)

(assert (=> b!238015 (=> (not res!198938) (not e!164429))))

(assert (=> b!238015 (= res!198938 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!238016 () Bool)

(assert (=> b!238016 (= e!164429 (bvsge (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) (bvsub nBits!581 i!752)))))

(declare-datatypes ((tuple2!20066 0))(
  ( (tuple2!20067 (_1!10937 Bool) (_2!10937 BitStream!10104)) )
))
(declare-fun lt!372936 () tuple2!20066)

(declare-fun readBit!0 (BitStream!10104) tuple2!20066)

(assert (=> b!238016 (= lt!372936 (readBit!0 thiss!1830))))

(assert (= (and start!50836 res!198942) b!238014))

(assert (= (and b!238014 res!198941) b!238011))

(assert (= (and b!238011 res!198940) b!238015))

(assert (= (and b!238015 res!198938) b!238013))

(assert (= (and b!238013 res!198939) b!238016))

(assert (= start!50836 b!238012))

(declare-fun m!360255 () Bool)

(assert (=> start!50836 m!360255))

(declare-fun m!360257 () Bool)

(assert (=> b!238012 m!360257))

(declare-fun m!360259 () Bool)

(assert (=> b!238014 m!360259))

(declare-fun m!360261 () Bool)

(assert (=> b!238016 m!360261))

(declare-fun m!360263 () Bool)

(assert (=> b!238015 m!360263))

(declare-fun m!360265 () Bool)

(assert (=> b!238011 m!360265))

(check-sat (not b!238015) (not start!50836) (not b!238016) (not b!238011) (not b!238012) (not b!238014))
(check-sat)
