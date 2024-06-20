; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42888 () Bool)

(assert start!42888)

(declare-fun b!201924 () Bool)

(declare-fun e!138462 () Bool)

(declare-fun e!138464 () Bool)

(assert (=> b!201924 (= e!138462 (not e!138464))))

(declare-fun res!169098 () Bool)

(assert (=> b!201924 (=> res!169098 e!138464)))

(declare-datatypes ((array!10262 0))(
  ( (array!10263 (arr!5446 (Array (_ BitVec 32) (_ BitVec 8))) (size!4516 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8140 0))(
  ( (BitStream!8141 (buf!5021 array!10262) (currentByte!9452 (_ BitVec 32)) (currentBit!9447 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14325 0))(
  ( (Unit!14326) )
))
(declare-datatypes ((tuple2!17264 0))(
  ( (tuple2!17265 (_1!9284 Unit!14325) (_2!9284 BitStream!8140)) )
))
(declare-fun lt!314769 () tuple2!17264)

(declare-fun thiss!1204 () BitStream!8140)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!201924 (= res!169098 (not (= (bitIndex!0 (size!4516 (buf!5021 (_2!9284 lt!314769))) (currentByte!9452 (_2!9284 lt!314769)) (currentBit!9447 (_2!9284 lt!314769))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4516 (buf!5021 thiss!1204)) (currentByte!9452 thiss!1204) (currentBit!9447 thiss!1204))))))))

(declare-fun e!138465 () Bool)

(assert (=> b!201924 e!138465))

(declare-fun res!169102 () Bool)

(assert (=> b!201924 (=> (not res!169102) (not e!138465))))

(assert (=> b!201924 (= res!169102 (= (size!4516 (buf!5021 thiss!1204)) (size!4516 (buf!5021 (_2!9284 lt!314769)))))))

(declare-fun lt!314771 () Bool)

(declare-fun appendBit!0 (BitStream!8140 Bool) tuple2!17264)

(assert (=> b!201924 (= lt!314769 (appendBit!0 thiss!1204 lt!314771))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!201924 (= lt!314771 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!201925 () Bool)

(declare-fun e!138459 () Bool)

(declare-datatypes ((tuple2!17266 0))(
  ( (tuple2!17267 (_1!9285 BitStream!8140) (_2!9285 Bool)) )
))
(declare-fun lt!314767 () tuple2!17266)

(declare-fun lt!314768 () (_ BitVec 64))

(assert (=> b!201925 (= e!138459 (= (bitIndex!0 (size!4516 (buf!5021 (_1!9285 lt!314767))) (currentByte!9452 (_1!9285 lt!314767)) (currentBit!9447 (_1!9285 lt!314767))) lt!314768))))

(declare-fun b!201927 () Bool)

(declare-fun e!138461 () Bool)

(assert (=> b!201927 (= e!138461 e!138459)))

(declare-fun res!169101 () Bool)

(assert (=> b!201927 (=> (not res!169101) (not e!138459))))

(assert (=> b!201927 (= res!169101 (and (= (_2!9285 lt!314767) lt!314771) (= (_1!9285 lt!314767) (_2!9284 lt!314769))))))

(declare-fun readBitPure!0 (BitStream!8140) tuple2!17266)

(declare-fun readerFrom!0 (BitStream!8140 (_ BitVec 32) (_ BitVec 32)) BitStream!8140)

(assert (=> b!201927 (= lt!314767 (readBitPure!0 (readerFrom!0 (_2!9284 lt!314769) (currentBit!9447 thiss!1204) (currentByte!9452 thiss!1204))))))

(declare-fun b!201928 () Bool)

(assert (=> b!201928 (= e!138465 e!138461)))

(declare-fun res!169099 () Bool)

(assert (=> b!201928 (=> (not res!169099) (not e!138461))))

(declare-fun lt!314770 () (_ BitVec 64))

(assert (=> b!201928 (= res!169099 (= lt!314768 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!314770)))))

(assert (=> b!201928 (= lt!314768 (bitIndex!0 (size!4516 (buf!5021 (_2!9284 lt!314769))) (currentByte!9452 (_2!9284 lt!314769)) (currentBit!9447 (_2!9284 lt!314769))))))

(assert (=> b!201928 (= lt!314770 (bitIndex!0 (size!4516 (buf!5021 thiss!1204)) (currentByte!9452 thiss!1204) (currentBit!9447 thiss!1204)))))

(declare-fun b!201929 () Bool)

(declare-fun res!169100 () Bool)

(assert (=> b!201929 (=> (not res!169100) (not e!138462))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201929 (= res!169100 (validate_offset_bits!1 ((_ sign_extend 32) (size!4516 (buf!5021 thiss!1204))) ((_ sign_extend 32) (currentByte!9452 thiss!1204)) ((_ sign_extend 32) (currentBit!9447 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!201930 () Bool)

(declare-fun res!169103 () Bool)

(assert (=> b!201930 (=> (not res!169103) (not e!138461))))

(declare-fun isPrefixOf!0 (BitStream!8140 BitStream!8140) Bool)

(assert (=> b!201930 (= res!169103 (isPrefixOf!0 thiss!1204 (_2!9284 lt!314769)))))

(declare-fun b!201931 () Bool)

(assert (=> b!201931 (= e!138464 (or (not (= (bvand i!590 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand i!590 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000))))))

(declare-fun res!169104 () Bool)

(assert (=> start!42888 (=> (not res!169104) (not e!138462))))

(assert (=> start!42888 (= res!169104 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42888 e!138462))

(assert (=> start!42888 true))

(declare-fun e!138463 () Bool)

(declare-fun inv!12 (BitStream!8140) Bool)

(assert (=> start!42888 (and (inv!12 thiss!1204) e!138463)))

(declare-fun b!201926 () Bool)

(declare-fun res!169105 () Bool)

(assert (=> b!201926 (=> (not res!169105) (not e!138462))))

(assert (=> b!201926 (= res!169105 (not (= i!590 nBits!348)))))

(declare-fun b!201932 () Bool)

(declare-fun array_inv!4257 (array!10262) Bool)

(assert (=> b!201932 (= e!138463 (array_inv!4257 (buf!5021 thiss!1204)))))

(declare-fun b!201933 () Bool)

(declare-fun res!169106 () Bool)

(assert (=> b!201933 (=> (not res!169106) (not e!138462))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201933 (= res!169106 (invariant!0 (currentBit!9447 thiss!1204) (currentByte!9452 thiss!1204) (size!4516 (buf!5021 thiss!1204))))))

(assert (= (and start!42888 res!169104) b!201929))

(assert (= (and b!201929 res!169100) b!201933))

(assert (= (and b!201933 res!169106) b!201926))

(assert (= (and b!201926 res!169105) b!201924))

(assert (= (and b!201924 res!169102) b!201928))

(assert (= (and b!201928 res!169099) b!201930))

(assert (= (and b!201930 res!169103) b!201927))

(assert (= (and b!201927 res!169101) b!201925))

(assert (= (and b!201924 (not res!169098)) b!201931))

(assert (= start!42888 b!201932))

(declare-fun m!312435 () Bool)

(assert (=> b!201924 m!312435))

(declare-fun m!312437 () Bool)

(assert (=> b!201924 m!312437))

(declare-fun m!312439 () Bool)

(assert (=> b!201924 m!312439))

(declare-fun m!312441 () Bool)

(assert (=> b!201930 m!312441))

(declare-fun m!312443 () Bool)

(assert (=> b!201932 m!312443))

(declare-fun m!312445 () Bool)

(assert (=> b!201933 m!312445))

(declare-fun m!312447 () Bool)

(assert (=> b!201929 m!312447))

(assert (=> b!201928 m!312435))

(assert (=> b!201928 m!312437))

(declare-fun m!312449 () Bool)

(assert (=> b!201927 m!312449))

(assert (=> b!201927 m!312449))

(declare-fun m!312451 () Bool)

(assert (=> b!201927 m!312451))

(declare-fun m!312453 () Bool)

(assert (=> start!42888 m!312453))

(declare-fun m!312455 () Bool)

(assert (=> b!201925 m!312455))

(push 1)

(assert (not b!201933))

(assert (not b!201925))

(assert (not b!201928))

(assert (not b!201930))

(assert (not b!201924))

(assert (not b!201932))

(assert (not b!201929))

(assert (not b!201927))

(assert (not start!42888))

(check-sat)

(pop 1)

(push 1)

(check-sat)

