; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19988 () Bool)

(assert start!19988)

(declare-fun b!99572 () Bool)

(declare-fun e!65174 () Bool)

(declare-datatypes ((array!4687 0))(
  ( (array!4688 (arr!2732 (Array (_ BitVec 32) (_ BitVec 8))) (size!2139 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3752 0))(
  ( (BitStream!3753 (buf!2496 array!4687) (currentByte!4942 (_ BitVec 32)) (currentBit!4937 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8022 0))(
  ( (tuple2!8023 (_1!4266 BitStream!3752) (_2!4266 Bool)) )
))
(declare-fun lt!144379 () tuple2!8022)

(declare-fun lt!144383 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99572 (= e!65174 (= (bitIndex!0 (size!2139 (buf!2496 (_1!4266 lt!144379))) (currentByte!4942 (_1!4266 lt!144379)) (currentBit!4937 (_1!4266 lt!144379))) lt!144383))))

(declare-fun b!99573 () Bool)

(declare-fun e!65170 () Bool)

(declare-fun thiss!1305 () BitStream!3752)

(declare-fun array_inv!1941 (array!4687) Bool)

(assert (=> b!99573 (= e!65170 (array_inv!1941 (buf!2496 thiss!1305)))))

(declare-fun b!99574 () Bool)

(declare-fun res!81705 () Bool)

(declare-fun e!65175 () Bool)

(assert (=> b!99574 (=> (not res!81705) (not e!65175))))

(declare-datatypes ((Unit!6105 0))(
  ( (Unit!6106) )
))
(declare-datatypes ((tuple2!8024 0))(
  ( (tuple2!8025 (_1!4267 Unit!6105) (_2!4267 BitStream!3752)) )
))
(declare-fun lt!144381 () tuple2!8024)

(declare-fun isPrefixOf!0 (BitStream!3752 BitStream!3752) Bool)

(assert (=> b!99574 (= res!81705 (isPrefixOf!0 thiss!1305 (_2!4267 lt!144381)))))

(declare-fun res!81703 () Bool)

(declare-fun e!65172 () Bool)

(assert (=> start!19988 (=> (not res!81703) (not e!65172))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!19988 (= res!81703 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!19988 e!65172))

(assert (=> start!19988 true))

(declare-fun inv!12 (BitStream!3752) Bool)

(assert (=> start!19988 (and (inv!12 thiss!1305) e!65170)))

(declare-fun b!99575 () Bool)

(declare-fun res!81704 () Bool)

(assert (=> b!99575 (=> (not res!81704) (not e!65172))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99575 (= res!81704 (validate_offset_bits!1 ((_ sign_extend 32) (size!2139 (buf!2496 thiss!1305))) ((_ sign_extend 32) (currentByte!4942 thiss!1305)) ((_ sign_extend 32) (currentBit!4937 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!99576 () Bool)

(declare-fun res!81707 () Bool)

(assert (=> b!99576 (=> (not res!81707) (not e!65172))))

(assert (=> b!99576 (= res!81707 (bvslt i!615 nBits!396))))

(declare-fun b!99577 () Bool)

(declare-fun e!65169 () Bool)

(assert (=> b!99577 (= e!65169 e!65175)))

(declare-fun res!81700 () Bool)

(assert (=> b!99577 (=> (not res!81700) (not e!65175))))

(declare-fun lt!144385 () (_ BitVec 64))

(assert (=> b!99577 (= res!81700 (= lt!144383 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!144385)))))

(assert (=> b!99577 (= lt!144383 (bitIndex!0 (size!2139 (buf!2496 (_2!4267 lt!144381))) (currentByte!4942 (_2!4267 lt!144381)) (currentBit!4937 (_2!4267 lt!144381))))))

(assert (=> b!99577 (= lt!144385 (bitIndex!0 (size!2139 (buf!2496 thiss!1305)) (currentByte!4942 thiss!1305) (currentBit!4937 thiss!1305)))))

(declare-fun b!99578 () Bool)

(declare-fun e!65171 () Bool)

(assert (=> b!99578 (= e!65171 true)))

(declare-fun lt!144382 () Bool)

(declare-fun lt!144384 () tuple2!8024)

(assert (=> b!99578 (= lt!144382 (isPrefixOf!0 (_2!4267 lt!144381) (_2!4267 lt!144384)))))

(declare-fun b!99579 () Bool)

(assert (=> b!99579 (= e!65175 e!65174)))

(declare-fun res!81699 () Bool)

(assert (=> b!99579 (=> (not res!81699) (not e!65174))))

(declare-fun lt!144380 () Bool)

(assert (=> b!99579 (= res!81699 (and (= (_2!4266 lt!144379) lt!144380) (= (_1!4266 lt!144379) (_2!4267 lt!144381))))))

(declare-fun readBitPure!0 (BitStream!3752) tuple2!8022)

(declare-fun readerFrom!0 (BitStream!3752 (_ BitVec 32) (_ BitVec 32)) BitStream!3752)

(assert (=> b!99579 (= lt!144379 (readBitPure!0 (readerFrom!0 (_2!4267 lt!144381) (currentBit!4937 thiss!1305) (currentByte!4942 thiss!1305))))))

(declare-fun b!99580 () Bool)

(assert (=> b!99580 (= e!65172 (not e!65171))))

(declare-fun res!81706 () Bool)

(assert (=> b!99580 (=> res!81706 e!65171)))

(assert (=> b!99580 (= res!81706 (not (isPrefixOf!0 thiss!1305 (_2!4267 lt!144381))))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3752 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8024)

(assert (=> b!99580 (= lt!144384 (appendNLeastSignificantBitsLoop!0 (_2!4267 lt!144381) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!99580 e!65169))

(declare-fun res!81702 () Bool)

(assert (=> b!99580 (=> (not res!81702) (not e!65169))))

(assert (=> b!99580 (= res!81702 (= (size!2139 (buf!2496 thiss!1305)) (size!2139 (buf!2496 (_2!4267 lt!144381)))))))

(declare-fun appendBit!0 (BitStream!3752 Bool) tuple2!8024)

(assert (=> b!99580 (= lt!144381 (appendBit!0 thiss!1305 lt!144380))))

(assert (=> b!99580 (= lt!144380 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!99581 () Bool)

(declare-fun res!81701 () Bool)

(assert (=> b!99581 (=> (not res!81701) (not e!65172))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99581 (= res!81701 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(assert (= (and start!19988 res!81703) b!99575))

(assert (= (and b!99575 res!81704) b!99581))

(assert (= (and b!99581 res!81701) b!99576))

(assert (= (and b!99576 res!81707) b!99580))

(assert (= (and b!99580 res!81702) b!99577))

(assert (= (and b!99577 res!81700) b!99574))

(assert (= (and b!99574 res!81705) b!99579))

(assert (= (and b!99579 res!81699) b!99572))

(assert (= (and b!99580 (not res!81706)) b!99578))

(assert (= start!19988 b!99573))

(declare-fun m!144917 () Bool)

(assert (=> b!99577 m!144917))

(declare-fun m!144919 () Bool)

(assert (=> b!99577 m!144919))

(declare-fun m!144921 () Bool)

(assert (=> start!19988 m!144921))

(declare-fun m!144923 () Bool)

(assert (=> b!99580 m!144923))

(declare-fun m!144925 () Bool)

(assert (=> b!99580 m!144925))

(declare-fun m!144927 () Bool)

(assert (=> b!99580 m!144927))

(declare-fun m!144929 () Bool)

(assert (=> b!99578 m!144929))

(declare-fun m!144931 () Bool)

(assert (=> b!99572 m!144931))

(declare-fun m!144933 () Bool)

(assert (=> b!99581 m!144933))

(assert (=> b!99574 m!144923))

(declare-fun m!144935 () Bool)

(assert (=> b!99573 m!144935))

(declare-fun m!144937 () Bool)

(assert (=> b!99575 m!144937))

(declare-fun m!144939 () Bool)

(assert (=> b!99579 m!144939))

(assert (=> b!99579 m!144939))

(declare-fun m!144941 () Bool)

(assert (=> b!99579 m!144941))

(push 1)

(assert (not b!99574))

(assert (not b!99572))

(assert (not b!99573))

(assert (not start!19988))

(assert (not b!99580))

(assert (not b!99578))

(assert (not b!99575))

(assert (not b!99579))

(assert (not b!99581))

(assert (not b!99577))

(check-sat)

(pop 1)

(push 1)

(check-sat)

