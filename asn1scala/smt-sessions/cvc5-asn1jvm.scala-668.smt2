; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18776 () Bool)

(assert start!18776)

(declare-fun b!93281 () Bool)

(declare-fun res!76990 () Bool)

(declare-fun e!61270 () Bool)

(assert (=> b!93281 (=> (not res!76990) (not e!61270))))

(declare-datatypes ((array!4368 0))(
  ( (array!4369 (arr!2598 (Array (_ BitVec 32) (_ BitVec 8))) (size!1981 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3484 0))(
  ( (BitStream!3485 (buf!2351 array!4368) (currentByte!4693 (_ BitVec 32)) (currentBit!4688 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3484)

(declare-fun base!8 () BitStream!3484)

(declare-fun bitStream2!8 () BitStream!3484)

(assert (=> b!93281 (= res!76990 (and (= (buf!2351 bitStream1!8) (buf!2351 bitStream2!8)) (= (buf!2351 bitStream1!8) (buf!2351 base!8))))))

(declare-fun b!93282 () Bool)

(declare-fun res!76985 () Bool)

(assert (=> b!93282 (=> (not res!76985) (not e!61270))))

(declare-fun isPrefixOf!0 (BitStream!3484 BitStream!3484) Bool)

(assert (=> b!93282 (= res!76985 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!93283 () Bool)

(declare-fun e!61272 () Bool)

(declare-fun array_inv!1807 (array!4368) Bool)

(assert (=> b!93283 (= e!61272 (array_inv!1807 (buf!2351 bitStream1!8)))))

(declare-fun b!93284 () Bool)

(declare-fun res!76987 () Bool)

(assert (=> b!93284 (=> (not res!76987) (not e!61270))))

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!93284 (= res!76987 (bvslt (bitIndex!0 (size!1981 (buf!2351 base!8)) (currentByte!4693 base!8) (currentBit!4688 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!93285 () Bool)

(declare-fun res!76986 () Bool)

(assert (=> b!93285 (=> (not res!76986) (not e!61270))))

(assert (=> b!93285 (= res!76986 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!93286 () Bool)

(declare-fun res!76989 () Bool)

(assert (=> b!93286 (=> (not res!76989) (not e!61270))))

(declare-datatypes ((List!848 0))(
  ( (Nil!845) (Cons!844 (h!963 Bool) (t!1598 List!848)) )
))
(declare-fun listBits!13 () List!848)

(declare-fun length!439 (List!848) Int)

(assert (=> b!93286 (= res!76989 (> (length!439 listBits!13) 0))))

(declare-fun res!76983 () Bool)

(assert (=> start!18776 (=> (not res!76983) (not e!61270))))

(assert (=> start!18776 (= res!76983 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18776 e!61270))

(assert (=> start!18776 true))

(declare-fun inv!12 (BitStream!3484) Bool)

(assert (=> start!18776 (and (inv!12 bitStream1!8) e!61272)))

(declare-fun e!61267 () Bool)

(assert (=> start!18776 (and (inv!12 bitStream2!8) e!61267)))

(declare-fun e!61266 () Bool)

(assert (=> start!18776 (and (inv!12 base!8) e!61266)))

(declare-fun b!93287 () Bool)

(declare-fun res!76984 () Bool)

(assert (=> b!93287 (=> (not res!76984) (not e!61270))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!93287 (= res!76984 (validate_offset_bits!1 ((_ sign_extend 32) (size!1981 (buf!2351 bitStream1!8))) ((_ sign_extend 32) (currentByte!4693 bitStream1!8)) ((_ sign_extend 32) (currentBit!4688 bitStream1!8)) nBits!484))))

(declare-fun b!93288 () Bool)

(declare-fun res!76992 () Bool)

(assert (=> b!93288 (=> (not res!76992) (not e!61270))))

(assert (=> b!93288 (= res!76992 (validate_offset_bits!1 ((_ sign_extend 32) (size!1981 (buf!2351 bitStream2!8))) ((_ sign_extend 32) (currentByte!4693 bitStream2!8)) ((_ sign_extend 32) (currentBit!4688 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!93289 () Bool)

(declare-fun res!76991 () Bool)

(assert (=> b!93289 (=> (not res!76991) (not e!61270))))

(assert (=> b!93289 (= res!76991 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1981 (buf!2351 bitStream1!8)) (currentByte!4693 bitStream1!8) (currentBit!4688 bitStream1!8))) (bitIndex!0 (size!1981 (buf!2351 bitStream2!8)) (currentByte!4693 bitStream2!8) (currentBit!4688 bitStream2!8))))))

(declare-fun b!93290 () Bool)

(assert (=> b!93290 (= e!61270 (bvslt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!93291 () Bool)

(declare-fun res!76988 () Bool)

(assert (=> b!93291 (=> (not res!76988) (not e!61270))))

(assert (=> b!93291 (= res!76988 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!93292 () Bool)

(assert (=> b!93292 (= e!61266 (array_inv!1807 (buf!2351 base!8)))))

(declare-fun b!93293 () Bool)

(assert (=> b!93293 (= e!61267 (array_inv!1807 (buf!2351 bitStream2!8)))))

(assert (= (and start!18776 res!76983) b!93286))

(assert (= (and b!93286 res!76989) b!93282))

(assert (= (and b!93282 res!76985) b!93291))

(assert (= (and b!93291 res!76988) b!93285))

(assert (= (and b!93285 res!76986) b!93281))

(assert (= (and b!93281 res!76990) b!93284))

(assert (= (and b!93284 res!76987) b!93289))

(assert (= (and b!93289 res!76991) b!93287))

(assert (= (and b!93287 res!76984) b!93288))

(assert (= (and b!93288 res!76992) b!93290))

(assert (= start!18776 b!93283))

(assert (= start!18776 b!93293))

(assert (= start!18776 b!93292))

(declare-fun m!137093 () Bool)

(assert (=> b!93284 m!137093))

(declare-fun m!137095 () Bool)

(assert (=> b!93286 m!137095))

(declare-fun m!137097 () Bool)

(assert (=> b!93282 m!137097))

(declare-fun m!137099 () Bool)

(assert (=> b!93287 m!137099))

(declare-fun m!137101 () Bool)

(assert (=> b!93285 m!137101))

(declare-fun m!137103 () Bool)

(assert (=> start!18776 m!137103))

(declare-fun m!137105 () Bool)

(assert (=> start!18776 m!137105))

(declare-fun m!137107 () Bool)

(assert (=> start!18776 m!137107))

(declare-fun m!137109 () Bool)

(assert (=> b!93289 m!137109))

(declare-fun m!137111 () Bool)

(assert (=> b!93289 m!137111))

(declare-fun m!137113 () Bool)

(assert (=> b!93283 m!137113))

(declare-fun m!137115 () Bool)

(assert (=> b!93293 m!137115))

(declare-fun m!137117 () Bool)

(assert (=> b!93288 m!137117))

(declare-fun m!137119 () Bool)

(assert (=> b!93292 m!137119))

(declare-fun m!137121 () Bool)

(assert (=> b!93291 m!137121))

(push 1)

(assert (not b!93286))

(assert (not b!93287))

(assert (not b!93292))

(assert (not start!18776))

(assert (not b!93293))

(assert (not b!93288))

(assert (not b!93284))

(assert (not b!93283))

(assert (not b!93282))

(assert (not b!93285))

(assert (not b!93289))

(assert (not b!93291))

(check-sat)

(pop 1)

(push 1)

(check-sat)

