; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18774 () Bool)

(assert start!18774)

(declare-fun b!93245 () Bool)

(declare-fun e!61245 () Bool)

(declare-datatypes ((array!4366 0))(
  ( (array!4367 (arr!2597 (Array (_ BitVec 32) (_ BitVec 8))) (size!1980 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3482 0))(
  ( (BitStream!3483 (buf!2350 array!4366) (currentByte!4692 (_ BitVec 32)) (currentBit!4687 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3482)

(declare-fun array_inv!1806 (array!4366) Bool)

(assert (=> b!93245 (= e!61245 (array_inv!1806 (buf!2350 bitStream1!8)))))

(declare-fun b!93246 () Bool)

(declare-fun res!76958 () Bool)

(declare-fun e!61247 () Bool)

(assert (=> b!93246 (=> (not res!76958) (not e!61247))))

(declare-fun bitStream2!8 () BitStream!3482)

(declare-fun base!8 () BitStream!3482)

(assert (=> b!93246 (= res!76958 (and (= (buf!2350 bitStream1!8) (buf!2350 bitStream2!8)) (= (buf!2350 bitStream1!8) (buf!2350 base!8))))))

(declare-fun b!93247 () Bool)

(declare-fun res!76959 () Bool)

(assert (=> b!93247 (=> (not res!76959) (not e!61247))))

(declare-fun isPrefixOf!0 (BitStream!3482 BitStream!3482) Bool)

(assert (=> b!93247 (= res!76959 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!93248 () Bool)

(declare-fun res!76962 () Bool)

(assert (=> b!93248 (=> (not res!76962) (not e!61247))))

(assert (=> b!93248 (= res!76962 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun res!76956 () Bool)

(assert (=> start!18774 (=> (not res!76956) (not e!61247))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> start!18774 (= res!76956 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18774 e!61247))

(assert (=> start!18774 true))

(declare-fun inv!12 (BitStream!3482) Bool)

(assert (=> start!18774 (and (inv!12 bitStream1!8) e!61245)))

(declare-fun e!61246 () Bool)

(assert (=> start!18774 (and (inv!12 bitStream2!8) e!61246)))

(declare-fun e!61251 () Bool)

(assert (=> start!18774 (and (inv!12 base!8) e!61251)))

(declare-fun b!93249 () Bool)

(assert (=> b!93249 (= e!61247 false)))

(declare-fun lt!138444 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!93249 (= lt!138444 (bitIndex!0 (size!1980 (buf!2350 bitStream2!8)) (currentByte!4692 bitStream2!8) (currentBit!4687 bitStream2!8)))))

(declare-fun lt!138443 () (_ BitVec 64))

(assert (=> b!93249 (= lt!138443 (bitIndex!0 (size!1980 (buf!2350 bitStream1!8)) (currentByte!4692 bitStream1!8) (currentBit!4687 bitStream1!8)))))

(declare-fun b!93250 () Bool)

(assert (=> b!93250 (= e!61251 (array_inv!1806 (buf!2350 base!8)))))

(declare-fun b!93251 () Bool)

(declare-fun res!76960 () Bool)

(assert (=> b!93251 (=> (not res!76960) (not e!61247))))

(declare-datatypes ((List!847 0))(
  ( (Nil!844) (Cons!843 (h!962 Bool) (t!1597 List!847)) )
))
(declare-fun listBits!13 () List!847)

(declare-fun length!438 (List!847) Int)

(assert (=> b!93251 (= res!76960 (> (length!438 listBits!13) 0))))

(declare-fun b!93252 () Bool)

(assert (=> b!93252 (= e!61246 (array_inv!1806 (buf!2350 bitStream2!8)))))

(declare-fun b!93253 () Bool)

(declare-fun res!76961 () Bool)

(assert (=> b!93253 (=> (not res!76961) (not e!61247))))

(assert (=> b!93253 (= res!76961 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!93254 () Bool)

(declare-fun res!76957 () Bool)

(assert (=> b!93254 (=> (not res!76957) (not e!61247))))

(assert (=> b!93254 (= res!76957 (bvslt (bitIndex!0 (size!1980 (buf!2350 base!8)) (currentByte!4692 base!8) (currentBit!4687 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(assert (= (and start!18774 res!76956) b!93251))

(assert (= (and b!93251 res!76960) b!93247))

(assert (= (and b!93247 res!76959) b!93248))

(assert (= (and b!93248 res!76962) b!93253))

(assert (= (and b!93253 res!76961) b!93246))

(assert (= (and b!93246 res!76958) b!93254))

(assert (= (and b!93254 res!76957) b!93249))

(assert (= start!18774 b!93245))

(assert (= start!18774 b!93252))

(assert (= start!18774 b!93250))

(declare-fun m!137067 () Bool)

(assert (=> b!93253 m!137067))

(declare-fun m!137069 () Bool)

(assert (=> b!93254 m!137069))

(declare-fun m!137071 () Bool)

(assert (=> b!93249 m!137071))

(declare-fun m!137073 () Bool)

(assert (=> b!93249 m!137073))

(declare-fun m!137075 () Bool)

(assert (=> b!93252 m!137075))

(declare-fun m!137077 () Bool)

(assert (=> b!93251 m!137077))

(declare-fun m!137079 () Bool)

(assert (=> b!93247 m!137079))

(declare-fun m!137081 () Bool)

(assert (=> b!93245 m!137081))

(declare-fun m!137083 () Bool)

(assert (=> b!93250 m!137083))

(declare-fun m!137085 () Bool)

(assert (=> b!93248 m!137085))

(declare-fun m!137087 () Bool)

(assert (=> start!18774 m!137087))

(declare-fun m!137089 () Bool)

(assert (=> start!18774 m!137089))

(declare-fun m!137091 () Bool)

(assert (=> start!18774 m!137091))

(push 1)

(assert (not b!93250))

(assert (not b!93247))

(assert (not b!93254))

(assert (not b!93248))

(assert (not start!18774))

(assert (not b!93253))

(assert (not b!93245))

