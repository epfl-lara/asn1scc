; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22986 () Bool)

(assert start!22986)

(declare-fun b!116486 () Bool)

(declare-fun e!76354 () Bool)

(declare-datatypes ((array!5250 0))(
  ( (array!5251 (arr!2975 (Array (_ BitVec 32) (_ BitVec 8))) (size!2382 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4238 0))(
  ( (BitStream!4239 (buf!2792 array!5250) (currentByte!5429 (_ BitVec 32)) (currentBit!5424 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4238)

(declare-datatypes ((Unit!7169 0))(
  ( (Unit!7170) )
))
(declare-datatypes ((tuple2!9656 0))(
  ( (tuple2!9657 (_1!5093 Unit!7169) (_2!5093 BitStream!4238)) )
))
(declare-fun lt!178012 () tuple2!9656)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!116486 (= e!76354 (invariant!0 (currentBit!5424 thiss!1305) (currentByte!5429 thiss!1305) (size!2382 (buf!2792 (_2!5093 lt!178012)))))))

(declare-fun b!116487 () Bool)

(declare-fun res!96319 () Bool)

(declare-fun e!76359 () Bool)

(assert (=> b!116487 (=> (not res!96319) (not e!76359))))

(declare-fun lt!178018 () tuple2!9656)

(declare-fun isPrefixOf!0 (BitStream!4238 BitStream!4238) Bool)

(assert (=> b!116487 (= res!96319 (isPrefixOf!0 thiss!1305 (_2!5093 lt!178018)))))

(declare-fun b!116488 () Bool)

(declare-fun e!76355 () Bool)

(assert (=> b!116488 (= e!76359 e!76355)))

(declare-fun res!96316 () Bool)

(assert (=> b!116488 (=> (not res!96316) (not e!76355))))

(declare-datatypes ((tuple2!9658 0))(
  ( (tuple2!9659 (_1!5094 BitStream!4238) (_2!5094 Bool)) )
))
(declare-fun lt!178014 () tuple2!9658)

(declare-fun lt!178015 () Bool)

(assert (=> b!116488 (= res!96316 (and (= (_2!5094 lt!178014) lt!178015) (= (_1!5094 lt!178014) (_2!5093 lt!178018))))))

(declare-fun readBitPure!0 (BitStream!4238) tuple2!9658)

(declare-fun readerFrom!0 (BitStream!4238 (_ BitVec 32) (_ BitVec 32)) BitStream!4238)

(assert (=> b!116488 (= lt!178014 (readBitPure!0 (readerFrom!0 (_2!5093 lt!178018) (currentBit!5424 thiss!1305) (currentByte!5429 thiss!1305))))))

(declare-fun b!116489 () Bool)

(declare-fun res!96318 () Bool)

(declare-fun e!76353 () Bool)

(assert (=> b!116489 (=> (not res!96318) (not e!76353))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116489 (= res!96318 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun res!96314 () Bool)

(declare-fun e!76358 () Bool)

(assert (=> start!22986 (=> (not res!96314) (not e!76358))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> start!22986 (= res!96314 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22986 e!76358))

(assert (=> start!22986 true))

(declare-fun e!76356 () Bool)

(declare-fun inv!12 (BitStream!4238) Bool)

(assert (=> start!22986 (and (inv!12 thiss!1305) e!76356)))

(declare-fun b!116490 () Bool)

(declare-fun lt!178023 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116490 (= e!76355 (= (bitIndex!0 (size!2382 (buf!2792 (_1!5094 lt!178014))) (currentByte!5429 (_1!5094 lt!178014)) (currentBit!5424 (_1!5094 lt!178014))) lt!178023))))

(declare-fun b!116491 () Bool)

(declare-fun lt!178028 () tuple2!9658)

(declare-fun lt!178021 () (_ BitVec 64))

(assert (=> b!116491 (= e!76353 (not (or (not (_2!5094 lt!178028)) (and (bvsge lt!178021 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!178021 #b0000000000000000000000000000000000000000000000000000000001000000)))))))

(declare-datatypes ((tuple2!9660 0))(
  ( (tuple2!9661 (_1!5095 BitStream!4238) (_2!5095 BitStream!4238)) )
))
(declare-fun lt!178027 () tuple2!9660)

(declare-datatypes ((tuple2!9662 0))(
  ( (tuple2!9663 (_1!5096 BitStream!4238) (_2!5096 (_ BitVec 64))) )
))
(declare-fun lt!178013 () tuple2!9662)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4238 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9662)

(assert (=> b!116491 (= lt!178013 (readNLeastSignificantBitsLoopPure!0 (_1!5095 lt!178027) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(declare-fun lt!178017 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!116491 (validate_offset_bits!1 ((_ sign_extend 32) (size!2382 (buf!2792 (_2!5093 lt!178012)))) ((_ sign_extend 32) (currentByte!5429 thiss!1305)) ((_ sign_extend 32) (currentBit!5424 thiss!1305)) lt!178017)))

(declare-fun lt!178020 () Unit!7169)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4238 array!5250 (_ BitVec 64)) Unit!7169)

(assert (=> b!116491 (= lt!178020 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2792 (_2!5093 lt!178012)) lt!178017))))

(assert (=> b!116491 (= (_2!5094 lt!178028) lt!178015)))

(assert (=> b!116491 (= lt!178028 (readBitPure!0 (_1!5095 lt!178027)))))

(declare-fun lt!178025 () tuple2!9660)

(declare-fun reader!0 (BitStream!4238 BitStream!4238) tuple2!9660)

(assert (=> b!116491 (= lt!178025 (reader!0 (_2!5093 lt!178018) (_2!5093 lt!178012)))))

(assert (=> b!116491 (= lt!178027 (reader!0 thiss!1305 (_2!5093 lt!178012)))))

(declare-fun e!76357 () Bool)

(assert (=> b!116491 e!76357))

(declare-fun res!96317 () Bool)

(assert (=> b!116491 (=> (not res!96317) (not e!76357))))

(declare-fun lt!178022 () tuple2!9658)

(declare-fun lt!178026 () tuple2!9658)

(assert (=> b!116491 (= res!96317 (= (bitIndex!0 (size!2382 (buf!2792 (_1!5094 lt!178022))) (currentByte!5429 (_1!5094 lt!178022)) (currentBit!5424 (_1!5094 lt!178022))) (bitIndex!0 (size!2382 (buf!2792 (_1!5094 lt!178026))) (currentByte!5429 (_1!5094 lt!178026)) (currentBit!5424 (_1!5094 lt!178026)))))))

(declare-fun lt!178019 () Unit!7169)

(declare-fun lt!178016 () BitStream!4238)

(declare-fun readBitPrefixLemma!0 (BitStream!4238 BitStream!4238) Unit!7169)

(assert (=> b!116491 (= lt!178019 (readBitPrefixLemma!0 lt!178016 (_2!5093 lt!178012)))))

(assert (=> b!116491 (= lt!178026 (readBitPure!0 (BitStream!4239 (buf!2792 (_2!5093 lt!178012)) (currentByte!5429 thiss!1305) (currentBit!5424 thiss!1305))))))

(assert (=> b!116491 (= lt!178022 (readBitPure!0 lt!178016))))

(assert (=> b!116491 (= lt!178016 (BitStream!4239 (buf!2792 (_2!5093 lt!178018)) (currentByte!5429 thiss!1305) (currentBit!5424 thiss!1305)))))

(assert (=> b!116491 e!76354))

(declare-fun res!96315 () Bool)

(assert (=> b!116491 (=> (not res!96315) (not e!76354))))

(assert (=> b!116491 (= res!96315 (isPrefixOf!0 thiss!1305 (_2!5093 lt!178012)))))

(declare-fun lt!178029 () Unit!7169)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4238 BitStream!4238 BitStream!4238) Unit!7169)

(assert (=> b!116491 (= lt!178029 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5093 lt!178018) (_2!5093 lt!178012)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4238 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9656)

(assert (=> b!116491 (= lt!178012 (appendNLeastSignificantBitsLoop!0 (_2!5093 lt!178018) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!76352 () Bool)

(assert (=> b!116491 e!76352))

(declare-fun res!96323 () Bool)

(assert (=> b!116491 (=> (not res!96323) (not e!76352))))

(assert (=> b!116491 (= res!96323 (= (size!2382 (buf!2792 thiss!1305)) (size!2382 (buf!2792 (_2!5093 lt!178018)))))))

(declare-fun appendBit!0 (BitStream!4238 Bool) tuple2!9656)

(assert (=> b!116491 (= lt!178018 (appendBit!0 thiss!1305 lt!178015))))

(assert (=> b!116491 (= lt!178015 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 lt!178021)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!116491 (= lt!178021 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))))

(declare-fun b!116492 () Bool)

(declare-fun array_inv!2184 (array!5250) Bool)

(assert (=> b!116492 (= e!76356 (array_inv!2184 (buf!2792 thiss!1305)))))

(declare-fun b!116493 () Bool)

(declare-fun res!96321 () Bool)

(assert (=> b!116493 (=> (not res!96321) (not e!76353))))

(assert (=> b!116493 (= res!96321 (bvslt i!615 nBits!396))))

(declare-fun b!116494 () Bool)

(declare-fun res!96320 () Bool)

(assert (=> b!116494 (=> (not res!96320) (not e!76354))))

(assert (=> b!116494 (= res!96320 (invariant!0 (currentBit!5424 thiss!1305) (currentByte!5429 thiss!1305) (size!2382 (buf!2792 (_2!5093 lt!178018)))))))

(declare-fun b!116495 () Bool)

(assert (=> b!116495 (= e!76352 e!76359)))

(declare-fun res!96324 () Bool)

(assert (=> b!116495 (=> (not res!96324) (not e!76359))))

(declare-fun lt!178024 () (_ BitVec 64))

(assert (=> b!116495 (= res!96324 (= lt!178023 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!178024)))))

(assert (=> b!116495 (= lt!178023 (bitIndex!0 (size!2382 (buf!2792 (_2!5093 lt!178018))) (currentByte!5429 (_2!5093 lt!178018)) (currentBit!5424 (_2!5093 lt!178018))))))

(assert (=> b!116495 (= lt!178024 (bitIndex!0 (size!2382 (buf!2792 thiss!1305)) (currentByte!5429 thiss!1305) (currentBit!5424 thiss!1305)))))

(declare-fun b!116496 () Bool)

(assert (=> b!116496 (= e!76358 e!76353)))

(declare-fun res!96322 () Bool)

(assert (=> b!116496 (=> (not res!96322) (not e!76353))))

(assert (=> b!116496 (= res!96322 (validate_offset_bits!1 ((_ sign_extend 32) (size!2382 (buf!2792 thiss!1305))) ((_ sign_extend 32) (currentByte!5429 thiss!1305)) ((_ sign_extend 32) (currentBit!5424 thiss!1305)) lt!178017))))

(assert (=> b!116496 (= lt!178017 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!116497 () Bool)

(assert (=> b!116497 (= e!76357 (= (_2!5094 lt!178022) (_2!5094 lt!178026)))))

(assert (= (and start!22986 res!96314) b!116496))

(assert (= (and b!116496 res!96322) b!116489))

(assert (= (and b!116489 res!96318) b!116493))

(assert (= (and b!116493 res!96321) b!116491))

(assert (= (and b!116491 res!96323) b!116495))

(assert (= (and b!116495 res!96324) b!116487))

(assert (= (and b!116487 res!96319) b!116488))

(assert (= (and b!116488 res!96316) b!116490))

(assert (= (and b!116491 res!96315) b!116494))

(assert (= (and b!116494 res!96320) b!116486))

(assert (= (and b!116491 res!96317) b!116497))

(assert (= start!22986 b!116492))

(declare-fun m!174435 () Bool)

(assert (=> start!22986 m!174435))

(declare-fun m!174437 () Bool)

(assert (=> b!116491 m!174437))

(declare-fun m!174439 () Bool)

(assert (=> b!116491 m!174439))

(declare-fun m!174441 () Bool)

(assert (=> b!116491 m!174441))

(declare-fun m!174443 () Bool)

(assert (=> b!116491 m!174443))

(declare-fun m!174445 () Bool)

(assert (=> b!116491 m!174445))

(declare-fun m!174447 () Bool)

(assert (=> b!116491 m!174447))

(declare-fun m!174449 () Bool)

(assert (=> b!116491 m!174449))

(declare-fun m!174451 () Bool)

(assert (=> b!116491 m!174451))

(declare-fun m!174453 () Bool)

(assert (=> b!116491 m!174453))

(declare-fun m!174455 () Bool)

(assert (=> b!116491 m!174455))

(declare-fun m!174457 () Bool)

(assert (=> b!116491 m!174457))

(declare-fun m!174459 () Bool)

(assert (=> b!116491 m!174459))

(declare-fun m!174461 () Bool)

(assert (=> b!116491 m!174461))

(declare-fun m!174463 () Bool)

(assert (=> b!116491 m!174463))

(declare-fun m!174465 () Bool)

(assert (=> b!116491 m!174465))

(declare-fun m!174467 () Bool)

(assert (=> b!116491 m!174467))

(declare-fun m!174469 () Bool)

(assert (=> b!116487 m!174469))

(declare-fun m!174471 () Bool)

(assert (=> b!116492 m!174471))

(declare-fun m!174473 () Bool)

(assert (=> b!116489 m!174473))

(declare-fun m!174475 () Bool)

(assert (=> b!116496 m!174475))

(declare-fun m!174477 () Bool)

(assert (=> b!116495 m!174477))

(declare-fun m!174479 () Bool)

(assert (=> b!116495 m!174479))

(declare-fun m!174481 () Bool)

(assert (=> b!116488 m!174481))

(assert (=> b!116488 m!174481))

(declare-fun m!174483 () Bool)

(assert (=> b!116488 m!174483))

(declare-fun m!174485 () Bool)

(assert (=> b!116494 m!174485))

(declare-fun m!174487 () Bool)

(assert (=> b!116490 m!174487))

(declare-fun m!174489 () Bool)

(assert (=> b!116486 m!174489))

(push 1)

(assert (not b!116486))

(assert (not b!116494))

(assert (not b!116496))

(assert (not b!116491))

(assert (not b!116495))

(assert (not b!116490))

(assert (not b!116487))

(assert (not b!116492))

(assert (not b!116489))

(assert (not start!22986))

(assert (not b!116488))

(check-sat)

(pop 1)

(push 1)

(check-sat)

