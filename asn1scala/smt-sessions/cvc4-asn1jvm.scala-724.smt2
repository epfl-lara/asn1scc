; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20234 () Bool)

(assert start!20234)

(declare-fun b!101493 () Bool)

(declare-fun e!66372 () Bool)

(declare-fun e!66369 () Bool)

(assert (=> b!101493 (= e!66372 e!66369)))

(declare-fun res!83405 () Bool)

(assert (=> b!101493 (=> (not res!83405) (not e!66369))))

(declare-datatypes ((array!4765 0))(
  ( (array!4766 (arr!2768 (Array (_ BitVec 32) (_ BitVec 8))) (size!2175 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3824 0))(
  ( (BitStream!3825 (buf!2532 array!4765) (currentByte!4999 (_ BitVec 32)) (currentBit!4994 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3824)

(declare-fun lt!147291 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!101493 (= res!83405 (validate_offset_bits!1 ((_ sign_extend 32) (size!2175 (buf!2532 thiss!1305))) ((_ sign_extend 32) (currentByte!4999 thiss!1305)) ((_ sign_extend 32) (currentBit!4994 thiss!1305)) lt!147291))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!101493 (= lt!147291 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!101494 () Bool)

(declare-fun e!66374 () Bool)

(declare-fun e!66373 () Bool)

(assert (=> b!101494 (= e!66374 e!66373)))

(declare-fun res!83403 () Bool)

(assert (=> b!101494 (=> (not res!83403) (not e!66373))))

(declare-datatypes ((tuple2!8230 0))(
  ( (tuple2!8231 (_1!4370 BitStream!3824) (_2!4370 Bool)) )
))
(declare-fun lt!147284 () tuple2!8230)

(declare-datatypes ((Unit!6222 0))(
  ( (Unit!6223) )
))
(declare-datatypes ((tuple2!8232 0))(
  ( (tuple2!8233 (_1!4371 Unit!6222) (_2!4371 BitStream!3824)) )
))
(declare-fun lt!147280 () tuple2!8232)

(declare-fun lt!147283 () Bool)

(assert (=> b!101494 (= res!83403 (and (= (_2!4370 lt!147284) lt!147283) (= (_1!4370 lt!147284) (_2!4371 lt!147280))))))

(declare-fun readBitPure!0 (BitStream!3824) tuple2!8230)

(declare-fun readerFrom!0 (BitStream!3824 (_ BitVec 32) (_ BitVec 32)) BitStream!3824)

(assert (=> b!101494 (= lt!147284 (readBitPure!0 (readerFrom!0 (_2!4371 lt!147280) (currentBit!4994 thiss!1305) (currentByte!4999 thiss!1305))))))

(declare-fun b!101495 () Bool)

(declare-fun e!66367 () Bool)

(assert (=> b!101495 (= e!66367 e!66374)))

(declare-fun res!83402 () Bool)

(assert (=> b!101495 (=> (not res!83402) (not e!66374))))

(declare-fun lt!147281 () (_ BitVec 64))

(declare-fun lt!147285 () (_ BitVec 64))

(assert (=> b!101495 (= res!83402 (= lt!147281 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!147285)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101495 (= lt!147281 (bitIndex!0 (size!2175 (buf!2532 (_2!4371 lt!147280))) (currentByte!4999 (_2!4371 lt!147280)) (currentBit!4994 (_2!4371 lt!147280))))))

(assert (=> b!101495 (= lt!147285 (bitIndex!0 (size!2175 (buf!2532 thiss!1305)) (currentByte!4999 thiss!1305) (currentBit!4994 thiss!1305)))))

(declare-fun b!101496 () Bool)

(declare-fun e!66375 () Bool)

(declare-fun array_inv!1977 (array!4765) Bool)

(assert (=> b!101496 (= e!66375 (array_inv!1977 (buf!2532 thiss!1305)))))

(declare-fun b!101497 () Bool)

(declare-fun e!66371 () Bool)

(declare-fun lt!147289 () tuple2!8230)

(declare-fun lt!147279 () tuple2!8230)

(assert (=> b!101497 (= e!66371 (= (_2!4370 lt!147289) (_2!4370 lt!147279)))))

(declare-fun b!101498 () Bool)

(declare-fun res!83408 () Bool)

(assert (=> b!101498 (=> (not res!83408) (not e!66369))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101498 (= res!83408 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!101499 () Bool)

(declare-fun res!83401 () Bool)

(declare-fun e!66368 () Bool)

(assert (=> b!101499 (=> (not res!83401) (not e!66368))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!101499 (= res!83401 (invariant!0 (currentBit!4994 thiss!1305) (currentByte!4999 thiss!1305) (size!2175 (buf!2532 (_2!4371 lt!147280)))))))

(declare-fun b!101501 () Bool)

(assert (=> b!101501 (= e!66373 (= (bitIndex!0 (size!2175 (buf!2532 (_1!4370 lt!147284))) (currentByte!4999 (_1!4370 lt!147284)) (currentBit!4994 (_1!4370 lt!147284))) lt!147281))))

(declare-fun b!101502 () Bool)

(assert (=> b!101502 (= e!66369 (not true))))

(declare-fun lt!147292 () tuple2!8232)

(assert (=> b!101502 (validate_offset_bits!1 ((_ sign_extend 32) (size!2175 (buf!2532 (_2!4371 lt!147292)))) ((_ sign_extend 32) (currentByte!4999 thiss!1305)) ((_ sign_extend 32) (currentBit!4994 thiss!1305)) lt!147291)))

(declare-fun lt!147282 () Unit!6222)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3824 array!4765 (_ BitVec 64)) Unit!6222)

(assert (=> b!101502 (= lt!147282 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2532 (_2!4371 lt!147292)) lt!147291))))

(declare-datatypes ((tuple2!8234 0))(
  ( (tuple2!8235 (_1!4372 BitStream!3824) (_2!4372 BitStream!3824)) )
))
(declare-fun lt!147286 () tuple2!8234)

(assert (=> b!101502 (= (_2!4370 (readBitPure!0 (_1!4372 lt!147286))) lt!147283)))

(declare-fun lt!147287 () tuple2!8234)

(declare-fun reader!0 (BitStream!3824 BitStream!3824) tuple2!8234)

(assert (=> b!101502 (= lt!147287 (reader!0 (_2!4371 lt!147280) (_2!4371 lt!147292)))))

(assert (=> b!101502 (= lt!147286 (reader!0 thiss!1305 (_2!4371 lt!147292)))))

(assert (=> b!101502 e!66371))

(declare-fun res!83406 () Bool)

(assert (=> b!101502 (=> (not res!83406) (not e!66371))))

(assert (=> b!101502 (= res!83406 (= (bitIndex!0 (size!2175 (buf!2532 (_1!4370 lt!147289))) (currentByte!4999 (_1!4370 lt!147289)) (currentBit!4994 (_1!4370 lt!147289))) (bitIndex!0 (size!2175 (buf!2532 (_1!4370 lt!147279))) (currentByte!4999 (_1!4370 lt!147279)) (currentBit!4994 (_1!4370 lt!147279)))))))

(declare-fun lt!147288 () Unit!6222)

(declare-fun lt!147278 () BitStream!3824)

(declare-fun readBitPrefixLemma!0 (BitStream!3824 BitStream!3824) Unit!6222)

(assert (=> b!101502 (= lt!147288 (readBitPrefixLemma!0 lt!147278 (_2!4371 lt!147292)))))

(assert (=> b!101502 (= lt!147279 (readBitPure!0 (BitStream!3825 (buf!2532 (_2!4371 lt!147292)) (currentByte!4999 thiss!1305) (currentBit!4994 thiss!1305))))))

(assert (=> b!101502 (= lt!147289 (readBitPure!0 lt!147278))))

(assert (=> b!101502 (= lt!147278 (BitStream!3825 (buf!2532 (_2!4371 lt!147280)) (currentByte!4999 thiss!1305) (currentBit!4994 thiss!1305)))))

(assert (=> b!101502 e!66368))

(declare-fun res!83407 () Bool)

(assert (=> b!101502 (=> (not res!83407) (not e!66368))))

(declare-fun isPrefixOf!0 (BitStream!3824 BitStream!3824) Bool)

(assert (=> b!101502 (= res!83407 (isPrefixOf!0 thiss!1305 (_2!4371 lt!147292)))))

(declare-fun lt!147290 () Unit!6222)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3824 BitStream!3824 BitStream!3824) Unit!6222)

(assert (=> b!101502 (= lt!147290 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4371 lt!147280) (_2!4371 lt!147292)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3824 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8232)

(assert (=> b!101502 (= lt!147292 (appendNLeastSignificantBitsLoop!0 (_2!4371 lt!147280) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!101502 e!66367))

(declare-fun res!83404 () Bool)

(assert (=> b!101502 (=> (not res!83404) (not e!66367))))

(assert (=> b!101502 (= res!83404 (= (size!2175 (buf!2532 thiss!1305)) (size!2175 (buf!2532 (_2!4371 lt!147280)))))))

(declare-fun appendBit!0 (BitStream!3824 Bool) tuple2!8232)

(assert (=> b!101502 (= lt!147280 (appendBit!0 thiss!1305 lt!147283))))

(assert (=> b!101502 (= lt!147283 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!101503 () Bool)

(assert (=> b!101503 (= e!66368 (invariant!0 (currentBit!4994 thiss!1305) (currentByte!4999 thiss!1305) (size!2175 (buf!2532 (_2!4371 lt!147292)))))))

(declare-fun b!101504 () Bool)

(declare-fun res!83400 () Bool)

(assert (=> b!101504 (=> (not res!83400) (not e!66374))))

(assert (=> b!101504 (= res!83400 (isPrefixOf!0 thiss!1305 (_2!4371 lt!147280)))))

(declare-fun res!83398 () Bool)

(assert (=> start!20234 (=> (not res!83398) (not e!66372))))

(assert (=> start!20234 (= res!83398 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20234 e!66372))

(assert (=> start!20234 true))

(declare-fun inv!12 (BitStream!3824) Bool)

(assert (=> start!20234 (and (inv!12 thiss!1305) e!66375)))

(declare-fun b!101500 () Bool)

(declare-fun res!83399 () Bool)

(assert (=> b!101500 (=> (not res!83399) (not e!66369))))

(assert (=> b!101500 (= res!83399 (bvslt i!615 nBits!396))))

(assert (= (and start!20234 res!83398) b!101493))

(assert (= (and b!101493 res!83405) b!101498))

(assert (= (and b!101498 res!83408) b!101500))

(assert (= (and b!101500 res!83399) b!101502))

(assert (= (and b!101502 res!83404) b!101495))

(assert (= (and b!101495 res!83402) b!101504))

(assert (= (and b!101504 res!83400) b!101494))

(assert (= (and b!101494 res!83403) b!101501))

(assert (= (and b!101502 res!83407) b!101499))

(assert (= (and b!101499 res!83401) b!101503))

(assert (= (and b!101502 res!83406) b!101497))

(assert (= start!20234 b!101496))

(declare-fun m!147603 () Bool)

(assert (=> b!101499 m!147603))

(declare-fun m!147605 () Bool)

(assert (=> b!101502 m!147605))

(declare-fun m!147607 () Bool)

(assert (=> b!101502 m!147607))

(declare-fun m!147609 () Bool)

(assert (=> b!101502 m!147609))

(declare-fun m!147611 () Bool)

(assert (=> b!101502 m!147611))

(declare-fun m!147613 () Bool)

(assert (=> b!101502 m!147613))

(declare-fun m!147615 () Bool)

(assert (=> b!101502 m!147615))

(declare-fun m!147617 () Bool)

(assert (=> b!101502 m!147617))

(declare-fun m!147619 () Bool)

(assert (=> b!101502 m!147619))

(declare-fun m!147621 () Bool)

(assert (=> b!101502 m!147621))

(declare-fun m!147623 () Bool)

(assert (=> b!101502 m!147623))

(declare-fun m!147625 () Bool)

(assert (=> b!101502 m!147625))

(declare-fun m!147627 () Bool)

(assert (=> b!101502 m!147627))

(declare-fun m!147629 () Bool)

(assert (=> b!101502 m!147629))

(declare-fun m!147631 () Bool)

(assert (=> b!101502 m!147631))

(declare-fun m!147633 () Bool)

(assert (=> b!101495 m!147633))

(declare-fun m!147635 () Bool)

(assert (=> b!101495 m!147635))

(declare-fun m!147637 () Bool)

(assert (=> b!101496 m!147637))

(declare-fun m!147639 () Bool)

(assert (=> b!101501 m!147639))

(declare-fun m!147641 () Bool)

(assert (=> b!101493 m!147641))

(declare-fun m!147643 () Bool)

(assert (=> b!101498 m!147643))

(declare-fun m!147645 () Bool)

(assert (=> b!101503 m!147645))

(declare-fun m!147647 () Bool)

(assert (=> b!101504 m!147647))

(declare-fun m!147649 () Bool)

(assert (=> b!101494 m!147649))

(assert (=> b!101494 m!147649))

(declare-fun m!147651 () Bool)

(assert (=> b!101494 m!147651))

(declare-fun m!147653 () Bool)

(assert (=> start!20234 m!147653))

(push 1)

(assert (not b!101502))

(assert (not b!101494))

(assert (not b!101495))

(assert (not b!101498))

(assert (not b!101493))

(assert (not b!101503))

