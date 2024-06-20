; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18788 () Bool)

(assert start!18788)

(declare-fun res!77141 () Bool)

(declare-fun e!61396 () Bool)

(assert (=> start!18788 (=> (not res!77141) (not e!61396))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> start!18788 (= res!77141 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18788 e!61396))

(assert (=> start!18788 true))

(declare-datatypes ((array!4380 0))(
  ( (array!4381 (arr!2604 (Array (_ BitVec 32) (_ BitVec 8))) (size!1987 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3496 0))(
  ( (BitStream!3497 (buf!2357 array!4380) (currentByte!4699 (_ BitVec 32)) (currentBit!4694 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3496)

(declare-fun e!61398 () Bool)

(declare-fun inv!12 (BitStream!3496) Bool)

(assert (=> start!18788 (and (inv!12 bitStream1!8) e!61398)))

(declare-fun bitStream2!8 () BitStream!3496)

(declare-fun e!61399 () Bool)

(assert (=> start!18788 (and (inv!12 bitStream2!8) e!61399)))

(declare-fun base!8 () BitStream!3496)

(declare-fun e!61400 () Bool)

(assert (=> start!18788 (and (inv!12 base!8) e!61400)))

(declare-fun thiss!1534 () BitStream!3496)

(declare-fun e!61397 () Bool)

(assert (=> start!18788 (and (inv!12 thiss!1534) e!61397)))

(declare-fun b!93490 () Bool)

(declare-fun res!77139 () Bool)

(assert (=> b!93490 (=> (not res!77139) (not e!61396))))

(declare-fun isPrefixOf!0 (BitStream!3496 BitStream!3496) Bool)

(assert (=> b!93490 (= res!77139 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!93491 () Bool)

(declare-fun array_inv!1813 (array!4380) Bool)

(assert (=> b!93491 (= e!61399 (array_inv!1813 (buf!2357 bitStream2!8)))))

(declare-fun b!93492 () Bool)

(assert (=> b!93492 (= e!61396 false)))

(declare-datatypes ((List!854 0))(
  ( (Nil!851) (Cons!850 (h!969 Bool) (t!1604 List!854)) )
))
(declare-fun lt!138465 () List!854)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3496 BitStream!3496 (_ BitVec 64)) List!854)

(assert (=> b!93492 (= lt!138465 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484))))

(declare-fun b!93493 () Bool)

(declare-fun res!77143 () Bool)

(assert (=> b!93493 (=> (not res!77143) (not e!61396))))

(assert (=> b!93493 (= res!77143 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!93494 () Bool)

(declare-fun res!77137 () Bool)

(assert (=> b!93494 (=> (not res!77137) (not e!61396))))

(assert (=> b!93494 (= res!77137 (and (= (buf!2357 bitStream1!8) (buf!2357 bitStream2!8)) (= (buf!2357 bitStream1!8) (buf!2357 base!8))))))

(declare-fun b!93495 () Bool)

(declare-fun res!77140 () Bool)

(assert (=> b!93495 (=> (not res!77140) (not e!61396))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!93495 (= res!77140 (validate_offset_bits!1 ((_ sign_extend 32) (size!1987 (buf!2357 bitStream1!8))) ((_ sign_extend 32) (currentByte!4699 bitStream1!8)) ((_ sign_extend 32) (currentBit!4694 bitStream1!8)) nBits!484))))

(declare-fun b!93496 () Bool)

(declare-fun res!77138 () Bool)

(assert (=> b!93496 (=> (not res!77138) (not e!61396))))

(assert (=> b!93496 (= res!77138 (validate_offset_bits!1 ((_ sign_extend 32) (size!1987 (buf!2357 bitStream2!8))) ((_ sign_extend 32) (currentByte!4699 bitStream2!8)) ((_ sign_extend 32) (currentBit!4694 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!93497 () Bool)

(assert (=> b!93497 (= e!61398 (array_inv!1813 (buf!2357 bitStream1!8)))))

(declare-fun b!93498 () Bool)

(assert (=> b!93498 (= e!61397 (array_inv!1813 (buf!2357 thiss!1534)))))

(declare-fun b!93499 () Bool)

(declare-fun res!77145 () Bool)

(assert (=> b!93499 (=> (not res!77145) (not e!61396))))

(declare-fun listBits!13 () List!854)

(declare-fun length!445 (List!854) Int)

(assert (=> b!93499 (= res!77145 (> (length!445 listBits!13) 0))))

(declare-fun b!93500 () Bool)

(declare-fun res!77142 () Bool)

(assert (=> b!93500 (=> (not res!77142) (not e!61396))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!93500 (= res!77142 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1987 (buf!2357 bitStream1!8)) (currentByte!4699 bitStream1!8) (currentBit!4694 bitStream1!8))) (bitIndex!0 (size!1987 (buf!2357 bitStream2!8)) (currentByte!4699 bitStream2!8) (currentBit!4694 bitStream2!8))))))

(declare-fun b!93501 () Bool)

(declare-fun res!77144 () Bool)

(assert (=> b!93501 (=> (not res!77144) (not e!61396))))

(assert (=> b!93501 (= res!77144 (bvslt (bitIndex!0 (size!1987 (buf!2357 base!8)) (currentByte!4699 base!8) (currentBit!4694 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!93502 () Bool)

(assert (=> b!93502 (= e!61400 (array_inv!1813 (buf!2357 base!8)))))

(declare-fun b!93503 () Bool)

(declare-fun res!77136 () Bool)

(assert (=> b!93503 (=> (not res!77136) (not e!61396))))

(assert (=> b!93503 (= res!77136 (isPrefixOf!0 bitStream2!8 base!8))))

(assert (= (and start!18788 res!77141) b!93499))

(assert (= (and b!93499 res!77145) b!93493))

(assert (= (and b!93493 res!77143) b!93503))

(assert (= (and b!93503 res!77136) b!93490))

(assert (= (and b!93490 res!77139) b!93494))

(assert (= (and b!93494 res!77137) b!93501))

(assert (= (and b!93501 res!77144) b!93500))

(assert (= (and b!93500 res!77142) b!93495))

(assert (= (and b!93495 res!77140) b!93496))

(assert (= (and b!93496 res!77138) b!93492))

(assert (= start!18788 b!93497))

(assert (= start!18788 b!93491))

(assert (= start!18788 b!93502))

(assert (= start!18788 b!93498))

(declare-fun m!137261 () Bool)

(assert (=> b!93493 m!137261))

(declare-fun m!137263 () Bool)

(assert (=> b!93498 m!137263))

(declare-fun m!137265 () Bool)

(assert (=> b!93497 m!137265))

(declare-fun m!137267 () Bool)

(assert (=> b!93490 m!137267))

(declare-fun m!137269 () Bool)

(assert (=> b!93495 m!137269))

(declare-fun m!137271 () Bool)

(assert (=> start!18788 m!137271))

(declare-fun m!137273 () Bool)

(assert (=> start!18788 m!137273))

(declare-fun m!137275 () Bool)

(assert (=> start!18788 m!137275))

(declare-fun m!137277 () Bool)

(assert (=> start!18788 m!137277))

(declare-fun m!137279 () Bool)

(assert (=> b!93502 m!137279))

(declare-fun m!137281 () Bool)

(assert (=> b!93501 m!137281))

(declare-fun m!137283 () Bool)

(assert (=> b!93503 m!137283))

(declare-fun m!137285 () Bool)

(assert (=> b!93491 m!137285))

(declare-fun m!137287 () Bool)

(assert (=> b!93492 m!137287))

(declare-fun m!137289 () Bool)

(assert (=> b!93499 m!137289))

(declare-fun m!137291 () Bool)

(assert (=> b!93500 m!137291))

(declare-fun m!137293 () Bool)

(assert (=> b!93500 m!137293))

(declare-fun m!137295 () Bool)

(assert (=> b!93496 m!137295))

(push 1)

(assert (not b!93499))

(assert (not b!93491))

(assert (not b!93496))

(assert (not b!93503))

(assert (not b!93497))

(assert (not b!93501))

(assert (not b!93493))

(assert (not b!93495))

(assert (not b!93502))

(assert (not b!93492))

(assert (not b!93490))

(assert (not start!18788))

(assert (not b!93498))

(assert (not b!93500))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

