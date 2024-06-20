; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18790 () Bool)

(assert start!18790)

(declare-fun b!93532 () Bool)

(declare-fun e!61431 () Bool)

(declare-datatypes ((array!4382 0))(
  ( (array!4383 (arr!2605 (Array (_ BitVec 32) (_ BitVec 8))) (size!1988 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3498 0))(
  ( (BitStream!3499 (buf!2358 array!4382) (currentByte!4700 (_ BitVec 32)) (currentBit!4695 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3498)

(declare-fun array_inv!1814 (array!4382) Bool)

(assert (=> b!93532 (= e!61431 (array_inv!1814 (buf!2358 bitStream1!8)))))

(declare-fun b!93533 () Bool)

(declare-fun res!77168 () Bool)

(declare-fun e!61427 () Bool)

(assert (=> b!93533 (=> (not res!77168) (not e!61427))))

(declare-fun bitStream2!8 () BitStream!3498)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!93533 (= res!77168 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1988 (buf!2358 bitStream1!8)) (currentByte!4700 bitStream1!8) (currentBit!4695 bitStream1!8))) (bitIndex!0 (size!1988 (buf!2358 bitStream2!8)) (currentByte!4700 bitStream2!8) (currentBit!4695 bitStream2!8))))))

(declare-fun b!93534 () Bool)

(assert (=> b!93534 (= e!61427 false)))

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun thiss!1534 () BitStream!3498)

(declare-datatypes ((List!855 0))(
  ( (Nil!852) (Cons!851 (h!970 Bool) (t!1605 List!855)) )
))
(declare-fun lt!138468 () List!855)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3498 BitStream!3498 (_ BitVec 64)) List!855)

(assert (=> b!93534 (= lt!138468 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484))))

(declare-fun b!93535 () Bool)

(declare-fun res!77167 () Bool)

(assert (=> b!93535 (=> (not res!77167) (not e!61427))))

(declare-fun base!8 () BitStream!3498)

(assert (=> b!93535 (= res!77167 (and (= (buf!2358 bitStream1!8) (buf!2358 bitStream2!8)) (= (buf!2358 bitStream1!8) (buf!2358 base!8))))))

(declare-fun res!77171 () Bool)

(assert (=> start!18790 (=> (not res!77171) (not e!61427))))

(assert (=> start!18790 (= res!77171 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18790 e!61427))

(assert (=> start!18790 true))

(declare-fun inv!12 (BitStream!3498) Bool)

(assert (=> start!18790 (and (inv!12 bitStream1!8) e!61431)))

(declare-fun e!61429 () Bool)

(assert (=> start!18790 (and (inv!12 bitStream2!8) e!61429)))

(declare-fun e!61425 () Bool)

(assert (=> start!18790 (and (inv!12 base!8) e!61425)))

(declare-fun e!61426 () Bool)

(assert (=> start!18790 (and (inv!12 thiss!1534) e!61426)))

(declare-fun b!93536 () Bool)

(assert (=> b!93536 (= e!61426 (array_inv!1814 (buf!2358 thiss!1534)))))

(declare-fun b!93537 () Bool)

(declare-fun res!77174 () Bool)

(assert (=> b!93537 (=> (not res!77174) (not e!61427))))

(declare-fun isPrefixOf!0 (BitStream!3498 BitStream!3498) Bool)

(assert (=> b!93537 (= res!77174 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!93538 () Bool)

(assert (=> b!93538 (= e!61425 (array_inv!1814 (buf!2358 base!8)))))

(declare-fun b!93539 () Bool)

(assert (=> b!93539 (= e!61429 (array_inv!1814 (buf!2358 bitStream2!8)))))

(declare-fun b!93540 () Bool)

(declare-fun res!77166 () Bool)

(assert (=> b!93540 (=> (not res!77166) (not e!61427))))

(assert (=> b!93540 (= res!77166 (bvslt (bitIndex!0 (size!1988 (buf!2358 base!8)) (currentByte!4700 base!8) (currentBit!4695 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!93541 () Bool)

(declare-fun res!77170 () Bool)

(assert (=> b!93541 (=> (not res!77170) (not e!61427))))

(assert (=> b!93541 (= res!77170 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!93542 () Bool)

(declare-fun res!77173 () Bool)

(assert (=> b!93542 (=> (not res!77173) (not e!61427))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!93542 (= res!77173 (validate_offset_bits!1 ((_ sign_extend 32) (size!1988 (buf!2358 bitStream1!8))) ((_ sign_extend 32) (currentByte!4700 bitStream1!8)) ((_ sign_extend 32) (currentBit!4695 bitStream1!8)) nBits!484))))

(declare-fun b!93543 () Bool)

(declare-fun res!77175 () Bool)

(assert (=> b!93543 (=> (not res!77175) (not e!61427))))

(assert (=> b!93543 (= res!77175 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!93544 () Bool)

(declare-fun res!77172 () Bool)

(assert (=> b!93544 (=> (not res!77172) (not e!61427))))

(assert (=> b!93544 (= res!77172 (validate_offset_bits!1 ((_ sign_extend 32) (size!1988 (buf!2358 bitStream2!8))) ((_ sign_extend 32) (currentByte!4700 bitStream2!8)) ((_ sign_extend 32) (currentBit!4695 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!93545 () Bool)

(declare-fun res!77169 () Bool)

(assert (=> b!93545 (=> (not res!77169) (not e!61427))))

(declare-fun listBits!13 () List!855)

(declare-fun length!446 (List!855) Int)

(assert (=> b!93545 (= res!77169 (> (length!446 listBits!13) 0))))

(assert (= (and start!18790 res!77171) b!93545))

(assert (= (and b!93545 res!77169) b!93541))

(assert (= (and b!93541 res!77170) b!93537))

(assert (= (and b!93537 res!77174) b!93543))

(assert (= (and b!93543 res!77175) b!93535))

(assert (= (and b!93535 res!77167) b!93540))

(assert (= (and b!93540 res!77166) b!93533))

(assert (= (and b!93533 res!77168) b!93542))

(assert (= (and b!93542 res!77173) b!93544))

(assert (= (and b!93544 res!77172) b!93534))

(assert (= start!18790 b!93532))

(assert (= start!18790 b!93539))

(assert (= start!18790 b!93538))

(assert (= start!18790 b!93536))

(declare-fun m!137297 () Bool)

(assert (=> b!93537 m!137297))

(declare-fun m!137299 () Bool)

(assert (=> b!93542 m!137299))

(declare-fun m!137301 () Bool)

(assert (=> b!93544 m!137301))

(declare-fun m!137303 () Bool)

(assert (=> b!93541 m!137303))

(declare-fun m!137305 () Bool)

(assert (=> b!93545 m!137305))

(declare-fun m!137307 () Bool)

(assert (=> b!93540 m!137307))

(declare-fun m!137309 () Bool)

(assert (=> b!93534 m!137309))

(declare-fun m!137311 () Bool)

(assert (=> b!93532 m!137311))

(declare-fun m!137313 () Bool)

(assert (=> b!93543 m!137313))

(declare-fun m!137315 () Bool)

(assert (=> b!93539 m!137315))

(declare-fun m!137317 () Bool)

(assert (=> b!93536 m!137317))

(declare-fun m!137319 () Bool)

(assert (=> b!93538 m!137319))

(declare-fun m!137321 () Bool)

(assert (=> start!18790 m!137321))

(declare-fun m!137323 () Bool)

(assert (=> start!18790 m!137323))

(declare-fun m!137325 () Bool)

(assert (=> start!18790 m!137325))

(declare-fun m!137327 () Bool)

(assert (=> start!18790 m!137327))

(declare-fun m!137329 () Bool)

(assert (=> b!93533 m!137329))

(declare-fun m!137331 () Bool)

(assert (=> b!93533 m!137331))

(check-sat (not b!93537) (not b!93532) (not b!93539) (not b!93545) (not b!93534) (not b!93540) (not b!93533) (not b!93542) (not b!93541) (not b!93544) (not b!93543) (not b!93536) (not start!18790) (not b!93538))
