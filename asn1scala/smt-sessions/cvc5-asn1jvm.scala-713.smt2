; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19990 () Bool)

(assert start!19990)

(declare-fun b!99602 () Bool)

(declare-fun e!65190 () Bool)

(declare-fun e!65192 () Bool)

(assert (=> b!99602 (= e!65190 (not e!65192))))

(declare-fun res!81733 () Bool)

(assert (=> b!99602 (=> res!81733 e!65192)))

(declare-datatypes ((array!4689 0))(
  ( (array!4690 (arr!2733 (Array (_ BitVec 32) (_ BitVec 8))) (size!2140 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3754 0))(
  ( (BitStream!3755 (buf!2497 array!4689) (currentByte!4943 (_ BitVec 32)) (currentBit!4938 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3754)

(declare-datatypes ((Unit!6107 0))(
  ( (Unit!6108) )
))
(declare-datatypes ((tuple2!8026 0))(
  ( (tuple2!8027 (_1!4268 Unit!6107) (_2!4268 BitStream!3754)) )
))
(declare-fun lt!144403 () tuple2!8026)

(declare-fun isPrefixOf!0 (BitStream!3754 BitStream!3754) Bool)

(assert (=> b!99602 (= res!81733 (not (isPrefixOf!0 thiss!1305 (_2!4268 lt!144403))))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun lt!144400 () tuple2!8026)

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3754 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8026)

(assert (=> b!99602 (= lt!144400 (appendNLeastSignificantBitsLoop!0 (_2!4268 lt!144403) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!65194 () Bool)

(assert (=> b!99602 e!65194))

(declare-fun res!81729 () Bool)

(assert (=> b!99602 (=> (not res!81729) (not e!65194))))

(assert (=> b!99602 (= res!81729 (= (size!2140 (buf!2497 thiss!1305)) (size!2140 (buf!2497 (_2!4268 lt!144403)))))))

(declare-fun lt!144402 () Bool)

(declare-fun appendBit!0 (BitStream!3754 Bool) tuple2!8026)

(assert (=> b!99602 (= lt!144403 (appendBit!0 thiss!1305 lt!144402))))

(assert (=> b!99602 (= lt!144402 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!99603 () Bool)

(declare-fun res!81732 () Bool)

(assert (=> b!99603 (=> (not res!81732) (not e!65190))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99603 (= res!81732 (validate_offset_bits!1 ((_ sign_extend 32) (size!2140 (buf!2497 thiss!1305))) ((_ sign_extend 32) (currentByte!4943 thiss!1305)) ((_ sign_extend 32) (currentBit!4938 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!99604 () Bool)

(declare-fun res!81728 () Bool)

(declare-fun e!65196 () Bool)

(assert (=> b!99604 (=> (not res!81728) (not e!65196))))

(assert (=> b!99604 (= res!81728 (isPrefixOf!0 thiss!1305 (_2!4268 lt!144403)))))

(declare-fun b!99605 () Bool)

(declare-fun res!81731 () Bool)

(assert (=> b!99605 (=> (not res!81731) (not e!65190))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99605 (= res!81731 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!99606 () Bool)

(declare-fun e!65193 () Bool)

(declare-fun array_inv!1942 (array!4689) Bool)

(assert (=> b!99606 (= e!65193 (array_inv!1942 (buf!2497 thiss!1305)))))

(declare-fun b!99607 () Bool)

(assert (=> b!99607 (= e!65194 e!65196)))

(declare-fun res!81730 () Bool)

(assert (=> b!99607 (=> (not res!81730) (not e!65196))))

(declare-fun lt!144401 () (_ BitVec 64))

(declare-fun lt!144405 () (_ BitVec 64))

(assert (=> b!99607 (= res!81730 (= lt!144401 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!144405)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99607 (= lt!144401 (bitIndex!0 (size!2140 (buf!2497 (_2!4268 lt!144403))) (currentByte!4943 (_2!4268 lt!144403)) (currentBit!4938 (_2!4268 lt!144403))))))

(assert (=> b!99607 (= lt!144405 (bitIndex!0 (size!2140 (buf!2497 thiss!1305)) (currentByte!4943 thiss!1305) (currentBit!4938 thiss!1305)))))

(declare-fun b!99608 () Bool)

(declare-fun res!81727 () Bool)

(assert (=> b!99608 (=> (not res!81727) (not e!65190))))

(assert (=> b!99608 (= res!81727 (bvslt i!615 nBits!396))))

(declare-fun b!99609 () Bool)

(declare-fun e!65195 () Bool)

(assert (=> b!99609 (= e!65196 e!65195)))

(declare-fun res!81726 () Bool)

(assert (=> b!99609 (=> (not res!81726) (not e!65195))))

(declare-datatypes ((tuple2!8028 0))(
  ( (tuple2!8029 (_1!4269 BitStream!3754) (_2!4269 Bool)) )
))
(declare-fun lt!144404 () tuple2!8028)

(assert (=> b!99609 (= res!81726 (and (= (_2!4269 lt!144404) lt!144402) (= (_1!4269 lt!144404) (_2!4268 lt!144403))))))

(declare-fun readBitPure!0 (BitStream!3754) tuple2!8028)

(declare-fun readerFrom!0 (BitStream!3754 (_ BitVec 32) (_ BitVec 32)) BitStream!3754)

(assert (=> b!99609 (= lt!144404 (readBitPure!0 (readerFrom!0 (_2!4268 lt!144403) (currentBit!4938 thiss!1305) (currentByte!4943 thiss!1305))))))

(declare-fun res!81734 () Bool)

(assert (=> start!19990 (=> (not res!81734) (not e!65190))))

(assert (=> start!19990 (= res!81734 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!19990 e!65190))

(assert (=> start!19990 true))

(declare-fun inv!12 (BitStream!3754) Bool)

(assert (=> start!19990 (and (inv!12 thiss!1305) e!65193)))

(declare-fun b!99610 () Bool)

(assert (=> b!99610 (= e!65195 (= (bitIndex!0 (size!2140 (buf!2497 (_1!4269 lt!144404))) (currentByte!4943 (_1!4269 lt!144404)) (currentBit!4938 (_1!4269 lt!144404))) lt!144401))))

(declare-fun b!99611 () Bool)

(assert (=> b!99611 (= e!65192 true)))

(declare-fun lt!144406 () Bool)

(assert (=> b!99611 (= lt!144406 (isPrefixOf!0 (_2!4268 lt!144403) (_2!4268 lt!144400)))))

(assert (= (and start!19990 res!81734) b!99603))

(assert (= (and b!99603 res!81732) b!99605))

(assert (= (and b!99605 res!81731) b!99608))

(assert (= (and b!99608 res!81727) b!99602))

(assert (= (and b!99602 res!81729) b!99607))

(assert (= (and b!99607 res!81730) b!99604))

(assert (= (and b!99604 res!81728) b!99609))

(assert (= (and b!99609 res!81726) b!99610))

(assert (= (and b!99602 (not res!81733)) b!99611))

(assert (= start!19990 b!99606))

(declare-fun m!144943 () Bool)

(assert (=> b!99607 m!144943))

(declare-fun m!144945 () Bool)

(assert (=> b!99607 m!144945))

(declare-fun m!144947 () Bool)

(assert (=> b!99610 m!144947))

(declare-fun m!144949 () Bool)

(assert (=> b!99602 m!144949))

(declare-fun m!144951 () Bool)

(assert (=> b!99602 m!144951))

(declare-fun m!144953 () Bool)

(assert (=> b!99602 m!144953))

(assert (=> b!99604 m!144949))

(declare-fun m!144955 () Bool)

(assert (=> start!19990 m!144955))

(declare-fun m!144957 () Bool)

(assert (=> b!99605 m!144957))

(declare-fun m!144959 () Bool)

(assert (=> b!99603 m!144959))

(declare-fun m!144961 () Bool)

(assert (=> b!99606 m!144961))

(declare-fun m!144963 () Bool)

(assert (=> b!99611 m!144963))

(declare-fun m!144965 () Bool)

(assert (=> b!99609 m!144965))

(assert (=> b!99609 m!144965))

(declare-fun m!144967 () Bool)

(assert (=> b!99609 m!144967))

(push 1)

(assert (not b!99607))

(assert (not start!19990))

(assert (not b!99603))

(assert (not b!99609))

(assert (not b!99604))

(assert (not b!99611))

(assert (not b!99602))

(assert (not b!99610))

(assert (not b!99605))

(assert (not b!99606))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

