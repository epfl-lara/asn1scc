; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39726 () Bool)

(assert start!39726)

(declare-fun b!179906 () Bool)

(declare-fun e!125073 () Bool)

(declare-fun e!125074 () Bool)

(assert (=> b!179906 (= e!125073 e!125074)))

(declare-fun res!149336 () Bool)

(assert (=> b!179906 (=> res!149336 e!125074)))

(declare-fun lt!276040 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!276035 () (_ BitVec 64))

(assert (=> b!179906 (= res!149336 (not (= lt!276040 (bvsub (bvsub (bvadd lt!276035 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-datatypes ((array!9660 0))(
  ( (array!9661 (arr!5190 (Array (_ BitVec 32) (_ BitVec 8))) (size!4260 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7628 0))(
  ( (BitStream!7629 (buf!4703 array!9660) (currentByte!8913 (_ BitVec 32)) (currentBit!8908 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12939 0))(
  ( (Unit!12940) )
))
(declare-datatypes ((tuple2!15506 0))(
  ( (tuple2!15507 (_1!8398 Unit!12939) (_2!8398 BitStream!7628)) )
))
(declare-fun lt!276042 () tuple2!15506)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!179906 (= lt!276040 (bitIndex!0 (size!4260 (buf!4703 (_2!8398 lt!276042))) (currentByte!8913 (_2!8398 lt!276042)) (currentBit!8908 (_2!8398 lt!276042))))))

(declare-fun thiss!1204 () BitStream!7628)

(declare-fun isPrefixOf!0 (BitStream!7628 BitStream!7628) Bool)

(assert (=> b!179906 (isPrefixOf!0 thiss!1204 (_2!8398 lt!276042))))

(declare-fun lt!276038 () tuple2!15506)

(declare-fun lt!276043 () Unit!12939)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7628 BitStream!7628 BitStream!7628) Unit!12939)

(assert (=> b!179906 (= lt!276043 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8398 lt!276038) (_2!8398 lt!276042)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7628 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15506)

(assert (=> b!179906 (= lt!276042 (appendBitsLSBFirstLoopTR!0 (_2!8398 lt!276038) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!179907 () Bool)

(declare-fun res!149334 () Bool)

(assert (=> b!179907 (=> res!149334 e!125074)))

(declare-fun lt!276046 () (_ BitVec 64))

(assert (=> b!179907 (= res!149334 (or (not (= (size!4260 (buf!4703 (_2!8398 lt!276042))) (size!4260 (buf!4703 thiss!1204)))) (not (= lt!276040 (bvsub (bvadd lt!276046 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!179908 () Bool)

(declare-fun res!149325 () Bool)

(declare-fun e!125076 () Bool)

(assert (=> b!179908 (=> (not res!149325) (not e!125076))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!179908 (= res!149325 (invariant!0 (currentBit!8908 thiss!1204) (currentByte!8913 thiss!1204) (size!4260 (buf!4703 thiss!1204))))))

(declare-fun b!179909 () Bool)

(declare-fun e!125078 () Bool)

(declare-fun array_inv!4001 (array!9660) Bool)

(assert (=> b!179909 (= e!125078 (array_inv!4001 (buf!4703 thiss!1204)))))

(declare-fun b!179910 () Bool)

(declare-fun res!149331 () Bool)

(assert (=> b!179910 (=> (not res!149331) (not e!125076))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!179910 (= res!149331 (validate_offset_bits!1 ((_ sign_extend 32) (size!4260 (buf!4703 thiss!1204))) ((_ sign_extend 32) (currentByte!8913 thiss!1204)) ((_ sign_extend 32) (currentBit!8908 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!179911 () Bool)

(assert (=> b!179911 (= e!125076 (not e!125073))))

(declare-fun res!149326 () Bool)

(assert (=> b!179911 (=> res!149326 e!125073)))

(assert (=> b!179911 (= res!149326 (not (= lt!276035 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!276046))))))

(assert (=> b!179911 (= lt!276035 (bitIndex!0 (size!4260 (buf!4703 (_2!8398 lt!276038))) (currentByte!8913 (_2!8398 lt!276038)) (currentBit!8908 (_2!8398 lt!276038))))))

(assert (=> b!179911 (= lt!276046 (bitIndex!0 (size!4260 (buf!4703 thiss!1204)) (currentByte!8913 thiss!1204) (currentBit!8908 thiss!1204)))))

(declare-fun e!125075 () Bool)

(assert (=> b!179911 e!125075))

(declare-fun res!149328 () Bool)

(assert (=> b!179911 (=> (not res!149328) (not e!125075))))

(assert (=> b!179911 (= res!149328 (= (size!4260 (buf!4703 thiss!1204)) (size!4260 (buf!4703 (_2!8398 lt!276038)))))))

(declare-fun lt!276032 () Bool)

(declare-fun appendBit!0 (BitStream!7628 Bool) tuple2!15506)

(assert (=> b!179911 (= lt!276038 (appendBit!0 thiss!1204 lt!276032))))

(assert (=> b!179911 (= lt!276032 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!179912 () Bool)

(declare-fun res!149327 () Bool)

(assert (=> b!179912 (=> res!149327 e!125074)))

(assert (=> b!179912 (= res!149327 (not (isPrefixOf!0 thiss!1204 (_2!8398 lt!276038))))))

(declare-fun b!179913 () Bool)

(declare-fun res!149337 () Bool)

(assert (=> b!179913 (=> res!149337 e!125074)))

(assert (=> b!179913 (= res!149337 (not (isPrefixOf!0 (_2!8398 lt!276038) (_2!8398 lt!276042))))))

(declare-fun b!179914 () Bool)

(declare-fun res!149333 () Bool)

(assert (=> b!179914 (=> res!149333 e!125074)))

(assert (=> b!179914 (= res!149333 (not (invariant!0 (currentBit!8908 (_2!8398 lt!276042)) (currentByte!8913 (_2!8398 lt!276042)) (size!4260 (buf!4703 (_2!8398 lt!276042))))))))

(declare-fun res!149329 () Bool)

(assert (=> start!39726 (=> (not res!149329) (not e!125076))))

(assert (=> start!39726 (= res!149329 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39726 e!125076))

(assert (=> start!39726 true))

(declare-fun inv!12 (BitStream!7628) Bool)

(assert (=> start!39726 (and (inv!12 thiss!1204) e!125078)))

(declare-fun b!179915 () Bool)

(declare-fun res!149324 () Bool)

(declare-fun e!125071 () Bool)

(assert (=> b!179915 (=> (not res!149324) (not e!125071))))

(assert (=> b!179915 (= res!149324 (isPrefixOf!0 thiss!1204 (_2!8398 lt!276038)))))

(declare-fun b!179916 () Bool)

(declare-fun e!125077 () Bool)

(declare-datatypes ((tuple2!15508 0))(
  ( (tuple2!15509 (_1!8399 BitStream!7628) (_2!8399 Bool)) )
))
(declare-fun lt!276036 () tuple2!15508)

(declare-fun lt!276044 () (_ BitVec 64))

(assert (=> b!179916 (= e!125077 (= (bitIndex!0 (size!4260 (buf!4703 (_1!8399 lt!276036))) (currentByte!8913 (_1!8399 lt!276036)) (currentBit!8908 (_1!8399 lt!276036))) lt!276044))))

(declare-fun b!179917 () Bool)

(declare-fun res!149332 () Bool)

(assert (=> b!179917 (=> (not res!149332) (not e!125076))))

(assert (=> b!179917 (= res!149332 (not (= i!590 nBits!348)))))

(declare-fun b!179918 () Bool)

(assert (=> b!179918 (= e!125075 e!125071)))

(declare-fun res!149323 () Bool)

(assert (=> b!179918 (=> (not res!149323) (not e!125071))))

(declare-fun lt!276037 () (_ BitVec 64))

(assert (=> b!179918 (= res!149323 (= lt!276044 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!276037)))))

(assert (=> b!179918 (= lt!276044 (bitIndex!0 (size!4260 (buf!4703 (_2!8398 lt!276038))) (currentByte!8913 (_2!8398 lt!276038)) (currentBit!8908 (_2!8398 lt!276038))))))

(assert (=> b!179918 (= lt!276037 (bitIndex!0 (size!4260 (buf!4703 thiss!1204)) (currentByte!8913 thiss!1204) (currentBit!8908 thiss!1204)))))

(declare-fun b!179919 () Bool)

(declare-fun e!125072 () Bool)

(declare-fun lt!276034 () tuple2!15508)

(declare-fun lt!276039 () tuple2!15508)

(assert (=> b!179919 (= e!125072 (= (_2!8399 lt!276034) (_2!8399 lt!276039)))))

(declare-fun b!179920 () Bool)

(declare-fun e!125080 () Bool)

(assert (=> b!179920 (= e!125080 (invariant!0 (currentBit!8908 thiss!1204) (currentByte!8913 thiss!1204) (size!4260 (buf!4703 (_2!8398 lt!276042)))))))

(declare-fun b!179921 () Bool)

(assert (=> b!179921 (= e!125074 true)))

(declare-datatypes ((tuple2!15510 0))(
  ( (tuple2!15511 (_1!8400 BitStream!7628) (_2!8400 BitStream!7628)) )
))
(declare-fun lt!276047 () tuple2!15510)

(declare-fun readBitPure!0 (BitStream!7628) tuple2!15508)

(assert (=> b!179921 (= (_2!8399 (readBitPure!0 (_1!8400 lt!276047))) lt!276032)))

(declare-fun lt!276033 () tuple2!15510)

(declare-fun reader!0 (BitStream!7628 BitStream!7628) tuple2!15510)

(assert (=> b!179921 (= lt!276033 (reader!0 (_2!8398 lt!276038) (_2!8398 lt!276042)))))

(assert (=> b!179921 (= lt!276047 (reader!0 thiss!1204 (_2!8398 lt!276042)))))

(assert (=> b!179921 e!125072))

(declare-fun res!149322 () Bool)

(assert (=> b!179921 (=> (not res!149322) (not e!125072))))

(assert (=> b!179921 (= res!149322 (= (bitIndex!0 (size!4260 (buf!4703 (_1!8399 lt!276034))) (currentByte!8913 (_1!8399 lt!276034)) (currentBit!8908 (_1!8399 lt!276034))) (bitIndex!0 (size!4260 (buf!4703 (_1!8399 lt!276039))) (currentByte!8913 (_1!8399 lt!276039)) (currentBit!8908 (_1!8399 lt!276039)))))))

(declare-fun lt!276041 () Unit!12939)

(declare-fun lt!276045 () BitStream!7628)

(declare-fun readBitPrefixLemma!0 (BitStream!7628 BitStream!7628) Unit!12939)

(assert (=> b!179921 (= lt!276041 (readBitPrefixLemma!0 lt!276045 (_2!8398 lt!276042)))))

(assert (=> b!179921 (= lt!276039 (readBitPure!0 (BitStream!7629 (buf!4703 (_2!8398 lt!276042)) (currentByte!8913 thiss!1204) (currentBit!8908 thiss!1204))))))

(assert (=> b!179921 (= lt!276034 (readBitPure!0 lt!276045))))

(assert (=> b!179921 e!125080))

(declare-fun res!149335 () Bool)

(assert (=> b!179921 (=> (not res!149335) (not e!125080))))

(assert (=> b!179921 (= res!149335 (invariant!0 (currentBit!8908 thiss!1204) (currentByte!8913 thiss!1204) (size!4260 (buf!4703 (_2!8398 lt!276038)))))))

(assert (=> b!179921 (= lt!276045 (BitStream!7629 (buf!4703 (_2!8398 lt!276038)) (currentByte!8913 thiss!1204) (currentBit!8908 thiss!1204)))))

(declare-fun b!179922 () Bool)

(assert (=> b!179922 (= e!125071 e!125077)))

(declare-fun res!149330 () Bool)

(assert (=> b!179922 (=> (not res!149330) (not e!125077))))

(assert (=> b!179922 (= res!149330 (and (= (_2!8399 lt!276036) lt!276032) (= (_1!8399 lt!276036) (_2!8398 lt!276038))))))

(declare-fun readerFrom!0 (BitStream!7628 (_ BitVec 32) (_ BitVec 32)) BitStream!7628)

(assert (=> b!179922 (= lt!276036 (readBitPure!0 (readerFrom!0 (_2!8398 lt!276038) (currentBit!8908 thiss!1204) (currentByte!8913 thiss!1204))))))

(assert (= (and start!39726 res!149329) b!179910))

(assert (= (and b!179910 res!149331) b!179908))

(assert (= (and b!179908 res!149325) b!179917))

(assert (= (and b!179917 res!149332) b!179911))

(assert (= (and b!179911 res!149328) b!179918))

(assert (= (and b!179918 res!149323) b!179915))

(assert (= (and b!179915 res!149324) b!179922))

(assert (= (and b!179922 res!149330) b!179916))

(assert (= (and b!179911 (not res!149326)) b!179906))

(assert (= (and b!179906 (not res!149336)) b!179914))

(assert (= (and b!179914 (not res!149333)) b!179907))

(assert (= (and b!179907 (not res!149334)) b!179913))

(assert (= (and b!179913 (not res!149337)) b!179912))

(assert (= (and b!179912 (not res!149327)) b!179921))

(assert (= (and b!179921 res!149335) b!179920))

(assert (= (and b!179921 res!149322) b!179919))

(assert (= start!39726 b!179909))

(declare-fun m!280273 () Bool)

(assert (=> b!179913 m!280273))

(declare-fun m!280275 () Bool)

(assert (=> b!179915 m!280275))

(declare-fun m!280277 () Bool)

(assert (=> b!179916 m!280277))

(declare-fun m!280279 () Bool)

(assert (=> b!179918 m!280279))

(declare-fun m!280281 () Bool)

(assert (=> b!179918 m!280281))

(assert (=> b!179912 m!280275))

(declare-fun m!280283 () Bool)

(assert (=> b!179922 m!280283))

(assert (=> b!179922 m!280283))

(declare-fun m!280285 () Bool)

(assert (=> b!179922 m!280285))

(assert (=> b!179911 m!280279))

(assert (=> b!179911 m!280281))

(declare-fun m!280287 () Bool)

(assert (=> b!179911 m!280287))

(declare-fun m!280289 () Bool)

(assert (=> b!179909 m!280289))

(declare-fun m!280291 () Bool)

(assert (=> b!179906 m!280291))

(declare-fun m!280293 () Bool)

(assert (=> b!179906 m!280293))

(declare-fun m!280295 () Bool)

(assert (=> b!179906 m!280295))

(declare-fun m!280297 () Bool)

(assert (=> b!179906 m!280297))

(declare-fun m!280299 () Bool)

(assert (=> b!179910 m!280299))

(declare-fun m!280301 () Bool)

(assert (=> b!179921 m!280301))

(declare-fun m!280303 () Bool)

(assert (=> b!179921 m!280303))

(declare-fun m!280305 () Bool)

(assert (=> b!179921 m!280305))

(declare-fun m!280307 () Bool)

(assert (=> b!179921 m!280307))

(declare-fun m!280309 () Bool)

(assert (=> b!179921 m!280309))

(declare-fun m!280311 () Bool)

(assert (=> b!179921 m!280311))

(declare-fun m!280313 () Bool)

(assert (=> b!179921 m!280313))

(declare-fun m!280315 () Bool)

(assert (=> b!179921 m!280315))

(declare-fun m!280317 () Bool)

(assert (=> b!179921 m!280317))

(declare-fun m!280319 () Bool)

(assert (=> b!179914 m!280319))

(declare-fun m!280321 () Bool)

(assert (=> b!179920 m!280321))

(declare-fun m!280323 () Bool)

(assert (=> b!179908 m!280323))

(declare-fun m!280325 () Bool)

(assert (=> start!39726 m!280325))

(push 1)

(assert (not b!179921))

(assert (not b!179920))

(assert (not start!39726))

(assert (not b!179915))

(assert (not b!179906))

(assert (not b!179910))

(assert (not b!179911))

(assert (not b!179912))

(assert (not b!179914))

(assert (not b!179908))

(assert (not b!179922))

(assert (not b!179909))

(assert (not b!179913))

(assert (not b!179916))

(assert (not b!179918))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

