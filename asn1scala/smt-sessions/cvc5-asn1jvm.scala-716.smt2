; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20008 () Bool)

(assert start!20008)

(declare-fun b!99932 () Bool)

(declare-fun res!82039 () Bool)

(declare-fun e!65406 () Bool)

(assert (=> b!99932 (=> (not res!82039) (not e!65406))))

(declare-datatypes ((array!4707 0))(
  ( (array!4708 (arr!2742 (Array (_ BitVec 32) (_ BitVec 8))) (size!2149 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3772 0))(
  ( (BitStream!3773 (buf!2506 array!4707) (currentByte!4952 (_ BitVec 32)) (currentBit!4947 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3772)

(declare-datatypes ((Unit!6125 0))(
  ( (Unit!6126) )
))
(declare-datatypes ((tuple2!8062 0))(
  ( (tuple2!8063 (_1!4286 Unit!6125) (_2!4286 BitStream!3772)) )
))
(declare-fun lt!144632 () tuple2!8062)

(declare-fun isPrefixOf!0 (BitStream!3772 BitStream!3772) Bool)

(assert (=> b!99932 (= res!82039 (isPrefixOf!0 thiss!1305 (_2!4286 lt!144632)))))

(declare-fun b!99933 () Bool)

(declare-fun e!65402 () Bool)

(declare-datatypes ((tuple2!8064 0))(
  ( (tuple2!8065 (_1!4287 BitStream!3772) (_2!4287 Bool)) )
))
(declare-fun lt!144635 () tuple2!8064)

(declare-fun lt!144633 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99933 (= e!65402 (= (bitIndex!0 (size!2149 (buf!2506 (_1!4287 lt!144635))) (currentByte!4952 (_1!4287 lt!144635)) (currentBit!4947 (_1!4287 lt!144635))) lt!144633))))

(declare-fun b!99934 () Bool)

(assert (=> b!99934 (= e!65406 e!65402)))

(declare-fun res!82032 () Bool)

(assert (=> b!99934 (=> (not res!82032) (not e!65402))))

(declare-fun lt!144634 () Bool)

(assert (=> b!99934 (= res!82032 (and (= (_2!4287 lt!144635) lt!144634) (= (_1!4287 lt!144635) (_2!4286 lt!144632))))))

(declare-fun readBitPure!0 (BitStream!3772) tuple2!8064)

(declare-fun readerFrom!0 (BitStream!3772 (_ BitVec 32) (_ BitVec 32)) BitStream!3772)

(assert (=> b!99934 (= lt!144635 (readBitPure!0 (readerFrom!0 (_2!4286 lt!144632) (currentBit!4947 thiss!1305) (currentByte!4952 thiss!1305))))))

(declare-fun b!99935 () Bool)

(declare-fun res!82037 () Bool)

(declare-fun e!65403 () Bool)

(assert (=> b!99935 (=> (not res!82037) (not e!65403))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99935 (= res!82037 (validate_offset_bits!1 ((_ sign_extend 32) (size!2149 (buf!2506 thiss!1305))) ((_ sign_extend 32) (currentByte!4952 thiss!1305)) ((_ sign_extend 32) (currentBit!4947 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!99936 () Bool)

(declare-fun res!82033 () Bool)

(assert (=> b!99936 (=> (not res!82033) (not e!65403))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99936 (= res!82033 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!99937 () Bool)

(declare-fun e!65405 () Bool)

(assert (=> b!99937 (= e!65403 (not e!65405))))

(declare-fun res!82029 () Bool)

(assert (=> b!99937 (=> res!82029 e!65405)))

(declare-fun lt!144631 () tuple2!8062)

(assert (=> b!99937 (= res!82029 (not (= (size!2149 (buf!2506 (_2!4286 lt!144632))) (size!2149 (buf!2506 (_2!4286 lt!144631))))))))

(declare-fun e!65400 () Bool)

(assert (=> b!99937 e!65400))

(declare-fun res!82036 () Bool)

(assert (=> b!99937 (=> (not res!82036) (not e!65400))))

(assert (=> b!99937 (= res!82036 (isPrefixOf!0 thiss!1305 (_2!4286 lt!144631)))))

(declare-fun lt!144637 () Unit!6125)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3772 BitStream!3772 BitStream!3772) Unit!6125)

(assert (=> b!99937 (= lt!144637 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4286 lt!144632) (_2!4286 lt!144631)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3772 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8062)

(assert (=> b!99937 (= lt!144631 (appendNLeastSignificantBitsLoop!0 (_2!4286 lt!144632) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!65401 () Bool)

(assert (=> b!99937 e!65401))

(declare-fun res!82031 () Bool)

(assert (=> b!99937 (=> (not res!82031) (not e!65401))))

(assert (=> b!99937 (= res!82031 (= (size!2149 (buf!2506 thiss!1305)) (size!2149 (buf!2506 (_2!4286 lt!144632)))))))

(declare-fun appendBit!0 (BitStream!3772 Bool) tuple2!8062)

(assert (=> b!99937 (= lt!144632 (appendBit!0 thiss!1305 lt!144634))))

(assert (=> b!99937 (= lt!144634 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!99939 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!99939 (= e!65400 (invariant!0 (currentBit!4947 thiss!1305) (currentByte!4952 thiss!1305) (size!2149 (buf!2506 (_2!4286 lt!144632)))))))

(declare-fun b!99940 () Bool)

(assert (=> b!99940 (= e!65401 e!65406)))

(declare-fun res!82030 () Bool)

(assert (=> b!99940 (=> (not res!82030) (not e!65406))))

(declare-fun lt!144629 () (_ BitVec 64))

(assert (=> b!99940 (= res!82030 (= lt!144633 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!144629)))))

(assert (=> b!99940 (= lt!144633 (bitIndex!0 (size!2149 (buf!2506 (_2!4286 lt!144632))) (currentByte!4952 (_2!4286 lt!144632)) (currentBit!4947 (_2!4286 lt!144632))))))

(assert (=> b!99940 (= lt!144629 (bitIndex!0 (size!2149 (buf!2506 thiss!1305)) (currentByte!4952 thiss!1305) (currentBit!4947 thiss!1305)))))

(declare-fun b!99941 () Bool)

(assert (=> b!99941 (= e!65405 true)))

(declare-fun lt!144630 () tuple2!8064)

(assert (=> b!99941 (= lt!144630 (readBitPure!0 (BitStream!3773 (buf!2506 (_2!4286 lt!144631)) (currentByte!4952 thiss!1305) (currentBit!4947 thiss!1305))))))

(declare-fun lt!144636 () tuple2!8064)

(assert (=> b!99941 (= lt!144636 (readBitPure!0 (BitStream!3773 (buf!2506 (_2!4286 lt!144632)) (currentByte!4952 thiss!1305) (currentBit!4947 thiss!1305))))))

(assert (=> b!99941 (invariant!0 (currentBit!4947 thiss!1305) (currentByte!4952 thiss!1305) (size!2149 (buf!2506 (_2!4286 lt!144631))))))

(declare-fun b!99942 () Bool)

(declare-fun e!65399 () Bool)

(declare-fun array_inv!1951 (array!4707) Bool)

(assert (=> b!99942 (= e!65399 (array_inv!1951 (buf!2506 thiss!1305)))))

(declare-fun b!99943 () Bool)

(declare-fun res!82035 () Bool)

(assert (=> b!99943 (=> (not res!82035) (not e!65403))))

(assert (=> b!99943 (= res!82035 (bvslt i!615 nBits!396))))

(declare-fun b!99944 () Bool)

(declare-fun res!82040 () Bool)

(assert (=> b!99944 (=> res!82040 e!65405)))

(declare-fun arrayBitRangesEq!0 (array!4707 array!4707 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99944 (= res!82040 (not (arrayBitRangesEq!0 (buf!2506 (_2!4286 lt!144632)) (buf!2506 (_2!4286 lt!144631)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2149 (buf!2506 (_2!4286 lt!144632))) (currentByte!4952 thiss!1305) (currentBit!4947 thiss!1305))))))))

(declare-fun res!82034 () Bool)

(assert (=> start!20008 (=> (not res!82034) (not e!65403))))

(assert (=> start!20008 (= res!82034 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20008 e!65403))

(assert (=> start!20008 true))

(declare-fun inv!12 (BitStream!3772) Bool)

(assert (=> start!20008 (and (inv!12 thiss!1305) e!65399)))

(declare-fun b!99938 () Bool)

(declare-fun res!82038 () Bool)

(assert (=> b!99938 (=> res!82038 e!65405)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99938 (= res!82038 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!2149 (buf!2506 (_2!4286 lt!144632)))) ((_ sign_extend 32) (currentByte!4952 thiss!1305)) ((_ sign_extend 32) (currentBit!4947 thiss!1305)))))))

(assert (= (and start!20008 res!82034) b!99935))

(assert (= (and b!99935 res!82037) b!99936))

(assert (= (and b!99936 res!82033) b!99943))

(assert (= (and b!99943 res!82035) b!99937))

(assert (= (and b!99937 res!82031) b!99940))

(assert (= (and b!99940 res!82030) b!99932))

(assert (= (and b!99932 res!82039) b!99934))

(assert (= (and b!99934 res!82032) b!99933))

(assert (= (and b!99937 res!82036) b!99939))

(assert (= (and b!99937 (not res!82029)) b!99938))

(assert (= (and b!99938 (not res!82038)) b!99944))

(assert (= (and b!99944 (not res!82040)) b!99941))

(assert (= start!20008 b!99942))

(declare-fun m!145273 () Bool)

(assert (=> start!20008 m!145273))

(declare-fun m!145275 () Bool)

(assert (=> b!99932 m!145275))

(declare-fun m!145277 () Bool)

(assert (=> b!99937 m!145277))

(declare-fun m!145279 () Bool)

(assert (=> b!99937 m!145279))

(declare-fun m!145281 () Bool)

(assert (=> b!99937 m!145281))

(declare-fun m!145283 () Bool)

(assert (=> b!99937 m!145283))

(declare-fun m!145285 () Bool)

(assert (=> b!99933 m!145285))

(declare-fun m!145287 () Bool)

(assert (=> b!99941 m!145287))

(declare-fun m!145289 () Bool)

(assert (=> b!99941 m!145289))

(declare-fun m!145291 () Bool)

(assert (=> b!99941 m!145291))

(declare-fun m!145293 () Bool)

(assert (=> b!99944 m!145293))

(declare-fun m!145295 () Bool)

(assert (=> b!99944 m!145295))

(declare-fun m!145297 () Bool)

(assert (=> b!99935 m!145297))

(declare-fun m!145299 () Bool)

(assert (=> b!99939 m!145299))

(declare-fun m!145301 () Bool)

(assert (=> b!99942 m!145301))

(declare-fun m!145303 () Bool)

(assert (=> b!99936 m!145303))

(declare-fun m!145305 () Bool)

(assert (=> b!99940 m!145305))

(declare-fun m!145307 () Bool)

(assert (=> b!99940 m!145307))

(declare-fun m!145309 () Bool)

(assert (=> b!99938 m!145309))

(declare-fun m!145311 () Bool)

(assert (=> b!99934 m!145311))

(assert (=> b!99934 m!145311))

(declare-fun m!145313 () Bool)

(assert (=> b!99934 m!145313))

(push 1)

(assert (not b!99940))

(assert (not b!99932))

(assert (not b!99942))

(assert (not b!99934))

(assert (not b!99933))

(assert (not b!99938))

(assert (not b!99941))

(assert (not b!99939))

(assert (not b!99937))

(assert (not start!20008))

(assert (not b!99935))

(assert (not b!99944))

(assert (not b!99936))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

