; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20012 () Bool)

(assert start!20012)

(declare-fun b!100010 () Bool)

(declare-fun e!65450 () Bool)

(declare-datatypes ((array!4711 0))(
  ( (array!4712 (arr!2744 (Array (_ BitVec 32) (_ BitVec 8))) (size!2151 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3776 0))(
  ( (BitStream!3777 (buf!2508 array!4711) (currentByte!4954 (_ BitVec 32)) (currentBit!4949 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3776)

(declare-datatypes ((Unit!6129 0))(
  ( (Unit!6130) )
))
(declare-datatypes ((tuple2!8070 0))(
  ( (tuple2!8071 (_1!4290 Unit!6129) (_2!4290 BitStream!3776)) )
))
(declare-fun lt!144690 () tuple2!8070)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!100010 (= e!65450 (invariant!0 (currentBit!4949 thiss!1305) (currentByte!4954 thiss!1305) (size!2151 (buf!2508 (_2!4290 lt!144690)))))))

(declare-fun b!100011 () Bool)

(declare-fun e!65449 () Bool)

(declare-fun e!65447 () Bool)

(assert (=> b!100011 (= e!65449 e!65447)))

(declare-fun res!82112 () Bool)

(assert (=> b!100011 (=> (not res!82112) (not e!65447))))

(declare-fun lt!144688 () (_ BitVec 64))

(declare-fun lt!144687 () (_ BitVec 64))

(assert (=> b!100011 (= res!82112 (= lt!144688 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!144687)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!100011 (= lt!144688 (bitIndex!0 (size!2151 (buf!2508 (_2!4290 lt!144690))) (currentByte!4954 (_2!4290 lt!144690)) (currentBit!4949 (_2!4290 lt!144690))))))

(assert (=> b!100011 (= lt!144687 (bitIndex!0 (size!2151 (buf!2508 thiss!1305)) (currentByte!4954 thiss!1305) (currentBit!4949 thiss!1305)))))

(declare-fun b!100012 () Bool)

(declare-fun e!65448 () Bool)

(declare-fun array_inv!1953 (array!4711) Bool)

(assert (=> b!100012 (= e!65448 (array_inv!1953 (buf!2508 thiss!1305)))))

(declare-fun res!82106 () Bool)

(declare-fun e!65453 () Bool)

(assert (=> start!20012 (=> (not res!82106) (not e!65453))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!20012 (= res!82106 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20012 e!65453))

(assert (=> start!20012 true))

(declare-fun inv!12 (BitStream!3776) Bool)

(assert (=> start!20012 (and (inv!12 thiss!1305) e!65448)))

(declare-fun b!100013 () Bool)

(declare-fun e!65451 () Bool)

(declare-datatypes ((tuple2!8072 0))(
  ( (tuple2!8073 (_1!4291 BitStream!3776) (_2!4291 Bool)) )
))
(declare-fun lt!144683 () tuple2!8072)

(assert (=> b!100013 (= e!65451 (= (bitIndex!0 (size!2151 (buf!2508 (_1!4291 lt!144683))) (currentByte!4954 (_1!4291 lt!144683)) (currentBit!4949 (_1!4291 lt!144683))) lt!144688))))

(declare-fun b!100014 () Bool)

(declare-fun res!82111 () Bool)

(assert (=> b!100014 (=> (not res!82111) (not e!65447))))

(declare-fun isPrefixOf!0 (BitStream!3776 BitStream!3776) Bool)

(assert (=> b!100014 (= res!82111 (isPrefixOf!0 thiss!1305 (_2!4290 lt!144690)))))

(declare-fun b!100015 () Bool)

(declare-fun res!82108 () Bool)

(declare-fun e!65452 () Bool)

(assert (=> b!100015 (=> res!82108 e!65452)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!100015 (= res!82108 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!2151 (buf!2508 (_2!4290 lt!144690)))) ((_ sign_extend 32) (currentByte!4954 thiss!1305)) ((_ sign_extend 32) (currentBit!4949 thiss!1305)))))))

(declare-fun b!100016 () Bool)

(assert (=> b!100016 (= e!65452 true)))

(declare-fun lt!144689 () tuple2!8072)

(declare-fun lt!144691 () tuple2!8070)

(declare-fun readBitPure!0 (BitStream!3776) tuple2!8072)

(assert (=> b!100016 (= lt!144689 (readBitPure!0 (BitStream!3777 (buf!2508 (_2!4290 lt!144691)) (currentByte!4954 thiss!1305) (currentBit!4949 thiss!1305))))))

(declare-fun lt!144684 () tuple2!8072)

(assert (=> b!100016 (= lt!144684 (readBitPure!0 (BitStream!3777 (buf!2508 (_2!4290 lt!144690)) (currentByte!4954 thiss!1305) (currentBit!4949 thiss!1305))))))

(assert (=> b!100016 (invariant!0 (currentBit!4949 thiss!1305) (currentByte!4954 thiss!1305) (size!2151 (buf!2508 (_2!4290 lt!144691))))))

(declare-fun b!100017 () Bool)

(declare-fun res!82105 () Bool)

(assert (=> b!100017 (=> res!82105 e!65452)))

(declare-fun arrayBitRangesEq!0 (array!4711 array!4711 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!100017 (= res!82105 (not (arrayBitRangesEq!0 (buf!2508 (_2!4290 lt!144690)) (buf!2508 (_2!4290 lt!144691)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2151 (buf!2508 (_2!4290 lt!144690))) (currentByte!4954 thiss!1305) (currentBit!4949 thiss!1305))))))))

(declare-fun b!100018 () Bool)

(declare-fun res!82101 () Bool)

(assert (=> b!100018 (=> (not res!82101) (not e!65453))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!100018 (= res!82101 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!100019 () Bool)

(declare-fun res!82109 () Bool)

(assert (=> b!100019 (=> (not res!82109) (not e!65453))))

(assert (=> b!100019 (= res!82109 (bvslt i!615 nBits!396))))

(declare-fun b!100020 () Bool)

(assert (=> b!100020 (= e!65447 e!65451)))

(declare-fun res!82107 () Bool)

(assert (=> b!100020 (=> (not res!82107) (not e!65451))))

(declare-fun lt!144685 () Bool)

(assert (=> b!100020 (= res!82107 (and (= (_2!4291 lt!144683) lt!144685) (= (_1!4291 lt!144683) (_2!4290 lt!144690))))))

(declare-fun readerFrom!0 (BitStream!3776 (_ BitVec 32) (_ BitVec 32)) BitStream!3776)

(assert (=> b!100020 (= lt!144683 (readBitPure!0 (readerFrom!0 (_2!4290 lt!144690) (currentBit!4949 thiss!1305) (currentByte!4954 thiss!1305))))))

(declare-fun b!100021 () Bool)

(assert (=> b!100021 (= e!65453 (not e!65452))))

(declare-fun res!82110 () Bool)

(assert (=> b!100021 (=> res!82110 e!65452)))

(assert (=> b!100021 (= res!82110 (not (= (size!2151 (buf!2508 (_2!4290 lt!144690))) (size!2151 (buf!2508 (_2!4290 lt!144691))))))))

(assert (=> b!100021 e!65450))

(declare-fun res!82103 () Bool)

(assert (=> b!100021 (=> (not res!82103) (not e!65450))))

(assert (=> b!100021 (= res!82103 (isPrefixOf!0 thiss!1305 (_2!4290 lt!144691)))))

(declare-fun lt!144686 () Unit!6129)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3776 BitStream!3776 BitStream!3776) Unit!6129)

(assert (=> b!100021 (= lt!144686 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4290 lt!144690) (_2!4290 lt!144691)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3776 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8070)

(assert (=> b!100021 (= lt!144691 (appendNLeastSignificantBitsLoop!0 (_2!4290 lt!144690) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!100021 e!65449))

(declare-fun res!82102 () Bool)

(assert (=> b!100021 (=> (not res!82102) (not e!65449))))

(assert (=> b!100021 (= res!82102 (= (size!2151 (buf!2508 thiss!1305)) (size!2151 (buf!2508 (_2!4290 lt!144690)))))))

(declare-fun appendBit!0 (BitStream!3776 Bool) tuple2!8070)

(assert (=> b!100021 (= lt!144690 (appendBit!0 thiss!1305 lt!144685))))

(assert (=> b!100021 (= lt!144685 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!100022 () Bool)

(declare-fun res!82104 () Bool)

(assert (=> b!100022 (=> (not res!82104) (not e!65453))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!100022 (= res!82104 (validate_offset_bits!1 ((_ sign_extend 32) (size!2151 (buf!2508 thiss!1305))) ((_ sign_extend 32) (currentByte!4954 thiss!1305)) ((_ sign_extend 32) (currentBit!4949 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(assert (= (and start!20012 res!82106) b!100022))

(assert (= (and b!100022 res!82104) b!100018))

(assert (= (and b!100018 res!82101) b!100019))

(assert (= (and b!100019 res!82109) b!100021))

(assert (= (and b!100021 res!82102) b!100011))

(assert (= (and b!100011 res!82112) b!100014))

(assert (= (and b!100014 res!82111) b!100020))

(assert (= (and b!100020 res!82107) b!100013))

(assert (= (and b!100021 res!82103) b!100010))

(assert (= (and b!100021 (not res!82110)) b!100015))

(assert (= (and b!100015 (not res!82108)) b!100017))

(assert (= (and b!100017 (not res!82105)) b!100016))

(assert (= start!20012 b!100012))

(declare-fun m!145357 () Bool)

(assert (=> b!100016 m!145357))

(declare-fun m!145359 () Bool)

(assert (=> b!100016 m!145359))

(declare-fun m!145361 () Bool)

(assert (=> b!100016 m!145361))

(declare-fun m!145363 () Bool)

(assert (=> b!100015 m!145363))

(declare-fun m!145365 () Bool)

(assert (=> b!100013 m!145365))

(declare-fun m!145367 () Bool)

(assert (=> b!100020 m!145367))

(assert (=> b!100020 m!145367))

(declare-fun m!145369 () Bool)

(assert (=> b!100020 m!145369))

(declare-fun m!145371 () Bool)

(assert (=> b!100022 m!145371))

(declare-fun m!145373 () Bool)

(assert (=> b!100018 m!145373))

(declare-fun m!145375 () Bool)

(assert (=> b!100021 m!145375))

(declare-fun m!145377 () Bool)

(assert (=> b!100021 m!145377))

(declare-fun m!145379 () Bool)

(assert (=> b!100021 m!145379))

(declare-fun m!145381 () Bool)

(assert (=> b!100021 m!145381))

(declare-fun m!145383 () Bool)

(assert (=> b!100017 m!145383))

(declare-fun m!145385 () Bool)

(assert (=> b!100017 m!145385))

(declare-fun m!145387 () Bool)

(assert (=> b!100010 m!145387))

(declare-fun m!145389 () Bool)

(assert (=> b!100011 m!145389))

(declare-fun m!145391 () Bool)

(assert (=> b!100011 m!145391))

(declare-fun m!145393 () Bool)

(assert (=> start!20012 m!145393))

(declare-fun m!145395 () Bool)

(assert (=> b!100014 m!145395))

(declare-fun m!145397 () Bool)

(assert (=> b!100012 m!145397))

(push 1)

(assert (not b!100010))

(assert (not b!100022))

(assert (not b!100011))

(assert (not b!100018))

(assert (not b!100012))

(assert (not b!100014))

(assert (not b!100017))

(assert (not b!100021))

(assert (not b!100013))

(assert (not b!100020))

(assert (not start!20012))

(assert (not b!100015))

(assert (not b!100016))

(check-sat)

(pop 1)

