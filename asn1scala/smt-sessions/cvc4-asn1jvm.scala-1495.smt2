; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41304 () Bool)

(assert start!41304)

(declare-fun b!193337 () Bool)

(declare-fun e!133125 () Bool)

(declare-fun e!133123 () Bool)

(assert (=> b!193337 (= e!133125 e!133123)))

(declare-fun res!161597 () Bool)

(assert (=> b!193337 (=> (not res!161597) (not e!133123))))

(declare-datatypes ((array!9978 0))(
  ( (array!9979 (arr!5331 (Array (_ BitVec 32) (_ BitVec 8))) (size!4401 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7910 0))(
  ( (BitStream!7911 (buf!4881 array!9978) (currentByte!9165 (_ BitVec 32)) (currentBit!9160 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7910)

(declare-fun lt!300200 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!193337 (= res!161597 (validate_offset_bits!1 ((_ sign_extend 32) (size!4401 (buf!4881 thiss!1204))) ((_ sign_extend 32) (currentByte!9165 thiss!1204)) ((_ sign_extend 32) (currentBit!9160 thiss!1204)) lt!300200))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!193337 (= lt!300200 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!193338 () Bool)

(declare-fun e!133129 () Bool)

(declare-datatypes ((tuple2!16740 0))(
  ( (tuple2!16741 (_1!9015 BitStream!7910) (_2!9015 Bool)) )
))
(declare-fun lt!300199 () tuple2!16740)

(declare-fun lt!300206 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!193338 (= e!133129 (= (bitIndex!0 (size!4401 (buf!4881 (_1!9015 lt!300199))) (currentByte!9165 (_1!9015 lt!300199)) (currentBit!9160 (_1!9015 lt!300199))) lt!300206))))

(declare-fun b!193339 () Bool)

(declare-fun res!161581 () Bool)

(declare-fun e!133136 () Bool)

(assert (=> b!193339 (=> res!161581 e!133136)))

(declare-datatypes ((Unit!13679 0))(
  ( (Unit!13680) )
))
(declare-datatypes ((tuple2!16742 0))(
  ( (tuple2!16743 (_1!9016 Unit!13679) (_2!9016 BitStream!7910)) )
))
(declare-fun lt!300193 () tuple2!16742)

(declare-fun lt!300190 () (_ BitVec 64))

(declare-fun lt!300204 () (_ BitVec 64))

(assert (=> b!193339 (= res!161581 (or (not (= (size!4401 (buf!4881 (_2!9016 lt!300193))) (size!4401 (buf!4881 thiss!1204)))) (not (= lt!300204 (bvsub (bvadd lt!300190 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!193340 () Bool)

(declare-fun res!161592 () Bool)

(assert (=> b!193340 (=> res!161592 e!133136)))

(declare-fun lt!300212 () tuple2!16742)

(declare-fun isPrefixOf!0 (BitStream!7910 BitStream!7910) Bool)

(assert (=> b!193340 (= res!161592 (not (isPrefixOf!0 (_2!9016 lt!300212) (_2!9016 lt!300193))))))

(declare-fun b!193341 () Bool)

(declare-fun e!133132 () Bool)

(declare-fun e!133127 () Bool)

(assert (=> b!193341 (= e!133132 e!133127)))

(declare-fun res!161588 () Bool)

(assert (=> b!193341 (=> res!161588 e!133127)))

(declare-datatypes ((tuple2!16744 0))(
  ( (tuple2!16745 (_1!9017 BitStream!7910) (_2!9017 BitStream!7910)) )
))
(declare-fun lt!300205 () tuple2!16744)

(declare-fun lt!300207 () BitStream!7910)

(assert (=> b!193341 (= res!161588 (not (= (_1!9017 lt!300205) lt!300207)))))

(declare-fun e!133134 () Bool)

(assert (=> b!193341 e!133134))

(declare-fun res!161584 () Bool)

(assert (=> b!193341 (=> (not res!161584) (not e!133134))))

(declare-datatypes ((tuple2!16746 0))(
  ( (tuple2!16747 (_1!9018 BitStream!7910) (_2!9018 (_ BitVec 64))) )
))
(declare-fun lt!300216 () tuple2!16746)

(declare-fun lt!300189 () tuple2!16746)

(assert (=> b!193341 (= res!161584 (and (= (_2!9018 lt!300216) (_2!9018 lt!300189)) (= (_1!9018 lt!300216) (_1!9018 lt!300189))))))

(declare-fun lt!300198 () (_ BitVec 64))

(declare-fun lt!300211 () tuple2!16744)

(declare-fun lt!300201 () Unit!13679)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7910 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13679)

(assert (=> b!193341 (= lt!300201 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9017 lt!300211) nBits!348 i!590 lt!300198))))

(declare-fun lt!300191 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7910 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16746)

(assert (=> b!193341 (= lt!300189 (readNBitsLSBFirstsLoopPure!0 lt!300207 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!300191))))

(declare-fun withMovedBitIndex!0 (BitStream!7910 (_ BitVec 64)) BitStream!7910)

(assert (=> b!193341 (= lt!300207 (withMovedBitIndex!0 (_1!9017 lt!300211) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!193342 () Bool)

(declare-fun res!161589 () Bool)

(assert (=> b!193342 (=> (not res!161589) (not e!133134))))

(declare-fun lt!300196 () (_ BitVec 64))

(assert (=> b!193342 (= res!161589 (= (_1!9017 lt!300205) (withMovedBitIndex!0 (_2!9017 lt!300205) (bvsub lt!300196 lt!300204))))))

(declare-fun b!193343 () Bool)

(assert (=> b!193343 (= e!133136 e!133132)))

(declare-fun res!161575 () Bool)

(assert (=> b!193343 (=> res!161575 e!133132)))

(declare-fun lt!300203 () tuple2!16746)

(assert (=> b!193343 (= res!161575 (not (= (_1!9018 lt!300203) (_2!9017 lt!300205))))))

(assert (=> b!193343 (= lt!300203 (readNBitsLSBFirstsLoopPure!0 (_1!9017 lt!300205) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!300191))))

(declare-fun lt!300214 () (_ BitVec 64))

(assert (=> b!193343 (validate_offset_bits!1 ((_ sign_extend 32) (size!4401 (buf!4881 (_2!9016 lt!300193)))) ((_ sign_extend 32) (currentByte!9165 (_2!9016 lt!300212))) ((_ sign_extend 32) (currentBit!9160 (_2!9016 lt!300212))) lt!300214)))

(declare-fun lt!300210 () Unit!13679)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7910 array!9978 (_ BitVec 64)) Unit!13679)

(assert (=> b!193343 (= lt!300210 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9016 lt!300212) (buf!4881 (_2!9016 lt!300193)) lt!300214))))

(assert (=> b!193343 (= lt!300214 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!300208 () (_ BitVec 64))

(declare-fun lt!300192 () tuple2!16740)

(assert (=> b!193343 (= lt!300191 (bvor lt!300198 (ite (_2!9015 lt!300192) lt!300208 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!193343 (= lt!300216 (readNBitsLSBFirstsLoopPure!0 (_1!9017 lt!300211) nBits!348 i!590 lt!300198))))

(assert (=> b!193343 (validate_offset_bits!1 ((_ sign_extend 32) (size!4401 (buf!4881 (_2!9016 lt!300193)))) ((_ sign_extend 32) (currentByte!9165 thiss!1204)) ((_ sign_extend 32) (currentBit!9160 thiss!1204)) lt!300200)))

(declare-fun lt!300194 () Unit!13679)

(assert (=> b!193343 (= lt!300194 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4881 (_2!9016 lt!300193)) lt!300200))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!193343 (= lt!300198 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!300209 () Bool)

(assert (=> b!193343 (= (_2!9015 lt!300192) lt!300209)))

(declare-fun readBitPure!0 (BitStream!7910) tuple2!16740)

(assert (=> b!193343 (= lt!300192 (readBitPure!0 (_1!9017 lt!300211)))))

(declare-fun reader!0 (BitStream!7910 BitStream!7910) tuple2!16744)

(assert (=> b!193343 (= lt!300205 (reader!0 (_2!9016 lt!300212) (_2!9016 lt!300193)))))

(assert (=> b!193343 (= lt!300211 (reader!0 thiss!1204 (_2!9016 lt!300193)))))

(declare-fun e!133130 () Bool)

(assert (=> b!193343 e!133130))

(declare-fun res!161576 () Bool)

(assert (=> b!193343 (=> (not res!161576) (not e!133130))))

(declare-fun lt!300215 () tuple2!16740)

(declare-fun lt!300213 () tuple2!16740)

(assert (=> b!193343 (= res!161576 (= (bitIndex!0 (size!4401 (buf!4881 (_1!9015 lt!300215))) (currentByte!9165 (_1!9015 lt!300215)) (currentBit!9160 (_1!9015 lt!300215))) (bitIndex!0 (size!4401 (buf!4881 (_1!9015 lt!300213))) (currentByte!9165 (_1!9015 lt!300213)) (currentBit!9160 (_1!9015 lt!300213)))))))

(declare-fun lt!300197 () Unit!13679)

(declare-fun lt!300202 () BitStream!7910)

(declare-fun readBitPrefixLemma!0 (BitStream!7910 BitStream!7910) Unit!13679)

(assert (=> b!193343 (= lt!300197 (readBitPrefixLemma!0 lt!300202 (_2!9016 lt!300193)))))

(assert (=> b!193343 (= lt!300213 (readBitPure!0 (BitStream!7911 (buf!4881 (_2!9016 lt!300193)) (currentByte!9165 thiss!1204) (currentBit!9160 thiss!1204))))))

(assert (=> b!193343 (= lt!300215 (readBitPure!0 lt!300202))))

(declare-fun e!133124 () Bool)

(assert (=> b!193343 e!133124))

(declare-fun res!161586 () Bool)

(assert (=> b!193343 (=> (not res!161586) (not e!133124))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!193343 (= res!161586 (invariant!0 (currentBit!9160 thiss!1204) (currentByte!9165 thiss!1204) (size!4401 (buf!4881 (_2!9016 lt!300212)))))))

(assert (=> b!193343 (= lt!300202 (BitStream!7911 (buf!4881 (_2!9016 lt!300212)) (currentByte!9165 thiss!1204) (currentBit!9160 thiss!1204)))))

(declare-fun b!193344 () Bool)

(declare-fun res!161577 () Bool)

(declare-fun e!133122 () Bool)

(assert (=> b!193344 (=> (not res!161577) (not e!133122))))

(assert (=> b!193344 (= res!161577 (isPrefixOf!0 thiss!1204 (_2!9016 lt!300212)))))

(declare-fun b!193345 () Bool)

(declare-fun res!161587 () Bool)

(assert (=> b!193345 (=> res!161587 e!133127)))

(assert (=> b!193345 (= res!161587 (not (= (bitIndex!0 (size!4401 (buf!4881 (_1!9018 lt!300216))) (currentByte!9165 (_1!9018 lt!300216)) (currentBit!9160 (_1!9018 lt!300216))) (bitIndex!0 (size!4401 (buf!4881 (_2!9017 lt!300211))) (currentByte!9165 (_2!9017 lt!300211)) (currentBit!9160 (_2!9017 lt!300211))))))))

(declare-fun b!193346 () Bool)

(declare-fun res!161578 () Bool)

(assert (=> b!193346 (=> res!161578 e!133136)))

(assert (=> b!193346 (= res!161578 (not (isPrefixOf!0 thiss!1204 (_2!9016 lt!300212))))))

(declare-fun res!161594 () Bool)

(assert (=> start!41304 (=> (not res!161594) (not e!133125))))

(assert (=> start!41304 (= res!161594 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41304 e!133125))

(assert (=> start!41304 true))

(declare-fun e!133133 () Bool)

(declare-fun inv!12 (BitStream!7910) Bool)

(assert (=> start!41304 (and (inv!12 thiss!1204) e!133133)))

(declare-fun b!193347 () Bool)

(declare-fun res!161585 () Bool)

(declare-fun e!133131 () Bool)

(assert (=> b!193347 (=> (not res!161585) (not e!133131))))

(assert (=> b!193347 (= res!161585 (= (_2!9018 lt!300216) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun b!193348 () Bool)

(declare-fun res!161583 () Bool)

(assert (=> b!193348 (=> (not res!161583) (not e!133134))))

(assert (=> b!193348 (= res!161583 (= (_1!9017 lt!300211) (withMovedBitIndex!0 (_2!9017 lt!300211) (bvsub lt!300190 lt!300204))))))

(declare-fun b!193349 () Bool)

(declare-fun e!133135 () Bool)

(assert (=> b!193349 (= e!133135 e!133122)))

(declare-fun res!161598 () Bool)

(assert (=> b!193349 (=> (not res!161598) (not e!133122))))

(declare-fun lt!300195 () (_ BitVec 64))

(assert (=> b!193349 (= res!161598 (= lt!300206 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!300195)))))

(assert (=> b!193349 (= lt!300206 (bitIndex!0 (size!4401 (buf!4881 (_2!9016 lt!300212))) (currentByte!9165 (_2!9016 lt!300212)) (currentBit!9160 (_2!9016 lt!300212))))))

(assert (=> b!193349 (= lt!300195 (bitIndex!0 (size!4401 (buf!4881 thiss!1204)) (currentByte!9165 thiss!1204) (currentBit!9160 thiss!1204)))))

(declare-fun b!193350 () Bool)

(declare-fun res!161593 () Bool)

(assert (=> b!193350 (=> res!161593 e!133136)))

(assert (=> b!193350 (= res!161593 (not (invariant!0 (currentBit!9160 (_2!9016 lt!300193)) (currentByte!9165 (_2!9016 lt!300193)) (size!4401 (buf!4881 (_2!9016 lt!300193))))))))

(declare-fun b!193351 () Bool)

(declare-fun e!133128 () Bool)

(assert (=> b!193351 (= e!133123 (not e!133128))))

(declare-fun res!161582 () Bool)

(assert (=> b!193351 (=> res!161582 e!133128)))

(assert (=> b!193351 (= res!161582 (not (= lt!300196 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!300190))))))

(assert (=> b!193351 (= lt!300196 (bitIndex!0 (size!4401 (buf!4881 (_2!9016 lt!300212))) (currentByte!9165 (_2!9016 lt!300212)) (currentBit!9160 (_2!9016 lt!300212))))))

(assert (=> b!193351 (= lt!300190 (bitIndex!0 (size!4401 (buf!4881 thiss!1204)) (currentByte!9165 thiss!1204) (currentBit!9160 thiss!1204)))))

(assert (=> b!193351 e!133135))

(declare-fun res!161579 () Bool)

(assert (=> b!193351 (=> (not res!161579) (not e!133135))))

(assert (=> b!193351 (= res!161579 (= (size!4401 (buf!4881 thiss!1204)) (size!4401 (buf!4881 (_2!9016 lt!300212)))))))

(declare-fun appendBit!0 (BitStream!7910 Bool) tuple2!16742)

(assert (=> b!193351 (= lt!300212 (appendBit!0 thiss!1204 lt!300209))))

(assert (=> b!193351 (= lt!300209 (not (= (bvand v!189 lt!300208) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!193351 (= lt!300208 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!193352 () Bool)

(assert (=> b!193352 (= e!133128 e!133136)))

(declare-fun res!161591 () Bool)

(assert (=> b!193352 (=> res!161591 e!133136)))

(assert (=> b!193352 (= res!161591 (not (= lt!300204 (bvsub (bvsub (bvadd lt!300196 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!193352 (= lt!300204 (bitIndex!0 (size!4401 (buf!4881 (_2!9016 lt!300193))) (currentByte!9165 (_2!9016 lt!300193)) (currentBit!9160 (_2!9016 lt!300193))))))

(assert (=> b!193352 (isPrefixOf!0 thiss!1204 (_2!9016 lt!300193))))

(declare-fun lt!300217 () Unit!13679)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7910 BitStream!7910 BitStream!7910) Unit!13679)

(assert (=> b!193352 (= lt!300217 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9016 lt!300212) (_2!9016 lt!300193)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7910 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16742)

(assert (=> b!193352 (= lt!300193 (appendBitsLSBFirstLoopTR!0 (_2!9016 lt!300212) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!193353 () Bool)

(assert (=> b!193353 (= e!133131 (= (_1!9018 lt!300216) (_2!9017 lt!300211)))))

(declare-fun b!193354 () Bool)

(assert (=> b!193354 (= e!133127 true)))

(assert (=> b!193354 e!133131))

(declare-fun res!161580 () Bool)

(assert (=> b!193354 (=> (not res!161580) (not e!133131))))

(assert (=> b!193354 (= res!161580 (= (size!4401 (buf!4881 thiss!1204)) (size!4401 (buf!4881 (_2!9016 lt!300193)))))))

(declare-fun b!193355 () Bool)

(assert (=> b!193355 (= e!133124 (invariant!0 (currentBit!9160 thiss!1204) (currentByte!9165 thiss!1204) (size!4401 (buf!4881 (_2!9016 lt!300193)))))))

(declare-fun b!193356 () Bool)

(assert (=> b!193356 (= e!133122 e!133129)))

(declare-fun res!161590 () Bool)

(assert (=> b!193356 (=> (not res!161590) (not e!133129))))

(assert (=> b!193356 (= res!161590 (and (= (_2!9015 lt!300199) lt!300209) (= (_1!9015 lt!300199) (_2!9016 lt!300212))))))

(declare-fun readerFrom!0 (BitStream!7910 (_ BitVec 32) (_ BitVec 32)) BitStream!7910)

(assert (=> b!193356 (= lt!300199 (readBitPure!0 (readerFrom!0 (_2!9016 lt!300212) (currentBit!9160 thiss!1204) (currentByte!9165 thiss!1204))))))

(declare-fun b!193357 () Bool)

(declare-fun res!161595 () Bool)

(assert (=> b!193357 (=> (not res!161595) (not e!133123))))

(assert (=> b!193357 (= res!161595 (invariant!0 (currentBit!9160 thiss!1204) (currentByte!9165 thiss!1204) (size!4401 (buf!4881 thiss!1204))))))

(declare-fun b!193358 () Bool)

(declare-fun array_inv!4142 (array!9978) Bool)

(assert (=> b!193358 (= e!133133 (array_inv!4142 (buf!4881 thiss!1204)))))

(declare-fun b!193359 () Bool)

(assert (=> b!193359 (= e!133130 (= (_2!9015 lt!300215) (_2!9015 lt!300213)))))

(declare-fun b!193360 () Bool)

(assert (=> b!193360 (= e!133134 (and (= lt!300190 (bvsub lt!300196 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9017 lt!300205) lt!300207)) (= (_2!9018 lt!300216) (_2!9018 lt!300203)))))))

(declare-fun b!193361 () Bool)

(declare-fun res!161596 () Bool)

(assert (=> b!193361 (=> (not res!161596) (not e!133123))))

(assert (=> b!193361 (= res!161596 (not (= i!590 nBits!348)))))

(assert (= (and start!41304 res!161594) b!193337))

(assert (= (and b!193337 res!161597) b!193357))

(assert (= (and b!193357 res!161595) b!193361))

(assert (= (and b!193361 res!161596) b!193351))

(assert (= (and b!193351 res!161579) b!193349))

(assert (= (and b!193349 res!161598) b!193344))

(assert (= (and b!193344 res!161577) b!193356))

(assert (= (and b!193356 res!161590) b!193338))

(assert (= (and b!193351 (not res!161582)) b!193352))

(assert (= (and b!193352 (not res!161591)) b!193350))

(assert (= (and b!193350 (not res!161593)) b!193339))

(assert (= (and b!193339 (not res!161581)) b!193340))

(assert (= (and b!193340 (not res!161592)) b!193346))

(assert (= (and b!193346 (not res!161578)) b!193343))

(assert (= (and b!193343 res!161586) b!193355))

(assert (= (and b!193343 res!161576) b!193359))

(assert (= (and b!193343 (not res!161575)) b!193341))

(assert (= (and b!193341 res!161584) b!193348))

(assert (= (and b!193348 res!161583) b!193342))

(assert (= (and b!193342 res!161589) b!193360))

(assert (= (and b!193341 (not res!161588)) b!193345))

(assert (= (and b!193345 (not res!161587)) b!193354))

(assert (= (and b!193354 res!161580) b!193347))

(assert (= (and b!193347 res!161585) b!193353))

(assert (= start!41304 b!193358))

(declare-fun m!299615 () Bool)

(assert (=> b!193346 m!299615))

(declare-fun m!299617 () Bool)

(assert (=> b!193337 m!299617))

(declare-fun m!299619 () Bool)

(assert (=> start!41304 m!299619))

(declare-fun m!299621 () Bool)

(assert (=> b!193345 m!299621))

(declare-fun m!299623 () Bool)

(assert (=> b!193345 m!299623))

(declare-fun m!299625 () Bool)

(assert (=> b!193350 m!299625))

(declare-fun m!299627 () Bool)

(assert (=> b!193341 m!299627))

(declare-fun m!299629 () Bool)

(assert (=> b!193341 m!299629))

(declare-fun m!299631 () Bool)

(assert (=> b!193341 m!299631))

(declare-fun m!299633 () Bool)

(assert (=> b!193352 m!299633))

(declare-fun m!299635 () Bool)

(assert (=> b!193352 m!299635))

(declare-fun m!299637 () Bool)

(assert (=> b!193352 m!299637))

(declare-fun m!299639 () Bool)

(assert (=> b!193352 m!299639))

(declare-fun m!299641 () Bool)

(assert (=> b!193356 m!299641))

(assert (=> b!193356 m!299641))

(declare-fun m!299643 () Bool)

(assert (=> b!193356 m!299643))

(declare-fun m!299645 () Bool)

(assert (=> b!193358 m!299645))

(declare-fun m!299647 () Bool)

(assert (=> b!193351 m!299647))

(declare-fun m!299649 () Bool)

(assert (=> b!193351 m!299649))

(declare-fun m!299651 () Bool)

(assert (=> b!193351 m!299651))

(declare-fun m!299653 () Bool)

(assert (=> b!193338 m!299653))

(assert (=> b!193349 m!299647))

(assert (=> b!193349 m!299649))

(declare-fun m!299655 () Bool)

(assert (=> b!193340 m!299655))

(declare-fun m!299657 () Bool)

(assert (=> b!193342 m!299657))

(declare-fun m!299659 () Bool)

(assert (=> b!193347 m!299659))

(declare-fun m!299661 () Bool)

(assert (=> b!193355 m!299661))

(declare-fun m!299663 () Bool)

(assert (=> b!193343 m!299663))

(declare-fun m!299665 () Bool)

(assert (=> b!193343 m!299665))

(declare-fun m!299667 () Bool)

(assert (=> b!193343 m!299667))

(declare-fun m!299669 () Bool)

(assert (=> b!193343 m!299669))

(declare-fun m!299671 () Bool)

(assert (=> b!193343 m!299671))

(declare-fun m!299673 () Bool)

(assert (=> b!193343 m!299673))

(declare-fun m!299675 () Bool)

(assert (=> b!193343 m!299675))

(declare-fun m!299677 () Bool)

(assert (=> b!193343 m!299677))

(declare-fun m!299679 () Bool)

(assert (=> b!193343 m!299679))

(declare-fun m!299681 () Bool)

(assert (=> b!193343 m!299681))

(declare-fun m!299683 () Bool)

(assert (=> b!193343 m!299683))

(declare-fun m!299685 () Bool)

(assert (=> b!193343 m!299685))

(declare-fun m!299687 () Bool)

(assert (=> b!193343 m!299687))

(declare-fun m!299689 () Bool)

(assert (=> b!193343 m!299689))

(declare-fun m!299691 () Bool)

(assert (=> b!193343 m!299691))

(declare-fun m!299693 () Bool)

(assert (=> b!193343 m!299693))

(declare-fun m!299695 () Bool)

(assert (=> b!193357 m!299695))

(declare-fun m!299697 () Bool)

(assert (=> b!193348 m!299697))

(assert (=> b!193344 m!299615))

(push 1)

(assert (not b!193345))

(assert (not b!193337))

(assert (not b!193358))

(assert (not b!193342))

(assert (not b!193357))

(assert (not b!193356))

(assert (not b!193341))

(assert (not start!41304))

(assert (not b!193355))

(assert (not b!193338))

(assert (not b!193346))

(assert (not b!193344))

(assert (not b!193351))

(assert (not b!193347))

(assert (not b!193343))

(assert (not b!193349))

(assert (not b!193348))

(assert (not b!193350))

(assert (not b!193352))

(assert (not b!193340))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

