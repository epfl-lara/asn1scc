; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42098 () Bool)

(assert start!42098)

(declare-fun b!198567 () Bool)

(declare-fun e!136324 () Bool)

(declare-fun lt!309526 () (_ BitVec 64))

(declare-fun lt!309506 () (_ BitVec 64))

(assert (=> b!198567 (= e!136324 (= lt!309526 (bvsub lt!309506 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!198568 () Bool)

(declare-fun res!166218 () Bool)

(declare-fun e!136317 () Bool)

(assert (=> b!198568 (=> res!166218 e!136317)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!309525 () (_ BitVec 64))

(declare-datatypes ((array!10112 0))(
  ( (array!10113 (arr!5386 (Array (_ BitVec 32) (_ BitVec 8))) (size!4456 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8020 0))(
  ( (BitStream!8021 (buf!4948 array!10112) (currentByte!9295 (_ BitVec 32)) (currentBit!9290 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14058 0))(
  ( (Unit!14059) )
))
(declare-datatypes ((tuple2!17108 0))(
  ( (tuple2!17109 (_1!9202 Unit!14058) (_2!9202 BitStream!8020)) )
))
(declare-fun lt!309509 () tuple2!17108)

(declare-fun thiss!1204 () BitStream!8020)

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!198568 (= res!166218 (or (not (= (size!4456 (buf!4948 (_2!9202 lt!309509))) (size!4456 (buf!4948 thiss!1204)))) (not (= lt!309525 (bvsub (bvadd lt!309526 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!198569 () Bool)

(declare-fun res!166227 () Bool)

(assert (=> b!198569 (=> (not res!166227) (not e!136324))))

(declare-datatypes ((tuple2!17110 0))(
  ( (tuple2!17111 (_1!9203 BitStream!8020) (_2!9203 BitStream!8020)) )
))
(declare-fun lt!309512 () tuple2!17110)

(declare-fun withMovedBitIndex!0 (BitStream!8020 (_ BitVec 64)) BitStream!8020)

(assert (=> b!198569 (= res!166227 (= (_1!9203 lt!309512) (withMovedBitIndex!0 (_2!9203 lt!309512) (bvsub lt!309526 lt!309525))))))

(declare-fun b!198570 () Bool)

(declare-fun res!166223 () Bool)

(declare-fun e!136327 () Bool)

(assert (=> b!198570 (=> (not res!166223) (not e!136327))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!198570 (= res!166223 (invariant!0 (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204) (size!4456 (buf!4948 thiss!1204))))))

(declare-fun b!198571 () Bool)

(declare-fun e!136328 () Bool)

(assert (=> b!198571 (= e!136317 e!136328)))

(declare-fun res!166220 () Bool)

(assert (=> b!198571 (=> res!166220 e!136328)))

(declare-fun lt!309531 () (_ BitVec 64))

(declare-fun lt!309516 () tuple2!17110)

(declare-datatypes ((tuple2!17112 0))(
  ( (tuple2!17113 (_1!9204 BitStream!8020) (_2!9204 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8020 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17112)

(assert (=> b!198571 (= res!166220 (not (= (_1!9204 (readNBitsLSBFirstsLoopPure!0 (_1!9203 lt!309516) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!309531)) (_2!9203 lt!309516))))))

(declare-fun lt!309529 () tuple2!17108)

(declare-fun lt!309524 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!198571 (validate_offset_bits!1 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!309509)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309529))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309529))) lt!309524)))

(declare-fun lt!309532 () Unit!14058)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8020 array!10112 (_ BitVec 64)) Unit!14058)

(assert (=> b!198571 (= lt!309532 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9202 lt!309529) (buf!4948 (_2!9202 lt!309509)) lt!309524))))

(assert (=> b!198571 (= lt!309524 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!17114 0))(
  ( (tuple2!17115 (_1!9205 BitStream!8020) (_2!9205 Bool)) )
))
(declare-fun lt!309520 () tuple2!17114)

(declare-fun lt!309528 () (_ BitVec 64))

(declare-fun lt!309511 () (_ BitVec 64))

(assert (=> b!198571 (= lt!309531 (bvor lt!309511 (ite (_2!9205 lt!309520) lt!309528 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!309518 () tuple2!17112)

(assert (=> b!198571 (= lt!309518 (readNBitsLSBFirstsLoopPure!0 (_1!9203 lt!309512) nBits!348 i!590 lt!309511))))

(declare-fun lt!309513 () (_ BitVec 64))

(assert (=> b!198571 (validate_offset_bits!1 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!309509)))) ((_ sign_extend 32) (currentByte!9295 thiss!1204)) ((_ sign_extend 32) (currentBit!9290 thiss!1204)) lt!309513)))

(declare-fun lt!309521 () Unit!14058)

(assert (=> b!198571 (= lt!309521 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4948 (_2!9202 lt!309509)) lt!309513))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!198571 (= lt!309511 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!309530 () Bool)

(assert (=> b!198571 (= (_2!9205 lt!309520) lt!309530)))

(declare-fun readBitPure!0 (BitStream!8020) tuple2!17114)

(assert (=> b!198571 (= lt!309520 (readBitPure!0 (_1!9203 lt!309512)))))

(declare-fun reader!0 (BitStream!8020 BitStream!8020) tuple2!17110)

(assert (=> b!198571 (= lt!309516 (reader!0 (_2!9202 lt!309529) (_2!9202 lt!309509)))))

(assert (=> b!198571 (= lt!309512 (reader!0 thiss!1204 (_2!9202 lt!309509)))))

(declare-fun e!136320 () Bool)

(assert (=> b!198571 e!136320))

(declare-fun res!166211 () Bool)

(assert (=> b!198571 (=> (not res!166211) (not e!136320))))

(declare-fun lt!309523 () tuple2!17114)

(declare-fun lt!309508 () tuple2!17114)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!198571 (= res!166211 (= (bitIndex!0 (size!4456 (buf!4948 (_1!9205 lt!309523))) (currentByte!9295 (_1!9205 lt!309523)) (currentBit!9290 (_1!9205 lt!309523))) (bitIndex!0 (size!4456 (buf!4948 (_1!9205 lt!309508))) (currentByte!9295 (_1!9205 lt!309508)) (currentBit!9290 (_1!9205 lt!309508)))))))

(declare-fun lt!309510 () Unit!14058)

(declare-fun lt!309515 () BitStream!8020)

(declare-fun readBitPrefixLemma!0 (BitStream!8020 BitStream!8020) Unit!14058)

(assert (=> b!198571 (= lt!309510 (readBitPrefixLemma!0 lt!309515 (_2!9202 lt!309509)))))

(assert (=> b!198571 (= lt!309508 (readBitPure!0 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204))))))

(assert (=> b!198571 (= lt!309523 (readBitPure!0 lt!309515))))

(declare-fun e!136323 () Bool)

(assert (=> b!198571 e!136323))

(declare-fun res!166216 () Bool)

(assert (=> b!198571 (=> (not res!166216) (not e!136323))))

(assert (=> b!198571 (= res!166216 (invariant!0 (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204) (size!4456 (buf!4948 (_2!9202 lt!309529)))))))

(assert (=> b!198571 (= lt!309515 (BitStream!8021 (buf!4948 (_2!9202 lt!309529)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)))))

(declare-fun b!198572 () Bool)

(declare-fun e!136316 () Bool)

(assert (=> b!198572 (= e!136316 e!136317)))

(declare-fun res!166219 () Bool)

(assert (=> b!198572 (=> res!166219 e!136317)))

(assert (=> b!198572 (= res!166219 (not (= lt!309525 (bvsub (bvsub (bvadd lt!309506 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!198572 (= lt!309525 (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309509))) (currentByte!9295 (_2!9202 lt!309509)) (currentBit!9290 (_2!9202 lt!309509))))))

(declare-fun isPrefixOf!0 (BitStream!8020 BitStream!8020) Bool)

(assert (=> b!198572 (isPrefixOf!0 thiss!1204 (_2!9202 lt!309509))))

(declare-fun lt!309517 () Unit!14058)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8020 BitStream!8020 BitStream!8020) Unit!14058)

(assert (=> b!198572 (= lt!309517 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9202 lt!309529) (_2!9202 lt!309509)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8020 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17108)

(assert (=> b!198572 (= lt!309509 (appendBitsLSBFirstLoopTR!0 (_2!9202 lt!309529) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!198573 () Bool)

(declare-fun e!136322 () Bool)

(declare-fun array_inv!4197 (array!10112) Bool)

(assert (=> b!198573 (= e!136322 (array_inv!4197 (buf!4948 thiss!1204)))))

(declare-fun b!198574 () Bool)

(assert (=> b!198574 (= e!136327 (not e!136316))))

(declare-fun res!166214 () Bool)

(assert (=> b!198574 (=> res!166214 e!136316)))

(assert (=> b!198574 (= res!166214 (not (= lt!309506 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!309526))))))

(assert (=> b!198574 (= lt!309506 (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))))))

(assert (=> b!198574 (= lt!309526 (bitIndex!0 (size!4456 (buf!4948 thiss!1204)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)))))

(declare-fun e!136318 () Bool)

(assert (=> b!198574 e!136318))

(declare-fun res!166224 () Bool)

(assert (=> b!198574 (=> (not res!166224) (not e!136318))))

(assert (=> b!198574 (= res!166224 (= (size!4456 (buf!4948 thiss!1204)) (size!4456 (buf!4948 (_2!9202 lt!309529)))))))

(declare-fun appendBit!0 (BitStream!8020 Bool) tuple2!17108)

(assert (=> b!198574 (= lt!309529 (appendBit!0 thiss!1204 lt!309530))))

(assert (=> b!198574 (= lt!309530 (not (= (bvand v!189 lt!309528) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198574 (= lt!309528 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!198575 () Bool)

(declare-fun res!166226 () Bool)

(assert (=> b!198575 (=> res!166226 e!136317)))

(assert (=> b!198575 (= res!166226 (not (isPrefixOf!0 (_2!9202 lt!309529) (_2!9202 lt!309509))))))

(declare-fun b!198576 () Bool)

(declare-fun res!166221 () Bool)

(declare-fun e!136325 () Bool)

(assert (=> b!198576 (=> (not res!166221) (not e!136325))))

(assert (=> b!198576 (= res!166221 (isPrefixOf!0 thiss!1204 (_2!9202 lt!309529)))))

(declare-fun res!166208 () Bool)

(declare-fun e!136326 () Bool)

(assert (=> start!42098 (=> (not res!166208) (not e!136326))))

(assert (=> start!42098 (= res!166208 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42098 e!136326))

(assert (=> start!42098 true))

(declare-fun inv!12 (BitStream!8020) Bool)

(assert (=> start!42098 (and (inv!12 thiss!1204) e!136322)))

(declare-fun b!198577 () Bool)

(declare-fun res!166222 () Bool)

(assert (=> b!198577 (=> res!166222 e!136317)))

(assert (=> b!198577 (= res!166222 (not (invariant!0 (currentBit!9290 (_2!9202 lt!309509)) (currentByte!9295 (_2!9202 lt!309509)) (size!4456 (buf!4948 (_2!9202 lt!309509))))))))

(declare-fun b!198578 () Bool)

(assert (=> b!198578 (= e!136326 e!136327)))

(declare-fun res!166217 () Bool)

(assert (=> b!198578 (=> (not res!166217) (not e!136327))))

(assert (=> b!198578 (= res!166217 (validate_offset_bits!1 ((_ sign_extend 32) (size!4456 (buf!4948 thiss!1204))) ((_ sign_extend 32) (currentByte!9295 thiss!1204)) ((_ sign_extend 32) (currentBit!9290 thiss!1204)) lt!309513))))

(assert (=> b!198578 (= lt!309513 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!198579 () Bool)

(assert (=> b!198579 (= e!136323 (invariant!0 (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204) (size!4456 (buf!4948 (_2!9202 lt!309509)))))))

(declare-fun b!198580 () Bool)

(declare-fun res!166210 () Bool)

(assert (=> b!198580 (=> res!166210 e!136317)))

(assert (=> b!198580 (= res!166210 (not (isPrefixOf!0 thiss!1204 (_2!9202 lt!309529))))))

(declare-fun b!198581 () Bool)

(declare-fun res!166212 () Bool)

(assert (=> b!198581 (=> (not res!166212) (not e!136324))))

(assert (=> b!198581 (= res!166212 (= (_1!9203 lt!309516) (withMovedBitIndex!0 (_2!9203 lt!309516) (bvsub lt!309506 lt!309525))))))

(declare-fun b!198582 () Bool)

(declare-fun e!136319 () Bool)

(assert (=> b!198582 (= e!136325 e!136319)))

(declare-fun res!166209 () Bool)

(assert (=> b!198582 (=> (not res!166209) (not e!136319))))

(declare-fun lt!309514 () tuple2!17114)

(assert (=> b!198582 (= res!166209 (and (= (_2!9205 lt!309514) lt!309530) (= (_1!9205 lt!309514) (_2!9202 lt!309529))))))

(declare-fun readerFrom!0 (BitStream!8020 (_ BitVec 32) (_ BitVec 32)) BitStream!8020)

(assert (=> b!198582 (= lt!309514 (readBitPure!0 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204))))))

(declare-fun b!198583 () Bool)

(declare-fun res!166225 () Bool)

(assert (=> b!198583 (=> (not res!166225) (not e!136327))))

(assert (=> b!198583 (= res!166225 (not (= i!590 nBits!348)))))

(declare-fun b!198584 () Bool)

(assert (=> b!198584 (= e!136318 e!136325)))

(declare-fun res!166213 () Bool)

(assert (=> b!198584 (=> (not res!166213) (not e!136325))))

(declare-fun lt!309519 () (_ BitVec 64))

(declare-fun lt!309505 () (_ BitVec 64))

(assert (=> b!198584 (= res!166213 (= lt!309519 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!309505)))))

(assert (=> b!198584 (= lt!309519 (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))))))

(assert (=> b!198584 (= lt!309505 (bitIndex!0 (size!4456 (buf!4948 thiss!1204)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)))))

(declare-fun b!198585 () Bool)

(declare-fun lt!309522 () BitStream!8020)

(assert (=> b!198585 (= e!136328 (= (_1!9203 lt!309516) lt!309522))))

(assert (=> b!198585 e!136324))

(declare-fun res!166215 () Bool)

(assert (=> b!198585 (=> (not res!166215) (not e!136324))))

(declare-fun lt!309507 () tuple2!17112)

(assert (=> b!198585 (= res!166215 (and (= (_2!9204 lt!309518) (_2!9204 lt!309507)) (= (_1!9204 lt!309518) (_1!9204 lt!309507))))))

(declare-fun lt!309527 () Unit!14058)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8020 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14058)

(assert (=> b!198585 (= lt!309527 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9203 lt!309512) nBits!348 i!590 lt!309511))))

(assert (=> b!198585 (= lt!309507 (readNBitsLSBFirstsLoopPure!0 lt!309522 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!309531))))

(assert (=> b!198585 (= lt!309522 (withMovedBitIndex!0 (_1!9203 lt!309512) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!198586 () Bool)

(assert (=> b!198586 (= e!136319 (= (bitIndex!0 (size!4456 (buf!4948 (_1!9205 lt!309514))) (currentByte!9295 (_1!9205 lt!309514)) (currentBit!9290 (_1!9205 lt!309514))) lt!309519))))

(declare-fun b!198587 () Bool)

(assert (=> b!198587 (= e!136320 (= (_2!9205 lt!309523) (_2!9205 lt!309508)))))

(assert (= (and start!42098 res!166208) b!198578))

(assert (= (and b!198578 res!166217) b!198570))

(assert (= (and b!198570 res!166223) b!198583))

(assert (= (and b!198583 res!166225) b!198574))

(assert (= (and b!198574 res!166224) b!198584))

(assert (= (and b!198584 res!166213) b!198576))

(assert (= (and b!198576 res!166221) b!198582))

(assert (= (and b!198582 res!166209) b!198586))

(assert (= (and b!198574 (not res!166214)) b!198572))

(assert (= (and b!198572 (not res!166219)) b!198577))

(assert (= (and b!198577 (not res!166222)) b!198568))

(assert (= (and b!198568 (not res!166218)) b!198575))

(assert (= (and b!198575 (not res!166226)) b!198580))

(assert (= (and b!198580 (not res!166210)) b!198571))

(assert (= (and b!198571 res!166216) b!198579))

(assert (= (and b!198571 res!166211) b!198587))

(assert (= (and b!198571 (not res!166220)) b!198585))

(assert (= (and b!198585 res!166215) b!198569))

(assert (= (and b!198569 res!166227) b!198581))

(assert (= (and b!198581 res!166212) b!198567))

(assert (= start!42098 b!198573))

(declare-fun m!307495 () Bool)

(assert (=> b!198572 m!307495))

(declare-fun m!307497 () Bool)

(assert (=> b!198572 m!307497))

(declare-fun m!307499 () Bool)

(assert (=> b!198572 m!307499))

(declare-fun m!307501 () Bool)

(assert (=> b!198572 m!307501))

(declare-fun m!307503 () Bool)

(assert (=> b!198577 m!307503))

(declare-fun m!307505 () Bool)

(assert (=> b!198576 m!307505))

(declare-fun m!307507 () Bool)

(assert (=> b!198571 m!307507))

(declare-fun m!307509 () Bool)

(assert (=> b!198571 m!307509))

(declare-fun m!307511 () Bool)

(assert (=> b!198571 m!307511))

(declare-fun m!307513 () Bool)

(assert (=> b!198571 m!307513))

(declare-fun m!307515 () Bool)

(assert (=> b!198571 m!307515))

(declare-fun m!307517 () Bool)

(assert (=> b!198571 m!307517))

(declare-fun m!307519 () Bool)

(assert (=> b!198571 m!307519))

(declare-fun m!307521 () Bool)

(assert (=> b!198571 m!307521))

(declare-fun m!307523 () Bool)

(assert (=> b!198571 m!307523))

(declare-fun m!307525 () Bool)

(assert (=> b!198571 m!307525))

(declare-fun m!307527 () Bool)

(assert (=> b!198571 m!307527))

(declare-fun m!307529 () Bool)

(assert (=> b!198571 m!307529))

(declare-fun m!307531 () Bool)

(assert (=> b!198571 m!307531))

(declare-fun m!307533 () Bool)

(assert (=> b!198571 m!307533))

(declare-fun m!307535 () Bool)

(assert (=> b!198571 m!307535))

(declare-fun m!307537 () Bool)

(assert (=> b!198571 m!307537))

(declare-fun m!307539 () Bool)

(assert (=> b!198584 m!307539))

(declare-fun m!307541 () Bool)

(assert (=> b!198584 m!307541))

(declare-fun m!307543 () Bool)

(assert (=> b!198573 m!307543))

(declare-fun m!307545 () Bool)

(assert (=> b!198585 m!307545))

(declare-fun m!307547 () Bool)

(assert (=> b!198585 m!307547))

(declare-fun m!307549 () Bool)

(assert (=> b!198585 m!307549))

(declare-fun m!307551 () Bool)

(assert (=> b!198586 m!307551))

(declare-fun m!307553 () Bool)

(assert (=> start!42098 m!307553))

(declare-fun m!307555 () Bool)

(assert (=> b!198570 m!307555))

(declare-fun m!307557 () Bool)

(assert (=> b!198582 m!307557))

(assert (=> b!198582 m!307557))

(declare-fun m!307559 () Bool)

(assert (=> b!198582 m!307559))

(declare-fun m!307561 () Bool)

(assert (=> b!198579 m!307561))

(declare-fun m!307563 () Bool)

(assert (=> b!198575 m!307563))

(assert (=> b!198574 m!307539))

(assert (=> b!198574 m!307541))

(declare-fun m!307565 () Bool)

(assert (=> b!198574 m!307565))

(declare-fun m!307567 () Bool)

(assert (=> b!198569 m!307567))

(declare-fun m!307569 () Bool)

(assert (=> b!198581 m!307569))

(assert (=> b!198580 m!307505))

(declare-fun m!307571 () Bool)

(assert (=> b!198578 m!307571))

(push 1)

(assert (not b!198582))

(assert (not b!198577))

(assert (not b!198586))

(assert (not b!198574))

(assert (not b!198572))

(assert (not b!198581))

(assert (not b!198580))

(assert (not b!198579))

(assert (not start!42098))

(assert (not b!198585))

(assert (not b!198571))

(assert (not b!198570))

(assert (not b!198578))

(assert (not b!198584))

(assert (not b!198573))

(assert (not b!198569))

(assert (not b!198575))

(assert (not b!198576))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!67583 () Bool)

(declare-datatypes ((tuple2!17136 0))(
  ( (tuple2!17137 (_1!9216 Bool) (_2!9216 BitStream!8020)) )
))
(declare-fun lt!309895 () tuple2!17136)

(declare-fun readBit!0 (BitStream!8020) tuple2!17136)

(assert (=> d!67583 (= lt!309895 (readBit!0 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204))))))

(assert (=> d!67583 (= (readBitPure!0 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204))) (tuple2!17115 (_2!9216 lt!309895) (_1!9216 lt!309895)))))

(declare-fun bs!16721 () Bool)

(assert (= bs!16721 d!67583))

(assert (=> bs!16721 m!307557))

(declare-fun m!307881 () Bool)

(assert (=> bs!16721 m!307881))

(assert (=> b!198582 d!67583))

(declare-fun d!67585 () Bool)

(declare-fun e!136449 () Bool)

(assert (=> d!67585 e!136449))

(declare-fun res!166413 () Bool)

(assert (=> d!67585 (=> (not res!166413) (not e!136449))))

(assert (=> d!67585 (= res!166413 (invariant!0 (currentBit!9290 (_2!9202 lt!309529)) (currentByte!9295 (_2!9202 lt!309529)) (size!4456 (buf!4948 (_2!9202 lt!309529)))))))

(assert (=> d!67585 (= (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204)) (BitStream!8021 (buf!4948 (_2!9202 lt!309529)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)))))

(declare-fun b!198786 () Bool)

(assert (=> b!198786 (= e!136449 (invariant!0 (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204) (size!4456 (buf!4948 (_2!9202 lt!309529)))))))

(assert (= (and d!67585 res!166413) b!198786))

(declare-fun m!307883 () Bool)

(assert (=> d!67585 m!307883))

(assert (=> b!198786 m!307521))

(assert (=> b!198582 d!67585))

(declare-fun d!67587 () Bool)

(assert (=> d!67587 (validate_offset_bits!1 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!309509)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309529))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309529))) lt!309524)))

(declare-fun lt!309898 () Unit!14058)

(declare-fun choose!9 (BitStream!8020 array!10112 (_ BitVec 64) BitStream!8020) Unit!14058)

(assert (=> d!67587 (= lt!309898 (choose!9 (_2!9202 lt!309529) (buf!4948 (_2!9202 lt!309509)) lt!309524 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529)))))))

(assert (=> d!67587 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9202 lt!309529) (buf!4948 (_2!9202 lt!309509)) lt!309524) lt!309898)))

(declare-fun bs!16722 () Bool)

(assert (= bs!16722 d!67587))

(assert (=> bs!16722 m!307527))

(declare-fun m!307885 () Bool)

(assert (=> bs!16722 m!307885))

(assert (=> b!198571 d!67587))

(declare-fun d!67589 () Bool)

(declare-fun e!136452 () Bool)

(assert (=> d!67589 e!136452))

(declare-fun res!166419 () Bool)

(assert (=> d!67589 (=> (not res!166419) (not e!136452))))

(declare-fun lt!309913 () (_ BitVec 64))

(declare-fun lt!309912 () (_ BitVec 64))

(declare-fun lt!309916 () (_ BitVec 64))

(assert (=> d!67589 (= res!166419 (= lt!309916 (bvsub lt!309912 lt!309913)))))

(assert (=> d!67589 (or (= (bvand lt!309912 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309913 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!309912 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309912 lt!309913) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!67589 (= lt!309913 (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!309508)))) ((_ sign_extend 32) (currentByte!9295 (_1!9205 lt!309508))) ((_ sign_extend 32) (currentBit!9290 (_1!9205 lt!309508)))))))

(declare-fun lt!309915 () (_ BitVec 64))

(declare-fun lt!309911 () (_ BitVec 64))

(assert (=> d!67589 (= lt!309912 (bvmul lt!309915 lt!309911))))

(assert (=> d!67589 (or (= lt!309915 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!309911 (bvsdiv (bvmul lt!309915 lt!309911) lt!309915)))))

(assert (=> d!67589 (= lt!309911 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67589 (= lt!309915 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!309508)))))))

(assert (=> d!67589 (= lt!309916 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 (_1!9205 lt!309508))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 (_1!9205 lt!309508)))))))

(assert (=> d!67589 (invariant!0 (currentBit!9290 (_1!9205 lt!309508)) (currentByte!9295 (_1!9205 lt!309508)) (size!4456 (buf!4948 (_1!9205 lt!309508))))))

(assert (=> d!67589 (= (bitIndex!0 (size!4456 (buf!4948 (_1!9205 lt!309508))) (currentByte!9295 (_1!9205 lt!309508)) (currentBit!9290 (_1!9205 lt!309508))) lt!309916)))

(declare-fun b!198791 () Bool)

(declare-fun res!166418 () Bool)

(assert (=> b!198791 (=> (not res!166418) (not e!136452))))

(assert (=> b!198791 (= res!166418 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!309916))))

(declare-fun b!198792 () Bool)

(declare-fun lt!309914 () (_ BitVec 64))

(assert (=> b!198792 (= e!136452 (bvsle lt!309916 (bvmul lt!309914 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198792 (or (= lt!309914 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!309914 #b0000000000000000000000000000000000000000000000000000000000001000) lt!309914)))))

(assert (=> b!198792 (= lt!309914 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!309508)))))))

(assert (= (and d!67589 res!166419) b!198791))

(assert (= (and b!198791 res!166418) b!198792))

(declare-fun m!307887 () Bool)

(assert (=> d!67589 m!307887))

(declare-fun m!307889 () Bool)

(assert (=> d!67589 m!307889))

(assert (=> b!198571 d!67589))

(declare-fun d!67591 () Bool)

(assert (=> d!67591 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!198571 d!67591))

(declare-fun d!67593 () Bool)

(declare-fun e!136455 () Bool)

(assert (=> d!67593 e!136455))

(declare-fun res!166422 () Bool)

(assert (=> d!67593 (=> (not res!166422) (not e!136455))))

(declare-fun lt!309926 () tuple2!17114)

(declare-fun lt!309928 () tuple2!17114)

(assert (=> d!67593 (= res!166422 (= (bitIndex!0 (size!4456 (buf!4948 (_1!9205 lt!309926))) (currentByte!9295 (_1!9205 lt!309926)) (currentBit!9290 (_1!9205 lt!309926))) (bitIndex!0 (size!4456 (buf!4948 (_1!9205 lt!309928))) (currentByte!9295 (_1!9205 lt!309928)) (currentBit!9290 (_1!9205 lt!309928)))))))

(declare-fun lt!309927 () BitStream!8020)

(declare-fun lt!309925 () Unit!14058)

(declare-fun choose!50 (BitStream!8020 BitStream!8020 BitStream!8020 tuple2!17114 tuple2!17114 BitStream!8020 Bool tuple2!17114 tuple2!17114 BitStream!8020 Bool) Unit!14058)

(assert (=> d!67593 (= lt!309925 (choose!50 lt!309515 (_2!9202 lt!309509) lt!309927 lt!309926 (tuple2!17115 (_1!9205 lt!309926) (_2!9205 lt!309926)) (_1!9205 lt!309926) (_2!9205 lt!309926) lt!309928 (tuple2!17115 (_1!9205 lt!309928) (_2!9205 lt!309928)) (_1!9205 lt!309928) (_2!9205 lt!309928)))))

(assert (=> d!67593 (= lt!309928 (readBitPure!0 lt!309927))))

(assert (=> d!67593 (= lt!309926 (readBitPure!0 lt!309515))))

(assert (=> d!67593 (= lt!309927 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 lt!309515) (currentBit!9290 lt!309515)))))

(assert (=> d!67593 (invariant!0 (currentBit!9290 lt!309515) (currentByte!9295 lt!309515) (size!4456 (buf!4948 (_2!9202 lt!309509))))))

(assert (=> d!67593 (= (readBitPrefixLemma!0 lt!309515 (_2!9202 lt!309509)) lt!309925)))

(declare-fun b!198795 () Bool)

(assert (=> b!198795 (= e!136455 (= (_2!9205 lt!309926) (_2!9205 lt!309928)))))

(assert (= (and d!67593 res!166422) b!198795))

(declare-fun m!307893 () Bool)

(assert (=> d!67593 m!307893))

(declare-fun m!307895 () Bool)

(assert (=> d!67593 m!307895))

(declare-fun m!307897 () Bool)

(assert (=> d!67593 m!307897))

(assert (=> d!67593 m!307535))

(declare-fun m!307899 () Bool)

(assert (=> d!67593 m!307899))

(declare-fun m!307901 () Bool)

(assert (=> d!67593 m!307901))

(assert (=> b!198571 d!67593))

(declare-fun d!67599 () Bool)

(assert (=> d!67599 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!309509)))) ((_ sign_extend 32) (currentByte!9295 thiss!1204)) ((_ sign_extend 32) (currentBit!9290 thiss!1204)) lt!309513) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!309509)))) ((_ sign_extend 32) (currentByte!9295 thiss!1204)) ((_ sign_extend 32) (currentBit!9290 thiss!1204))) lt!309513))))

(declare-fun bs!16724 () Bool)

(assert (= bs!16724 d!67599))

(declare-fun m!307903 () Bool)

(assert (=> bs!16724 m!307903))

(assert (=> b!198571 d!67599))

(declare-fun b!198821 () Bool)

(declare-fun res!166445 () Bool)

(declare-fun e!136473 () Bool)

(assert (=> b!198821 (=> (not res!166445) (not e!136473))))

(declare-fun lt!309982 () tuple2!17110)

(assert (=> b!198821 (= res!166445 (isPrefixOf!0 (_1!9203 lt!309982) thiss!1204))))

(declare-fun d!67601 () Bool)

(assert (=> d!67601 e!136473))

(declare-fun res!166446 () Bool)

(assert (=> d!67601 (=> (not res!166446) (not e!136473))))

(assert (=> d!67601 (= res!166446 (isPrefixOf!0 (_1!9203 lt!309982) (_2!9203 lt!309982)))))

(declare-fun lt!309991 () BitStream!8020)

(assert (=> d!67601 (= lt!309982 (tuple2!17111 lt!309991 (_2!9202 lt!309509)))))

(declare-fun lt!309980 () Unit!14058)

(declare-fun lt!309988 () Unit!14058)

(assert (=> d!67601 (= lt!309980 lt!309988)))

(assert (=> d!67601 (isPrefixOf!0 lt!309991 (_2!9202 lt!309509))))

(assert (=> d!67601 (= lt!309988 (lemmaIsPrefixTransitive!0 lt!309991 (_2!9202 lt!309509) (_2!9202 lt!309509)))))

(declare-fun lt!309979 () Unit!14058)

(declare-fun lt!309992 () Unit!14058)

(assert (=> d!67601 (= lt!309979 lt!309992)))

(assert (=> d!67601 (isPrefixOf!0 lt!309991 (_2!9202 lt!309509))))

(assert (=> d!67601 (= lt!309992 (lemmaIsPrefixTransitive!0 lt!309991 thiss!1204 (_2!9202 lt!309509)))))

(declare-fun lt!309985 () Unit!14058)

(declare-fun e!136472 () Unit!14058)

(assert (=> d!67601 (= lt!309985 e!136472)))

(declare-fun c!9896 () Bool)

(assert (=> d!67601 (= c!9896 (not (= (size!4456 (buf!4948 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!309997 () Unit!14058)

(declare-fun lt!309995 () Unit!14058)

(assert (=> d!67601 (= lt!309997 lt!309995)))

(assert (=> d!67601 (isPrefixOf!0 (_2!9202 lt!309509) (_2!9202 lt!309509))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8020) Unit!14058)

(assert (=> d!67601 (= lt!309995 (lemmaIsPrefixRefl!0 (_2!9202 lt!309509)))))

(declare-fun lt!309993 () Unit!14058)

(declare-fun lt!309983 () Unit!14058)

(assert (=> d!67601 (= lt!309993 lt!309983)))

(assert (=> d!67601 (= lt!309983 (lemmaIsPrefixRefl!0 (_2!9202 lt!309509)))))

(declare-fun lt!309994 () Unit!14058)

(declare-fun lt!309986 () Unit!14058)

(assert (=> d!67601 (= lt!309994 lt!309986)))

(assert (=> d!67601 (isPrefixOf!0 lt!309991 lt!309991)))

(assert (=> d!67601 (= lt!309986 (lemmaIsPrefixRefl!0 lt!309991))))

(declare-fun lt!309987 () Unit!14058)

(declare-fun lt!309984 () Unit!14058)

(assert (=> d!67601 (= lt!309987 lt!309984)))

(assert (=> d!67601 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!67601 (= lt!309984 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!67601 (= lt!309991 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)))))

(assert (=> d!67601 (isPrefixOf!0 thiss!1204 (_2!9202 lt!309509))))

(assert (=> d!67601 (= (reader!0 thiss!1204 (_2!9202 lt!309509)) lt!309982)))

(declare-fun b!198822 () Bool)

(declare-fun Unit!14077 () Unit!14058)

(assert (=> b!198822 (= e!136472 Unit!14077)))

(declare-fun b!198823 () Bool)

(declare-fun lt!309989 () (_ BitVec 64))

(declare-fun lt!309990 () (_ BitVec 64))

(assert (=> b!198823 (= e!136473 (= (_1!9203 lt!309982) (withMovedBitIndex!0 (_2!9203 lt!309982) (bvsub lt!309990 lt!309989))))))

(assert (=> b!198823 (or (= (bvand lt!309990 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309989 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!309990 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309990 lt!309989) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198823 (= lt!309989 (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309509))) (currentByte!9295 (_2!9202 lt!309509)) (currentBit!9290 (_2!9202 lt!309509))))))

(assert (=> b!198823 (= lt!309990 (bitIndex!0 (size!4456 (buf!4948 thiss!1204)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)))))

(declare-fun b!198824 () Bool)

(declare-fun res!166447 () Bool)

(assert (=> b!198824 (=> (not res!166447) (not e!136473))))

(assert (=> b!198824 (= res!166447 (isPrefixOf!0 (_2!9203 lt!309982) (_2!9202 lt!309509)))))

(declare-fun b!198825 () Bool)

(declare-fun lt!309978 () Unit!14058)

(assert (=> b!198825 (= e!136472 lt!309978)))

(declare-fun lt!309996 () (_ BitVec 64))

(assert (=> b!198825 (= lt!309996 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!309981 () (_ BitVec 64))

(assert (=> b!198825 (= lt!309981 (bitIndex!0 (size!4456 (buf!4948 thiss!1204)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10112 array!10112 (_ BitVec 64) (_ BitVec 64)) Unit!14058)

(assert (=> b!198825 (= lt!309978 (arrayBitRangesEqSymmetric!0 (buf!4948 thiss!1204) (buf!4948 (_2!9202 lt!309509)) lt!309996 lt!309981))))

(declare-fun arrayBitRangesEq!0 (array!10112 array!10112 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!198825 (arrayBitRangesEq!0 (buf!4948 (_2!9202 lt!309509)) (buf!4948 thiss!1204) lt!309996 lt!309981)))

(assert (= (and d!67601 c!9896) b!198825))

(assert (= (and d!67601 (not c!9896)) b!198822))

(assert (= (and d!67601 res!166446) b!198821))

(assert (= (and b!198821 res!166445) b!198824))

(assert (= (and b!198824 res!166447) b!198823))

(declare-fun m!307919 () Bool)

(assert (=> b!198821 m!307919))

(declare-fun m!307921 () Bool)

(assert (=> d!67601 m!307921))

(declare-fun m!307923 () Bool)

(assert (=> d!67601 m!307923))

(declare-fun m!307925 () Bool)

(assert (=> d!67601 m!307925))

(assert (=> d!67601 m!307497))

(declare-fun m!307927 () Bool)

(assert (=> d!67601 m!307927))

(declare-fun m!307929 () Bool)

(assert (=> d!67601 m!307929))

(declare-fun m!307931 () Bool)

(assert (=> d!67601 m!307931))

(declare-fun m!307933 () Bool)

(assert (=> d!67601 m!307933))

(declare-fun m!307935 () Bool)

(assert (=> d!67601 m!307935))

(declare-fun m!307937 () Bool)

(assert (=> d!67601 m!307937))

(declare-fun m!307939 () Bool)

(assert (=> d!67601 m!307939))

(declare-fun m!307941 () Bool)

(assert (=> b!198824 m!307941))

(declare-fun m!307943 () Bool)

(assert (=> b!198823 m!307943))

(assert (=> b!198823 m!307495))

(assert (=> b!198823 m!307541))

(assert (=> b!198825 m!307541))

(declare-fun m!307945 () Bool)

(assert (=> b!198825 m!307945))

(declare-fun m!307947 () Bool)

(assert (=> b!198825 m!307947))

(assert (=> b!198571 d!67601))

(declare-fun d!67613 () Bool)

(declare-datatypes ((tuple2!17138 0))(
  ( (tuple2!17139 (_1!9217 (_ BitVec 64)) (_2!9217 BitStream!8020)) )
))
(declare-fun lt!310024 () tuple2!17138)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8020 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17138)

(assert (=> d!67613 (= lt!310024 (readNBitsLSBFirstsLoop!0 (_1!9203 lt!309512) nBits!348 i!590 lt!309511))))

(assert (=> d!67613 (= (readNBitsLSBFirstsLoopPure!0 (_1!9203 lt!309512) nBits!348 i!590 lt!309511) (tuple2!17113 (_2!9217 lt!310024) (_1!9217 lt!310024)))))

(declare-fun bs!16726 () Bool)

(assert (= bs!16726 d!67613))

(declare-fun m!307951 () Bool)

(assert (=> bs!16726 m!307951))

(assert (=> b!198571 d!67613))

(declare-fun d!67619 () Bool)

(assert (=> d!67619 (validate_offset_bits!1 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!309509)))) ((_ sign_extend 32) (currentByte!9295 thiss!1204)) ((_ sign_extend 32) (currentBit!9290 thiss!1204)) lt!309513)))

(declare-fun lt!310025 () Unit!14058)

(assert (=> d!67619 (= lt!310025 (choose!9 thiss!1204 (buf!4948 (_2!9202 lt!309509)) lt!309513 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204))))))

(assert (=> d!67619 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4948 (_2!9202 lt!309509)) lt!309513) lt!310025)))

(declare-fun bs!16727 () Bool)

(assert (= bs!16727 d!67619))

(assert (=> bs!16727 m!307515))

(declare-fun m!307953 () Bool)

(assert (=> bs!16727 m!307953))

(assert (=> b!198571 d!67619))

(declare-fun d!67621 () Bool)

(assert (=> d!67621 (= (invariant!0 (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204) (size!4456 (buf!4948 (_2!9202 lt!309529)))) (and (bvsge (currentBit!9290 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9290 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9295 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9295 thiss!1204) (size!4456 (buf!4948 (_2!9202 lt!309529)))) (and (= (currentBit!9290 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9295 thiss!1204) (size!4456 (buf!4948 (_2!9202 lt!309529))))))))))

(assert (=> b!198571 d!67621))

(declare-fun d!67623 () Bool)

(assert (=> d!67623 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!309509)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309529))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309529))) lt!309524) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!309509)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309529))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309529)))) lt!309524))))

(declare-fun bs!16728 () Bool)

(assert (= bs!16728 d!67623))

(declare-fun m!307955 () Bool)

(assert (=> bs!16728 m!307955))

(assert (=> b!198571 d!67623))

(declare-fun d!67625 () Bool)

(declare-fun lt!310026 () tuple2!17138)

(assert (=> d!67625 (= lt!310026 (readNBitsLSBFirstsLoop!0 (_1!9203 lt!309516) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!309531))))

(assert (=> d!67625 (= (readNBitsLSBFirstsLoopPure!0 (_1!9203 lt!309516) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!309531) (tuple2!17113 (_2!9217 lt!310026) (_1!9217 lt!310026)))))

(declare-fun bs!16729 () Bool)

(assert (= bs!16729 d!67625))

(declare-fun m!307957 () Bool)

(assert (=> bs!16729 m!307957))

(assert (=> b!198571 d!67625))

(declare-fun b!198834 () Bool)

(declare-fun res!166456 () Bool)

(declare-fun e!136479 () Bool)

(assert (=> b!198834 (=> (not res!166456) (not e!136479))))

(declare-fun lt!310031 () tuple2!17110)

(assert (=> b!198834 (= res!166456 (isPrefixOf!0 (_1!9203 lt!310031) (_2!9202 lt!309529)))))

(declare-fun d!67627 () Bool)

(assert (=> d!67627 e!136479))

(declare-fun res!166457 () Bool)

(assert (=> d!67627 (=> (not res!166457) (not e!136479))))

(assert (=> d!67627 (= res!166457 (isPrefixOf!0 (_1!9203 lt!310031) (_2!9203 lt!310031)))))

(declare-fun lt!310040 () BitStream!8020)

(assert (=> d!67627 (= lt!310031 (tuple2!17111 lt!310040 (_2!9202 lt!309509)))))

(declare-fun lt!310029 () Unit!14058)

(declare-fun lt!310037 () Unit!14058)

(assert (=> d!67627 (= lt!310029 lt!310037)))

(assert (=> d!67627 (isPrefixOf!0 lt!310040 (_2!9202 lt!309509))))

(assert (=> d!67627 (= lt!310037 (lemmaIsPrefixTransitive!0 lt!310040 (_2!9202 lt!309509) (_2!9202 lt!309509)))))

(declare-fun lt!310028 () Unit!14058)

(declare-fun lt!310041 () Unit!14058)

(assert (=> d!67627 (= lt!310028 lt!310041)))

(assert (=> d!67627 (isPrefixOf!0 lt!310040 (_2!9202 lt!309509))))

(assert (=> d!67627 (= lt!310041 (lemmaIsPrefixTransitive!0 lt!310040 (_2!9202 lt!309529) (_2!9202 lt!309509)))))

(declare-fun lt!310034 () Unit!14058)

(declare-fun e!136478 () Unit!14058)

(assert (=> d!67627 (= lt!310034 e!136478)))

(declare-fun c!9897 () Bool)

(assert (=> d!67627 (= c!9897 (not (= (size!4456 (buf!4948 (_2!9202 lt!309529))) #b00000000000000000000000000000000)))))

(declare-fun lt!310046 () Unit!14058)

(declare-fun lt!310044 () Unit!14058)

(assert (=> d!67627 (= lt!310046 lt!310044)))

(assert (=> d!67627 (isPrefixOf!0 (_2!9202 lt!309509) (_2!9202 lt!309509))))

(assert (=> d!67627 (= lt!310044 (lemmaIsPrefixRefl!0 (_2!9202 lt!309509)))))

(declare-fun lt!310042 () Unit!14058)

(declare-fun lt!310032 () Unit!14058)

(assert (=> d!67627 (= lt!310042 lt!310032)))

(assert (=> d!67627 (= lt!310032 (lemmaIsPrefixRefl!0 (_2!9202 lt!309509)))))

(declare-fun lt!310043 () Unit!14058)

(declare-fun lt!310035 () Unit!14058)

(assert (=> d!67627 (= lt!310043 lt!310035)))

(assert (=> d!67627 (isPrefixOf!0 lt!310040 lt!310040)))

(assert (=> d!67627 (= lt!310035 (lemmaIsPrefixRefl!0 lt!310040))))

(declare-fun lt!310036 () Unit!14058)

(declare-fun lt!310033 () Unit!14058)

(assert (=> d!67627 (= lt!310036 lt!310033)))

(assert (=> d!67627 (isPrefixOf!0 (_2!9202 lt!309529) (_2!9202 lt!309529))))

(assert (=> d!67627 (= lt!310033 (lemmaIsPrefixRefl!0 (_2!9202 lt!309529)))))

(assert (=> d!67627 (= lt!310040 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))))))

(assert (=> d!67627 (isPrefixOf!0 (_2!9202 lt!309529) (_2!9202 lt!309509))))

(assert (=> d!67627 (= (reader!0 (_2!9202 lt!309529) (_2!9202 lt!309509)) lt!310031)))

(declare-fun b!198835 () Bool)

(declare-fun Unit!14078 () Unit!14058)

(assert (=> b!198835 (= e!136478 Unit!14078)))

(declare-fun lt!310038 () (_ BitVec 64))

(declare-fun lt!310039 () (_ BitVec 64))

(declare-fun b!198836 () Bool)

(assert (=> b!198836 (= e!136479 (= (_1!9203 lt!310031) (withMovedBitIndex!0 (_2!9203 lt!310031) (bvsub lt!310039 lt!310038))))))

(assert (=> b!198836 (or (= (bvand lt!310039 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310038 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!310039 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!310039 lt!310038) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198836 (= lt!310038 (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309509))) (currentByte!9295 (_2!9202 lt!309509)) (currentBit!9290 (_2!9202 lt!309509))))))

(assert (=> b!198836 (= lt!310039 (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))))))

(declare-fun b!198837 () Bool)

(declare-fun res!166458 () Bool)

(assert (=> b!198837 (=> (not res!166458) (not e!136479))))

(assert (=> b!198837 (= res!166458 (isPrefixOf!0 (_2!9203 lt!310031) (_2!9202 lt!309509)))))

(declare-fun b!198838 () Bool)

(declare-fun lt!310027 () Unit!14058)

(assert (=> b!198838 (= e!136478 lt!310027)))

(declare-fun lt!310045 () (_ BitVec 64))

(assert (=> b!198838 (= lt!310045 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!310030 () (_ BitVec 64))

(assert (=> b!198838 (= lt!310030 (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))))))

(assert (=> b!198838 (= lt!310027 (arrayBitRangesEqSymmetric!0 (buf!4948 (_2!9202 lt!309529)) (buf!4948 (_2!9202 lt!309509)) lt!310045 lt!310030))))

(assert (=> b!198838 (arrayBitRangesEq!0 (buf!4948 (_2!9202 lt!309509)) (buf!4948 (_2!9202 lt!309529)) lt!310045 lt!310030)))

(assert (= (and d!67627 c!9897) b!198838))

(assert (= (and d!67627 (not c!9897)) b!198835))

(assert (= (and d!67627 res!166457) b!198834))

(assert (= (and b!198834 res!166456) b!198837))

(assert (= (and b!198837 res!166458) b!198836))

(declare-fun m!307959 () Bool)

(assert (=> b!198834 m!307959))

(declare-fun m!307961 () Bool)

(assert (=> d!67627 m!307961))

(declare-fun m!307963 () Bool)

(assert (=> d!67627 m!307963))

(declare-fun m!307965 () Bool)

(assert (=> d!67627 m!307965))

(assert (=> d!67627 m!307563))

(assert (=> d!67627 m!307927))

(declare-fun m!307967 () Bool)

(assert (=> d!67627 m!307967))

(declare-fun m!307969 () Bool)

(assert (=> d!67627 m!307969))

(declare-fun m!307971 () Bool)

(assert (=> d!67627 m!307971))

(declare-fun m!307973 () Bool)

(assert (=> d!67627 m!307973))

(declare-fun m!307975 () Bool)

(assert (=> d!67627 m!307975))

(assert (=> d!67627 m!307939))

(declare-fun m!307977 () Bool)

(assert (=> b!198837 m!307977))

(declare-fun m!307979 () Bool)

(assert (=> b!198836 m!307979))

(assert (=> b!198836 m!307495))

(assert (=> b!198836 m!307539))

(assert (=> b!198838 m!307539))

(declare-fun m!307981 () Bool)

(assert (=> b!198838 m!307981))

(declare-fun m!307983 () Bool)

(assert (=> b!198838 m!307983))

(assert (=> b!198571 d!67627))

(declare-fun d!67629 () Bool)

(declare-fun lt!310047 () tuple2!17136)

(assert (=> d!67629 (= lt!310047 (readBit!0 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204))))))

(assert (=> d!67629 (= (readBitPure!0 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204))) (tuple2!17115 (_2!9216 lt!310047) (_1!9216 lt!310047)))))

(declare-fun bs!16730 () Bool)

(assert (= bs!16730 d!67629))

(declare-fun m!307985 () Bool)

(assert (=> bs!16730 m!307985))

(assert (=> b!198571 d!67629))

(declare-fun d!67631 () Bool)

(declare-fun lt!310048 () tuple2!17136)

(assert (=> d!67631 (= lt!310048 (readBit!0 lt!309515))))

(assert (=> d!67631 (= (readBitPure!0 lt!309515) (tuple2!17115 (_2!9216 lt!310048) (_1!9216 lt!310048)))))

(declare-fun bs!16731 () Bool)

(assert (= bs!16731 d!67631))

(declare-fun m!307987 () Bool)

(assert (=> bs!16731 m!307987))

(assert (=> b!198571 d!67631))

(declare-fun d!67633 () Bool)

(declare-fun lt!310049 () tuple2!17136)

(assert (=> d!67633 (= lt!310049 (readBit!0 (_1!9203 lt!309512)))))

(assert (=> d!67633 (= (readBitPure!0 (_1!9203 lt!309512)) (tuple2!17115 (_2!9216 lt!310049) (_1!9216 lt!310049)))))

(declare-fun bs!16732 () Bool)

(assert (= bs!16732 d!67633))

(declare-fun m!307989 () Bool)

(assert (=> bs!16732 m!307989))

(assert (=> b!198571 d!67633))

(declare-fun d!67635 () Bool)

(declare-fun e!136480 () Bool)

(assert (=> d!67635 e!136480))

(declare-fun res!166460 () Bool)

(assert (=> d!67635 (=> (not res!166460) (not e!136480))))

(declare-fun lt!310051 () (_ BitVec 64))

(declare-fun lt!310052 () (_ BitVec 64))

(declare-fun lt!310055 () (_ BitVec 64))

(assert (=> d!67635 (= res!166460 (= lt!310055 (bvsub lt!310051 lt!310052)))))

(assert (=> d!67635 (or (= (bvand lt!310051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310052 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!310051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!310051 lt!310052) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67635 (= lt!310052 (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!309523)))) ((_ sign_extend 32) (currentByte!9295 (_1!9205 lt!309523))) ((_ sign_extend 32) (currentBit!9290 (_1!9205 lt!309523)))))))

(declare-fun lt!310054 () (_ BitVec 64))

(declare-fun lt!310050 () (_ BitVec 64))

(assert (=> d!67635 (= lt!310051 (bvmul lt!310054 lt!310050))))

(assert (=> d!67635 (or (= lt!310054 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!310050 (bvsdiv (bvmul lt!310054 lt!310050) lt!310054)))))

(assert (=> d!67635 (= lt!310050 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67635 (= lt!310054 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!309523)))))))

(assert (=> d!67635 (= lt!310055 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 (_1!9205 lt!309523))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 (_1!9205 lt!309523)))))))

(assert (=> d!67635 (invariant!0 (currentBit!9290 (_1!9205 lt!309523)) (currentByte!9295 (_1!9205 lt!309523)) (size!4456 (buf!4948 (_1!9205 lt!309523))))))

(assert (=> d!67635 (= (bitIndex!0 (size!4456 (buf!4948 (_1!9205 lt!309523))) (currentByte!9295 (_1!9205 lt!309523)) (currentBit!9290 (_1!9205 lt!309523))) lt!310055)))

(declare-fun b!198839 () Bool)

(declare-fun res!166459 () Bool)

(assert (=> b!198839 (=> (not res!166459) (not e!136480))))

(assert (=> b!198839 (= res!166459 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!310055))))

(declare-fun b!198840 () Bool)

(declare-fun lt!310053 () (_ BitVec 64))

(assert (=> b!198840 (= e!136480 (bvsle lt!310055 (bvmul lt!310053 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198840 (or (= lt!310053 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!310053 #b0000000000000000000000000000000000000000000000000000000000001000) lt!310053)))))

(assert (=> b!198840 (= lt!310053 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!309523)))))))

(assert (= (and d!67635 res!166460) b!198839))

(assert (= (and b!198839 res!166459) b!198840))

(declare-fun m!307991 () Bool)

(assert (=> d!67635 m!307991))

(declare-fun m!307993 () Bool)

(assert (=> d!67635 m!307993))

(assert (=> b!198571 d!67635))

(declare-fun d!67637 () Bool)

(declare-fun e!136481 () Bool)

(assert (=> d!67637 e!136481))

(declare-fun res!166462 () Bool)

(assert (=> d!67637 (=> (not res!166462) (not e!136481))))

(declare-fun lt!310057 () (_ BitVec 64))

(declare-fun lt!310058 () (_ BitVec 64))

(declare-fun lt!310061 () (_ BitVec 64))

(assert (=> d!67637 (= res!166462 (= lt!310061 (bvsub lt!310057 lt!310058)))))

(assert (=> d!67637 (or (= (bvand lt!310057 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310058 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!310057 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!310057 lt!310058) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67637 (= lt!310058 (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!309509)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309509))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309509)))))))

(declare-fun lt!310060 () (_ BitVec 64))

(declare-fun lt!310056 () (_ BitVec 64))

(assert (=> d!67637 (= lt!310057 (bvmul lt!310060 lt!310056))))

(assert (=> d!67637 (or (= lt!310060 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!310056 (bvsdiv (bvmul lt!310060 lt!310056) lt!310060)))))

(assert (=> d!67637 (= lt!310056 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67637 (= lt!310060 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!309509)))))))

(assert (=> d!67637 (= lt!310061 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309509))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309509)))))))

(assert (=> d!67637 (invariant!0 (currentBit!9290 (_2!9202 lt!309509)) (currentByte!9295 (_2!9202 lt!309509)) (size!4456 (buf!4948 (_2!9202 lt!309509))))))

(assert (=> d!67637 (= (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309509))) (currentByte!9295 (_2!9202 lt!309509)) (currentBit!9290 (_2!9202 lt!309509))) lt!310061)))

(declare-fun b!198841 () Bool)

(declare-fun res!166461 () Bool)

(assert (=> b!198841 (=> (not res!166461) (not e!136481))))

(assert (=> b!198841 (= res!166461 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!310061))))

(declare-fun b!198842 () Bool)

(declare-fun lt!310059 () (_ BitVec 64))

(assert (=> b!198842 (= e!136481 (bvsle lt!310061 (bvmul lt!310059 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198842 (or (= lt!310059 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!310059 #b0000000000000000000000000000000000000000000000000000000000001000) lt!310059)))))

(assert (=> b!198842 (= lt!310059 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!309509)))))))

(assert (= (and d!67637 res!166462) b!198841))

(assert (= (and b!198841 res!166461) b!198842))

(declare-fun m!307995 () Bool)

(assert (=> d!67637 m!307995))

(assert (=> d!67637 m!307503))

(assert (=> b!198572 d!67637))

(declare-fun d!67639 () Bool)

(declare-fun res!166469 () Bool)

(declare-fun e!136487 () Bool)

(assert (=> d!67639 (=> (not res!166469) (not e!136487))))

(assert (=> d!67639 (= res!166469 (= (size!4456 (buf!4948 thiss!1204)) (size!4456 (buf!4948 (_2!9202 lt!309509)))))))

(assert (=> d!67639 (= (isPrefixOf!0 thiss!1204 (_2!9202 lt!309509)) e!136487)))

(declare-fun b!198849 () Bool)

(declare-fun res!166471 () Bool)

(assert (=> b!198849 (=> (not res!166471) (not e!136487))))

(assert (=> b!198849 (= res!166471 (bvsle (bitIndex!0 (size!4456 (buf!4948 thiss!1204)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309509))) (currentByte!9295 (_2!9202 lt!309509)) (currentBit!9290 (_2!9202 lt!309509)))))))

(declare-fun b!198850 () Bool)

(declare-fun e!136486 () Bool)

(assert (=> b!198850 (= e!136487 e!136486)))

(declare-fun res!166470 () Bool)

(assert (=> b!198850 (=> res!166470 e!136486)))

(assert (=> b!198850 (= res!166470 (= (size!4456 (buf!4948 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!198851 () Bool)

(assert (=> b!198851 (= e!136486 (arrayBitRangesEq!0 (buf!4948 thiss!1204) (buf!4948 (_2!9202 lt!309509)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4456 (buf!4948 thiss!1204)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204))))))

(assert (= (and d!67639 res!166469) b!198849))

(assert (= (and b!198849 res!166471) b!198850))

(assert (= (and b!198850 (not res!166470)) b!198851))

(assert (=> b!198849 m!307541))

(assert (=> b!198849 m!307495))

(assert (=> b!198851 m!307541))

(assert (=> b!198851 m!307541))

(declare-fun m!307997 () Bool)

(assert (=> b!198851 m!307997))

(assert (=> b!198572 d!67639))

(declare-fun d!67641 () Bool)

(assert (=> d!67641 (isPrefixOf!0 thiss!1204 (_2!9202 lt!309509))))

(declare-fun lt!310064 () Unit!14058)

(declare-fun choose!30 (BitStream!8020 BitStream!8020 BitStream!8020) Unit!14058)

(assert (=> d!67641 (= lt!310064 (choose!30 thiss!1204 (_2!9202 lt!309529) (_2!9202 lt!309509)))))

(assert (=> d!67641 (isPrefixOf!0 thiss!1204 (_2!9202 lt!309529))))

(assert (=> d!67641 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9202 lt!309529) (_2!9202 lt!309509)) lt!310064)))

(declare-fun bs!16733 () Bool)

(assert (= bs!16733 d!67641))

(assert (=> bs!16733 m!307497))

(declare-fun m!307999 () Bool)

(assert (=> bs!16733 m!307999))

(assert (=> bs!16733 m!307505))

(assert (=> b!198572 d!67641))

(declare-fun b!198987 () Bool)

(declare-fun res!166578 () Bool)

(declare-fun e!136563 () Bool)

(assert (=> b!198987 (=> (not res!166578) (not e!136563))))

(declare-fun lt!310530 () tuple2!17108)

(assert (=> b!198987 (= res!166578 (= (size!4456 (buf!4948 (_2!9202 lt!309529))) (size!4456 (buf!4948 (_2!9202 lt!310530)))))))

(declare-fun d!67643 () Bool)

(assert (=> d!67643 e!136563))

(declare-fun res!166588 () Bool)

(assert (=> d!67643 (=> (not res!166588) (not e!136563))))

(assert (=> d!67643 (= res!166588 (invariant!0 (currentBit!9290 (_2!9202 lt!310530)) (currentByte!9295 (_2!9202 lt!310530)) (size!4456 (buf!4948 (_2!9202 lt!310530)))))))

(declare-fun e!136562 () tuple2!17108)

(assert (=> d!67643 (= lt!310530 e!136562)))

(declare-fun c!9913 () Bool)

(assert (=> d!67643 (= c!9913 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!67643 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!67643 (= (appendBitsLSBFirstLoopTR!0 (_2!9202 lt!309529) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!310530)))

(declare-fun b!198988 () Bool)

(declare-fun e!136569 () (_ BitVec 64))

(assert (=> b!198988 (= e!136569 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!198989 () Bool)

(declare-fun e!136567 () Bool)

(declare-fun lt!310543 () tuple2!17112)

(declare-fun lt!310497 () tuple2!17110)

(assert (=> b!198989 (= e!136567 (= (_1!9204 lt!310543) (_2!9203 lt!310497)))))

(declare-fun lt!310505 () tuple2!17108)

(declare-fun call!3140 () Bool)

(declare-fun bm!3137 () Bool)

(assert (=> bm!3137 (= call!3140 (isPrefixOf!0 (_2!9202 lt!309529) (ite c!9913 (_2!9202 lt!309529) (_2!9202 lt!310505))))))

(declare-fun b!198990 () Bool)

(declare-fun e!136566 () Bool)

(declare-fun lt!310539 () tuple2!17114)

(declare-fun lt!310504 () tuple2!17114)

(assert (=> b!198990 (= e!136566 (= (_2!9205 lt!310539) (_2!9205 lt!310504)))))

(declare-fun b!198991 () Bool)

(declare-fun res!166581 () Bool)

(assert (=> b!198991 (= res!166581 call!3140)))

(declare-fun e!136565 () Bool)

(assert (=> b!198991 (=> (not res!166581) (not e!136565))))

(declare-fun b!198992 () Bool)

(declare-fun Unit!14079 () Unit!14058)

(assert (=> b!198992 (= e!136562 (tuple2!17109 Unit!14079 (_2!9202 lt!309529)))))

(declare-fun lt!310536 () Unit!14058)

(assert (=> b!198992 (= lt!310536 (lemmaIsPrefixRefl!0 (_2!9202 lt!309529)))))

(assert (=> b!198992 call!3140))

(declare-fun lt!310493 () Unit!14058)

(assert (=> b!198992 (= lt!310493 lt!310536)))

(declare-fun b!198993 () Bool)

(assert (=> b!198993 (= e!136569 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!198994 () Bool)

(declare-fun e!136561 () Bool)

(declare-fun lt!310502 () tuple2!17112)

(declare-fun lt!310498 () tuple2!17110)

(assert (=> b!198994 (= e!136561 (= (_1!9204 lt!310502) (_2!9203 lt!310498)))))

(declare-fun b!198995 () Bool)

(declare-fun e!136564 () Bool)

(declare-fun lt!310511 () tuple2!17114)

(assert (=> b!198995 (= e!136564 (= (bitIndex!0 (size!4456 (buf!4948 (_1!9205 lt!310511))) (currentByte!9295 (_1!9205 lt!310511)) (currentBit!9290 (_1!9205 lt!310511))) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310505))) (currentByte!9295 (_2!9202 lt!310505)) (currentBit!9290 (_2!9202 lt!310505)))))))

(declare-fun b!198996 () Bool)

(declare-fun res!166580 () Bool)

(assert (=> b!198996 (= res!166580 (= (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310505))) (currentByte!9295 (_2!9202 lt!310505)) (currentBit!9290 (_2!9202 lt!310505))) (bvadd (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!198996 (=> (not res!166580) (not e!136565))))

(declare-fun b!198997 () Bool)

(assert (=> b!198997 (= e!136563 e!136561)))

(declare-fun res!166586 () Bool)

(assert (=> b!198997 (=> (not res!166586) (not e!136561))))

(assert (=> b!198997 (= res!166586 (= (_2!9204 lt!310502) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!198997 (= lt!310502 (readNBitsLSBFirstsLoopPure!0 (_1!9203 lt!310498) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!310541 () Unit!14058)

(declare-fun lt!310519 () Unit!14058)

(assert (=> b!198997 (= lt!310541 lt!310519)))

(declare-fun lt!310510 () (_ BitVec 64))

(assert (=> b!198997 (validate_offset_bits!1 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310530)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309529))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309529))) lt!310510)))

(assert (=> b!198997 (= lt!310519 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9202 lt!309529) (buf!4948 (_2!9202 lt!310530)) lt!310510))))

(declare-fun e!136568 () Bool)

(assert (=> b!198997 e!136568))

(declare-fun res!166584 () Bool)

(assert (=> b!198997 (=> (not res!166584) (not e!136568))))

(assert (=> b!198997 (= res!166584 (and (= (size!4456 (buf!4948 (_2!9202 lt!309529))) (size!4456 (buf!4948 (_2!9202 lt!310530)))) (bvsge lt!310510 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198997 (= lt!310510 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!198997 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!198997 (= lt!310498 (reader!0 (_2!9202 lt!309529) (_2!9202 lt!310530)))))

(declare-fun b!198998 () Bool)

(declare-fun lt!310546 () tuple2!17108)

(assert (=> b!198998 (= e!136562 (tuple2!17109 (_1!9202 lt!310546) (_2!9202 lt!310546)))))

(declare-fun lt!310537 () Bool)

(assert (=> b!198998 (= lt!310537 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198998 (= lt!310505 (appendBit!0 (_2!9202 lt!309529) lt!310537))))

(declare-fun res!166589 () Bool)

(assert (=> b!198998 (= res!166589 (= (size!4456 (buf!4948 (_2!9202 lt!309529))) (size!4456 (buf!4948 (_2!9202 lt!310505)))))))

(assert (=> b!198998 (=> (not res!166589) (not e!136565))))

(assert (=> b!198998 e!136565))

(declare-fun lt!310533 () tuple2!17108)

(assert (=> b!198998 (= lt!310533 lt!310505)))

(assert (=> b!198998 (= lt!310546 (appendBitsLSBFirstLoopTR!0 (_2!9202 lt!310533) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!310532 () Unit!14058)

(assert (=> b!198998 (= lt!310532 (lemmaIsPrefixTransitive!0 (_2!9202 lt!309529) (_2!9202 lt!310533) (_2!9202 lt!310546)))))

(assert (=> b!198998 (isPrefixOf!0 (_2!9202 lt!309529) (_2!9202 lt!310546))))

(declare-fun lt!310516 () Unit!14058)

(assert (=> b!198998 (= lt!310516 lt!310532)))

(assert (=> b!198998 (invariant!0 (currentBit!9290 (_2!9202 lt!309529)) (currentByte!9295 (_2!9202 lt!309529)) (size!4456 (buf!4948 (_2!9202 lt!310533))))))

(declare-fun lt!310499 () BitStream!8020)

(assert (=> b!198998 (= lt!310499 (BitStream!8021 (buf!4948 (_2!9202 lt!310533)) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))))))

(assert (=> b!198998 (invariant!0 (currentBit!9290 lt!310499) (currentByte!9295 lt!310499) (size!4456 (buf!4948 (_2!9202 lt!310546))))))

(declare-fun lt!310496 () BitStream!8020)

(assert (=> b!198998 (= lt!310496 (BitStream!8021 (buf!4948 (_2!9202 lt!310546)) (currentByte!9295 lt!310499) (currentBit!9290 lt!310499)))))

(assert (=> b!198998 (= lt!310539 (readBitPure!0 lt!310499))))

(assert (=> b!198998 (= lt!310504 (readBitPure!0 lt!310496))))

(declare-fun lt!310514 () Unit!14058)

(assert (=> b!198998 (= lt!310514 (readBitPrefixLemma!0 lt!310499 (_2!9202 lt!310546)))))

(declare-fun res!166579 () Bool)

(assert (=> b!198998 (= res!166579 (= (bitIndex!0 (size!4456 (buf!4948 (_1!9205 lt!310539))) (currentByte!9295 (_1!9205 lt!310539)) (currentBit!9290 (_1!9205 lt!310539))) (bitIndex!0 (size!4456 (buf!4948 (_1!9205 lt!310504))) (currentByte!9295 (_1!9205 lt!310504)) (currentBit!9290 (_1!9205 lt!310504)))))))

(assert (=> b!198998 (=> (not res!166579) (not e!136566))))

(assert (=> b!198998 e!136566))

(declare-fun lt!310500 () Unit!14058)

(assert (=> b!198998 (= lt!310500 lt!310514)))

(declare-fun lt!310518 () tuple2!17110)

(assert (=> b!198998 (= lt!310518 (reader!0 (_2!9202 lt!309529) (_2!9202 lt!310546)))))

(declare-fun lt!310503 () tuple2!17110)

(assert (=> b!198998 (= lt!310503 (reader!0 (_2!9202 lt!310533) (_2!9202 lt!310546)))))

(declare-fun lt!310528 () tuple2!17114)

(assert (=> b!198998 (= lt!310528 (readBitPure!0 (_1!9203 lt!310518)))))

(assert (=> b!198998 (= (_2!9205 lt!310528) lt!310537)))

(declare-fun lt!310535 () Unit!14058)

(declare-fun Unit!14080 () Unit!14058)

(assert (=> b!198998 (= lt!310535 Unit!14080)))

(declare-fun lt!310529 () (_ BitVec 64))

(assert (=> b!198998 (= lt!310529 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!310522 () (_ BitVec 64))

(assert (=> b!198998 (= lt!310522 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!310507 () Unit!14058)

(assert (=> b!198998 (= lt!310507 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9202 lt!309529) (buf!4948 (_2!9202 lt!310546)) lt!310522))))

(assert (=> b!198998 (validate_offset_bits!1 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310546)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309529))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309529))) lt!310522)))

(declare-fun lt!310523 () Unit!14058)

(assert (=> b!198998 (= lt!310523 lt!310507)))

(declare-fun lt!310508 () tuple2!17112)

(assert (=> b!198998 (= lt!310508 (readNBitsLSBFirstsLoopPure!0 (_1!9203 lt!310518) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!310529))))

(declare-fun lt!310542 () (_ BitVec 64))

(assert (=> b!198998 (= lt!310542 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!310548 () Unit!14058)

(assert (=> b!198998 (= lt!310548 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9202 lt!310533) (buf!4948 (_2!9202 lt!310546)) lt!310542))))

(assert (=> b!198998 (validate_offset_bits!1 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310546)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!310533))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!310533))) lt!310542)))

(declare-fun lt!310540 () Unit!14058)

(assert (=> b!198998 (= lt!310540 lt!310548)))

(declare-fun lt!310547 () tuple2!17112)

(assert (=> b!198998 (= lt!310547 (readNBitsLSBFirstsLoopPure!0 (_1!9203 lt!310503) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!310529 (ite (_2!9205 lt!310528) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!310517 () tuple2!17112)

(assert (=> b!198998 (= lt!310517 (readNBitsLSBFirstsLoopPure!0 (_1!9203 lt!310518) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!310529))))

(declare-fun c!9912 () Bool)

(assert (=> b!198998 (= c!9912 (_2!9205 (readBitPure!0 (_1!9203 lt!310518))))))

(declare-fun lt!310521 () tuple2!17112)

(assert (=> b!198998 (= lt!310521 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9203 lt!310518) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!310529 e!136569)))))

(declare-fun lt!310520 () Unit!14058)

(assert (=> b!198998 (= lt!310520 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9203 lt!310518) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!310529))))

(assert (=> b!198998 (and (= (_2!9204 lt!310517) (_2!9204 lt!310521)) (= (_1!9204 lt!310517) (_1!9204 lt!310521)))))

(declare-fun lt!310509 () Unit!14058)

(assert (=> b!198998 (= lt!310509 lt!310520)))

(assert (=> b!198998 (= (_1!9203 lt!310518) (withMovedBitIndex!0 (_2!9203 lt!310518) (bvsub (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310546))) (currentByte!9295 (_2!9202 lt!310546)) (currentBit!9290 (_2!9202 lt!310546))))))))

(declare-fun lt!310526 () Unit!14058)

(declare-fun Unit!14081 () Unit!14058)

(assert (=> b!198998 (= lt!310526 Unit!14081)))

(assert (=> b!198998 (= (_1!9203 lt!310503) (withMovedBitIndex!0 (_2!9203 lt!310503) (bvsub (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310533))) (currentByte!9295 (_2!9202 lt!310533)) (currentBit!9290 (_2!9202 lt!310533))) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310546))) (currentByte!9295 (_2!9202 lt!310546)) (currentBit!9290 (_2!9202 lt!310546))))))))

(declare-fun lt!310538 () Unit!14058)

(declare-fun Unit!14082 () Unit!14058)

(assert (=> b!198998 (= lt!310538 Unit!14082)))

(assert (=> b!198998 (= (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))) (bvsub (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310533))) (currentByte!9295 (_2!9202 lt!310533)) (currentBit!9290 (_2!9202 lt!310533))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!310501 () Unit!14058)

(declare-fun Unit!14083 () Unit!14058)

(assert (=> b!198998 (= lt!310501 Unit!14083)))

(assert (=> b!198998 (= (_2!9204 lt!310508) (_2!9204 lt!310547))))

(declare-fun lt!310525 () Unit!14058)

(declare-fun Unit!14084 () Unit!14058)

(assert (=> b!198998 (= lt!310525 Unit!14084)))

(assert (=> b!198998 (invariant!0 (currentBit!9290 (_2!9202 lt!310546)) (currentByte!9295 (_2!9202 lt!310546)) (size!4456 (buf!4948 (_2!9202 lt!310546))))))

(declare-fun lt!310527 () Unit!14058)

(declare-fun Unit!14085 () Unit!14058)

(assert (=> b!198998 (= lt!310527 Unit!14085)))

(assert (=> b!198998 (= (size!4456 (buf!4948 (_2!9202 lt!309529))) (size!4456 (buf!4948 (_2!9202 lt!310546))))))

(declare-fun lt!310524 () Unit!14058)

(declare-fun Unit!14086 () Unit!14058)

(assert (=> b!198998 (= lt!310524 Unit!14086)))

(assert (=> b!198998 (= (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310546))) (currentByte!9295 (_2!9202 lt!310546)) (currentBit!9290 (_2!9202 lt!310546))) (bvsub (bvadd (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!310513 () Unit!14058)

(declare-fun Unit!14087 () Unit!14058)

(assert (=> b!198998 (= lt!310513 Unit!14087)))

(declare-fun lt!310544 () Unit!14058)

(declare-fun Unit!14088 () Unit!14058)

(assert (=> b!198998 (= lt!310544 Unit!14088)))

(assert (=> b!198998 (= lt!310497 (reader!0 (_2!9202 lt!309529) (_2!9202 lt!310546)))))

(declare-fun lt!310506 () (_ BitVec 64))

(assert (=> b!198998 (= lt!310506 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!310545 () Unit!14058)

(assert (=> b!198998 (= lt!310545 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9202 lt!309529) (buf!4948 (_2!9202 lt!310546)) lt!310506))))

(assert (=> b!198998 (validate_offset_bits!1 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310546)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309529))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309529))) lt!310506)))

(declare-fun lt!310495 () Unit!14058)

(assert (=> b!198998 (= lt!310495 lt!310545)))

(assert (=> b!198998 (= lt!310543 (readNBitsLSBFirstsLoopPure!0 (_1!9203 lt!310497) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!166587 () Bool)

(assert (=> b!198998 (= res!166587 (= (_2!9204 lt!310543) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!198998 (=> (not res!166587) (not e!136567))))

(assert (=> b!198998 e!136567))

(declare-fun lt!310512 () Unit!14058)

(declare-fun Unit!14089 () Unit!14058)

(assert (=> b!198998 (= lt!310512 Unit!14089)))

(declare-fun b!198999 () Bool)

(assert (=> b!198999 (= e!136568 (validate_offset_bits!1 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!309529)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309529))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309529))) lt!310510))))

(declare-fun b!199000 () Bool)

(declare-fun res!166585 () Bool)

(assert (=> b!199000 (=> (not res!166585) (not e!136563))))

(assert (=> b!199000 (= res!166585 (isPrefixOf!0 (_2!9202 lt!309529) (_2!9202 lt!310530)))))

(declare-fun b!199001 () Bool)

(assert (=> b!199001 (= lt!310511 (readBitPure!0 (readerFrom!0 (_2!9202 lt!310505) (currentBit!9290 (_2!9202 lt!309529)) (currentByte!9295 (_2!9202 lt!309529)))))))

(declare-fun res!166583 () Bool)

(assert (=> b!199001 (= res!166583 (and (= (_2!9205 lt!310511) lt!310537) (= (_1!9205 lt!310511) (_2!9202 lt!310505))))))

(assert (=> b!199001 (=> (not res!166583) (not e!136564))))

(assert (=> b!199001 (= e!136565 e!136564)))

(declare-fun b!199002 () Bool)

(declare-fun res!166582 () Bool)

(assert (=> b!199002 (=> (not res!166582) (not e!136563))))

(declare-fun lt!310494 () (_ BitVec 64))

(declare-fun lt!310531 () (_ BitVec 64))

(assert (=> b!199002 (= res!166582 (= (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310530))) (currentByte!9295 (_2!9202 lt!310530)) (currentBit!9290 (_2!9202 lt!310530))) (bvsub lt!310494 lt!310531)))))

(assert (=> b!199002 (or (= (bvand lt!310494 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310531 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!310494 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!310494 lt!310531) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199002 (= lt!310531 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!310515 () (_ BitVec 64))

(declare-fun lt!310534 () (_ BitVec 64))

(assert (=> b!199002 (= lt!310494 (bvadd lt!310515 lt!310534))))

(assert (=> b!199002 (or (not (= (bvand lt!310515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310534 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!310515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!310515 lt!310534) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199002 (= lt!310534 ((_ sign_extend 32) nBits!348))))

(assert (=> b!199002 (= lt!310515 (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))))))

(assert (= (and d!67643 c!9913) b!198992))

(assert (= (and d!67643 (not c!9913)) b!198998))

(assert (= (and b!198998 res!166589) b!198996))

(assert (= (and b!198996 res!166580) b!198991))

(assert (= (and b!198991 res!166581) b!199001))

(assert (= (and b!199001 res!166583) b!198995))

(assert (= (and b!198998 res!166579) b!198990))

(assert (= (and b!198998 c!9912) b!198993))

(assert (= (and b!198998 (not c!9912)) b!198988))

(assert (= (and b!198998 res!166587) b!198989))

(assert (= (or b!198992 b!198991) bm!3137))

(assert (= (and d!67643 res!166588) b!198987))

(assert (= (and b!198987 res!166578) b!199002))

(assert (= (and b!199002 res!166582) b!199000))

(assert (= (and b!199000 res!166585) b!198997))

(assert (= (and b!198997 res!166584) b!198999))

(assert (= (and b!198997 res!166586) b!198994))

(declare-fun m!308217 () Bool)

(assert (=> b!198996 m!308217))

(assert (=> b!198996 m!307539))

(declare-fun m!308219 () Bool)

(assert (=> b!198995 m!308219))

(assert (=> b!198995 m!308217))

(assert (=> b!198992 m!307975))

(declare-fun m!308221 () Bool)

(assert (=> b!199002 m!308221))

(assert (=> b!199002 m!307539))

(declare-fun m!308223 () Bool)

(assert (=> b!198999 m!308223))

(declare-fun m!308225 () Bool)

(assert (=> b!199001 m!308225))

(assert (=> b!199001 m!308225))

(declare-fun m!308227 () Bool)

(assert (=> b!199001 m!308227))

(declare-fun m!308229 () Bool)

(assert (=> b!199000 m!308229))

(declare-fun m!308231 () Bool)

(assert (=> b!198998 m!308231))

(declare-fun m!308233 () Bool)

(assert (=> b!198998 m!308233))

(declare-fun m!308235 () Bool)

(assert (=> b!198998 m!308235))

(declare-fun m!308237 () Bool)

(assert (=> b!198998 m!308237))

(declare-fun m!308239 () Bool)

(assert (=> b!198998 m!308239))

(assert (=> b!198998 m!307539))

(declare-fun m!308241 () Bool)

(assert (=> b!198998 m!308241))

(declare-fun m!308243 () Bool)

(assert (=> b!198998 m!308243))

(declare-fun m!308245 () Bool)

(assert (=> b!198998 m!308245))

(declare-fun m!308247 () Bool)

(assert (=> b!198998 m!308247))

(declare-fun m!308249 () Bool)

(assert (=> b!198998 m!308249))

(declare-fun m!308251 () Bool)

(assert (=> b!198998 m!308251))

(declare-fun m!308253 () Bool)

(assert (=> b!198998 m!308253))

(declare-fun m!308255 () Bool)

(assert (=> b!198998 m!308255))

(declare-fun m!308257 () Bool)

(assert (=> b!198998 m!308257))

(declare-fun m!308259 () Bool)

(assert (=> b!198998 m!308259))

(declare-fun m!308261 () Bool)

(assert (=> b!198998 m!308261))

(declare-fun m!308263 () Bool)

(assert (=> b!198998 m!308263))

(declare-fun m!308265 () Bool)

(assert (=> b!198998 m!308265))

(declare-fun m!308267 () Bool)

(assert (=> b!198998 m!308267))

(declare-fun m!308269 () Bool)

(assert (=> b!198998 m!308269))

(declare-fun m!308271 () Bool)

(assert (=> b!198998 m!308271))

(declare-fun m!308273 () Bool)

(assert (=> b!198998 m!308273))

(declare-fun m!308275 () Bool)

(assert (=> b!198998 m!308275))

(declare-fun m!308277 () Bool)

(assert (=> b!198998 m!308277))

(declare-fun m!308279 () Bool)

(assert (=> b!198998 m!308279))

(declare-fun m!308281 () Bool)

(assert (=> b!198998 m!308281))

(declare-fun m!308283 () Bool)

(assert (=> b!198998 m!308283))

(declare-fun m!308285 () Bool)

(assert (=> b!198998 m!308285))

(declare-fun m!308287 () Bool)

(assert (=> b!198998 m!308287))

(declare-fun m!308289 () Bool)

(assert (=> b!198998 m!308289))

(declare-fun m!308291 () Bool)

(assert (=> b!198998 m!308291))

(assert (=> b!198998 m!308269))

(declare-fun m!308293 () Bool)

(assert (=> b!198998 m!308293))

(declare-fun m!308295 () Bool)

(assert (=> b!198998 m!308295))

(declare-fun m!308297 () Bool)

(assert (=> d!67643 m!308297))

(declare-fun m!308299 () Bool)

(assert (=> b!198997 m!308299))

(declare-fun m!308301 () Bool)

(assert (=> b!198997 m!308301))

(declare-fun m!308303 () Bool)

(assert (=> b!198997 m!308303))

(assert (=> b!198997 m!308281))

(assert (=> b!198997 m!308263))

(declare-fun m!308305 () Bool)

(assert (=> b!198997 m!308305))

(declare-fun m!308307 () Bool)

(assert (=> bm!3137 m!308307))

(assert (=> b!198572 d!67643))

(declare-fun d!67703 () Bool)

(assert (=> d!67703 (= (invariant!0 (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204) (size!4456 (buf!4948 thiss!1204))) (and (bvsge (currentBit!9290 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9290 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9295 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9295 thiss!1204) (size!4456 (buf!4948 thiss!1204))) (and (= (currentBit!9290 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9295 thiss!1204) (size!4456 (buf!4948 thiss!1204)))))))))

(assert (=> b!198570 d!67703))

(declare-fun d!67705 () Bool)

(declare-fun e!136572 () Bool)

(assert (=> d!67705 e!136572))

(declare-fun res!166592 () Bool)

(assert (=> d!67705 (=> (not res!166592) (not e!136572))))

(declare-fun lt!310553 () BitStream!8020)

(declare-fun lt!310554 () (_ BitVec 64))

(assert (=> d!67705 (= res!166592 (= (bvadd lt!310554 (bvsub lt!309506 lt!309525)) (bitIndex!0 (size!4456 (buf!4948 lt!310553)) (currentByte!9295 lt!310553) (currentBit!9290 lt!310553))))))

(assert (=> d!67705 (or (not (= (bvand lt!310554 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309506 lt!309525) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!310554 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!310554 (bvsub lt!309506 lt!309525)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67705 (= lt!310554 (bitIndex!0 (size!4456 (buf!4948 (_2!9203 lt!309516))) (currentByte!9295 (_2!9203 lt!309516)) (currentBit!9290 (_2!9203 lt!309516))))))

(declare-fun moveBitIndex!0 (BitStream!8020 (_ BitVec 64)) tuple2!17108)

(assert (=> d!67705 (= lt!310553 (_2!9202 (moveBitIndex!0 (_2!9203 lt!309516) (bvsub lt!309506 lt!309525))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8020 (_ BitVec 64)) Bool)

(assert (=> d!67705 (moveBitIndexPrecond!0 (_2!9203 lt!309516) (bvsub lt!309506 lt!309525))))

(assert (=> d!67705 (= (withMovedBitIndex!0 (_2!9203 lt!309516) (bvsub lt!309506 lt!309525)) lt!310553)))

(declare-fun b!199005 () Bool)

(assert (=> b!199005 (= e!136572 (= (size!4456 (buf!4948 (_2!9203 lt!309516))) (size!4456 (buf!4948 lt!310553))))))

(assert (= (and d!67705 res!166592) b!199005))

(declare-fun m!308309 () Bool)

(assert (=> d!67705 m!308309))

(declare-fun m!308311 () Bool)

(assert (=> d!67705 m!308311))

(declare-fun m!308313 () Bool)

(assert (=> d!67705 m!308313))

(declare-fun m!308315 () Bool)

(assert (=> d!67705 m!308315))

(assert (=> b!198581 d!67705))

(declare-fun d!67707 () Bool)

(declare-fun e!136573 () Bool)

(assert (=> d!67707 e!136573))

(declare-fun res!166594 () Bool)

(assert (=> d!67707 (=> (not res!166594) (not e!136573))))

(declare-fun lt!310560 () (_ BitVec 64))

(declare-fun lt!310556 () (_ BitVec 64))

(declare-fun lt!310557 () (_ BitVec 64))

(assert (=> d!67707 (= res!166594 (= lt!310560 (bvsub lt!310556 lt!310557)))))

(assert (=> d!67707 (or (= (bvand lt!310556 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310557 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!310556 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!310556 lt!310557) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67707 (= lt!310557 (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!309529)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309529))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309529)))))))

(declare-fun lt!310559 () (_ BitVec 64))

(declare-fun lt!310555 () (_ BitVec 64))

(assert (=> d!67707 (= lt!310556 (bvmul lt!310559 lt!310555))))

(assert (=> d!67707 (or (= lt!310559 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!310555 (bvsdiv (bvmul lt!310559 lt!310555) lt!310559)))))

(assert (=> d!67707 (= lt!310555 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67707 (= lt!310559 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!309529)))))))

(assert (=> d!67707 (= lt!310560 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309529))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309529)))))))

(assert (=> d!67707 (invariant!0 (currentBit!9290 (_2!9202 lt!309529)) (currentByte!9295 (_2!9202 lt!309529)) (size!4456 (buf!4948 (_2!9202 lt!309529))))))

(assert (=> d!67707 (= (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))) lt!310560)))

(declare-fun b!199006 () Bool)

(declare-fun res!166593 () Bool)

(assert (=> b!199006 (=> (not res!166593) (not e!136573))))

(assert (=> b!199006 (= res!166593 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!310560))))

(declare-fun b!199007 () Bool)

(declare-fun lt!310558 () (_ BitVec 64))

(assert (=> b!199007 (= e!136573 (bvsle lt!310560 (bvmul lt!310558 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199007 (or (= lt!310558 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!310558 #b0000000000000000000000000000000000000000000000000000000000001000) lt!310558)))))

(assert (=> b!199007 (= lt!310558 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!309529)))))))

(assert (= (and d!67707 res!166594) b!199006))

(assert (= (and b!199006 res!166593) b!199007))

(declare-fun m!308317 () Bool)

(assert (=> d!67707 m!308317))

(assert (=> d!67707 m!307883))

(assert (=> b!198574 d!67707))

(declare-fun d!67709 () Bool)

(declare-fun e!136574 () Bool)

(assert (=> d!67709 e!136574))

(declare-fun res!166596 () Bool)

(assert (=> d!67709 (=> (not res!166596) (not e!136574))))

(declare-fun lt!310562 () (_ BitVec 64))

(declare-fun lt!310563 () (_ BitVec 64))

(declare-fun lt!310566 () (_ BitVec 64))

(assert (=> d!67709 (= res!166596 (= lt!310566 (bvsub lt!310562 lt!310563)))))

(assert (=> d!67709 (or (= (bvand lt!310562 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310563 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!310562 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!310562 lt!310563) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67709 (= lt!310563 (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 thiss!1204))) ((_ sign_extend 32) (currentByte!9295 thiss!1204)) ((_ sign_extend 32) (currentBit!9290 thiss!1204))))))

(declare-fun lt!310565 () (_ BitVec 64))

(declare-fun lt!310561 () (_ BitVec 64))

(assert (=> d!67709 (= lt!310562 (bvmul lt!310565 lt!310561))))

(assert (=> d!67709 (or (= lt!310565 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!310561 (bvsdiv (bvmul lt!310565 lt!310561) lt!310565)))))

(assert (=> d!67709 (= lt!310561 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67709 (= lt!310565 ((_ sign_extend 32) (size!4456 (buf!4948 thiss!1204))))))

(assert (=> d!67709 (= lt!310566 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 thiss!1204))))))

(assert (=> d!67709 (invariant!0 (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204) (size!4456 (buf!4948 thiss!1204)))))

(assert (=> d!67709 (= (bitIndex!0 (size!4456 (buf!4948 thiss!1204)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)) lt!310566)))

(declare-fun b!199008 () Bool)

(declare-fun res!166595 () Bool)

(assert (=> b!199008 (=> (not res!166595) (not e!136574))))

(assert (=> b!199008 (= res!166595 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!310566))))

(declare-fun b!199009 () Bool)

(declare-fun lt!310564 () (_ BitVec 64))

(assert (=> b!199009 (= e!136574 (bvsle lt!310566 (bvmul lt!310564 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199009 (or (= lt!310564 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!310564 #b0000000000000000000000000000000000000000000000000000000000001000) lt!310564)))))

(assert (=> b!199009 (= lt!310564 ((_ sign_extend 32) (size!4456 (buf!4948 thiss!1204))))))

(assert (= (and d!67709 res!166596) b!199008))

(assert (= (and b!199008 res!166595) b!199009))

(declare-fun m!308319 () Bool)

(assert (=> d!67709 m!308319))

(assert (=> d!67709 m!307555))

(assert (=> b!198574 d!67709))

(declare-fun b!199019 () Bool)

(declare-fun res!166605 () Bool)

(declare-fun e!136579 () Bool)

(assert (=> b!199019 (=> (not res!166605) (not e!136579))))

(declare-fun lt!310575 () (_ BitVec 64))

(declare-fun lt!310578 () tuple2!17108)

(declare-fun lt!310577 () (_ BitVec 64))

(assert (=> b!199019 (= res!166605 (= (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310578))) (currentByte!9295 (_2!9202 lt!310578)) (currentBit!9290 (_2!9202 lt!310578))) (bvadd lt!310575 lt!310577)))))

(assert (=> b!199019 (or (not (= (bvand lt!310575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310577 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!310575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!310575 lt!310577) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199019 (= lt!310577 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!199019 (= lt!310575 (bitIndex!0 (size!4456 (buf!4948 thiss!1204)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)))))

(declare-fun d!67711 () Bool)

(assert (=> d!67711 e!136579))

(declare-fun res!166606 () Bool)

(assert (=> d!67711 (=> (not res!166606) (not e!136579))))

(assert (=> d!67711 (= res!166606 (= (size!4456 (buf!4948 thiss!1204)) (size!4456 (buf!4948 (_2!9202 lt!310578)))))))

(declare-fun choose!16 (BitStream!8020 Bool) tuple2!17108)

(assert (=> d!67711 (= lt!310578 (choose!16 thiss!1204 lt!309530))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!67711 (validate_offset_bit!0 ((_ sign_extend 32) (size!4456 (buf!4948 thiss!1204))) ((_ sign_extend 32) (currentByte!9295 thiss!1204)) ((_ sign_extend 32) (currentBit!9290 thiss!1204)))))

(assert (=> d!67711 (= (appendBit!0 thiss!1204 lt!309530) lt!310578)))

(declare-fun b!199022 () Bool)

(declare-fun e!136580 () Bool)

(declare-fun lt!310576 () tuple2!17114)

(assert (=> b!199022 (= e!136580 (= (bitIndex!0 (size!4456 (buf!4948 (_1!9205 lt!310576))) (currentByte!9295 (_1!9205 lt!310576)) (currentBit!9290 (_1!9205 lt!310576))) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310578))) (currentByte!9295 (_2!9202 lt!310578)) (currentBit!9290 (_2!9202 lt!310578)))))))

(declare-fun b!199021 () Bool)

(assert (=> b!199021 (= e!136579 e!136580)))

(declare-fun res!166607 () Bool)

(assert (=> b!199021 (=> (not res!166607) (not e!136580))))

(assert (=> b!199021 (= res!166607 (and (= (_2!9205 lt!310576) lt!309530) (= (_1!9205 lt!310576) (_2!9202 lt!310578))))))

(assert (=> b!199021 (= lt!310576 (readBitPure!0 (readerFrom!0 (_2!9202 lt!310578) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204))))))

(declare-fun b!199020 () Bool)

(declare-fun res!166608 () Bool)

(assert (=> b!199020 (=> (not res!166608) (not e!136579))))

(assert (=> b!199020 (= res!166608 (isPrefixOf!0 thiss!1204 (_2!9202 lt!310578)))))

(assert (= (and d!67711 res!166606) b!199019))

(assert (= (and b!199019 res!166605) b!199020))

(assert (= (and b!199020 res!166608) b!199021))

(assert (= (and b!199021 res!166607) b!199022))

(declare-fun m!308321 () Bool)

(assert (=> d!67711 m!308321))

(declare-fun m!308323 () Bool)

(assert (=> d!67711 m!308323))

(declare-fun m!308325 () Bool)

(assert (=> b!199019 m!308325))

(assert (=> b!199019 m!307541))

(declare-fun m!308327 () Bool)

(assert (=> b!199022 m!308327))

(assert (=> b!199022 m!308325))

(declare-fun m!308329 () Bool)

(assert (=> b!199020 m!308329))

(declare-fun m!308331 () Bool)

(assert (=> b!199021 m!308331))

(assert (=> b!199021 m!308331))

(declare-fun m!308333 () Bool)

(assert (=> b!199021 m!308333))

(assert (=> b!198574 d!67711))

(declare-fun d!67713 () Bool)

(declare-fun lt!310633 () tuple2!17112)

(declare-fun lt!310636 () tuple2!17112)

(assert (=> d!67713 (and (= (_2!9204 lt!310633) (_2!9204 lt!310636)) (= (_1!9204 lt!310633) (_1!9204 lt!310636)))))

(declare-fun lt!310635 () Bool)

(declare-fun lt!310631 () Unit!14058)

(declare-fun lt!310634 () (_ BitVec 64))

(declare-fun lt!310632 () BitStream!8020)

(declare-fun choose!56 (BitStream!8020 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!17112 tuple2!17112 BitStream!8020 (_ BitVec 64) Bool BitStream!8020 (_ BitVec 64) tuple2!17112 tuple2!17112 BitStream!8020 (_ BitVec 64)) Unit!14058)

(assert (=> d!67713 (= lt!310631 (choose!56 (_1!9203 lt!309512) nBits!348 i!590 lt!309511 lt!310633 (tuple2!17113 (_1!9204 lt!310633) (_2!9204 lt!310633)) (_1!9204 lt!310633) (_2!9204 lt!310633) lt!310635 lt!310632 lt!310634 lt!310636 (tuple2!17113 (_1!9204 lt!310636) (_2!9204 lt!310636)) (_1!9204 lt!310636) (_2!9204 lt!310636)))))

(assert (=> d!67713 (= lt!310636 (readNBitsLSBFirstsLoopPure!0 lt!310632 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!310634))))

(assert (=> d!67713 (= lt!310634 (bvor lt!309511 (ite lt!310635 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67713 (= lt!310632 (withMovedBitIndex!0 (_1!9203 lt!309512) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!67713 (= lt!310635 (_2!9205 (readBitPure!0 (_1!9203 lt!309512))))))

(assert (=> d!67713 (= lt!310633 (readNBitsLSBFirstsLoopPure!0 (_1!9203 lt!309512) nBits!348 i!590 lt!309511))))

(assert (=> d!67713 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9203 lt!309512) nBits!348 i!590 lt!309511) lt!310631)))

(declare-fun bs!16747 () Bool)

(assert (= bs!16747 d!67713))

(assert (=> bs!16747 m!307549))

(declare-fun m!308335 () Bool)

(assert (=> bs!16747 m!308335))

(assert (=> bs!16747 m!307507))

(declare-fun m!308337 () Bool)

(assert (=> bs!16747 m!308337))

(assert (=> bs!16747 m!307511))

(assert (=> b!198585 d!67713))

(declare-fun lt!310645 () tuple2!17138)

(declare-fun d!67715 () Bool)

(assert (=> d!67715 (= lt!310645 (readNBitsLSBFirstsLoop!0 lt!309522 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!309531))))

(assert (=> d!67715 (= (readNBitsLSBFirstsLoopPure!0 lt!309522 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!309531) (tuple2!17113 (_2!9217 lt!310645) (_1!9217 lt!310645)))))

(declare-fun bs!16748 () Bool)

(assert (= bs!16748 d!67715))

(declare-fun m!308339 () Bool)

(assert (=> bs!16748 m!308339))

(assert (=> b!198585 d!67715))

(declare-fun d!67717 () Bool)

(declare-fun e!136589 () Bool)

(assert (=> d!67717 e!136589))

(declare-fun res!166619 () Bool)

(assert (=> d!67717 (=> (not res!166619) (not e!136589))))

(declare-fun lt!310647 () (_ BitVec 64))

(declare-fun lt!310646 () BitStream!8020)

(assert (=> d!67717 (= res!166619 (= (bvadd lt!310647 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4456 (buf!4948 lt!310646)) (currentByte!9295 lt!310646) (currentBit!9290 lt!310646))))))

(assert (=> d!67717 (or (not (= (bvand lt!310647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!310647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!310647 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67717 (= lt!310647 (bitIndex!0 (size!4456 (buf!4948 (_1!9203 lt!309512))) (currentByte!9295 (_1!9203 lt!309512)) (currentBit!9290 (_1!9203 lt!309512))))))

(assert (=> d!67717 (= lt!310646 (_2!9202 (moveBitIndex!0 (_1!9203 lt!309512) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!67717 (moveBitIndexPrecond!0 (_1!9203 lt!309512) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!67717 (= (withMovedBitIndex!0 (_1!9203 lt!309512) #b0000000000000000000000000000000000000000000000000000000000000001) lt!310646)))

(declare-fun b!199037 () Bool)

(assert (=> b!199037 (= e!136589 (= (size!4456 (buf!4948 (_1!9203 lt!309512))) (size!4456 (buf!4948 lt!310646))))))

(assert (= (and d!67717 res!166619) b!199037))

(declare-fun m!308341 () Bool)

(assert (=> d!67717 m!308341))

(declare-fun m!308343 () Bool)

(assert (=> d!67717 m!308343))

(declare-fun m!308345 () Bool)

(assert (=> d!67717 m!308345))

(declare-fun m!308347 () Bool)

(assert (=> d!67717 m!308347))

(assert (=> b!198585 d!67717))

(assert (=> b!198584 d!67707))

(assert (=> b!198584 d!67709))

(declare-fun d!67719 () Bool)

(assert (=> d!67719 (= (array_inv!4197 (buf!4948 thiss!1204)) (bvsge (size!4456 (buf!4948 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!198573 d!67719))

(declare-fun d!67721 () Bool)

(assert (=> d!67721 (= (invariant!0 (currentBit!9290 (_2!9202 lt!309509)) (currentByte!9295 (_2!9202 lt!309509)) (size!4456 (buf!4948 (_2!9202 lt!309509)))) (and (bvsge (currentBit!9290 (_2!9202 lt!309509)) #b00000000000000000000000000000000) (bvslt (currentBit!9290 (_2!9202 lt!309509)) #b00000000000000000000000000001000) (bvsge (currentByte!9295 (_2!9202 lt!309509)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9295 (_2!9202 lt!309509)) (size!4456 (buf!4948 (_2!9202 lt!309509)))) (and (= (currentBit!9290 (_2!9202 lt!309509)) #b00000000000000000000000000000000) (= (currentByte!9295 (_2!9202 lt!309509)) (size!4456 (buf!4948 (_2!9202 lt!309509))))))))))

(assert (=> b!198577 d!67721))

(declare-fun d!67723 () Bool)

(declare-fun e!136590 () Bool)

(assert (=> d!67723 e!136590))

(declare-fun res!166621 () Bool)

(assert (=> d!67723 (=> (not res!166621) (not e!136590))))

(declare-fun lt!310660 () (_ BitVec 64))

(declare-fun lt!310659 () (_ BitVec 64))

(declare-fun lt!310663 () (_ BitVec 64))

(assert (=> d!67723 (= res!166621 (= lt!310663 (bvsub lt!310659 lt!310660)))))

(assert (=> d!67723 (or (= (bvand lt!310659 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310660 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!310659 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!310659 lt!310660) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67723 (= lt!310660 (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!309514)))) ((_ sign_extend 32) (currentByte!9295 (_1!9205 lt!309514))) ((_ sign_extend 32) (currentBit!9290 (_1!9205 lt!309514)))))))

(declare-fun lt!310662 () (_ BitVec 64))

(declare-fun lt!310658 () (_ BitVec 64))

(assert (=> d!67723 (= lt!310659 (bvmul lt!310662 lt!310658))))

(assert (=> d!67723 (or (= lt!310662 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!310658 (bvsdiv (bvmul lt!310662 lt!310658) lt!310662)))))

(assert (=> d!67723 (= lt!310658 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67723 (= lt!310662 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!309514)))))))

(assert (=> d!67723 (= lt!310663 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 (_1!9205 lt!309514))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 (_1!9205 lt!309514)))))))

(assert (=> d!67723 (invariant!0 (currentBit!9290 (_1!9205 lt!309514)) (currentByte!9295 (_1!9205 lt!309514)) (size!4456 (buf!4948 (_1!9205 lt!309514))))))

(assert (=> d!67723 (= (bitIndex!0 (size!4456 (buf!4948 (_1!9205 lt!309514))) (currentByte!9295 (_1!9205 lt!309514)) (currentBit!9290 (_1!9205 lt!309514))) lt!310663)))

(declare-fun b!199038 () Bool)

(declare-fun res!166620 () Bool)

(assert (=> b!199038 (=> (not res!166620) (not e!136590))))

(assert (=> b!199038 (= res!166620 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!310663))))

(declare-fun b!199039 () Bool)

(declare-fun lt!310661 () (_ BitVec 64))

(assert (=> b!199039 (= e!136590 (bvsle lt!310663 (bvmul lt!310661 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199039 (or (= lt!310661 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!310661 #b0000000000000000000000000000000000000000000000000000000000001000) lt!310661)))))

(assert (=> b!199039 (= lt!310661 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!309514)))))))

(assert (= (and d!67723 res!166621) b!199038))

(assert (= (and b!199038 res!166620) b!199039))

(declare-fun m!308349 () Bool)

(assert (=> d!67723 m!308349))

(declare-fun m!308351 () Bool)

(assert (=> d!67723 m!308351))

(assert (=> b!198586 d!67723))

(declare-fun d!67725 () Bool)

(declare-fun res!166622 () Bool)

(declare-fun e!136594 () Bool)

(assert (=> d!67725 (=> (not res!166622) (not e!136594))))

(assert (=> d!67725 (= res!166622 (= (size!4456 (buf!4948 (_2!9202 lt!309529))) (size!4456 (buf!4948 (_2!9202 lt!309509)))))))

(assert (=> d!67725 (= (isPrefixOf!0 (_2!9202 lt!309529) (_2!9202 lt!309509)) e!136594)))

(declare-fun b!199044 () Bool)

(declare-fun res!166624 () Bool)

(assert (=> b!199044 (=> (not res!166624) (not e!136594))))

(assert (=> b!199044 (= res!166624 (bvsle (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309509))) (currentByte!9295 (_2!9202 lt!309509)) (currentBit!9290 (_2!9202 lt!309509)))))))

(declare-fun b!199045 () Bool)

(declare-fun e!136593 () Bool)

(assert (=> b!199045 (= e!136594 e!136593)))

(declare-fun res!166623 () Bool)

(assert (=> b!199045 (=> res!166623 e!136593)))

(assert (=> b!199045 (= res!166623 (= (size!4456 (buf!4948 (_2!9202 lt!309529))) #b00000000000000000000000000000000))))

(declare-fun b!199046 () Bool)

(assert (=> b!199046 (= e!136593 (arrayBitRangesEq!0 (buf!4948 (_2!9202 lt!309529)) (buf!4948 (_2!9202 lt!309509)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529)))))))

(assert (= (and d!67725 res!166622) b!199044))

(assert (= (and b!199044 res!166624) b!199045))

(assert (= (and b!199045 (not res!166623)) b!199046))

(assert (=> b!199044 m!307539))

(assert (=> b!199044 m!307495))

(assert (=> b!199046 m!307539))

(assert (=> b!199046 m!307539))

(declare-fun m!308353 () Bool)

(assert (=> b!199046 m!308353))

(assert (=> b!198575 d!67725))

(declare-fun d!67727 () Bool)

(declare-fun res!166625 () Bool)

(declare-fun e!136596 () Bool)

(assert (=> d!67727 (=> (not res!166625) (not e!136596))))

(assert (=> d!67727 (= res!166625 (= (size!4456 (buf!4948 thiss!1204)) (size!4456 (buf!4948 (_2!9202 lt!309529)))))))

(assert (=> d!67727 (= (isPrefixOf!0 thiss!1204 (_2!9202 lt!309529)) e!136596)))

(declare-fun b!199047 () Bool)

(declare-fun res!166627 () Bool)

(assert (=> b!199047 (=> (not res!166627) (not e!136596))))

(assert (=> b!199047 (= res!166627 (bvsle (bitIndex!0 (size!4456 (buf!4948 thiss!1204)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529)))))))

(declare-fun b!199048 () Bool)

(declare-fun e!136595 () Bool)

(assert (=> b!199048 (= e!136596 e!136595)))

(declare-fun res!166626 () Bool)

(assert (=> b!199048 (=> res!166626 e!136595)))

(assert (=> b!199048 (= res!166626 (= (size!4456 (buf!4948 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!199049 () Bool)

(assert (=> b!199049 (= e!136595 (arrayBitRangesEq!0 (buf!4948 thiss!1204) (buf!4948 (_2!9202 lt!309529)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4456 (buf!4948 thiss!1204)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204))))))

(assert (= (and d!67727 res!166625) b!199047))

(assert (= (and b!199047 res!166627) b!199048))

(assert (= (and b!199048 (not res!166626)) b!199049))

(assert (=> b!199047 m!307541))

(assert (=> b!199047 m!307539))

(assert (=> b!199049 m!307541))

(assert (=> b!199049 m!307541))

(declare-fun m!308355 () Bool)

(assert (=> b!199049 m!308355))

(assert (=> b!198576 d!67727))

(declare-fun d!67729 () Bool)

(assert (=> d!67729 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204) (size!4456 (buf!4948 thiss!1204))))))

(declare-fun bs!16749 () Bool)

(assert (= bs!16749 d!67729))

(assert (=> bs!16749 m!307555))

(assert (=> start!42098 d!67729))

(declare-fun d!67731 () Bool)

(assert (=> d!67731 (= (invariant!0 (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204) (size!4456 (buf!4948 (_2!9202 lt!309509)))) (and (bvsge (currentBit!9290 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9290 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9295 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9295 thiss!1204) (size!4456 (buf!4948 (_2!9202 lt!309509)))) (and (= (currentBit!9290 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9295 thiss!1204) (size!4456 (buf!4948 (_2!9202 lt!309509))))))))))

(assert (=> b!198579 d!67731))

(assert (=> b!198580 d!67727))

(declare-fun d!67733 () Bool)

(declare-fun e!136597 () Bool)

(assert (=> d!67733 e!136597))

(declare-fun res!166628 () Bool)

(assert (=> d!67733 (=> (not res!166628) (not e!136597))))

(declare-fun lt!310690 () BitStream!8020)

(declare-fun lt!310691 () (_ BitVec 64))

(assert (=> d!67733 (= res!166628 (= (bvadd lt!310691 (bvsub lt!309526 lt!309525)) (bitIndex!0 (size!4456 (buf!4948 lt!310690)) (currentByte!9295 lt!310690) (currentBit!9290 lt!310690))))))

(assert (=> d!67733 (or (not (= (bvand lt!310691 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309526 lt!309525) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!310691 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!310691 (bvsub lt!309526 lt!309525)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67733 (= lt!310691 (bitIndex!0 (size!4456 (buf!4948 (_2!9203 lt!309512))) (currentByte!9295 (_2!9203 lt!309512)) (currentBit!9290 (_2!9203 lt!309512))))))

(assert (=> d!67733 (= lt!310690 (_2!9202 (moveBitIndex!0 (_2!9203 lt!309512) (bvsub lt!309526 lt!309525))))))

(assert (=> d!67733 (moveBitIndexPrecond!0 (_2!9203 lt!309512) (bvsub lt!309526 lt!309525))))

(assert (=> d!67733 (= (withMovedBitIndex!0 (_2!9203 lt!309512) (bvsub lt!309526 lt!309525)) lt!310690)))

(declare-fun b!199050 () Bool)

(assert (=> b!199050 (= e!136597 (= (size!4456 (buf!4948 (_2!9203 lt!309512))) (size!4456 (buf!4948 lt!310690))))))

(assert (= (and d!67733 res!166628) b!199050))

(declare-fun m!308357 () Bool)

(assert (=> d!67733 m!308357))

(declare-fun m!308359 () Bool)

(assert (=> d!67733 m!308359))

(declare-fun m!308361 () Bool)

(assert (=> d!67733 m!308361))

(declare-fun m!308363 () Bool)

(assert (=> d!67733 m!308363))

(assert (=> b!198569 d!67733))

(declare-fun d!67735 () Bool)

(assert (=> d!67735 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4456 (buf!4948 thiss!1204))) ((_ sign_extend 32) (currentByte!9295 thiss!1204)) ((_ sign_extend 32) (currentBit!9290 thiss!1204)) lt!309513) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 thiss!1204))) ((_ sign_extend 32) (currentByte!9295 thiss!1204)) ((_ sign_extend 32) (currentBit!9290 thiss!1204))) lt!309513))))

(declare-fun bs!16750 () Bool)

(assert (= bs!16750 d!67735))

(assert (=> bs!16750 m!308319))

(assert (=> b!198578 d!67735))

(push 1)

(assert (not b!198834))

(assert (not b!198836))

(assert (not b!199001))

(assert (not b!198786))

(assert (not d!67729))

(assert (not b!199049))

(assert (not b!198995))

(assert (not d!67711))

(assert (not b!199019))

(assert (not d!67713))

(assert (not d!67631))

(assert (not b!198992))

(assert (not d!67635))

(assert (not b!198824))

(assert (not d!67633))

(assert (not b!199002))

(assert (not d!67629))

(assert (not d!67637))

(assert (not b!199021))

(assert (not b!198849))

(assert (not d!67589))

(assert (not b!198837))

(assert (not b!198996))

(assert (not d!67623))

(assert (not d!67601))

(assert (not d!67587))

(assert (not d!67583))

(assert (not d!67619))

(assert (not d!67643))

(assert (not d!67585))

(assert (not b!198851))

(assert (not b!199022))

(assert (not d!67593))

(assert (not d!67705))

(assert (not b!199000))

(assert (not d!67715))

(assert (not d!67709))

(assert (not d!67599))

(assert (not b!198823))

(assert (not b!198821))

(assert (not d!67717))

(assert (not bm!3137))

(assert (not d!67735))

(assert (not d!67641))

(assert (not d!67733))

(assert (not d!67723))

(assert (not d!67613))

(assert (not d!67625))

(assert (not b!198997))

(assert (not b!198825))

(assert (not b!198998))

(assert (not b!199047))

(assert (not d!67627))

(assert (not d!67707))

(assert (not b!198838))

(assert (not b!199044))

(assert (not b!198999))

(assert (not b!199046))

(assert (not b!199020))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!68255 () Bool)

(declare-fun res!167085 () Bool)

(declare-fun e!136970 () Bool)

(assert (=> d!68255 (=> (not res!167085) (not e!136970))))

(assert (=> d!68255 (= res!167085 (= (size!4456 (buf!4948 (_2!9202 lt!309529))) (size!4456 (buf!4948 (ite c!9913 (_2!9202 lt!309529) (_2!9202 lt!310505))))))))

(assert (=> d!68255 (= (isPrefixOf!0 (_2!9202 lt!309529) (ite c!9913 (_2!9202 lt!309529) (_2!9202 lt!310505))) e!136970)))

(declare-fun b!199601 () Bool)

(declare-fun res!167087 () Bool)

(assert (=> b!199601 (=> (not res!167087) (not e!136970))))

(assert (=> b!199601 (= res!167087 (bvsle (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))) (bitIndex!0 (size!4456 (buf!4948 (ite c!9913 (_2!9202 lt!309529) (_2!9202 lt!310505)))) (currentByte!9295 (ite c!9913 (_2!9202 lt!309529) (_2!9202 lt!310505))) (currentBit!9290 (ite c!9913 (_2!9202 lt!309529) (_2!9202 lt!310505))))))))

(declare-fun b!199602 () Bool)

(declare-fun e!136969 () Bool)

(assert (=> b!199602 (= e!136970 e!136969)))

(declare-fun res!167086 () Bool)

(assert (=> b!199602 (=> res!167086 e!136969)))

(assert (=> b!199602 (= res!167086 (= (size!4456 (buf!4948 (_2!9202 lt!309529))) #b00000000000000000000000000000000))))

(declare-fun b!199603 () Bool)

(assert (=> b!199603 (= e!136969 (arrayBitRangesEq!0 (buf!4948 (_2!9202 lt!309529)) (buf!4948 (ite c!9913 (_2!9202 lt!309529) (_2!9202 lt!310505))) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529)))))))

(assert (= (and d!68255 res!167085) b!199601))

(assert (= (and b!199601 res!167087) b!199602))

(assert (= (and b!199602 (not res!167086)) b!199603))

(assert (=> b!199601 m!307539))

(declare-fun m!309663 () Bool)

(assert (=> b!199601 m!309663))

(assert (=> b!199603 m!307539))

(assert (=> b!199603 m!307539))

(declare-fun m!309665 () Bool)

(assert (=> b!199603 m!309665))

(assert (=> bm!3137 d!68255))

(declare-fun b!199618 () Bool)

(declare-fun e!136988 () Bool)

(declare-fun e!136985 () Bool)

(assert (=> b!199618 (= e!136988 e!136985)))

(declare-fun res!167098 () Bool)

(declare-fun call!3162 () Bool)

(assert (=> b!199618 (= res!167098 call!3162)))

(assert (=> b!199618 (=> (not res!167098) (not e!136985))))

(declare-fun e!136984 () Bool)

(declare-fun b!199619 () Bool)

(declare-datatypes ((tuple4!268 0))(
  ( (tuple4!269 (_1!9222 (_ BitVec 32)) (_2!9222 (_ BitVec 32)) (_3!650 (_ BitVec 32)) (_4!134 (_ BitVec 32))) )
))
(declare-fun lt!311645 () tuple4!268)

(declare-fun arrayRangesEq!696 (array!10112 array!10112 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!199619 (= e!136984 (arrayRangesEq!696 (buf!4948 (_2!9202 lt!309529)) (buf!4948 (_2!9202 lt!309509)) (_1!9222 lt!311645) (_2!9222 lt!311645)))))

(declare-fun bm!3159 () Bool)

(declare-fun lt!311647 () (_ BitVec 32))

(declare-fun c!9962 () Bool)

(declare-fun lt!311646 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3159 (= call!3162 (byteRangesEq!0 (select (arr!5386 (buf!4948 (_2!9202 lt!309529))) (_3!650 lt!311645)) (select (arr!5386 (buf!4948 (_2!9202 lt!309509))) (_3!650 lt!311645)) lt!311647 (ite c!9962 lt!311646 #b00000000000000000000000000001000)))))

(declare-fun b!199620 () Bool)

(declare-fun e!136986 () Bool)

(assert (=> b!199620 (= e!136986 e!136988)))

(assert (=> b!199620 (= c!9962 (= (_3!650 lt!311645) (_4!134 lt!311645)))))

(declare-fun b!199621 () Bool)

(assert (=> b!199621 (= e!136988 call!3162)))

(declare-fun b!199623 () Bool)

(declare-fun e!136983 () Bool)

(assert (=> b!199623 (= e!136983 (byteRangesEq!0 (select (arr!5386 (buf!4948 (_2!9202 lt!309529))) (_4!134 lt!311645)) (select (arr!5386 (buf!4948 (_2!9202 lt!309509))) (_4!134 lt!311645)) #b00000000000000000000000000000000 lt!311646))))

(declare-fun b!199624 () Bool)

(declare-fun res!167101 () Bool)

(assert (=> b!199624 (= res!167101 (= lt!311646 #b00000000000000000000000000000000))))

(assert (=> b!199624 (=> res!167101 e!136983)))

(assert (=> b!199624 (= e!136985 e!136983)))

(declare-fun b!199622 () Bool)

(declare-fun e!136987 () Bool)

(assert (=> b!199622 (= e!136987 e!136986)))

(declare-fun res!167100 () Bool)

(assert (=> b!199622 (=> (not res!167100) (not e!136986))))

(assert (=> b!199622 (= res!167100 e!136984)))

(declare-fun res!167102 () Bool)

(assert (=> b!199622 (=> res!167102 e!136984)))

(assert (=> b!199622 (= res!167102 (bvsge (_1!9222 lt!311645) (_2!9222 lt!311645)))))

(assert (=> b!199622 (= lt!311646 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199622 (= lt!311647 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!268)

(assert (=> b!199622 (= lt!311645 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529)))))))

(declare-fun d!68257 () Bool)

(declare-fun res!167099 () Bool)

(assert (=> d!68257 (=> res!167099 e!136987)))

(assert (=> d!68257 (= res!167099 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529)))))))

(assert (=> d!68257 (= (arrayBitRangesEq!0 (buf!4948 (_2!9202 lt!309529)) (buf!4948 (_2!9202 lt!309509)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529)))) e!136987)))

(assert (= (and d!68257 (not res!167099)) b!199622))

(assert (= (and b!199622 (not res!167102)) b!199619))

(assert (= (and b!199622 res!167100) b!199620))

(assert (= (and b!199620 c!9962) b!199621))

(assert (= (and b!199620 (not c!9962)) b!199618))

(assert (= (and b!199618 res!167098) b!199624))

(assert (= (and b!199624 (not res!167101)) b!199623))

(assert (= (or b!199621 b!199618) bm!3159))

(declare-fun m!309667 () Bool)

(assert (=> b!199619 m!309667))

(declare-fun m!309669 () Bool)

(assert (=> bm!3159 m!309669))

(declare-fun m!309671 () Bool)

(assert (=> bm!3159 m!309671))

(assert (=> bm!3159 m!309669))

(assert (=> bm!3159 m!309671))

(declare-fun m!309673 () Bool)

(assert (=> bm!3159 m!309673))

(declare-fun m!309675 () Bool)

(assert (=> b!199623 m!309675))

(declare-fun m!309677 () Bool)

(assert (=> b!199623 m!309677))

(assert (=> b!199623 m!309675))

(assert (=> b!199623 m!309677))

(declare-fun m!309679 () Bool)

(assert (=> b!199623 m!309679))

(assert (=> b!199622 m!307539))

(declare-fun m!309681 () Bool)

(assert (=> b!199622 m!309681))

(assert (=> b!199046 d!68257))

(assert (=> b!199046 d!67707))

(declare-fun b!199639 () Bool)

(declare-fun e!136995 () tuple2!17138)

(assert (=> b!199639 (= e!136995 (tuple2!17139 lt!309511 (_1!9203 lt!309512)))))

(declare-fun b!199640 () Bool)

(declare-fun e!136997 () Bool)

(declare-fun e!136996 () Bool)

(assert (=> b!199640 (= e!136997 e!136996)))

(declare-fun res!167115 () Bool)

(assert (=> b!199640 (=> res!167115 e!136996)))

(assert (=> b!199640 (= res!167115 (not (bvslt i!590 nBits!348)))))

(declare-fun b!199641 () Bool)

(declare-fun lt!311660 () tuple2!17138)

(assert (=> b!199641 (= e!136995 (tuple2!17139 (_1!9217 lt!311660) (_2!9217 lt!311660)))))

(declare-fun lt!311661 () tuple2!17136)

(assert (=> b!199641 (= lt!311661 (readBit!0 (_1!9203 lt!309512)))))

(assert (=> b!199641 (= lt!311660 (readNBitsLSBFirstsLoop!0 (_2!9216 lt!311661) nBits!348 (bvadd i!590 #b00000000000000000000000000000001) (bvor lt!309511 (ite (_1!9216 lt!311661) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!199643 () Bool)

(declare-fun res!167113 () Bool)

(assert (=> b!199643 (=> (not res!167113) (not e!136997))))

(declare-fun lt!311662 () tuple2!17138)

(assert (=> b!199643 (= res!167113 (= (bvand (_1!9217 lt!311662) (onesLSBLong!0 i!590)) (bvand lt!309511 (onesLSBLong!0 i!590))))))

(declare-fun b!199644 () Bool)

(declare-fun res!167114 () Bool)

(assert (=> b!199644 (=> (not res!167114) (not e!136997))))

(assert (=> b!199644 (= res!167114 (= (bvand (_1!9217 lt!311662) (onesLSBLong!0 nBits!348)) (_1!9217 lt!311662)))))

(declare-fun b!199645 () Bool)

(declare-fun res!167116 () Bool)

(assert (=> b!199645 (=> (not res!167116) (not e!136997))))

(declare-fun lt!311663 () (_ BitVec 64))

(declare-fun lt!311664 () (_ BitVec 64))

(assert (=> b!199645 (= res!167116 (= (bitIndex!0 (size!4456 (buf!4948 (_2!9217 lt!311662))) (currentByte!9295 (_2!9217 lt!311662)) (currentBit!9290 (_2!9217 lt!311662))) (bvadd lt!311664 lt!311663)))))

(assert (=> b!199645 (or (not (= (bvand lt!311664 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311663 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311664 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311664 lt!311663) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199645 (= lt!311663 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (=> b!199645 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand i!590 #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 i!590) #b10000000000000000000000000000000)))))

(assert (=> b!199645 (= lt!311664 (bitIndex!0 (size!4456 (buf!4948 (_1!9203 lt!309512))) (currentByte!9295 (_1!9203 lt!309512)) (currentBit!9290 (_1!9203 lt!309512))))))

(declare-fun lt!311665 () (_ BitVec 64))

(declare-fun b!199642 () Bool)

(assert (=> b!199642 (= e!136996 (= (= (bvand (bvlshr (_1!9217 lt!311662) lt!311665) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!9205 (readBitPure!0 (_1!9203 lt!309512)))))))

(assert (=> b!199642 (and (bvsge lt!311665 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!311665 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!199642 (= lt!311665 ((_ sign_extend 32) i!590))))

(declare-fun d!68259 () Bool)

(assert (=> d!68259 e!136997))

(declare-fun res!167117 () Bool)

(assert (=> d!68259 (=> (not res!167117) (not e!136997))))

(assert (=> d!68259 (= res!167117 (= (buf!4948 (_2!9217 lt!311662)) (buf!4948 (_1!9203 lt!309512))))))

(assert (=> d!68259 (= lt!311662 e!136995)))

(declare-fun c!9965 () Bool)

(assert (=> d!68259 (= c!9965 (= nBits!348 i!590))))

(assert (=> d!68259 (and (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!68259 (= (readNBitsLSBFirstsLoop!0 (_1!9203 lt!309512) nBits!348 i!590 lt!309511) lt!311662)))

(assert (= (and d!68259 c!9965) b!199639))

(assert (= (and d!68259 (not c!9965)) b!199641))

(assert (= (and d!68259 res!167117) b!199645))

(assert (= (and b!199645 res!167116) b!199643))

(assert (= (and b!199643 res!167113) b!199644))

(assert (= (and b!199644 res!167114) b!199640))

(assert (= (and b!199640 (not res!167115)) b!199642))

(assert (=> b!199644 m!308281))

(assert (=> b!199643 m!307525))

(assert (=> b!199641 m!307989))

(declare-fun m!309683 () Bool)

(assert (=> b!199641 m!309683))

(declare-fun m!309685 () Bool)

(assert (=> b!199645 m!309685))

(assert (=> b!199645 m!308343))

(assert (=> b!199642 m!307511))

(assert (=> d!67613 d!68259))

(declare-fun d!68261 () Bool)

(declare-fun e!136998 () Bool)

(assert (=> d!68261 e!136998))

(declare-fun res!167119 () Bool)

(assert (=> d!68261 (=> (not res!167119) (not e!136998))))

(declare-fun lt!311667 () (_ BitVec 64))

(declare-fun lt!311668 () (_ BitVec 64))

(declare-fun lt!311671 () (_ BitVec 64))

(assert (=> d!68261 (= res!167119 (= lt!311671 (bvsub lt!311667 lt!311668)))))

(assert (=> d!68261 (or (= (bvand lt!311667 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311668 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311667 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311667 lt!311668) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68261 (= lt!311668 (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!310576)))) ((_ sign_extend 32) (currentByte!9295 (_1!9205 lt!310576))) ((_ sign_extend 32) (currentBit!9290 (_1!9205 lt!310576)))))))

(declare-fun lt!311670 () (_ BitVec 64))

(declare-fun lt!311666 () (_ BitVec 64))

(assert (=> d!68261 (= lt!311667 (bvmul lt!311670 lt!311666))))

(assert (=> d!68261 (or (= lt!311670 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311666 (bvsdiv (bvmul lt!311670 lt!311666) lt!311670)))))

(assert (=> d!68261 (= lt!311666 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68261 (= lt!311670 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!310576)))))))

(assert (=> d!68261 (= lt!311671 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 (_1!9205 lt!310576))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 (_1!9205 lt!310576)))))))

(assert (=> d!68261 (invariant!0 (currentBit!9290 (_1!9205 lt!310576)) (currentByte!9295 (_1!9205 lt!310576)) (size!4456 (buf!4948 (_1!9205 lt!310576))))))

(assert (=> d!68261 (= (bitIndex!0 (size!4456 (buf!4948 (_1!9205 lt!310576))) (currentByte!9295 (_1!9205 lt!310576)) (currentBit!9290 (_1!9205 lt!310576))) lt!311671)))

(declare-fun b!199646 () Bool)

(declare-fun res!167118 () Bool)

(assert (=> b!199646 (=> (not res!167118) (not e!136998))))

(assert (=> b!199646 (= res!167118 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311671))))

(declare-fun b!199647 () Bool)

(declare-fun lt!311669 () (_ BitVec 64))

(assert (=> b!199647 (= e!136998 (bvsle lt!311671 (bvmul lt!311669 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199647 (or (= lt!311669 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311669 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311669)))))

(assert (=> b!199647 (= lt!311669 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!310576)))))))

(assert (= (and d!68261 res!167119) b!199646))

(assert (= (and b!199646 res!167118) b!199647))

(declare-fun m!309687 () Bool)

(assert (=> d!68261 m!309687))

(declare-fun m!309689 () Bool)

(assert (=> d!68261 m!309689))

(assert (=> b!199022 d!68261))

(declare-fun d!68263 () Bool)

(declare-fun e!136999 () Bool)

(assert (=> d!68263 e!136999))

(declare-fun res!167121 () Bool)

(assert (=> d!68263 (=> (not res!167121) (not e!136999))))

(declare-fun lt!311674 () (_ BitVec 64))

(declare-fun lt!311673 () (_ BitVec 64))

(declare-fun lt!311677 () (_ BitVec 64))

(assert (=> d!68263 (= res!167121 (= lt!311677 (bvsub lt!311673 lt!311674)))))

(assert (=> d!68263 (or (= (bvand lt!311673 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311674 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311673 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311673 lt!311674) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68263 (= lt!311674 (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310578)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!310578))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!310578)))))))

(declare-fun lt!311676 () (_ BitVec 64))

(declare-fun lt!311672 () (_ BitVec 64))

(assert (=> d!68263 (= lt!311673 (bvmul lt!311676 lt!311672))))

(assert (=> d!68263 (or (= lt!311676 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311672 (bvsdiv (bvmul lt!311676 lt!311672) lt!311676)))))

(assert (=> d!68263 (= lt!311672 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68263 (= lt!311676 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310578)))))))

(assert (=> d!68263 (= lt!311677 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!310578))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!310578)))))))

(assert (=> d!68263 (invariant!0 (currentBit!9290 (_2!9202 lt!310578)) (currentByte!9295 (_2!9202 lt!310578)) (size!4456 (buf!4948 (_2!9202 lt!310578))))))

(assert (=> d!68263 (= (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310578))) (currentByte!9295 (_2!9202 lt!310578)) (currentBit!9290 (_2!9202 lt!310578))) lt!311677)))

(declare-fun b!199648 () Bool)

(declare-fun res!167120 () Bool)

(assert (=> b!199648 (=> (not res!167120) (not e!136999))))

(assert (=> b!199648 (= res!167120 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311677))))

(declare-fun b!199649 () Bool)

(declare-fun lt!311675 () (_ BitVec 64))

(assert (=> b!199649 (= e!136999 (bvsle lt!311677 (bvmul lt!311675 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199649 (or (= lt!311675 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311675 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311675)))))

(assert (=> b!199649 (= lt!311675 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310578)))))))

(assert (= (and d!68263 res!167121) b!199648))

(assert (= (and b!199648 res!167120) b!199649))

(declare-fun m!309691 () Bool)

(assert (=> d!68263 m!309691))

(declare-fun m!309693 () Bool)

(assert (=> d!68263 m!309693))

(assert (=> b!199022 d!68263))

(declare-fun d!68265 () Bool)

(declare-fun e!137000 () Bool)

(assert (=> d!68265 e!137000))

(declare-fun res!167123 () Bool)

(assert (=> d!68265 (=> (not res!167123) (not e!137000))))

(declare-fun lt!311683 () (_ BitVec 64))

(declare-fun lt!311679 () (_ BitVec 64))

(declare-fun lt!311680 () (_ BitVec 64))

(assert (=> d!68265 (= res!167123 (= lt!311683 (bvsub lt!311679 lt!311680)))))

(assert (=> d!68265 (or (= (bvand lt!311679 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311680 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311679 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311679 lt!311680) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68265 (= lt!311680 (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 lt!310553))) ((_ sign_extend 32) (currentByte!9295 lt!310553)) ((_ sign_extend 32) (currentBit!9290 lt!310553))))))

(declare-fun lt!311682 () (_ BitVec 64))

(declare-fun lt!311678 () (_ BitVec 64))

(assert (=> d!68265 (= lt!311679 (bvmul lt!311682 lt!311678))))

(assert (=> d!68265 (or (= lt!311682 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311678 (bvsdiv (bvmul lt!311682 lt!311678) lt!311682)))))

(assert (=> d!68265 (= lt!311678 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68265 (= lt!311682 ((_ sign_extend 32) (size!4456 (buf!4948 lt!310553))))))

(assert (=> d!68265 (= lt!311683 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 lt!310553)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 lt!310553))))))

(assert (=> d!68265 (invariant!0 (currentBit!9290 lt!310553) (currentByte!9295 lt!310553) (size!4456 (buf!4948 lt!310553)))))

(assert (=> d!68265 (= (bitIndex!0 (size!4456 (buf!4948 lt!310553)) (currentByte!9295 lt!310553) (currentBit!9290 lt!310553)) lt!311683)))

(declare-fun b!199650 () Bool)

(declare-fun res!167122 () Bool)

(assert (=> b!199650 (=> (not res!167122) (not e!137000))))

(assert (=> b!199650 (= res!167122 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311683))))

(declare-fun b!199651 () Bool)

(declare-fun lt!311681 () (_ BitVec 64))

(assert (=> b!199651 (= e!137000 (bvsle lt!311683 (bvmul lt!311681 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199651 (or (= lt!311681 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311681 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311681)))))

(assert (=> b!199651 (= lt!311681 ((_ sign_extend 32) (size!4456 (buf!4948 lt!310553))))))

(assert (= (and d!68265 res!167123) b!199650))

(assert (= (and b!199650 res!167122) b!199651))

(declare-fun m!309695 () Bool)

(assert (=> d!68265 m!309695))

(declare-fun m!309697 () Bool)

(assert (=> d!68265 m!309697))

(assert (=> d!67705 d!68265))

(declare-fun d!68267 () Bool)

(declare-fun e!137001 () Bool)

(assert (=> d!68267 e!137001))

(declare-fun res!167125 () Bool)

(assert (=> d!68267 (=> (not res!167125) (not e!137001))))

(declare-fun lt!311686 () (_ BitVec 64))

(declare-fun lt!311685 () (_ BitVec 64))

(declare-fun lt!311689 () (_ BitVec 64))

(assert (=> d!68267 (= res!167125 (= lt!311689 (bvsub lt!311685 lt!311686)))))

(assert (=> d!68267 (or (= (bvand lt!311685 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311686 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311685 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311685 lt!311686) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68267 (= lt!311686 (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9203 lt!309516)))) ((_ sign_extend 32) (currentByte!9295 (_2!9203 lt!309516))) ((_ sign_extend 32) (currentBit!9290 (_2!9203 lt!309516)))))))

(declare-fun lt!311688 () (_ BitVec 64))

(declare-fun lt!311684 () (_ BitVec 64))

(assert (=> d!68267 (= lt!311685 (bvmul lt!311688 lt!311684))))

(assert (=> d!68267 (or (= lt!311688 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311684 (bvsdiv (bvmul lt!311688 lt!311684) lt!311688)))))

(assert (=> d!68267 (= lt!311684 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68267 (= lt!311688 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9203 lt!309516)))))))

(assert (=> d!68267 (= lt!311689 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 (_2!9203 lt!309516))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 (_2!9203 lt!309516)))))))

(assert (=> d!68267 (invariant!0 (currentBit!9290 (_2!9203 lt!309516)) (currentByte!9295 (_2!9203 lt!309516)) (size!4456 (buf!4948 (_2!9203 lt!309516))))))

(assert (=> d!68267 (= (bitIndex!0 (size!4456 (buf!4948 (_2!9203 lt!309516))) (currentByte!9295 (_2!9203 lt!309516)) (currentBit!9290 (_2!9203 lt!309516))) lt!311689)))

(declare-fun b!199652 () Bool)

(declare-fun res!167124 () Bool)

(assert (=> b!199652 (=> (not res!167124) (not e!137001))))

(assert (=> b!199652 (= res!167124 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311689))))

(declare-fun b!199653 () Bool)

(declare-fun lt!311687 () (_ BitVec 64))

(assert (=> b!199653 (= e!137001 (bvsle lt!311689 (bvmul lt!311687 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199653 (or (= lt!311687 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311687 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311687)))))

(assert (=> b!199653 (= lt!311687 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9203 lt!309516)))))))

(assert (= (and d!68267 res!167125) b!199652))

(assert (= (and b!199652 res!167124) b!199653))

(declare-fun m!309699 () Bool)

(assert (=> d!68267 m!309699))

(declare-fun m!309701 () Bool)

(assert (=> d!68267 m!309701))

(assert (=> d!67705 d!68267))

(declare-fun d!68269 () Bool)

(declare-fun lt!311707 () (_ BitVec 32))

(assert (=> d!68269 (= lt!311707 ((_ extract 31 0) (bvsrem (bvsub lt!309506 lt!309525) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!311703 () (_ BitVec 32))

(assert (=> d!68269 (= lt!311703 ((_ extract 31 0) (bvsdiv (bvsub lt!309506 lt!309525) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!137007 () Bool)

(assert (=> d!68269 e!137007))

(declare-fun res!167131 () Bool)

(assert (=> d!68269 (=> (not res!167131) (not e!137007))))

(assert (=> d!68269 (= res!167131 (moveBitIndexPrecond!0 (_2!9203 lt!309516) (bvsub lt!309506 lt!309525)))))

(declare-fun Unit!14167 () Unit!14058)

(declare-fun Unit!14168 () Unit!14058)

(declare-fun Unit!14169 () Unit!14058)

(assert (=> d!68269 (= (moveBitIndex!0 (_2!9203 lt!309516) (bvsub lt!309506 lt!309525)) (ite (bvslt (bvadd (currentBit!9290 (_2!9203 lt!309516)) lt!311707) #b00000000000000000000000000000000) (tuple2!17109 Unit!14167 (BitStream!8021 (buf!4948 (_2!9203 lt!309516)) (bvsub (bvadd (currentByte!9295 (_2!9203 lt!309516)) lt!311703) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!311707 (currentBit!9290 (_2!9203 lt!309516))))) (ite (bvsge (bvadd (currentBit!9290 (_2!9203 lt!309516)) lt!311707) #b00000000000000000000000000001000) (tuple2!17109 Unit!14168 (BitStream!8021 (buf!4948 (_2!9203 lt!309516)) (bvadd (currentByte!9295 (_2!9203 lt!309516)) lt!311703 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9290 (_2!9203 lt!309516)) lt!311707) #b00000000000000000000000000001000))) (tuple2!17109 Unit!14169 (BitStream!8021 (buf!4948 (_2!9203 lt!309516)) (bvadd (currentByte!9295 (_2!9203 lt!309516)) lt!311703) (bvadd (currentBit!9290 (_2!9203 lt!309516)) lt!311707))))))))

(declare-fun b!199658 () Bool)

(declare-fun e!137006 () Bool)

(assert (=> b!199658 (= e!137007 e!137006)))

(declare-fun res!167130 () Bool)

(assert (=> b!199658 (=> (not res!167130) (not e!137006))))

(declare-fun lt!311705 () tuple2!17108)

(declare-fun lt!311704 () (_ BitVec 64))

(assert (=> b!199658 (= res!167130 (= (bvadd lt!311704 (bvsub lt!309506 lt!309525)) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!311705))) (currentByte!9295 (_2!9202 lt!311705)) (currentBit!9290 (_2!9202 lt!311705)))))))

(assert (=> b!199658 (or (not (= (bvand lt!311704 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309506 lt!309525) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311704 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311704 (bvsub lt!309506 lt!309525)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199658 (= lt!311704 (bitIndex!0 (size!4456 (buf!4948 (_2!9203 lt!309516))) (currentByte!9295 (_2!9203 lt!309516)) (currentBit!9290 (_2!9203 lt!309516))))))

(declare-fun lt!311702 () (_ BitVec 32))

(declare-fun lt!311706 () (_ BitVec 32))

(declare-fun Unit!14170 () Unit!14058)

(declare-fun Unit!14171 () Unit!14058)

(declare-fun Unit!14172 () Unit!14058)

(assert (=> b!199658 (= lt!311705 (ite (bvslt (bvadd (currentBit!9290 (_2!9203 lt!309516)) lt!311706) #b00000000000000000000000000000000) (tuple2!17109 Unit!14170 (BitStream!8021 (buf!4948 (_2!9203 lt!309516)) (bvsub (bvadd (currentByte!9295 (_2!9203 lt!309516)) lt!311702) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!311706 (currentBit!9290 (_2!9203 lt!309516))))) (ite (bvsge (bvadd (currentBit!9290 (_2!9203 lt!309516)) lt!311706) #b00000000000000000000000000001000) (tuple2!17109 Unit!14171 (BitStream!8021 (buf!4948 (_2!9203 lt!309516)) (bvadd (currentByte!9295 (_2!9203 lt!309516)) lt!311702 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9290 (_2!9203 lt!309516)) lt!311706) #b00000000000000000000000000001000))) (tuple2!17109 Unit!14172 (BitStream!8021 (buf!4948 (_2!9203 lt!309516)) (bvadd (currentByte!9295 (_2!9203 lt!309516)) lt!311702) (bvadd (currentBit!9290 (_2!9203 lt!309516)) lt!311706))))))))

(assert (=> b!199658 (= lt!311706 ((_ extract 31 0) (bvsrem (bvsub lt!309506 lt!309525) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199658 (= lt!311702 ((_ extract 31 0) (bvsdiv (bvsub lt!309506 lt!309525) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!199659 () Bool)

(assert (=> b!199659 (= e!137006 (and (= (size!4456 (buf!4948 (_2!9203 lt!309516))) (size!4456 (buf!4948 (_2!9202 lt!311705)))) (= (buf!4948 (_2!9203 lt!309516)) (buf!4948 (_2!9202 lt!311705)))))))

(assert (= (and d!68269 res!167131) b!199658))

(assert (= (and b!199658 res!167130) b!199659))

(assert (=> d!68269 m!308315))

(declare-fun m!309703 () Bool)

(assert (=> b!199658 m!309703))

(assert (=> b!199658 m!308311))

(assert (=> d!67705 d!68269))

(declare-fun d!68273 () Bool)

(declare-fun res!167134 () Bool)

(declare-fun e!137010 () Bool)

(assert (=> d!68273 (=> (not res!167134) (not e!137010))))

(assert (=> d!68273 (= res!167134 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9203 lt!309516))))) (bvsub lt!309506 lt!309525)) (bvsle (bvsub lt!309506 lt!309525) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9203 lt!309516))))))))))

(assert (=> d!68273 (= (moveBitIndexPrecond!0 (_2!9203 lt!309516) (bvsub lt!309506 lt!309525)) e!137010)))

(declare-fun b!199663 () Bool)

(declare-fun lt!311710 () (_ BitVec 64))

(assert (=> b!199663 (= e!137010 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311710) (bvsle lt!311710 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9203 lt!309516))))))))))

(assert (=> b!199663 (= lt!311710 (bvadd (bitIndex!0 (size!4456 (buf!4948 (_2!9203 lt!309516))) (currentByte!9295 (_2!9203 lt!309516)) (currentBit!9290 (_2!9203 lt!309516))) (bvsub lt!309506 lt!309525)))))

(assert (= (and d!68273 res!167134) b!199663))

(assert (=> b!199663 m!308311))

(assert (=> d!67705 d!68273))

(assert (=> d!67619 d!67599))

(declare-fun d!68275 () Bool)

(assert (=> d!68275 (validate_offset_bits!1 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!309509)))) ((_ sign_extend 32) (currentByte!9295 thiss!1204)) ((_ sign_extend 32) (currentBit!9290 thiss!1204)) lt!309513)))

(assert (=> d!68275 true))

(declare-fun _$6!383 () Unit!14058)

(assert (=> d!68275 (= (choose!9 thiss!1204 (buf!4948 (_2!9202 lt!309509)) lt!309513 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204))) _$6!383)))

(declare-fun bs!16835 () Bool)

(assert (= bs!16835 d!68275))

(assert (=> bs!16835 m!307515))

(assert (=> d!67619 d!68275))

(declare-fun d!68277 () Bool)

(assert (=> d!68277 (= (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 thiss!1204))) ((_ sign_extend 32) (currentByte!9295 thiss!1204)) ((_ sign_extend 32) (currentBit!9290 thiss!1204))) (bvsub (bvmul ((_ sign_extend 32) (size!4456 (buf!4948 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 thiss!1204)))))))

(assert (=> d!67709 d!68277))

(assert (=> d!67709 d!67703))

(declare-fun d!68279 () Bool)

(declare-fun res!167135 () Bool)

(declare-fun e!137012 () Bool)

(assert (=> d!68279 (=> (not res!167135) (not e!137012))))

(assert (=> d!68279 (= res!167135 (= (size!4456 (buf!4948 (_1!9203 lt!309982))) (size!4456 (buf!4948 thiss!1204))))))

(assert (=> d!68279 (= (isPrefixOf!0 (_1!9203 lt!309982) thiss!1204) e!137012)))

(declare-fun b!199664 () Bool)

(declare-fun res!167137 () Bool)

(assert (=> b!199664 (=> (not res!167137) (not e!137012))))

(assert (=> b!199664 (= res!167137 (bvsle (bitIndex!0 (size!4456 (buf!4948 (_1!9203 lt!309982))) (currentByte!9295 (_1!9203 lt!309982)) (currentBit!9290 (_1!9203 lt!309982))) (bitIndex!0 (size!4456 (buf!4948 thiss!1204)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204))))))

(declare-fun b!199665 () Bool)

(declare-fun e!137011 () Bool)

(assert (=> b!199665 (= e!137012 e!137011)))

(declare-fun res!167136 () Bool)

(assert (=> b!199665 (=> res!167136 e!137011)))

(assert (=> b!199665 (= res!167136 (= (size!4456 (buf!4948 (_1!9203 lt!309982))) #b00000000000000000000000000000000))))

(declare-fun b!199666 () Bool)

(assert (=> b!199666 (= e!137011 (arrayBitRangesEq!0 (buf!4948 (_1!9203 lt!309982)) (buf!4948 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4456 (buf!4948 (_1!9203 lt!309982))) (currentByte!9295 (_1!9203 lt!309982)) (currentBit!9290 (_1!9203 lt!309982)))))))

(assert (= (and d!68279 res!167135) b!199664))

(assert (= (and b!199664 res!167137) b!199665))

(assert (= (and b!199665 (not res!167136)) b!199666))

(declare-fun m!309705 () Bool)

(assert (=> b!199664 m!309705))

(assert (=> b!199664 m!307541))

(assert (=> b!199666 m!309705))

(assert (=> b!199666 m!309705))

(declare-fun m!309707 () Bool)

(assert (=> b!199666 m!309707))

(assert (=> b!198821 d!68279))

(declare-fun d!68281 () Bool)

(declare-fun e!137019 () Bool)

(assert (=> d!68281 e!137019))

(declare-fun res!167140 () Bool)

(assert (=> d!68281 (=> (not res!167140) (not e!137019))))

(declare-fun increaseBitIndex!0 (BitStream!8020) tuple2!17108)

(assert (=> d!68281 (= res!167140 (= (buf!4948 (_2!9202 (increaseBitIndex!0 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204))))) (buf!4948 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204)))))))

(declare-fun lt!311730 () Bool)

(assert (=> d!68281 (= lt!311730 (not (= (bvand ((_ sign_extend 24) (select (arr!5386 (buf!4948 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204)))) (currentByte!9295 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9290 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!311725 () tuple2!17136)

(assert (=> d!68281 (= lt!311725 (tuple2!17137 (not (= (bvand ((_ sign_extend 24) (select (arr!5386 (buf!4948 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204)))) (currentByte!9295 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9290 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204)))))) #b00000000000000000000000000000000)) (_2!9202 (increaseBitIndex!0 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204))))))))

(assert (=> d!68281 (validate_offset_bit!0 ((_ sign_extend 32) (size!4456 (buf!4948 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204))))) ((_ sign_extend 32) (currentByte!9295 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204)))) ((_ sign_extend 32) (currentBit!9290 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204)))))))

(assert (=> d!68281 (= (readBit!0 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204))) lt!311725)))

(declare-fun lt!311727 () (_ BitVec 64))

(declare-fun lt!311729 () (_ BitVec 64))

(declare-fun b!199669 () Bool)

(assert (=> b!199669 (= e!137019 (= (bitIndex!0 (size!4456 (buf!4948 (_2!9202 (increaseBitIndex!0 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204)))))) (currentByte!9295 (_2!9202 (increaseBitIndex!0 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204))))) (currentBit!9290 (_2!9202 (increaseBitIndex!0 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204)))))) (bvadd lt!311729 lt!311727)))))

(assert (=> b!199669 (or (not (= (bvand lt!311729 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311727 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311729 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311729 lt!311727) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199669 (= lt!311727 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!199669 (= lt!311729 (bitIndex!0 (size!4456 (buf!4948 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204)))) (currentByte!9295 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204))) (currentBit!9290 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204)))))))

(declare-fun lt!311728 () Bool)

(assert (=> b!199669 (= lt!311728 (not (= (bvand ((_ sign_extend 24) (select (arr!5386 (buf!4948 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204)))) (currentByte!9295 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9290 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!311731 () Bool)

(assert (=> b!199669 (= lt!311731 (not (= (bvand ((_ sign_extend 24) (select (arr!5386 (buf!4948 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204)))) (currentByte!9295 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9290 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!311726 () Bool)

(assert (=> b!199669 (= lt!311726 (not (= (bvand ((_ sign_extend 24) (select (arr!5386 (buf!4948 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204)))) (currentByte!9295 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9290 (readerFrom!0 (_2!9202 lt!309529) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!68281 res!167140) b!199669))

(assert (=> d!68281 m!307557))

(declare-fun m!309709 () Bool)

(assert (=> d!68281 m!309709))

(declare-fun m!309711 () Bool)

(assert (=> d!68281 m!309711))

(declare-fun m!309713 () Bool)

(assert (=> d!68281 m!309713))

(declare-fun m!309715 () Bool)

(assert (=> d!68281 m!309715))

(assert (=> b!199669 m!307557))

(assert (=> b!199669 m!309709))

(declare-fun m!309717 () Bool)

(assert (=> b!199669 m!309717))

(declare-fun m!309719 () Bool)

(assert (=> b!199669 m!309719))

(assert (=> b!199669 m!309711))

(assert (=> b!199669 m!309713))

(assert (=> d!67583 d!68281))

(declare-fun d!68283 () Bool)

(assert (=> d!68283 (= (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!309523)))) ((_ sign_extend 32) (currentByte!9295 (_1!9205 lt!309523))) ((_ sign_extend 32) (currentBit!9290 (_1!9205 lt!309523)))) (bvsub (bvmul ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!309523)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 (_1!9205 lt!309523))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 (_1!9205 lt!309523))))))))

(assert (=> d!67635 d!68283))

(declare-fun d!68285 () Bool)

(assert (=> d!68285 (= (invariant!0 (currentBit!9290 (_1!9205 lt!309523)) (currentByte!9295 (_1!9205 lt!309523)) (size!4456 (buf!4948 (_1!9205 lt!309523)))) (and (bvsge (currentBit!9290 (_1!9205 lt!309523)) #b00000000000000000000000000000000) (bvslt (currentBit!9290 (_1!9205 lt!309523)) #b00000000000000000000000000001000) (bvsge (currentByte!9295 (_1!9205 lt!309523)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9295 (_1!9205 lt!309523)) (size!4456 (buf!4948 (_1!9205 lt!309523)))) (and (= (currentBit!9290 (_1!9205 lt!309523)) #b00000000000000000000000000000000) (= (currentByte!9295 (_1!9205 lt!309523)) (size!4456 (buf!4948 (_1!9205 lt!309523))))))))))

(assert (=> d!67635 d!68285))

(assert (=> b!199044 d!67707))

(assert (=> b!199044 d!67637))

(declare-fun b!199681 () Bool)

(declare-fun e!137030 () Bool)

(declare-fun e!137028 () Bool)

(assert (=> b!199681 (= e!137030 e!137028)))

(declare-fun res!167151 () Bool)

(assert (=> b!199681 (=> (not res!167151) (not e!137028))))

(declare-fun _$19!168 () tuple2!17108)

(declare-fun lt!311734 () tuple2!17114)

(assert (=> b!199681 (= res!167151 (and (= (_2!9205 lt!311734) lt!309530) (= (_1!9205 lt!311734) (_2!9202 _$19!168))))))

(assert (=> b!199681 (= lt!311734 (readBitPure!0 (readerFrom!0 (_2!9202 _$19!168) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204))))))

(declare-fun d!68287 () Bool)

(assert (=> d!68287 e!137030))

(declare-fun res!167149 () Bool)

(assert (=> d!68287 (=> (not res!167149) (not e!137030))))

(assert (=> d!68287 (= res!167149 (= (size!4456 (buf!4948 thiss!1204)) (size!4456 (buf!4948 (_2!9202 _$19!168)))))))

(declare-fun e!137031 () Bool)

(assert (=> d!68287 (and (inv!12 (_2!9202 _$19!168)) e!137031)))

(assert (=> d!68287 (= (choose!16 thiss!1204 lt!309530) _$19!168)))

(declare-fun b!199682 () Bool)

(assert (=> b!199682 (= e!137028 (= (bitIndex!0 (size!4456 (buf!4948 (_1!9205 lt!311734))) (currentByte!9295 (_1!9205 lt!311734)) (currentBit!9290 (_1!9205 lt!311734))) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 _$19!168))) (currentByte!9295 (_2!9202 _$19!168)) (currentBit!9290 (_2!9202 _$19!168)))))))

(declare-fun b!199683 () Bool)

(declare-fun res!167152 () Bool)

(assert (=> b!199683 (=> (not res!167152) (not e!137030))))

(assert (=> b!199683 (= res!167152 (isPrefixOf!0 thiss!1204 (_2!9202 _$19!168)))))

(declare-fun b!199684 () Bool)

(assert (=> b!199684 (= e!137031 (array_inv!4197 (buf!4948 (_2!9202 _$19!168))))))

(declare-fun b!199685 () Bool)

(declare-fun res!167150 () Bool)

(assert (=> b!199685 (=> (not res!167150) (not e!137030))))

(assert (=> b!199685 (= res!167150 (= (bitIndex!0 (size!4456 (buf!4948 (_2!9202 _$19!168))) (currentByte!9295 (_2!9202 _$19!168)) (currentBit!9290 (_2!9202 _$19!168))) (bvadd (bitIndex!0 (size!4456 (buf!4948 thiss!1204)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= d!68287 b!199684))

(assert (= (and d!68287 res!167149) b!199685))

(assert (= (and b!199685 res!167150) b!199683))

(assert (= (and b!199683 res!167152) b!199681))

(assert (= (and b!199681 res!167151) b!199682))

(declare-fun m!309721 () Bool)

(assert (=> b!199684 m!309721))

(declare-fun m!309723 () Bool)

(assert (=> b!199683 m!309723))

(declare-fun m!309725 () Bool)

(assert (=> b!199685 m!309725))

(assert (=> b!199685 m!307541))

(declare-fun m!309727 () Bool)

(assert (=> b!199682 m!309727))

(assert (=> b!199682 m!309725))

(declare-fun m!309729 () Bool)

(assert (=> d!68287 m!309729))

(declare-fun m!309731 () Bool)

(assert (=> b!199681 m!309731))

(assert (=> b!199681 m!309731))

(declare-fun m!309733 () Bool)

(assert (=> b!199681 m!309733))

(assert (=> d!67711 d!68287))

(declare-fun d!68289 () Bool)

(assert (=> d!68289 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4456 (buf!4948 thiss!1204))) ((_ sign_extend 32) (currentByte!9295 thiss!1204)) ((_ sign_extend 32) (currentBit!9290 thiss!1204))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 thiss!1204))) ((_ sign_extend 32) (currentByte!9295 thiss!1204)) ((_ sign_extend 32) (currentBit!9290 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!16836 () Bool)

(assert (= bs!16836 d!68289))

(assert (=> bs!16836 m!308319))

(assert (=> d!67711 d!68289))

(declare-fun d!68291 () Bool)

(declare-fun e!137032 () Bool)

(assert (=> d!68291 e!137032))

(declare-fun res!167154 () Bool)

(assert (=> d!68291 (=> (not res!167154) (not e!137032))))

(declare-fun lt!311736 () (_ BitVec 64))

(declare-fun lt!311740 () (_ BitVec 64))

(declare-fun lt!311737 () (_ BitVec 64))

(assert (=> d!68291 (= res!167154 (= lt!311740 (bvsub lt!311736 lt!311737)))))

(assert (=> d!68291 (or (= (bvand lt!311736 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311737 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311736 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311736 lt!311737) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68291 (= lt!311737 (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 lt!310690))) ((_ sign_extend 32) (currentByte!9295 lt!310690)) ((_ sign_extend 32) (currentBit!9290 lt!310690))))))

(declare-fun lt!311739 () (_ BitVec 64))

(declare-fun lt!311735 () (_ BitVec 64))

(assert (=> d!68291 (= lt!311736 (bvmul lt!311739 lt!311735))))

(assert (=> d!68291 (or (= lt!311739 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311735 (bvsdiv (bvmul lt!311739 lt!311735) lt!311739)))))

(assert (=> d!68291 (= lt!311735 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68291 (= lt!311739 ((_ sign_extend 32) (size!4456 (buf!4948 lt!310690))))))

(assert (=> d!68291 (= lt!311740 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 lt!310690)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 lt!310690))))))

(assert (=> d!68291 (invariant!0 (currentBit!9290 lt!310690) (currentByte!9295 lt!310690) (size!4456 (buf!4948 lt!310690)))))

(assert (=> d!68291 (= (bitIndex!0 (size!4456 (buf!4948 lt!310690)) (currentByte!9295 lt!310690) (currentBit!9290 lt!310690)) lt!311740)))

(declare-fun b!199686 () Bool)

(declare-fun res!167153 () Bool)

(assert (=> b!199686 (=> (not res!167153) (not e!137032))))

(assert (=> b!199686 (= res!167153 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311740))))

(declare-fun b!199687 () Bool)

(declare-fun lt!311738 () (_ BitVec 64))

(assert (=> b!199687 (= e!137032 (bvsle lt!311740 (bvmul lt!311738 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199687 (or (= lt!311738 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311738 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311738)))))

(assert (=> b!199687 (= lt!311738 ((_ sign_extend 32) (size!4456 (buf!4948 lt!310690))))))

(assert (= (and d!68291 res!167154) b!199686))

(assert (= (and b!199686 res!167153) b!199687))

(declare-fun m!309735 () Bool)

(assert (=> d!68291 m!309735))

(declare-fun m!309737 () Bool)

(assert (=> d!68291 m!309737))

(assert (=> d!67733 d!68291))

(declare-fun d!68293 () Bool)

(declare-fun e!137033 () Bool)

(assert (=> d!68293 e!137033))

(declare-fun res!167156 () Bool)

(assert (=> d!68293 (=> (not res!167156) (not e!137033))))

(declare-fun lt!311746 () (_ BitVec 64))

(declare-fun lt!311743 () (_ BitVec 64))

(declare-fun lt!311742 () (_ BitVec 64))

(assert (=> d!68293 (= res!167156 (= lt!311746 (bvsub lt!311742 lt!311743)))))

(assert (=> d!68293 (or (= (bvand lt!311742 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311743 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311742 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311742 lt!311743) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68293 (= lt!311743 (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9203 lt!309512)))) ((_ sign_extend 32) (currentByte!9295 (_2!9203 lt!309512))) ((_ sign_extend 32) (currentBit!9290 (_2!9203 lt!309512)))))))

(declare-fun lt!311745 () (_ BitVec 64))

(declare-fun lt!311741 () (_ BitVec 64))

(assert (=> d!68293 (= lt!311742 (bvmul lt!311745 lt!311741))))

(assert (=> d!68293 (or (= lt!311745 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311741 (bvsdiv (bvmul lt!311745 lt!311741) lt!311745)))))

(assert (=> d!68293 (= lt!311741 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68293 (= lt!311745 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9203 lt!309512)))))))

(assert (=> d!68293 (= lt!311746 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 (_2!9203 lt!309512))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 (_2!9203 lt!309512)))))))

(assert (=> d!68293 (invariant!0 (currentBit!9290 (_2!9203 lt!309512)) (currentByte!9295 (_2!9203 lt!309512)) (size!4456 (buf!4948 (_2!9203 lt!309512))))))

(assert (=> d!68293 (= (bitIndex!0 (size!4456 (buf!4948 (_2!9203 lt!309512))) (currentByte!9295 (_2!9203 lt!309512)) (currentBit!9290 (_2!9203 lt!309512))) lt!311746)))

(declare-fun b!199688 () Bool)

(declare-fun res!167155 () Bool)

(assert (=> b!199688 (=> (not res!167155) (not e!137033))))

(assert (=> b!199688 (= res!167155 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311746))))

(declare-fun b!199689 () Bool)

(declare-fun lt!311744 () (_ BitVec 64))

(assert (=> b!199689 (= e!137033 (bvsle lt!311746 (bvmul lt!311744 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199689 (or (= lt!311744 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311744 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311744)))))

(assert (=> b!199689 (= lt!311744 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9203 lt!309512)))))))

(assert (= (and d!68293 res!167156) b!199688))

(assert (= (and b!199688 res!167155) b!199689))

(declare-fun m!309739 () Bool)

(assert (=> d!68293 m!309739))

(declare-fun m!309741 () Bool)

(assert (=> d!68293 m!309741))

(assert (=> d!67733 d!68293))

(declare-fun d!68295 () Bool)

(declare-fun lt!311752 () (_ BitVec 32))

(assert (=> d!68295 (= lt!311752 ((_ extract 31 0) (bvsrem (bvsub lt!309526 lt!309525) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!311748 () (_ BitVec 32))

(assert (=> d!68295 (= lt!311748 ((_ extract 31 0) (bvsdiv (bvsub lt!309526 lt!309525) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!137035 () Bool)

(assert (=> d!68295 e!137035))

(declare-fun res!167158 () Bool)

(assert (=> d!68295 (=> (not res!167158) (not e!137035))))

(assert (=> d!68295 (= res!167158 (moveBitIndexPrecond!0 (_2!9203 lt!309512) (bvsub lt!309526 lt!309525)))))

(declare-fun Unit!14173 () Unit!14058)

(declare-fun Unit!14174 () Unit!14058)

(declare-fun Unit!14175 () Unit!14058)

(assert (=> d!68295 (= (moveBitIndex!0 (_2!9203 lt!309512) (bvsub lt!309526 lt!309525)) (ite (bvslt (bvadd (currentBit!9290 (_2!9203 lt!309512)) lt!311752) #b00000000000000000000000000000000) (tuple2!17109 Unit!14173 (BitStream!8021 (buf!4948 (_2!9203 lt!309512)) (bvsub (bvadd (currentByte!9295 (_2!9203 lt!309512)) lt!311748) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!311752 (currentBit!9290 (_2!9203 lt!309512))))) (ite (bvsge (bvadd (currentBit!9290 (_2!9203 lt!309512)) lt!311752) #b00000000000000000000000000001000) (tuple2!17109 Unit!14174 (BitStream!8021 (buf!4948 (_2!9203 lt!309512)) (bvadd (currentByte!9295 (_2!9203 lt!309512)) lt!311748 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9290 (_2!9203 lt!309512)) lt!311752) #b00000000000000000000000000001000))) (tuple2!17109 Unit!14175 (BitStream!8021 (buf!4948 (_2!9203 lt!309512)) (bvadd (currentByte!9295 (_2!9203 lt!309512)) lt!311748) (bvadd (currentBit!9290 (_2!9203 lt!309512)) lt!311752))))))))

(declare-fun b!199690 () Bool)

(declare-fun e!137034 () Bool)

(assert (=> b!199690 (= e!137035 e!137034)))

(declare-fun res!167157 () Bool)

(assert (=> b!199690 (=> (not res!167157) (not e!137034))))

(declare-fun lt!311749 () (_ BitVec 64))

(declare-fun lt!311750 () tuple2!17108)

(assert (=> b!199690 (= res!167157 (= (bvadd lt!311749 (bvsub lt!309526 lt!309525)) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!311750))) (currentByte!9295 (_2!9202 lt!311750)) (currentBit!9290 (_2!9202 lt!311750)))))))

(assert (=> b!199690 (or (not (= (bvand lt!311749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309526 lt!309525) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311749 (bvsub lt!309526 lt!309525)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199690 (= lt!311749 (bitIndex!0 (size!4456 (buf!4948 (_2!9203 lt!309512))) (currentByte!9295 (_2!9203 lt!309512)) (currentBit!9290 (_2!9203 lt!309512))))))

(declare-fun lt!311751 () (_ BitVec 32))

(declare-fun lt!311747 () (_ BitVec 32))

(declare-fun Unit!14176 () Unit!14058)

(declare-fun Unit!14177 () Unit!14058)

(declare-fun Unit!14178 () Unit!14058)

(assert (=> b!199690 (= lt!311750 (ite (bvslt (bvadd (currentBit!9290 (_2!9203 lt!309512)) lt!311751) #b00000000000000000000000000000000) (tuple2!17109 Unit!14176 (BitStream!8021 (buf!4948 (_2!9203 lt!309512)) (bvsub (bvadd (currentByte!9295 (_2!9203 lt!309512)) lt!311747) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!311751 (currentBit!9290 (_2!9203 lt!309512))))) (ite (bvsge (bvadd (currentBit!9290 (_2!9203 lt!309512)) lt!311751) #b00000000000000000000000000001000) (tuple2!17109 Unit!14177 (BitStream!8021 (buf!4948 (_2!9203 lt!309512)) (bvadd (currentByte!9295 (_2!9203 lt!309512)) lt!311747 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9290 (_2!9203 lt!309512)) lt!311751) #b00000000000000000000000000001000))) (tuple2!17109 Unit!14178 (BitStream!8021 (buf!4948 (_2!9203 lt!309512)) (bvadd (currentByte!9295 (_2!9203 lt!309512)) lt!311747) (bvadd (currentBit!9290 (_2!9203 lt!309512)) lt!311751))))))))

(assert (=> b!199690 (= lt!311751 ((_ extract 31 0) (bvsrem (bvsub lt!309526 lt!309525) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199690 (= lt!311747 ((_ extract 31 0) (bvsdiv (bvsub lt!309526 lt!309525) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!199691 () Bool)

(assert (=> b!199691 (= e!137034 (and (= (size!4456 (buf!4948 (_2!9203 lt!309512))) (size!4456 (buf!4948 (_2!9202 lt!311750)))) (= (buf!4948 (_2!9203 lt!309512)) (buf!4948 (_2!9202 lt!311750)))))))

(assert (= (and d!68295 res!167158) b!199690))

(assert (= (and b!199690 res!167157) b!199691))

(assert (=> d!68295 m!308363))

(declare-fun m!309743 () Bool)

(assert (=> b!199690 m!309743))

(assert (=> b!199690 m!308359))

(assert (=> d!67733 d!68295))

(declare-fun d!68297 () Bool)

(declare-fun res!167159 () Bool)

(declare-fun e!137036 () Bool)

(assert (=> d!68297 (=> (not res!167159) (not e!137036))))

(assert (=> d!68297 (= res!167159 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9203 lt!309512))))) (bvsub lt!309526 lt!309525)) (bvsle (bvsub lt!309526 lt!309525) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9203 lt!309512))))))))))

(assert (=> d!68297 (= (moveBitIndexPrecond!0 (_2!9203 lt!309512) (bvsub lt!309526 lt!309525)) e!137036)))

(declare-fun b!199692 () Bool)

(declare-fun lt!311753 () (_ BitVec 64))

(assert (=> b!199692 (= e!137036 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311753) (bvsle lt!311753 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9203 lt!309512))))))))))

(assert (=> b!199692 (= lt!311753 (bvadd (bitIndex!0 (size!4456 (buf!4948 (_2!9203 lt!309512))) (currentByte!9295 (_2!9203 lt!309512)) (currentBit!9290 (_2!9203 lt!309512))) (bvsub lt!309526 lt!309525)))))

(assert (= (and d!68297 res!167159) b!199692))

(assert (=> b!199692 m!308359))

(assert (=> d!67733 d!68297))

(declare-fun d!68299 () Bool)

(declare-fun res!167160 () Bool)

(declare-fun e!137038 () Bool)

(assert (=> d!68299 (=> (not res!167160) (not e!137038))))

(assert (=> d!68299 (= res!167160 (= (size!4456 (buf!4948 thiss!1204)) (size!4456 (buf!4948 (_2!9202 lt!310578)))))))

(assert (=> d!68299 (= (isPrefixOf!0 thiss!1204 (_2!9202 lt!310578)) e!137038)))

(declare-fun b!199693 () Bool)

(declare-fun res!167162 () Bool)

(assert (=> b!199693 (=> (not res!167162) (not e!137038))))

(assert (=> b!199693 (= res!167162 (bvsle (bitIndex!0 (size!4456 (buf!4948 thiss!1204)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310578))) (currentByte!9295 (_2!9202 lt!310578)) (currentBit!9290 (_2!9202 lt!310578)))))))

(declare-fun b!199694 () Bool)

(declare-fun e!137037 () Bool)

(assert (=> b!199694 (= e!137038 e!137037)))

(declare-fun res!167161 () Bool)

(assert (=> b!199694 (=> res!167161 e!137037)))

(assert (=> b!199694 (= res!167161 (= (size!4456 (buf!4948 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!199695 () Bool)

(assert (=> b!199695 (= e!137037 (arrayBitRangesEq!0 (buf!4948 thiss!1204) (buf!4948 (_2!9202 lt!310578)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4456 (buf!4948 thiss!1204)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204))))))

(assert (= (and d!68299 res!167160) b!199693))

(assert (= (and b!199693 res!167162) b!199694))

(assert (= (and b!199694 (not res!167161)) b!199695))

(assert (=> b!199693 m!307541))

(assert (=> b!199693 m!308325))

(assert (=> b!199695 m!307541))

(assert (=> b!199695 m!307541))

(declare-fun m!309745 () Bool)

(assert (=> b!199695 m!309745))

(assert (=> b!199020 d!68299))

(assert (=> d!67587 d!67623))

(declare-fun d!68301 () Bool)

(assert (=> d!68301 (validate_offset_bits!1 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!309509)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309529))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309529))) lt!309524)))

(assert (=> d!68301 true))

(declare-fun _$6!384 () Unit!14058)

(assert (=> d!68301 (= (choose!9 (_2!9202 lt!309529) (buf!4948 (_2!9202 lt!309509)) lt!309524 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529)))) _$6!384)))

(declare-fun bs!16837 () Bool)

(assert (= bs!16837 d!68301))

(assert (=> bs!16837 m!307527))

(assert (=> d!67587 d!68301))

(declare-fun d!68303 () Bool)

(declare-fun res!167163 () Bool)

(declare-fun e!137040 () Bool)

(assert (=> d!68303 (=> (not res!167163) (not e!137040))))

(assert (=> d!68303 (= res!167163 (= (size!4456 (buf!4948 (_1!9203 lt!310031))) (size!4456 (buf!4948 (_2!9202 lt!309529)))))))

(assert (=> d!68303 (= (isPrefixOf!0 (_1!9203 lt!310031) (_2!9202 lt!309529)) e!137040)))

(declare-fun b!199696 () Bool)

(declare-fun res!167165 () Bool)

(assert (=> b!199696 (=> (not res!167165) (not e!137040))))

(assert (=> b!199696 (= res!167165 (bvsle (bitIndex!0 (size!4456 (buf!4948 (_1!9203 lt!310031))) (currentByte!9295 (_1!9203 lt!310031)) (currentBit!9290 (_1!9203 lt!310031))) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529)))))))

(declare-fun b!199697 () Bool)

(declare-fun e!137039 () Bool)

(assert (=> b!199697 (= e!137040 e!137039)))

(declare-fun res!167164 () Bool)

(assert (=> b!199697 (=> res!167164 e!137039)))

(assert (=> b!199697 (= res!167164 (= (size!4456 (buf!4948 (_1!9203 lt!310031))) #b00000000000000000000000000000000))))

(declare-fun b!199698 () Bool)

(assert (=> b!199698 (= e!137039 (arrayBitRangesEq!0 (buf!4948 (_1!9203 lt!310031)) (buf!4948 (_2!9202 lt!309529)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4456 (buf!4948 (_1!9203 lt!310031))) (currentByte!9295 (_1!9203 lt!310031)) (currentBit!9290 (_1!9203 lt!310031)))))))

(assert (= (and d!68303 res!167163) b!199696))

(assert (= (and b!199696 res!167165) b!199697))

(assert (= (and b!199697 (not res!167164)) b!199698))

(declare-fun m!309747 () Bool)

(assert (=> b!199696 m!309747))

(assert (=> b!199696 m!307539))

(assert (=> b!199698 m!309747))

(assert (=> b!199698 m!309747))

(declare-fun m!309749 () Bool)

(assert (=> b!199698 m!309749))

(assert (=> b!198834 d!68303))

(declare-fun d!68305 () Bool)

(declare-fun e!137041 () Bool)

(assert (=> d!68305 e!137041))

(declare-fun res!167166 () Bool)

(assert (=> d!68305 (=> (not res!167166) (not e!137041))))

(declare-fun lt!311754 () BitStream!8020)

(declare-fun lt!311755 () (_ BitVec 64))

(assert (=> d!68305 (= res!167166 (= (bvadd lt!311755 (bvsub lt!310039 lt!310038)) (bitIndex!0 (size!4456 (buf!4948 lt!311754)) (currentByte!9295 lt!311754) (currentBit!9290 lt!311754))))))

(assert (=> d!68305 (or (not (= (bvand lt!311755 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!310039 lt!310038) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311755 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311755 (bvsub lt!310039 lt!310038)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68305 (= lt!311755 (bitIndex!0 (size!4456 (buf!4948 (_2!9203 lt!310031))) (currentByte!9295 (_2!9203 lt!310031)) (currentBit!9290 (_2!9203 lt!310031))))))

(assert (=> d!68305 (= lt!311754 (_2!9202 (moveBitIndex!0 (_2!9203 lt!310031) (bvsub lt!310039 lt!310038))))))

(assert (=> d!68305 (moveBitIndexPrecond!0 (_2!9203 lt!310031) (bvsub lt!310039 lt!310038))))

(assert (=> d!68305 (= (withMovedBitIndex!0 (_2!9203 lt!310031) (bvsub lt!310039 lt!310038)) lt!311754)))

(declare-fun b!199699 () Bool)

(assert (=> b!199699 (= e!137041 (= (size!4456 (buf!4948 (_2!9203 lt!310031))) (size!4456 (buf!4948 lt!311754))))))

(assert (= (and d!68305 res!167166) b!199699))

(declare-fun m!309751 () Bool)

(assert (=> d!68305 m!309751))

(declare-fun m!309753 () Bool)

(assert (=> d!68305 m!309753))

(declare-fun m!309755 () Bool)

(assert (=> d!68305 m!309755))

(declare-fun m!309757 () Bool)

(assert (=> d!68305 m!309757))

(assert (=> b!198836 d!68305))

(assert (=> b!198836 d!67637))

(assert (=> b!198836 d!67707))

(declare-fun d!68307 () Bool)

(declare-fun e!137042 () Bool)

(assert (=> d!68307 e!137042))

(declare-fun res!167167 () Bool)

(assert (=> d!68307 (=> (not res!167167) (not e!137042))))

(assert (=> d!68307 (= res!167167 (= (buf!4948 (_2!9202 (increaseBitIndex!0 (_1!9203 lt!309512)))) (buf!4948 (_1!9203 lt!309512))))))

(declare-fun lt!311761 () Bool)

(assert (=> d!68307 (= lt!311761 (not (= (bvand ((_ sign_extend 24) (select (arr!5386 (buf!4948 (_1!9203 lt!309512))) (currentByte!9295 (_1!9203 lt!309512)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9290 (_1!9203 lt!309512))))) #b00000000000000000000000000000000)))))

(declare-fun lt!311756 () tuple2!17136)

(assert (=> d!68307 (= lt!311756 (tuple2!17137 (not (= (bvand ((_ sign_extend 24) (select (arr!5386 (buf!4948 (_1!9203 lt!309512))) (currentByte!9295 (_1!9203 lt!309512)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9290 (_1!9203 lt!309512))))) #b00000000000000000000000000000000)) (_2!9202 (increaseBitIndex!0 (_1!9203 lt!309512)))))))

(assert (=> d!68307 (validate_offset_bit!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9203 lt!309512)))) ((_ sign_extend 32) (currentByte!9295 (_1!9203 lt!309512))) ((_ sign_extend 32) (currentBit!9290 (_1!9203 lt!309512))))))

(assert (=> d!68307 (= (readBit!0 (_1!9203 lt!309512)) lt!311756)))

(declare-fun b!199700 () Bool)

(declare-fun lt!311760 () (_ BitVec 64))

(declare-fun lt!311758 () (_ BitVec 64))

(assert (=> b!199700 (= e!137042 (= (bitIndex!0 (size!4456 (buf!4948 (_2!9202 (increaseBitIndex!0 (_1!9203 lt!309512))))) (currentByte!9295 (_2!9202 (increaseBitIndex!0 (_1!9203 lt!309512)))) (currentBit!9290 (_2!9202 (increaseBitIndex!0 (_1!9203 lt!309512))))) (bvadd lt!311760 lt!311758)))))

(assert (=> b!199700 (or (not (= (bvand lt!311760 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311758 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311760 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311760 lt!311758) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199700 (= lt!311758 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!199700 (= lt!311760 (bitIndex!0 (size!4456 (buf!4948 (_1!9203 lt!309512))) (currentByte!9295 (_1!9203 lt!309512)) (currentBit!9290 (_1!9203 lt!309512))))))

(declare-fun lt!311759 () Bool)

(assert (=> b!199700 (= lt!311759 (not (= (bvand ((_ sign_extend 24) (select (arr!5386 (buf!4948 (_1!9203 lt!309512))) (currentByte!9295 (_1!9203 lt!309512)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9290 (_1!9203 lt!309512))))) #b00000000000000000000000000000000)))))

(declare-fun lt!311762 () Bool)

(assert (=> b!199700 (= lt!311762 (not (= (bvand ((_ sign_extend 24) (select (arr!5386 (buf!4948 (_1!9203 lt!309512))) (currentByte!9295 (_1!9203 lt!309512)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9290 (_1!9203 lt!309512))))) #b00000000000000000000000000000000)))))

(declare-fun lt!311757 () Bool)

(assert (=> b!199700 (= lt!311757 (not (= (bvand ((_ sign_extend 24) (select (arr!5386 (buf!4948 (_1!9203 lt!309512))) (currentByte!9295 (_1!9203 lt!309512)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9290 (_1!9203 lt!309512))))) #b00000000000000000000000000000000)))))

(assert (= (and d!68307 res!167167) b!199700))

(declare-fun m!309759 () Bool)

(assert (=> d!68307 m!309759))

(declare-fun m!309761 () Bool)

(assert (=> d!68307 m!309761))

(declare-fun m!309763 () Bool)

(assert (=> d!68307 m!309763))

(declare-fun m!309765 () Bool)

(assert (=> d!68307 m!309765))

(assert (=> b!199700 m!309759))

(assert (=> b!199700 m!308343))

(declare-fun m!309767 () Bool)

(assert (=> b!199700 m!309767))

(assert (=> b!199700 m!309761))

(assert (=> b!199700 m!309763))

(assert (=> d!67633 d!68307))

(declare-fun d!68309 () Bool)

(declare-fun res!167168 () Bool)

(declare-fun e!137044 () Bool)

(assert (=> d!68309 (=> (not res!167168) (not e!137044))))

(assert (=> d!68309 (= res!167168 (= (size!4456 (buf!4948 (_2!9202 lt!309529))) (size!4456 (buf!4948 (_2!9202 lt!310530)))))))

(assert (=> d!68309 (= (isPrefixOf!0 (_2!9202 lt!309529) (_2!9202 lt!310530)) e!137044)))

(declare-fun b!199701 () Bool)

(declare-fun res!167170 () Bool)

(assert (=> b!199701 (=> (not res!167170) (not e!137044))))

(assert (=> b!199701 (= res!167170 (bvsle (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310530))) (currentByte!9295 (_2!9202 lt!310530)) (currentBit!9290 (_2!9202 lt!310530)))))))

(declare-fun b!199702 () Bool)

(declare-fun e!137043 () Bool)

(assert (=> b!199702 (= e!137044 e!137043)))

(declare-fun res!167169 () Bool)

(assert (=> b!199702 (=> res!167169 e!137043)))

(assert (=> b!199702 (= res!167169 (= (size!4456 (buf!4948 (_2!9202 lt!309529))) #b00000000000000000000000000000000))))

(declare-fun b!199703 () Bool)

(assert (=> b!199703 (= e!137043 (arrayBitRangesEq!0 (buf!4948 (_2!9202 lt!309529)) (buf!4948 (_2!9202 lt!310530)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529)))))))

(assert (= (and d!68309 res!167168) b!199701))

(assert (= (and b!199701 res!167170) b!199702))

(assert (= (and b!199702 (not res!167169)) b!199703))

(assert (=> b!199701 m!307539))

(assert (=> b!199701 m!308221))

(assert (=> b!199703 m!307539))

(assert (=> b!199703 m!307539))

(declare-fun m!309769 () Bool)

(assert (=> b!199703 m!309769))

(assert (=> b!199000 d!68309))

(declare-fun d!68311 () Bool)

(assert (=> d!68311 (= (invariant!0 (currentBit!9290 (_2!9202 lt!309529)) (currentByte!9295 (_2!9202 lt!309529)) (size!4456 (buf!4948 (_2!9202 lt!309529)))) (and (bvsge (currentBit!9290 (_2!9202 lt!309529)) #b00000000000000000000000000000000) (bvslt (currentBit!9290 (_2!9202 lt!309529)) #b00000000000000000000000000001000) (bvsge (currentByte!9295 (_2!9202 lt!309529)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9295 (_2!9202 lt!309529)) (size!4456 (buf!4948 (_2!9202 lt!309529)))) (and (= (currentBit!9290 (_2!9202 lt!309529)) #b00000000000000000000000000000000) (= (currentByte!9295 (_2!9202 lt!309529)) (size!4456 (buf!4948 (_2!9202 lt!309529))))))))))

(assert (=> d!67585 d!68311))

(declare-fun d!68313 () Bool)

(declare-fun e!137045 () Bool)

(assert (=> d!68313 e!137045))

(declare-fun res!167172 () Bool)

(assert (=> d!68313 (=> (not res!167172) (not e!137045))))

(declare-fun lt!311768 () (_ BitVec 64))

(declare-fun lt!311764 () (_ BitVec 64))

(declare-fun lt!311765 () (_ BitVec 64))

(assert (=> d!68313 (= res!167172 (= lt!311768 (bvsub lt!311764 lt!311765)))))

(assert (=> d!68313 (or (= (bvand lt!311764 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311765 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311764 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311764 lt!311765) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68313 (= lt!311765 (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310530)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!310530))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!310530)))))))

(declare-fun lt!311767 () (_ BitVec 64))

(declare-fun lt!311763 () (_ BitVec 64))

(assert (=> d!68313 (= lt!311764 (bvmul lt!311767 lt!311763))))

(assert (=> d!68313 (or (= lt!311767 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311763 (bvsdiv (bvmul lt!311767 lt!311763) lt!311767)))))

(assert (=> d!68313 (= lt!311763 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68313 (= lt!311767 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310530)))))))

(assert (=> d!68313 (= lt!311768 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!310530))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!310530)))))))

(assert (=> d!68313 (invariant!0 (currentBit!9290 (_2!9202 lt!310530)) (currentByte!9295 (_2!9202 lt!310530)) (size!4456 (buf!4948 (_2!9202 lt!310530))))))

(assert (=> d!68313 (= (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310530))) (currentByte!9295 (_2!9202 lt!310530)) (currentBit!9290 (_2!9202 lt!310530))) lt!311768)))

(declare-fun b!199704 () Bool)

(declare-fun res!167171 () Bool)

(assert (=> b!199704 (=> (not res!167171) (not e!137045))))

(assert (=> b!199704 (= res!167171 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311768))))

(declare-fun b!199705 () Bool)

(declare-fun lt!311766 () (_ BitVec 64))

(assert (=> b!199705 (= e!137045 (bvsle lt!311768 (bvmul lt!311766 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199705 (or (= lt!311766 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311766 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311766)))))

(assert (=> b!199705 (= lt!311766 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310530)))))))

(assert (= (and d!68313 res!167172) b!199704))

(assert (= (and b!199704 res!167171) b!199705))

(declare-fun m!309771 () Bool)

(assert (=> d!68313 m!309771))

(assert (=> d!68313 m!308297))

(assert (=> b!199002 d!68313))

(assert (=> b!199002 d!67707))

(declare-fun d!68315 () Bool)

(assert (=> d!68315 (= (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!309509)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309509))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309509)))) (bvsub (bvmul ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!309509)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309509))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309509))))))))

(assert (=> d!67637 d!68315))

(assert (=> d!67637 d!67721))

(declare-fun d!68317 () Bool)

(assert (=> d!68317 (= (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!309509)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309529))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309529)))) (bvsub (bvmul ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!309509)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309529))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309529))))))))

(assert (=> d!67623 d!68317))

(assert (=> b!198838 d!67707))

(declare-fun d!68319 () Bool)

(assert (=> d!68319 (arrayBitRangesEq!0 (buf!4948 (_2!9202 lt!309509)) (buf!4948 (_2!9202 lt!309529)) lt!310045 lt!310030)))

(declare-fun lt!311771 () Unit!14058)

(declare-fun choose!8 (array!10112 array!10112 (_ BitVec 64) (_ BitVec 64)) Unit!14058)

(assert (=> d!68319 (= lt!311771 (choose!8 (buf!4948 (_2!9202 lt!309529)) (buf!4948 (_2!9202 lt!309509)) lt!310045 lt!310030))))

(assert (=> d!68319 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!310045) (bvsle lt!310045 lt!310030))))

(assert (=> d!68319 (= (arrayBitRangesEqSymmetric!0 (buf!4948 (_2!9202 lt!309529)) (buf!4948 (_2!9202 lt!309509)) lt!310045 lt!310030) lt!311771)))

(declare-fun bs!16838 () Bool)

(assert (= bs!16838 d!68319))

(assert (=> bs!16838 m!307983))

(declare-fun m!309773 () Bool)

(assert (=> bs!16838 m!309773))

(assert (=> b!198838 d!68319))

(declare-fun b!199706 () Bool)

(declare-fun e!137051 () Bool)

(declare-fun e!137048 () Bool)

(assert (=> b!199706 (= e!137051 e!137048)))

(declare-fun res!167173 () Bool)

(declare-fun call!3163 () Bool)

(assert (=> b!199706 (= res!167173 call!3163)))

(assert (=> b!199706 (=> (not res!167173) (not e!137048))))

(declare-fun e!137047 () Bool)

(declare-fun b!199707 () Bool)

(declare-fun lt!311772 () tuple4!268)

(assert (=> b!199707 (= e!137047 (arrayRangesEq!696 (buf!4948 (_2!9202 lt!309509)) (buf!4948 (_2!9202 lt!309529)) (_1!9222 lt!311772) (_2!9222 lt!311772)))))

(declare-fun lt!311773 () (_ BitVec 32))

(declare-fun lt!311774 () (_ BitVec 32))

(declare-fun c!9966 () Bool)

(declare-fun bm!3160 () Bool)

(assert (=> bm!3160 (= call!3163 (byteRangesEq!0 (select (arr!5386 (buf!4948 (_2!9202 lt!309509))) (_3!650 lt!311772)) (select (arr!5386 (buf!4948 (_2!9202 lt!309529))) (_3!650 lt!311772)) lt!311774 (ite c!9966 lt!311773 #b00000000000000000000000000001000)))))

(declare-fun b!199708 () Bool)

(declare-fun e!137049 () Bool)

(assert (=> b!199708 (= e!137049 e!137051)))

(assert (=> b!199708 (= c!9966 (= (_3!650 lt!311772) (_4!134 lt!311772)))))

(declare-fun b!199709 () Bool)

(assert (=> b!199709 (= e!137051 call!3163)))

(declare-fun b!199711 () Bool)

(declare-fun e!137046 () Bool)

(assert (=> b!199711 (= e!137046 (byteRangesEq!0 (select (arr!5386 (buf!4948 (_2!9202 lt!309509))) (_4!134 lt!311772)) (select (arr!5386 (buf!4948 (_2!9202 lt!309529))) (_4!134 lt!311772)) #b00000000000000000000000000000000 lt!311773))))

(declare-fun b!199712 () Bool)

(declare-fun res!167176 () Bool)

(assert (=> b!199712 (= res!167176 (= lt!311773 #b00000000000000000000000000000000))))

(assert (=> b!199712 (=> res!167176 e!137046)))

(assert (=> b!199712 (= e!137048 e!137046)))

(declare-fun b!199710 () Bool)

(declare-fun e!137050 () Bool)

(assert (=> b!199710 (= e!137050 e!137049)))

(declare-fun res!167175 () Bool)

(assert (=> b!199710 (=> (not res!167175) (not e!137049))))

(assert (=> b!199710 (= res!167175 e!137047)))

(declare-fun res!167177 () Bool)

(assert (=> b!199710 (=> res!167177 e!137047)))

(assert (=> b!199710 (= res!167177 (bvsge (_1!9222 lt!311772) (_2!9222 lt!311772)))))

(assert (=> b!199710 (= lt!311773 ((_ extract 31 0) (bvsrem lt!310030 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199710 (= lt!311774 ((_ extract 31 0) (bvsrem lt!310045 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199710 (= lt!311772 (arrayBitIndices!0 lt!310045 lt!310030))))

(declare-fun d!68321 () Bool)

(declare-fun res!167174 () Bool)

(assert (=> d!68321 (=> res!167174 e!137050)))

(assert (=> d!68321 (= res!167174 (bvsge lt!310045 lt!310030))))

(assert (=> d!68321 (= (arrayBitRangesEq!0 (buf!4948 (_2!9202 lt!309509)) (buf!4948 (_2!9202 lt!309529)) lt!310045 lt!310030) e!137050)))

(assert (= (and d!68321 (not res!167174)) b!199710))

(assert (= (and b!199710 (not res!167177)) b!199707))

(assert (= (and b!199710 res!167175) b!199708))

(assert (= (and b!199708 c!9966) b!199709))

(assert (= (and b!199708 (not c!9966)) b!199706))

(assert (= (and b!199706 res!167173) b!199712))

(assert (= (and b!199712 (not res!167176)) b!199711))

(assert (= (or b!199709 b!199706) bm!3160))

(declare-fun m!309775 () Bool)

(assert (=> b!199707 m!309775))

(declare-fun m!309777 () Bool)

(assert (=> bm!3160 m!309777))

(declare-fun m!309779 () Bool)

(assert (=> bm!3160 m!309779))

(assert (=> bm!3160 m!309777))

(assert (=> bm!3160 m!309779))

(declare-fun m!309781 () Bool)

(assert (=> bm!3160 m!309781))

(declare-fun m!309783 () Bool)

(assert (=> b!199711 m!309783))

(declare-fun m!309785 () Bool)

(assert (=> b!199711 m!309785))

(assert (=> b!199711 m!309783))

(assert (=> b!199711 m!309785))

(declare-fun m!309787 () Bool)

(assert (=> b!199711 m!309787))

(declare-fun m!309789 () Bool)

(assert (=> b!199710 m!309789))

(assert (=> b!198838 d!68321))

(declare-fun d!68323 () Bool)

(declare-fun e!137052 () Bool)

(assert (=> d!68323 e!137052))

(declare-fun res!167179 () Bool)

(assert (=> d!68323 (=> (not res!167179) (not e!137052))))

(declare-fun lt!311777 () (_ BitVec 64))

(declare-fun lt!311780 () (_ BitVec 64))

(declare-fun lt!311776 () (_ BitVec 64))

(assert (=> d!68323 (= res!167179 (= lt!311780 (bvsub lt!311776 lt!311777)))))

(assert (=> d!68323 (or (= (bvand lt!311776 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311777 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311776 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311776 lt!311777) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68323 (= lt!311777 (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 lt!310646))) ((_ sign_extend 32) (currentByte!9295 lt!310646)) ((_ sign_extend 32) (currentBit!9290 lt!310646))))))

(declare-fun lt!311779 () (_ BitVec 64))

(declare-fun lt!311775 () (_ BitVec 64))

(assert (=> d!68323 (= lt!311776 (bvmul lt!311779 lt!311775))))

(assert (=> d!68323 (or (= lt!311779 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311775 (bvsdiv (bvmul lt!311779 lt!311775) lt!311779)))))

(assert (=> d!68323 (= lt!311775 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68323 (= lt!311779 ((_ sign_extend 32) (size!4456 (buf!4948 lt!310646))))))

(assert (=> d!68323 (= lt!311780 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 lt!310646)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 lt!310646))))))

(assert (=> d!68323 (invariant!0 (currentBit!9290 lt!310646) (currentByte!9295 lt!310646) (size!4456 (buf!4948 lt!310646)))))

(assert (=> d!68323 (= (bitIndex!0 (size!4456 (buf!4948 lt!310646)) (currentByte!9295 lt!310646) (currentBit!9290 lt!310646)) lt!311780)))

(declare-fun b!199713 () Bool)

(declare-fun res!167178 () Bool)

(assert (=> b!199713 (=> (not res!167178) (not e!137052))))

(assert (=> b!199713 (= res!167178 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311780))))

(declare-fun b!199714 () Bool)

(declare-fun lt!311778 () (_ BitVec 64))

(assert (=> b!199714 (= e!137052 (bvsle lt!311780 (bvmul lt!311778 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199714 (or (= lt!311778 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311778 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311778)))))

(assert (=> b!199714 (= lt!311778 ((_ sign_extend 32) (size!4456 (buf!4948 lt!310646))))))

(assert (= (and d!68323 res!167179) b!199713))

(assert (= (and b!199713 res!167178) b!199714))

(declare-fun m!309791 () Bool)

(assert (=> d!68323 m!309791))

(declare-fun m!309793 () Bool)

(assert (=> d!68323 m!309793))

(assert (=> d!67717 d!68323))

(declare-fun d!68325 () Bool)

(declare-fun e!137053 () Bool)

(assert (=> d!68325 e!137053))

(declare-fun res!167181 () Bool)

(assert (=> d!68325 (=> (not res!167181) (not e!137053))))

(declare-fun lt!311783 () (_ BitVec 64))

(declare-fun lt!311782 () (_ BitVec 64))

(declare-fun lt!311786 () (_ BitVec 64))

(assert (=> d!68325 (= res!167181 (= lt!311786 (bvsub lt!311782 lt!311783)))))

(assert (=> d!68325 (or (= (bvand lt!311782 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311783 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311782 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311782 lt!311783) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68325 (= lt!311783 (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9203 lt!309512)))) ((_ sign_extend 32) (currentByte!9295 (_1!9203 lt!309512))) ((_ sign_extend 32) (currentBit!9290 (_1!9203 lt!309512)))))))

(declare-fun lt!311785 () (_ BitVec 64))

(declare-fun lt!311781 () (_ BitVec 64))

(assert (=> d!68325 (= lt!311782 (bvmul lt!311785 lt!311781))))

(assert (=> d!68325 (or (= lt!311785 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311781 (bvsdiv (bvmul lt!311785 lt!311781) lt!311785)))))

(assert (=> d!68325 (= lt!311781 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68325 (= lt!311785 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9203 lt!309512)))))))

(assert (=> d!68325 (= lt!311786 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 (_1!9203 lt!309512))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 (_1!9203 lt!309512)))))))

(assert (=> d!68325 (invariant!0 (currentBit!9290 (_1!9203 lt!309512)) (currentByte!9295 (_1!9203 lt!309512)) (size!4456 (buf!4948 (_1!9203 lt!309512))))))

(assert (=> d!68325 (= (bitIndex!0 (size!4456 (buf!4948 (_1!9203 lt!309512))) (currentByte!9295 (_1!9203 lt!309512)) (currentBit!9290 (_1!9203 lt!309512))) lt!311786)))

(declare-fun b!199715 () Bool)

(declare-fun res!167180 () Bool)

(assert (=> b!199715 (=> (not res!167180) (not e!137053))))

(assert (=> b!199715 (= res!167180 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311786))))

(declare-fun b!199716 () Bool)

(declare-fun lt!311784 () (_ BitVec 64))

(assert (=> b!199716 (= e!137053 (bvsle lt!311786 (bvmul lt!311784 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199716 (or (= lt!311784 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311784 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311784)))))

(assert (=> b!199716 (= lt!311784 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9203 lt!309512)))))))

(assert (= (and d!68325 res!167181) b!199715))

(assert (= (and b!199715 res!167180) b!199716))

(declare-fun m!309795 () Bool)

(assert (=> d!68325 m!309795))

(declare-fun m!309797 () Bool)

(assert (=> d!68325 m!309797))

(assert (=> d!67717 d!68325))

(declare-fun d!68327 () Bool)

(declare-fun lt!311792 () (_ BitVec 32))

(assert (=> d!68327 (= lt!311792 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!311788 () (_ BitVec 32))

(assert (=> d!68327 (= lt!311788 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!137055 () Bool)

(assert (=> d!68327 e!137055))

(declare-fun res!167183 () Bool)

(assert (=> d!68327 (=> (not res!167183) (not e!137055))))

(assert (=> d!68327 (= res!167183 (moveBitIndexPrecond!0 (_1!9203 lt!309512) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!14179 () Unit!14058)

(declare-fun Unit!14180 () Unit!14058)

(declare-fun Unit!14181 () Unit!14058)

(assert (=> d!68327 (= (moveBitIndex!0 (_1!9203 lt!309512) #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!9290 (_1!9203 lt!309512)) lt!311792) #b00000000000000000000000000000000) (tuple2!17109 Unit!14179 (BitStream!8021 (buf!4948 (_1!9203 lt!309512)) (bvsub (bvadd (currentByte!9295 (_1!9203 lt!309512)) lt!311788) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!311792 (currentBit!9290 (_1!9203 lt!309512))))) (ite (bvsge (bvadd (currentBit!9290 (_1!9203 lt!309512)) lt!311792) #b00000000000000000000000000001000) (tuple2!17109 Unit!14180 (BitStream!8021 (buf!4948 (_1!9203 lt!309512)) (bvadd (currentByte!9295 (_1!9203 lt!309512)) lt!311788 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9290 (_1!9203 lt!309512)) lt!311792) #b00000000000000000000000000001000))) (tuple2!17109 Unit!14181 (BitStream!8021 (buf!4948 (_1!9203 lt!309512)) (bvadd (currentByte!9295 (_1!9203 lt!309512)) lt!311788) (bvadd (currentBit!9290 (_1!9203 lt!309512)) lt!311792))))))))

(declare-fun b!199717 () Bool)

(declare-fun e!137054 () Bool)

(assert (=> b!199717 (= e!137055 e!137054)))

(declare-fun res!167182 () Bool)

(assert (=> b!199717 (=> (not res!167182) (not e!137054))))

(declare-fun lt!311789 () (_ BitVec 64))

(declare-fun lt!311790 () tuple2!17108)

(assert (=> b!199717 (= res!167182 (= (bvadd lt!311789 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!311790))) (currentByte!9295 (_2!9202 lt!311790)) (currentBit!9290 (_2!9202 lt!311790)))))))

(assert (=> b!199717 (or (not (= (bvand lt!311789 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311789 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311789 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199717 (= lt!311789 (bitIndex!0 (size!4456 (buf!4948 (_1!9203 lt!309512))) (currentByte!9295 (_1!9203 lt!309512)) (currentBit!9290 (_1!9203 lt!309512))))))

(declare-fun lt!311791 () (_ BitVec 32))

(declare-fun lt!311787 () (_ BitVec 32))

(declare-fun Unit!14182 () Unit!14058)

(declare-fun Unit!14183 () Unit!14058)

(declare-fun Unit!14184 () Unit!14058)

(assert (=> b!199717 (= lt!311790 (ite (bvslt (bvadd (currentBit!9290 (_1!9203 lt!309512)) lt!311791) #b00000000000000000000000000000000) (tuple2!17109 Unit!14182 (BitStream!8021 (buf!4948 (_1!9203 lt!309512)) (bvsub (bvadd (currentByte!9295 (_1!9203 lt!309512)) lt!311787) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!311791 (currentBit!9290 (_1!9203 lt!309512))))) (ite (bvsge (bvadd (currentBit!9290 (_1!9203 lt!309512)) lt!311791) #b00000000000000000000000000001000) (tuple2!17109 Unit!14183 (BitStream!8021 (buf!4948 (_1!9203 lt!309512)) (bvadd (currentByte!9295 (_1!9203 lt!309512)) lt!311787 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9290 (_1!9203 lt!309512)) lt!311791) #b00000000000000000000000000001000))) (tuple2!17109 Unit!14184 (BitStream!8021 (buf!4948 (_1!9203 lt!309512)) (bvadd (currentByte!9295 (_1!9203 lt!309512)) lt!311787) (bvadd (currentBit!9290 (_1!9203 lt!309512)) lt!311791))))))))

(assert (=> b!199717 (= lt!311791 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199717 (= lt!311787 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!199718 () Bool)

(assert (=> b!199718 (= e!137054 (and (= (size!4456 (buf!4948 (_1!9203 lt!309512))) (size!4456 (buf!4948 (_2!9202 lt!311790)))) (= (buf!4948 (_1!9203 lt!309512)) (buf!4948 (_2!9202 lt!311790)))))))

(assert (= (and d!68327 res!167183) b!199717))

(assert (= (and b!199717 res!167182) b!199718))

(assert (=> d!68327 m!308347))

(declare-fun m!309799 () Bool)

(assert (=> b!199717 m!309799))

(assert (=> b!199717 m!308343))

(assert (=> d!67717 d!68327))

(declare-fun d!68329 () Bool)

(declare-fun res!167184 () Bool)

(declare-fun e!137056 () Bool)

(assert (=> d!68329 (=> (not res!167184) (not e!137056))))

(assert (=> d!68329 (= res!167184 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9203 lt!309512))))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9203 lt!309512))))))))))

(assert (=> d!68329 (= (moveBitIndexPrecond!0 (_1!9203 lt!309512) #b0000000000000000000000000000000000000000000000000000000000000001) e!137056)))

(declare-fun b!199719 () Bool)

(declare-fun lt!311793 () (_ BitVec 64))

(assert (=> b!199719 (= e!137056 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311793) (bvsle lt!311793 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9203 lt!309512))))))))))

(assert (=> b!199719 (= lt!311793 (bvadd (bitIndex!0 (size!4456 (buf!4948 (_1!9203 lt!309512))) (currentByte!9295 (_1!9203 lt!309512)) (currentBit!9290 (_1!9203 lt!309512))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!68329 res!167184) b!199719))

(assert (=> b!199719 m!308343))

(assert (=> d!67717 d!68329))

(declare-fun d!68331 () Bool)

(declare-fun e!137057 () Bool)

(assert (=> d!68331 e!137057))

(declare-fun res!167185 () Bool)

(assert (=> d!68331 (=> (not res!167185) (not e!137057))))

(assert (=> d!68331 (= res!167185 (= (buf!4948 (_2!9202 (increaseBitIndex!0 lt!309515))) (buf!4948 lt!309515)))))

(declare-fun lt!311799 () Bool)

(assert (=> d!68331 (= lt!311799 (not (= (bvand ((_ sign_extend 24) (select (arr!5386 (buf!4948 lt!309515)) (currentByte!9295 lt!309515))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9290 lt!309515)))) #b00000000000000000000000000000000)))))

(declare-fun lt!311794 () tuple2!17136)

(assert (=> d!68331 (= lt!311794 (tuple2!17137 (not (= (bvand ((_ sign_extend 24) (select (arr!5386 (buf!4948 lt!309515)) (currentByte!9295 lt!309515))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9290 lt!309515)))) #b00000000000000000000000000000000)) (_2!9202 (increaseBitIndex!0 lt!309515))))))

(assert (=> d!68331 (validate_offset_bit!0 ((_ sign_extend 32) (size!4456 (buf!4948 lt!309515))) ((_ sign_extend 32) (currentByte!9295 lt!309515)) ((_ sign_extend 32) (currentBit!9290 lt!309515)))))

(assert (=> d!68331 (= (readBit!0 lt!309515) lt!311794)))

(declare-fun lt!311796 () (_ BitVec 64))

(declare-fun lt!311798 () (_ BitVec 64))

(declare-fun b!199720 () Bool)

(assert (=> b!199720 (= e!137057 (= (bitIndex!0 (size!4456 (buf!4948 (_2!9202 (increaseBitIndex!0 lt!309515)))) (currentByte!9295 (_2!9202 (increaseBitIndex!0 lt!309515))) (currentBit!9290 (_2!9202 (increaseBitIndex!0 lt!309515)))) (bvadd lt!311798 lt!311796)))))

(assert (=> b!199720 (or (not (= (bvand lt!311798 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311796 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311798 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311798 lt!311796) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199720 (= lt!311796 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!199720 (= lt!311798 (bitIndex!0 (size!4456 (buf!4948 lt!309515)) (currentByte!9295 lt!309515) (currentBit!9290 lt!309515)))))

(declare-fun lt!311797 () Bool)

(assert (=> b!199720 (= lt!311797 (not (= (bvand ((_ sign_extend 24) (select (arr!5386 (buf!4948 lt!309515)) (currentByte!9295 lt!309515))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9290 lt!309515)))) #b00000000000000000000000000000000)))))

(declare-fun lt!311800 () Bool)

(assert (=> b!199720 (= lt!311800 (not (= (bvand ((_ sign_extend 24) (select (arr!5386 (buf!4948 lt!309515)) (currentByte!9295 lt!309515))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9290 lt!309515)))) #b00000000000000000000000000000000)))))

(declare-fun lt!311795 () Bool)

(assert (=> b!199720 (= lt!311795 (not (= (bvand ((_ sign_extend 24) (select (arr!5386 (buf!4948 lt!309515)) (currentByte!9295 lt!309515))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9290 lt!309515)))) #b00000000000000000000000000000000)))))

(assert (= (and d!68331 res!167185) b!199720))

(declare-fun m!309801 () Bool)

(assert (=> d!68331 m!309801))

(declare-fun m!309803 () Bool)

(assert (=> d!68331 m!309803))

(declare-fun m!309805 () Bool)

(assert (=> d!68331 m!309805))

(declare-fun m!309807 () Bool)

(assert (=> d!68331 m!309807))

(assert (=> b!199720 m!309801))

(declare-fun m!309809 () Bool)

(assert (=> b!199720 m!309809))

(declare-fun m!309811 () Bool)

(assert (=> b!199720 m!309811))

(assert (=> b!199720 m!309803))

(assert (=> b!199720 m!309805))

(assert (=> d!67631 d!68331))

(declare-fun d!68333 () Bool)

(assert (=> d!68333 (isPrefixOf!0 lt!310040 (_2!9202 lt!309509))))

(declare-fun lt!311801 () Unit!14058)

(assert (=> d!68333 (= lt!311801 (choose!30 lt!310040 (_2!9202 lt!309509) (_2!9202 lt!309509)))))

(assert (=> d!68333 (isPrefixOf!0 lt!310040 (_2!9202 lt!309509))))

(assert (=> d!68333 (= (lemmaIsPrefixTransitive!0 lt!310040 (_2!9202 lt!309509) (_2!9202 lt!309509)) lt!311801)))

(declare-fun bs!16839 () Bool)

(assert (= bs!16839 d!68333))

(assert (=> bs!16839 m!307963))

(declare-fun m!309813 () Bool)

(assert (=> bs!16839 m!309813))

(assert (=> bs!16839 m!307963))

(assert (=> d!67627 d!68333))

(declare-fun d!68335 () Bool)

(declare-fun res!167186 () Bool)

(declare-fun e!137059 () Bool)

(assert (=> d!68335 (=> (not res!167186) (not e!137059))))

(assert (=> d!68335 (= res!167186 (= (size!4456 (buf!4948 lt!310040)) (size!4456 (buf!4948 (_2!9202 lt!309509)))))))

(assert (=> d!68335 (= (isPrefixOf!0 lt!310040 (_2!9202 lt!309509)) e!137059)))

(declare-fun b!199721 () Bool)

(declare-fun res!167188 () Bool)

(assert (=> b!199721 (=> (not res!167188) (not e!137059))))

(assert (=> b!199721 (= res!167188 (bvsle (bitIndex!0 (size!4456 (buf!4948 lt!310040)) (currentByte!9295 lt!310040) (currentBit!9290 lt!310040)) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309509))) (currentByte!9295 (_2!9202 lt!309509)) (currentBit!9290 (_2!9202 lt!309509)))))))

(declare-fun b!199722 () Bool)

(declare-fun e!137058 () Bool)

(assert (=> b!199722 (= e!137059 e!137058)))

(declare-fun res!167187 () Bool)

(assert (=> b!199722 (=> res!167187 e!137058)))

(assert (=> b!199722 (= res!167187 (= (size!4456 (buf!4948 lt!310040)) #b00000000000000000000000000000000))))

(declare-fun b!199723 () Bool)

(assert (=> b!199723 (= e!137058 (arrayBitRangesEq!0 (buf!4948 lt!310040) (buf!4948 (_2!9202 lt!309509)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4456 (buf!4948 lt!310040)) (currentByte!9295 lt!310040) (currentBit!9290 lt!310040))))))

(assert (= (and d!68335 res!167186) b!199721))

(assert (= (and b!199721 res!167188) b!199722))

(assert (= (and b!199722 (not res!167187)) b!199723))

(declare-fun m!309815 () Bool)

(assert (=> b!199721 m!309815))

(assert (=> b!199721 m!307495))

(assert (=> b!199723 m!309815))

(assert (=> b!199723 m!309815))

(declare-fun m!309817 () Bool)

(assert (=> b!199723 m!309817))

(assert (=> d!67627 d!68335))

(assert (=> d!67627 d!67725))

(declare-fun d!68337 () Bool)

(declare-fun res!167189 () Bool)

(declare-fun e!137061 () Bool)

(assert (=> d!68337 (=> (not res!167189) (not e!137061))))

(assert (=> d!68337 (= res!167189 (= (size!4456 (buf!4948 (_2!9202 lt!309529))) (size!4456 (buf!4948 (_2!9202 lt!309529)))))))

(assert (=> d!68337 (= (isPrefixOf!0 (_2!9202 lt!309529) (_2!9202 lt!309529)) e!137061)))

(declare-fun b!199724 () Bool)

(declare-fun res!167191 () Bool)

(assert (=> b!199724 (=> (not res!167191) (not e!137061))))

(assert (=> b!199724 (= res!167191 (bvsle (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529)))))))

(declare-fun b!199725 () Bool)

(declare-fun e!137060 () Bool)

(assert (=> b!199725 (= e!137061 e!137060)))

(declare-fun res!167190 () Bool)

(assert (=> b!199725 (=> res!167190 e!137060)))

(assert (=> b!199725 (= res!167190 (= (size!4456 (buf!4948 (_2!9202 lt!309529))) #b00000000000000000000000000000000))))

(declare-fun b!199726 () Bool)

(assert (=> b!199726 (= e!137060 (arrayBitRangesEq!0 (buf!4948 (_2!9202 lt!309529)) (buf!4948 (_2!9202 lt!309529)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529)))))))

(assert (= (and d!68337 res!167189) b!199724))

(assert (= (and b!199724 res!167191) b!199725))

(assert (= (and b!199725 (not res!167190)) b!199726))

(assert (=> b!199724 m!307539))

(assert (=> b!199724 m!307539))

(assert (=> b!199726 m!307539))

(assert (=> b!199726 m!307539))

(declare-fun m!309819 () Bool)

(assert (=> b!199726 m!309819))

(assert (=> d!67627 d!68337))

(declare-fun d!68339 () Bool)

(declare-fun res!167192 () Bool)

(declare-fun e!137063 () Bool)

(assert (=> d!68339 (=> (not res!167192) (not e!137063))))

(assert (=> d!68339 (= res!167192 (= (size!4456 (buf!4948 lt!310040)) (size!4456 (buf!4948 lt!310040))))))

(assert (=> d!68339 (= (isPrefixOf!0 lt!310040 lt!310040) e!137063)))

(declare-fun b!199727 () Bool)

(declare-fun res!167194 () Bool)

(assert (=> b!199727 (=> (not res!167194) (not e!137063))))

(assert (=> b!199727 (= res!167194 (bvsle (bitIndex!0 (size!4456 (buf!4948 lt!310040)) (currentByte!9295 lt!310040) (currentBit!9290 lt!310040)) (bitIndex!0 (size!4456 (buf!4948 lt!310040)) (currentByte!9295 lt!310040) (currentBit!9290 lt!310040))))))

(declare-fun b!199728 () Bool)

(declare-fun e!137062 () Bool)

(assert (=> b!199728 (= e!137063 e!137062)))

(declare-fun res!167193 () Bool)

(assert (=> b!199728 (=> res!167193 e!137062)))

(assert (=> b!199728 (= res!167193 (= (size!4456 (buf!4948 lt!310040)) #b00000000000000000000000000000000))))

(declare-fun b!199729 () Bool)

(assert (=> b!199729 (= e!137062 (arrayBitRangesEq!0 (buf!4948 lt!310040) (buf!4948 lt!310040) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4456 (buf!4948 lt!310040)) (currentByte!9295 lt!310040) (currentBit!9290 lt!310040))))))

(assert (= (and d!68339 res!167192) b!199727))

(assert (= (and b!199727 res!167194) b!199728))

(assert (= (and b!199728 (not res!167193)) b!199729))

(assert (=> b!199727 m!309815))

(assert (=> b!199727 m!309815))

(assert (=> b!199729 m!309815))

(assert (=> b!199729 m!309815))

(declare-fun m!309821 () Bool)

(assert (=> b!199729 m!309821))

(assert (=> d!67627 d!68339))

(declare-fun d!68341 () Bool)

(declare-fun res!167195 () Bool)

(declare-fun e!137065 () Bool)

(assert (=> d!68341 (=> (not res!167195) (not e!137065))))

(assert (=> d!68341 (= res!167195 (= (size!4456 (buf!4948 (_1!9203 lt!310031))) (size!4456 (buf!4948 (_2!9203 lt!310031)))))))

(assert (=> d!68341 (= (isPrefixOf!0 (_1!9203 lt!310031) (_2!9203 lt!310031)) e!137065)))

(declare-fun b!199730 () Bool)

(declare-fun res!167197 () Bool)

(assert (=> b!199730 (=> (not res!167197) (not e!137065))))

(assert (=> b!199730 (= res!167197 (bvsle (bitIndex!0 (size!4456 (buf!4948 (_1!9203 lt!310031))) (currentByte!9295 (_1!9203 lt!310031)) (currentBit!9290 (_1!9203 lt!310031))) (bitIndex!0 (size!4456 (buf!4948 (_2!9203 lt!310031))) (currentByte!9295 (_2!9203 lt!310031)) (currentBit!9290 (_2!9203 lt!310031)))))))

(declare-fun b!199731 () Bool)

(declare-fun e!137064 () Bool)

(assert (=> b!199731 (= e!137065 e!137064)))

(declare-fun res!167196 () Bool)

(assert (=> b!199731 (=> res!167196 e!137064)))

(assert (=> b!199731 (= res!167196 (= (size!4456 (buf!4948 (_1!9203 lt!310031))) #b00000000000000000000000000000000))))

(declare-fun b!199732 () Bool)

(assert (=> b!199732 (= e!137064 (arrayBitRangesEq!0 (buf!4948 (_1!9203 lt!310031)) (buf!4948 (_2!9203 lt!310031)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4456 (buf!4948 (_1!9203 lt!310031))) (currentByte!9295 (_1!9203 lt!310031)) (currentBit!9290 (_1!9203 lt!310031)))))))

(assert (= (and d!68341 res!167195) b!199730))

(assert (= (and b!199730 res!167197) b!199731))

(assert (= (and b!199731 (not res!167196)) b!199732))

(assert (=> b!199730 m!309747))

(assert (=> b!199730 m!309753))

(assert (=> b!199732 m!309747))

(assert (=> b!199732 m!309747))

(declare-fun m!309823 () Bool)

(assert (=> b!199732 m!309823))

(assert (=> d!67627 d!68341))

(declare-fun d!68343 () Bool)

(assert (=> d!68343 (isPrefixOf!0 (_2!9202 lt!309529) (_2!9202 lt!309529))))

(declare-fun lt!311804 () Unit!14058)

(declare-fun choose!11 (BitStream!8020) Unit!14058)

(assert (=> d!68343 (= lt!311804 (choose!11 (_2!9202 lt!309529)))))

(assert (=> d!68343 (= (lemmaIsPrefixRefl!0 (_2!9202 lt!309529)) lt!311804)))

(declare-fun bs!16841 () Bool)

(assert (= bs!16841 d!68343))

(assert (=> bs!16841 m!307961))

(declare-fun m!309825 () Bool)

(assert (=> bs!16841 m!309825))

(assert (=> d!67627 d!68343))

(declare-fun d!68345 () Bool)

(declare-fun res!167198 () Bool)

(declare-fun e!137067 () Bool)

(assert (=> d!68345 (=> (not res!167198) (not e!137067))))

(assert (=> d!68345 (= res!167198 (= (size!4456 (buf!4948 (_2!9202 lt!309509))) (size!4456 (buf!4948 (_2!9202 lt!309509)))))))

(assert (=> d!68345 (= (isPrefixOf!0 (_2!9202 lt!309509) (_2!9202 lt!309509)) e!137067)))

(declare-fun b!199733 () Bool)

(declare-fun res!167200 () Bool)

(assert (=> b!199733 (=> (not res!167200) (not e!137067))))

(assert (=> b!199733 (= res!167200 (bvsle (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309509))) (currentByte!9295 (_2!9202 lt!309509)) (currentBit!9290 (_2!9202 lt!309509))) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309509))) (currentByte!9295 (_2!9202 lt!309509)) (currentBit!9290 (_2!9202 lt!309509)))))))

(declare-fun b!199734 () Bool)

(declare-fun e!137066 () Bool)

(assert (=> b!199734 (= e!137067 e!137066)))

(declare-fun res!167199 () Bool)

(assert (=> b!199734 (=> res!167199 e!137066)))

(assert (=> b!199734 (= res!167199 (= (size!4456 (buf!4948 (_2!9202 lt!309509))) #b00000000000000000000000000000000))))

(declare-fun b!199735 () Bool)

(assert (=> b!199735 (= e!137066 (arrayBitRangesEq!0 (buf!4948 (_2!9202 lt!309509)) (buf!4948 (_2!9202 lt!309509)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309509))) (currentByte!9295 (_2!9202 lt!309509)) (currentBit!9290 (_2!9202 lt!309509)))))))

(assert (= (and d!68345 res!167198) b!199733))

(assert (= (and b!199733 res!167200) b!199734))

(assert (= (and b!199734 (not res!167199)) b!199735))

(assert (=> b!199733 m!307495))

(assert (=> b!199733 m!307495))

(assert (=> b!199735 m!307495))

(assert (=> b!199735 m!307495))

(declare-fun m!309827 () Bool)

(assert (=> b!199735 m!309827))

(assert (=> d!67627 d!68345))

(declare-fun d!68347 () Bool)

(assert (=> d!68347 (isPrefixOf!0 (_2!9202 lt!309509) (_2!9202 lt!309509))))

(declare-fun lt!311805 () Unit!14058)

(assert (=> d!68347 (= lt!311805 (choose!11 (_2!9202 lt!309509)))))

(assert (=> d!68347 (= (lemmaIsPrefixRefl!0 (_2!9202 lt!309509)) lt!311805)))

(declare-fun bs!16842 () Bool)

(assert (= bs!16842 d!68347))

(assert (=> bs!16842 m!307939))

(declare-fun m!309829 () Bool)

(assert (=> bs!16842 m!309829))

(assert (=> d!67627 d!68347))

(declare-fun d!68349 () Bool)

(assert (=> d!68349 (isPrefixOf!0 lt!310040 lt!310040)))

(declare-fun lt!311806 () Unit!14058)

(assert (=> d!68349 (= lt!311806 (choose!11 lt!310040))))

(assert (=> d!68349 (= (lemmaIsPrefixRefl!0 lt!310040) lt!311806)))

(declare-fun bs!16843 () Bool)

(assert (= bs!16843 d!68349))

(assert (=> bs!16843 m!307969))

(declare-fun m!309831 () Bool)

(assert (=> bs!16843 m!309831))

(assert (=> d!67627 d!68349))

(declare-fun d!68351 () Bool)

(assert (=> d!68351 (isPrefixOf!0 lt!310040 (_2!9202 lt!309509))))

(declare-fun lt!311807 () Unit!14058)

(assert (=> d!68351 (= lt!311807 (choose!30 lt!310040 (_2!9202 lt!309529) (_2!9202 lt!309509)))))

(assert (=> d!68351 (isPrefixOf!0 lt!310040 (_2!9202 lt!309529))))

(assert (=> d!68351 (= (lemmaIsPrefixTransitive!0 lt!310040 (_2!9202 lt!309529) (_2!9202 lt!309509)) lt!311807)))

(declare-fun bs!16844 () Bool)

(assert (= bs!16844 d!68351))

(assert (=> bs!16844 m!307963))

(declare-fun m!309833 () Bool)

(assert (=> bs!16844 m!309833))

(declare-fun m!309835 () Bool)

(assert (=> bs!16844 m!309835))

(assert (=> d!67627 d!68351))

(declare-fun d!68353 () Bool)

(declare-fun res!167201 () Bool)

(declare-fun e!137069 () Bool)

(assert (=> d!68353 (=> (not res!167201) (not e!137069))))

(assert (=> d!68353 (= res!167201 (= (size!4456 (buf!4948 (_2!9203 lt!309982))) (size!4456 (buf!4948 (_2!9202 lt!309509)))))))

(assert (=> d!68353 (= (isPrefixOf!0 (_2!9203 lt!309982) (_2!9202 lt!309509)) e!137069)))

(declare-fun b!199736 () Bool)

(declare-fun res!167203 () Bool)

(assert (=> b!199736 (=> (not res!167203) (not e!137069))))

(assert (=> b!199736 (= res!167203 (bvsle (bitIndex!0 (size!4456 (buf!4948 (_2!9203 lt!309982))) (currentByte!9295 (_2!9203 lt!309982)) (currentBit!9290 (_2!9203 lt!309982))) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309509))) (currentByte!9295 (_2!9202 lt!309509)) (currentBit!9290 (_2!9202 lt!309509)))))))

(declare-fun b!199737 () Bool)

(declare-fun e!137068 () Bool)

(assert (=> b!199737 (= e!137069 e!137068)))

(declare-fun res!167202 () Bool)

(assert (=> b!199737 (=> res!167202 e!137068)))

(assert (=> b!199737 (= res!167202 (= (size!4456 (buf!4948 (_2!9203 lt!309982))) #b00000000000000000000000000000000))))

(declare-fun b!199738 () Bool)

(assert (=> b!199738 (= e!137068 (arrayBitRangesEq!0 (buf!4948 (_2!9203 lt!309982)) (buf!4948 (_2!9202 lt!309509)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4456 (buf!4948 (_2!9203 lt!309982))) (currentByte!9295 (_2!9203 lt!309982)) (currentBit!9290 (_2!9203 lt!309982)))))))

(assert (= (and d!68353 res!167201) b!199736))

(assert (= (and b!199736 res!167203) b!199737))

(assert (= (and b!199737 (not res!167202)) b!199738))

(declare-fun m!309837 () Bool)

(assert (=> b!199736 m!309837))

(assert (=> b!199736 m!307495))

(assert (=> b!199738 m!309837))

(assert (=> b!199738 m!309837))

(declare-fun m!309839 () Bool)

(assert (=> b!199738 m!309839))

(assert (=> b!198824 d!68353))

(declare-fun b!199739 () Bool)

(declare-fun e!137070 () tuple2!17138)

(assert (=> b!199739 (= e!137070 (tuple2!17139 lt!309531 lt!309522))))

(declare-fun b!199740 () Bool)

(declare-fun e!137072 () Bool)

(declare-fun e!137071 () Bool)

(assert (=> b!199740 (= e!137072 e!137071)))

(declare-fun res!167206 () Bool)

(assert (=> b!199740 (=> res!167206 e!137071)))

(assert (=> b!199740 (= res!167206 (not (bvslt (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-fun b!199741 () Bool)

(declare-fun lt!311808 () tuple2!17138)

(assert (=> b!199741 (= e!137070 (tuple2!17139 (_1!9217 lt!311808) (_2!9217 lt!311808)))))

(declare-fun lt!311809 () tuple2!17136)

(assert (=> b!199741 (= lt!311809 (readBit!0 lt!309522))))

(assert (=> b!199741 (= lt!311808 (readNBitsLSBFirstsLoop!0 (_2!9216 lt!311809) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!309531 (ite (_1!9216 lt!311809) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!199743 () Bool)

(declare-fun res!167204 () Bool)

(assert (=> b!199743 (=> (not res!167204) (not e!137072))))

(declare-fun lt!311810 () tuple2!17138)

(assert (=> b!199743 (= res!167204 (= (bvand (_1!9217 lt!311810) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))) (bvand lt!309531 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun b!199744 () Bool)

(declare-fun res!167205 () Bool)

(assert (=> b!199744 (=> (not res!167205) (not e!137072))))

(assert (=> b!199744 (= res!167205 (= (bvand (_1!9217 lt!311810) (onesLSBLong!0 nBits!348)) (_1!9217 lt!311810)))))

(declare-fun b!199745 () Bool)

(declare-fun res!167207 () Bool)

(assert (=> b!199745 (=> (not res!167207) (not e!137072))))

(declare-fun lt!311812 () (_ BitVec 64))

(declare-fun lt!311811 () (_ BitVec 64))

(assert (=> b!199745 (= res!167207 (= (bitIndex!0 (size!4456 (buf!4948 (_2!9217 lt!311810))) (currentByte!9295 (_2!9217 lt!311810)) (currentBit!9290 (_2!9217 lt!311810))) (bvadd lt!311812 lt!311811)))))

(assert (=> b!199745 (or (not (= (bvand lt!311812 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311811 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311812 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311812 lt!311811) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199745 (= lt!311811 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!199745 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!199745 (= lt!311812 (bitIndex!0 (size!4456 (buf!4948 lt!309522)) (currentByte!9295 lt!309522) (currentBit!9290 lt!309522)))))

(declare-fun lt!311813 () (_ BitVec 64))

(declare-fun b!199742 () Bool)

(assert (=> b!199742 (= e!137071 (= (= (bvand (bvlshr (_1!9217 lt!311810) lt!311813) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!9205 (readBitPure!0 lt!309522))))))

(assert (=> b!199742 (and (bvsge lt!311813 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!311813 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!199742 (= lt!311813 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun d!68355 () Bool)

(assert (=> d!68355 e!137072))

(declare-fun res!167208 () Bool)

(assert (=> d!68355 (=> (not res!167208) (not e!137072))))

(assert (=> d!68355 (= res!167208 (= (buf!4948 (_2!9217 lt!311810)) (buf!4948 lt!309522)))))

(assert (=> d!68355 (= lt!311810 e!137070)))

(declare-fun c!9967 () Bool)

(assert (=> d!68355 (= c!9967 (= nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (=> d!68355 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsle (bvadd #b00000000000000000000000000000001 i!590) nBits!348) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!68355 (= (readNBitsLSBFirstsLoop!0 lt!309522 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!309531) lt!311810)))

(assert (= (and d!68355 c!9967) b!199739))

(assert (= (and d!68355 (not c!9967)) b!199741))

(assert (= (and d!68355 res!167208) b!199745))

(assert (= (and b!199745 res!167207) b!199743))

(assert (= (and b!199743 res!167204) b!199744))

(assert (= (and b!199744 res!167205) b!199740))

(assert (= (and b!199740 (not res!167206)) b!199742))

(assert (=> b!199744 m!308281))

(assert (=> b!199743 m!308263))

(declare-fun m!309841 () Bool)

(assert (=> b!199741 m!309841))

(declare-fun m!309843 () Bool)

(assert (=> b!199741 m!309843))

(declare-fun m!309845 () Bool)

(assert (=> b!199745 m!309845))

(declare-fun m!309847 () Bool)

(assert (=> b!199745 m!309847))

(declare-fun m!309849 () Bool)

(assert (=> b!199742 m!309849))

(assert (=> d!67715 d!68355))

(declare-fun d!68357 () Bool)

(declare-fun e!137073 () Bool)

(assert (=> d!68357 e!137073))

(declare-fun res!167210 () Bool)

(assert (=> d!68357 (=> (not res!167210) (not e!137073))))

(declare-fun lt!311819 () (_ BitVec 64))

(declare-fun lt!311815 () (_ BitVec 64))

(declare-fun lt!311816 () (_ BitVec 64))

(assert (=> d!68357 (= res!167210 (= lt!311819 (bvsub lt!311815 lt!311816)))))

(assert (=> d!68357 (or (= (bvand lt!311815 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311816 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311815 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311815 lt!311816) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68357 (= lt!311816 (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310505)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!310505))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!310505)))))))

(declare-fun lt!311818 () (_ BitVec 64))

(declare-fun lt!311814 () (_ BitVec 64))

(assert (=> d!68357 (= lt!311815 (bvmul lt!311818 lt!311814))))

(assert (=> d!68357 (or (= lt!311818 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311814 (bvsdiv (bvmul lt!311818 lt!311814) lt!311818)))))

(assert (=> d!68357 (= lt!311814 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68357 (= lt!311818 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310505)))))))

(assert (=> d!68357 (= lt!311819 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!310505))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!310505)))))))

(assert (=> d!68357 (invariant!0 (currentBit!9290 (_2!9202 lt!310505)) (currentByte!9295 (_2!9202 lt!310505)) (size!4456 (buf!4948 (_2!9202 lt!310505))))))

(assert (=> d!68357 (= (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310505))) (currentByte!9295 (_2!9202 lt!310505)) (currentBit!9290 (_2!9202 lt!310505))) lt!311819)))

(declare-fun b!199746 () Bool)

(declare-fun res!167209 () Bool)

(assert (=> b!199746 (=> (not res!167209) (not e!137073))))

(assert (=> b!199746 (= res!167209 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311819))))

(declare-fun b!199747 () Bool)

(declare-fun lt!311817 () (_ BitVec 64))

(assert (=> b!199747 (= e!137073 (bvsle lt!311819 (bvmul lt!311817 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199747 (or (= lt!311817 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311817 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311817)))))

(assert (=> b!199747 (= lt!311817 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310505)))))))

(assert (= (and d!68357 res!167210) b!199746))

(assert (= (and b!199746 res!167209) b!199747))

(declare-fun m!309851 () Bool)

(assert (=> d!68357 m!309851))

(declare-fun m!309853 () Bool)

(assert (=> d!68357 m!309853))

(assert (=> b!198996 d!68357))

(assert (=> b!198996 d!67707))

(declare-fun d!68359 () Bool)

(assert (=> d!68359 (= (invariant!0 (currentBit!9290 (_2!9202 lt!310546)) (currentByte!9295 (_2!9202 lt!310546)) (size!4456 (buf!4948 (_2!9202 lt!310546)))) (and (bvsge (currentBit!9290 (_2!9202 lt!310546)) #b00000000000000000000000000000000) (bvslt (currentBit!9290 (_2!9202 lt!310546)) #b00000000000000000000000000001000) (bvsge (currentByte!9295 (_2!9202 lt!310546)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9295 (_2!9202 lt!310546)) (size!4456 (buf!4948 (_2!9202 lt!310546)))) (and (= (currentBit!9290 (_2!9202 lt!310546)) #b00000000000000000000000000000000) (= (currentByte!9295 (_2!9202 lt!310546)) (size!4456 (buf!4948 (_2!9202 lt!310546))))))))))

(assert (=> b!198998 d!68359))

(declare-fun d!68361 () Bool)

(assert (=> d!68361 (validate_offset_bits!1 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310546)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!310533))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!310533))) lt!310542)))

(declare-fun lt!311820 () Unit!14058)

(assert (=> d!68361 (= lt!311820 (choose!9 (_2!9202 lt!310533) (buf!4948 (_2!9202 lt!310546)) lt!310542 (BitStream!8021 (buf!4948 (_2!9202 lt!310546)) (currentByte!9295 (_2!9202 lt!310533)) (currentBit!9290 (_2!9202 lt!310533)))))))

(assert (=> d!68361 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9202 lt!310533) (buf!4948 (_2!9202 lt!310546)) lt!310542) lt!311820)))

(declare-fun bs!16845 () Bool)

(assert (= bs!16845 d!68361))

(assert (=> bs!16845 m!308271))

(declare-fun m!309855 () Bool)

(assert (=> bs!16845 m!309855))

(assert (=> b!198998 d!68361))

(declare-fun d!68363 () Bool)

(assert (=> d!68363 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310546)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!310533))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!310533))) lt!310542) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310546)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!310533))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!310533)))) lt!310542))))

(declare-fun bs!16846 () Bool)

(assert (= bs!16846 d!68363))

(declare-fun m!309857 () Bool)

(assert (=> bs!16846 m!309857))

(assert (=> b!198998 d!68363))

(declare-fun d!68365 () Bool)

(declare-fun e!137074 () Bool)

(assert (=> d!68365 e!137074))

(declare-fun res!167212 () Bool)

(assert (=> d!68365 (=> (not res!167212) (not e!137074))))

(declare-fun lt!311823 () (_ BitVec 64))

(declare-fun lt!311822 () (_ BitVec 64))

(declare-fun lt!311826 () (_ BitVec 64))

(assert (=> d!68365 (= res!167212 (= lt!311826 (bvsub lt!311822 lt!311823)))))

(assert (=> d!68365 (or (= (bvand lt!311822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311823 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311822 lt!311823) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68365 (= lt!311823 (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!310539)))) ((_ sign_extend 32) (currentByte!9295 (_1!9205 lt!310539))) ((_ sign_extend 32) (currentBit!9290 (_1!9205 lt!310539)))))))

(declare-fun lt!311825 () (_ BitVec 64))

(declare-fun lt!311821 () (_ BitVec 64))

(assert (=> d!68365 (= lt!311822 (bvmul lt!311825 lt!311821))))

(assert (=> d!68365 (or (= lt!311825 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311821 (bvsdiv (bvmul lt!311825 lt!311821) lt!311825)))))

(assert (=> d!68365 (= lt!311821 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68365 (= lt!311825 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!310539)))))))

(assert (=> d!68365 (= lt!311826 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 (_1!9205 lt!310539))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 (_1!9205 lt!310539)))))))

(assert (=> d!68365 (invariant!0 (currentBit!9290 (_1!9205 lt!310539)) (currentByte!9295 (_1!9205 lt!310539)) (size!4456 (buf!4948 (_1!9205 lt!310539))))))

(assert (=> d!68365 (= (bitIndex!0 (size!4456 (buf!4948 (_1!9205 lt!310539))) (currentByte!9295 (_1!9205 lt!310539)) (currentBit!9290 (_1!9205 lt!310539))) lt!311826)))

(declare-fun b!199748 () Bool)

(declare-fun res!167211 () Bool)

(assert (=> b!199748 (=> (not res!167211) (not e!137074))))

(assert (=> b!199748 (= res!167211 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311826))))

(declare-fun b!199749 () Bool)

(declare-fun lt!311824 () (_ BitVec 64))

(assert (=> b!199749 (= e!137074 (bvsle lt!311826 (bvmul lt!311824 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199749 (or (= lt!311824 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311824 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311824)))))

(assert (=> b!199749 (= lt!311824 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!310539)))))))

(assert (= (and d!68365 res!167212) b!199748))

(assert (= (and b!199748 res!167211) b!199749))

(declare-fun m!309859 () Bool)

(assert (=> d!68365 m!309859))

(declare-fun m!309861 () Bool)

(assert (=> d!68365 m!309861))

(assert (=> b!198998 d!68365))

(declare-fun d!68367 () Bool)

(assert (=> d!68367 (= (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!590)))))))

(assert (=> b!198998 d!68367))

(declare-fun d!68369 () Bool)

(declare-fun lt!311827 () tuple2!17136)

(assert (=> d!68369 (= lt!311827 (readBit!0 lt!310499))))

(assert (=> d!68369 (= (readBitPure!0 lt!310499) (tuple2!17115 (_2!9216 lt!311827) (_1!9216 lt!311827)))))

(declare-fun bs!16847 () Bool)

(assert (= bs!16847 d!68369))

(declare-fun m!309863 () Bool)

(assert (=> bs!16847 m!309863))

(assert (=> b!198998 d!68369))

(declare-fun d!68371 () Bool)

(declare-fun lt!311830 () tuple2!17112)

(declare-fun lt!311833 () tuple2!17112)

(assert (=> d!68371 (and (= (_2!9204 lt!311830) (_2!9204 lt!311833)) (= (_1!9204 lt!311830) (_1!9204 lt!311833)))))

(declare-fun lt!311831 () (_ BitVec 64))

(declare-fun lt!311828 () Unit!14058)

(declare-fun lt!311832 () Bool)

(declare-fun lt!311829 () BitStream!8020)

(assert (=> d!68371 (= lt!311828 (choose!56 (_1!9203 lt!310518) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!310529 lt!311830 (tuple2!17113 (_1!9204 lt!311830) (_2!9204 lt!311830)) (_1!9204 lt!311830) (_2!9204 lt!311830) lt!311832 lt!311829 lt!311831 lt!311833 (tuple2!17113 (_1!9204 lt!311833) (_2!9204 lt!311833)) (_1!9204 lt!311833) (_2!9204 lt!311833)))))

(assert (=> d!68371 (= lt!311833 (readNBitsLSBFirstsLoopPure!0 lt!311829 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!311831))))

(assert (=> d!68371 (= lt!311831 (bvor lt!310529 (ite lt!311832 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68371 (= lt!311829 (withMovedBitIndex!0 (_1!9203 lt!310518) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!68371 (= lt!311832 (_2!9205 (readBitPure!0 (_1!9203 lt!310518))))))

(assert (=> d!68371 (= lt!311830 (readNBitsLSBFirstsLoopPure!0 (_1!9203 lt!310518) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!310529))))

(assert (=> d!68371 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9203 lt!310518) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!310529) lt!311828)))

(declare-fun bs!16848 () Bool)

(assert (= bs!16848 d!68371))

(assert (=> bs!16848 m!308269))

(declare-fun m!309865 () Bool)

(assert (=> bs!16848 m!309865))

(assert (=> bs!16848 m!308261))

(declare-fun m!309867 () Bool)

(assert (=> bs!16848 m!309867))

(assert (=> bs!16848 m!308279))

(assert (=> b!198998 d!68371))

(declare-fun d!68373 () Bool)

(declare-fun e!137075 () Bool)

(assert (=> d!68373 e!137075))

(declare-fun res!167213 () Bool)

(assert (=> d!68373 (=> (not res!167213) (not e!137075))))

(declare-fun lt!311835 () (_ BitVec 64))

(declare-fun lt!311834 () BitStream!8020)

(assert (=> d!68373 (= res!167213 (= (bvadd lt!311835 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4456 (buf!4948 lt!311834)) (currentByte!9295 lt!311834) (currentBit!9290 lt!311834))))))

(assert (=> d!68373 (or (not (= (bvand lt!311835 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311835 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311835 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68373 (= lt!311835 (bitIndex!0 (size!4456 (buf!4948 (_1!9203 lt!310518))) (currentByte!9295 (_1!9203 lt!310518)) (currentBit!9290 (_1!9203 lt!310518))))))

(assert (=> d!68373 (= lt!311834 (_2!9202 (moveBitIndex!0 (_1!9203 lt!310518) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!68373 (moveBitIndexPrecond!0 (_1!9203 lt!310518) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!68373 (= (withMovedBitIndex!0 (_1!9203 lt!310518) #b0000000000000000000000000000000000000000000000000000000000000001) lt!311834)))

(declare-fun b!199750 () Bool)

(assert (=> b!199750 (= e!137075 (= (size!4456 (buf!4948 (_1!9203 lt!310518))) (size!4456 (buf!4948 lt!311834))))))

(assert (= (and d!68373 res!167213) b!199750))

(declare-fun m!309869 () Bool)

(assert (=> d!68373 m!309869))

(declare-fun m!309871 () Bool)

(assert (=> d!68373 m!309871))

(declare-fun m!309873 () Bool)

(assert (=> d!68373 m!309873))

(declare-fun m!309875 () Bool)

(assert (=> d!68373 m!309875))

(assert (=> b!198998 d!68373))

(declare-fun b!199751 () Bool)

(declare-fun res!167214 () Bool)

(declare-fun e!137077 () Bool)

(assert (=> b!199751 (=> (not res!167214) (not e!137077))))

(declare-fun lt!311840 () tuple2!17110)

(assert (=> b!199751 (= res!167214 (isPrefixOf!0 (_1!9203 lt!311840) (_2!9202 lt!310533)))))

(declare-fun d!68375 () Bool)

(assert (=> d!68375 e!137077))

(declare-fun res!167215 () Bool)

(assert (=> d!68375 (=> (not res!167215) (not e!137077))))

(assert (=> d!68375 (= res!167215 (isPrefixOf!0 (_1!9203 lt!311840) (_2!9203 lt!311840)))))

(declare-fun lt!311849 () BitStream!8020)

(assert (=> d!68375 (= lt!311840 (tuple2!17111 lt!311849 (_2!9202 lt!310546)))))

(declare-fun lt!311838 () Unit!14058)

(declare-fun lt!311846 () Unit!14058)

(assert (=> d!68375 (= lt!311838 lt!311846)))

(assert (=> d!68375 (isPrefixOf!0 lt!311849 (_2!9202 lt!310546))))

(assert (=> d!68375 (= lt!311846 (lemmaIsPrefixTransitive!0 lt!311849 (_2!9202 lt!310546) (_2!9202 lt!310546)))))

(declare-fun lt!311837 () Unit!14058)

(declare-fun lt!311850 () Unit!14058)

(assert (=> d!68375 (= lt!311837 lt!311850)))

(assert (=> d!68375 (isPrefixOf!0 lt!311849 (_2!9202 lt!310546))))

(assert (=> d!68375 (= lt!311850 (lemmaIsPrefixTransitive!0 lt!311849 (_2!9202 lt!310533) (_2!9202 lt!310546)))))

(declare-fun lt!311843 () Unit!14058)

(declare-fun e!137076 () Unit!14058)

(assert (=> d!68375 (= lt!311843 e!137076)))

(declare-fun c!9968 () Bool)

(assert (=> d!68375 (= c!9968 (not (= (size!4456 (buf!4948 (_2!9202 lt!310533))) #b00000000000000000000000000000000)))))

(declare-fun lt!311855 () Unit!14058)

(declare-fun lt!311853 () Unit!14058)

(assert (=> d!68375 (= lt!311855 lt!311853)))

(assert (=> d!68375 (isPrefixOf!0 (_2!9202 lt!310546) (_2!9202 lt!310546))))

(assert (=> d!68375 (= lt!311853 (lemmaIsPrefixRefl!0 (_2!9202 lt!310546)))))

(declare-fun lt!311851 () Unit!14058)

(declare-fun lt!311841 () Unit!14058)

(assert (=> d!68375 (= lt!311851 lt!311841)))

(assert (=> d!68375 (= lt!311841 (lemmaIsPrefixRefl!0 (_2!9202 lt!310546)))))

(declare-fun lt!311852 () Unit!14058)

(declare-fun lt!311844 () Unit!14058)

(assert (=> d!68375 (= lt!311852 lt!311844)))

(assert (=> d!68375 (isPrefixOf!0 lt!311849 lt!311849)))

(assert (=> d!68375 (= lt!311844 (lemmaIsPrefixRefl!0 lt!311849))))

(declare-fun lt!311845 () Unit!14058)

(declare-fun lt!311842 () Unit!14058)

(assert (=> d!68375 (= lt!311845 lt!311842)))

(assert (=> d!68375 (isPrefixOf!0 (_2!9202 lt!310533) (_2!9202 lt!310533))))

(assert (=> d!68375 (= lt!311842 (lemmaIsPrefixRefl!0 (_2!9202 lt!310533)))))

(assert (=> d!68375 (= lt!311849 (BitStream!8021 (buf!4948 (_2!9202 lt!310546)) (currentByte!9295 (_2!9202 lt!310533)) (currentBit!9290 (_2!9202 lt!310533))))))

(assert (=> d!68375 (isPrefixOf!0 (_2!9202 lt!310533) (_2!9202 lt!310546))))

(assert (=> d!68375 (= (reader!0 (_2!9202 lt!310533) (_2!9202 lt!310546)) lt!311840)))

(declare-fun b!199752 () Bool)

(declare-fun Unit!14185 () Unit!14058)

(assert (=> b!199752 (= e!137076 Unit!14185)))

(declare-fun lt!311848 () (_ BitVec 64))

(declare-fun b!199753 () Bool)

(declare-fun lt!311847 () (_ BitVec 64))

(assert (=> b!199753 (= e!137077 (= (_1!9203 lt!311840) (withMovedBitIndex!0 (_2!9203 lt!311840) (bvsub lt!311848 lt!311847))))))

(assert (=> b!199753 (or (= (bvand lt!311848 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311847 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311848 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311848 lt!311847) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199753 (= lt!311847 (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310546))) (currentByte!9295 (_2!9202 lt!310546)) (currentBit!9290 (_2!9202 lt!310546))))))

(assert (=> b!199753 (= lt!311848 (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310533))) (currentByte!9295 (_2!9202 lt!310533)) (currentBit!9290 (_2!9202 lt!310533))))))

(declare-fun b!199754 () Bool)

(declare-fun res!167216 () Bool)

(assert (=> b!199754 (=> (not res!167216) (not e!137077))))

(assert (=> b!199754 (= res!167216 (isPrefixOf!0 (_2!9203 lt!311840) (_2!9202 lt!310546)))))

(declare-fun b!199755 () Bool)

(declare-fun lt!311836 () Unit!14058)

(assert (=> b!199755 (= e!137076 lt!311836)))

(declare-fun lt!311854 () (_ BitVec 64))

(assert (=> b!199755 (= lt!311854 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!311839 () (_ BitVec 64))

(assert (=> b!199755 (= lt!311839 (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310533))) (currentByte!9295 (_2!9202 lt!310533)) (currentBit!9290 (_2!9202 lt!310533))))))

(assert (=> b!199755 (= lt!311836 (arrayBitRangesEqSymmetric!0 (buf!4948 (_2!9202 lt!310533)) (buf!4948 (_2!9202 lt!310546)) lt!311854 lt!311839))))

(assert (=> b!199755 (arrayBitRangesEq!0 (buf!4948 (_2!9202 lt!310546)) (buf!4948 (_2!9202 lt!310533)) lt!311854 lt!311839)))

(assert (= (and d!68375 c!9968) b!199755))

(assert (= (and d!68375 (not c!9968)) b!199752))

(assert (= (and d!68375 res!167215) b!199751))

(assert (= (and b!199751 res!167214) b!199754))

(assert (= (and b!199754 res!167216) b!199753))

(declare-fun m!309877 () Bool)

(assert (=> b!199751 m!309877))

(declare-fun m!309879 () Bool)

(assert (=> d!68375 m!309879))

(declare-fun m!309881 () Bool)

(assert (=> d!68375 m!309881))

(declare-fun m!309883 () Bool)

(assert (=> d!68375 m!309883))

(declare-fun m!309885 () Bool)

(assert (=> d!68375 m!309885))

(declare-fun m!309887 () Bool)

(assert (=> d!68375 m!309887))

(declare-fun m!309889 () Bool)

(assert (=> d!68375 m!309889))

(declare-fun m!309891 () Bool)

(assert (=> d!68375 m!309891))

(declare-fun m!309893 () Bool)

(assert (=> d!68375 m!309893))

(declare-fun m!309895 () Bool)

(assert (=> d!68375 m!309895))

(declare-fun m!309897 () Bool)

(assert (=> d!68375 m!309897))

(declare-fun m!309899 () Bool)

(assert (=> d!68375 m!309899))

(declare-fun m!309901 () Bool)

(assert (=> b!199754 m!309901))

(declare-fun m!309903 () Bool)

(assert (=> b!199753 m!309903))

(assert (=> b!199753 m!308295))

(assert (=> b!199753 m!308241))

(assert (=> b!199755 m!308241))

(declare-fun m!309905 () Bool)

(assert (=> b!199755 m!309905))

(declare-fun m!309907 () Bool)

(assert (=> b!199755 m!309907))

(assert (=> b!198998 d!68375))

(declare-fun d!68377 () Bool)

(assert (=> d!68377 (= (invariant!0 (currentBit!9290 (_2!9202 lt!309529)) (currentByte!9295 (_2!9202 lt!309529)) (size!4456 (buf!4948 (_2!9202 lt!310533)))) (and (bvsge (currentBit!9290 (_2!9202 lt!309529)) #b00000000000000000000000000000000) (bvslt (currentBit!9290 (_2!9202 lt!309529)) #b00000000000000000000000000001000) (bvsge (currentByte!9295 (_2!9202 lt!309529)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9295 (_2!9202 lt!309529)) (size!4456 (buf!4948 (_2!9202 lt!310533)))) (and (= (currentBit!9290 (_2!9202 lt!309529)) #b00000000000000000000000000000000) (= (currentByte!9295 (_2!9202 lt!309529)) (size!4456 (buf!4948 (_2!9202 lt!310533))))))))))

(assert (=> b!198998 d!68377))

(declare-fun d!68379 () Bool)

(assert (=> d!68379 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310546)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309529))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309529))) lt!310506) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310546)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309529))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309529)))) lt!310506))))

(declare-fun bs!16849 () Bool)

(assert (= bs!16849 d!68379))

(declare-fun m!309909 () Bool)

(assert (=> bs!16849 m!309909))

(assert (=> b!198998 d!68379))

(declare-fun d!68381 () Bool)

(assert (=> d!68381 (= (onesLSBLong!0 nBits!348) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!348))))))

(assert (=> b!198998 d!68381))

(declare-fun b!199756 () Bool)

(declare-fun res!167217 () Bool)

(declare-fun e!137078 () Bool)

(assert (=> b!199756 (=> (not res!167217) (not e!137078))))

(declare-fun lt!311859 () tuple2!17108)

(declare-fun lt!311858 () (_ BitVec 64))

(declare-fun lt!311856 () (_ BitVec 64))

(assert (=> b!199756 (= res!167217 (= (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!311859))) (currentByte!9295 (_2!9202 lt!311859)) (currentBit!9290 (_2!9202 lt!311859))) (bvadd lt!311856 lt!311858)))))

(assert (=> b!199756 (or (not (= (bvand lt!311856 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311858 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311856 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311856 lt!311858) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199756 (= lt!311858 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!199756 (= lt!311856 (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))))))

(declare-fun d!68383 () Bool)

(assert (=> d!68383 e!137078))

(declare-fun res!167218 () Bool)

(assert (=> d!68383 (=> (not res!167218) (not e!137078))))

(assert (=> d!68383 (= res!167218 (= (size!4456 (buf!4948 (_2!9202 lt!309529))) (size!4456 (buf!4948 (_2!9202 lt!311859)))))))

(assert (=> d!68383 (= lt!311859 (choose!16 (_2!9202 lt!309529) lt!310537))))

(assert (=> d!68383 (validate_offset_bit!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!309529)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309529))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309529))))))

(assert (=> d!68383 (= (appendBit!0 (_2!9202 lt!309529) lt!310537) lt!311859)))

(declare-fun b!199759 () Bool)

(declare-fun e!137079 () Bool)

(declare-fun lt!311857 () tuple2!17114)

(assert (=> b!199759 (= e!137079 (= (bitIndex!0 (size!4456 (buf!4948 (_1!9205 lt!311857))) (currentByte!9295 (_1!9205 lt!311857)) (currentBit!9290 (_1!9205 lt!311857))) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!311859))) (currentByte!9295 (_2!9202 lt!311859)) (currentBit!9290 (_2!9202 lt!311859)))))))

(declare-fun b!199758 () Bool)

(assert (=> b!199758 (= e!137078 e!137079)))

(declare-fun res!167219 () Bool)

(assert (=> b!199758 (=> (not res!167219) (not e!137079))))

(assert (=> b!199758 (= res!167219 (and (= (_2!9205 lt!311857) lt!310537) (= (_1!9205 lt!311857) (_2!9202 lt!311859))))))

(assert (=> b!199758 (= lt!311857 (readBitPure!0 (readerFrom!0 (_2!9202 lt!311859) (currentBit!9290 (_2!9202 lt!309529)) (currentByte!9295 (_2!9202 lt!309529)))))))

(declare-fun b!199757 () Bool)

(declare-fun res!167220 () Bool)

(assert (=> b!199757 (=> (not res!167220) (not e!137078))))

(assert (=> b!199757 (= res!167220 (isPrefixOf!0 (_2!9202 lt!309529) (_2!9202 lt!311859)))))

(assert (= (and d!68383 res!167218) b!199756))

(assert (= (and b!199756 res!167217) b!199757))

(assert (= (and b!199757 res!167220) b!199758))

(assert (= (and b!199758 res!167219) b!199759))

(declare-fun m!309911 () Bool)

(assert (=> d!68383 m!309911))

(declare-fun m!309913 () Bool)

(assert (=> d!68383 m!309913))

(declare-fun m!309915 () Bool)

(assert (=> b!199756 m!309915))

(assert (=> b!199756 m!307539))

(declare-fun m!309917 () Bool)

(assert (=> b!199759 m!309917))

(assert (=> b!199759 m!309915))

(declare-fun m!309919 () Bool)

(assert (=> b!199757 m!309919))

(declare-fun m!309921 () Bool)

(assert (=> b!199758 m!309921))

(assert (=> b!199758 m!309921))

(declare-fun m!309923 () Bool)

(assert (=> b!199758 m!309923))

(assert (=> b!198998 d!68383))

(declare-fun d!68385 () Bool)

(assert (=> d!68385 (= (invariant!0 (currentBit!9290 lt!310499) (currentByte!9295 lt!310499) (size!4456 (buf!4948 (_2!9202 lt!310546)))) (and (bvsge (currentBit!9290 lt!310499) #b00000000000000000000000000000000) (bvslt (currentBit!9290 lt!310499) #b00000000000000000000000000001000) (bvsge (currentByte!9295 lt!310499) #b00000000000000000000000000000000) (or (bvslt (currentByte!9295 lt!310499) (size!4456 (buf!4948 (_2!9202 lt!310546)))) (and (= (currentBit!9290 lt!310499) #b00000000000000000000000000000000) (= (currentByte!9295 lt!310499) (size!4456 (buf!4948 (_2!9202 lt!310546))))))))))

(assert (=> b!198998 d!68385))

(declare-fun d!68387 () Bool)

(declare-fun e!137080 () Bool)

(assert (=> d!68387 e!137080))

(declare-fun res!167222 () Bool)

(assert (=> d!68387 (=> (not res!167222) (not e!137080))))

(declare-fun lt!311861 () (_ BitVec 64))

(declare-fun lt!311862 () (_ BitVec 64))

(declare-fun lt!311865 () (_ BitVec 64))

(assert (=> d!68387 (= res!167222 (= lt!311865 (bvsub lt!311861 lt!311862)))))

(assert (=> d!68387 (or (= (bvand lt!311861 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311862 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311861 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311861 lt!311862) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68387 (= lt!311862 (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310546)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!310546))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!310546)))))))

(declare-fun lt!311864 () (_ BitVec 64))

(declare-fun lt!311860 () (_ BitVec 64))

(assert (=> d!68387 (= lt!311861 (bvmul lt!311864 lt!311860))))

(assert (=> d!68387 (or (= lt!311864 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311860 (bvsdiv (bvmul lt!311864 lt!311860) lt!311864)))))

(assert (=> d!68387 (= lt!311860 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68387 (= lt!311864 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310546)))))))

(assert (=> d!68387 (= lt!311865 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!310546))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!310546)))))))

(assert (=> d!68387 (invariant!0 (currentBit!9290 (_2!9202 lt!310546)) (currentByte!9295 (_2!9202 lt!310546)) (size!4456 (buf!4948 (_2!9202 lt!310546))))))

(assert (=> d!68387 (= (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310546))) (currentByte!9295 (_2!9202 lt!310546)) (currentBit!9290 (_2!9202 lt!310546))) lt!311865)))

(declare-fun b!199760 () Bool)

(declare-fun res!167221 () Bool)

(assert (=> b!199760 (=> (not res!167221) (not e!137080))))

(assert (=> b!199760 (= res!167221 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311865))))

(declare-fun b!199761 () Bool)

(declare-fun lt!311863 () (_ BitVec 64))

(assert (=> b!199761 (= e!137080 (bvsle lt!311865 (bvmul lt!311863 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199761 (or (= lt!311863 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311863 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311863)))))

(assert (=> b!199761 (= lt!311863 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310546)))))))

(assert (= (and d!68387 res!167222) b!199760))

(assert (= (and b!199760 res!167221) b!199761))

(declare-fun m!309925 () Bool)

(assert (=> d!68387 m!309925))

(assert (=> d!68387 m!308237))

(assert (=> b!198998 d!68387))

(declare-fun d!68389 () Bool)

(declare-fun lt!311866 () tuple2!17136)

(assert (=> d!68389 (= lt!311866 (readBit!0 lt!310496))))

(assert (=> d!68389 (= (readBitPure!0 lt!310496) (tuple2!17115 (_2!9216 lt!311866) (_1!9216 lt!311866)))))

(declare-fun bs!16850 () Bool)

(assert (= bs!16850 d!68389))

(declare-fun m!309927 () Bool)

(assert (=> bs!16850 m!309927))

(assert (=> b!198998 d!68389))

(declare-fun lt!311867 () tuple2!17138)

(declare-fun d!68391 () Bool)

(assert (=> d!68391 (= lt!311867 (readNBitsLSBFirstsLoop!0 (_1!9203 lt!310518) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!310529))))

(assert (=> d!68391 (= (readNBitsLSBFirstsLoopPure!0 (_1!9203 lt!310518) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!310529) (tuple2!17113 (_2!9217 lt!311867) (_1!9217 lt!311867)))))

(declare-fun bs!16851 () Bool)

(assert (= bs!16851 d!68391))

(declare-fun m!309929 () Bool)

(assert (=> bs!16851 m!309929))

(assert (=> b!198998 d!68391))

(declare-fun d!68393 () Bool)

(declare-fun e!137081 () Bool)

(assert (=> d!68393 e!137081))

(declare-fun res!167223 () Bool)

(assert (=> d!68393 (=> (not res!167223) (not e!137081))))

(declare-fun lt!311868 () BitStream!8020)

(declare-fun lt!311869 () (_ BitVec 64))

(assert (=> d!68393 (= res!167223 (= (bvadd lt!311869 (bvsub (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310533))) (currentByte!9295 (_2!9202 lt!310533)) (currentBit!9290 (_2!9202 lt!310533))) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310546))) (currentByte!9295 (_2!9202 lt!310546)) (currentBit!9290 (_2!9202 lt!310546))))) (bitIndex!0 (size!4456 (buf!4948 lt!311868)) (currentByte!9295 lt!311868) (currentBit!9290 lt!311868))))))

(assert (=> d!68393 (or (not (= (bvand lt!311869 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310533))) (currentByte!9295 (_2!9202 lt!310533)) (currentBit!9290 (_2!9202 lt!310533))) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310546))) (currentByte!9295 (_2!9202 lt!310546)) (currentBit!9290 (_2!9202 lt!310546)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311869 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311869 (bvsub (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310533))) (currentByte!9295 (_2!9202 lt!310533)) (currentBit!9290 (_2!9202 lt!310533))) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310546))) (currentByte!9295 (_2!9202 lt!310546)) (currentBit!9290 (_2!9202 lt!310546))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68393 (= lt!311869 (bitIndex!0 (size!4456 (buf!4948 (_2!9203 lt!310503))) (currentByte!9295 (_2!9203 lt!310503)) (currentBit!9290 (_2!9203 lt!310503))))))

(assert (=> d!68393 (= lt!311868 (_2!9202 (moveBitIndex!0 (_2!9203 lt!310503) (bvsub (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310533))) (currentByte!9295 (_2!9202 lt!310533)) (currentBit!9290 (_2!9202 lt!310533))) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310546))) (currentByte!9295 (_2!9202 lt!310546)) (currentBit!9290 (_2!9202 lt!310546)))))))))

(assert (=> d!68393 (moveBitIndexPrecond!0 (_2!9203 lt!310503) (bvsub (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310533))) (currentByte!9295 (_2!9202 lt!310533)) (currentBit!9290 (_2!9202 lt!310533))) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310546))) (currentByte!9295 (_2!9202 lt!310546)) (currentBit!9290 (_2!9202 lt!310546)))))))

(assert (=> d!68393 (= (withMovedBitIndex!0 (_2!9203 lt!310503) (bvsub (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310533))) (currentByte!9295 (_2!9202 lt!310533)) (currentBit!9290 (_2!9202 lt!310533))) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310546))) (currentByte!9295 (_2!9202 lt!310546)) (currentBit!9290 (_2!9202 lt!310546))))) lt!311868)))

(declare-fun b!199762 () Bool)

(assert (=> b!199762 (= e!137081 (= (size!4456 (buf!4948 (_2!9203 lt!310503))) (size!4456 (buf!4948 lt!311868))))))

(assert (= (and d!68393 res!167223) b!199762))

(declare-fun m!309931 () Bool)

(assert (=> d!68393 m!309931))

(declare-fun m!309933 () Bool)

(assert (=> d!68393 m!309933))

(declare-fun m!309935 () Bool)

(assert (=> d!68393 m!309935))

(declare-fun m!309937 () Bool)

(assert (=> d!68393 m!309937))

(assert (=> b!198998 d!68393))

(declare-fun d!68395 () Bool)

(assert (=> d!68395 (isPrefixOf!0 (_2!9202 lt!309529) (_2!9202 lt!310546))))

(declare-fun lt!311870 () Unit!14058)

(assert (=> d!68395 (= lt!311870 (choose!30 (_2!9202 lt!309529) (_2!9202 lt!310533) (_2!9202 lt!310546)))))

(assert (=> d!68395 (isPrefixOf!0 (_2!9202 lt!309529) (_2!9202 lt!310533))))

(assert (=> d!68395 (= (lemmaIsPrefixTransitive!0 (_2!9202 lt!309529) (_2!9202 lt!310533) (_2!9202 lt!310546)) lt!311870)))

(declare-fun bs!16852 () Bool)

(assert (= bs!16852 d!68395))

(assert (=> bs!16852 m!308239))

(declare-fun m!309939 () Bool)

(assert (=> bs!16852 m!309939))

(declare-fun m!309941 () Bool)

(assert (=> bs!16852 m!309941))

(assert (=> b!198998 d!68395))

(declare-fun b!199763 () Bool)

(declare-fun res!167224 () Bool)

(declare-fun e!137083 () Bool)

(assert (=> b!199763 (=> (not res!167224) (not e!137083))))

(declare-fun lt!311875 () tuple2!17110)

(assert (=> b!199763 (= res!167224 (isPrefixOf!0 (_1!9203 lt!311875) (_2!9202 lt!309529)))))

(declare-fun d!68397 () Bool)

(assert (=> d!68397 e!137083))

(declare-fun res!167225 () Bool)

(assert (=> d!68397 (=> (not res!167225) (not e!137083))))

(assert (=> d!68397 (= res!167225 (isPrefixOf!0 (_1!9203 lt!311875) (_2!9203 lt!311875)))))

(declare-fun lt!311884 () BitStream!8020)

(assert (=> d!68397 (= lt!311875 (tuple2!17111 lt!311884 (_2!9202 lt!310546)))))

(declare-fun lt!311873 () Unit!14058)

(declare-fun lt!311881 () Unit!14058)

(assert (=> d!68397 (= lt!311873 lt!311881)))

(assert (=> d!68397 (isPrefixOf!0 lt!311884 (_2!9202 lt!310546))))

(assert (=> d!68397 (= lt!311881 (lemmaIsPrefixTransitive!0 lt!311884 (_2!9202 lt!310546) (_2!9202 lt!310546)))))

(declare-fun lt!311872 () Unit!14058)

(declare-fun lt!311885 () Unit!14058)

(assert (=> d!68397 (= lt!311872 lt!311885)))

(assert (=> d!68397 (isPrefixOf!0 lt!311884 (_2!9202 lt!310546))))

(assert (=> d!68397 (= lt!311885 (lemmaIsPrefixTransitive!0 lt!311884 (_2!9202 lt!309529) (_2!9202 lt!310546)))))

(declare-fun lt!311878 () Unit!14058)

(declare-fun e!137082 () Unit!14058)

(assert (=> d!68397 (= lt!311878 e!137082)))

(declare-fun c!9969 () Bool)

(assert (=> d!68397 (= c!9969 (not (= (size!4456 (buf!4948 (_2!9202 lt!309529))) #b00000000000000000000000000000000)))))

(declare-fun lt!311890 () Unit!14058)

(declare-fun lt!311888 () Unit!14058)

(assert (=> d!68397 (= lt!311890 lt!311888)))

(assert (=> d!68397 (isPrefixOf!0 (_2!9202 lt!310546) (_2!9202 lt!310546))))

(assert (=> d!68397 (= lt!311888 (lemmaIsPrefixRefl!0 (_2!9202 lt!310546)))))

(declare-fun lt!311886 () Unit!14058)

(declare-fun lt!311876 () Unit!14058)

(assert (=> d!68397 (= lt!311886 lt!311876)))

(assert (=> d!68397 (= lt!311876 (lemmaIsPrefixRefl!0 (_2!9202 lt!310546)))))

(declare-fun lt!311887 () Unit!14058)

(declare-fun lt!311879 () Unit!14058)

(assert (=> d!68397 (= lt!311887 lt!311879)))

(assert (=> d!68397 (isPrefixOf!0 lt!311884 lt!311884)))

(assert (=> d!68397 (= lt!311879 (lemmaIsPrefixRefl!0 lt!311884))))

(declare-fun lt!311880 () Unit!14058)

(declare-fun lt!311877 () Unit!14058)

(assert (=> d!68397 (= lt!311880 lt!311877)))

(assert (=> d!68397 (isPrefixOf!0 (_2!9202 lt!309529) (_2!9202 lt!309529))))

(assert (=> d!68397 (= lt!311877 (lemmaIsPrefixRefl!0 (_2!9202 lt!309529)))))

(assert (=> d!68397 (= lt!311884 (BitStream!8021 (buf!4948 (_2!9202 lt!310546)) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))))))

(assert (=> d!68397 (isPrefixOf!0 (_2!9202 lt!309529) (_2!9202 lt!310546))))

(assert (=> d!68397 (= (reader!0 (_2!9202 lt!309529) (_2!9202 lt!310546)) lt!311875)))

(declare-fun b!199764 () Bool)

(declare-fun Unit!14186 () Unit!14058)

(assert (=> b!199764 (= e!137082 Unit!14186)))

(declare-fun lt!311883 () (_ BitVec 64))

(declare-fun lt!311882 () (_ BitVec 64))

(declare-fun b!199765 () Bool)

(assert (=> b!199765 (= e!137083 (= (_1!9203 lt!311875) (withMovedBitIndex!0 (_2!9203 lt!311875) (bvsub lt!311883 lt!311882))))))

(assert (=> b!199765 (or (= (bvand lt!311883 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311882 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311883 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311883 lt!311882) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199765 (= lt!311882 (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310546))) (currentByte!9295 (_2!9202 lt!310546)) (currentBit!9290 (_2!9202 lt!310546))))))

(assert (=> b!199765 (= lt!311883 (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))))))

(declare-fun b!199766 () Bool)

(declare-fun res!167226 () Bool)

(assert (=> b!199766 (=> (not res!167226) (not e!137083))))

(assert (=> b!199766 (= res!167226 (isPrefixOf!0 (_2!9203 lt!311875) (_2!9202 lt!310546)))))

(declare-fun b!199767 () Bool)

(declare-fun lt!311871 () Unit!14058)

(assert (=> b!199767 (= e!137082 lt!311871)))

(declare-fun lt!311889 () (_ BitVec 64))

(assert (=> b!199767 (= lt!311889 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!311874 () (_ BitVec 64))

(assert (=> b!199767 (= lt!311874 (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))))))

(assert (=> b!199767 (= lt!311871 (arrayBitRangesEqSymmetric!0 (buf!4948 (_2!9202 lt!309529)) (buf!4948 (_2!9202 lt!310546)) lt!311889 lt!311874))))

(assert (=> b!199767 (arrayBitRangesEq!0 (buf!4948 (_2!9202 lt!310546)) (buf!4948 (_2!9202 lt!309529)) lt!311889 lt!311874)))

(assert (= (and d!68397 c!9969) b!199767))

(assert (= (and d!68397 (not c!9969)) b!199764))

(assert (= (and d!68397 res!167225) b!199763))

(assert (= (and b!199763 res!167224) b!199766))

(assert (= (and b!199766 res!167226) b!199765))

(declare-fun m!309943 () Bool)

(assert (=> b!199763 m!309943))

(assert (=> d!68397 m!307961))

(declare-fun m!309945 () Bool)

(assert (=> d!68397 m!309945))

(declare-fun m!309947 () Bool)

(assert (=> d!68397 m!309947))

(assert (=> d!68397 m!308239))

(assert (=> d!68397 m!309887))

(declare-fun m!309949 () Bool)

(assert (=> d!68397 m!309949))

(declare-fun m!309951 () Bool)

(assert (=> d!68397 m!309951))

(declare-fun m!309953 () Bool)

(assert (=> d!68397 m!309953))

(declare-fun m!309955 () Bool)

(assert (=> d!68397 m!309955))

(assert (=> d!68397 m!307975))

(assert (=> d!68397 m!309899))

(declare-fun m!309957 () Bool)

(assert (=> b!199766 m!309957))

(declare-fun m!309959 () Bool)

(assert (=> b!199765 m!309959))

(assert (=> b!199765 m!308295))

(assert (=> b!199765 m!307539))

(assert (=> b!199767 m!307539))

(declare-fun m!309961 () Bool)

(assert (=> b!199767 m!309961))

(declare-fun m!309963 () Bool)

(assert (=> b!199767 m!309963))

(assert (=> b!198998 d!68397))

(declare-fun d!68399 () Bool)

(assert (=> d!68399 (validate_offset_bits!1 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310546)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309529))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309529))) lt!310522)))

(declare-fun lt!311891 () Unit!14058)

(assert (=> d!68399 (= lt!311891 (choose!9 (_2!9202 lt!309529) (buf!4948 (_2!9202 lt!310546)) lt!310522 (BitStream!8021 (buf!4948 (_2!9202 lt!310546)) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529)))))))

(assert (=> d!68399 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9202 lt!309529) (buf!4948 (_2!9202 lt!310546)) lt!310522) lt!311891)))

(declare-fun bs!16853 () Bool)

(assert (= bs!16853 d!68399))

(assert (=> bs!16853 m!308231))

(declare-fun m!309965 () Bool)

(assert (=> bs!16853 m!309965))

(assert (=> b!198998 d!68399))

(declare-fun d!68401 () Bool)

(declare-fun e!137084 () Bool)

(assert (=> d!68401 e!137084))

(declare-fun res!167228 () Bool)

(assert (=> d!68401 (=> (not res!167228) (not e!137084))))

(declare-fun lt!311893 () (_ BitVec 64))

(declare-fun lt!311897 () (_ BitVec 64))

(declare-fun lt!311894 () (_ BitVec 64))

(assert (=> d!68401 (= res!167228 (= lt!311897 (bvsub lt!311893 lt!311894)))))

(assert (=> d!68401 (or (= (bvand lt!311893 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311894 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311893 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311893 lt!311894) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68401 (= lt!311894 (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!310504)))) ((_ sign_extend 32) (currentByte!9295 (_1!9205 lt!310504))) ((_ sign_extend 32) (currentBit!9290 (_1!9205 lt!310504)))))))

(declare-fun lt!311896 () (_ BitVec 64))

(declare-fun lt!311892 () (_ BitVec 64))

(assert (=> d!68401 (= lt!311893 (bvmul lt!311896 lt!311892))))

(assert (=> d!68401 (or (= lt!311896 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311892 (bvsdiv (bvmul lt!311896 lt!311892) lt!311896)))))

(assert (=> d!68401 (= lt!311892 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68401 (= lt!311896 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!310504)))))))

(assert (=> d!68401 (= lt!311897 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 (_1!9205 lt!310504))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 (_1!9205 lt!310504)))))))

(assert (=> d!68401 (invariant!0 (currentBit!9290 (_1!9205 lt!310504)) (currentByte!9295 (_1!9205 lt!310504)) (size!4456 (buf!4948 (_1!9205 lt!310504))))))

(assert (=> d!68401 (= (bitIndex!0 (size!4456 (buf!4948 (_1!9205 lt!310504))) (currentByte!9295 (_1!9205 lt!310504)) (currentBit!9290 (_1!9205 lt!310504))) lt!311897)))

(declare-fun b!199768 () Bool)

(declare-fun res!167227 () Bool)

(assert (=> b!199768 (=> (not res!167227) (not e!137084))))

(assert (=> b!199768 (= res!167227 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311897))))

(declare-fun b!199769 () Bool)

(declare-fun lt!311895 () (_ BitVec 64))

(assert (=> b!199769 (= e!137084 (bvsle lt!311897 (bvmul lt!311895 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199769 (or (= lt!311895 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311895 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311895)))))

(assert (=> b!199769 (= lt!311895 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!310504)))))))

(assert (= (and d!68401 res!167228) b!199768))

(assert (= (and b!199768 res!167227) b!199769))

(declare-fun m!309967 () Bool)

(assert (=> d!68401 m!309967))

(declare-fun m!309969 () Bool)

(assert (=> d!68401 m!309969))

(assert (=> b!198998 d!68401))

(declare-fun d!68403 () Bool)

(assert (=> d!68403 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310546)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309529))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309529))) lt!310522) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310546)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309529))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309529)))) lt!310522))))

(declare-fun bs!16854 () Bool)

(assert (= bs!16854 d!68403))

(assert (=> bs!16854 m!309909))

(assert (=> b!198998 d!68403))

(declare-fun lt!311898 () tuple2!17138)

(declare-fun d!68405 () Bool)

(assert (=> d!68405 (= lt!311898 (readNBitsLSBFirstsLoop!0 (_1!9203 lt!310503) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!310529 (ite (_2!9205 lt!310528) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!68405 (= (readNBitsLSBFirstsLoopPure!0 (_1!9203 lt!310503) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!310529 (ite (_2!9205 lt!310528) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!17113 (_2!9217 lt!311898) (_1!9217 lt!311898)))))

(declare-fun bs!16855 () Bool)

(assert (= bs!16855 d!68405))

(declare-fun m!309971 () Bool)

(assert (=> bs!16855 m!309971))

(assert (=> b!198998 d!68405))

(declare-fun b!199770 () Bool)

(declare-fun res!167229 () Bool)

(declare-fun e!137087 () Bool)

(assert (=> b!199770 (=> (not res!167229) (not e!137087))))

(declare-fun lt!311936 () tuple2!17108)

(assert (=> b!199770 (= res!167229 (= (size!4456 (buf!4948 (_2!9202 lt!310533))) (size!4456 (buf!4948 (_2!9202 lt!311936)))))))

(declare-fun d!68407 () Bool)

(assert (=> d!68407 e!137087))

(declare-fun res!167239 () Bool)

(assert (=> d!68407 (=> (not res!167239) (not e!137087))))

(assert (=> d!68407 (= res!167239 (invariant!0 (currentBit!9290 (_2!9202 lt!311936)) (currentByte!9295 (_2!9202 lt!311936)) (size!4456 (buf!4948 (_2!9202 lt!311936)))))))

(declare-fun e!137086 () tuple2!17108)

(assert (=> d!68407 (= lt!311936 e!137086)))

(declare-fun c!9971 () Bool)

(assert (=> d!68407 (= c!9971 (= (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) nBits!348))))

(assert (=> d!68407 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!68407 (= (appendBitsLSBFirstLoopTR!0 (_2!9202 lt!310533) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)) lt!311936)))

(declare-fun b!199771 () Bool)

(declare-fun e!137093 () (_ BitVec 64))

(assert (=> b!199771 (= e!137093 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!199772 () Bool)

(declare-fun e!137091 () Bool)

(declare-fun lt!311949 () tuple2!17112)

(declare-fun lt!311903 () tuple2!17110)

(assert (=> b!199772 (= e!137091 (= (_1!9204 lt!311949) (_2!9203 lt!311903)))))

(declare-fun lt!311911 () tuple2!17108)

(declare-fun call!3164 () Bool)

(declare-fun bm!3161 () Bool)

(assert (=> bm!3161 (= call!3164 (isPrefixOf!0 (_2!9202 lt!310533) (ite c!9971 (_2!9202 lt!310533) (_2!9202 lt!311911))))))

(declare-fun b!199773 () Bool)

(declare-fun e!137090 () Bool)

(declare-fun lt!311945 () tuple2!17114)

(declare-fun lt!311910 () tuple2!17114)

(assert (=> b!199773 (= e!137090 (= (_2!9205 lt!311945) (_2!9205 lt!311910)))))

(declare-fun b!199774 () Bool)

(declare-fun res!167232 () Bool)

(assert (=> b!199774 (= res!167232 call!3164)))

(declare-fun e!137089 () Bool)

(assert (=> b!199774 (=> (not res!167232) (not e!137089))))

(declare-fun b!199775 () Bool)

(declare-fun Unit!14187 () Unit!14058)

(assert (=> b!199775 (= e!137086 (tuple2!17109 Unit!14187 (_2!9202 lt!310533)))))

(declare-fun lt!311942 () Unit!14058)

(assert (=> b!199775 (= lt!311942 (lemmaIsPrefixRefl!0 (_2!9202 lt!310533)))))

(assert (=> b!199775 call!3164))

(declare-fun lt!311899 () Unit!14058)

(assert (=> b!199775 (= lt!311899 lt!311942)))

(declare-fun b!199776 () Bool)

(assert (=> b!199776 (= e!137093 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun b!199777 () Bool)

(declare-fun e!137085 () Bool)

(declare-fun lt!311908 () tuple2!17112)

(declare-fun lt!311904 () tuple2!17110)

(assert (=> b!199777 (= e!137085 (= (_1!9204 lt!311908) (_2!9203 lt!311904)))))

(declare-fun b!199778 () Bool)

(declare-fun e!137088 () Bool)

(declare-fun lt!311917 () tuple2!17114)

(assert (=> b!199778 (= e!137088 (= (bitIndex!0 (size!4456 (buf!4948 (_1!9205 lt!311917))) (currentByte!9295 (_1!9205 lt!311917)) (currentBit!9290 (_1!9205 lt!311917))) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!311911))) (currentByte!9295 (_2!9202 lt!311911)) (currentBit!9290 (_2!9202 lt!311911)))))))

(declare-fun b!199779 () Bool)

(declare-fun res!167231 () Bool)

(assert (=> b!199779 (= res!167231 (= (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!311911))) (currentByte!9295 (_2!9202 lt!311911)) (currentBit!9290 (_2!9202 lt!311911))) (bvadd (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310533))) (currentByte!9295 (_2!9202 lt!310533)) (currentBit!9290 (_2!9202 lt!310533))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!199779 (=> (not res!167231) (not e!137089))))

(declare-fun b!199780 () Bool)

(assert (=> b!199780 (= e!137087 e!137085)))

(declare-fun res!167237 () Bool)

(assert (=> b!199780 (=> (not res!167237) (not e!137085))))

(assert (=> b!199780 (= res!167237 (= (_2!9204 lt!311908) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!199780 (= lt!311908 (readNBitsLSBFirstsLoopPure!0 (_1!9203 lt!311904) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))))

(declare-fun lt!311947 () Unit!14058)

(declare-fun lt!311925 () Unit!14058)

(assert (=> b!199780 (= lt!311947 lt!311925)))

(declare-fun lt!311916 () (_ BitVec 64))

(assert (=> b!199780 (validate_offset_bits!1 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!311936)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!310533))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!310533))) lt!311916)))

(assert (=> b!199780 (= lt!311925 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9202 lt!310533) (buf!4948 (_2!9202 lt!311936)) lt!311916))))

(declare-fun e!137092 () Bool)

(assert (=> b!199780 e!137092))

(declare-fun res!167235 () Bool)

(assert (=> b!199780 (=> (not res!167235) (not e!137092))))

(assert (=> b!199780 (= res!167235 (and (= (size!4456 (buf!4948 (_2!9202 lt!310533))) (size!4456 (buf!4948 (_2!9202 lt!311936)))) (bvsge lt!311916 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199780 (= lt!311916 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(assert (=> b!199780 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!199780 (= lt!311904 (reader!0 (_2!9202 lt!310533) (_2!9202 lt!311936)))))

(declare-fun b!199781 () Bool)

(declare-fun lt!311952 () tuple2!17108)

(assert (=> b!199781 (= e!137086 (tuple2!17109 (_1!9202 lt!311952) (_2!9202 lt!311952)))))

(declare-fun lt!311943 () Bool)

(assert (=> b!199781 (= lt!311943 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199781 (= lt!311911 (appendBit!0 (_2!9202 lt!310533) lt!311943))))

(declare-fun res!167240 () Bool)

(assert (=> b!199781 (= res!167240 (= (size!4456 (buf!4948 (_2!9202 lt!310533))) (size!4456 (buf!4948 (_2!9202 lt!311911)))))))

(assert (=> b!199781 (=> (not res!167240) (not e!137089))))

(assert (=> b!199781 e!137089))

(declare-fun lt!311939 () tuple2!17108)

(assert (=> b!199781 (= lt!311939 lt!311911)))

(assert (=> b!199781 (= lt!311952 (appendBitsLSBFirstLoopTR!0 (_2!9202 lt!311939) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!311938 () Unit!14058)

(assert (=> b!199781 (= lt!311938 (lemmaIsPrefixTransitive!0 (_2!9202 lt!310533) (_2!9202 lt!311939) (_2!9202 lt!311952)))))

(assert (=> b!199781 (isPrefixOf!0 (_2!9202 lt!310533) (_2!9202 lt!311952))))

(declare-fun lt!311922 () Unit!14058)

(assert (=> b!199781 (= lt!311922 lt!311938)))

(assert (=> b!199781 (invariant!0 (currentBit!9290 (_2!9202 lt!310533)) (currentByte!9295 (_2!9202 lt!310533)) (size!4456 (buf!4948 (_2!9202 lt!311939))))))

(declare-fun lt!311905 () BitStream!8020)

(assert (=> b!199781 (= lt!311905 (BitStream!8021 (buf!4948 (_2!9202 lt!311939)) (currentByte!9295 (_2!9202 lt!310533)) (currentBit!9290 (_2!9202 lt!310533))))))

(assert (=> b!199781 (invariant!0 (currentBit!9290 lt!311905) (currentByte!9295 lt!311905) (size!4456 (buf!4948 (_2!9202 lt!311952))))))

(declare-fun lt!311902 () BitStream!8020)

(assert (=> b!199781 (= lt!311902 (BitStream!8021 (buf!4948 (_2!9202 lt!311952)) (currentByte!9295 lt!311905) (currentBit!9290 lt!311905)))))

(assert (=> b!199781 (= lt!311945 (readBitPure!0 lt!311905))))

(assert (=> b!199781 (= lt!311910 (readBitPure!0 lt!311902))))

(declare-fun lt!311920 () Unit!14058)

(assert (=> b!199781 (= lt!311920 (readBitPrefixLemma!0 lt!311905 (_2!9202 lt!311952)))))

(declare-fun res!167230 () Bool)

(assert (=> b!199781 (= res!167230 (= (bitIndex!0 (size!4456 (buf!4948 (_1!9205 lt!311945))) (currentByte!9295 (_1!9205 lt!311945)) (currentBit!9290 (_1!9205 lt!311945))) (bitIndex!0 (size!4456 (buf!4948 (_1!9205 lt!311910))) (currentByte!9295 (_1!9205 lt!311910)) (currentBit!9290 (_1!9205 lt!311910)))))))

(assert (=> b!199781 (=> (not res!167230) (not e!137090))))

(assert (=> b!199781 e!137090))

(declare-fun lt!311906 () Unit!14058)

(assert (=> b!199781 (= lt!311906 lt!311920)))

(declare-fun lt!311924 () tuple2!17110)

(assert (=> b!199781 (= lt!311924 (reader!0 (_2!9202 lt!310533) (_2!9202 lt!311952)))))

(declare-fun lt!311909 () tuple2!17110)

(assert (=> b!199781 (= lt!311909 (reader!0 (_2!9202 lt!311939) (_2!9202 lt!311952)))))

(declare-fun lt!311934 () tuple2!17114)

(assert (=> b!199781 (= lt!311934 (readBitPure!0 (_1!9203 lt!311924)))))

(assert (=> b!199781 (= (_2!9205 lt!311934) lt!311943)))

(declare-fun lt!311941 () Unit!14058)

(declare-fun Unit!14188 () Unit!14058)

(assert (=> b!199781 (= lt!311941 Unit!14188)))

(declare-fun lt!311935 () (_ BitVec 64))

(assert (=> b!199781 (= lt!311935 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!311928 () (_ BitVec 64))

(assert (=> b!199781 (= lt!311928 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!311913 () Unit!14058)

(assert (=> b!199781 (= lt!311913 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9202 lt!310533) (buf!4948 (_2!9202 lt!311952)) lt!311928))))

(assert (=> b!199781 (validate_offset_bits!1 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!311952)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!310533))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!310533))) lt!311928)))

(declare-fun lt!311929 () Unit!14058)

(assert (=> b!199781 (= lt!311929 lt!311913)))

(declare-fun lt!311914 () tuple2!17112)

(assert (=> b!199781 (= lt!311914 (readNBitsLSBFirstsLoopPure!0 (_1!9203 lt!311924) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!311935))))

(declare-fun lt!311948 () (_ BitVec 64))

(assert (=> b!199781 (= lt!311948 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(declare-fun lt!311954 () Unit!14058)

(assert (=> b!199781 (= lt!311954 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9202 lt!311939) (buf!4948 (_2!9202 lt!311952)) lt!311948))))

(assert (=> b!199781 (validate_offset_bits!1 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!311952)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!311939))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!311939))) lt!311948)))

(declare-fun lt!311946 () Unit!14058)

(assert (=> b!199781 (= lt!311946 lt!311954)))

(declare-fun lt!311953 () tuple2!17112)

(assert (=> b!199781 (= lt!311953 (readNBitsLSBFirstsLoopPure!0 (_1!9203 lt!311909) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!311935 (ite (_2!9205 lt!311934) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!311923 () tuple2!17112)

(assert (=> b!199781 (= lt!311923 (readNBitsLSBFirstsLoopPure!0 (_1!9203 lt!311924) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!311935))))

(declare-fun c!9970 () Bool)

(assert (=> b!199781 (= c!9970 (_2!9205 (readBitPure!0 (_1!9203 lt!311924))))))

(declare-fun lt!311927 () tuple2!17112)

(assert (=> b!199781 (= lt!311927 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9203 lt!311924) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!311935 e!137093)))))

(declare-fun lt!311926 () Unit!14058)

(assert (=> b!199781 (= lt!311926 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9203 lt!311924) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!311935))))

(assert (=> b!199781 (and (= (_2!9204 lt!311923) (_2!9204 lt!311927)) (= (_1!9204 lt!311923) (_1!9204 lt!311927)))))

(declare-fun lt!311915 () Unit!14058)

(assert (=> b!199781 (= lt!311915 lt!311926)))

(assert (=> b!199781 (= (_1!9203 lt!311924) (withMovedBitIndex!0 (_2!9203 lt!311924) (bvsub (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310533))) (currentByte!9295 (_2!9202 lt!310533)) (currentBit!9290 (_2!9202 lt!310533))) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!311952))) (currentByte!9295 (_2!9202 lt!311952)) (currentBit!9290 (_2!9202 lt!311952))))))))

(declare-fun lt!311932 () Unit!14058)

(declare-fun Unit!14189 () Unit!14058)

(assert (=> b!199781 (= lt!311932 Unit!14189)))

(assert (=> b!199781 (= (_1!9203 lt!311909) (withMovedBitIndex!0 (_2!9203 lt!311909) (bvsub (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!311939))) (currentByte!9295 (_2!9202 lt!311939)) (currentBit!9290 (_2!9202 lt!311939))) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!311952))) (currentByte!9295 (_2!9202 lt!311952)) (currentBit!9290 (_2!9202 lt!311952))))))))

(declare-fun lt!311944 () Unit!14058)

(declare-fun Unit!14190 () Unit!14058)

(assert (=> b!199781 (= lt!311944 Unit!14190)))

(assert (=> b!199781 (= (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310533))) (currentByte!9295 (_2!9202 lt!310533)) (currentBit!9290 (_2!9202 lt!310533))) (bvsub (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!311939))) (currentByte!9295 (_2!9202 lt!311939)) (currentBit!9290 (_2!9202 lt!311939))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!311907 () Unit!14058)

(declare-fun Unit!14191 () Unit!14058)

(assert (=> b!199781 (= lt!311907 Unit!14191)))

(assert (=> b!199781 (= (_2!9204 lt!311914) (_2!9204 lt!311953))))

(declare-fun lt!311931 () Unit!14058)

(declare-fun Unit!14192 () Unit!14058)

(assert (=> b!199781 (= lt!311931 Unit!14192)))

(assert (=> b!199781 (invariant!0 (currentBit!9290 (_2!9202 lt!311952)) (currentByte!9295 (_2!9202 lt!311952)) (size!4456 (buf!4948 (_2!9202 lt!311952))))))

(declare-fun lt!311933 () Unit!14058)

(declare-fun Unit!14193 () Unit!14058)

(assert (=> b!199781 (= lt!311933 Unit!14193)))

(assert (=> b!199781 (= (size!4456 (buf!4948 (_2!9202 lt!310533))) (size!4456 (buf!4948 (_2!9202 lt!311952))))))

(declare-fun lt!311930 () Unit!14058)

(declare-fun Unit!14194 () Unit!14058)

(assert (=> b!199781 (= lt!311930 Unit!14194)))

(assert (=> b!199781 (= (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!311952))) (currentByte!9295 (_2!9202 lt!311952)) (currentBit!9290 (_2!9202 lt!311952))) (bvsub (bvadd (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310533))) (currentByte!9295 (_2!9202 lt!310533)) (currentBit!9290 (_2!9202 lt!310533))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!311919 () Unit!14058)

(declare-fun Unit!14195 () Unit!14058)

(assert (=> b!199781 (= lt!311919 Unit!14195)))

(declare-fun lt!311950 () Unit!14058)

(declare-fun Unit!14196 () Unit!14058)

(assert (=> b!199781 (= lt!311950 Unit!14196)))

(assert (=> b!199781 (= lt!311903 (reader!0 (_2!9202 lt!310533) (_2!9202 lt!311952)))))

(declare-fun lt!311912 () (_ BitVec 64))

(assert (=> b!199781 (= lt!311912 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!311951 () Unit!14058)

(assert (=> b!199781 (= lt!311951 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9202 lt!310533) (buf!4948 (_2!9202 lt!311952)) lt!311912))))

(assert (=> b!199781 (validate_offset_bits!1 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!311952)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!310533))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!310533))) lt!311912)))

(declare-fun lt!311901 () Unit!14058)

(assert (=> b!199781 (= lt!311901 lt!311951)))

(assert (=> b!199781 (= lt!311949 (readNBitsLSBFirstsLoopPure!0 (_1!9203 lt!311903) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))))

(declare-fun res!167238 () Bool)

(assert (=> b!199781 (= res!167238 (= (_2!9204 lt!311949) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!199781 (=> (not res!167238) (not e!137091))))

(assert (=> b!199781 e!137091))

(declare-fun lt!311918 () Unit!14058)

(declare-fun Unit!14197 () Unit!14058)

(assert (=> b!199781 (= lt!311918 Unit!14197)))

(declare-fun b!199782 () Bool)

(assert (=> b!199782 (= e!137092 (validate_offset_bits!1 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310533)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!310533))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!310533))) lt!311916))))

(declare-fun b!199783 () Bool)

(declare-fun res!167236 () Bool)

(assert (=> b!199783 (=> (not res!167236) (not e!137087))))

(assert (=> b!199783 (= res!167236 (isPrefixOf!0 (_2!9202 lt!310533) (_2!9202 lt!311936)))))

(declare-fun b!199784 () Bool)

(assert (=> b!199784 (= lt!311917 (readBitPure!0 (readerFrom!0 (_2!9202 lt!311911) (currentBit!9290 (_2!9202 lt!310533)) (currentByte!9295 (_2!9202 lt!310533)))))))

(declare-fun res!167234 () Bool)

(assert (=> b!199784 (= res!167234 (and (= (_2!9205 lt!311917) lt!311943) (= (_1!9205 lt!311917) (_2!9202 lt!311911))))))

(assert (=> b!199784 (=> (not res!167234) (not e!137088))))

(assert (=> b!199784 (= e!137089 e!137088)))

(declare-fun b!199785 () Bool)

(declare-fun res!167233 () Bool)

(assert (=> b!199785 (=> (not res!167233) (not e!137087))))

(declare-fun lt!311900 () (_ BitVec 64))

(declare-fun lt!311937 () (_ BitVec 64))

(assert (=> b!199785 (= res!167233 (= (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!311936))) (currentByte!9295 (_2!9202 lt!311936)) (currentBit!9290 (_2!9202 lt!311936))) (bvsub lt!311900 lt!311937)))))

(assert (=> b!199785 (or (= (bvand lt!311900 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311937 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311900 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311900 lt!311937) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199785 (= lt!311937 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!311921 () (_ BitVec 64))

(declare-fun lt!311940 () (_ BitVec 64))

(assert (=> b!199785 (= lt!311900 (bvadd lt!311921 lt!311940))))

(assert (=> b!199785 (or (not (= (bvand lt!311921 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311940 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311921 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311921 lt!311940) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199785 (= lt!311940 ((_ sign_extend 32) nBits!348))))

(assert (=> b!199785 (= lt!311921 (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310533))) (currentByte!9295 (_2!9202 lt!310533)) (currentBit!9290 (_2!9202 lt!310533))))))

(assert (= (and d!68407 c!9971) b!199775))

(assert (= (and d!68407 (not c!9971)) b!199781))

(assert (= (and b!199781 res!167240) b!199779))

(assert (= (and b!199779 res!167231) b!199774))

(assert (= (and b!199774 res!167232) b!199784))

(assert (= (and b!199784 res!167234) b!199778))

(assert (= (and b!199781 res!167230) b!199773))

(assert (= (and b!199781 c!9970) b!199776))

(assert (= (and b!199781 (not c!9970)) b!199771))

(assert (= (and b!199781 res!167238) b!199772))

(assert (= (or b!199775 b!199774) bm!3161))

(assert (= (and d!68407 res!167239) b!199770))

(assert (= (and b!199770 res!167229) b!199785))

(assert (= (and b!199785 res!167233) b!199783))

(assert (= (and b!199783 res!167236) b!199780))

(assert (= (and b!199780 res!167235) b!199782))

(assert (= (and b!199780 res!167237) b!199777))

(declare-fun m!309973 () Bool)

(assert (=> b!199779 m!309973))

(assert (=> b!199779 m!308241))

(declare-fun m!309975 () Bool)

(assert (=> b!199778 m!309975))

(assert (=> b!199778 m!309973))

(assert (=> b!199775 m!309897))

(declare-fun m!309977 () Bool)

(assert (=> b!199785 m!309977))

(assert (=> b!199785 m!308241))

(declare-fun m!309979 () Bool)

(assert (=> b!199782 m!309979))

(declare-fun m!309981 () Bool)

(assert (=> b!199784 m!309981))

(assert (=> b!199784 m!309981))

(declare-fun m!309983 () Bool)

(assert (=> b!199784 m!309983))

(declare-fun m!309985 () Bool)

(assert (=> b!199783 m!309985))

(declare-fun m!309987 () Bool)

(assert (=> b!199781 m!309987))

(declare-fun m!309989 () Bool)

(assert (=> b!199781 m!309989))

(declare-fun m!309991 () Bool)

(assert (=> b!199781 m!309991))

(declare-fun m!309993 () Bool)

(assert (=> b!199781 m!309993))

(declare-fun m!309995 () Bool)

(assert (=> b!199781 m!309995))

(assert (=> b!199781 m!308241))

(declare-fun m!309997 () Bool)

(assert (=> b!199781 m!309997))

(declare-fun m!309999 () Bool)

(assert (=> b!199781 m!309999))

(declare-fun m!310001 () Bool)

(assert (=> b!199781 m!310001))

(declare-fun m!310003 () Bool)

(assert (=> b!199781 m!310003))

(declare-fun m!310005 () Bool)

(assert (=> b!199781 m!310005))

(declare-fun m!310007 () Bool)

(assert (=> b!199781 m!310007))

(declare-fun m!310009 () Bool)

(assert (=> b!199781 m!310009))

(declare-fun m!310011 () Bool)

(assert (=> b!199781 m!310011))

(declare-fun m!310013 () Bool)

(assert (=> b!199781 m!310013))

(declare-fun m!310015 () Bool)

(assert (=> b!199781 m!310015))

(declare-fun m!310017 () Bool)

(assert (=> b!199781 m!310017))

(declare-fun m!310019 () Bool)

(assert (=> b!199781 m!310019))

(declare-fun m!310021 () Bool)

(assert (=> b!199781 m!310021))

(declare-fun m!310023 () Bool)

(assert (=> b!199781 m!310023))

(declare-fun m!310025 () Bool)

(assert (=> b!199781 m!310025))

(declare-fun m!310027 () Bool)

(assert (=> b!199781 m!310027))

(declare-fun m!310029 () Bool)

(assert (=> b!199781 m!310029))

(declare-fun m!310031 () Bool)

(assert (=> b!199781 m!310031))

(declare-fun m!310033 () Bool)

(assert (=> b!199781 m!310033))

(declare-fun m!310035 () Bool)

(assert (=> b!199781 m!310035))

(assert (=> b!199781 m!308281))

(declare-fun m!310037 () Bool)

(assert (=> b!199781 m!310037))

(declare-fun m!310039 () Bool)

(assert (=> b!199781 m!310039))

(declare-fun m!310041 () Bool)

(assert (=> b!199781 m!310041))

(declare-fun m!310043 () Bool)

(assert (=> b!199781 m!310043))

(declare-fun m!310045 () Bool)

(assert (=> b!199781 m!310045))

(assert (=> b!199781 m!310025))

(declare-fun m!310047 () Bool)

(assert (=> b!199781 m!310047))

(declare-fun m!310049 () Bool)

(assert (=> b!199781 m!310049))

(declare-fun m!310051 () Bool)

(assert (=> d!68407 m!310051))

(declare-fun m!310053 () Bool)

(assert (=> b!199780 m!310053))

(declare-fun m!310055 () Bool)

(assert (=> b!199780 m!310055))

(declare-fun m!310057 () Bool)

(assert (=> b!199780 m!310057))

(assert (=> b!199780 m!308281))

(assert (=> b!199780 m!310019))

(declare-fun m!310059 () Bool)

(assert (=> b!199780 m!310059))

(declare-fun m!310061 () Bool)

(assert (=> bm!3161 m!310061))

(assert (=> b!198998 d!68407))

(declare-fun d!68409 () Bool)

(assert (=> d!68409 (validate_offset_bits!1 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310546)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309529))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309529))) lt!310506)))

(declare-fun lt!311955 () Unit!14058)

(assert (=> d!68409 (= lt!311955 (choose!9 (_2!9202 lt!309529) (buf!4948 (_2!9202 lt!310546)) lt!310506 (BitStream!8021 (buf!4948 (_2!9202 lt!310546)) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529)))))))

(assert (=> d!68409 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9202 lt!309529) (buf!4948 (_2!9202 lt!310546)) lt!310506) lt!311955)))

(declare-fun bs!16856 () Bool)

(assert (= bs!16856 d!68409))

(assert (=> bs!16856 m!308275))

(declare-fun m!310063 () Bool)

(assert (=> bs!16856 m!310063))

(assert (=> b!198998 d!68409))

(assert (=> b!198998 d!67707))

(declare-fun lt!311956 () tuple2!17138)

(declare-fun d!68411 () Bool)

(assert (=> d!68411 (= lt!311956 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!9203 lt!310518) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!310529 e!136569)))))

(assert (=> d!68411 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9203 lt!310518) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!310529 e!136569)) (tuple2!17113 (_2!9217 lt!311956) (_1!9217 lt!311956)))))

(declare-fun bs!16857 () Bool)

(assert (= bs!16857 d!68411))

(assert (=> bs!16857 m!308269))

(declare-fun m!310065 () Bool)

(assert (=> bs!16857 m!310065))

(assert (=> b!198998 d!68411))

(declare-fun d!68413 () Bool)

(declare-fun res!167241 () Bool)

(declare-fun e!137095 () Bool)

(assert (=> d!68413 (=> (not res!167241) (not e!137095))))

(assert (=> d!68413 (= res!167241 (= (size!4456 (buf!4948 (_2!9202 lt!309529))) (size!4456 (buf!4948 (_2!9202 lt!310546)))))))

(assert (=> d!68413 (= (isPrefixOf!0 (_2!9202 lt!309529) (_2!9202 lt!310546)) e!137095)))

(declare-fun b!199786 () Bool)

(declare-fun res!167243 () Bool)

(assert (=> b!199786 (=> (not res!167243) (not e!137095))))

(assert (=> b!199786 (= res!167243 (bvsle (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310546))) (currentByte!9295 (_2!9202 lt!310546)) (currentBit!9290 (_2!9202 lt!310546)))))))

(declare-fun b!199787 () Bool)

(declare-fun e!137094 () Bool)

(assert (=> b!199787 (= e!137095 e!137094)))

(declare-fun res!167242 () Bool)

(assert (=> b!199787 (=> res!167242 e!137094)))

(assert (=> b!199787 (= res!167242 (= (size!4456 (buf!4948 (_2!9202 lt!309529))) #b00000000000000000000000000000000))))

(declare-fun b!199788 () Bool)

(assert (=> b!199788 (= e!137094 (arrayBitRangesEq!0 (buf!4948 (_2!9202 lt!309529)) (buf!4948 (_2!9202 lt!310546)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529)))))))

(assert (= (and d!68413 res!167241) b!199786))

(assert (= (and b!199786 res!167243) b!199787))

(assert (= (and b!199787 (not res!167242)) b!199788))

(assert (=> b!199786 m!307539))

(assert (=> b!199786 m!308295))

(assert (=> b!199788 m!307539))

(assert (=> b!199788 m!307539))

(declare-fun m!310067 () Bool)

(assert (=> b!199788 m!310067))

(assert (=> b!198998 d!68413))

(declare-fun d!68415 () Bool)

(declare-fun e!137096 () Bool)

(assert (=> d!68415 e!137096))

(declare-fun res!167244 () Bool)

(assert (=> d!68415 (=> (not res!167244) (not e!137096))))

(declare-fun lt!311957 () BitStream!8020)

(declare-fun lt!311958 () (_ BitVec 64))

(assert (=> d!68415 (= res!167244 (= (bvadd lt!311958 (bvsub (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310546))) (currentByte!9295 (_2!9202 lt!310546)) (currentBit!9290 (_2!9202 lt!310546))))) (bitIndex!0 (size!4456 (buf!4948 lt!311957)) (currentByte!9295 lt!311957) (currentBit!9290 lt!311957))))))

(assert (=> d!68415 (or (not (= (bvand lt!311958 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310546))) (currentByte!9295 (_2!9202 lt!310546)) (currentBit!9290 (_2!9202 lt!310546)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311958 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311958 (bvsub (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310546))) (currentByte!9295 (_2!9202 lt!310546)) (currentBit!9290 (_2!9202 lt!310546))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68415 (= lt!311958 (bitIndex!0 (size!4456 (buf!4948 (_2!9203 lt!310518))) (currentByte!9295 (_2!9203 lt!310518)) (currentBit!9290 (_2!9203 lt!310518))))))

(assert (=> d!68415 (= lt!311957 (_2!9202 (moveBitIndex!0 (_2!9203 lt!310518) (bvsub (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310546))) (currentByte!9295 (_2!9202 lt!310546)) (currentBit!9290 (_2!9202 lt!310546)))))))))

(assert (=> d!68415 (moveBitIndexPrecond!0 (_2!9203 lt!310518) (bvsub (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310546))) (currentByte!9295 (_2!9202 lt!310546)) (currentBit!9290 (_2!9202 lt!310546)))))))

(assert (=> d!68415 (= (withMovedBitIndex!0 (_2!9203 lt!310518) (bvsub (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310546))) (currentByte!9295 (_2!9202 lt!310546)) (currentBit!9290 (_2!9202 lt!310546))))) lt!311957)))

(declare-fun b!199789 () Bool)

(assert (=> b!199789 (= e!137096 (= (size!4456 (buf!4948 (_2!9203 lt!310518))) (size!4456 (buf!4948 lt!311957))))))

(assert (= (and d!68415 res!167244) b!199789))

(declare-fun m!310069 () Bool)

(assert (=> d!68415 m!310069))

(declare-fun m!310071 () Bool)

(assert (=> d!68415 m!310071))

(declare-fun m!310073 () Bool)

(assert (=> d!68415 m!310073))

(declare-fun m!310075 () Bool)

(assert (=> d!68415 m!310075))

(assert (=> b!198998 d!68415))

(declare-fun d!68417 () Bool)

(declare-fun e!137097 () Bool)

(assert (=> d!68417 e!137097))

(declare-fun res!167246 () Bool)

(assert (=> d!68417 (=> (not res!167246) (not e!137097))))

(declare-fun lt!311961 () (_ BitVec 64))

(declare-fun lt!311960 () (_ BitVec 64))

(declare-fun lt!311964 () (_ BitVec 64))

(assert (=> d!68417 (= res!167246 (= lt!311964 (bvsub lt!311960 lt!311961)))))

(assert (=> d!68417 (or (= (bvand lt!311960 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311961 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311960 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311960 lt!311961) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68417 (= lt!311961 (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310533)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!310533))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!310533)))))))

(declare-fun lt!311963 () (_ BitVec 64))

(declare-fun lt!311959 () (_ BitVec 64))

(assert (=> d!68417 (= lt!311960 (bvmul lt!311963 lt!311959))))

(assert (=> d!68417 (or (= lt!311963 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311959 (bvsdiv (bvmul lt!311963 lt!311959) lt!311963)))))

(assert (=> d!68417 (= lt!311959 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68417 (= lt!311963 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310533)))))))

(assert (=> d!68417 (= lt!311964 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!310533))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!310533)))))))

(assert (=> d!68417 (invariant!0 (currentBit!9290 (_2!9202 lt!310533)) (currentByte!9295 (_2!9202 lt!310533)) (size!4456 (buf!4948 (_2!9202 lt!310533))))))

(assert (=> d!68417 (= (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310533))) (currentByte!9295 (_2!9202 lt!310533)) (currentBit!9290 (_2!9202 lt!310533))) lt!311964)))

(declare-fun b!199790 () Bool)

(declare-fun res!167245 () Bool)

(assert (=> b!199790 (=> (not res!167245) (not e!137097))))

(assert (=> b!199790 (= res!167245 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311964))))

(declare-fun b!199791 () Bool)

(declare-fun lt!311962 () (_ BitVec 64))

(assert (=> b!199791 (= e!137097 (bvsle lt!311964 (bvmul lt!311962 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199791 (or (= lt!311962 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311962 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311962)))))

(assert (=> b!199791 (= lt!311962 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310533)))))))

(assert (= (and d!68417 res!167246) b!199790))

(assert (= (and b!199790 res!167245) b!199791))

(declare-fun m!310077 () Bool)

(assert (=> d!68417 m!310077))

(declare-fun m!310079 () Bool)

(assert (=> d!68417 m!310079))

(assert (=> b!198998 d!68417))

(declare-fun d!68419 () Bool)

(declare-fun e!137098 () Bool)

(assert (=> d!68419 e!137098))

(declare-fun res!167247 () Bool)

(assert (=> d!68419 (=> (not res!167247) (not e!137098))))

(declare-fun lt!311966 () tuple2!17114)

(declare-fun lt!311968 () tuple2!17114)

(assert (=> d!68419 (= res!167247 (= (bitIndex!0 (size!4456 (buf!4948 (_1!9205 lt!311966))) (currentByte!9295 (_1!9205 lt!311966)) (currentBit!9290 (_1!9205 lt!311966))) (bitIndex!0 (size!4456 (buf!4948 (_1!9205 lt!311968))) (currentByte!9295 (_1!9205 lt!311968)) (currentBit!9290 (_1!9205 lt!311968)))))))

(declare-fun lt!311965 () Unit!14058)

(declare-fun lt!311967 () BitStream!8020)

(assert (=> d!68419 (= lt!311965 (choose!50 lt!310499 (_2!9202 lt!310546) lt!311967 lt!311966 (tuple2!17115 (_1!9205 lt!311966) (_2!9205 lt!311966)) (_1!9205 lt!311966) (_2!9205 lt!311966) lt!311968 (tuple2!17115 (_1!9205 lt!311968) (_2!9205 lt!311968)) (_1!9205 lt!311968) (_2!9205 lt!311968)))))

(assert (=> d!68419 (= lt!311968 (readBitPure!0 lt!311967))))

(assert (=> d!68419 (= lt!311966 (readBitPure!0 lt!310499))))

(assert (=> d!68419 (= lt!311967 (BitStream!8021 (buf!4948 (_2!9202 lt!310546)) (currentByte!9295 lt!310499) (currentBit!9290 lt!310499)))))

(assert (=> d!68419 (invariant!0 (currentBit!9290 lt!310499) (currentByte!9295 lt!310499) (size!4456 (buf!4948 (_2!9202 lt!310546))))))

(assert (=> d!68419 (= (readBitPrefixLemma!0 lt!310499 (_2!9202 lt!310546)) lt!311965)))

(declare-fun b!199792 () Bool)

(assert (=> b!199792 (= e!137098 (= (_2!9205 lt!311966) (_2!9205 lt!311968)))))

(assert (= (and d!68419 res!167247) b!199792))

(declare-fun m!310081 () Bool)

(assert (=> d!68419 m!310081))

(declare-fun m!310083 () Bool)

(assert (=> d!68419 m!310083))

(declare-fun m!310085 () Bool)

(assert (=> d!68419 m!310085))

(assert (=> d!68419 m!308257))

(declare-fun m!310087 () Bool)

(assert (=> d!68419 m!310087))

(assert (=> d!68419 m!308287))

(assert (=> b!198998 d!68419))

(declare-fun d!68421 () Bool)

(declare-fun lt!311969 () tuple2!17136)

(assert (=> d!68421 (= lt!311969 (readBit!0 (_1!9203 lt!310518)))))

(assert (=> d!68421 (= (readBitPure!0 (_1!9203 lt!310518)) (tuple2!17115 (_2!9216 lt!311969) (_1!9216 lt!311969)))))

(declare-fun bs!16858 () Bool)

(assert (= bs!16858 d!68421))

(declare-fun m!310089 () Bool)

(assert (=> bs!16858 m!310089))

(assert (=> b!198998 d!68421))

(declare-fun d!68423 () Bool)

(declare-fun lt!311970 () tuple2!17138)

(assert (=> d!68423 (= lt!311970 (readNBitsLSBFirstsLoop!0 (_1!9203 lt!310497) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(assert (=> d!68423 (= (readNBitsLSBFirstsLoopPure!0 (_1!9203 lt!310497) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))) (tuple2!17113 (_2!9217 lt!311970) (_1!9217 lt!311970)))))

(declare-fun bs!16859 () Bool)

(assert (= bs!16859 d!68423))

(declare-fun m!310091 () Bool)

(assert (=> bs!16859 m!310091))

(assert (=> b!198998 d!68423))

(assert (=> b!198786 d!67621))

(declare-fun d!68425 () Bool)

(declare-fun lt!311971 () tuple2!17136)

(assert (=> d!68425 (= lt!311971 (readBit!0 (readerFrom!0 (_2!9202 lt!310578) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204))))))

(assert (=> d!68425 (= (readBitPure!0 (readerFrom!0 (_2!9202 lt!310578) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204))) (tuple2!17115 (_2!9216 lt!311971) (_1!9216 lt!311971)))))

(declare-fun bs!16860 () Bool)

(assert (= bs!16860 d!68425))

(assert (=> bs!16860 m!308331))

(declare-fun m!310093 () Bool)

(assert (=> bs!16860 m!310093))

(assert (=> b!199021 d!68425))

(declare-fun d!68427 () Bool)

(declare-fun e!137099 () Bool)

(assert (=> d!68427 e!137099))

(declare-fun res!167248 () Bool)

(assert (=> d!68427 (=> (not res!167248) (not e!137099))))

(assert (=> d!68427 (= res!167248 (invariant!0 (currentBit!9290 (_2!9202 lt!310578)) (currentByte!9295 (_2!9202 lt!310578)) (size!4456 (buf!4948 (_2!9202 lt!310578)))))))

(assert (=> d!68427 (= (readerFrom!0 (_2!9202 lt!310578) (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204)) (BitStream!8021 (buf!4948 (_2!9202 lt!310578)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)))))

(declare-fun b!199793 () Bool)

(assert (=> b!199793 (= e!137099 (invariant!0 (currentBit!9290 thiss!1204) (currentByte!9295 thiss!1204) (size!4456 (buf!4948 (_2!9202 lt!310578)))))))

(assert (= (and d!68427 res!167248) b!199793))

(assert (=> d!68427 m!309693))

(declare-fun m!310095 () Bool)

(assert (=> b!199793 m!310095))

(assert (=> b!199021 d!68427))

(assert (=> d!67729 d!67703))

(declare-fun d!68429 () Bool)

(declare-fun e!137100 () Bool)

(assert (=> d!68429 e!137100))

(declare-fun res!167249 () Bool)

(assert (=> d!68429 (=> (not res!167249) (not e!137100))))

(assert (=> d!68429 (= res!167249 (= (buf!4948 (_2!9202 (increaseBitIndex!0 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204))))) (buf!4948 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)))))))

(declare-fun lt!311977 () Bool)

(assert (=> d!68429 (= lt!311977 (not (= (bvand ((_ sign_extend 24) (select (arr!5386 (buf!4948 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)))) (currentByte!9295 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9290 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!311972 () tuple2!17136)

(assert (=> d!68429 (= lt!311972 (tuple2!17137 (not (= (bvand ((_ sign_extend 24) (select (arr!5386 (buf!4948 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)))) (currentByte!9295 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9290 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)))))) #b00000000000000000000000000000000)) (_2!9202 (increaseBitIndex!0 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204))))))))

(assert (=> d!68429 (validate_offset_bit!0 ((_ sign_extend 32) (size!4456 (buf!4948 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204))))) ((_ sign_extend 32) (currentByte!9295 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)))) ((_ sign_extend 32) (currentBit!9290 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)))))))

(assert (=> d!68429 (= (readBit!0 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204))) lt!311972)))

(declare-fun lt!311974 () (_ BitVec 64))

(declare-fun lt!311976 () (_ BitVec 64))

(declare-fun b!199794 () Bool)

(assert (=> b!199794 (= e!137100 (= (bitIndex!0 (size!4456 (buf!4948 (_2!9202 (increaseBitIndex!0 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)))))) (currentByte!9295 (_2!9202 (increaseBitIndex!0 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204))))) (currentBit!9290 (_2!9202 (increaseBitIndex!0 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)))))) (bvadd lt!311976 lt!311974)))))

(assert (=> b!199794 (or (not (= (bvand lt!311976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311974 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311976 lt!311974) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199794 (= lt!311974 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!199794 (= lt!311976 (bitIndex!0 (size!4456 (buf!4948 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)))) (currentByte!9295 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204))) (currentBit!9290 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)))))))

(declare-fun lt!311975 () Bool)

(assert (=> b!199794 (= lt!311975 (not (= (bvand ((_ sign_extend 24) (select (arr!5386 (buf!4948 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)))) (currentByte!9295 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9290 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!311978 () Bool)

(assert (=> b!199794 (= lt!311978 (not (= (bvand ((_ sign_extend 24) (select (arr!5386 (buf!4948 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)))) (currentByte!9295 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9290 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!311973 () Bool)

(assert (=> b!199794 (= lt!311973 (not (= (bvand ((_ sign_extend 24) (select (arr!5386 (buf!4948 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)))) (currentByte!9295 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9290 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!68429 res!167249) b!199794))

(declare-fun m!310097 () Bool)

(assert (=> d!68429 m!310097))

(declare-fun m!310099 () Bool)

(assert (=> d!68429 m!310099))

(declare-fun m!310101 () Bool)

(assert (=> d!68429 m!310101))

(declare-fun m!310103 () Bool)

(assert (=> d!68429 m!310103))

(assert (=> b!199794 m!310097))

(declare-fun m!310105 () Bool)

(assert (=> b!199794 m!310105))

(declare-fun m!310107 () Bool)

(assert (=> b!199794 m!310107))

(assert (=> b!199794 m!310099))

(assert (=> b!199794 m!310101))

(assert (=> d!67629 d!68429))

(declare-fun d!68431 () Bool)

(assert (=> d!68431 (= (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!309508)))) ((_ sign_extend 32) (currentByte!9295 (_1!9205 lt!309508))) ((_ sign_extend 32) (currentBit!9290 (_1!9205 lt!309508)))) (bvsub (bvmul ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!309508)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 (_1!9205 lt!309508))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 (_1!9205 lt!309508))))))))

(assert (=> d!67589 d!68431))

(declare-fun d!68433 () Bool)

(assert (=> d!68433 (= (invariant!0 (currentBit!9290 (_1!9205 lt!309508)) (currentByte!9295 (_1!9205 lt!309508)) (size!4456 (buf!4948 (_1!9205 lt!309508)))) (and (bvsge (currentBit!9290 (_1!9205 lt!309508)) #b00000000000000000000000000000000) (bvslt (currentBit!9290 (_1!9205 lt!309508)) #b00000000000000000000000000001000) (bvsge (currentByte!9295 (_1!9205 lt!309508)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9295 (_1!9205 lt!309508)) (size!4456 (buf!4948 (_1!9205 lt!309508)))) (and (= (currentBit!9290 (_1!9205 lt!309508)) #b00000000000000000000000000000000) (= (currentByte!9295 (_1!9205 lt!309508)) (size!4456 (buf!4948 (_1!9205 lt!309508))))))))))

(assert (=> d!67589 d!68433))

(declare-fun d!68435 () Bool)

(assert (=> d!68435 (= (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!309514)))) ((_ sign_extend 32) (currentByte!9295 (_1!9205 lt!309514))) ((_ sign_extend 32) (currentBit!9290 (_1!9205 lt!309514)))) (bvsub (bvmul ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!309514)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 (_1!9205 lt!309514))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 (_1!9205 lt!309514))))))))

(assert (=> d!67723 d!68435))

(declare-fun d!68437 () Bool)

(assert (=> d!68437 (= (invariant!0 (currentBit!9290 (_1!9205 lt!309514)) (currentByte!9295 (_1!9205 lt!309514)) (size!4456 (buf!4948 (_1!9205 lt!309514)))) (and (bvsge (currentBit!9290 (_1!9205 lt!309514)) #b00000000000000000000000000000000) (bvslt (currentBit!9290 (_1!9205 lt!309514)) #b00000000000000000000000000001000) (bvsge (currentByte!9295 (_1!9205 lt!309514)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9295 (_1!9205 lt!309514)) (size!4456 (buf!4948 (_1!9205 lt!309514)))) (and (= (currentBit!9290 (_1!9205 lt!309514)) #b00000000000000000000000000000000) (= (currentByte!9295 (_1!9205 lt!309514)) (size!4456 (buf!4948 (_1!9205 lt!309514))))))))))

(assert (=> d!67723 d!68437))

(assert (=> b!198992 d!68343))

(declare-fun d!68439 () Bool)

(assert (=> d!68439 (= (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!309509)))) ((_ sign_extend 32) (currentByte!9295 thiss!1204)) ((_ sign_extend 32) (currentBit!9290 thiss!1204))) (bvsub (bvmul ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!309509)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 thiss!1204)))))))

(assert (=> d!67599 d!68439))

(assert (=> d!67641 d!67639))

(declare-fun d!68441 () Bool)

(assert (=> d!68441 (isPrefixOf!0 thiss!1204 (_2!9202 lt!309509))))

(assert (=> d!68441 true))

(declare-fun _$15!303 () Unit!14058)

(assert (=> d!68441 (= (choose!30 thiss!1204 (_2!9202 lt!309529) (_2!9202 lt!309509)) _$15!303)))

(declare-fun bs!16861 () Bool)

(assert (= bs!16861 d!68441))

(assert (=> bs!16861 m!307497))

(assert (=> d!67641 d!68441))

(assert (=> d!67641 d!67727))

(declare-fun lt!311979 () tuple2!17138)

(declare-fun d!68443 () Bool)

(assert (=> d!68443 (= lt!311979 (readNBitsLSBFirstsLoop!0 lt!310632 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!310634))))

(assert (=> d!68443 (= (readNBitsLSBFirstsLoopPure!0 lt!310632 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!310634) (tuple2!17113 (_2!9217 lt!311979) (_1!9217 lt!311979)))))

(declare-fun bs!16862 () Bool)

(assert (= bs!16862 d!68443))

(declare-fun m!310109 () Bool)

(assert (=> bs!16862 m!310109))

(assert (=> d!67713 d!68443))

(assert (=> d!67713 d!67613))

(assert (=> d!67713 d!67717))

(declare-fun d!68445 () Bool)

(declare-fun lt!311984 () tuple2!17112)

(declare-fun lt!311985 () tuple2!17112)

(assert (=> d!68445 (and (= (_2!9204 lt!311984) (_2!9204 lt!311985)) (= (_1!9204 lt!311984) (_1!9204 lt!311985)))))

(declare-fun e!137103 () (_ BitVec 64))

(assert (=> d!68445 (= lt!311985 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9203 lt!309512) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd i!590 #b00000000000000000000000000000001) (bvor lt!309511 e!137103)))))

(declare-fun c!9974 () Bool)

(assert (=> d!68445 (= c!9974 (_2!9205 (readBitPure!0 (_1!9203 lt!309512))))))

(assert (=> d!68445 (= lt!311984 (readNBitsLSBFirstsLoopPure!0 (_1!9203 lt!309512) nBits!348 i!590 lt!309511))))

(assert (=> d!68445 true))

(declare-fun _$10!34 () Unit!14058)

(assert (=> d!68445 (= (choose!56 (_1!9203 lt!309512) nBits!348 i!590 lt!309511 lt!310633 (tuple2!17113 (_1!9204 lt!310633) (_2!9204 lt!310633)) (_1!9204 lt!310633) (_2!9204 lt!310633) lt!310635 lt!310632 lt!310634 lt!310636 (tuple2!17113 (_1!9204 lt!310636) (_2!9204 lt!310636)) (_1!9204 lt!310636) (_2!9204 lt!310636)) _$10!34)))

(declare-fun b!199799 () Bool)

(assert (=> b!199799 (= e!137103 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!199800 () Bool)

(assert (=> b!199800 (= e!137103 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and d!68445 c!9974) b!199799))

(assert (= (and d!68445 (not c!9974)) b!199800))

(assert (=> d!68445 m!307549))

(assert (=> d!68445 m!307549))

(declare-fun m!310111 () Bool)

(assert (=> d!68445 m!310111))

(assert (=> d!68445 m!307511))

(assert (=> d!68445 m!307507))

(assert (=> d!67713 d!68445))

(assert (=> d!67713 d!67633))

(declare-fun b!199801 () Bool)

(declare-fun e!137104 () tuple2!17138)

(assert (=> b!199801 (= e!137104 (tuple2!17139 lt!309531 (_1!9203 lt!309516)))))

(declare-fun b!199802 () Bool)

(declare-fun e!137106 () Bool)

(declare-fun e!137105 () Bool)

(assert (=> b!199802 (= e!137106 e!137105)))

(declare-fun res!167252 () Bool)

(assert (=> b!199802 (=> res!167252 e!137105)))

(assert (=> b!199802 (= res!167252 (not (bvslt (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-fun b!199803 () Bool)

(declare-fun lt!311986 () tuple2!17138)

(assert (=> b!199803 (= e!137104 (tuple2!17139 (_1!9217 lt!311986) (_2!9217 lt!311986)))))

(declare-fun lt!311987 () tuple2!17136)

(assert (=> b!199803 (= lt!311987 (readBit!0 (_1!9203 lt!309516)))))

(assert (=> b!199803 (= lt!311986 (readNBitsLSBFirstsLoop!0 (_2!9216 lt!311987) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!309531 (ite (_1!9216 lt!311987) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!199805 () Bool)

(declare-fun res!167250 () Bool)

(assert (=> b!199805 (=> (not res!167250) (not e!137106))))

(declare-fun lt!311988 () tuple2!17138)

(assert (=> b!199805 (= res!167250 (= (bvand (_1!9217 lt!311988) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))) (bvand lt!309531 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun b!199806 () Bool)

(declare-fun res!167251 () Bool)

(assert (=> b!199806 (=> (not res!167251) (not e!137106))))

(assert (=> b!199806 (= res!167251 (= (bvand (_1!9217 lt!311988) (onesLSBLong!0 nBits!348)) (_1!9217 lt!311988)))))

(declare-fun b!199807 () Bool)

(declare-fun res!167253 () Bool)

(assert (=> b!199807 (=> (not res!167253) (not e!137106))))

(declare-fun lt!311990 () (_ BitVec 64))

(declare-fun lt!311989 () (_ BitVec 64))

(assert (=> b!199807 (= res!167253 (= (bitIndex!0 (size!4456 (buf!4948 (_2!9217 lt!311988))) (currentByte!9295 (_2!9217 lt!311988)) (currentBit!9290 (_2!9217 lt!311988))) (bvadd lt!311990 lt!311989)))))

(assert (=> b!199807 (or (not (= (bvand lt!311990 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311989 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311990 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311990 lt!311989) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199807 (= lt!311989 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!199807 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!199807 (= lt!311990 (bitIndex!0 (size!4456 (buf!4948 (_1!9203 lt!309516))) (currentByte!9295 (_1!9203 lt!309516)) (currentBit!9290 (_1!9203 lt!309516))))))

(declare-fun b!199804 () Bool)

(declare-fun lt!311991 () (_ BitVec 64))

(assert (=> b!199804 (= e!137105 (= (= (bvand (bvlshr (_1!9217 lt!311988) lt!311991) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!9205 (readBitPure!0 (_1!9203 lt!309516)))))))

(assert (=> b!199804 (and (bvsge lt!311991 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!311991 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!199804 (= lt!311991 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun d!68447 () Bool)

(assert (=> d!68447 e!137106))

(declare-fun res!167254 () Bool)

(assert (=> d!68447 (=> (not res!167254) (not e!137106))))

(assert (=> d!68447 (= res!167254 (= (buf!4948 (_2!9217 lt!311988)) (buf!4948 (_1!9203 lt!309516))))))

(assert (=> d!68447 (= lt!311988 e!137104)))

(declare-fun c!9975 () Bool)

(assert (=> d!68447 (= c!9975 (= nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (=> d!68447 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsle (bvadd #b00000000000000000000000000000001 i!590) nBits!348) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!68447 (= (readNBitsLSBFirstsLoop!0 (_1!9203 lt!309516) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!309531) lt!311988)))

(assert (= (and d!68447 c!9975) b!199801))

(assert (= (and d!68447 (not c!9975)) b!199803))

(assert (= (and d!68447 res!167254) b!199807))

(assert (= (and b!199807 res!167253) b!199805))

(assert (= (and b!199805 res!167250) b!199806))

(assert (= (and b!199806 res!167251) b!199802))

(assert (= (and b!199802 (not res!167252)) b!199804))

(assert (=> b!199806 m!308281))

(assert (=> b!199805 m!308263))

(declare-fun m!310113 () Bool)

(assert (=> b!199803 m!310113))

(declare-fun m!310115 () Bool)

(assert (=> b!199803 m!310115))

(declare-fun m!310117 () Bool)

(assert (=> b!199807 m!310117))

(declare-fun m!310119 () Bool)

(assert (=> b!199807 m!310119))

(declare-fun m!310121 () Bool)

(assert (=> b!199804 m!310121))

(assert (=> d!67625 d!68447))

(assert (=> b!199019 d!68263))

(assert (=> b!199019 d!67709))

(assert (=> d!67735 d!68277))

(declare-fun d!68449 () Bool)

(assert (=> d!68449 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!309529)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309529))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309529))) lt!310510) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!309529)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309529))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309529)))) lt!310510))))

(declare-fun bs!16864 () Bool)

(assert (= bs!16864 d!68449))

(assert (=> bs!16864 m!308317))

(assert (=> b!198999 d!68449))

(declare-fun d!68451 () Bool)

(assert (=> d!68451 (= (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!309529)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309529))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309529)))) (bvsub (bvmul ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!309529)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309529))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309529))))))))

(assert (=> d!67707 d!68451))

(assert (=> d!67707 d!68311))

(declare-fun d!68453 () Bool)

(declare-fun lt!311992 () tuple2!17136)

(assert (=> d!68453 (= lt!311992 (readBit!0 (readerFrom!0 (_2!9202 lt!310505) (currentBit!9290 (_2!9202 lt!309529)) (currentByte!9295 (_2!9202 lt!309529)))))))

(assert (=> d!68453 (= (readBitPure!0 (readerFrom!0 (_2!9202 lt!310505) (currentBit!9290 (_2!9202 lt!309529)) (currentByte!9295 (_2!9202 lt!309529)))) (tuple2!17115 (_2!9216 lt!311992) (_1!9216 lt!311992)))))

(declare-fun bs!16865 () Bool)

(assert (= bs!16865 d!68453))

(assert (=> bs!16865 m!308225))

(declare-fun m!310123 () Bool)

(assert (=> bs!16865 m!310123))

(assert (=> b!199001 d!68453))

(declare-fun d!68455 () Bool)

(declare-fun e!137107 () Bool)

(assert (=> d!68455 e!137107))

(declare-fun res!167255 () Bool)

(assert (=> d!68455 (=> (not res!167255) (not e!137107))))

(assert (=> d!68455 (= res!167255 (invariant!0 (currentBit!9290 (_2!9202 lt!310505)) (currentByte!9295 (_2!9202 lt!310505)) (size!4456 (buf!4948 (_2!9202 lt!310505)))))))

(assert (=> d!68455 (= (readerFrom!0 (_2!9202 lt!310505) (currentBit!9290 (_2!9202 lt!309529)) (currentByte!9295 (_2!9202 lt!309529))) (BitStream!8021 (buf!4948 (_2!9202 lt!310505)) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))))))

(declare-fun b!199808 () Bool)

(assert (=> b!199808 (= e!137107 (invariant!0 (currentBit!9290 (_2!9202 lt!309529)) (currentByte!9295 (_2!9202 lt!309529)) (size!4456 (buf!4948 (_2!9202 lt!310505)))))))

(assert (= (and d!68455 res!167255) b!199808))

(assert (=> d!68455 m!309853))

(declare-fun m!310125 () Bool)

(assert (=> b!199808 m!310125))

(assert (=> b!199001 d!68455))

(assert (=> b!198849 d!67709))

(assert (=> b!198849 d!67637))

(assert (=> b!199047 d!67709))

(assert (=> b!199047 d!67707))

(declare-fun b!199809 () Bool)

(declare-fun e!137113 () Bool)

(declare-fun e!137110 () Bool)

(assert (=> b!199809 (= e!137113 e!137110)))

(declare-fun res!167256 () Bool)

(declare-fun call!3165 () Bool)

(assert (=> b!199809 (= res!167256 call!3165)))

(assert (=> b!199809 (=> (not res!167256) (not e!137110))))

(declare-fun lt!311993 () tuple4!268)

(declare-fun e!137109 () Bool)

(declare-fun b!199810 () Bool)

(assert (=> b!199810 (= e!137109 (arrayRangesEq!696 (buf!4948 thiss!1204) (buf!4948 (_2!9202 lt!309509)) (_1!9222 lt!311993) (_2!9222 lt!311993)))))

(declare-fun lt!311994 () (_ BitVec 32))

(declare-fun bm!3162 () Bool)

(declare-fun lt!311995 () (_ BitVec 32))

(declare-fun c!9976 () Bool)

(assert (=> bm!3162 (= call!3165 (byteRangesEq!0 (select (arr!5386 (buf!4948 thiss!1204)) (_3!650 lt!311993)) (select (arr!5386 (buf!4948 (_2!9202 lt!309509))) (_3!650 lt!311993)) lt!311995 (ite c!9976 lt!311994 #b00000000000000000000000000001000)))))

(declare-fun b!199811 () Bool)

(declare-fun e!137111 () Bool)

(assert (=> b!199811 (= e!137111 e!137113)))

(assert (=> b!199811 (= c!9976 (= (_3!650 lt!311993) (_4!134 lt!311993)))))

(declare-fun b!199812 () Bool)

(assert (=> b!199812 (= e!137113 call!3165)))

(declare-fun b!199814 () Bool)

(declare-fun e!137108 () Bool)

(assert (=> b!199814 (= e!137108 (byteRangesEq!0 (select (arr!5386 (buf!4948 thiss!1204)) (_4!134 lt!311993)) (select (arr!5386 (buf!4948 (_2!9202 lt!309509))) (_4!134 lt!311993)) #b00000000000000000000000000000000 lt!311994))))

(declare-fun b!199815 () Bool)

(declare-fun res!167259 () Bool)

(assert (=> b!199815 (= res!167259 (= lt!311994 #b00000000000000000000000000000000))))

(assert (=> b!199815 (=> res!167259 e!137108)))

(assert (=> b!199815 (= e!137110 e!137108)))

(declare-fun b!199813 () Bool)

(declare-fun e!137112 () Bool)

(assert (=> b!199813 (= e!137112 e!137111)))

(declare-fun res!167258 () Bool)

(assert (=> b!199813 (=> (not res!167258) (not e!137111))))

(assert (=> b!199813 (= res!167258 e!137109)))

(declare-fun res!167260 () Bool)

(assert (=> b!199813 (=> res!167260 e!137109)))

(assert (=> b!199813 (= res!167260 (bvsge (_1!9222 lt!311993) (_2!9222 lt!311993)))))

(assert (=> b!199813 (= lt!311994 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4456 (buf!4948 thiss!1204)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199813 (= lt!311995 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199813 (= lt!311993 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4456 (buf!4948 thiss!1204)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204))))))

(declare-fun d!68457 () Bool)

(declare-fun res!167257 () Bool)

(assert (=> d!68457 (=> res!167257 e!137112)))

(assert (=> d!68457 (= res!167257 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4456 (buf!4948 thiss!1204)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204))))))

(assert (=> d!68457 (= (arrayBitRangesEq!0 (buf!4948 thiss!1204) (buf!4948 (_2!9202 lt!309509)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4456 (buf!4948 thiss!1204)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204))) e!137112)))

(assert (= (and d!68457 (not res!167257)) b!199813))

(assert (= (and b!199813 (not res!167260)) b!199810))

(assert (= (and b!199813 res!167258) b!199811))

(assert (= (and b!199811 c!9976) b!199812))

(assert (= (and b!199811 (not c!9976)) b!199809))

(assert (= (and b!199809 res!167256) b!199815))

(assert (= (and b!199815 (not res!167259)) b!199814))

(assert (= (or b!199812 b!199809) bm!3162))

(declare-fun m!310127 () Bool)

(assert (=> b!199810 m!310127))

(declare-fun m!310129 () Bool)

(assert (=> bm!3162 m!310129))

(declare-fun m!310131 () Bool)

(assert (=> bm!3162 m!310131))

(assert (=> bm!3162 m!310129))

(assert (=> bm!3162 m!310131))

(declare-fun m!310133 () Bool)

(assert (=> bm!3162 m!310133))

(declare-fun m!310135 () Bool)

(assert (=> b!199814 m!310135))

(declare-fun m!310137 () Bool)

(assert (=> b!199814 m!310137))

(assert (=> b!199814 m!310135))

(assert (=> b!199814 m!310137))

(declare-fun m!310139 () Bool)

(assert (=> b!199814 m!310139))

(assert (=> b!199813 m!307541))

(declare-fun m!310141 () Bool)

(assert (=> b!199813 m!310141))

(assert (=> b!198851 d!68457))

(assert (=> b!198851 d!67709))

(declare-fun d!68459 () Bool)

(declare-fun res!167261 () Bool)

(declare-fun e!137115 () Bool)

(assert (=> d!68459 (=> (not res!167261) (not e!137115))))

(assert (=> d!68459 (= res!167261 (= (size!4456 (buf!4948 (_2!9203 lt!310031))) (size!4456 (buf!4948 (_2!9202 lt!309509)))))))

(assert (=> d!68459 (= (isPrefixOf!0 (_2!9203 lt!310031) (_2!9202 lt!309509)) e!137115)))

(declare-fun b!199816 () Bool)

(declare-fun res!167263 () Bool)

(assert (=> b!199816 (=> (not res!167263) (not e!137115))))

(assert (=> b!199816 (= res!167263 (bvsle (bitIndex!0 (size!4456 (buf!4948 (_2!9203 lt!310031))) (currentByte!9295 (_2!9203 lt!310031)) (currentBit!9290 (_2!9203 lt!310031))) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309509))) (currentByte!9295 (_2!9202 lt!309509)) (currentBit!9290 (_2!9202 lt!309509)))))))

(declare-fun b!199817 () Bool)

(declare-fun e!137114 () Bool)

(assert (=> b!199817 (= e!137115 e!137114)))

(declare-fun res!167262 () Bool)

(assert (=> b!199817 (=> res!167262 e!137114)))

(assert (=> b!199817 (= res!167262 (= (size!4456 (buf!4948 (_2!9203 lt!310031))) #b00000000000000000000000000000000))))

(declare-fun b!199818 () Bool)

(assert (=> b!199818 (= e!137114 (arrayBitRangesEq!0 (buf!4948 (_2!9203 lt!310031)) (buf!4948 (_2!9202 lt!309509)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4456 (buf!4948 (_2!9203 lt!310031))) (currentByte!9295 (_2!9203 lt!310031)) (currentBit!9290 (_2!9203 lt!310031)))))))

(assert (= (and d!68459 res!167261) b!199816))

(assert (= (and b!199816 res!167263) b!199817))

(assert (= (and b!199817 (not res!167262)) b!199818))

(assert (=> b!199816 m!309753))

(assert (=> b!199816 m!307495))

(assert (=> b!199818 m!309753))

(assert (=> b!199818 m!309753))

(declare-fun m!310143 () Bool)

(assert (=> b!199818 m!310143))

(assert (=> b!198837 d!68459))

(declare-fun b!199819 () Bool)

(declare-fun e!137121 () Bool)

(declare-fun e!137118 () Bool)

(assert (=> b!199819 (= e!137121 e!137118)))

(declare-fun res!167264 () Bool)

(declare-fun call!3166 () Bool)

(assert (=> b!199819 (= res!167264 call!3166)))

(assert (=> b!199819 (=> (not res!167264) (not e!137118))))

(declare-fun e!137117 () Bool)

(declare-fun b!199820 () Bool)

(declare-fun lt!311996 () tuple4!268)

(assert (=> b!199820 (= e!137117 (arrayRangesEq!696 (buf!4948 thiss!1204) (buf!4948 (_2!9202 lt!309529)) (_1!9222 lt!311996) (_2!9222 lt!311996)))))

(declare-fun bm!3163 () Bool)

(declare-fun lt!311997 () (_ BitVec 32))

(declare-fun c!9977 () Bool)

(declare-fun lt!311998 () (_ BitVec 32))

(assert (=> bm!3163 (= call!3166 (byteRangesEq!0 (select (arr!5386 (buf!4948 thiss!1204)) (_3!650 lt!311996)) (select (arr!5386 (buf!4948 (_2!9202 lt!309529))) (_3!650 lt!311996)) lt!311998 (ite c!9977 lt!311997 #b00000000000000000000000000001000)))))

(declare-fun b!199821 () Bool)

(declare-fun e!137119 () Bool)

(assert (=> b!199821 (= e!137119 e!137121)))

(assert (=> b!199821 (= c!9977 (= (_3!650 lt!311996) (_4!134 lt!311996)))))

(declare-fun b!199822 () Bool)

(assert (=> b!199822 (= e!137121 call!3166)))

(declare-fun b!199824 () Bool)

(declare-fun e!137116 () Bool)

(assert (=> b!199824 (= e!137116 (byteRangesEq!0 (select (arr!5386 (buf!4948 thiss!1204)) (_4!134 lt!311996)) (select (arr!5386 (buf!4948 (_2!9202 lt!309529))) (_4!134 lt!311996)) #b00000000000000000000000000000000 lt!311997))))

(declare-fun b!199825 () Bool)

(declare-fun res!167267 () Bool)

(assert (=> b!199825 (= res!167267 (= lt!311997 #b00000000000000000000000000000000))))

(assert (=> b!199825 (=> res!167267 e!137116)))

(assert (=> b!199825 (= e!137118 e!137116)))

(declare-fun b!199823 () Bool)

(declare-fun e!137120 () Bool)

(assert (=> b!199823 (= e!137120 e!137119)))

(declare-fun res!167266 () Bool)

(assert (=> b!199823 (=> (not res!167266) (not e!137119))))

(assert (=> b!199823 (= res!167266 e!137117)))

(declare-fun res!167268 () Bool)

(assert (=> b!199823 (=> res!167268 e!137117)))

(assert (=> b!199823 (= res!167268 (bvsge (_1!9222 lt!311996) (_2!9222 lt!311996)))))

(assert (=> b!199823 (= lt!311997 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4456 (buf!4948 thiss!1204)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199823 (= lt!311998 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199823 (= lt!311996 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4456 (buf!4948 thiss!1204)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204))))))

(declare-fun d!68461 () Bool)

(declare-fun res!167265 () Bool)

(assert (=> d!68461 (=> res!167265 e!137120)))

(assert (=> d!68461 (= res!167265 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4456 (buf!4948 thiss!1204)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204))))))

(assert (=> d!68461 (= (arrayBitRangesEq!0 (buf!4948 thiss!1204) (buf!4948 (_2!9202 lt!309529)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4456 (buf!4948 thiss!1204)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204))) e!137120)))

(assert (= (and d!68461 (not res!167265)) b!199823))

(assert (= (and b!199823 (not res!167268)) b!199820))

(assert (= (and b!199823 res!167266) b!199821))

(assert (= (and b!199821 c!9977) b!199822))

(assert (= (and b!199821 (not c!9977)) b!199819))

(assert (= (and b!199819 res!167264) b!199825))

(assert (= (and b!199825 (not res!167267)) b!199824))

(assert (= (or b!199822 b!199819) bm!3163))

(declare-fun m!310145 () Bool)

(assert (=> b!199820 m!310145))

(declare-fun m!310147 () Bool)

(assert (=> bm!3163 m!310147))

(declare-fun m!310149 () Bool)

(assert (=> bm!3163 m!310149))

(assert (=> bm!3163 m!310147))

(assert (=> bm!3163 m!310149))

(declare-fun m!310151 () Bool)

(assert (=> bm!3163 m!310151))

(declare-fun m!310153 () Bool)

(assert (=> b!199824 m!310153))

(declare-fun m!310155 () Bool)

(assert (=> b!199824 m!310155))

(assert (=> b!199824 m!310153))

(assert (=> b!199824 m!310155))

(declare-fun m!310157 () Bool)

(assert (=> b!199824 m!310157))

(assert (=> b!199823 m!307541))

(assert (=> b!199823 m!310141))

(assert (=> b!199049 d!68461))

(assert (=> b!199049 d!67709))

(declare-fun d!68463 () Bool)

(declare-fun e!137122 () Bool)

(assert (=> d!68463 e!137122))

(declare-fun res!167269 () Bool)

(assert (=> d!68463 (=> (not res!167269) (not e!137122))))

(declare-fun lt!312000 () (_ BitVec 64))

(declare-fun lt!311999 () BitStream!8020)

(assert (=> d!68463 (= res!167269 (= (bvadd lt!312000 (bvsub lt!309990 lt!309989)) (bitIndex!0 (size!4456 (buf!4948 lt!311999)) (currentByte!9295 lt!311999) (currentBit!9290 lt!311999))))))

(assert (=> d!68463 (or (not (= (bvand lt!312000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309990 lt!309989) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!312000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!312000 (bvsub lt!309990 lt!309989)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68463 (= lt!312000 (bitIndex!0 (size!4456 (buf!4948 (_2!9203 lt!309982))) (currentByte!9295 (_2!9203 lt!309982)) (currentBit!9290 (_2!9203 lt!309982))))))

(assert (=> d!68463 (= lt!311999 (_2!9202 (moveBitIndex!0 (_2!9203 lt!309982) (bvsub lt!309990 lt!309989))))))

(assert (=> d!68463 (moveBitIndexPrecond!0 (_2!9203 lt!309982) (bvsub lt!309990 lt!309989))))

(assert (=> d!68463 (= (withMovedBitIndex!0 (_2!9203 lt!309982) (bvsub lt!309990 lt!309989)) lt!311999)))

(declare-fun b!199826 () Bool)

(assert (=> b!199826 (= e!137122 (= (size!4456 (buf!4948 (_2!9203 lt!309982))) (size!4456 (buf!4948 lt!311999))))))

(assert (= (and d!68463 res!167269) b!199826))

(declare-fun m!310159 () Bool)

(assert (=> d!68463 m!310159))

(assert (=> d!68463 m!309837))

(declare-fun m!310161 () Bool)

(assert (=> d!68463 m!310161))

(declare-fun m!310163 () Bool)

(assert (=> d!68463 m!310163))

(assert (=> b!198823 d!68463))

(assert (=> b!198823 d!67637))

(assert (=> b!198823 d!67709))

(declare-fun d!68465 () Bool)

(assert (=> d!68465 (isPrefixOf!0 lt!309991 lt!309991)))

(declare-fun lt!312001 () Unit!14058)

(assert (=> d!68465 (= lt!312001 (choose!11 lt!309991))))

(assert (=> d!68465 (= (lemmaIsPrefixRefl!0 lt!309991) lt!312001)))

(declare-fun bs!16866 () Bool)

(assert (= bs!16866 d!68465))

(assert (=> bs!16866 m!307931))

(declare-fun m!310165 () Bool)

(assert (=> bs!16866 m!310165))

(assert (=> d!67601 d!68465))

(declare-fun d!68467 () Bool)

(assert (=> d!68467 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!312002 () Unit!14058)

(assert (=> d!68467 (= lt!312002 (choose!11 thiss!1204))))

(assert (=> d!68467 (= (lemmaIsPrefixRefl!0 thiss!1204) lt!312002)))

(declare-fun bs!16867 () Bool)

(assert (= bs!16867 d!68467))

(assert (=> bs!16867 m!307921))

(declare-fun m!310167 () Bool)

(assert (=> bs!16867 m!310167))

(assert (=> d!67601 d!68467))

(assert (=> d!67601 d!67639))

(declare-fun d!68469 () Bool)

(declare-fun res!167270 () Bool)

(declare-fun e!137124 () Bool)

(assert (=> d!68469 (=> (not res!167270) (not e!137124))))

(assert (=> d!68469 (= res!167270 (= (size!4456 (buf!4948 thiss!1204)) (size!4456 (buf!4948 thiss!1204))))))

(assert (=> d!68469 (= (isPrefixOf!0 thiss!1204 thiss!1204) e!137124)))

(declare-fun b!199827 () Bool)

(declare-fun res!167272 () Bool)

(assert (=> b!199827 (=> (not res!167272) (not e!137124))))

(assert (=> b!199827 (= res!167272 (bvsle (bitIndex!0 (size!4456 (buf!4948 thiss!1204)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204)) (bitIndex!0 (size!4456 (buf!4948 thiss!1204)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204))))))

(declare-fun b!199828 () Bool)

(declare-fun e!137123 () Bool)

(assert (=> b!199828 (= e!137124 e!137123)))

(declare-fun res!167271 () Bool)

(assert (=> b!199828 (=> res!167271 e!137123)))

(assert (=> b!199828 (= res!167271 (= (size!4456 (buf!4948 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!199829 () Bool)

(assert (=> b!199829 (= e!137123 (arrayBitRangesEq!0 (buf!4948 thiss!1204) (buf!4948 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4456 (buf!4948 thiss!1204)) (currentByte!9295 thiss!1204) (currentBit!9290 thiss!1204))))))

(assert (= (and d!68469 res!167270) b!199827))

(assert (= (and b!199827 res!167272) b!199828))

(assert (= (and b!199828 (not res!167271)) b!199829))

(assert (=> b!199827 m!307541))

(assert (=> b!199827 m!307541))

(assert (=> b!199829 m!307541))

(assert (=> b!199829 m!307541))

(declare-fun m!310169 () Bool)

(assert (=> b!199829 m!310169))

(assert (=> d!67601 d!68469))

(declare-fun d!68471 () Bool)

(declare-fun res!167273 () Bool)

(declare-fun e!137126 () Bool)

(assert (=> d!68471 (=> (not res!167273) (not e!137126))))

(assert (=> d!68471 (= res!167273 (= (size!4456 (buf!4948 lt!309991)) (size!4456 (buf!4948 lt!309991))))))

(assert (=> d!68471 (= (isPrefixOf!0 lt!309991 lt!309991) e!137126)))

(declare-fun b!199830 () Bool)

(declare-fun res!167275 () Bool)

(assert (=> b!199830 (=> (not res!167275) (not e!137126))))

(assert (=> b!199830 (= res!167275 (bvsle (bitIndex!0 (size!4456 (buf!4948 lt!309991)) (currentByte!9295 lt!309991) (currentBit!9290 lt!309991)) (bitIndex!0 (size!4456 (buf!4948 lt!309991)) (currentByte!9295 lt!309991) (currentBit!9290 lt!309991))))))

(declare-fun b!199831 () Bool)

(declare-fun e!137125 () Bool)

(assert (=> b!199831 (= e!137126 e!137125)))

(declare-fun res!167274 () Bool)

(assert (=> b!199831 (=> res!167274 e!137125)))

(assert (=> b!199831 (= res!167274 (= (size!4456 (buf!4948 lt!309991)) #b00000000000000000000000000000000))))

(declare-fun b!199832 () Bool)

(assert (=> b!199832 (= e!137125 (arrayBitRangesEq!0 (buf!4948 lt!309991) (buf!4948 lt!309991) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4456 (buf!4948 lt!309991)) (currentByte!9295 lt!309991) (currentBit!9290 lt!309991))))))

(assert (= (and d!68471 res!167273) b!199830))

(assert (= (and b!199830 res!167275) b!199831))

(assert (= (and b!199831 (not res!167274)) b!199832))

(declare-fun m!310171 () Bool)

(assert (=> b!199830 m!310171))

(assert (=> b!199830 m!310171))

(assert (=> b!199832 m!310171))

(assert (=> b!199832 m!310171))

(declare-fun m!310173 () Bool)

(assert (=> b!199832 m!310173))

(assert (=> d!67601 d!68471))

(assert (=> d!67601 d!68345))

(assert (=> d!67601 d!68347))

(declare-fun d!68473 () Bool)

(assert (=> d!68473 (isPrefixOf!0 lt!309991 (_2!9202 lt!309509))))

(declare-fun lt!312003 () Unit!14058)

(assert (=> d!68473 (= lt!312003 (choose!30 lt!309991 thiss!1204 (_2!9202 lt!309509)))))

(assert (=> d!68473 (isPrefixOf!0 lt!309991 thiss!1204)))

(assert (=> d!68473 (= (lemmaIsPrefixTransitive!0 lt!309991 thiss!1204 (_2!9202 lt!309509)) lt!312003)))

(declare-fun bs!16868 () Bool)

(assert (= bs!16868 d!68473))

(assert (=> bs!16868 m!307923))

(declare-fun m!310175 () Bool)

(assert (=> bs!16868 m!310175))

(declare-fun m!310177 () Bool)

(assert (=> bs!16868 m!310177))

(assert (=> d!67601 d!68473))

(declare-fun d!68475 () Bool)

(declare-fun res!167276 () Bool)

(declare-fun e!137128 () Bool)

(assert (=> d!68475 (=> (not res!167276) (not e!137128))))

(assert (=> d!68475 (= res!167276 (= (size!4456 (buf!4948 lt!309991)) (size!4456 (buf!4948 (_2!9202 lt!309509)))))))

(assert (=> d!68475 (= (isPrefixOf!0 lt!309991 (_2!9202 lt!309509)) e!137128)))

(declare-fun b!199833 () Bool)

(declare-fun res!167278 () Bool)

(assert (=> b!199833 (=> (not res!167278) (not e!137128))))

(assert (=> b!199833 (= res!167278 (bvsle (bitIndex!0 (size!4456 (buf!4948 lt!309991)) (currentByte!9295 lt!309991) (currentBit!9290 lt!309991)) (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309509))) (currentByte!9295 (_2!9202 lt!309509)) (currentBit!9290 (_2!9202 lt!309509)))))))

(declare-fun b!199834 () Bool)

(declare-fun e!137127 () Bool)

(assert (=> b!199834 (= e!137128 e!137127)))

(declare-fun res!167277 () Bool)

(assert (=> b!199834 (=> res!167277 e!137127)))

(assert (=> b!199834 (= res!167277 (= (size!4456 (buf!4948 lt!309991)) #b00000000000000000000000000000000))))

(declare-fun b!199835 () Bool)

(assert (=> b!199835 (= e!137127 (arrayBitRangesEq!0 (buf!4948 lt!309991) (buf!4948 (_2!9202 lt!309509)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4456 (buf!4948 lt!309991)) (currentByte!9295 lt!309991) (currentBit!9290 lt!309991))))))

(assert (= (and d!68475 res!167276) b!199833))

(assert (= (and b!199833 res!167278) b!199834))

(assert (= (and b!199834 (not res!167277)) b!199835))

(assert (=> b!199833 m!310171))

(assert (=> b!199833 m!307495))

(assert (=> b!199835 m!310171))

(assert (=> b!199835 m!310171))

(declare-fun m!310179 () Bool)

(assert (=> b!199835 m!310179))

(assert (=> d!67601 d!68475))

(declare-fun d!68477 () Bool)

(assert (=> d!68477 (isPrefixOf!0 lt!309991 (_2!9202 lt!309509))))

(declare-fun lt!312004 () Unit!14058)

(assert (=> d!68477 (= lt!312004 (choose!30 lt!309991 (_2!9202 lt!309509) (_2!9202 lt!309509)))))

(assert (=> d!68477 (isPrefixOf!0 lt!309991 (_2!9202 lt!309509))))

(assert (=> d!68477 (= (lemmaIsPrefixTransitive!0 lt!309991 (_2!9202 lt!309509) (_2!9202 lt!309509)) lt!312004)))

(declare-fun bs!16869 () Bool)

(assert (= bs!16869 d!68477))

(assert (=> bs!16869 m!307923))

(declare-fun m!310181 () Bool)

(assert (=> bs!16869 m!310181))

(assert (=> bs!16869 m!307923))

(assert (=> d!67601 d!68477))

(declare-fun d!68479 () Bool)

(declare-fun res!167279 () Bool)

(declare-fun e!137130 () Bool)

(assert (=> d!68479 (=> (not res!167279) (not e!137130))))

(assert (=> d!68479 (= res!167279 (= (size!4456 (buf!4948 (_1!9203 lt!309982))) (size!4456 (buf!4948 (_2!9203 lt!309982)))))))

(assert (=> d!68479 (= (isPrefixOf!0 (_1!9203 lt!309982) (_2!9203 lt!309982)) e!137130)))

(declare-fun b!199836 () Bool)

(declare-fun res!167281 () Bool)

(assert (=> b!199836 (=> (not res!167281) (not e!137130))))

(assert (=> b!199836 (= res!167281 (bvsle (bitIndex!0 (size!4456 (buf!4948 (_1!9203 lt!309982))) (currentByte!9295 (_1!9203 lt!309982)) (currentBit!9290 (_1!9203 lt!309982))) (bitIndex!0 (size!4456 (buf!4948 (_2!9203 lt!309982))) (currentByte!9295 (_2!9203 lt!309982)) (currentBit!9290 (_2!9203 lt!309982)))))))

(declare-fun b!199837 () Bool)

(declare-fun e!137129 () Bool)

(assert (=> b!199837 (= e!137130 e!137129)))

(declare-fun res!167280 () Bool)

(assert (=> b!199837 (=> res!167280 e!137129)))

(assert (=> b!199837 (= res!167280 (= (size!4456 (buf!4948 (_1!9203 lt!309982))) #b00000000000000000000000000000000))))

(declare-fun b!199838 () Bool)

(assert (=> b!199838 (= e!137129 (arrayBitRangesEq!0 (buf!4948 (_1!9203 lt!309982)) (buf!4948 (_2!9203 lt!309982)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4456 (buf!4948 (_1!9203 lt!309982))) (currentByte!9295 (_1!9203 lt!309982)) (currentBit!9290 (_1!9203 lt!309982)))))))

(assert (= (and d!68479 res!167279) b!199836))

(assert (= (and b!199836 res!167281) b!199837))

(assert (= (and b!199837 (not res!167280)) b!199838))

(assert (=> b!199836 m!309705))

(assert (=> b!199836 m!309837))

(assert (=> b!199838 m!309705))

(assert (=> b!199838 m!309705))

(declare-fun m!310183 () Bool)

(assert (=> b!199838 m!310183))

(assert (=> d!67601 d!68479))

(declare-fun d!68481 () Bool)

(declare-fun e!137131 () Bool)

(assert (=> d!68481 e!137131))

(declare-fun res!167283 () Bool)

(assert (=> d!68481 (=> (not res!167283) (not e!137131))))

(declare-fun lt!312007 () (_ BitVec 64))

(declare-fun lt!312006 () (_ BitVec 64))

(declare-fun lt!312010 () (_ BitVec 64))

(assert (=> d!68481 (= res!167283 (= lt!312010 (bvsub lt!312006 lt!312007)))))

(assert (=> d!68481 (or (= (bvand lt!312006 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!312007 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!312006 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312006 lt!312007) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68481 (= lt!312007 (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!310511)))) ((_ sign_extend 32) (currentByte!9295 (_1!9205 lt!310511))) ((_ sign_extend 32) (currentBit!9290 (_1!9205 lt!310511)))))))

(declare-fun lt!312009 () (_ BitVec 64))

(declare-fun lt!312005 () (_ BitVec 64))

(assert (=> d!68481 (= lt!312006 (bvmul lt!312009 lt!312005))))

(assert (=> d!68481 (or (= lt!312009 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!312005 (bvsdiv (bvmul lt!312009 lt!312005) lt!312009)))))

(assert (=> d!68481 (= lt!312005 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68481 (= lt!312009 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!310511)))))))

(assert (=> d!68481 (= lt!312010 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 (_1!9205 lt!310511))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 (_1!9205 lt!310511)))))))

(assert (=> d!68481 (invariant!0 (currentBit!9290 (_1!9205 lt!310511)) (currentByte!9295 (_1!9205 lt!310511)) (size!4456 (buf!4948 (_1!9205 lt!310511))))))

(assert (=> d!68481 (= (bitIndex!0 (size!4456 (buf!4948 (_1!9205 lt!310511))) (currentByte!9295 (_1!9205 lt!310511)) (currentBit!9290 (_1!9205 lt!310511))) lt!312010)))

(declare-fun b!199839 () Bool)

(declare-fun res!167282 () Bool)

(assert (=> b!199839 (=> (not res!167282) (not e!137131))))

(assert (=> b!199839 (= res!167282 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!312010))))

(declare-fun b!199840 () Bool)

(declare-fun lt!312008 () (_ BitVec 64))

(assert (=> b!199840 (= e!137131 (bvsle lt!312010 (bvmul lt!312008 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199840 (or (= lt!312008 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!312008 #b0000000000000000000000000000000000000000000000000000000000001000) lt!312008)))))

(assert (=> b!199840 (= lt!312008 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!310511)))))))

(assert (= (and d!68481 res!167283) b!199839))

(assert (= (and b!199839 res!167282) b!199840))

(declare-fun m!310185 () Bool)

(assert (=> d!68481 m!310185))

(declare-fun m!310187 () Bool)

(assert (=> d!68481 m!310187))

(assert (=> b!198995 d!68481))

(assert (=> b!198995 d!68357))

(assert (=> b!198997 d!68367))

(declare-fun b!199841 () Bool)

(declare-fun res!167284 () Bool)

(declare-fun e!137133 () Bool)

(assert (=> b!199841 (=> (not res!167284) (not e!137133))))

(declare-fun lt!312015 () tuple2!17110)

(assert (=> b!199841 (= res!167284 (isPrefixOf!0 (_1!9203 lt!312015) (_2!9202 lt!309529)))))

(declare-fun d!68483 () Bool)

(assert (=> d!68483 e!137133))

(declare-fun res!167285 () Bool)

(assert (=> d!68483 (=> (not res!167285) (not e!137133))))

(assert (=> d!68483 (= res!167285 (isPrefixOf!0 (_1!9203 lt!312015) (_2!9203 lt!312015)))))

(declare-fun lt!312024 () BitStream!8020)

(assert (=> d!68483 (= lt!312015 (tuple2!17111 lt!312024 (_2!9202 lt!310530)))))

(declare-fun lt!312013 () Unit!14058)

(declare-fun lt!312021 () Unit!14058)

(assert (=> d!68483 (= lt!312013 lt!312021)))

(assert (=> d!68483 (isPrefixOf!0 lt!312024 (_2!9202 lt!310530))))

(assert (=> d!68483 (= lt!312021 (lemmaIsPrefixTransitive!0 lt!312024 (_2!9202 lt!310530) (_2!9202 lt!310530)))))

(declare-fun lt!312012 () Unit!14058)

(declare-fun lt!312025 () Unit!14058)

(assert (=> d!68483 (= lt!312012 lt!312025)))

(assert (=> d!68483 (isPrefixOf!0 lt!312024 (_2!9202 lt!310530))))

(assert (=> d!68483 (= lt!312025 (lemmaIsPrefixTransitive!0 lt!312024 (_2!9202 lt!309529) (_2!9202 lt!310530)))))

(declare-fun lt!312018 () Unit!14058)

(declare-fun e!137132 () Unit!14058)

(assert (=> d!68483 (= lt!312018 e!137132)))

(declare-fun c!9978 () Bool)

(assert (=> d!68483 (= c!9978 (not (= (size!4456 (buf!4948 (_2!9202 lt!309529))) #b00000000000000000000000000000000)))))

(declare-fun lt!312030 () Unit!14058)

(declare-fun lt!312028 () Unit!14058)

(assert (=> d!68483 (= lt!312030 lt!312028)))

(assert (=> d!68483 (isPrefixOf!0 (_2!9202 lt!310530) (_2!9202 lt!310530))))

(assert (=> d!68483 (= lt!312028 (lemmaIsPrefixRefl!0 (_2!9202 lt!310530)))))

(declare-fun lt!312026 () Unit!14058)

(declare-fun lt!312016 () Unit!14058)

(assert (=> d!68483 (= lt!312026 lt!312016)))

(assert (=> d!68483 (= lt!312016 (lemmaIsPrefixRefl!0 (_2!9202 lt!310530)))))

(declare-fun lt!312027 () Unit!14058)

(declare-fun lt!312019 () Unit!14058)

(assert (=> d!68483 (= lt!312027 lt!312019)))

(assert (=> d!68483 (isPrefixOf!0 lt!312024 lt!312024)))

(assert (=> d!68483 (= lt!312019 (lemmaIsPrefixRefl!0 lt!312024))))

(declare-fun lt!312020 () Unit!14058)

(declare-fun lt!312017 () Unit!14058)

(assert (=> d!68483 (= lt!312020 lt!312017)))

(assert (=> d!68483 (isPrefixOf!0 (_2!9202 lt!309529) (_2!9202 lt!309529))))

(assert (=> d!68483 (= lt!312017 (lemmaIsPrefixRefl!0 (_2!9202 lt!309529)))))

(assert (=> d!68483 (= lt!312024 (BitStream!8021 (buf!4948 (_2!9202 lt!310530)) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))))))

(assert (=> d!68483 (isPrefixOf!0 (_2!9202 lt!309529) (_2!9202 lt!310530))))

(assert (=> d!68483 (= (reader!0 (_2!9202 lt!309529) (_2!9202 lt!310530)) lt!312015)))

(declare-fun b!199842 () Bool)

(declare-fun Unit!14198 () Unit!14058)

(assert (=> b!199842 (= e!137132 Unit!14198)))

(declare-fun b!199843 () Bool)

(declare-fun lt!312023 () (_ BitVec 64))

(declare-fun lt!312022 () (_ BitVec 64))

(assert (=> b!199843 (= e!137133 (= (_1!9203 lt!312015) (withMovedBitIndex!0 (_2!9203 lt!312015) (bvsub lt!312023 lt!312022))))))

(assert (=> b!199843 (or (= (bvand lt!312023 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!312022 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!312023 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312023 lt!312022) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199843 (= lt!312022 (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!310530))) (currentByte!9295 (_2!9202 lt!310530)) (currentBit!9290 (_2!9202 lt!310530))))))

(assert (=> b!199843 (= lt!312023 (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))))))

(declare-fun b!199844 () Bool)

(declare-fun res!167286 () Bool)

(assert (=> b!199844 (=> (not res!167286) (not e!137133))))

(assert (=> b!199844 (= res!167286 (isPrefixOf!0 (_2!9203 lt!312015) (_2!9202 lt!310530)))))

(declare-fun b!199845 () Bool)

(declare-fun lt!312011 () Unit!14058)

(assert (=> b!199845 (= e!137132 lt!312011)))

(declare-fun lt!312029 () (_ BitVec 64))

(assert (=> b!199845 (= lt!312029 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!312014 () (_ BitVec 64))

(assert (=> b!199845 (= lt!312014 (bitIndex!0 (size!4456 (buf!4948 (_2!9202 lt!309529))) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529))))))

(assert (=> b!199845 (= lt!312011 (arrayBitRangesEqSymmetric!0 (buf!4948 (_2!9202 lt!309529)) (buf!4948 (_2!9202 lt!310530)) lt!312029 lt!312014))))

(assert (=> b!199845 (arrayBitRangesEq!0 (buf!4948 (_2!9202 lt!310530)) (buf!4948 (_2!9202 lt!309529)) lt!312029 lt!312014)))

(assert (= (and d!68483 c!9978) b!199845))

(assert (= (and d!68483 (not c!9978)) b!199842))

(assert (= (and d!68483 res!167285) b!199841))

(assert (= (and b!199841 res!167284) b!199844))

(assert (= (and b!199844 res!167286) b!199843))

(declare-fun m!310189 () Bool)

(assert (=> b!199841 m!310189))

(assert (=> d!68483 m!307961))

(declare-fun m!310191 () Bool)

(assert (=> d!68483 m!310191))

(declare-fun m!310193 () Bool)

(assert (=> d!68483 m!310193))

(assert (=> d!68483 m!308229))

(declare-fun m!310195 () Bool)

(assert (=> d!68483 m!310195))

(declare-fun m!310197 () Bool)

(assert (=> d!68483 m!310197))

(declare-fun m!310199 () Bool)

(assert (=> d!68483 m!310199))

(declare-fun m!310201 () Bool)

(assert (=> d!68483 m!310201))

(declare-fun m!310203 () Bool)

(assert (=> d!68483 m!310203))

(assert (=> d!68483 m!307975))

(declare-fun m!310205 () Bool)

(assert (=> d!68483 m!310205))

(declare-fun m!310207 () Bool)

(assert (=> b!199844 m!310207))

(declare-fun m!310209 () Bool)

(assert (=> b!199843 m!310209))

(assert (=> b!199843 m!308221))

(assert (=> b!199843 m!307539))

(assert (=> b!199845 m!307539))

(declare-fun m!310211 () Bool)

(assert (=> b!199845 m!310211))

(declare-fun m!310213 () Bool)

(assert (=> b!199845 m!310213))

(assert (=> b!198997 d!68483))

(declare-fun lt!312031 () tuple2!17138)

(declare-fun d!68485 () Bool)

(assert (=> d!68485 (= lt!312031 (readNBitsLSBFirstsLoop!0 (_1!9203 lt!310498) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(assert (=> d!68485 (= (readNBitsLSBFirstsLoopPure!0 (_1!9203 lt!310498) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))) (tuple2!17113 (_2!9217 lt!312031) (_1!9217 lt!312031)))))

(declare-fun bs!16870 () Bool)

(assert (= bs!16870 d!68485))

(declare-fun m!310215 () Bool)

(assert (=> bs!16870 m!310215))

(assert (=> b!198997 d!68485))

(declare-fun d!68487 () Bool)

(assert (=> d!68487 (validate_offset_bits!1 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310530)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309529))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309529))) lt!310510)))

(declare-fun lt!312032 () Unit!14058)

(assert (=> d!68487 (= lt!312032 (choose!9 (_2!9202 lt!309529) (buf!4948 (_2!9202 lt!310530)) lt!310510 (BitStream!8021 (buf!4948 (_2!9202 lt!310530)) (currentByte!9295 (_2!9202 lt!309529)) (currentBit!9290 (_2!9202 lt!309529)))))))

(assert (=> d!68487 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9202 lt!309529) (buf!4948 (_2!9202 lt!310530)) lt!310510) lt!312032)))

(declare-fun bs!16871 () Bool)

(assert (= bs!16871 d!68487))

(assert (=> bs!16871 m!308303))

(declare-fun m!310217 () Bool)

(assert (=> bs!16871 m!310217))

(assert (=> b!198997 d!68487))

(assert (=> b!198997 d!68381))

(declare-fun d!68489 () Bool)

(assert (=> d!68489 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310530)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309529))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309529))) lt!310510) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_2!9202 lt!310530)))) ((_ sign_extend 32) (currentByte!9295 (_2!9202 lt!309529))) ((_ sign_extend 32) (currentBit!9290 (_2!9202 lt!309529)))) lt!310510))))

(declare-fun bs!16872 () Bool)

(assert (= bs!16872 d!68489))

(declare-fun m!310219 () Bool)

(assert (=> bs!16872 m!310219))

(assert (=> b!198997 d!68489))

(assert (=> b!198825 d!67709))

(declare-fun d!68491 () Bool)

(assert (=> d!68491 (arrayBitRangesEq!0 (buf!4948 (_2!9202 lt!309509)) (buf!4948 thiss!1204) lt!309996 lt!309981)))

(declare-fun lt!312033 () Unit!14058)

(assert (=> d!68491 (= lt!312033 (choose!8 (buf!4948 thiss!1204) (buf!4948 (_2!9202 lt!309509)) lt!309996 lt!309981))))

(assert (=> d!68491 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!309996) (bvsle lt!309996 lt!309981))))

(assert (=> d!68491 (= (arrayBitRangesEqSymmetric!0 (buf!4948 thiss!1204) (buf!4948 (_2!9202 lt!309509)) lt!309996 lt!309981) lt!312033)))

(declare-fun bs!16873 () Bool)

(assert (= bs!16873 d!68491))

(assert (=> bs!16873 m!307947))

(declare-fun m!310221 () Bool)

(assert (=> bs!16873 m!310221))

(assert (=> b!198825 d!68491))

(declare-fun b!199846 () Bool)

(declare-fun e!137139 () Bool)

(declare-fun e!137136 () Bool)

(assert (=> b!199846 (= e!137139 e!137136)))

(declare-fun res!167287 () Bool)

(declare-fun call!3167 () Bool)

(assert (=> b!199846 (= res!167287 call!3167)))

(assert (=> b!199846 (=> (not res!167287) (not e!137136))))

(declare-fun e!137135 () Bool)

(declare-fun b!199847 () Bool)

(declare-fun lt!312034 () tuple4!268)

(assert (=> b!199847 (= e!137135 (arrayRangesEq!696 (buf!4948 (_2!9202 lt!309509)) (buf!4948 thiss!1204) (_1!9222 lt!312034) (_2!9222 lt!312034)))))

(declare-fun bm!3164 () Bool)

(declare-fun c!9979 () Bool)

(declare-fun lt!312036 () (_ BitVec 32))

(declare-fun lt!312035 () (_ BitVec 32))

(assert (=> bm!3164 (= call!3167 (byteRangesEq!0 (select (arr!5386 (buf!4948 (_2!9202 lt!309509))) (_3!650 lt!312034)) (select (arr!5386 (buf!4948 thiss!1204)) (_3!650 lt!312034)) lt!312036 (ite c!9979 lt!312035 #b00000000000000000000000000001000)))))

(declare-fun b!199848 () Bool)

(declare-fun e!137137 () Bool)

(assert (=> b!199848 (= e!137137 e!137139)))

(assert (=> b!199848 (= c!9979 (= (_3!650 lt!312034) (_4!134 lt!312034)))))

(declare-fun b!199849 () Bool)

(assert (=> b!199849 (= e!137139 call!3167)))

(declare-fun b!199851 () Bool)

(declare-fun e!137134 () Bool)

(assert (=> b!199851 (= e!137134 (byteRangesEq!0 (select (arr!5386 (buf!4948 (_2!9202 lt!309509))) (_4!134 lt!312034)) (select (arr!5386 (buf!4948 thiss!1204)) (_4!134 lt!312034)) #b00000000000000000000000000000000 lt!312035))))

(declare-fun b!199852 () Bool)

(declare-fun res!167290 () Bool)

(assert (=> b!199852 (= res!167290 (= lt!312035 #b00000000000000000000000000000000))))

(assert (=> b!199852 (=> res!167290 e!137134)))

(assert (=> b!199852 (= e!137136 e!137134)))

(declare-fun b!199850 () Bool)

(declare-fun e!137138 () Bool)

(assert (=> b!199850 (= e!137138 e!137137)))

(declare-fun res!167289 () Bool)

(assert (=> b!199850 (=> (not res!167289) (not e!137137))))

(assert (=> b!199850 (= res!167289 e!137135)))

(declare-fun res!167291 () Bool)

(assert (=> b!199850 (=> res!167291 e!137135)))

(assert (=> b!199850 (= res!167291 (bvsge (_1!9222 lt!312034) (_2!9222 lt!312034)))))

(assert (=> b!199850 (= lt!312035 ((_ extract 31 0) (bvsrem lt!309981 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199850 (= lt!312036 ((_ extract 31 0) (bvsrem lt!309996 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199850 (= lt!312034 (arrayBitIndices!0 lt!309996 lt!309981))))

(declare-fun d!68493 () Bool)

(declare-fun res!167288 () Bool)

(assert (=> d!68493 (=> res!167288 e!137138)))

(assert (=> d!68493 (= res!167288 (bvsge lt!309996 lt!309981))))

(assert (=> d!68493 (= (arrayBitRangesEq!0 (buf!4948 (_2!9202 lt!309509)) (buf!4948 thiss!1204) lt!309996 lt!309981) e!137138)))

(assert (= (and d!68493 (not res!167288)) b!199850))

(assert (= (and b!199850 (not res!167291)) b!199847))

(assert (= (and b!199850 res!167289) b!199848))

(assert (= (and b!199848 c!9979) b!199849))

(assert (= (and b!199848 (not c!9979)) b!199846))

(assert (= (and b!199846 res!167287) b!199852))

(assert (= (and b!199852 (not res!167290)) b!199851))

(assert (= (or b!199849 b!199846) bm!3164))

(declare-fun m!310223 () Bool)

(assert (=> b!199847 m!310223))

(declare-fun m!310225 () Bool)

(assert (=> bm!3164 m!310225))

(declare-fun m!310227 () Bool)

(assert (=> bm!3164 m!310227))

(assert (=> bm!3164 m!310225))

(assert (=> bm!3164 m!310227))

(declare-fun m!310229 () Bool)

(assert (=> bm!3164 m!310229))

(declare-fun m!310231 () Bool)

(assert (=> b!199851 m!310231))

(declare-fun m!310233 () Bool)

(assert (=> b!199851 m!310233))

(assert (=> b!199851 m!310231))

(assert (=> b!199851 m!310233))

(declare-fun m!310235 () Bool)

(assert (=> b!199851 m!310235))

(declare-fun m!310237 () Bool)

(assert (=> b!199850 m!310237))

(assert (=> b!198825 d!68493))

(declare-fun d!68495 () Bool)

(declare-fun lt!312037 () tuple2!17136)

(assert (=> d!68495 (= lt!312037 (readBit!0 lt!309927))))

(assert (=> d!68495 (= (readBitPure!0 lt!309927) (tuple2!17115 (_2!9216 lt!312037) (_1!9216 lt!312037)))))

(declare-fun bs!16874 () Bool)

(assert (= bs!16874 d!68495))

(declare-fun m!310239 () Bool)

(assert (=> bs!16874 m!310239))

(assert (=> d!67593 d!68495))

(assert (=> d!67593 d!67631))

(declare-fun d!68497 () Bool)

(declare-fun e!137140 () Bool)

(assert (=> d!68497 e!137140))

(declare-fun res!167293 () Bool)

(assert (=> d!68497 (=> (not res!167293) (not e!137140))))

(declare-fun lt!312043 () (_ BitVec 64))

(declare-fun lt!312039 () (_ BitVec 64))

(declare-fun lt!312040 () (_ BitVec 64))

(assert (=> d!68497 (= res!167293 (= lt!312043 (bvsub lt!312039 lt!312040)))))

(assert (=> d!68497 (or (= (bvand lt!312039 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!312040 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!312039 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312039 lt!312040) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68497 (= lt!312040 (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!309926)))) ((_ sign_extend 32) (currentByte!9295 (_1!9205 lt!309926))) ((_ sign_extend 32) (currentBit!9290 (_1!9205 lt!309926)))))))

(declare-fun lt!312042 () (_ BitVec 64))

(declare-fun lt!312038 () (_ BitVec 64))

(assert (=> d!68497 (= lt!312039 (bvmul lt!312042 lt!312038))))

(assert (=> d!68497 (or (= lt!312042 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!312038 (bvsdiv (bvmul lt!312042 lt!312038) lt!312042)))))

(assert (=> d!68497 (= lt!312038 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68497 (= lt!312042 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!309926)))))))

(assert (=> d!68497 (= lt!312043 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 (_1!9205 lt!309926))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 (_1!9205 lt!309926)))))))

(assert (=> d!68497 (invariant!0 (currentBit!9290 (_1!9205 lt!309926)) (currentByte!9295 (_1!9205 lt!309926)) (size!4456 (buf!4948 (_1!9205 lt!309926))))))

(assert (=> d!68497 (= (bitIndex!0 (size!4456 (buf!4948 (_1!9205 lt!309926))) (currentByte!9295 (_1!9205 lt!309926)) (currentBit!9290 (_1!9205 lt!309926))) lt!312043)))

(declare-fun b!199853 () Bool)

(declare-fun res!167292 () Bool)

(assert (=> b!199853 (=> (not res!167292) (not e!137140))))

(assert (=> b!199853 (= res!167292 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!312043))))

(declare-fun b!199854 () Bool)

(declare-fun lt!312041 () (_ BitVec 64))

(assert (=> b!199854 (= e!137140 (bvsle lt!312043 (bvmul lt!312041 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199854 (or (= lt!312041 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!312041 #b0000000000000000000000000000000000000000000000000000000000001000) lt!312041)))))

(assert (=> b!199854 (= lt!312041 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!309926)))))))

(assert (= (and d!68497 res!167293) b!199853))

(assert (= (and b!199853 res!167292) b!199854))

(declare-fun m!310241 () Bool)

(assert (=> d!68497 m!310241))

(declare-fun m!310243 () Bool)

(assert (=> d!68497 m!310243))

(assert (=> d!67593 d!68497))

(declare-fun d!68499 () Bool)

(declare-fun e!137143 () Bool)

(assert (=> d!68499 e!137143))

(declare-fun res!167296 () Bool)

(assert (=> d!68499 (=> (not res!167296) (not e!137143))))

(declare-fun lt!312051 () tuple2!17114)

(declare-fun lt!312050 () tuple2!17114)

(assert (=> d!68499 (= res!167296 (= (bitIndex!0 (size!4456 (buf!4948 (_1!9205 lt!312051))) (currentByte!9295 (_1!9205 lt!312051)) (currentBit!9290 (_1!9205 lt!312051))) (bitIndex!0 (size!4456 (buf!4948 (_1!9205 lt!312050))) (currentByte!9295 (_1!9205 lt!312050)) (currentBit!9290 (_1!9205 lt!312050)))))))

(declare-fun lt!312052 () BitStream!8020)

(assert (=> d!68499 (= lt!312050 (readBitPure!0 lt!312052))))

(assert (=> d!68499 (= lt!312051 (readBitPure!0 lt!309515))))

(assert (=> d!68499 (= lt!312052 (BitStream!8021 (buf!4948 (_2!9202 lt!309509)) (currentByte!9295 lt!309515) (currentBit!9290 lt!309515)))))

(assert (=> d!68499 (invariant!0 (currentBit!9290 lt!309515) (currentByte!9295 lt!309515) (size!4456 (buf!4948 (_2!9202 lt!309509))))))

(assert (=> d!68499 true))

(declare-fun _$9!84 () Unit!14058)

(assert (=> d!68499 (= (choose!50 lt!309515 (_2!9202 lt!309509) lt!309927 lt!309926 (tuple2!17115 (_1!9205 lt!309926) (_2!9205 lt!309926)) (_1!9205 lt!309926) (_2!9205 lt!309926) lt!309928 (tuple2!17115 (_1!9205 lt!309928) (_2!9205 lt!309928)) (_1!9205 lt!309928) (_2!9205 lt!309928)) _$9!84)))

(declare-fun b!199857 () Bool)

(assert (=> b!199857 (= e!137143 (= (_2!9205 lt!312051) (_2!9205 lt!312050)))))

(assert (= (and d!68499 res!167296) b!199857))

(declare-fun m!310245 () Bool)

(assert (=> d!68499 m!310245))

(assert (=> d!68499 m!307901))

(declare-fun m!310247 () Bool)

(assert (=> d!68499 m!310247))

(declare-fun m!310249 () Bool)

(assert (=> d!68499 m!310249))

(assert (=> d!68499 m!307535))

(assert (=> d!67593 d!68499))

(declare-fun d!68501 () Bool)

(assert (=> d!68501 (= (invariant!0 (currentBit!9290 lt!309515) (currentByte!9295 lt!309515) (size!4456 (buf!4948 (_2!9202 lt!309509)))) (and (bvsge (currentBit!9290 lt!309515) #b00000000000000000000000000000000) (bvslt (currentBit!9290 lt!309515) #b00000000000000000000000000001000) (bvsge (currentByte!9295 lt!309515) #b00000000000000000000000000000000) (or (bvslt (currentByte!9295 lt!309515) (size!4456 (buf!4948 (_2!9202 lt!309509)))) (and (= (currentBit!9290 lt!309515) #b00000000000000000000000000000000) (= (currentByte!9295 lt!309515) (size!4456 (buf!4948 (_2!9202 lt!309509))))))))))

(assert (=> d!67593 d!68501))

(declare-fun d!68503 () Bool)

(declare-fun e!137144 () Bool)

(assert (=> d!68503 e!137144))

(declare-fun res!167298 () Bool)

(assert (=> d!68503 (=> (not res!167298) (not e!137144))))

(declare-fun lt!312055 () (_ BitVec 64))

(declare-fun lt!312054 () (_ BitVec 64))

(declare-fun lt!312058 () (_ BitVec 64))

(assert (=> d!68503 (= res!167298 (= lt!312058 (bvsub lt!312054 lt!312055)))))

(assert (=> d!68503 (or (= (bvand lt!312054 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!312055 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!312054 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312054 lt!312055) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68503 (= lt!312055 (remainingBits!0 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!309928)))) ((_ sign_extend 32) (currentByte!9295 (_1!9205 lt!309928))) ((_ sign_extend 32) (currentBit!9290 (_1!9205 lt!309928)))))))

(declare-fun lt!312057 () (_ BitVec 64))

(declare-fun lt!312053 () (_ BitVec 64))

(assert (=> d!68503 (= lt!312054 (bvmul lt!312057 lt!312053))))

(assert (=> d!68503 (or (= lt!312057 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!312053 (bvsdiv (bvmul lt!312057 lt!312053) lt!312057)))))

(assert (=> d!68503 (= lt!312053 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68503 (= lt!312057 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!309928)))))))

(assert (=> d!68503 (= lt!312058 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9295 (_1!9205 lt!309928))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9290 (_1!9205 lt!309928)))))))

(assert (=> d!68503 (invariant!0 (currentBit!9290 (_1!9205 lt!309928)) (currentByte!9295 (_1!9205 lt!309928)) (size!4456 (buf!4948 (_1!9205 lt!309928))))))

(assert (=> d!68503 (= (bitIndex!0 (size!4456 (buf!4948 (_1!9205 lt!309928))) (currentByte!9295 (_1!9205 lt!309928)) (currentBit!9290 (_1!9205 lt!309928))) lt!312058)))

(declare-fun b!199858 () Bool)

(declare-fun res!167297 () Bool)

(assert (=> b!199858 (=> (not res!167297) (not e!137144))))

(assert (=> b!199858 (= res!167297 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!312058))))

(declare-fun b!199859 () Bool)

(declare-fun lt!312056 () (_ BitVec 64))

(assert (=> b!199859 (= e!137144 (bvsle lt!312058 (bvmul lt!312056 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199859 (or (= lt!312056 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!312056 #b0000000000000000000000000000000000000000000000000000000000001000) lt!312056)))))

(assert (=> b!199859 (= lt!312056 ((_ sign_extend 32) (size!4456 (buf!4948 (_1!9205 lt!309928)))))))

(assert (= (and d!68503 res!167298) b!199858))

(assert (= (and b!199858 res!167297) b!199859))

(declare-fun m!310251 () Bool)

(assert (=> d!68503 m!310251))

(declare-fun m!310253 () Bool)

(assert (=> d!68503 m!310253))

(assert (=> d!67593 d!68503))

(declare-fun d!68505 () Bool)

(assert (=> d!68505 (= (invariant!0 (currentBit!9290 (_2!9202 lt!310530)) (currentByte!9295 (_2!9202 lt!310530)) (size!4456 (buf!4948 (_2!9202 lt!310530)))) (and (bvsge (currentBit!9290 (_2!9202 lt!310530)) #b00000000000000000000000000000000) (bvslt (currentBit!9290 (_2!9202 lt!310530)) #b00000000000000000000000000001000) (bvsge (currentByte!9295 (_2!9202 lt!310530)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9295 (_2!9202 lt!310530)) (size!4456 (buf!4948 (_2!9202 lt!310530)))) (and (= (currentBit!9290 (_2!9202 lt!310530)) #b00000000000000000000000000000000) (= (currentByte!9295 (_2!9202 lt!310530)) (size!4456 (buf!4948 (_2!9202 lt!310530))))))))))

(assert (=> d!67643 d!68505))

(push 1)

(assert (not d!68409))

(assert (not b!199850))

(assert (not d!68425))

(assert (not d!68401))

(assert (not d!68371))

(assert (not b!199726))

(assert (not d!68491))

(assert (not b!199738))

(assert (not d!68305))

(assert (not d!68261))

(assert (not b!199788))

(assert (not d!68323))

(assert (not b!199765))

(assert (not d!68395))

(assert (not b!199720))

(assert (not d!68483))

(assert (not b!199829))

(assert (not d!68421))

(assert (not b!199696))

(assert (not bm!3161))

(assert (not b!199824))

(assert (not b!199669))

(assert (not bm!3160))

(assert (not b!199827))

(assert (not d!68319))

(assert (not d!68291))

(assert (not b!199836))

(assert (not b!199766))

(assert (not d!68295))

(assert (not b!199727))

(assert (not d!68453))

(assert (not b!199741))

(assert (not d!68449))

(assert (not b!199685))

(assert (not b!199810))

(assert (not d!68333))

(assert (not d!68499))

(assert (not d!68455))

(assert (not b!199684))

(assert (not b!199745))

(assert (not b!199730))

(assert (not b!199805))

(assert (not b!199619))

(assert (not b!199841))

(assert (not bm!3162))

(assert (not d!68387))

(assert (not b!199732))

(assert (not b!199756))

(assert (not b!199695))

(assert (not b!199729))

(assert (not b!199845))

(assert (not b!199700))

(assert (not d!68301))

(assert (not b!199806))

(assert (not d!68307))

(assert (not d!68313))

(assert (not b!199692))

(assert (not b!199721))

(assert (not b!199832))

(assert (not d!68263))

(assert (not b!199642))

(assert (not d!68357))

(assert (not d!68393))

(assert (not b!199823))

(assert (not b!199782))

(assert (not d!68465))

(assert (not d!68497))

(assert (not b!199843))

(assert (not b!199781))

(assert (not b!199723))

(assert (not b!199830))

(assert (not b!199767))

(assert (not b!199736))

(assert (not b!199813))

(assert (not b!199658))

(assert (not b!199763))

(assert (not b!199707))

(assert (not d!68419))

(assert (not d!68441))

(assert (not d!68403))

(assert (not d!68429))

(assert (not b!199838))

(assert (not d!68349))

(assert (not b!199663))

(assert (not d!68325))

(assert (not d!68417))

(assert (not d!68281))

(assert (not b!199698))

(assert (not d!68467))

(assert (not d!68489))

(assert (not d!68267))

(assert (not b!199808))

(assert (not b!199793))

(assert (not d!68407))

(assert (not d!68397))

(assert (not d!68463))

(assert (not b!199784))

(assert (not b!199742))

(assert (not b!199717))

(assert (not b!199733))

(assert (not d!68477))

(assert (not b!199833))

(assert (not d!68331))

(assert (not d!68265))

(assert (not b!199807))

(assert (not d!68375))

(assert (not b!199711))

(assert (not d!68293))

(assert (not b!199780))

(assert (not b!199603))

(assert (not d!68327))

(assert (not d!68379))

(assert (not d!68351))

(assert (not b!199779))

(assert (not d!68347))

(assert (not d!68361))

(assert (not b!199844))

(assert (not b!199622))

(assert (not d!68427))

(assert (not d!68399))

(assert (not bm!3164))

(assert (not b!199641))

(assert (not d!68391))

(assert (not b!199683))

(assert (not b!199775))

(assert (not d!68289))

(assert (not b!199644))

(assert (not d!68383))

(assert (not b!199803))

(assert (not d!68415))

(assert (not b!199744))

(assert (not d!68365))

(assert (not d!68485))

(assert (not d!68423))

(assert (not d!68473))

(assert (not d!68405))

(assert (not b!199690))

(assert (not b!199666))

(assert (not b!199753))

(assert (not b!199851))

(assert (not b!199835))

(assert (not b!199804))

(assert (not b!199816))

(assert (not b!199701))

(assert (not b!199754))

(assert (not d!68503))

(assert (not d!68373))

(assert (not d!68411))

(assert (not b!199794))

(assert (not d!68287))

(assert (not b!199758))

(assert (not b!199755))

(assert (not b!199693))

(assert (not bm!3159))

(assert (not d!68445))

(assert (not b!199818))

(assert (not b!199682))

(assert (not b!199786))

(assert (not b!199751))

(assert (not d!68343))

(assert (not b!199703))

(assert (not d!68369))

(assert (not b!199724))

(assert (not b!199847))

(assert (not b!199778))

(assert (not b!199759))

(assert (not d!68389))

(assert (not b!199820))

(assert (not d!68487))

(assert (not d!68363))

(assert (not d!68443))

(assert (not d!68275))

(assert (not b!199735))

(assert (not b!199814))

(assert (not b!199645))

(assert (not b!199710))

(assert (not b!199757))

(assert (not b!199643))

(assert (not b!199719))

(assert (not b!199664))

(assert (not b!199623))

(assert (not d!68269))

(assert (not bm!3163))

(assert (not b!199681))

(assert (not b!199783))

(assert (not d!68481))

(assert (not b!199785))

(assert (not b!199601))

(assert (not b!199743))

(assert (not d!68495))

(check-sat)

(pop 1)

(push 1)

(check-sat)

