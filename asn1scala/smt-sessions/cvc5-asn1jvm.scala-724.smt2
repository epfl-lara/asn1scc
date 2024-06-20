; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20230 () Bool)

(assert start!20230)

(declare-fun b!101421 () Bool)

(declare-fun res!83336 () Bool)

(declare-fun e!66318 () Bool)

(assert (=> b!101421 (=> (not res!83336) (not e!66318))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101421 (= res!83336 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!101422 () Bool)

(declare-fun e!66317 () Bool)

(declare-datatypes ((array!4761 0))(
  ( (array!4762 (arr!2766 (Array (_ BitVec 32) (_ BitVec 8))) (size!2173 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3820 0))(
  ( (BitStream!3821 (buf!2530 array!4761) (currentByte!4997 (_ BitVec 32)) (currentBit!4992 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8218 0))(
  ( (tuple2!8219 (_1!4364 BitStream!3820) (_2!4364 Bool)) )
))
(declare-fun lt!147190 () tuple2!8218)

(declare-fun lt!147188 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101422 (= e!66317 (= (bitIndex!0 (size!2173 (buf!2530 (_1!4364 lt!147190))) (currentByte!4997 (_1!4364 lt!147190)) (currentBit!4992 (_1!4364 lt!147190))) lt!147188))))

(declare-fun b!101423 () Bool)

(declare-fun res!83333 () Bool)

(declare-fun e!66321 () Bool)

(assert (=> b!101423 (=> (not res!83333) (not e!66321))))

(declare-fun thiss!1305 () BitStream!3820)

(declare-datatypes ((Unit!6218 0))(
  ( (Unit!6219) )
))
(declare-datatypes ((tuple2!8220 0))(
  ( (tuple2!8221 (_1!4365 Unit!6218) (_2!4365 BitStream!3820)) )
))
(declare-fun lt!147192 () tuple2!8220)

(declare-fun isPrefixOf!0 (BitStream!3820 BitStream!3820) Bool)

(assert (=> b!101423 (= res!83333 (isPrefixOf!0 thiss!1305 (_2!4365 lt!147192)))))

(declare-fun res!83341 () Bool)

(declare-fun e!66320 () Bool)

(assert (=> start!20230 (=> (not res!83341) (not e!66320))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> start!20230 (= res!83341 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20230 e!66320))

(assert (=> start!20230 true))

(declare-fun e!66319 () Bool)

(declare-fun inv!12 (BitStream!3820) Bool)

(assert (=> start!20230 (and (inv!12 thiss!1305) e!66319)))

(declare-fun b!101424 () Bool)

(declare-fun array_inv!1975 (array!4761) Bool)

(assert (=> b!101424 (= e!66319 (array_inv!1975 (buf!2530 thiss!1305)))))

(declare-fun b!101425 () Bool)

(declare-fun res!83339 () Bool)

(assert (=> b!101425 (=> (not res!83339) (not e!66318))))

(assert (=> b!101425 (= res!83339 (bvslt i!615 nBits!396))))

(declare-fun b!101426 () Bool)

(assert (=> b!101426 (= e!66321 e!66317)))

(declare-fun res!83337 () Bool)

(assert (=> b!101426 (=> (not res!83337) (not e!66317))))

(declare-fun lt!147197 () Bool)

(assert (=> b!101426 (= res!83337 (and (= (_2!4364 lt!147190) lt!147197) (= (_1!4364 lt!147190) (_2!4365 lt!147192))))))

(declare-fun readBitPure!0 (BitStream!3820) tuple2!8218)

(declare-fun readerFrom!0 (BitStream!3820 (_ BitVec 32) (_ BitVec 32)) BitStream!3820)

(assert (=> b!101426 (= lt!147190 (readBitPure!0 (readerFrom!0 (_2!4365 lt!147192) (currentBit!4992 thiss!1305) (currentByte!4997 thiss!1305))))))

(declare-fun b!101427 () Bool)

(declare-fun e!66316 () Bool)

(assert (=> b!101427 (= e!66316 e!66321)))

(declare-fun res!83335 () Bool)

(assert (=> b!101427 (=> (not res!83335) (not e!66321))))

(declare-fun lt!147189 () (_ BitVec 64))

(assert (=> b!101427 (= res!83335 (= lt!147188 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!147189)))))

(assert (=> b!101427 (= lt!147188 (bitIndex!0 (size!2173 (buf!2530 (_2!4365 lt!147192))) (currentByte!4997 (_2!4365 lt!147192)) (currentBit!4992 (_2!4365 lt!147192))))))

(assert (=> b!101427 (= lt!147189 (bitIndex!0 (size!2173 (buf!2530 thiss!1305)) (currentByte!4997 thiss!1305) (currentBit!4992 thiss!1305)))))

(declare-fun b!101428 () Bool)

(declare-fun e!66313 () Bool)

(declare-fun lt!147191 () tuple2!8220)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!101428 (= e!66313 (invariant!0 (currentBit!4992 thiss!1305) (currentByte!4997 thiss!1305) (size!2173 (buf!2530 (_2!4365 lt!147191)))))))

(declare-fun b!101429 () Bool)

(assert (=> b!101429 (= e!66318 (not true))))

(declare-fun lt!147199 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!101429 (validate_offset_bits!1 ((_ sign_extend 32) (size!2173 (buf!2530 (_2!4365 lt!147191)))) ((_ sign_extend 32) (currentByte!4997 thiss!1305)) ((_ sign_extend 32) (currentBit!4992 thiss!1305)) lt!147199)))

(declare-fun lt!147195 () Unit!6218)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3820 array!4761 (_ BitVec 64)) Unit!6218)

(assert (=> b!101429 (= lt!147195 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2530 (_2!4365 lt!147191)) lt!147199))))

(declare-datatypes ((tuple2!8222 0))(
  ( (tuple2!8223 (_1!4366 BitStream!3820) (_2!4366 BitStream!3820)) )
))
(declare-fun lt!147194 () tuple2!8222)

(assert (=> b!101429 (= (_2!4364 (readBitPure!0 (_1!4366 lt!147194))) lt!147197)))

(declare-fun lt!147196 () tuple2!8222)

(declare-fun reader!0 (BitStream!3820 BitStream!3820) tuple2!8222)

(assert (=> b!101429 (= lt!147196 (reader!0 (_2!4365 lt!147192) (_2!4365 lt!147191)))))

(assert (=> b!101429 (= lt!147194 (reader!0 thiss!1305 (_2!4365 lt!147191)))))

(declare-fun e!66315 () Bool)

(assert (=> b!101429 e!66315))

(declare-fun res!83340 () Bool)

(assert (=> b!101429 (=> (not res!83340) (not e!66315))))

(declare-fun lt!147202 () tuple2!8218)

(declare-fun lt!147201 () tuple2!8218)

(assert (=> b!101429 (= res!83340 (= (bitIndex!0 (size!2173 (buf!2530 (_1!4364 lt!147202))) (currentByte!4997 (_1!4364 lt!147202)) (currentBit!4992 (_1!4364 lt!147202))) (bitIndex!0 (size!2173 (buf!2530 (_1!4364 lt!147201))) (currentByte!4997 (_1!4364 lt!147201)) (currentBit!4992 (_1!4364 lt!147201)))))))

(declare-fun lt!147198 () Unit!6218)

(declare-fun lt!147200 () BitStream!3820)

(declare-fun readBitPrefixLemma!0 (BitStream!3820 BitStream!3820) Unit!6218)

(assert (=> b!101429 (= lt!147198 (readBitPrefixLemma!0 lt!147200 (_2!4365 lt!147191)))))

(assert (=> b!101429 (= lt!147201 (readBitPure!0 (BitStream!3821 (buf!2530 (_2!4365 lt!147191)) (currentByte!4997 thiss!1305) (currentBit!4992 thiss!1305))))))

(assert (=> b!101429 (= lt!147202 (readBitPure!0 lt!147200))))

(assert (=> b!101429 (= lt!147200 (BitStream!3821 (buf!2530 (_2!4365 lt!147192)) (currentByte!4997 thiss!1305) (currentBit!4992 thiss!1305)))))

(assert (=> b!101429 e!66313))

(declare-fun res!83342 () Bool)

(assert (=> b!101429 (=> (not res!83342) (not e!66313))))

(assert (=> b!101429 (= res!83342 (isPrefixOf!0 thiss!1305 (_2!4365 lt!147191)))))

(declare-fun lt!147193 () Unit!6218)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3820 BitStream!3820 BitStream!3820) Unit!6218)

(assert (=> b!101429 (= lt!147193 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4365 lt!147192) (_2!4365 lt!147191)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3820 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8220)

(assert (=> b!101429 (= lt!147191 (appendNLeastSignificantBitsLoop!0 (_2!4365 lt!147192) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!101429 e!66316))

(declare-fun res!83332 () Bool)

(assert (=> b!101429 (=> (not res!83332) (not e!66316))))

(assert (=> b!101429 (= res!83332 (= (size!2173 (buf!2530 thiss!1305)) (size!2173 (buf!2530 (_2!4365 lt!147192)))))))

(declare-fun appendBit!0 (BitStream!3820 Bool) tuple2!8220)

(assert (=> b!101429 (= lt!147192 (appendBit!0 thiss!1305 lt!147197))))

(assert (=> b!101429 (= lt!147197 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!101430 () Bool)

(assert (=> b!101430 (= e!66315 (= (_2!4364 lt!147202) (_2!4364 lt!147201)))))

(declare-fun b!101431 () Bool)

(assert (=> b!101431 (= e!66320 e!66318)))

(declare-fun res!83338 () Bool)

(assert (=> b!101431 (=> (not res!83338) (not e!66318))))

(assert (=> b!101431 (= res!83338 (validate_offset_bits!1 ((_ sign_extend 32) (size!2173 (buf!2530 thiss!1305))) ((_ sign_extend 32) (currentByte!4997 thiss!1305)) ((_ sign_extend 32) (currentBit!4992 thiss!1305)) lt!147199))))

(assert (=> b!101431 (= lt!147199 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!101432 () Bool)

(declare-fun res!83334 () Bool)

(assert (=> b!101432 (=> (not res!83334) (not e!66313))))

(assert (=> b!101432 (= res!83334 (invariant!0 (currentBit!4992 thiss!1305) (currentByte!4997 thiss!1305) (size!2173 (buf!2530 (_2!4365 lt!147192)))))))

(assert (= (and start!20230 res!83341) b!101431))

(assert (= (and b!101431 res!83338) b!101421))

(assert (= (and b!101421 res!83336) b!101425))

(assert (= (and b!101425 res!83339) b!101429))

(assert (= (and b!101429 res!83332) b!101427))

(assert (= (and b!101427 res!83335) b!101423))

(assert (= (and b!101423 res!83333) b!101426))

(assert (= (and b!101426 res!83337) b!101422))

(assert (= (and b!101429 res!83342) b!101432))

(assert (= (and b!101432 res!83334) b!101428))

(assert (= (and b!101429 res!83340) b!101430))

(assert (= start!20230 b!101424))

(declare-fun m!147499 () Bool)

(assert (=> b!101428 m!147499))

(declare-fun m!147501 () Bool)

(assert (=> b!101424 m!147501))

(declare-fun m!147503 () Bool)

(assert (=> b!101426 m!147503))

(assert (=> b!101426 m!147503))

(declare-fun m!147505 () Bool)

(assert (=> b!101426 m!147505))

(declare-fun m!147507 () Bool)

(assert (=> b!101421 m!147507))

(declare-fun m!147509 () Bool)

(assert (=> b!101422 m!147509))

(declare-fun m!147511 () Bool)

(assert (=> start!20230 m!147511))

(declare-fun m!147513 () Bool)

(assert (=> b!101423 m!147513))

(declare-fun m!147515 () Bool)

(assert (=> b!101431 m!147515))

(declare-fun m!147517 () Bool)

(assert (=> b!101427 m!147517))

(declare-fun m!147519 () Bool)

(assert (=> b!101427 m!147519))

(declare-fun m!147521 () Bool)

(assert (=> b!101429 m!147521))

(declare-fun m!147523 () Bool)

(assert (=> b!101429 m!147523))

(declare-fun m!147525 () Bool)

(assert (=> b!101429 m!147525))

(declare-fun m!147527 () Bool)

(assert (=> b!101429 m!147527))

(declare-fun m!147529 () Bool)

(assert (=> b!101429 m!147529))

(declare-fun m!147531 () Bool)

(assert (=> b!101429 m!147531))

(declare-fun m!147533 () Bool)

(assert (=> b!101429 m!147533))

(declare-fun m!147535 () Bool)

(assert (=> b!101429 m!147535))

(declare-fun m!147537 () Bool)

(assert (=> b!101429 m!147537))

(declare-fun m!147539 () Bool)

(assert (=> b!101429 m!147539))

(declare-fun m!147541 () Bool)

(assert (=> b!101429 m!147541))

(declare-fun m!147543 () Bool)

(assert (=> b!101429 m!147543))

(declare-fun m!147545 () Bool)

(assert (=> b!101429 m!147545))

(declare-fun m!147547 () Bool)

(assert (=> b!101429 m!147547))

(declare-fun m!147549 () Bool)

(assert (=> b!101432 m!147549))

(push 1)

(assert (not b!101429))

(assert (not start!20230))

(assert (not b!101427))

(assert (not b!101426))

(assert (not b!101421))

(assert (not b!101431))

(assert (not b!101424))

(assert (not b!101432))

(assert (not b!101422))

(assert (not b!101428))

(assert (not b!101423))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

