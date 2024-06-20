; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42100 () Bool)

(assert start!42100)

(declare-fun b!198630 () Bool)

(declare-fun res!166280 () Bool)

(declare-fun e!136362 () Bool)

(assert (=> b!198630 (=> res!166280 e!136362)))

(declare-datatypes ((array!10114 0))(
  ( (array!10115 (arr!5387 (Array (_ BitVec 32) (_ BitVec 8))) (size!4457 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8022 0))(
  ( (BitStream!8023 (buf!4949 array!10114) (currentByte!9296 (_ BitVec 32)) (currentBit!9291 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14060 0))(
  ( (Unit!14061) )
))
(declare-datatypes ((tuple2!17116 0))(
  ( (tuple2!17117 (_1!9206 Unit!14060) (_2!9206 BitStream!8022)) )
))
(declare-fun lt!309597 () tuple2!17116)

(declare-fun lt!309593 () tuple2!17116)

(declare-fun isPrefixOf!0 (BitStream!8022 BitStream!8022) Bool)

(assert (=> b!198630 (= res!166280 (not (isPrefixOf!0 (_2!9206 lt!309597) (_2!9206 lt!309593))))))

(declare-fun b!198631 () Bool)

(declare-fun res!166283 () Bool)

(assert (=> b!198631 (=> res!166283 e!136362)))

(declare-fun thiss!1204 () BitStream!8022)

(assert (=> b!198631 (= res!166283 (not (isPrefixOf!0 thiss!1204 (_2!9206 lt!309597))))))

(declare-fun res!166287 () Bool)

(declare-fun e!136360 () Bool)

(assert (=> start!42100 (=> (not res!166287) (not e!136360))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!42100 (= res!166287 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42100 e!136360))

(assert (=> start!42100 true))

(declare-fun e!136366 () Bool)

(declare-fun inv!12 (BitStream!8022) Bool)

(assert (=> start!42100 (and (inv!12 thiss!1204) e!136366)))

(declare-fun b!198632 () Bool)

(declare-fun e!136359 () Bool)

(assert (=> b!198632 (= e!136362 e!136359)))

(declare-fun res!166276 () Bool)

(assert (=> b!198632 (=> res!166276 e!136359)))

(declare-fun lt!309610 () (_ BitVec 64))

(declare-datatypes ((tuple2!17118 0))(
  ( (tuple2!17119 (_1!9207 BitStream!8022) (_2!9207 BitStream!8022)) )
))
(declare-fun lt!309590 () tuple2!17118)

(declare-datatypes ((tuple2!17120 0))(
  ( (tuple2!17121 (_1!9208 BitStream!8022) (_2!9208 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8022 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17120)

(assert (=> b!198632 (= res!166276 (not (= (_1!9208 (readNBitsLSBFirstsLoopPure!0 (_1!9207 lt!309590) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!309610)) (_2!9207 lt!309590))))))

(declare-fun lt!309598 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!198632 (validate_offset_bits!1 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309593)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309597))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309597))) lt!309598)))

(declare-fun lt!309613 () Unit!14060)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8022 array!10114 (_ BitVec 64)) Unit!14060)

(assert (=> b!198632 (= lt!309613 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9206 lt!309597) (buf!4949 (_2!9206 lt!309593)) lt!309598))))

(assert (=> b!198632 (= lt!309598 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!17122 0))(
  ( (tuple2!17123 (_1!9209 BitStream!8022) (_2!9209 Bool)) )
))
(declare-fun lt!309589 () tuple2!17122)

(declare-fun lt!309607 () (_ BitVec 64))

(declare-fun lt!309600 () (_ BitVec 64))

(assert (=> b!198632 (= lt!309610 (bvor lt!309607 (ite (_2!9209 lt!309589) lt!309600 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!309604 () tuple2!17118)

(declare-fun lt!309605 () tuple2!17120)

(assert (=> b!198632 (= lt!309605 (readNBitsLSBFirstsLoopPure!0 (_1!9207 lt!309604) nBits!348 i!590 lt!309607))))

(declare-fun lt!309595 () (_ BitVec 64))

(assert (=> b!198632 (validate_offset_bits!1 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309593)))) ((_ sign_extend 32) (currentByte!9296 thiss!1204)) ((_ sign_extend 32) (currentBit!9291 thiss!1204)) lt!309595)))

(declare-fun lt!309615 () Unit!14060)

(assert (=> b!198632 (= lt!309615 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4949 (_2!9206 lt!309593)) lt!309595))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!198632 (= lt!309607 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!309601 () Bool)

(assert (=> b!198632 (= (_2!9209 lt!309589) lt!309601)))

(declare-fun readBitPure!0 (BitStream!8022) tuple2!17122)

(assert (=> b!198632 (= lt!309589 (readBitPure!0 (_1!9207 lt!309604)))))

(declare-fun reader!0 (BitStream!8022 BitStream!8022) tuple2!17118)

(assert (=> b!198632 (= lt!309590 (reader!0 (_2!9206 lt!309597) (_2!9206 lt!309593)))))

(assert (=> b!198632 (= lt!309604 (reader!0 thiss!1204 (_2!9206 lt!309593)))))

(declare-fun e!136361 () Bool)

(assert (=> b!198632 e!136361))

(declare-fun res!166268 () Bool)

(assert (=> b!198632 (=> (not res!166268) (not e!136361))))

(declare-fun lt!309603 () tuple2!17122)

(declare-fun lt!309602 () tuple2!17122)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!198632 (= res!166268 (= (bitIndex!0 (size!4457 (buf!4949 (_1!9209 lt!309603))) (currentByte!9296 (_1!9209 lt!309603)) (currentBit!9291 (_1!9209 lt!309603))) (bitIndex!0 (size!4457 (buf!4949 (_1!9209 lt!309602))) (currentByte!9296 (_1!9209 lt!309602)) (currentBit!9291 (_1!9209 lt!309602)))))))

(declare-fun lt!309596 () Unit!14060)

(declare-fun lt!309591 () BitStream!8022)

(declare-fun readBitPrefixLemma!0 (BitStream!8022 BitStream!8022) Unit!14060)

(assert (=> b!198632 (= lt!309596 (readBitPrefixLemma!0 lt!309591 (_2!9206 lt!309593)))))

(assert (=> b!198632 (= lt!309602 (readBitPure!0 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204))))))

(assert (=> b!198632 (= lt!309603 (readBitPure!0 lt!309591))))

(declare-fun e!136356 () Bool)

(assert (=> b!198632 e!136356))

(declare-fun res!166275 () Bool)

(assert (=> b!198632 (=> (not res!166275) (not e!136356))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!198632 (= res!166275 (invariant!0 (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204) (size!4457 (buf!4949 (_2!9206 lt!309597)))))))

(assert (=> b!198632 (= lt!309591 (BitStream!8023 (buf!4949 (_2!9206 lt!309597)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)))))

(declare-fun b!198633 () Bool)

(declare-fun res!166272 () Bool)

(declare-fun e!136364 () Bool)

(assert (=> b!198633 (=> (not res!166272) (not e!136364))))

(declare-fun lt!309606 () (_ BitVec 64))

(declare-fun lt!309614 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8022 (_ BitVec 64)) BitStream!8022)

(assert (=> b!198633 (= res!166272 (= (_1!9207 lt!309590) (withMovedBitIndex!0 (_2!9207 lt!309590) (bvsub lt!309614 lt!309606))))))

(declare-fun b!198634 () Bool)

(declare-fun lt!309611 () (_ BitVec 64))

(assert (=> b!198634 (= e!136364 (= lt!309611 (bvsub lt!309614 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!198635 () Bool)

(declare-fun res!166273 () Bool)

(assert (=> b!198635 (=> (not res!166273) (not e!136364))))

(assert (=> b!198635 (= res!166273 (= (_1!9207 lt!309604) (withMovedBitIndex!0 (_2!9207 lt!309604) (bvsub lt!309611 lt!309606))))))

(declare-fun b!198636 () Bool)

(assert (=> b!198636 (= e!136361 (= (_2!9209 lt!309603) (_2!9209 lt!309602)))))

(declare-fun b!198637 () Bool)

(declare-fun res!166270 () Bool)

(declare-fun e!136355 () Bool)

(assert (=> b!198637 (=> (not res!166270) (not e!136355))))

(assert (=> b!198637 (= res!166270 (invariant!0 (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204) (size!4457 (buf!4949 thiss!1204))))))

(declare-fun b!198638 () Bool)

(declare-fun lt!309608 () BitStream!8022)

(assert (=> b!198638 (= e!136359 (= (_1!9207 lt!309590) lt!309608))))

(assert (=> b!198638 e!136364))

(declare-fun res!166284 () Bool)

(assert (=> b!198638 (=> (not res!166284) (not e!136364))))

(declare-fun lt!309594 () tuple2!17120)

(assert (=> b!198638 (= res!166284 (and (= (_2!9208 lt!309605) (_2!9208 lt!309594)) (= (_1!9208 lt!309605) (_1!9208 lt!309594))))))

(declare-fun lt!309612 () Unit!14060)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8022 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14060)

(assert (=> b!198638 (= lt!309612 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9207 lt!309604) nBits!348 i!590 lt!309607))))

(assert (=> b!198638 (= lt!309594 (readNBitsLSBFirstsLoopPure!0 lt!309608 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!309610))))

(assert (=> b!198638 (= lt!309608 (withMovedBitIndex!0 (_1!9207 lt!309604) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!198639 () Bool)

(assert (=> b!198639 (= e!136360 e!136355)))

(declare-fun res!166281 () Bool)

(assert (=> b!198639 (=> (not res!166281) (not e!136355))))

(assert (=> b!198639 (= res!166281 (validate_offset_bits!1 ((_ sign_extend 32) (size!4457 (buf!4949 thiss!1204))) ((_ sign_extend 32) (currentByte!9296 thiss!1204)) ((_ sign_extend 32) (currentBit!9291 thiss!1204)) lt!309595))))

(assert (=> b!198639 (= lt!309595 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!198640 () Bool)

(declare-fun res!166271 () Bool)

(assert (=> b!198640 (=> res!166271 e!136362)))

(assert (=> b!198640 (= res!166271 (not (invariant!0 (currentBit!9291 (_2!9206 lt!309593)) (currentByte!9296 (_2!9206 lt!309593)) (size!4457 (buf!4949 (_2!9206 lt!309593))))))))

(declare-fun b!198641 () Bool)

(declare-fun e!136363 () Bool)

(declare-fun lt!309599 () tuple2!17122)

(declare-fun lt!309616 () (_ BitVec 64))

(assert (=> b!198641 (= e!136363 (= (bitIndex!0 (size!4457 (buf!4949 (_1!9209 lt!309599))) (currentByte!9296 (_1!9209 lt!309599)) (currentBit!9291 (_1!9209 lt!309599))) lt!309616))))

(declare-fun b!198642 () Bool)

(declare-fun res!166282 () Bool)

(assert (=> b!198642 (=> res!166282 e!136362)))

(assert (=> b!198642 (= res!166282 (or (not (= (size!4457 (buf!4949 (_2!9206 lt!309593))) (size!4457 (buf!4949 thiss!1204)))) (not (= lt!309606 (bvsub (bvadd lt!309611 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!198643 () Bool)

(declare-fun e!136357 () Bool)

(declare-fun e!136358 () Bool)

(assert (=> b!198643 (= e!136357 e!136358)))

(declare-fun res!166277 () Bool)

(assert (=> b!198643 (=> (not res!166277) (not e!136358))))

(declare-fun lt!309592 () (_ BitVec 64))

(assert (=> b!198643 (= res!166277 (= lt!309616 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!309592)))))

(assert (=> b!198643 (= lt!309616 (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))))))

(assert (=> b!198643 (= lt!309592 (bitIndex!0 (size!4457 (buf!4949 thiss!1204)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)))))

(declare-fun b!198644 () Bool)

(assert (=> b!198644 (= e!136356 (invariant!0 (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204) (size!4457 (buf!4949 (_2!9206 lt!309593)))))))

(declare-fun b!198645 () Bool)

(declare-fun e!136367 () Bool)

(assert (=> b!198645 (= e!136355 (not e!136367))))

(declare-fun res!166279 () Bool)

(assert (=> b!198645 (=> res!166279 e!136367)))

(assert (=> b!198645 (= res!166279 (not (= lt!309614 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!309611))))))

(assert (=> b!198645 (= lt!309614 (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))))))

(assert (=> b!198645 (= lt!309611 (bitIndex!0 (size!4457 (buf!4949 thiss!1204)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)))))

(assert (=> b!198645 e!136357))

(declare-fun res!166285 () Bool)

(assert (=> b!198645 (=> (not res!166285) (not e!136357))))

(assert (=> b!198645 (= res!166285 (= (size!4457 (buf!4949 thiss!1204)) (size!4457 (buf!4949 (_2!9206 lt!309597)))))))

(declare-fun appendBit!0 (BitStream!8022 Bool) tuple2!17116)

(assert (=> b!198645 (= lt!309597 (appendBit!0 thiss!1204 lt!309601))))

(assert (=> b!198645 (= lt!309601 (not (= (bvand v!189 lt!309600) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198645 (= lt!309600 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!198646 () Bool)

(declare-fun array_inv!4198 (array!10114) Bool)

(assert (=> b!198646 (= e!136366 (array_inv!4198 (buf!4949 thiss!1204)))))

(declare-fun b!198647 () Bool)

(assert (=> b!198647 (= e!136367 e!136362)))

(declare-fun res!166274 () Bool)

(assert (=> b!198647 (=> res!166274 e!136362)))

(assert (=> b!198647 (= res!166274 (not (= lt!309606 (bvsub (bvsub (bvadd lt!309614 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!198647 (= lt!309606 (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309593))) (currentByte!9296 (_2!9206 lt!309593)) (currentBit!9291 (_2!9206 lt!309593))))))

(assert (=> b!198647 (isPrefixOf!0 thiss!1204 (_2!9206 lt!309593))))

(declare-fun lt!309609 () Unit!14060)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8022 BitStream!8022 BitStream!8022) Unit!14060)

(assert (=> b!198647 (= lt!309609 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9206 lt!309597) (_2!9206 lt!309593)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8022 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17116)

(assert (=> b!198647 (= lt!309593 (appendBitsLSBFirstLoopTR!0 (_2!9206 lt!309597) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!198648 () Bool)

(assert (=> b!198648 (= e!136358 e!136363)))

(declare-fun res!166269 () Bool)

(assert (=> b!198648 (=> (not res!166269) (not e!136363))))

(assert (=> b!198648 (= res!166269 (and (= (_2!9209 lt!309599) lt!309601) (= (_1!9209 lt!309599) (_2!9206 lt!309597))))))

(declare-fun readerFrom!0 (BitStream!8022 (_ BitVec 32) (_ BitVec 32)) BitStream!8022)

(assert (=> b!198648 (= lt!309599 (readBitPure!0 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204))))))

(declare-fun b!198649 () Bool)

(declare-fun res!166278 () Bool)

(assert (=> b!198649 (=> (not res!166278) (not e!136355))))

(assert (=> b!198649 (= res!166278 (not (= i!590 nBits!348)))))

(declare-fun b!198650 () Bool)

(declare-fun res!166286 () Bool)

(assert (=> b!198650 (=> (not res!166286) (not e!136358))))

(assert (=> b!198650 (= res!166286 (isPrefixOf!0 thiss!1204 (_2!9206 lt!309597)))))

(assert (= (and start!42100 res!166287) b!198639))

(assert (= (and b!198639 res!166281) b!198637))

(assert (= (and b!198637 res!166270) b!198649))

(assert (= (and b!198649 res!166278) b!198645))

(assert (= (and b!198645 res!166285) b!198643))

(assert (= (and b!198643 res!166277) b!198650))

(assert (= (and b!198650 res!166286) b!198648))

(assert (= (and b!198648 res!166269) b!198641))

(assert (= (and b!198645 (not res!166279)) b!198647))

(assert (= (and b!198647 (not res!166274)) b!198640))

(assert (= (and b!198640 (not res!166271)) b!198642))

(assert (= (and b!198642 (not res!166282)) b!198630))

(assert (= (and b!198630 (not res!166280)) b!198631))

(assert (= (and b!198631 (not res!166283)) b!198632))

(assert (= (and b!198632 res!166275) b!198644))

(assert (= (and b!198632 res!166268) b!198636))

(assert (= (and b!198632 (not res!166276)) b!198638))

(assert (= (and b!198638 res!166284) b!198635))

(assert (= (and b!198635 res!166273) b!198633))

(assert (= (and b!198633 res!166272) b!198634))

(assert (= start!42100 b!198646))

(declare-fun m!307573 () Bool)

(assert (=> b!198632 m!307573))

(declare-fun m!307575 () Bool)

(assert (=> b!198632 m!307575))

(declare-fun m!307577 () Bool)

(assert (=> b!198632 m!307577))

(declare-fun m!307579 () Bool)

(assert (=> b!198632 m!307579))

(declare-fun m!307581 () Bool)

(assert (=> b!198632 m!307581))

(declare-fun m!307583 () Bool)

(assert (=> b!198632 m!307583))

(declare-fun m!307585 () Bool)

(assert (=> b!198632 m!307585))

(declare-fun m!307587 () Bool)

(assert (=> b!198632 m!307587))

(declare-fun m!307589 () Bool)

(assert (=> b!198632 m!307589))

(declare-fun m!307591 () Bool)

(assert (=> b!198632 m!307591))

(declare-fun m!307593 () Bool)

(assert (=> b!198632 m!307593))

(declare-fun m!307595 () Bool)

(assert (=> b!198632 m!307595))

(declare-fun m!307597 () Bool)

(assert (=> b!198632 m!307597))

(declare-fun m!307599 () Bool)

(assert (=> b!198632 m!307599))

(declare-fun m!307601 () Bool)

(assert (=> b!198632 m!307601))

(declare-fun m!307603 () Bool)

(assert (=> b!198632 m!307603))

(declare-fun m!307605 () Bool)

(assert (=> b!198637 m!307605))

(declare-fun m!307607 () Bool)

(assert (=> b!198645 m!307607))

(declare-fun m!307609 () Bool)

(assert (=> b!198645 m!307609))

(declare-fun m!307611 () Bool)

(assert (=> b!198645 m!307611))

(declare-fun m!307613 () Bool)

(assert (=> start!42100 m!307613))

(declare-fun m!307615 () Bool)

(assert (=> b!198641 m!307615))

(declare-fun m!307617 () Bool)

(assert (=> b!198640 m!307617))

(declare-fun m!307619 () Bool)

(assert (=> b!198644 m!307619))

(declare-fun m!307621 () Bool)

(assert (=> b!198638 m!307621))

(declare-fun m!307623 () Bool)

(assert (=> b!198638 m!307623))

(declare-fun m!307625 () Bool)

(assert (=> b!198638 m!307625))

(declare-fun m!307627 () Bool)

(assert (=> b!198630 m!307627))

(declare-fun m!307629 () Bool)

(assert (=> b!198646 m!307629))

(declare-fun m!307631 () Bool)

(assert (=> b!198633 m!307631))

(assert (=> b!198643 m!307607))

(assert (=> b!198643 m!307609))

(declare-fun m!307633 () Bool)

(assert (=> b!198650 m!307633))

(declare-fun m!307635 () Bool)

(assert (=> b!198647 m!307635))

(declare-fun m!307637 () Bool)

(assert (=> b!198647 m!307637))

(declare-fun m!307639 () Bool)

(assert (=> b!198647 m!307639))

(declare-fun m!307641 () Bool)

(assert (=> b!198647 m!307641))

(declare-fun m!307643 () Bool)

(assert (=> b!198648 m!307643))

(assert (=> b!198648 m!307643))

(declare-fun m!307645 () Bool)

(assert (=> b!198648 m!307645))

(assert (=> b!198631 m!307633))

(declare-fun m!307647 () Bool)

(assert (=> b!198639 m!307647))

(declare-fun m!307649 () Bool)

(assert (=> b!198635 m!307649))

(check-sat (not b!198639) (not b!198646) (not start!42100) (not b!198641) (not b!198638) (not b!198631) (not b!198632) (not b!198647) (not b!198633) (not b!198645) (not b!198637) (not b!198643) (not b!198635) (not b!198644) (not b!198630) (not b!198648) (not b!198650) (not b!198640))
(check-sat)
(get-model)

(declare-fun d!67517 () Bool)

(declare-fun e!136409 () Bool)

(assert (=> d!67517 e!136409))

(declare-fun res!166353 () Bool)

(assert (=> d!67517 (=> (not res!166353) (not e!136409))))

(declare-fun lt!309715 () (_ BitVec 64))

(declare-fun lt!309717 () (_ BitVec 64))

(declare-fun lt!309716 () (_ BitVec 64))

(assert (=> d!67517 (= res!166353 (= lt!309715 (bvsub lt!309716 lt!309717)))))

(assert (=> d!67517 (or (= (bvand lt!309716 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309717 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!309716 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309716 lt!309717) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!67517 (= lt!309717 (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309597)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309597))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309597)))))))

(declare-fun lt!309714 () (_ BitVec 64))

(declare-fun lt!309718 () (_ BitVec 64))

(assert (=> d!67517 (= lt!309716 (bvmul lt!309714 lt!309718))))

(assert (=> d!67517 (or (= lt!309714 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!309718 (bvsdiv (bvmul lt!309714 lt!309718) lt!309714)))))

(assert (=> d!67517 (= lt!309718 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67517 (= lt!309714 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309597)))))))

(assert (=> d!67517 (= lt!309715 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309597))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309597)))))))

(assert (=> d!67517 (invariant!0 (currentBit!9291 (_2!9206 lt!309597)) (currentByte!9296 (_2!9206 lt!309597)) (size!4457 (buf!4949 (_2!9206 lt!309597))))))

(assert (=> d!67517 (= (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))) lt!309715)))

(declare-fun b!198718 () Bool)

(declare-fun res!166352 () Bool)

(assert (=> b!198718 (=> (not res!166352) (not e!136409))))

(assert (=> b!198718 (= res!166352 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!309715))))

(declare-fun b!198719 () Bool)

(declare-fun lt!309713 () (_ BitVec 64))

(assert (=> b!198719 (= e!136409 (bvsle lt!309715 (bvmul lt!309713 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198719 (or (= lt!309713 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!309713 #b0000000000000000000000000000000000000000000000000000000000001000) lt!309713)))))

(assert (=> b!198719 (= lt!309713 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309597)))))))

(assert (= (and d!67517 res!166353) b!198718))

(assert (= (and b!198718 res!166352) b!198719))

(declare-fun m!307729 () Bool)

(assert (=> d!67517 m!307729))

(declare-fun m!307731 () Bool)

(assert (=> d!67517 m!307731))

(assert (=> b!198643 d!67517))

(declare-fun d!67519 () Bool)

(declare-fun e!136410 () Bool)

(assert (=> d!67519 e!136410))

(declare-fun res!166355 () Bool)

(assert (=> d!67519 (=> (not res!166355) (not e!136410))))

(declare-fun lt!309722 () (_ BitVec 64))

(declare-fun lt!309721 () (_ BitVec 64))

(declare-fun lt!309723 () (_ BitVec 64))

(assert (=> d!67519 (= res!166355 (= lt!309721 (bvsub lt!309722 lt!309723)))))

(assert (=> d!67519 (or (= (bvand lt!309722 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309723 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!309722 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309722 lt!309723) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67519 (= lt!309723 (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 thiss!1204))) ((_ sign_extend 32) (currentByte!9296 thiss!1204)) ((_ sign_extend 32) (currentBit!9291 thiss!1204))))))

(declare-fun lt!309720 () (_ BitVec 64))

(declare-fun lt!309724 () (_ BitVec 64))

(assert (=> d!67519 (= lt!309722 (bvmul lt!309720 lt!309724))))

(assert (=> d!67519 (or (= lt!309720 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!309724 (bvsdiv (bvmul lt!309720 lt!309724) lt!309720)))))

(assert (=> d!67519 (= lt!309724 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67519 (= lt!309720 ((_ sign_extend 32) (size!4457 (buf!4949 thiss!1204))))))

(assert (=> d!67519 (= lt!309721 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 thiss!1204))))))

(assert (=> d!67519 (invariant!0 (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204) (size!4457 (buf!4949 thiss!1204)))))

(assert (=> d!67519 (= (bitIndex!0 (size!4457 (buf!4949 thiss!1204)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)) lt!309721)))

(declare-fun b!198720 () Bool)

(declare-fun res!166354 () Bool)

(assert (=> b!198720 (=> (not res!166354) (not e!136410))))

(assert (=> b!198720 (= res!166354 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!309721))))

(declare-fun b!198721 () Bool)

(declare-fun lt!309719 () (_ BitVec 64))

(assert (=> b!198721 (= e!136410 (bvsle lt!309721 (bvmul lt!309719 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198721 (or (= lt!309719 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!309719 #b0000000000000000000000000000000000000000000000000000000000001000) lt!309719)))))

(assert (=> b!198721 (= lt!309719 ((_ sign_extend 32) (size!4457 (buf!4949 thiss!1204))))))

(assert (= (and d!67519 res!166355) b!198720))

(assert (= (and b!198720 res!166354) b!198721))

(declare-fun m!307733 () Bool)

(assert (=> d!67519 m!307733))

(assert (=> d!67519 m!307605))

(assert (=> b!198643 d!67519))

(declare-fun d!67521 () Bool)

(assert (=> d!67521 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!198632 d!67521))

(declare-fun d!67523 () Bool)

(declare-fun e!136411 () Bool)

(assert (=> d!67523 e!136411))

(declare-fun res!166357 () Bool)

(assert (=> d!67523 (=> (not res!166357) (not e!136411))))

(declare-fun lt!309727 () (_ BitVec 64))

(declare-fun lt!309728 () (_ BitVec 64))

(declare-fun lt!309729 () (_ BitVec 64))

(assert (=> d!67523 (= res!166357 (= lt!309727 (bvsub lt!309728 lt!309729)))))

(assert (=> d!67523 (or (= (bvand lt!309728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309729 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!309728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309728 lt!309729) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67523 (= lt!309729 (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!309602)))) ((_ sign_extend 32) (currentByte!9296 (_1!9209 lt!309602))) ((_ sign_extend 32) (currentBit!9291 (_1!9209 lt!309602)))))))

(declare-fun lt!309726 () (_ BitVec 64))

(declare-fun lt!309730 () (_ BitVec 64))

(assert (=> d!67523 (= lt!309728 (bvmul lt!309726 lt!309730))))

(assert (=> d!67523 (or (= lt!309726 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!309730 (bvsdiv (bvmul lt!309726 lt!309730) lt!309726)))))

(assert (=> d!67523 (= lt!309730 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67523 (= lt!309726 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!309602)))))))

(assert (=> d!67523 (= lt!309727 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 (_1!9209 lt!309602))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 (_1!9209 lt!309602)))))))

(assert (=> d!67523 (invariant!0 (currentBit!9291 (_1!9209 lt!309602)) (currentByte!9296 (_1!9209 lt!309602)) (size!4457 (buf!4949 (_1!9209 lt!309602))))))

(assert (=> d!67523 (= (bitIndex!0 (size!4457 (buf!4949 (_1!9209 lt!309602))) (currentByte!9296 (_1!9209 lt!309602)) (currentBit!9291 (_1!9209 lt!309602))) lt!309727)))

(declare-fun b!198722 () Bool)

(declare-fun res!166356 () Bool)

(assert (=> b!198722 (=> (not res!166356) (not e!136411))))

(assert (=> b!198722 (= res!166356 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!309727))))

(declare-fun b!198723 () Bool)

(declare-fun lt!309725 () (_ BitVec 64))

(assert (=> b!198723 (= e!136411 (bvsle lt!309727 (bvmul lt!309725 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198723 (or (= lt!309725 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!309725 #b0000000000000000000000000000000000000000000000000000000000001000) lt!309725)))))

(assert (=> b!198723 (= lt!309725 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!309602)))))))

(assert (= (and d!67523 res!166357) b!198722))

(assert (= (and b!198722 res!166356) b!198723))

(declare-fun m!307735 () Bool)

(assert (=> d!67523 m!307735))

(declare-fun m!307737 () Bool)

(assert (=> d!67523 m!307737))

(assert (=> b!198632 d!67523))

(declare-fun d!67525 () Bool)

(declare-datatypes ((tuple2!17132 0))(
  ( (tuple2!17133 (_1!9214 Bool) (_2!9214 BitStream!8022)) )
))
(declare-fun lt!309733 () tuple2!17132)

(declare-fun readBit!0 (BitStream!8022) tuple2!17132)

(assert (=> d!67525 (= lt!309733 (readBit!0 lt!309591))))

(assert (=> d!67525 (= (readBitPure!0 lt!309591) (tuple2!17123 (_2!9214 lt!309733) (_1!9214 lt!309733)))))

(declare-fun bs!16707 () Bool)

(assert (= bs!16707 d!67525))

(declare-fun m!307739 () Bool)

(assert (=> bs!16707 m!307739))

(assert (=> b!198632 d!67525))

(declare-fun d!67527 () Bool)

(assert (=> d!67527 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309593)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309597))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309597))) lt!309598) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309593)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309597))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309597)))) lt!309598))))

(declare-fun bs!16708 () Bool)

(assert (= bs!16708 d!67527))

(declare-fun m!307741 () Bool)

(assert (=> bs!16708 m!307741))

(assert (=> b!198632 d!67527))

(declare-datatypes ((tuple2!17134 0))(
  ( (tuple2!17135 (_1!9215 (_ BitVec 64)) (_2!9215 BitStream!8022)) )
))
(declare-fun lt!309736 () tuple2!17134)

(declare-fun d!67529 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8022 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17134)

(assert (=> d!67529 (= lt!309736 (readNBitsLSBFirstsLoop!0 (_1!9207 lt!309604) nBits!348 i!590 lt!309607))))

(assert (=> d!67529 (= (readNBitsLSBFirstsLoopPure!0 (_1!9207 lt!309604) nBits!348 i!590 lt!309607) (tuple2!17121 (_2!9215 lt!309736) (_1!9215 lt!309736)))))

(declare-fun bs!16709 () Bool)

(assert (= bs!16709 d!67529))

(declare-fun m!307743 () Bool)

(assert (=> bs!16709 m!307743))

(assert (=> b!198632 d!67529))

(declare-fun d!67531 () Bool)

(assert (=> d!67531 (validate_offset_bits!1 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309593)))) ((_ sign_extend 32) (currentByte!9296 thiss!1204)) ((_ sign_extend 32) (currentBit!9291 thiss!1204)) lt!309595)))

(declare-fun lt!309739 () Unit!14060)

(declare-fun choose!9 (BitStream!8022 array!10114 (_ BitVec 64) BitStream!8022) Unit!14060)

(assert (=> d!67531 (= lt!309739 (choose!9 thiss!1204 (buf!4949 (_2!9206 lt!309593)) lt!309595 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204))))))

(assert (=> d!67531 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4949 (_2!9206 lt!309593)) lt!309595) lt!309739)))

(declare-fun bs!16710 () Bool)

(assert (= bs!16710 d!67531))

(assert (=> bs!16710 m!307577))

(declare-fun m!307745 () Bool)

(assert (=> bs!16710 m!307745))

(assert (=> b!198632 d!67531))

(declare-fun d!67533 () Bool)

(declare-fun lt!309740 () tuple2!17134)

(assert (=> d!67533 (= lt!309740 (readNBitsLSBFirstsLoop!0 (_1!9207 lt!309590) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!309610))))

(assert (=> d!67533 (= (readNBitsLSBFirstsLoopPure!0 (_1!9207 lt!309590) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!309610) (tuple2!17121 (_2!9215 lt!309740) (_1!9215 lt!309740)))))

(declare-fun bs!16711 () Bool)

(assert (= bs!16711 d!67533))

(declare-fun m!307747 () Bool)

(assert (=> bs!16711 m!307747))

(assert (=> b!198632 d!67533))

(declare-fun b!198734 () Bool)

(declare-fun res!166364 () Bool)

(declare-fun e!136416 () Bool)

(assert (=> b!198734 (=> (not res!166364) (not e!136416))))

(declare-fun lt!309793 () tuple2!17118)

(assert (=> b!198734 (= res!166364 (isPrefixOf!0 (_2!9207 lt!309793) (_2!9206 lt!309593)))))

(declare-fun d!67535 () Bool)

(assert (=> d!67535 e!136416))

(declare-fun res!166365 () Bool)

(assert (=> d!67535 (=> (not res!166365) (not e!136416))))

(assert (=> d!67535 (= res!166365 (isPrefixOf!0 (_1!9207 lt!309793) (_2!9207 lt!309793)))))

(declare-fun lt!309795 () BitStream!8022)

(assert (=> d!67535 (= lt!309793 (tuple2!17119 lt!309795 (_2!9206 lt!309593)))))

(declare-fun lt!309781 () Unit!14060)

(declare-fun lt!309784 () Unit!14060)

(assert (=> d!67535 (= lt!309781 lt!309784)))

(assert (=> d!67535 (isPrefixOf!0 lt!309795 (_2!9206 lt!309593))))

(assert (=> d!67535 (= lt!309784 (lemmaIsPrefixTransitive!0 lt!309795 (_2!9206 lt!309593) (_2!9206 lt!309593)))))

(declare-fun lt!309787 () Unit!14060)

(declare-fun lt!309790 () Unit!14060)

(assert (=> d!67535 (= lt!309787 lt!309790)))

(assert (=> d!67535 (isPrefixOf!0 lt!309795 (_2!9206 lt!309593))))

(assert (=> d!67535 (= lt!309790 (lemmaIsPrefixTransitive!0 lt!309795 thiss!1204 (_2!9206 lt!309593)))))

(declare-fun lt!309792 () Unit!14060)

(declare-fun e!136417 () Unit!14060)

(assert (=> d!67535 (= lt!309792 e!136417)))

(declare-fun c!9892 () Bool)

(assert (=> d!67535 (= c!9892 (not (= (size!4457 (buf!4949 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!309797 () Unit!14060)

(declare-fun lt!309789 () Unit!14060)

(assert (=> d!67535 (= lt!309797 lt!309789)))

(assert (=> d!67535 (isPrefixOf!0 (_2!9206 lt!309593) (_2!9206 lt!309593))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8022) Unit!14060)

(assert (=> d!67535 (= lt!309789 (lemmaIsPrefixRefl!0 (_2!9206 lt!309593)))))

(declare-fun lt!309794 () Unit!14060)

(declare-fun lt!309799 () Unit!14060)

(assert (=> d!67535 (= lt!309794 lt!309799)))

(assert (=> d!67535 (= lt!309799 (lemmaIsPrefixRefl!0 (_2!9206 lt!309593)))))

(declare-fun lt!309791 () Unit!14060)

(declare-fun lt!309786 () Unit!14060)

(assert (=> d!67535 (= lt!309791 lt!309786)))

(assert (=> d!67535 (isPrefixOf!0 lt!309795 lt!309795)))

(assert (=> d!67535 (= lt!309786 (lemmaIsPrefixRefl!0 lt!309795))))

(declare-fun lt!309783 () Unit!14060)

(declare-fun lt!309798 () Unit!14060)

(assert (=> d!67535 (= lt!309783 lt!309798)))

(assert (=> d!67535 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!67535 (= lt!309798 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!67535 (= lt!309795 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)))))

(assert (=> d!67535 (isPrefixOf!0 thiss!1204 (_2!9206 lt!309593))))

(assert (=> d!67535 (= (reader!0 thiss!1204 (_2!9206 lt!309593)) lt!309793)))

(declare-fun lt!309800 () (_ BitVec 64))

(declare-fun lt!309796 () (_ BitVec 64))

(declare-fun b!198735 () Bool)

(assert (=> b!198735 (= e!136416 (= (_1!9207 lt!309793) (withMovedBitIndex!0 (_2!9207 lt!309793) (bvsub lt!309800 lt!309796))))))

(assert (=> b!198735 (or (= (bvand lt!309800 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309796 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!309800 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309800 lt!309796) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198735 (= lt!309796 (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309593))) (currentByte!9296 (_2!9206 lt!309593)) (currentBit!9291 (_2!9206 lt!309593))))))

(assert (=> b!198735 (= lt!309800 (bitIndex!0 (size!4457 (buf!4949 thiss!1204)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)))))

(declare-fun b!198736 () Bool)

(declare-fun res!166366 () Bool)

(assert (=> b!198736 (=> (not res!166366) (not e!136416))))

(assert (=> b!198736 (= res!166366 (isPrefixOf!0 (_1!9207 lt!309793) thiss!1204))))

(declare-fun b!198737 () Bool)

(declare-fun lt!309782 () Unit!14060)

(assert (=> b!198737 (= e!136417 lt!309782)))

(declare-fun lt!309788 () (_ BitVec 64))

(assert (=> b!198737 (= lt!309788 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!309785 () (_ BitVec 64))

(assert (=> b!198737 (= lt!309785 (bitIndex!0 (size!4457 (buf!4949 thiss!1204)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10114 array!10114 (_ BitVec 64) (_ BitVec 64)) Unit!14060)

(assert (=> b!198737 (= lt!309782 (arrayBitRangesEqSymmetric!0 (buf!4949 thiss!1204) (buf!4949 (_2!9206 lt!309593)) lt!309788 lt!309785))))

(declare-fun arrayBitRangesEq!0 (array!10114 array!10114 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!198737 (arrayBitRangesEq!0 (buf!4949 (_2!9206 lt!309593)) (buf!4949 thiss!1204) lt!309788 lt!309785)))

(declare-fun b!198738 () Bool)

(declare-fun Unit!14064 () Unit!14060)

(assert (=> b!198738 (= e!136417 Unit!14064)))

(assert (= (and d!67535 c!9892) b!198737))

(assert (= (and d!67535 (not c!9892)) b!198738))

(assert (= (and d!67535 res!166365) b!198736))

(assert (= (and b!198736 res!166366) b!198734))

(assert (= (and b!198734 res!166364) b!198735))

(declare-fun m!307749 () Bool)

(assert (=> b!198734 m!307749))

(declare-fun m!307751 () Bool)

(assert (=> b!198735 m!307751))

(assert (=> b!198735 m!307635))

(assert (=> b!198735 m!307609))

(assert (=> b!198737 m!307609))

(declare-fun m!307753 () Bool)

(assert (=> b!198737 m!307753))

(declare-fun m!307755 () Bool)

(assert (=> b!198737 m!307755))

(declare-fun m!307757 () Bool)

(assert (=> d!67535 m!307757))

(declare-fun m!307759 () Bool)

(assert (=> d!67535 m!307759))

(declare-fun m!307761 () Bool)

(assert (=> d!67535 m!307761))

(declare-fun m!307763 () Bool)

(assert (=> d!67535 m!307763))

(declare-fun m!307765 () Bool)

(assert (=> d!67535 m!307765))

(assert (=> d!67535 m!307637))

(declare-fun m!307767 () Bool)

(assert (=> d!67535 m!307767))

(declare-fun m!307769 () Bool)

(assert (=> d!67535 m!307769))

(declare-fun m!307771 () Bool)

(assert (=> d!67535 m!307771))

(declare-fun m!307773 () Bool)

(assert (=> d!67535 m!307773))

(declare-fun m!307775 () Bool)

(assert (=> d!67535 m!307775))

(declare-fun m!307777 () Bool)

(assert (=> b!198736 m!307777))

(assert (=> b!198632 d!67535))

(declare-fun d!67537 () Bool)

(declare-fun lt!309801 () tuple2!17132)

(assert (=> d!67537 (= lt!309801 (readBit!0 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204))))))

(assert (=> d!67537 (= (readBitPure!0 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204))) (tuple2!17123 (_2!9214 lt!309801) (_1!9214 lt!309801)))))

(declare-fun bs!16712 () Bool)

(assert (= bs!16712 d!67537))

(declare-fun m!307779 () Bool)

(assert (=> bs!16712 m!307779))

(assert (=> b!198632 d!67537))

(declare-fun d!67539 () Bool)

(assert (=> d!67539 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309593)))) ((_ sign_extend 32) (currentByte!9296 thiss!1204)) ((_ sign_extend 32) (currentBit!9291 thiss!1204)) lt!309595) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309593)))) ((_ sign_extend 32) (currentByte!9296 thiss!1204)) ((_ sign_extend 32) (currentBit!9291 thiss!1204))) lt!309595))))

(declare-fun bs!16713 () Bool)

(assert (= bs!16713 d!67539))

(declare-fun m!307781 () Bool)

(assert (=> bs!16713 m!307781))

(assert (=> b!198632 d!67539))

(declare-fun d!67541 () Bool)

(assert (=> d!67541 (= (invariant!0 (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204) (size!4457 (buf!4949 (_2!9206 lt!309597)))) (and (bvsge (currentBit!9291 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9291 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9296 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9296 thiss!1204) (size!4457 (buf!4949 (_2!9206 lt!309597)))) (and (= (currentBit!9291 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9296 thiss!1204) (size!4457 (buf!4949 (_2!9206 lt!309597))))))))))

(assert (=> b!198632 d!67541))

(declare-fun d!67543 () Bool)

(declare-fun e!136418 () Bool)

(assert (=> d!67543 e!136418))

(declare-fun res!166368 () Bool)

(assert (=> d!67543 (=> (not res!166368) (not e!136418))))

(declare-fun lt!309804 () (_ BitVec 64))

(declare-fun lt!309806 () (_ BitVec 64))

(declare-fun lt!309805 () (_ BitVec 64))

(assert (=> d!67543 (= res!166368 (= lt!309804 (bvsub lt!309805 lt!309806)))))

(assert (=> d!67543 (or (= (bvand lt!309805 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309806 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!309805 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309805 lt!309806) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67543 (= lt!309806 (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!309603)))) ((_ sign_extend 32) (currentByte!9296 (_1!9209 lt!309603))) ((_ sign_extend 32) (currentBit!9291 (_1!9209 lt!309603)))))))

(declare-fun lt!309803 () (_ BitVec 64))

(declare-fun lt!309807 () (_ BitVec 64))

(assert (=> d!67543 (= lt!309805 (bvmul lt!309803 lt!309807))))

(assert (=> d!67543 (or (= lt!309803 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!309807 (bvsdiv (bvmul lt!309803 lt!309807) lt!309803)))))

(assert (=> d!67543 (= lt!309807 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67543 (= lt!309803 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!309603)))))))

(assert (=> d!67543 (= lt!309804 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 (_1!9209 lt!309603))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 (_1!9209 lt!309603)))))))

(assert (=> d!67543 (invariant!0 (currentBit!9291 (_1!9209 lt!309603)) (currentByte!9296 (_1!9209 lt!309603)) (size!4457 (buf!4949 (_1!9209 lt!309603))))))

(assert (=> d!67543 (= (bitIndex!0 (size!4457 (buf!4949 (_1!9209 lt!309603))) (currentByte!9296 (_1!9209 lt!309603)) (currentBit!9291 (_1!9209 lt!309603))) lt!309804)))

(declare-fun b!198739 () Bool)

(declare-fun res!166367 () Bool)

(assert (=> b!198739 (=> (not res!166367) (not e!136418))))

(assert (=> b!198739 (= res!166367 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!309804))))

(declare-fun b!198740 () Bool)

(declare-fun lt!309802 () (_ BitVec 64))

(assert (=> b!198740 (= e!136418 (bvsle lt!309804 (bvmul lt!309802 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198740 (or (= lt!309802 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!309802 #b0000000000000000000000000000000000000000000000000000000000001000) lt!309802)))))

(assert (=> b!198740 (= lt!309802 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!309603)))))))

(assert (= (and d!67543 res!166368) b!198739))

(assert (= (and b!198739 res!166367) b!198740))

(declare-fun m!307783 () Bool)

(assert (=> d!67543 m!307783))

(declare-fun m!307785 () Bool)

(assert (=> d!67543 m!307785))

(assert (=> b!198632 d!67543))

(declare-fun b!198741 () Bool)

(declare-fun res!166369 () Bool)

(declare-fun e!136419 () Bool)

(assert (=> b!198741 (=> (not res!166369) (not e!136419))))

(declare-fun lt!309820 () tuple2!17118)

(assert (=> b!198741 (= res!166369 (isPrefixOf!0 (_2!9207 lt!309820) (_2!9206 lt!309593)))))

(declare-fun d!67545 () Bool)

(assert (=> d!67545 e!136419))

(declare-fun res!166370 () Bool)

(assert (=> d!67545 (=> (not res!166370) (not e!136419))))

(assert (=> d!67545 (= res!166370 (isPrefixOf!0 (_1!9207 lt!309820) (_2!9207 lt!309820)))))

(declare-fun lt!309822 () BitStream!8022)

(assert (=> d!67545 (= lt!309820 (tuple2!17119 lt!309822 (_2!9206 lt!309593)))))

(declare-fun lt!309808 () Unit!14060)

(declare-fun lt!309811 () Unit!14060)

(assert (=> d!67545 (= lt!309808 lt!309811)))

(assert (=> d!67545 (isPrefixOf!0 lt!309822 (_2!9206 lt!309593))))

(assert (=> d!67545 (= lt!309811 (lemmaIsPrefixTransitive!0 lt!309822 (_2!9206 lt!309593) (_2!9206 lt!309593)))))

(declare-fun lt!309814 () Unit!14060)

(declare-fun lt!309817 () Unit!14060)

(assert (=> d!67545 (= lt!309814 lt!309817)))

(assert (=> d!67545 (isPrefixOf!0 lt!309822 (_2!9206 lt!309593))))

(assert (=> d!67545 (= lt!309817 (lemmaIsPrefixTransitive!0 lt!309822 (_2!9206 lt!309597) (_2!9206 lt!309593)))))

(declare-fun lt!309819 () Unit!14060)

(declare-fun e!136420 () Unit!14060)

(assert (=> d!67545 (= lt!309819 e!136420)))

(declare-fun c!9893 () Bool)

(assert (=> d!67545 (= c!9893 (not (= (size!4457 (buf!4949 (_2!9206 lt!309597))) #b00000000000000000000000000000000)))))

(declare-fun lt!309824 () Unit!14060)

(declare-fun lt!309816 () Unit!14060)

(assert (=> d!67545 (= lt!309824 lt!309816)))

(assert (=> d!67545 (isPrefixOf!0 (_2!9206 lt!309593) (_2!9206 lt!309593))))

(assert (=> d!67545 (= lt!309816 (lemmaIsPrefixRefl!0 (_2!9206 lt!309593)))))

(declare-fun lt!309821 () Unit!14060)

(declare-fun lt!309826 () Unit!14060)

(assert (=> d!67545 (= lt!309821 lt!309826)))

(assert (=> d!67545 (= lt!309826 (lemmaIsPrefixRefl!0 (_2!9206 lt!309593)))))

(declare-fun lt!309818 () Unit!14060)

(declare-fun lt!309813 () Unit!14060)

(assert (=> d!67545 (= lt!309818 lt!309813)))

(assert (=> d!67545 (isPrefixOf!0 lt!309822 lt!309822)))

(assert (=> d!67545 (= lt!309813 (lemmaIsPrefixRefl!0 lt!309822))))

(declare-fun lt!309810 () Unit!14060)

(declare-fun lt!309825 () Unit!14060)

(assert (=> d!67545 (= lt!309810 lt!309825)))

(assert (=> d!67545 (isPrefixOf!0 (_2!9206 lt!309597) (_2!9206 lt!309597))))

(assert (=> d!67545 (= lt!309825 (lemmaIsPrefixRefl!0 (_2!9206 lt!309597)))))

(assert (=> d!67545 (= lt!309822 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))))))

(assert (=> d!67545 (isPrefixOf!0 (_2!9206 lt!309597) (_2!9206 lt!309593))))

(assert (=> d!67545 (= (reader!0 (_2!9206 lt!309597) (_2!9206 lt!309593)) lt!309820)))

(declare-fun lt!309823 () (_ BitVec 64))

(declare-fun b!198742 () Bool)

(declare-fun lt!309827 () (_ BitVec 64))

(assert (=> b!198742 (= e!136419 (= (_1!9207 lt!309820) (withMovedBitIndex!0 (_2!9207 lt!309820) (bvsub lt!309827 lt!309823))))))

(assert (=> b!198742 (or (= (bvand lt!309827 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309823 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!309827 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309827 lt!309823) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198742 (= lt!309823 (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309593))) (currentByte!9296 (_2!9206 lt!309593)) (currentBit!9291 (_2!9206 lt!309593))))))

(assert (=> b!198742 (= lt!309827 (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))))))

(declare-fun b!198743 () Bool)

(declare-fun res!166371 () Bool)

(assert (=> b!198743 (=> (not res!166371) (not e!136419))))

(assert (=> b!198743 (= res!166371 (isPrefixOf!0 (_1!9207 lt!309820) (_2!9206 lt!309597)))))

(declare-fun b!198744 () Bool)

(declare-fun lt!309809 () Unit!14060)

(assert (=> b!198744 (= e!136420 lt!309809)))

(declare-fun lt!309815 () (_ BitVec 64))

(assert (=> b!198744 (= lt!309815 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!309812 () (_ BitVec 64))

(assert (=> b!198744 (= lt!309812 (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))))))

(assert (=> b!198744 (= lt!309809 (arrayBitRangesEqSymmetric!0 (buf!4949 (_2!9206 lt!309597)) (buf!4949 (_2!9206 lt!309593)) lt!309815 lt!309812))))

(assert (=> b!198744 (arrayBitRangesEq!0 (buf!4949 (_2!9206 lt!309593)) (buf!4949 (_2!9206 lt!309597)) lt!309815 lt!309812)))

(declare-fun b!198745 () Bool)

(declare-fun Unit!14065 () Unit!14060)

(assert (=> b!198745 (= e!136420 Unit!14065)))

(assert (= (and d!67545 c!9893) b!198744))

(assert (= (and d!67545 (not c!9893)) b!198745))

(assert (= (and d!67545 res!166370) b!198743))

(assert (= (and b!198743 res!166371) b!198741))

(assert (= (and b!198741 res!166369) b!198742))

(declare-fun m!307787 () Bool)

(assert (=> b!198741 m!307787))

(declare-fun m!307789 () Bool)

(assert (=> b!198742 m!307789))

(assert (=> b!198742 m!307635))

(assert (=> b!198742 m!307607))

(assert (=> b!198744 m!307607))

(declare-fun m!307791 () Bool)

(assert (=> b!198744 m!307791))

(declare-fun m!307793 () Bool)

(assert (=> b!198744 m!307793))

(declare-fun m!307795 () Bool)

(assert (=> d!67545 m!307795))

(declare-fun m!307797 () Bool)

(assert (=> d!67545 m!307797))

(declare-fun m!307799 () Bool)

(assert (=> d!67545 m!307799))

(declare-fun m!307801 () Bool)

(assert (=> d!67545 m!307801))

(declare-fun m!307803 () Bool)

(assert (=> d!67545 m!307803))

(assert (=> d!67545 m!307627))

(declare-fun m!307805 () Bool)

(assert (=> d!67545 m!307805))

(assert (=> d!67545 m!307769))

(declare-fun m!307807 () Bool)

(assert (=> d!67545 m!307807))

(assert (=> d!67545 m!307773))

(declare-fun m!307809 () Bool)

(assert (=> d!67545 m!307809))

(declare-fun m!307811 () Bool)

(assert (=> b!198743 m!307811))

(assert (=> b!198632 d!67545))

(declare-fun d!67547 () Bool)

(assert (=> d!67547 (validate_offset_bits!1 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309593)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309597))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309597))) lt!309598)))

(declare-fun lt!309828 () Unit!14060)

(assert (=> d!67547 (= lt!309828 (choose!9 (_2!9206 lt!309597) (buf!4949 (_2!9206 lt!309593)) lt!309598 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597)))))))

(assert (=> d!67547 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9206 lt!309597) (buf!4949 (_2!9206 lt!309593)) lt!309598) lt!309828)))

(declare-fun bs!16714 () Bool)

(assert (= bs!16714 d!67547))

(assert (=> bs!16714 m!307585))

(declare-fun m!307813 () Bool)

(assert (=> bs!16714 m!307813))

(assert (=> b!198632 d!67547))

(declare-fun d!67549 () Bool)

(declare-fun lt!309829 () tuple2!17132)

(assert (=> d!67549 (= lt!309829 (readBit!0 (_1!9207 lt!309604)))))

(assert (=> d!67549 (= (readBitPure!0 (_1!9207 lt!309604)) (tuple2!17123 (_2!9214 lt!309829) (_1!9214 lt!309829)))))

(declare-fun bs!16715 () Bool)

(assert (= bs!16715 d!67549))

(declare-fun m!307815 () Bool)

(assert (=> bs!16715 m!307815))

(assert (=> b!198632 d!67549))

(declare-fun d!67551 () Bool)

(declare-fun e!136423 () Bool)

(assert (=> d!67551 e!136423))

(declare-fun res!166374 () Bool)

(assert (=> d!67551 (=> (not res!166374) (not e!136423))))

(declare-fun lt!309840 () tuple2!17122)

(declare-fun lt!309838 () tuple2!17122)

(assert (=> d!67551 (= res!166374 (= (bitIndex!0 (size!4457 (buf!4949 (_1!9209 lt!309840))) (currentByte!9296 (_1!9209 lt!309840)) (currentBit!9291 (_1!9209 lt!309840))) (bitIndex!0 (size!4457 (buf!4949 (_1!9209 lt!309838))) (currentByte!9296 (_1!9209 lt!309838)) (currentBit!9291 (_1!9209 lt!309838)))))))

(declare-fun lt!309841 () BitStream!8022)

(declare-fun lt!309839 () Unit!14060)

(declare-fun choose!50 (BitStream!8022 BitStream!8022 BitStream!8022 tuple2!17122 tuple2!17122 BitStream!8022 Bool tuple2!17122 tuple2!17122 BitStream!8022 Bool) Unit!14060)

(assert (=> d!67551 (= lt!309839 (choose!50 lt!309591 (_2!9206 lt!309593) lt!309841 lt!309840 (tuple2!17123 (_1!9209 lt!309840) (_2!9209 lt!309840)) (_1!9209 lt!309840) (_2!9209 lt!309840) lt!309838 (tuple2!17123 (_1!9209 lt!309838) (_2!9209 lt!309838)) (_1!9209 lt!309838) (_2!9209 lt!309838)))))

(assert (=> d!67551 (= lt!309838 (readBitPure!0 lt!309841))))

(assert (=> d!67551 (= lt!309840 (readBitPure!0 lt!309591))))

(assert (=> d!67551 (= lt!309841 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 lt!309591) (currentBit!9291 lt!309591)))))

(assert (=> d!67551 (invariant!0 (currentBit!9291 lt!309591) (currentByte!9296 lt!309591) (size!4457 (buf!4949 (_2!9206 lt!309593))))))

(assert (=> d!67551 (= (readBitPrefixLemma!0 lt!309591 (_2!9206 lt!309593)) lt!309839)))

(declare-fun b!198748 () Bool)

(assert (=> b!198748 (= e!136423 (= (_2!9209 lt!309840) (_2!9209 lt!309838)))))

(assert (= (and d!67551 res!166374) b!198748))

(declare-fun m!307817 () Bool)

(assert (=> d!67551 m!307817))

(declare-fun m!307819 () Bool)

(assert (=> d!67551 m!307819))

(declare-fun m!307821 () Bool)

(assert (=> d!67551 m!307821))

(declare-fun m!307823 () Bool)

(assert (=> d!67551 m!307823))

(assert (=> d!67551 m!307601))

(declare-fun m!307825 () Bool)

(assert (=> d!67551 m!307825))

(assert (=> b!198632 d!67551))

(declare-fun d!67553 () Bool)

(declare-fun e!136426 () Bool)

(assert (=> d!67553 e!136426))

(declare-fun res!166377 () Bool)

(assert (=> d!67553 (=> (not res!166377) (not e!136426))))

(declare-fun lt!309846 () BitStream!8022)

(declare-fun lt!309847 () (_ BitVec 64))

(assert (=> d!67553 (= res!166377 (= (bvadd lt!309847 (bvsub lt!309614 lt!309606)) (bitIndex!0 (size!4457 (buf!4949 lt!309846)) (currentByte!9296 lt!309846) (currentBit!9291 lt!309846))))))

(assert (=> d!67553 (or (not (= (bvand lt!309847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309614 lt!309606) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!309847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!309847 (bvsub lt!309614 lt!309606)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67553 (= lt!309847 (bitIndex!0 (size!4457 (buf!4949 (_2!9207 lt!309590))) (currentByte!9296 (_2!9207 lt!309590)) (currentBit!9291 (_2!9207 lt!309590))))))

(declare-fun moveBitIndex!0 (BitStream!8022 (_ BitVec 64)) tuple2!17116)

(assert (=> d!67553 (= lt!309846 (_2!9206 (moveBitIndex!0 (_2!9207 lt!309590) (bvsub lt!309614 lt!309606))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8022 (_ BitVec 64)) Bool)

(assert (=> d!67553 (moveBitIndexPrecond!0 (_2!9207 lt!309590) (bvsub lt!309614 lt!309606))))

(assert (=> d!67553 (= (withMovedBitIndex!0 (_2!9207 lt!309590) (bvsub lt!309614 lt!309606)) lt!309846)))

(declare-fun b!198751 () Bool)

(assert (=> b!198751 (= e!136426 (= (size!4457 (buf!4949 (_2!9207 lt!309590))) (size!4457 (buf!4949 lt!309846))))))

(assert (= (and d!67553 res!166377) b!198751))

(declare-fun m!307827 () Bool)

(assert (=> d!67553 m!307827))

(declare-fun m!307829 () Bool)

(assert (=> d!67553 m!307829))

(declare-fun m!307831 () Bool)

(assert (=> d!67553 m!307831))

(declare-fun m!307833 () Bool)

(assert (=> d!67553 m!307833))

(assert (=> b!198633 d!67553))

(declare-fun d!67555 () Bool)

(declare-fun res!166384 () Bool)

(declare-fun e!136432 () Bool)

(assert (=> d!67555 (=> (not res!166384) (not e!136432))))

(assert (=> d!67555 (= res!166384 (= (size!4457 (buf!4949 thiss!1204)) (size!4457 (buf!4949 (_2!9206 lt!309597)))))))

(assert (=> d!67555 (= (isPrefixOf!0 thiss!1204 (_2!9206 lt!309597)) e!136432)))

(declare-fun b!198758 () Bool)

(declare-fun res!166386 () Bool)

(assert (=> b!198758 (=> (not res!166386) (not e!136432))))

(assert (=> b!198758 (= res!166386 (bvsle (bitIndex!0 (size!4457 (buf!4949 thiss!1204)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597)))))))

(declare-fun b!198759 () Bool)

(declare-fun e!136431 () Bool)

(assert (=> b!198759 (= e!136432 e!136431)))

(declare-fun res!166385 () Bool)

(assert (=> b!198759 (=> res!166385 e!136431)))

(assert (=> b!198759 (= res!166385 (= (size!4457 (buf!4949 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!198760 () Bool)

(assert (=> b!198760 (= e!136431 (arrayBitRangesEq!0 (buf!4949 thiss!1204) (buf!4949 (_2!9206 lt!309597)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4457 (buf!4949 thiss!1204)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204))))))

(assert (= (and d!67555 res!166384) b!198758))

(assert (= (and b!198758 res!166386) b!198759))

(assert (= (and b!198759 (not res!166385)) b!198760))

(assert (=> b!198758 m!307609))

(assert (=> b!198758 m!307607))

(assert (=> b!198760 m!307609))

(assert (=> b!198760 m!307609))

(declare-fun m!307835 () Bool)

(assert (=> b!198760 m!307835))

(assert (=> b!198631 d!67555))

(declare-fun d!67557 () Bool)

(declare-fun e!136433 () Bool)

(assert (=> d!67557 e!136433))

(declare-fun res!166387 () Bool)

(assert (=> d!67557 (=> (not res!166387) (not e!136433))))

(declare-fun lt!309849 () (_ BitVec 64))

(declare-fun lt!309848 () BitStream!8022)

(assert (=> d!67557 (= res!166387 (= (bvadd lt!309849 (bvsub lt!309611 lt!309606)) (bitIndex!0 (size!4457 (buf!4949 lt!309848)) (currentByte!9296 lt!309848) (currentBit!9291 lt!309848))))))

(assert (=> d!67557 (or (not (= (bvand lt!309849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309611 lt!309606) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!309849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!309849 (bvsub lt!309611 lt!309606)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67557 (= lt!309849 (bitIndex!0 (size!4457 (buf!4949 (_2!9207 lt!309604))) (currentByte!9296 (_2!9207 lt!309604)) (currentBit!9291 (_2!9207 lt!309604))))))

(assert (=> d!67557 (= lt!309848 (_2!9206 (moveBitIndex!0 (_2!9207 lt!309604) (bvsub lt!309611 lt!309606))))))

(assert (=> d!67557 (moveBitIndexPrecond!0 (_2!9207 lt!309604) (bvsub lt!309611 lt!309606))))

(assert (=> d!67557 (= (withMovedBitIndex!0 (_2!9207 lt!309604) (bvsub lt!309611 lt!309606)) lt!309848)))

(declare-fun b!198761 () Bool)

(assert (=> b!198761 (= e!136433 (= (size!4457 (buf!4949 (_2!9207 lt!309604))) (size!4457 (buf!4949 lt!309848))))))

(assert (= (and d!67557 res!166387) b!198761))

(declare-fun m!307837 () Bool)

(assert (=> d!67557 m!307837))

(declare-fun m!307839 () Bool)

(assert (=> d!67557 m!307839))

(declare-fun m!307841 () Bool)

(assert (=> d!67557 m!307841))

(declare-fun m!307843 () Bool)

(assert (=> d!67557 m!307843))

(assert (=> b!198635 d!67557))

(declare-fun d!67559 () Bool)

(assert (=> d!67559 (= (array_inv!4198 (buf!4949 thiss!1204)) (bvsge (size!4457 (buf!4949 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!198646 d!67559))

(declare-fun d!67561 () Bool)

(assert (=> d!67561 (= (invariant!0 (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204) (size!4457 (buf!4949 (_2!9206 lt!309593)))) (and (bvsge (currentBit!9291 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9291 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9296 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9296 thiss!1204) (size!4457 (buf!4949 (_2!9206 lt!309593)))) (and (= (currentBit!9291 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9296 thiss!1204) (size!4457 (buf!4949 (_2!9206 lt!309593))))))))))

(assert (=> b!198644 d!67561))

(assert (=> b!198645 d!67517))

(assert (=> b!198645 d!67519))

(declare-fun b!198771 () Bool)

(declare-fun res!166399 () Bool)

(declare-fun e!136438 () Bool)

(assert (=> b!198771 (=> (not res!166399) (not e!136438))))

(declare-fun lt!309861 () (_ BitVec 64))

(declare-fun lt!309860 () (_ BitVec 64))

(declare-fun lt!309859 () tuple2!17116)

(assert (=> b!198771 (= res!166399 (= (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309859))) (currentByte!9296 (_2!9206 lt!309859)) (currentBit!9291 (_2!9206 lt!309859))) (bvadd lt!309860 lt!309861)))))

(assert (=> b!198771 (or (not (= (bvand lt!309860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309861 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!309860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!309860 lt!309861) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198771 (= lt!309861 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!198771 (= lt!309860 (bitIndex!0 (size!4457 (buf!4949 thiss!1204)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)))))

(declare-fun b!198772 () Bool)

(declare-fun res!166396 () Bool)

(assert (=> b!198772 (=> (not res!166396) (not e!136438))))

(assert (=> b!198772 (= res!166396 (isPrefixOf!0 thiss!1204 (_2!9206 lt!309859)))))

(declare-fun b!198773 () Bool)

(declare-fun e!136439 () Bool)

(assert (=> b!198773 (= e!136438 e!136439)))

(declare-fun res!166397 () Bool)

(assert (=> b!198773 (=> (not res!166397) (not e!136439))))

(declare-fun lt!309858 () tuple2!17122)

(assert (=> b!198773 (= res!166397 (and (= (_2!9209 lt!309858) lt!309601) (= (_1!9209 lt!309858) (_2!9206 lt!309859))))))

(assert (=> b!198773 (= lt!309858 (readBitPure!0 (readerFrom!0 (_2!9206 lt!309859) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204))))))

(declare-fun d!67563 () Bool)

(assert (=> d!67563 e!136438))

(declare-fun res!166398 () Bool)

(assert (=> d!67563 (=> (not res!166398) (not e!136438))))

(assert (=> d!67563 (= res!166398 (= (size!4457 (buf!4949 thiss!1204)) (size!4457 (buf!4949 (_2!9206 lt!309859)))))))

(declare-fun choose!16 (BitStream!8022 Bool) tuple2!17116)

(assert (=> d!67563 (= lt!309859 (choose!16 thiss!1204 lt!309601))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!67563 (validate_offset_bit!0 ((_ sign_extend 32) (size!4457 (buf!4949 thiss!1204))) ((_ sign_extend 32) (currentByte!9296 thiss!1204)) ((_ sign_extend 32) (currentBit!9291 thiss!1204)))))

(assert (=> d!67563 (= (appendBit!0 thiss!1204 lt!309601) lt!309859)))

(declare-fun b!198774 () Bool)

(assert (=> b!198774 (= e!136439 (= (bitIndex!0 (size!4457 (buf!4949 (_1!9209 lt!309858))) (currentByte!9296 (_1!9209 lt!309858)) (currentBit!9291 (_1!9209 lt!309858))) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309859))) (currentByte!9296 (_2!9206 lt!309859)) (currentBit!9291 (_2!9206 lt!309859)))))))

(assert (= (and d!67563 res!166398) b!198771))

(assert (= (and b!198771 res!166399) b!198772))

(assert (= (and b!198772 res!166396) b!198773))

(assert (= (and b!198773 res!166397) b!198774))

(declare-fun m!307845 () Bool)

(assert (=> b!198773 m!307845))

(assert (=> b!198773 m!307845))

(declare-fun m!307847 () Bool)

(assert (=> b!198773 m!307847))

(declare-fun m!307849 () Bool)

(assert (=> b!198771 m!307849))

(assert (=> b!198771 m!307609))

(declare-fun m!307851 () Bool)

(assert (=> d!67563 m!307851))

(declare-fun m!307853 () Bool)

(assert (=> d!67563 m!307853))

(declare-fun m!307855 () Bool)

(assert (=> b!198774 m!307855))

(assert (=> b!198774 m!307849))

(declare-fun m!307857 () Bool)

(assert (=> b!198772 m!307857))

(assert (=> b!198645 d!67563))

(declare-fun d!67565 () Bool)

(declare-fun lt!309862 () tuple2!17132)

(assert (=> d!67565 (= lt!309862 (readBit!0 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204))))))

(assert (=> d!67565 (= (readBitPure!0 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204))) (tuple2!17123 (_2!9214 lt!309862) (_1!9214 lt!309862)))))

(declare-fun bs!16716 () Bool)

(assert (= bs!16716 d!67565))

(assert (=> bs!16716 m!307643))

(declare-fun m!307859 () Bool)

(assert (=> bs!16716 m!307859))

(assert (=> b!198648 d!67565))

(declare-fun d!67567 () Bool)

(declare-fun e!136442 () Bool)

(assert (=> d!67567 e!136442))

(declare-fun res!166403 () Bool)

(assert (=> d!67567 (=> (not res!166403) (not e!136442))))

(assert (=> d!67567 (= res!166403 (invariant!0 (currentBit!9291 (_2!9206 lt!309597)) (currentByte!9296 (_2!9206 lt!309597)) (size!4457 (buf!4949 (_2!9206 lt!309597)))))))

(assert (=> d!67567 (= (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204)) (BitStream!8023 (buf!4949 (_2!9206 lt!309597)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)))))

(declare-fun b!198777 () Bool)

(assert (=> b!198777 (= e!136442 (invariant!0 (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204) (size!4457 (buf!4949 (_2!9206 lt!309597)))))))

(assert (= (and d!67567 res!166403) b!198777))

(assert (=> d!67567 m!307731))

(assert (=> b!198777 m!307595))

(assert (=> b!198648 d!67567))

(declare-fun d!67569 () Bool)

(declare-fun lt!309875 () tuple2!17120)

(declare-fun lt!309878 () tuple2!17120)

(assert (=> d!67569 (and (= (_2!9208 lt!309875) (_2!9208 lt!309878)) (= (_1!9208 lt!309875) (_1!9208 lt!309878)))))

(declare-fun lt!309876 () Unit!14060)

(declare-fun lt!309880 () Bool)

(declare-fun lt!309879 () BitStream!8022)

(declare-fun lt!309877 () (_ BitVec 64))

(declare-fun choose!56 (BitStream!8022 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!17120 tuple2!17120 BitStream!8022 (_ BitVec 64) Bool BitStream!8022 (_ BitVec 64) tuple2!17120 tuple2!17120 BitStream!8022 (_ BitVec 64)) Unit!14060)

(assert (=> d!67569 (= lt!309876 (choose!56 (_1!9207 lt!309604) nBits!348 i!590 lt!309607 lt!309875 (tuple2!17121 (_1!9208 lt!309875) (_2!9208 lt!309875)) (_1!9208 lt!309875) (_2!9208 lt!309875) lt!309880 lt!309879 lt!309877 lt!309878 (tuple2!17121 (_1!9208 lt!309878) (_2!9208 lt!309878)) (_1!9208 lt!309878) (_2!9208 lt!309878)))))

(assert (=> d!67569 (= lt!309878 (readNBitsLSBFirstsLoopPure!0 lt!309879 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!309877))))

(assert (=> d!67569 (= lt!309877 (bvor lt!309607 (ite lt!309880 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67569 (= lt!309879 (withMovedBitIndex!0 (_1!9207 lt!309604) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!67569 (= lt!309880 (_2!9209 (readBitPure!0 (_1!9207 lt!309604))))))

(assert (=> d!67569 (= lt!309875 (readNBitsLSBFirstsLoopPure!0 (_1!9207 lt!309604) nBits!348 i!590 lt!309607))))

(assert (=> d!67569 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9207 lt!309604) nBits!348 i!590 lt!309607) lt!309876)))

(declare-fun bs!16718 () Bool)

(assert (= bs!16718 d!67569))

(declare-fun m!307861 () Bool)

(assert (=> bs!16718 m!307861))

(assert (=> bs!16718 m!307599))

(declare-fun m!307863 () Bool)

(assert (=> bs!16718 m!307863))

(assert (=> bs!16718 m!307625))

(assert (=> bs!16718 m!307583))

(assert (=> b!198638 d!67569))

(declare-fun lt!309881 () tuple2!17134)

(declare-fun d!67571 () Bool)

(assert (=> d!67571 (= lt!309881 (readNBitsLSBFirstsLoop!0 lt!309608 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!309610))))

(assert (=> d!67571 (= (readNBitsLSBFirstsLoopPure!0 lt!309608 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!309610) (tuple2!17121 (_2!9215 lt!309881) (_1!9215 lt!309881)))))

(declare-fun bs!16719 () Bool)

(assert (= bs!16719 d!67571))

(declare-fun m!307865 () Bool)

(assert (=> bs!16719 m!307865))

(assert (=> b!198638 d!67571))

(declare-fun d!67573 () Bool)

(declare-fun e!136443 () Bool)

(assert (=> d!67573 e!136443))

(declare-fun res!166404 () Bool)

(assert (=> d!67573 (=> (not res!166404) (not e!136443))))

(declare-fun lt!309883 () (_ BitVec 64))

(declare-fun lt!309882 () BitStream!8022)

(assert (=> d!67573 (= res!166404 (= (bvadd lt!309883 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4457 (buf!4949 lt!309882)) (currentByte!9296 lt!309882) (currentBit!9291 lt!309882))))))

(assert (=> d!67573 (or (not (= (bvand lt!309883 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!309883 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!309883 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67573 (= lt!309883 (bitIndex!0 (size!4457 (buf!4949 (_1!9207 lt!309604))) (currentByte!9296 (_1!9207 lt!309604)) (currentBit!9291 (_1!9207 lt!309604))))))

(assert (=> d!67573 (= lt!309882 (_2!9206 (moveBitIndex!0 (_1!9207 lt!309604) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!67573 (moveBitIndexPrecond!0 (_1!9207 lt!309604) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!67573 (= (withMovedBitIndex!0 (_1!9207 lt!309604) #b0000000000000000000000000000000000000000000000000000000000000001) lt!309882)))

(declare-fun b!198778 () Bool)

(assert (=> b!198778 (= e!136443 (= (size!4457 (buf!4949 (_1!9207 lt!309604))) (size!4457 (buf!4949 lt!309882))))))

(assert (= (and d!67573 res!166404) b!198778))

(declare-fun m!307867 () Bool)

(assert (=> d!67573 m!307867))

(declare-fun m!307869 () Bool)

(assert (=> d!67573 m!307869))

(declare-fun m!307871 () Bool)

(assert (=> d!67573 m!307871))

(declare-fun m!307873 () Bool)

(assert (=> d!67573 m!307873))

(assert (=> b!198638 d!67573))

(declare-fun d!67575 () Bool)

(declare-fun e!136444 () Bool)

(assert (=> d!67575 e!136444))

(declare-fun res!166406 () Bool)

(assert (=> d!67575 (=> (not res!166406) (not e!136444))))

(declare-fun lt!309887 () (_ BitVec 64))

(declare-fun lt!309888 () (_ BitVec 64))

(declare-fun lt!309886 () (_ BitVec 64))

(assert (=> d!67575 (= res!166406 (= lt!309886 (bvsub lt!309887 lt!309888)))))

(assert (=> d!67575 (or (= (bvand lt!309887 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309888 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!309887 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309887 lt!309888) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67575 (= lt!309888 (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309593)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309593))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309593)))))))

(declare-fun lt!309885 () (_ BitVec 64))

(declare-fun lt!309889 () (_ BitVec 64))

(assert (=> d!67575 (= lt!309887 (bvmul lt!309885 lt!309889))))

(assert (=> d!67575 (or (= lt!309885 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!309889 (bvsdiv (bvmul lt!309885 lt!309889) lt!309885)))))

(assert (=> d!67575 (= lt!309889 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67575 (= lt!309885 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309593)))))))

(assert (=> d!67575 (= lt!309886 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309593))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309593)))))))

(assert (=> d!67575 (invariant!0 (currentBit!9291 (_2!9206 lt!309593)) (currentByte!9296 (_2!9206 lt!309593)) (size!4457 (buf!4949 (_2!9206 lt!309593))))))

(assert (=> d!67575 (= (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309593))) (currentByte!9296 (_2!9206 lt!309593)) (currentBit!9291 (_2!9206 lt!309593))) lt!309886)))

(declare-fun b!198779 () Bool)

(declare-fun res!166405 () Bool)

(assert (=> b!198779 (=> (not res!166405) (not e!136444))))

(assert (=> b!198779 (= res!166405 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!309886))))

(declare-fun b!198780 () Bool)

(declare-fun lt!309884 () (_ BitVec 64))

(assert (=> b!198780 (= e!136444 (bvsle lt!309886 (bvmul lt!309884 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198780 (or (= lt!309884 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!309884 #b0000000000000000000000000000000000000000000000000000000000001000) lt!309884)))))

(assert (=> b!198780 (= lt!309884 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309593)))))))

(assert (= (and d!67575 res!166406) b!198779))

(assert (= (and b!198779 res!166405) b!198780))

(declare-fun m!307875 () Bool)

(assert (=> d!67575 m!307875))

(assert (=> d!67575 m!307617))

(assert (=> b!198647 d!67575))

(declare-fun d!67577 () Bool)

(declare-fun res!166407 () Bool)

(declare-fun e!136446 () Bool)

(assert (=> d!67577 (=> (not res!166407) (not e!136446))))

(assert (=> d!67577 (= res!166407 (= (size!4457 (buf!4949 thiss!1204)) (size!4457 (buf!4949 (_2!9206 lt!309593)))))))

(assert (=> d!67577 (= (isPrefixOf!0 thiss!1204 (_2!9206 lt!309593)) e!136446)))

(declare-fun b!198781 () Bool)

(declare-fun res!166409 () Bool)

(assert (=> b!198781 (=> (not res!166409) (not e!136446))))

(assert (=> b!198781 (= res!166409 (bvsle (bitIndex!0 (size!4457 (buf!4949 thiss!1204)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309593))) (currentByte!9296 (_2!9206 lt!309593)) (currentBit!9291 (_2!9206 lt!309593)))))))

(declare-fun b!198782 () Bool)

(declare-fun e!136445 () Bool)

(assert (=> b!198782 (= e!136446 e!136445)))

(declare-fun res!166408 () Bool)

(assert (=> b!198782 (=> res!166408 e!136445)))

(assert (=> b!198782 (= res!166408 (= (size!4457 (buf!4949 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!198783 () Bool)

(assert (=> b!198783 (= e!136445 (arrayBitRangesEq!0 (buf!4949 thiss!1204) (buf!4949 (_2!9206 lt!309593)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4457 (buf!4949 thiss!1204)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204))))))

(assert (= (and d!67577 res!166407) b!198781))

(assert (= (and b!198781 res!166409) b!198782))

(assert (= (and b!198782 (not res!166408)) b!198783))

(assert (=> b!198781 m!307609))

(assert (=> b!198781 m!307635))

(assert (=> b!198783 m!307609))

(assert (=> b!198783 m!307609))

(declare-fun m!307877 () Bool)

(assert (=> b!198783 m!307877))

(assert (=> b!198647 d!67577))

(declare-fun d!67579 () Bool)

(assert (=> d!67579 (isPrefixOf!0 thiss!1204 (_2!9206 lt!309593))))

(declare-fun lt!309892 () Unit!14060)

(declare-fun choose!30 (BitStream!8022 BitStream!8022 BitStream!8022) Unit!14060)

(assert (=> d!67579 (= lt!309892 (choose!30 thiss!1204 (_2!9206 lt!309597) (_2!9206 lt!309593)))))

(assert (=> d!67579 (isPrefixOf!0 thiss!1204 (_2!9206 lt!309597))))

(assert (=> d!67579 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9206 lt!309597) (_2!9206 lt!309593)) lt!309892)))

(declare-fun bs!16720 () Bool)

(assert (= bs!16720 d!67579))

(assert (=> bs!16720 m!307637))

(declare-fun m!307879 () Bool)

(assert (=> bs!16720 m!307879))

(assert (=> bs!16720 m!307633))

(assert (=> b!198647 d!67579))

(declare-fun b!198934 () Bool)

(declare-fun res!166538 () Bool)

(declare-fun call!3137 () Bool)

(assert (=> b!198934 (= res!166538 call!3137)))

(declare-fun e!136538 () Bool)

(assert (=> b!198934 (=> (not res!166538) (not e!136538))))

(declare-fun b!198935 () Bool)

(declare-fun res!166548 () Bool)

(declare-fun e!136536 () Bool)

(assert (=> b!198935 (=> (not res!166548) (not e!136536))))

(declare-fun lt!310327 () tuple2!17116)

(declare-fun lt!310353 () (_ BitVec 64))

(declare-fun lt!310337 () (_ BitVec 64))

(assert (=> b!198935 (= res!166548 (= (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310327))) (currentByte!9296 (_2!9206 lt!310327)) (currentBit!9291 (_2!9206 lt!310327))) (bvsub lt!310353 lt!310337)))))

(assert (=> b!198935 (or (= (bvand lt!310353 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310337 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!310353 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!310353 lt!310337) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198935 (= lt!310337 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!310361 () (_ BitVec 64))

(declare-fun lt!310341 () (_ BitVec 64))

(assert (=> b!198935 (= lt!310353 (bvadd lt!310361 lt!310341))))

(assert (=> b!198935 (or (not (= (bvand lt!310361 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310341 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!310361 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!310361 lt!310341) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198935 (= lt!310341 ((_ sign_extend 32) nBits!348))))

(assert (=> b!198935 (= lt!310361 (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))))))

(declare-fun b!198936 () Bool)

(declare-fun e!136535 () Bool)

(declare-fun lt!310333 () tuple2!17122)

(declare-fun lt!310321 () tuple2!17122)

(assert (=> b!198936 (= e!136535 (= (_2!9209 lt!310333) (_2!9209 lt!310321)))))

(declare-fun b!198937 () Bool)

(declare-fun e!136534 () Bool)

(declare-fun lt!310371 () tuple2!17122)

(declare-fun lt!310330 () tuple2!17116)

(assert (=> b!198937 (= e!136534 (= (bitIndex!0 (size!4457 (buf!4949 (_1!9209 lt!310371))) (currentByte!9296 (_1!9209 lt!310371)) (currentBit!9291 (_1!9209 lt!310371))) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310330))) (currentByte!9296 (_2!9206 lt!310330)) (currentBit!9291 (_2!9206 lt!310330)))))))

(declare-fun b!198938 () Bool)

(declare-fun e!136533 () Bool)

(assert (=> b!198938 (= e!136536 e!136533)))

(declare-fun res!166539 () Bool)

(assert (=> b!198938 (=> (not res!166539) (not e!136533))))

(declare-fun lt!310343 () tuple2!17120)

(assert (=> b!198938 (= res!166539 (= (_2!9208 lt!310343) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!310372 () tuple2!17118)

(assert (=> b!198938 (= lt!310343 (readNBitsLSBFirstsLoopPure!0 (_1!9207 lt!310372) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!310322 () Unit!14060)

(declare-fun lt!310360 () Unit!14060)

(assert (=> b!198938 (= lt!310322 lt!310360)))

(declare-fun lt!310364 () (_ BitVec 64))

(assert (=> b!198938 (validate_offset_bits!1 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310327)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309597))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309597))) lt!310364)))

(assert (=> b!198938 (= lt!310360 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9206 lt!309597) (buf!4949 (_2!9206 lt!310327)) lt!310364))))

(declare-fun e!136537 () Bool)

(assert (=> b!198938 e!136537))

(declare-fun res!166543 () Bool)

(assert (=> b!198938 (=> (not res!166543) (not e!136537))))

(assert (=> b!198938 (= res!166543 (and (= (size!4457 (buf!4949 (_2!9206 lt!309597))) (size!4457 (buf!4949 (_2!9206 lt!310327)))) (bvsge lt!310364 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198938 (= lt!310364 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!198938 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!198938 (= lt!310372 (reader!0 (_2!9206 lt!309597) (_2!9206 lt!310327)))))

(declare-fun b!198939 () Bool)

(declare-fun e!136532 () tuple2!17116)

(declare-fun Unit!14066 () Unit!14060)

(assert (=> b!198939 (= e!136532 (tuple2!17117 Unit!14066 (_2!9206 lt!309597)))))

(declare-fun lt!310347 () Unit!14060)

(assert (=> b!198939 (= lt!310347 (lemmaIsPrefixRefl!0 (_2!9206 lt!309597)))))

(assert (=> b!198939 call!3137))

(declare-fun lt!310344 () Unit!14060)

(assert (=> b!198939 (= lt!310344 lt!310347)))

(declare-fun b!198940 () Bool)

(assert (=> b!198940 (= e!136537 (validate_offset_bits!1 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309597)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309597))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309597))) lt!310364))))

(declare-fun b!198941 () Bool)

(assert (=> b!198941 (= lt!310371 (readBitPure!0 (readerFrom!0 (_2!9206 lt!310330) (currentBit!9291 (_2!9206 lt!309597)) (currentByte!9296 (_2!9206 lt!309597)))))))

(declare-fun lt!310331 () Bool)

(declare-fun res!166544 () Bool)

(assert (=> b!198941 (= res!166544 (and (= (_2!9209 lt!310371) lt!310331) (= (_1!9209 lt!310371) (_2!9206 lt!310330))))))

(assert (=> b!198941 (=> (not res!166544) (not e!136534))))

(assert (=> b!198941 (= e!136538 e!136534)))

(declare-fun b!198943 () Bool)

(declare-fun res!166545 () Bool)

(assert (=> b!198943 (=> (not res!166545) (not e!136536))))

(assert (=> b!198943 (= res!166545 (isPrefixOf!0 (_2!9206 lt!309597) (_2!9206 lt!310327)))))

(declare-fun b!198944 () Bool)

(declare-fun lt!310342 () tuple2!17116)

(assert (=> b!198944 (= e!136532 (tuple2!17117 (_1!9206 lt!310342) (_2!9206 lt!310342)))))

(assert (=> b!198944 (= lt!310331 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198944 (= lt!310330 (appendBit!0 (_2!9206 lt!309597) lt!310331))))

(declare-fun res!166540 () Bool)

(assert (=> b!198944 (= res!166540 (= (size!4457 (buf!4949 (_2!9206 lt!309597))) (size!4457 (buf!4949 (_2!9206 lt!310330)))))))

(assert (=> b!198944 (=> (not res!166540) (not e!136538))))

(assert (=> b!198944 e!136538))

(declare-fun lt!310334 () tuple2!17116)

(assert (=> b!198944 (= lt!310334 lt!310330)))

(assert (=> b!198944 (= lt!310342 (appendBitsLSBFirstLoopTR!0 (_2!9206 lt!310334) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!310354 () Unit!14060)

(assert (=> b!198944 (= lt!310354 (lemmaIsPrefixTransitive!0 (_2!9206 lt!309597) (_2!9206 lt!310334) (_2!9206 lt!310342)))))

(assert (=> b!198944 (isPrefixOf!0 (_2!9206 lt!309597) (_2!9206 lt!310342))))

(declare-fun lt!310338 () Unit!14060)

(assert (=> b!198944 (= lt!310338 lt!310354)))

(assert (=> b!198944 (invariant!0 (currentBit!9291 (_2!9206 lt!309597)) (currentByte!9296 (_2!9206 lt!309597)) (size!4457 (buf!4949 (_2!9206 lt!310334))))))

(declare-fun lt!310357 () BitStream!8022)

(assert (=> b!198944 (= lt!310357 (BitStream!8023 (buf!4949 (_2!9206 lt!310334)) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))))))

(assert (=> b!198944 (invariant!0 (currentBit!9291 lt!310357) (currentByte!9296 lt!310357) (size!4457 (buf!4949 (_2!9206 lt!310342))))))

(declare-fun lt!310335 () BitStream!8022)

(assert (=> b!198944 (= lt!310335 (BitStream!8023 (buf!4949 (_2!9206 lt!310342)) (currentByte!9296 lt!310357) (currentBit!9291 lt!310357)))))

(assert (=> b!198944 (= lt!310333 (readBitPure!0 lt!310357))))

(assert (=> b!198944 (= lt!310321 (readBitPure!0 lt!310335))))

(declare-fun lt!310326 () Unit!14060)

(assert (=> b!198944 (= lt!310326 (readBitPrefixLemma!0 lt!310357 (_2!9206 lt!310342)))))

(declare-fun res!166547 () Bool)

(assert (=> b!198944 (= res!166547 (= (bitIndex!0 (size!4457 (buf!4949 (_1!9209 lt!310333))) (currentByte!9296 (_1!9209 lt!310333)) (currentBit!9291 (_1!9209 lt!310333))) (bitIndex!0 (size!4457 (buf!4949 (_1!9209 lt!310321))) (currentByte!9296 (_1!9209 lt!310321)) (currentBit!9291 (_1!9209 lt!310321)))))))

(assert (=> b!198944 (=> (not res!166547) (not e!136535))))

(assert (=> b!198944 e!136535))

(declare-fun lt!310369 () Unit!14060)

(assert (=> b!198944 (= lt!310369 lt!310326)))

(declare-fun lt!310339 () tuple2!17118)

(assert (=> b!198944 (= lt!310339 (reader!0 (_2!9206 lt!309597) (_2!9206 lt!310342)))))

(declare-fun lt!310365 () tuple2!17118)

(assert (=> b!198944 (= lt!310365 (reader!0 (_2!9206 lt!310334) (_2!9206 lt!310342)))))

(declare-fun lt!310325 () tuple2!17122)

(assert (=> b!198944 (= lt!310325 (readBitPure!0 (_1!9207 lt!310339)))))

(assert (=> b!198944 (= (_2!9209 lt!310325) lt!310331)))

(declare-fun lt!310329 () Unit!14060)

(declare-fun Unit!14067 () Unit!14060)

(assert (=> b!198944 (= lt!310329 Unit!14067)))

(declare-fun lt!310352 () (_ BitVec 64))

(assert (=> b!198944 (= lt!310352 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!310367 () (_ BitVec 64))

(assert (=> b!198944 (= lt!310367 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!310332 () Unit!14060)

(assert (=> b!198944 (= lt!310332 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9206 lt!309597) (buf!4949 (_2!9206 lt!310342)) lt!310367))))

(assert (=> b!198944 (validate_offset_bits!1 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310342)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309597))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309597))) lt!310367)))

(declare-fun lt!310374 () Unit!14060)

(assert (=> b!198944 (= lt!310374 lt!310332)))

(declare-fun lt!310346 () tuple2!17120)

(assert (=> b!198944 (= lt!310346 (readNBitsLSBFirstsLoopPure!0 (_1!9207 lt!310339) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!310352))))

(declare-fun lt!310345 () (_ BitVec 64))

(assert (=> b!198944 (= lt!310345 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!310366 () Unit!14060)

(assert (=> b!198944 (= lt!310366 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9206 lt!310334) (buf!4949 (_2!9206 lt!310342)) lt!310345))))

(assert (=> b!198944 (validate_offset_bits!1 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310342)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!310334))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!310334))) lt!310345)))

(declare-fun lt!310363 () Unit!14060)

(assert (=> b!198944 (= lt!310363 lt!310366)))

(declare-fun lt!310356 () tuple2!17120)

(assert (=> b!198944 (= lt!310356 (readNBitsLSBFirstsLoopPure!0 (_1!9207 lt!310365) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!310352 (ite (_2!9209 lt!310325) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!310320 () tuple2!17120)

(assert (=> b!198944 (= lt!310320 (readNBitsLSBFirstsLoopPure!0 (_1!9207 lt!310339) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!310352))))

(declare-fun c!9906 () Bool)

(assert (=> b!198944 (= c!9906 (_2!9209 (readBitPure!0 (_1!9207 lt!310339))))))

(declare-fun lt!310328 () tuple2!17120)

(declare-fun e!136539 () (_ BitVec 64))

(assert (=> b!198944 (= lt!310328 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9207 lt!310339) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!310352 e!136539)))))

(declare-fun lt!310349 () Unit!14060)

(assert (=> b!198944 (= lt!310349 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9207 lt!310339) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!310352))))

(assert (=> b!198944 (and (= (_2!9208 lt!310320) (_2!9208 lt!310328)) (= (_1!9208 lt!310320) (_1!9208 lt!310328)))))

(declare-fun lt!310319 () Unit!14060)

(assert (=> b!198944 (= lt!310319 lt!310349)))

(assert (=> b!198944 (= (_1!9207 lt!310339) (withMovedBitIndex!0 (_2!9207 lt!310339) (bvsub (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310342))) (currentByte!9296 (_2!9206 lt!310342)) (currentBit!9291 (_2!9206 lt!310342))))))))

(declare-fun lt!310351 () Unit!14060)

(declare-fun Unit!14068 () Unit!14060)

(assert (=> b!198944 (= lt!310351 Unit!14068)))

(assert (=> b!198944 (= (_1!9207 lt!310365) (withMovedBitIndex!0 (_2!9207 lt!310365) (bvsub (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310334))) (currentByte!9296 (_2!9206 lt!310334)) (currentBit!9291 (_2!9206 lt!310334))) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310342))) (currentByte!9296 (_2!9206 lt!310342)) (currentBit!9291 (_2!9206 lt!310342))))))))

(declare-fun lt!310323 () Unit!14060)

(declare-fun Unit!14069 () Unit!14060)

(assert (=> b!198944 (= lt!310323 Unit!14069)))

(assert (=> b!198944 (= (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))) (bvsub (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310334))) (currentByte!9296 (_2!9206 lt!310334)) (currentBit!9291 (_2!9206 lt!310334))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!310348 () Unit!14060)

(declare-fun Unit!14070 () Unit!14060)

(assert (=> b!198944 (= lt!310348 Unit!14070)))

(assert (=> b!198944 (= (_2!9208 lt!310346) (_2!9208 lt!310356))))

(declare-fun lt!310368 () Unit!14060)

(declare-fun Unit!14071 () Unit!14060)

(assert (=> b!198944 (= lt!310368 Unit!14071)))

(assert (=> b!198944 (invariant!0 (currentBit!9291 (_2!9206 lt!310342)) (currentByte!9296 (_2!9206 lt!310342)) (size!4457 (buf!4949 (_2!9206 lt!310342))))))

(declare-fun lt!310358 () Unit!14060)

(declare-fun Unit!14072 () Unit!14060)

(assert (=> b!198944 (= lt!310358 Unit!14072)))

(assert (=> b!198944 (= (size!4457 (buf!4949 (_2!9206 lt!309597))) (size!4457 (buf!4949 (_2!9206 lt!310342))))))

(declare-fun lt!310370 () Unit!14060)

(declare-fun Unit!14073 () Unit!14060)

(assert (=> b!198944 (= lt!310370 Unit!14073)))

(assert (=> b!198944 (= (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310342))) (currentByte!9296 (_2!9206 lt!310342)) (currentBit!9291 (_2!9206 lt!310342))) (bvsub (bvadd (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!310373 () Unit!14060)

(declare-fun Unit!14074 () Unit!14060)

(assert (=> b!198944 (= lt!310373 Unit!14074)))

(declare-fun lt!310362 () Unit!14060)

(declare-fun Unit!14075 () Unit!14060)

(assert (=> b!198944 (= lt!310362 Unit!14075)))

(declare-fun lt!310355 () tuple2!17118)

(assert (=> b!198944 (= lt!310355 (reader!0 (_2!9206 lt!309597) (_2!9206 lt!310342)))))

(declare-fun lt!310359 () (_ BitVec 64))

(assert (=> b!198944 (= lt!310359 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!310324 () Unit!14060)

(assert (=> b!198944 (= lt!310324 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9206 lt!309597) (buf!4949 (_2!9206 lt!310342)) lt!310359))))

(assert (=> b!198944 (validate_offset_bits!1 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310342)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309597))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309597))) lt!310359)))

(declare-fun lt!310340 () Unit!14060)

(assert (=> b!198944 (= lt!310340 lt!310324)))

(declare-fun lt!310336 () tuple2!17120)

(assert (=> b!198944 (= lt!310336 (readNBitsLSBFirstsLoopPure!0 (_1!9207 lt!310355) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!166541 () Bool)

(assert (=> b!198944 (= res!166541 (= (_2!9208 lt!310336) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!136531 () Bool)

(assert (=> b!198944 (=> (not res!166541) (not e!136531))))

(assert (=> b!198944 e!136531))

(declare-fun lt!310350 () Unit!14060)

(declare-fun Unit!14076 () Unit!14060)

(assert (=> b!198944 (= lt!310350 Unit!14076)))

(declare-fun b!198945 () Bool)

(assert (=> b!198945 (= e!136533 (= (_1!9208 lt!310343) (_2!9207 lt!310372)))))

(declare-fun b!198946 () Bool)

(declare-fun res!166537 () Bool)

(assert (=> b!198946 (=> (not res!166537) (not e!136536))))

(assert (=> b!198946 (= res!166537 (= (size!4457 (buf!4949 (_2!9206 lt!309597))) (size!4457 (buf!4949 (_2!9206 lt!310327)))))))

(declare-fun b!198947 () Bool)

(assert (=> b!198947 (= e!136539 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!198948 () Bool)

(declare-fun res!166546 () Bool)

(assert (=> b!198948 (= res!166546 (= (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310330))) (currentByte!9296 (_2!9206 lt!310330)) (currentBit!9291 (_2!9206 lt!310330))) (bvadd (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!198948 (=> (not res!166546) (not e!136538))))

(declare-fun d!67581 () Bool)

(assert (=> d!67581 e!136536))

(declare-fun res!166542 () Bool)

(assert (=> d!67581 (=> (not res!166542) (not e!136536))))

(assert (=> d!67581 (= res!166542 (invariant!0 (currentBit!9291 (_2!9206 lt!310327)) (currentByte!9296 (_2!9206 lt!310327)) (size!4457 (buf!4949 (_2!9206 lt!310327)))))))

(assert (=> d!67581 (= lt!310327 e!136532)))

(declare-fun c!9907 () Bool)

(assert (=> d!67581 (= c!9907 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!67581 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!67581 (= (appendBitsLSBFirstLoopTR!0 (_2!9206 lt!309597) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!310327)))

(declare-fun b!198942 () Bool)

(assert (=> b!198942 (= e!136531 (= (_1!9208 lt!310336) (_2!9207 lt!310355)))))

(declare-fun bm!3134 () Bool)

(assert (=> bm!3134 (= call!3137 (isPrefixOf!0 (_2!9206 lt!309597) (ite c!9907 (_2!9206 lt!309597) (_2!9206 lt!310330))))))

(declare-fun b!198949 () Bool)

(assert (=> b!198949 (= e!136539 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (= (and d!67581 c!9907) b!198939))

(assert (= (and d!67581 (not c!9907)) b!198944))

(assert (= (and b!198944 res!166540) b!198948))

(assert (= (and b!198948 res!166546) b!198934))

(assert (= (and b!198934 res!166538) b!198941))

(assert (= (and b!198941 res!166544) b!198937))

(assert (= (and b!198944 res!166547) b!198936))

(assert (= (and b!198944 c!9906) b!198949))

(assert (= (and b!198944 (not c!9906)) b!198947))

(assert (= (and b!198944 res!166541) b!198942))

(assert (= (or b!198939 b!198934) bm!3134))

(assert (= (and d!67581 res!166542) b!198946))

(assert (= (and b!198946 res!166537) b!198935))

(assert (= (and b!198935 res!166548) b!198943))

(assert (= (and b!198943 res!166545) b!198938))

(assert (= (and b!198938 res!166543) b!198940))

(assert (= (and b!198938 res!166539) b!198945))

(declare-fun m!308119 () Bool)

(assert (=> b!198943 m!308119))

(declare-fun m!308121 () Bool)

(assert (=> b!198935 m!308121))

(assert (=> b!198935 m!307607))

(declare-fun m!308123 () Bool)

(assert (=> b!198940 m!308123))

(declare-fun m!308125 () Bool)

(assert (=> bm!3134 m!308125))

(declare-fun m!308127 () Bool)

(assert (=> b!198948 m!308127))

(assert (=> b!198948 m!307607))

(declare-fun m!308129 () Bool)

(assert (=> b!198937 m!308129))

(assert (=> b!198937 m!308127))

(declare-fun m!308131 () Bool)

(assert (=> b!198941 m!308131))

(assert (=> b!198941 m!308131))

(declare-fun m!308133 () Bool)

(assert (=> b!198941 m!308133))

(declare-fun m!308135 () Bool)

(assert (=> d!67581 m!308135))

(declare-fun m!308137 () Bool)

(assert (=> b!198944 m!308137))

(declare-fun m!308139 () Bool)

(assert (=> b!198944 m!308139))

(declare-fun m!308141 () Bool)

(assert (=> b!198944 m!308141))

(assert (=> b!198944 m!307607))

(declare-fun m!308143 () Bool)

(assert (=> b!198944 m!308143))

(declare-fun m!308145 () Bool)

(assert (=> b!198944 m!308145))

(declare-fun m!308147 () Bool)

(assert (=> b!198944 m!308147))

(declare-fun m!308149 () Bool)

(assert (=> b!198944 m!308149))

(declare-fun m!308151 () Bool)

(assert (=> b!198944 m!308151))

(declare-fun m!308153 () Bool)

(assert (=> b!198944 m!308153))

(declare-fun m!308155 () Bool)

(assert (=> b!198944 m!308155))

(declare-fun m!308157 () Bool)

(assert (=> b!198944 m!308157))

(declare-fun m!308159 () Bool)

(assert (=> b!198944 m!308159))

(declare-fun m!308161 () Bool)

(assert (=> b!198944 m!308161))

(declare-fun m!308163 () Bool)

(assert (=> b!198944 m!308163))

(declare-fun m!308165 () Bool)

(assert (=> b!198944 m!308165))

(declare-fun m!308167 () Bool)

(assert (=> b!198944 m!308167))

(declare-fun m!308169 () Bool)

(assert (=> b!198944 m!308169))

(declare-fun m!308171 () Bool)

(assert (=> b!198944 m!308171))

(declare-fun m!308173 () Bool)

(assert (=> b!198944 m!308173))

(declare-fun m!308175 () Bool)

(assert (=> b!198944 m!308175))

(declare-fun m!308177 () Bool)

(assert (=> b!198944 m!308177))

(assert (=> b!198944 m!308151))

(declare-fun m!308179 () Bool)

(assert (=> b!198944 m!308179))

(declare-fun m!308181 () Bool)

(assert (=> b!198944 m!308181))

(declare-fun m!308183 () Bool)

(assert (=> b!198944 m!308183))

(declare-fun m!308185 () Bool)

(assert (=> b!198944 m!308185))

(declare-fun m!308187 () Bool)

(assert (=> b!198944 m!308187))

(declare-fun m!308189 () Bool)

(assert (=> b!198944 m!308189))

(declare-fun m!308191 () Bool)

(assert (=> b!198944 m!308191))

(declare-fun m!308193 () Bool)

(assert (=> b!198944 m!308193))

(declare-fun m!308195 () Bool)

(assert (=> b!198944 m!308195))

(declare-fun m!308197 () Bool)

(assert (=> b!198944 m!308197))

(declare-fun m!308199 () Bool)

(assert (=> b!198944 m!308199))

(declare-fun m!308201 () Bool)

(assert (=> b!198944 m!308201))

(assert (=> b!198939 m!307801))

(declare-fun m!308203 () Bool)

(assert (=> b!198938 m!308203))

(assert (=> b!198938 m!308165))

(assert (=> b!198938 m!308171))

(declare-fun m!308205 () Bool)

(assert (=> b!198938 m!308205))

(declare-fun m!308207 () Bool)

(assert (=> b!198938 m!308207))

(declare-fun m!308209 () Bool)

(assert (=> b!198938 m!308209))

(assert (=> b!198647 d!67581))

(declare-fun d!67691 () Bool)

(assert (=> d!67691 (= (invariant!0 (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204) (size!4457 (buf!4949 thiss!1204))) (and (bvsge (currentBit!9291 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9291 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9296 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9296 thiss!1204) (size!4457 (buf!4949 thiss!1204))) (and (= (currentBit!9291 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9296 thiss!1204) (size!4457 (buf!4949 thiss!1204)))))))))

(assert (=> b!198637 d!67691))

(declare-fun d!67693 () Bool)

(assert (=> d!67693 (= (invariant!0 (currentBit!9291 (_2!9206 lt!309593)) (currentByte!9296 (_2!9206 lt!309593)) (size!4457 (buf!4949 (_2!9206 lt!309593)))) (and (bvsge (currentBit!9291 (_2!9206 lt!309593)) #b00000000000000000000000000000000) (bvslt (currentBit!9291 (_2!9206 lt!309593)) #b00000000000000000000000000001000) (bvsge (currentByte!9296 (_2!9206 lt!309593)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9296 (_2!9206 lt!309593)) (size!4457 (buf!4949 (_2!9206 lt!309593)))) (and (= (currentBit!9291 (_2!9206 lt!309593)) #b00000000000000000000000000000000) (= (currentByte!9296 (_2!9206 lt!309593)) (size!4457 (buf!4949 (_2!9206 lt!309593))))))))))

(assert (=> b!198640 d!67693))

(declare-fun d!67695 () Bool)

(declare-fun e!136540 () Bool)

(assert (=> d!67695 e!136540))

(declare-fun res!166550 () Bool)

(assert (=> d!67695 (=> (not res!166550) (not e!136540))))

(declare-fun lt!310379 () (_ BitVec 64))

(declare-fun lt!310377 () (_ BitVec 64))

(declare-fun lt!310378 () (_ BitVec 64))

(assert (=> d!67695 (= res!166550 (= lt!310377 (bvsub lt!310378 lt!310379)))))

(assert (=> d!67695 (or (= (bvand lt!310378 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310379 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!310378 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!310378 lt!310379) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67695 (= lt!310379 (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!309599)))) ((_ sign_extend 32) (currentByte!9296 (_1!9209 lt!309599))) ((_ sign_extend 32) (currentBit!9291 (_1!9209 lt!309599)))))))

(declare-fun lt!310376 () (_ BitVec 64))

(declare-fun lt!310380 () (_ BitVec 64))

(assert (=> d!67695 (= lt!310378 (bvmul lt!310376 lt!310380))))

(assert (=> d!67695 (or (= lt!310376 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!310380 (bvsdiv (bvmul lt!310376 lt!310380) lt!310376)))))

(assert (=> d!67695 (= lt!310380 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67695 (= lt!310376 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!309599)))))))

(assert (=> d!67695 (= lt!310377 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 (_1!9209 lt!309599))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 (_1!9209 lt!309599)))))))

(assert (=> d!67695 (invariant!0 (currentBit!9291 (_1!9209 lt!309599)) (currentByte!9296 (_1!9209 lt!309599)) (size!4457 (buf!4949 (_1!9209 lt!309599))))))

(assert (=> d!67695 (= (bitIndex!0 (size!4457 (buf!4949 (_1!9209 lt!309599))) (currentByte!9296 (_1!9209 lt!309599)) (currentBit!9291 (_1!9209 lt!309599))) lt!310377)))

(declare-fun b!198950 () Bool)

(declare-fun res!166549 () Bool)

(assert (=> b!198950 (=> (not res!166549) (not e!136540))))

(assert (=> b!198950 (= res!166549 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!310377))))

(declare-fun b!198951 () Bool)

(declare-fun lt!310375 () (_ BitVec 64))

(assert (=> b!198951 (= e!136540 (bvsle lt!310377 (bvmul lt!310375 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198951 (or (= lt!310375 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!310375 #b0000000000000000000000000000000000000000000000000000000000001000) lt!310375)))))

(assert (=> b!198951 (= lt!310375 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!309599)))))))

(assert (= (and d!67695 res!166550) b!198950))

(assert (= (and b!198950 res!166549) b!198951))

(declare-fun m!308211 () Bool)

(assert (=> d!67695 m!308211))

(declare-fun m!308213 () Bool)

(assert (=> d!67695 m!308213))

(assert (=> b!198641 d!67695))

(declare-fun d!67697 () Bool)

(declare-fun res!166551 () Bool)

(declare-fun e!136542 () Bool)

(assert (=> d!67697 (=> (not res!166551) (not e!136542))))

(assert (=> d!67697 (= res!166551 (= (size!4457 (buf!4949 (_2!9206 lt!309597))) (size!4457 (buf!4949 (_2!9206 lt!309593)))))))

(assert (=> d!67697 (= (isPrefixOf!0 (_2!9206 lt!309597) (_2!9206 lt!309593)) e!136542)))

(declare-fun b!198952 () Bool)

(declare-fun res!166553 () Bool)

(assert (=> b!198952 (=> (not res!166553) (not e!136542))))

(assert (=> b!198952 (= res!166553 (bvsle (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309593))) (currentByte!9296 (_2!9206 lt!309593)) (currentBit!9291 (_2!9206 lt!309593)))))))

(declare-fun b!198953 () Bool)

(declare-fun e!136541 () Bool)

(assert (=> b!198953 (= e!136542 e!136541)))

(declare-fun res!166552 () Bool)

(assert (=> b!198953 (=> res!166552 e!136541)))

(assert (=> b!198953 (= res!166552 (= (size!4457 (buf!4949 (_2!9206 lt!309597))) #b00000000000000000000000000000000))))

(declare-fun b!198954 () Bool)

(assert (=> b!198954 (= e!136541 (arrayBitRangesEq!0 (buf!4949 (_2!9206 lt!309597)) (buf!4949 (_2!9206 lt!309593)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597)))))))

(assert (= (and d!67697 res!166551) b!198952))

(assert (= (and b!198952 res!166553) b!198953))

(assert (= (and b!198953 (not res!166552)) b!198954))

(assert (=> b!198952 m!307607))

(assert (=> b!198952 m!307635))

(assert (=> b!198954 m!307607))

(assert (=> b!198954 m!307607))

(declare-fun m!308215 () Bool)

(assert (=> b!198954 m!308215))

(assert (=> b!198630 d!67697))

(declare-fun d!67699 () Bool)

(assert (=> d!67699 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4457 (buf!4949 thiss!1204))) ((_ sign_extend 32) (currentByte!9296 thiss!1204)) ((_ sign_extend 32) (currentBit!9291 thiss!1204)) lt!309595) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 thiss!1204))) ((_ sign_extend 32) (currentByte!9296 thiss!1204)) ((_ sign_extend 32) (currentBit!9291 thiss!1204))) lt!309595))))

(declare-fun bs!16744 () Bool)

(assert (= bs!16744 d!67699))

(assert (=> bs!16744 m!307733))

(assert (=> b!198639 d!67699))

(declare-fun d!67701 () Bool)

(assert (=> d!67701 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204) (size!4457 (buf!4949 thiss!1204))))))

(declare-fun bs!16745 () Bool)

(assert (= bs!16745 d!67701))

(assert (=> bs!16745 m!307605))

(assert (=> start!42100 d!67701))

(assert (=> b!198650 d!67555))

(check-sat (not d!67543) (not d!67531) (not d!67537) (not b!198937) (not b!198948) (not d!67581) (not d!67523) (not b!198954) (not d!67535) (not b!198938) (not d!67569) (not d!67571) (not d!67563) (not b!198742) (not d!67527) (not b!198783) (not d!67565) (not b!198941) (not b!198774) (not b!198773) (not b!198944) (not b!198771) (not d!67519) (not d!67575) (not b!198735) (not d!67701) (not d!67539) (not d!67567) (not b!198777) (not b!198939) (not d!67579) (not b!198758) (not d!67573) (not d!67549) (not d!67695) (not b!198743) (not b!198744) (not d!67517) (not d!67529) (not b!198737) (not b!198760) (not b!198952) (not b!198935) (not b!198943) (not d!67547) (not b!198734) (not b!198940) (not d!67533) (not d!67545) (not d!67699) (not d!67525) (not b!198781) (not d!67553) (not b!198736) (not d!67551) (not b!198741) (not d!67557) (not b!198772) (not bm!3134))
(check-sat)
(get-model)

(declare-fun d!67751 () Bool)

(assert (=> d!67751 (= (invariant!0 (currentBit!9291 (_2!9206 lt!310327)) (currentByte!9296 (_2!9206 lt!310327)) (size!4457 (buf!4949 (_2!9206 lt!310327)))) (and (bvsge (currentBit!9291 (_2!9206 lt!310327)) #b00000000000000000000000000000000) (bvslt (currentBit!9291 (_2!9206 lt!310327)) #b00000000000000000000000000001000) (bvsge (currentByte!9296 (_2!9206 lt!310327)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9296 (_2!9206 lt!310327)) (size!4457 (buf!4949 (_2!9206 lt!310327)))) (and (= (currentBit!9291 (_2!9206 lt!310327)) #b00000000000000000000000000000000) (= (currentByte!9296 (_2!9206 lt!310327)) (size!4457 (buf!4949 (_2!9206 lt!310327))))))))))

(assert (=> d!67581 d!67751))

(declare-fun d!67753 () Bool)

(assert (=> d!67753 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309597)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309597))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309597))) lt!310364) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309597)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309597))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309597)))) lt!310364))))

(declare-fun bs!16755 () Bool)

(assert (= bs!16755 d!67753))

(assert (=> bs!16755 m!307729))

(assert (=> b!198940 d!67753))

(assert (=> b!198781 d!67519))

(assert (=> b!198781 d!67575))

(declare-fun d!67755 () Bool)

(declare-fun e!136623 () Bool)

(assert (=> d!67755 e!136623))

(declare-fun res!166659 () Bool)

(assert (=> d!67755 (=> (not res!166659) (not e!136623))))

(declare-fun increaseBitIndex!0 (BitStream!8022) tuple2!17116)

(assert (=> d!67755 (= res!166659 (= (buf!4949 (_2!9206 (increaseBitIndex!0 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204))))) (buf!4949 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)))))))

(declare-fun lt!310818 () Bool)

(assert (=> d!67755 (= lt!310818 (not (= (bvand ((_ sign_extend 24) (select (arr!5387 (buf!4949 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)))) (currentByte!9296 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9291 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!310816 () tuple2!17132)

(assert (=> d!67755 (= lt!310816 (tuple2!17133 (not (= (bvand ((_ sign_extend 24) (select (arr!5387 (buf!4949 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)))) (currentByte!9296 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9291 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)))))) #b00000000000000000000000000000000)) (_2!9206 (increaseBitIndex!0 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204))))))))

(assert (=> d!67755 (validate_offset_bit!0 ((_ sign_extend 32) (size!4457 (buf!4949 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204))))) ((_ sign_extend 32) (currentByte!9296 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)))) ((_ sign_extend 32) (currentBit!9291 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)))))))

(assert (=> d!67755 (= (readBit!0 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204))) lt!310816)))

(declare-fun b!199085 () Bool)

(declare-fun lt!310817 () (_ BitVec 64))

(declare-fun lt!310814 () (_ BitVec 64))

(assert (=> b!199085 (= e!136623 (= (bitIndex!0 (size!4457 (buf!4949 (_2!9206 (increaseBitIndex!0 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)))))) (currentByte!9296 (_2!9206 (increaseBitIndex!0 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204))))) (currentBit!9291 (_2!9206 (increaseBitIndex!0 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)))))) (bvadd lt!310817 lt!310814)))))

(assert (=> b!199085 (or (not (= (bvand lt!310817 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310814 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!310817 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!310817 lt!310814) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199085 (= lt!310814 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!199085 (= lt!310817 (bitIndex!0 (size!4457 (buf!4949 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)))) (currentByte!9296 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204))) (currentBit!9291 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)))))))

(declare-fun lt!310815 () Bool)

(assert (=> b!199085 (= lt!310815 (not (= (bvand ((_ sign_extend 24) (select (arr!5387 (buf!4949 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)))) (currentByte!9296 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9291 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!310819 () Bool)

(assert (=> b!199085 (= lt!310819 (not (= (bvand ((_ sign_extend 24) (select (arr!5387 (buf!4949 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)))) (currentByte!9296 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9291 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!310813 () Bool)

(assert (=> b!199085 (= lt!310813 (not (= (bvand ((_ sign_extend 24) (select (arr!5387 (buf!4949 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)))) (currentByte!9296 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9291 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!67755 res!166659) b!199085))

(declare-fun m!308479 () Bool)

(assert (=> d!67755 m!308479))

(declare-fun m!308481 () Bool)

(assert (=> d!67755 m!308481))

(declare-fun m!308483 () Bool)

(assert (=> d!67755 m!308483))

(declare-fun m!308485 () Bool)

(assert (=> d!67755 m!308485))

(declare-fun m!308487 () Bool)

(assert (=> b!199085 m!308487))

(assert (=> b!199085 m!308481))

(assert (=> b!199085 m!308483))

(declare-fun m!308489 () Bool)

(assert (=> b!199085 m!308489))

(assert (=> b!199085 m!308479))

(assert (=> d!67537 d!67755))

(declare-fun d!67757 () Bool)

(assert (=> d!67757 (= (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309593)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309593))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309593)))) (bvsub (bvmul ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309593)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309593))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309593))))))))

(assert (=> d!67575 d!67757))

(assert (=> d!67575 d!67693))

(declare-fun b!199100 () Bool)

(declare-fun res!166671 () Bool)

(declare-fun e!136630 () Bool)

(assert (=> b!199100 (=> (not res!166671) (not e!136630))))

(declare-fun lt!310836 () tuple2!17134)

(declare-fun lt!310835 () (_ BitVec 64))

(declare-fun lt!310832 () (_ BitVec 64))

(assert (=> b!199100 (= res!166671 (= (bitIndex!0 (size!4457 (buf!4949 (_2!9215 lt!310836))) (currentByte!9296 (_2!9215 lt!310836)) (currentBit!9291 (_2!9215 lt!310836))) (bvadd lt!310835 lt!310832)))))

(assert (=> b!199100 (or (not (= (bvand lt!310835 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310832 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!310835 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!310835 lt!310832) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199100 (= lt!310832 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!199100 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!199100 (= lt!310835 (bitIndex!0 (size!4457 (buf!4949 lt!309608)) (currentByte!9296 lt!309608) (currentBit!9291 lt!309608)))))

(declare-fun b!199101 () Bool)

(declare-fun res!166672 () Bool)

(assert (=> b!199101 (=> (not res!166672) (not e!136630))))

(assert (=> b!199101 (= res!166672 (= (bvand (_1!9215 lt!310836) (onesLSBLong!0 nBits!348)) (_1!9215 lt!310836)))))

(declare-fun e!136632 () Bool)

(declare-fun b!199102 () Bool)

(declare-fun lt!310837 () (_ BitVec 64))

(assert (=> b!199102 (= e!136632 (= (= (bvand (bvlshr (_1!9215 lt!310836) lt!310837) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!9209 (readBitPure!0 lt!309608))))))

(assert (=> b!199102 (and (bvsge lt!310837 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!310837 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!199102 (= lt!310837 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!199103 () Bool)

(assert (=> b!199103 (= e!136630 e!136632)))

(declare-fun res!166674 () Bool)

(assert (=> b!199103 (=> res!166674 e!136632)))

(assert (=> b!199103 (= res!166674 (not (bvslt (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-fun b!199104 () Bool)

(declare-fun res!166673 () Bool)

(assert (=> b!199104 (=> (not res!166673) (not e!136630))))

(assert (=> b!199104 (= res!166673 (= (bvand (_1!9215 lt!310836) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))) (bvand lt!309610 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun b!199106 () Bool)

(declare-fun e!136631 () tuple2!17134)

(assert (=> b!199106 (= e!136631 (tuple2!17135 lt!309610 lt!309608))))

(declare-fun b!199105 () Bool)

(declare-fun lt!310834 () tuple2!17134)

(assert (=> b!199105 (= e!136631 (tuple2!17135 (_1!9215 lt!310834) (_2!9215 lt!310834)))))

(declare-fun lt!310833 () tuple2!17132)

(assert (=> b!199105 (= lt!310833 (readBit!0 lt!309608))))

(assert (=> b!199105 (= lt!310834 (readNBitsLSBFirstsLoop!0 (_2!9214 lt!310833) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!309610 (ite (_1!9214 lt!310833) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!67759 () Bool)

(assert (=> d!67759 e!136630))

(declare-fun res!166670 () Bool)

(assert (=> d!67759 (=> (not res!166670) (not e!136630))))

(assert (=> d!67759 (= res!166670 (= (buf!4949 (_2!9215 lt!310836)) (buf!4949 lt!309608)))))

(assert (=> d!67759 (= lt!310836 e!136631)))

(declare-fun c!9922 () Bool)

(assert (=> d!67759 (= c!9922 (= nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (=> d!67759 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsle (bvadd #b00000000000000000000000000000001 i!590) nBits!348) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!67759 (= (readNBitsLSBFirstsLoop!0 lt!309608 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!309610) lt!310836)))

(assert (= (and d!67759 c!9922) b!199106))

(assert (= (and d!67759 (not c!9922)) b!199105))

(assert (= (and d!67759 res!166670) b!199100))

(assert (= (and b!199100 res!166671) b!199104))

(assert (= (and b!199104 res!166673) b!199101))

(assert (= (and b!199101 res!166672) b!199103))

(assert (= (and b!199103 (not res!166674)) b!199102))

(declare-fun m!308491 () Bool)

(assert (=> b!199100 m!308491))

(declare-fun m!308493 () Bool)

(assert (=> b!199100 m!308493))

(assert (=> b!199104 m!308171))

(declare-fun m!308495 () Bool)

(assert (=> b!199102 m!308495))

(assert (=> b!199101 m!308165))

(declare-fun m!308497 () Bool)

(assert (=> b!199105 m!308497))

(declare-fun m!308499 () Bool)

(assert (=> b!199105 m!308499))

(assert (=> d!67571 d!67759))

(assert (=> b!198744 d!67517))

(declare-fun d!67761 () Bool)

(assert (=> d!67761 (arrayBitRangesEq!0 (buf!4949 (_2!9206 lt!309593)) (buf!4949 (_2!9206 lt!309597)) lt!309815 lt!309812)))

(declare-fun lt!310840 () Unit!14060)

(declare-fun choose!8 (array!10114 array!10114 (_ BitVec 64) (_ BitVec 64)) Unit!14060)

(assert (=> d!67761 (= lt!310840 (choose!8 (buf!4949 (_2!9206 lt!309597)) (buf!4949 (_2!9206 lt!309593)) lt!309815 lt!309812))))

(assert (=> d!67761 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!309815) (bvsle lt!309815 lt!309812))))

(assert (=> d!67761 (= (arrayBitRangesEqSymmetric!0 (buf!4949 (_2!9206 lt!309597)) (buf!4949 (_2!9206 lt!309593)) lt!309815 lt!309812) lt!310840)))

(declare-fun bs!16756 () Bool)

(assert (= bs!16756 d!67761))

(assert (=> bs!16756 m!307793))

(declare-fun m!308501 () Bool)

(assert (=> bs!16756 m!308501))

(assert (=> b!198744 d!67761))

(declare-fun e!136645 () Bool)

(declare-fun b!199121 () Bool)

(declare-datatypes ((tuple4!264 0))(
  ( (tuple4!265 (_1!9220 (_ BitVec 32)) (_2!9220 (_ BitVec 32)) (_3!648 (_ BitVec 32)) (_4!132 (_ BitVec 32))) )
))
(declare-fun lt!310847 () tuple4!264)

(declare-fun arrayRangesEq!694 (array!10114 array!10114 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!199121 (= e!136645 (arrayRangesEq!694 (buf!4949 (_2!9206 lt!309593)) (buf!4949 (_2!9206 lt!309597)) (_1!9220 lt!310847) (_2!9220 lt!310847)))))

(declare-fun d!67763 () Bool)

(declare-fun res!166689 () Bool)

(declare-fun e!136649 () Bool)

(assert (=> d!67763 (=> res!166689 e!136649)))

(assert (=> d!67763 (= res!166689 (bvsge lt!309815 lt!309812))))

(assert (=> d!67763 (= (arrayBitRangesEq!0 (buf!4949 (_2!9206 lt!309593)) (buf!4949 (_2!9206 lt!309597)) lt!309815 lt!309812) e!136649)))

(declare-fun b!199122 () Bool)

(declare-fun res!166685 () Bool)

(declare-fun lt!310848 () (_ BitVec 32))

(assert (=> b!199122 (= res!166685 (= lt!310848 #b00000000000000000000000000000000))))

(declare-fun e!136648 () Bool)

(assert (=> b!199122 (=> res!166685 e!136648)))

(declare-fun e!136650 () Bool)

(assert (=> b!199122 (= e!136650 e!136648)))

(declare-fun b!199123 () Bool)

(declare-fun e!136647 () Bool)

(assert (=> b!199123 (= e!136647 e!136650)))

(declare-fun res!166688 () Bool)

(declare-fun call!3146 () Bool)

(assert (=> b!199123 (= res!166688 call!3146)))

(assert (=> b!199123 (=> (not res!166688) (not e!136650))))

(declare-fun c!9925 () Bool)

(declare-fun bm!3143 () Bool)

(declare-fun lt!310849 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3143 (= call!3146 (byteRangesEq!0 (select (arr!5387 (buf!4949 (_2!9206 lt!309593))) (_3!648 lt!310847)) (select (arr!5387 (buf!4949 (_2!9206 lt!309597))) (_3!648 lt!310847)) lt!310849 (ite c!9925 lt!310848 #b00000000000000000000000000001000)))))

(declare-fun b!199124 () Bool)

(assert (=> b!199124 (= e!136647 call!3146)))

(declare-fun b!199125 () Bool)

(declare-fun e!136646 () Bool)

(assert (=> b!199125 (= e!136646 e!136647)))

(assert (=> b!199125 (= c!9925 (= (_3!648 lt!310847) (_4!132 lt!310847)))))

(declare-fun b!199126 () Bool)

(assert (=> b!199126 (= e!136648 (byteRangesEq!0 (select (arr!5387 (buf!4949 (_2!9206 lt!309593))) (_4!132 lt!310847)) (select (arr!5387 (buf!4949 (_2!9206 lt!309597))) (_4!132 lt!310847)) #b00000000000000000000000000000000 lt!310848))))

(declare-fun b!199127 () Bool)

(assert (=> b!199127 (= e!136649 e!136646)))

(declare-fun res!166687 () Bool)

(assert (=> b!199127 (=> (not res!166687) (not e!136646))))

(assert (=> b!199127 (= res!166687 e!136645)))

(declare-fun res!166686 () Bool)

(assert (=> b!199127 (=> res!166686 e!136645)))

(assert (=> b!199127 (= res!166686 (bvsge (_1!9220 lt!310847) (_2!9220 lt!310847)))))

(assert (=> b!199127 (= lt!310848 ((_ extract 31 0) (bvsrem lt!309812 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199127 (= lt!310849 ((_ extract 31 0) (bvsrem lt!309815 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!264)

(assert (=> b!199127 (= lt!310847 (arrayBitIndices!0 lt!309815 lt!309812))))

(assert (= (and d!67763 (not res!166689)) b!199127))

(assert (= (and b!199127 (not res!166686)) b!199121))

(assert (= (and b!199127 res!166687) b!199125))

(assert (= (and b!199125 c!9925) b!199124))

(assert (= (and b!199125 (not c!9925)) b!199123))

(assert (= (and b!199123 res!166688) b!199122))

(assert (= (and b!199122 (not res!166685)) b!199126))

(assert (= (or b!199124 b!199123) bm!3143))

(declare-fun m!308503 () Bool)

(assert (=> b!199121 m!308503))

(declare-fun m!308505 () Bool)

(assert (=> bm!3143 m!308505))

(declare-fun m!308507 () Bool)

(assert (=> bm!3143 m!308507))

(assert (=> bm!3143 m!308505))

(assert (=> bm!3143 m!308507))

(declare-fun m!308509 () Bool)

(assert (=> bm!3143 m!308509))

(declare-fun m!308511 () Bool)

(assert (=> b!199126 m!308511))

(declare-fun m!308513 () Bool)

(assert (=> b!199126 m!308513))

(assert (=> b!199126 m!308511))

(assert (=> b!199126 m!308513))

(declare-fun m!308515 () Bool)

(assert (=> b!199126 m!308515))

(declare-fun m!308517 () Bool)

(assert (=> b!199127 m!308517))

(assert (=> b!198744 d!67763))

(declare-fun d!67765 () Bool)

(declare-fun e!136651 () Bool)

(assert (=> d!67765 e!136651))

(declare-fun res!166690 () Bool)

(assert (=> d!67765 (=> (not res!166690) (not e!136651))))

(declare-fun lt!310851 () (_ BitVec 64))

(declare-fun lt!310850 () BitStream!8022)

(assert (=> d!67765 (= res!166690 (= (bvadd lt!310851 (bvsub lt!309827 lt!309823)) (bitIndex!0 (size!4457 (buf!4949 lt!310850)) (currentByte!9296 lt!310850) (currentBit!9291 lt!310850))))))

(assert (=> d!67765 (or (not (= (bvand lt!310851 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309827 lt!309823) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!310851 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!310851 (bvsub lt!309827 lt!309823)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67765 (= lt!310851 (bitIndex!0 (size!4457 (buf!4949 (_2!9207 lt!309820))) (currentByte!9296 (_2!9207 lt!309820)) (currentBit!9291 (_2!9207 lt!309820))))))

(assert (=> d!67765 (= lt!310850 (_2!9206 (moveBitIndex!0 (_2!9207 lt!309820) (bvsub lt!309827 lt!309823))))))

(assert (=> d!67765 (moveBitIndexPrecond!0 (_2!9207 lt!309820) (bvsub lt!309827 lt!309823))))

(assert (=> d!67765 (= (withMovedBitIndex!0 (_2!9207 lt!309820) (bvsub lt!309827 lt!309823)) lt!310850)))

(declare-fun b!199128 () Bool)

(assert (=> b!199128 (= e!136651 (= (size!4457 (buf!4949 (_2!9207 lt!309820))) (size!4457 (buf!4949 lt!310850))))))

(assert (= (and d!67765 res!166690) b!199128))

(declare-fun m!308519 () Bool)

(assert (=> d!67765 m!308519))

(declare-fun m!308521 () Bool)

(assert (=> d!67765 m!308521))

(declare-fun m!308523 () Bool)

(assert (=> d!67765 m!308523))

(declare-fun m!308525 () Bool)

(assert (=> d!67765 m!308525))

(assert (=> b!198742 d!67765))

(assert (=> b!198742 d!67575))

(assert (=> b!198742 d!67517))

(declare-fun d!67767 () Bool)

(assert (=> d!67767 (= (invariant!0 (currentBit!9291 (_2!9206 lt!310342)) (currentByte!9296 (_2!9206 lt!310342)) (size!4457 (buf!4949 (_2!9206 lt!310342)))) (and (bvsge (currentBit!9291 (_2!9206 lt!310342)) #b00000000000000000000000000000000) (bvslt (currentBit!9291 (_2!9206 lt!310342)) #b00000000000000000000000000001000) (bvsge (currentByte!9296 (_2!9206 lt!310342)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9296 (_2!9206 lt!310342)) (size!4457 (buf!4949 (_2!9206 lt!310342)))) (and (= (currentBit!9291 (_2!9206 lt!310342)) #b00000000000000000000000000000000) (= (currentByte!9296 (_2!9206 lt!310342)) (size!4457 (buf!4949 (_2!9206 lt!310342))))))))))

(assert (=> b!198944 d!67767))

(declare-fun d!67769 () Bool)

(declare-fun res!166691 () Bool)

(declare-fun e!136653 () Bool)

(assert (=> d!67769 (=> (not res!166691) (not e!136653))))

(assert (=> d!67769 (= res!166691 (= (size!4457 (buf!4949 (_2!9206 lt!309597))) (size!4457 (buf!4949 (_2!9206 lt!310342)))))))

(assert (=> d!67769 (= (isPrefixOf!0 (_2!9206 lt!309597) (_2!9206 lt!310342)) e!136653)))

(declare-fun b!199129 () Bool)

(declare-fun res!166693 () Bool)

(assert (=> b!199129 (=> (not res!166693) (not e!136653))))

(assert (=> b!199129 (= res!166693 (bvsle (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310342))) (currentByte!9296 (_2!9206 lt!310342)) (currentBit!9291 (_2!9206 lt!310342)))))))

(declare-fun b!199130 () Bool)

(declare-fun e!136652 () Bool)

(assert (=> b!199130 (= e!136653 e!136652)))

(declare-fun res!166692 () Bool)

(assert (=> b!199130 (=> res!166692 e!136652)))

(assert (=> b!199130 (= res!166692 (= (size!4457 (buf!4949 (_2!9206 lt!309597))) #b00000000000000000000000000000000))))

(declare-fun b!199131 () Bool)

(assert (=> b!199131 (= e!136652 (arrayBitRangesEq!0 (buf!4949 (_2!9206 lt!309597)) (buf!4949 (_2!9206 lt!310342)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597)))))))

(assert (= (and d!67769 res!166691) b!199129))

(assert (= (and b!199129 res!166693) b!199130))

(assert (= (and b!199130 (not res!166692)) b!199131))

(assert (=> b!199129 m!307607))

(assert (=> b!199129 m!308143))

(assert (=> b!199131 m!307607))

(assert (=> b!199131 m!307607))

(declare-fun m!308527 () Bool)

(assert (=> b!199131 m!308527))

(assert (=> b!198944 d!67769))

(declare-fun d!67771 () Bool)

(declare-fun e!136654 () Bool)

(assert (=> d!67771 e!136654))

(declare-fun res!166695 () Bool)

(assert (=> d!67771 (=> (not res!166695) (not e!136654))))

(declare-fun lt!310855 () (_ BitVec 64))

(declare-fun lt!310854 () (_ BitVec 64))

(declare-fun lt!310856 () (_ BitVec 64))

(assert (=> d!67771 (= res!166695 (= lt!310854 (bvsub lt!310855 lt!310856)))))

(assert (=> d!67771 (or (= (bvand lt!310855 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310856 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!310855 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!310855 lt!310856) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67771 (= lt!310856 (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!310333)))) ((_ sign_extend 32) (currentByte!9296 (_1!9209 lt!310333))) ((_ sign_extend 32) (currentBit!9291 (_1!9209 lt!310333)))))))

(declare-fun lt!310853 () (_ BitVec 64))

(declare-fun lt!310857 () (_ BitVec 64))

(assert (=> d!67771 (= lt!310855 (bvmul lt!310853 lt!310857))))

(assert (=> d!67771 (or (= lt!310853 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!310857 (bvsdiv (bvmul lt!310853 lt!310857) lt!310853)))))

(assert (=> d!67771 (= lt!310857 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67771 (= lt!310853 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!310333)))))))

(assert (=> d!67771 (= lt!310854 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 (_1!9209 lt!310333))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 (_1!9209 lt!310333)))))))

(assert (=> d!67771 (invariant!0 (currentBit!9291 (_1!9209 lt!310333)) (currentByte!9296 (_1!9209 lt!310333)) (size!4457 (buf!4949 (_1!9209 lt!310333))))))

(assert (=> d!67771 (= (bitIndex!0 (size!4457 (buf!4949 (_1!9209 lt!310333))) (currentByte!9296 (_1!9209 lt!310333)) (currentBit!9291 (_1!9209 lt!310333))) lt!310854)))

(declare-fun b!199132 () Bool)

(declare-fun res!166694 () Bool)

(assert (=> b!199132 (=> (not res!166694) (not e!136654))))

(assert (=> b!199132 (= res!166694 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!310854))))

(declare-fun b!199133 () Bool)

(declare-fun lt!310852 () (_ BitVec 64))

(assert (=> b!199133 (= e!136654 (bvsle lt!310854 (bvmul lt!310852 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199133 (or (= lt!310852 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!310852 #b0000000000000000000000000000000000000000000000000000000000001000) lt!310852)))))

(assert (=> b!199133 (= lt!310852 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!310333)))))))

(assert (= (and d!67771 res!166695) b!199132))

(assert (= (and b!199132 res!166694) b!199133))

(declare-fun m!308529 () Bool)

(assert (=> d!67771 m!308529))

(declare-fun m!308531 () Bool)

(assert (=> d!67771 m!308531))

(assert (=> b!198944 d!67771))

(declare-fun d!67773 () Bool)

(assert (=> d!67773 (= (invariant!0 (currentBit!9291 (_2!9206 lt!309597)) (currentByte!9296 (_2!9206 lt!309597)) (size!4457 (buf!4949 (_2!9206 lt!310334)))) (and (bvsge (currentBit!9291 (_2!9206 lt!309597)) #b00000000000000000000000000000000) (bvslt (currentBit!9291 (_2!9206 lt!309597)) #b00000000000000000000000000001000) (bvsge (currentByte!9296 (_2!9206 lt!309597)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9296 (_2!9206 lt!309597)) (size!4457 (buf!4949 (_2!9206 lt!310334)))) (and (= (currentBit!9291 (_2!9206 lt!309597)) #b00000000000000000000000000000000) (= (currentByte!9296 (_2!9206 lt!309597)) (size!4457 (buf!4949 (_2!9206 lt!310334))))))))))

(assert (=> b!198944 d!67773))

(declare-fun d!67775 () Bool)

(assert (=> d!67775 (= (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!590)))))))

(assert (=> b!198944 d!67775))

(declare-fun d!67777 () Bool)

(declare-fun e!136655 () Bool)

(assert (=> d!67777 e!136655))

(declare-fun res!166696 () Bool)

(assert (=> d!67777 (=> (not res!166696) (not e!136655))))

(declare-fun lt!310860 () tuple2!17122)

(declare-fun lt!310858 () tuple2!17122)

(assert (=> d!67777 (= res!166696 (= (bitIndex!0 (size!4457 (buf!4949 (_1!9209 lt!310860))) (currentByte!9296 (_1!9209 lt!310860)) (currentBit!9291 (_1!9209 lt!310860))) (bitIndex!0 (size!4457 (buf!4949 (_1!9209 lt!310858))) (currentByte!9296 (_1!9209 lt!310858)) (currentBit!9291 (_1!9209 lt!310858)))))))

(declare-fun lt!310859 () Unit!14060)

(declare-fun lt!310861 () BitStream!8022)

(assert (=> d!67777 (= lt!310859 (choose!50 lt!310357 (_2!9206 lt!310342) lt!310861 lt!310860 (tuple2!17123 (_1!9209 lt!310860) (_2!9209 lt!310860)) (_1!9209 lt!310860) (_2!9209 lt!310860) lt!310858 (tuple2!17123 (_1!9209 lt!310858) (_2!9209 lt!310858)) (_1!9209 lt!310858) (_2!9209 lt!310858)))))

(assert (=> d!67777 (= lt!310858 (readBitPure!0 lt!310861))))

(assert (=> d!67777 (= lt!310860 (readBitPure!0 lt!310357))))

(assert (=> d!67777 (= lt!310861 (BitStream!8023 (buf!4949 (_2!9206 lt!310342)) (currentByte!9296 lt!310357) (currentBit!9291 lt!310357)))))

(assert (=> d!67777 (invariant!0 (currentBit!9291 lt!310357) (currentByte!9296 lt!310357) (size!4457 (buf!4949 (_2!9206 lt!310342))))))

(assert (=> d!67777 (= (readBitPrefixLemma!0 lt!310357 (_2!9206 lt!310342)) lt!310859)))

(declare-fun b!199134 () Bool)

(assert (=> b!199134 (= e!136655 (= (_2!9209 lt!310860) (_2!9209 lt!310858)))))

(assert (= (and d!67777 res!166696) b!199134))

(declare-fun m!308533 () Bool)

(assert (=> d!67777 m!308533))

(declare-fun m!308535 () Bool)

(assert (=> d!67777 m!308535))

(declare-fun m!308537 () Bool)

(assert (=> d!67777 m!308537))

(assert (=> d!67777 m!308145))

(assert (=> d!67777 m!308161))

(declare-fun m!308539 () Bool)

(assert (=> d!67777 m!308539))

(assert (=> b!198944 d!67777))

(declare-fun d!67779 () Bool)

(declare-fun e!136656 () Bool)

(assert (=> d!67779 e!136656))

(declare-fun res!166698 () Bool)

(assert (=> d!67779 (=> (not res!166698) (not e!136656))))

(declare-fun lt!310865 () (_ BitVec 64))

(declare-fun lt!310866 () (_ BitVec 64))

(declare-fun lt!310864 () (_ BitVec 64))

(assert (=> d!67779 (= res!166698 (= lt!310864 (bvsub lt!310865 lt!310866)))))

(assert (=> d!67779 (or (= (bvand lt!310865 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310866 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!310865 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!310865 lt!310866) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67779 (= lt!310866 (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310334)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!310334))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!310334)))))))

(declare-fun lt!310863 () (_ BitVec 64))

(declare-fun lt!310867 () (_ BitVec 64))

(assert (=> d!67779 (= lt!310865 (bvmul lt!310863 lt!310867))))

(assert (=> d!67779 (or (= lt!310863 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!310867 (bvsdiv (bvmul lt!310863 lt!310867) lt!310863)))))

(assert (=> d!67779 (= lt!310867 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67779 (= lt!310863 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310334)))))))

(assert (=> d!67779 (= lt!310864 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!310334))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!310334)))))))

(assert (=> d!67779 (invariant!0 (currentBit!9291 (_2!9206 lt!310334)) (currentByte!9296 (_2!9206 lt!310334)) (size!4457 (buf!4949 (_2!9206 lt!310334))))))

(assert (=> d!67779 (= (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310334))) (currentByte!9296 (_2!9206 lt!310334)) (currentBit!9291 (_2!9206 lt!310334))) lt!310864)))

(declare-fun b!199135 () Bool)

(declare-fun res!166697 () Bool)

(assert (=> b!199135 (=> (not res!166697) (not e!136656))))

(assert (=> b!199135 (= res!166697 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!310864))))

(declare-fun b!199136 () Bool)

(declare-fun lt!310862 () (_ BitVec 64))

(assert (=> b!199136 (= e!136656 (bvsle lt!310864 (bvmul lt!310862 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199136 (or (= lt!310862 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!310862 #b0000000000000000000000000000000000000000000000000000000000001000) lt!310862)))))

(assert (=> b!199136 (= lt!310862 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310334)))))))

(assert (= (and d!67779 res!166698) b!199135))

(assert (= (and b!199135 res!166697) b!199136))

(declare-fun m!308541 () Bool)

(assert (=> d!67779 m!308541))

(declare-fun m!308543 () Bool)

(assert (=> d!67779 m!308543))

(assert (=> b!198944 d!67779))

(declare-fun d!67781 () Bool)

(assert (=> d!67781 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310342)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!310334))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!310334))) lt!310345) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310342)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!310334))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!310334)))) lt!310345))))

(declare-fun bs!16757 () Bool)

(assert (= bs!16757 d!67781))

(declare-fun m!308545 () Bool)

(assert (=> bs!16757 m!308545))

(assert (=> b!198944 d!67781))

(declare-fun b!199137 () Bool)

(declare-fun res!166700 () Bool)

(declare-fun call!3147 () Bool)

(assert (=> b!199137 (= res!166700 call!3147)))

(declare-fun e!136664 () Bool)

(assert (=> b!199137 (=> (not res!166700) (not e!136664))))

(declare-fun b!199138 () Bool)

(declare-fun res!166710 () Bool)

(declare-fun e!136662 () Bool)

(assert (=> b!199138 (=> (not res!166710) (not e!136662))))

(declare-fun lt!310876 () tuple2!17116)

(declare-fun lt!310902 () (_ BitVec 64))

(declare-fun lt!310886 () (_ BitVec 64))

(assert (=> b!199138 (= res!166710 (= (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310876))) (currentByte!9296 (_2!9206 lt!310876)) (currentBit!9291 (_2!9206 lt!310876))) (bvsub lt!310902 lt!310886)))))

(assert (=> b!199138 (or (= (bvand lt!310902 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310886 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!310902 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!310902 lt!310886) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199138 (= lt!310886 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!310910 () (_ BitVec 64))

(declare-fun lt!310890 () (_ BitVec 64))

(assert (=> b!199138 (= lt!310902 (bvadd lt!310910 lt!310890))))

(assert (=> b!199138 (or (not (= (bvand lt!310910 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310890 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!310910 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!310910 lt!310890) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199138 (= lt!310890 ((_ sign_extend 32) nBits!348))))

(assert (=> b!199138 (= lt!310910 (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310334))) (currentByte!9296 (_2!9206 lt!310334)) (currentBit!9291 (_2!9206 lt!310334))))))

(declare-fun b!199139 () Bool)

(declare-fun e!136661 () Bool)

(declare-fun lt!310882 () tuple2!17122)

(declare-fun lt!310870 () tuple2!17122)

(assert (=> b!199139 (= e!136661 (= (_2!9209 lt!310882) (_2!9209 lt!310870)))))

(declare-fun b!199140 () Bool)

(declare-fun e!136660 () Bool)

(declare-fun lt!310920 () tuple2!17122)

(declare-fun lt!310879 () tuple2!17116)

(assert (=> b!199140 (= e!136660 (= (bitIndex!0 (size!4457 (buf!4949 (_1!9209 lt!310920))) (currentByte!9296 (_1!9209 lt!310920)) (currentBit!9291 (_1!9209 lt!310920))) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310879))) (currentByte!9296 (_2!9206 lt!310879)) (currentBit!9291 (_2!9206 lt!310879)))))))

(declare-fun b!199141 () Bool)

(declare-fun e!136659 () Bool)

(assert (=> b!199141 (= e!136662 e!136659)))

(declare-fun res!166701 () Bool)

(assert (=> b!199141 (=> (not res!166701) (not e!136659))))

(declare-fun lt!310892 () tuple2!17120)

(assert (=> b!199141 (= res!166701 (= (_2!9208 lt!310892) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!310921 () tuple2!17118)

(assert (=> b!199141 (= lt!310892 (readNBitsLSBFirstsLoopPure!0 (_1!9207 lt!310921) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))))

(declare-fun lt!310871 () Unit!14060)

(declare-fun lt!310909 () Unit!14060)

(assert (=> b!199141 (= lt!310871 lt!310909)))

(declare-fun lt!310913 () (_ BitVec 64))

(assert (=> b!199141 (validate_offset_bits!1 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310876)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!310334))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!310334))) lt!310913)))

(assert (=> b!199141 (= lt!310909 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9206 lt!310334) (buf!4949 (_2!9206 lt!310876)) lt!310913))))

(declare-fun e!136663 () Bool)

(assert (=> b!199141 e!136663))

(declare-fun res!166705 () Bool)

(assert (=> b!199141 (=> (not res!166705) (not e!136663))))

(assert (=> b!199141 (= res!166705 (and (= (size!4457 (buf!4949 (_2!9206 lt!310334))) (size!4457 (buf!4949 (_2!9206 lt!310876)))) (bvsge lt!310913 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199141 (= lt!310913 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(assert (=> b!199141 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!199141 (= lt!310921 (reader!0 (_2!9206 lt!310334) (_2!9206 lt!310876)))))

(declare-fun b!199142 () Bool)

(declare-fun e!136658 () tuple2!17116)

(declare-fun Unit!14103 () Unit!14060)

(assert (=> b!199142 (= e!136658 (tuple2!17117 Unit!14103 (_2!9206 lt!310334)))))

(declare-fun lt!310896 () Unit!14060)

(assert (=> b!199142 (= lt!310896 (lemmaIsPrefixRefl!0 (_2!9206 lt!310334)))))

(assert (=> b!199142 call!3147))

(declare-fun lt!310893 () Unit!14060)

(assert (=> b!199142 (= lt!310893 lt!310896)))

(declare-fun b!199143 () Bool)

(assert (=> b!199143 (= e!136663 (validate_offset_bits!1 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310334)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!310334))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!310334))) lt!310913))))

(declare-fun b!199144 () Bool)

(assert (=> b!199144 (= lt!310920 (readBitPure!0 (readerFrom!0 (_2!9206 lt!310879) (currentBit!9291 (_2!9206 lt!310334)) (currentByte!9296 (_2!9206 lt!310334)))))))

(declare-fun lt!310880 () Bool)

(declare-fun res!166706 () Bool)

(assert (=> b!199144 (= res!166706 (and (= (_2!9209 lt!310920) lt!310880) (= (_1!9209 lt!310920) (_2!9206 lt!310879))))))

(assert (=> b!199144 (=> (not res!166706) (not e!136660))))

(assert (=> b!199144 (= e!136664 e!136660)))

(declare-fun b!199146 () Bool)

(declare-fun res!166707 () Bool)

(assert (=> b!199146 (=> (not res!166707) (not e!136662))))

(assert (=> b!199146 (= res!166707 (isPrefixOf!0 (_2!9206 lt!310334) (_2!9206 lt!310876)))))

(declare-fun b!199147 () Bool)

(declare-fun lt!310891 () tuple2!17116)

(assert (=> b!199147 (= e!136658 (tuple2!17117 (_1!9206 lt!310891) (_2!9206 lt!310891)))))

(assert (=> b!199147 (= lt!310880 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199147 (= lt!310879 (appendBit!0 (_2!9206 lt!310334) lt!310880))))

(declare-fun res!166702 () Bool)

(assert (=> b!199147 (= res!166702 (= (size!4457 (buf!4949 (_2!9206 lt!310334))) (size!4457 (buf!4949 (_2!9206 lt!310879)))))))

(assert (=> b!199147 (=> (not res!166702) (not e!136664))))

(assert (=> b!199147 e!136664))

(declare-fun lt!310883 () tuple2!17116)

(assert (=> b!199147 (= lt!310883 lt!310879)))

(assert (=> b!199147 (= lt!310891 (appendBitsLSBFirstLoopTR!0 (_2!9206 lt!310883) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!310903 () Unit!14060)

(assert (=> b!199147 (= lt!310903 (lemmaIsPrefixTransitive!0 (_2!9206 lt!310334) (_2!9206 lt!310883) (_2!9206 lt!310891)))))

(assert (=> b!199147 (isPrefixOf!0 (_2!9206 lt!310334) (_2!9206 lt!310891))))

(declare-fun lt!310887 () Unit!14060)

(assert (=> b!199147 (= lt!310887 lt!310903)))

(assert (=> b!199147 (invariant!0 (currentBit!9291 (_2!9206 lt!310334)) (currentByte!9296 (_2!9206 lt!310334)) (size!4457 (buf!4949 (_2!9206 lt!310883))))))

(declare-fun lt!310906 () BitStream!8022)

(assert (=> b!199147 (= lt!310906 (BitStream!8023 (buf!4949 (_2!9206 lt!310883)) (currentByte!9296 (_2!9206 lt!310334)) (currentBit!9291 (_2!9206 lt!310334))))))

(assert (=> b!199147 (invariant!0 (currentBit!9291 lt!310906) (currentByte!9296 lt!310906) (size!4457 (buf!4949 (_2!9206 lt!310891))))))

(declare-fun lt!310884 () BitStream!8022)

(assert (=> b!199147 (= lt!310884 (BitStream!8023 (buf!4949 (_2!9206 lt!310891)) (currentByte!9296 lt!310906) (currentBit!9291 lt!310906)))))

(assert (=> b!199147 (= lt!310882 (readBitPure!0 lt!310906))))

(assert (=> b!199147 (= lt!310870 (readBitPure!0 lt!310884))))

(declare-fun lt!310875 () Unit!14060)

(assert (=> b!199147 (= lt!310875 (readBitPrefixLemma!0 lt!310906 (_2!9206 lt!310891)))))

(declare-fun res!166709 () Bool)

(assert (=> b!199147 (= res!166709 (= (bitIndex!0 (size!4457 (buf!4949 (_1!9209 lt!310882))) (currentByte!9296 (_1!9209 lt!310882)) (currentBit!9291 (_1!9209 lt!310882))) (bitIndex!0 (size!4457 (buf!4949 (_1!9209 lt!310870))) (currentByte!9296 (_1!9209 lt!310870)) (currentBit!9291 (_1!9209 lt!310870)))))))

(assert (=> b!199147 (=> (not res!166709) (not e!136661))))

(assert (=> b!199147 e!136661))

(declare-fun lt!310918 () Unit!14060)

(assert (=> b!199147 (= lt!310918 lt!310875)))

(declare-fun lt!310888 () tuple2!17118)

(assert (=> b!199147 (= lt!310888 (reader!0 (_2!9206 lt!310334) (_2!9206 lt!310891)))))

(declare-fun lt!310914 () tuple2!17118)

(assert (=> b!199147 (= lt!310914 (reader!0 (_2!9206 lt!310883) (_2!9206 lt!310891)))))

(declare-fun lt!310874 () tuple2!17122)

(assert (=> b!199147 (= lt!310874 (readBitPure!0 (_1!9207 lt!310888)))))

(assert (=> b!199147 (= (_2!9209 lt!310874) lt!310880)))

(declare-fun lt!310878 () Unit!14060)

(declare-fun Unit!14104 () Unit!14060)

(assert (=> b!199147 (= lt!310878 Unit!14104)))

(declare-fun lt!310901 () (_ BitVec 64))

(assert (=> b!199147 (= lt!310901 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!310916 () (_ BitVec 64))

(assert (=> b!199147 (= lt!310916 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!310881 () Unit!14060)

(assert (=> b!199147 (= lt!310881 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9206 lt!310334) (buf!4949 (_2!9206 lt!310891)) lt!310916))))

(assert (=> b!199147 (validate_offset_bits!1 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310891)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!310334))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!310334))) lt!310916)))

(declare-fun lt!310923 () Unit!14060)

(assert (=> b!199147 (= lt!310923 lt!310881)))

(declare-fun lt!310895 () tuple2!17120)

(assert (=> b!199147 (= lt!310895 (readNBitsLSBFirstsLoopPure!0 (_1!9207 lt!310888) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!310901))))

(declare-fun lt!310894 () (_ BitVec 64))

(assert (=> b!199147 (= lt!310894 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(declare-fun lt!310915 () Unit!14060)

(assert (=> b!199147 (= lt!310915 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9206 lt!310883) (buf!4949 (_2!9206 lt!310891)) lt!310894))))

(assert (=> b!199147 (validate_offset_bits!1 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310891)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!310883))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!310883))) lt!310894)))

(declare-fun lt!310912 () Unit!14060)

(assert (=> b!199147 (= lt!310912 lt!310915)))

(declare-fun lt!310905 () tuple2!17120)

(assert (=> b!199147 (= lt!310905 (readNBitsLSBFirstsLoopPure!0 (_1!9207 lt!310914) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!310901 (ite (_2!9209 lt!310874) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!310869 () tuple2!17120)

(assert (=> b!199147 (= lt!310869 (readNBitsLSBFirstsLoopPure!0 (_1!9207 lt!310888) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!310901))))

(declare-fun c!9926 () Bool)

(assert (=> b!199147 (= c!9926 (_2!9209 (readBitPure!0 (_1!9207 lt!310888))))))

(declare-fun e!136665 () (_ BitVec 64))

(declare-fun lt!310877 () tuple2!17120)

(assert (=> b!199147 (= lt!310877 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9207 lt!310888) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!310901 e!136665)))))

(declare-fun lt!310898 () Unit!14060)

(assert (=> b!199147 (= lt!310898 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9207 lt!310888) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!310901))))

(assert (=> b!199147 (and (= (_2!9208 lt!310869) (_2!9208 lt!310877)) (= (_1!9208 lt!310869) (_1!9208 lt!310877)))))

(declare-fun lt!310868 () Unit!14060)

(assert (=> b!199147 (= lt!310868 lt!310898)))

(assert (=> b!199147 (= (_1!9207 lt!310888) (withMovedBitIndex!0 (_2!9207 lt!310888) (bvsub (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310334))) (currentByte!9296 (_2!9206 lt!310334)) (currentBit!9291 (_2!9206 lt!310334))) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310891))) (currentByte!9296 (_2!9206 lt!310891)) (currentBit!9291 (_2!9206 lt!310891))))))))

(declare-fun lt!310900 () Unit!14060)

(declare-fun Unit!14105 () Unit!14060)

(assert (=> b!199147 (= lt!310900 Unit!14105)))

(assert (=> b!199147 (= (_1!9207 lt!310914) (withMovedBitIndex!0 (_2!9207 lt!310914) (bvsub (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310883))) (currentByte!9296 (_2!9206 lt!310883)) (currentBit!9291 (_2!9206 lt!310883))) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310891))) (currentByte!9296 (_2!9206 lt!310891)) (currentBit!9291 (_2!9206 lt!310891))))))))

(declare-fun lt!310872 () Unit!14060)

(declare-fun Unit!14106 () Unit!14060)

(assert (=> b!199147 (= lt!310872 Unit!14106)))

(assert (=> b!199147 (= (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310334))) (currentByte!9296 (_2!9206 lt!310334)) (currentBit!9291 (_2!9206 lt!310334))) (bvsub (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310883))) (currentByte!9296 (_2!9206 lt!310883)) (currentBit!9291 (_2!9206 lt!310883))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!310897 () Unit!14060)

(declare-fun Unit!14107 () Unit!14060)

(assert (=> b!199147 (= lt!310897 Unit!14107)))

(assert (=> b!199147 (= (_2!9208 lt!310895) (_2!9208 lt!310905))))

(declare-fun lt!310917 () Unit!14060)

(declare-fun Unit!14108 () Unit!14060)

(assert (=> b!199147 (= lt!310917 Unit!14108)))

(assert (=> b!199147 (invariant!0 (currentBit!9291 (_2!9206 lt!310891)) (currentByte!9296 (_2!9206 lt!310891)) (size!4457 (buf!4949 (_2!9206 lt!310891))))))

(declare-fun lt!310907 () Unit!14060)

(declare-fun Unit!14109 () Unit!14060)

(assert (=> b!199147 (= lt!310907 Unit!14109)))

(assert (=> b!199147 (= (size!4457 (buf!4949 (_2!9206 lt!310334))) (size!4457 (buf!4949 (_2!9206 lt!310891))))))

(declare-fun lt!310919 () Unit!14060)

(declare-fun Unit!14110 () Unit!14060)

(assert (=> b!199147 (= lt!310919 Unit!14110)))

(assert (=> b!199147 (= (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310891))) (currentByte!9296 (_2!9206 lt!310891)) (currentBit!9291 (_2!9206 lt!310891))) (bvsub (bvadd (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310334))) (currentByte!9296 (_2!9206 lt!310334)) (currentBit!9291 (_2!9206 lt!310334))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!310922 () Unit!14060)

(declare-fun Unit!14111 () Unit!14060)

(assert (=> b!199147 (= lt!310922 Unit!14111)))

(declare-fun lt!310911 () Unit!14060)

(declare-fun Unit!14112 () Unit!14060)

(assert (=> b!199147 (= lt!310911 Unit!14112)))

(declare-fun lt!310904 () tuple2!17118)

(assert (=> b!199147 (= lt!310904 (reader!0 (_2!9206 lt!310334) (_2!9206 lt!310891)))))

(declare-fun lt!310908 () (_ BitVec 64))

(assert (=> b!199147 (= lt!310908 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!310873 () Unit!14060)

(assert (=> b!199147 (= lt!310873 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9206 lt!310334) (buf!4949 (_2!9206 lt!310891)) lt!310908))))

(assert (=> b!199147 (validate_offset_bits!1 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310891)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!310334))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!310334))) lt!310908)))

(declare-fun lt!310889 () Unit!14060)

(assert (=> b!199147 (= lt!310889 lt!310873)))

(declare-fun lt!310885 () tuple2!17120)

(assert (=> b!199147 (= lt!310885 (readNBitsLSBFirstsLoopPure!0 (_1!9207 lt!310904) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))))

(declare-fun res!166703 () Bool)

(assert (=> b!199147 (= res!166703 (= (_2!9208 lt!310885) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!136657 () Bool)

(assert (=> b!199147 (=> (not res!166703) (not e!136657))))

(assert (=> b!199147 e!136657))

(declare-fun lt!310899 () Unit!14060)

(declare-fun Unit!14113 () Unit!14060)

(assert (=> b!199147 (= lt!310899 Unit!14113)))

(declare-fun b!199148 () Bool)

(assert (=> b!199148 (= e!136659 (= (_1!9208 lt!310892) (_2!9207 lt!310921)))))

(declare-fun b!199149 () Bool)

(declare-fun res!166699 () Bool)

(assert (=> b!199149 (=> (not res!166699) (not e!136662))))

(assert (=> b!199149 (= res!166699 (= (size!4457 (buf!4949 (_2!9206 lt!310334))) (size!4457 (buf!4949 (_2!9206 lt!310876)))))))

(declare-fun b!199150 () Bool)

(assert (=> b!199150 (= e!136665 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!199151 () Bool)

(declare-fun res!166708 () Bool)

(assert (=> b!199151 (= res!166708 (= (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310879))) (currentByte!9296 (_2!9206 lt!310879)) (currentBit!9291 (_2!9206 lt!310879))) (bvadd (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310334))) (currentByte!9296 (_2!9206 lt!310334)) (currentBit!9291 (_2!9206 lt!310334))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!199151 (=> (not res!166708) (not e!136664))))

(declare-fun d!67783 () Bool)

(assert (=> d!67783 e!136662))

(declare-fun res!166704 () Bool)

(assert (=> d!67783 (=> (not res!166704) (not e!136662))))

(assert (=> d!67783 (= res!166704 (invariant!0 (currentBit!9291 (_2!9206 lt!310876)) (currentByte!9296 (_2!9206 lt!310876)) (size!4457 (buf!4949 (_2!9206 lt!310876)))))))

(assert (=> d!67783 (= lt!310876 e!136658)))

(declare-fun c!9927 () Bool)

(assert (=> d!67783 (= c!9927 (= (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) nBits!348))))

(assert (=> d!67783 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!67783 (= (appendBitsLSBFirstLoopTR!0 (_2!9206 lt!310334) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)) lt!310876)))

(declare-fun b!199145 () Bool)

(assert (=> b!199145 (= e!136657 (= (_1!9208 lt!310885) (_2!9207 lt!310904)))))

(declare-fun bm!3144 () Bool)

(assert (=> bm!3144 (= call!3147 (isPrefixOf!0 (_2!9206 lt!310334) (ite c!9927 (_2!9206 lt!310334) (_2!9206 lt!310879))))))

(declare-fun b!199152 () Bool)

(assert (=> b!199152 (= e!136665 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(assert (= (and d!67783 c!9927) b!199142))

(assert (= (and d!67783 (not c!9927)) b!199147))

(assert (= (and b!199147 res!166702) b!199151))

(assert (= (and b!199151 res!166708) b!199137))

(assert (= (and b!199137 res!166700) b!199144))

(assert (= (and b!199144 res!166706) b!199140))

(assert (= (and b!199147 res!166709) b!199139))

(assert (= (and b!199147 c!9926) b!199152))

(assert (= (and b!199147 (not c!9926)) b!199150))

(assert (= (and b!199147 res!166703) b!199145))

(assert (= (or b!199142 b!199137) bm!3144))

(assert (= (and d!67783 res!166704) b!199149))

(assert (= (and b!199149 res!166699) b!199138))

(assert (= (and b!199138 res!166710) b!199146))

(assert (= (and b!199146 res!166707) b!199141))

(assert (= (and b!199141 res!166705) b!199143))

(assert (= (and b!199141 res!166701) b!199148))

(declare-fun m!308547 () Bool)

(assert (=> b!199146 m!308547))

(declare-fun m!308549 () Bool)

(assert (=> b!199138 m!308549))

(assert (=> b!199138 m!308149))

(declare-fun m!308551 () Bool)

(assert (=> b!199143 m!308551))

(declare-fun m!308553 () Bool)

(assert (=> bm!3144 m!308553))

(declare-fun m!308555 () Bool)

(assert (=> b!199151 m!308555))

(assert (=> b!199151 m!308149))

(declare-fun m!308557 () Bool)

(assert (=> b!199140 m!308557))

(assert (=> b!199140 m!308555))

(declare-fun m!308559 () Bool)

(assert (=> b!199144 m!308559))

(assert (=> b!199144 m!308559))

(declare-fun m!308561 () Bool)

(assert (=> b!199144 m!308561))

(declare-fun m!308563 () Bool)

(assert (=> d!67783 m!308563))

(declare-fun m!308565 () Bool)

(assert (=> b!199147 m!308565))

(declare-fun m!308567 () Bool)

(assert (=> b!199147 m!308567))

(declare-fun m!308569 () Bool)

(assert (=> b!199147 m!308569))

(assert (=> b!199147 m!308149))

(declare-fun m!308571 () Bool)

(assert (=> b!199147 m!308571))

(declare-fun m!308573 () Bool)

(assert (=> b!199147 m!308573))

(declare-fun m!308575 () Bool)

(assert (=> b!199147 m!308575))

(declare-fun m!308577 () Bool)

(assert (=> b!199147 m!308577))

(declare-fun m!308579 () Bool)

(assert (=> b!199147 m!308579))

(declare-fun m!308581 () Bool)

(assert (=> b!199147 m!308581))

(declare-fun m!308583 () Bool)

(assert (=> b!199147 m!308583))

(declare-fun m!308585 () Bool)

(assert (=> b!199147 m!308585))

(declare-fun m!308587 () Bool)

(assert (=> b!199147 m!308587))

(declare-fun m!308589 () Bool)

(assert (=> b!199147 m!308589))

(declare-fun m!308591 () Bool)

(assert (=> b!199147 m!308591))

(assert (=> b!199147 m!308165))

(declare-fun m!308593 () Bool)

(assert (=> b!199147 m!308593))

(declare-fun m!308595 () Bool)

(assert (=> b!199147 m!308595))

(declare-fun m!308597 () Bool)

(assert (=> b!199147 m!308597))

(declare-fun m!308599 () Bool)

(assert (=> b!199147 m!308599))

(declare-fun m!308601 () Bool)

(assert (=> b!199147 m!308601))

(declare-fun m!308603 () Bool)

(assert (=> b!199147 m!308603))

(assert (=> b!199147 m!308579))

(declare-fun m!308605 () Bool)

(assert (=> b!199147 m!308605))

(declare-fun m!308607 () Bool)

(assert (=> b!199147 m!308607))

(declare-fun m!308609 () Bool)

(assert (=> b!199147 m!308609))

(declare-fun m!308611 () Bool)

(assert (=> b!199147 m!308611))

(declare-fun m!308613 () Bool)

(assert (=> b!199147 m!308613))

(declare-fun m!308615 () Bool)

(assert (=> b!199147 m!308615))

(declare-fun m!308617 () Bool)

(assert (=> b!199147 m!308617))

(declare-fun m!308619 () Bool)

(assert (=> b!199147 m!308619))

(declare-fun m!308621 () Bool)

(assert (=> b!199147 m!308621))

(declare-fun m!308623 () Bool)

(assert (=> b!199147 m!308623))

(declare-fun m!308625 () Bool)

(assert (=> b!199147 m!308625))

(declare-fun m!308627 () Bool)

(assert (=> b!199147 m!308627))

(declare-fun m!308629 () Bool)

(assert (=> b!199142 m!308629))

(declare-fun m!308631 () Bool)

(assert (=> b!199141 m!308631))

(assert (=> b!199141 m!308165))

(assert (=> b!199141 m!308597))

(declare-fun m!308633 () Bool)

(assert (=> b!199141 m!308633))

(declare-fun m!308635 () Bool)

(assert (=> b!199141 m!308635))

(declare-fun m!308637 () Bool)

(assert (=> b!199141 m!308637))

(assert (=> b!198944 d!67783))

(declare-fun b!199153 () Bool)

(declare-fun res!166714 () Bool)

(declare-fun e!136666 () Bool)

(assert (=> b!199153 (=> (not res!166714) (not e!136666))))

(declare-fun lt!310925 () tuple2!17116)

(declare-fun lt!310926 () (_ BitVec 64))

(declare-fun lt!310927 () (_ BitVec 64))

(assert (=> b!199153 (= res!166714 (= (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310925))) (currentByte!9296 (_2!9206 lt!310925)) (currentBit!9291 (_2!9206 lt!310925))) (bvadd lt!310926 lt!310927)))))

(assert (=> b!199153 (or (not (= (bvand lt!310926 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310927 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!310926 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!310926 lt!310927) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199153 (= lt!310927 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!199153 (= lt!310926 (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))))))

(declare-fun b!199154 () Bool)

(declare-fun res!166711 () Bool)

(assert (=> b!199154 (=> (not res!166711) (not e!136666))))

(assert (=> b!199154 (= res!166711 (isPrefixOf!0 (_2!9206 lt!309597) (_2!9206 lt!310925)))))

(declare-fun b!199155 () Bool)

(declare-fun e!136667 () Bool)

(assert (=> b!199155 (= e!136666 e!136667)))

(declare-fun res!166712 () Bool)

(assert (=> b!199155 (=> (not res!166712) (not e!136667))))

(declare-fun lt!310924 () tuple2!17122)

(assert (=> b!199155 (= res!166712 (and (= (_2!9209 lt!310924) lt!310331) (= (_1!9209 lt!310924) (_2!9206 lt!310925))))))

(assert (=> b!199155 (= lt!310924 (readBitPure!0 (readerFrom!0 (_2!9206 lt!310925) (currentBit!9291 (_2!9206 lt!309597)) (currentByte!9296 (_2!9206 lt!309597)))))))

(declare-fun d!67785 () Bool)

(assert (=> d!67785 e!136666))

(declare-fun res!166713 () Bool)

(assert (=> d!67785 (=> (not res!166713) (not e!136666))))

(assert (=> d!67785 (= res!166713 (= (size!4457 (buf!4949 (_2!9206 lt!309597))) (size!4457 (buf!4949 (_2!9206 lt!310925)))))))

(assert (=> d!67785 (= lt!310925 (choose!16 (_2!9206 lt!309597) lt!310331))))

(assert (=> d!67785 (validate_offset_bit!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309597)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309597))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309597))))))

(assert (=> d!67785 (= (appendBit!0 (_2!9206 lt!309597) lt!310331) lt!310925)))

(declare-fun b!199156 () Bool)

(assert (=> b!199156 (= e!136667 (= (bitIndex!0 (size!4457 (buf!4949 (_1!9209 lt!310924))) (currentByte!9296 (_1!9209 lt!310924)) (currentBit!9291 (_1!9209 lt!310924))) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310925))) (currentByte!9296 (_2!9206 lt!310925)) (currentBit!9291 (_2!9206 lt!310925)))))))

(assert (= (and d!67785 res!166713) b!199153))

(assert (= (and b!199153 res!166714) b!199154))

(assert (= (and b!199154 res!166711) b!199155))

(assert (= (and b!199155 res!166712) b!199156))

(declare-fun m!308639 () Bool)

(assert (=> b!199155 m!308639))

(assert (=> b!199155 m!308639))

(declare-fun m!308641 () Bool)

(assert (=> b!199155 m!308641))

(declare-fun m!308643 () Bool)

(assert (=> b!199153 m!308643))

(assert (=> b!199153 m!307607))

(declare-fun m!308645 () Bool)

(assert (=> d!67785 m!308645))

(declare-fun m!308647 () Bool)

(assert (=> d!67785 m!308647))

(declare-fun m!308649 () Bool)

(assert (=> b!199156 m!308649))

(assert (=> b!199156 m!308643))

(declare-fun m!308651 () Bool)

(assert (=> b!199154 m!308651))

(assert (=> b!198944 d!67785))

(declare-fun d!67787 () Bool)

(declare-fun e!136668 () Bool)

(assert (=> d!67787 e!136668))

(declare-fun res!166716 () Bool)

(assert (=> d!67787 (=> (not res!166716) (not e!136668))))

(declare-fun lt!310930 () (_ BitVec 64))

(declare-fun lt!310932 () (_ BitVec 64))

(declare-fun lt!310931 () (_ BitVec 64))

(assert (=> d!67787 (= res!166716 (= lt!310930 (bvsub lt!310931 lt!310932)))))

(assert (=> d!67787 (or (= (bvand lt!310931 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310932 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!310931 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!310931 lt!310932) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67787 (= lt!310932 (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!310321)))) ((_ sign_extend 32) (currentByte!9296 (_1!9209 lt!310321))) ((_ sign_extend 32) (currentBit!9291 (_1!9209 lt!310321)))))))

(declare-fun lt!310929 () (_ BitVec 64))

(declare-fun lt!310933 () (_ BitVec 64))

(assert (=> d!67787 (= lt!310931 (bvmul lt!310929 lt!310933))))

(assert (=> d!67787 (or (= lt!310929 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!310933 (bvsdiv (bvmul lt!310929 lt!310933) lt!310929)))))

(assert (=> d!67787 (= lt!310933 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67787 (= lt!310929 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!310321)))))))

(assert (=> d!67787 (= lt!310930 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 (_1!9209 lt!310321))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 (_1!9209 lt!310321)))))))

(assert (=> d!67787 (invariant!0 (currentBit!9291 (_1!9209 lt!310321)) (currentByte!9296 (_1!9209 lt!310321)) (size!4457 (buf!4949 (_1!9209 lt!310321))))))

(assert (=> d!67787 (= (bitIndex!0 (size!4457 (buf!4949 (_1!9209 lt!310321))) (currentByte!9296 (_1!9209 lt!310321)) (currentBit!9291 (_1!9209 lt!310321))) lt!310930)))

(declare-fun b!199157 () Bool)

(declare-fun res!166715 () Bool)

(assert (=> b!199157 (=> (not res!166715) (not e!136668))))

(assert (=> b!199157 (= res!166715 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!310930))))

(declare-fun b!199158 () Bool)

(declare-fun lt!310928 () (_ BitVec 64))

(assert (=> b!199158 (= e!136668 (bvsle lt!310930 (bvmul lt!310928 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199158 (or (= lt!310928 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!310928 #b0000000000000000000000000000000000000000000000000000000000001000) lt!310928)))))

(assert (=> b!199158 (= lt!310928 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!310321)))))))

(assert (= (and d!67787 res!166716) b!199157))

(assert (= (and b!199157 res!166715) b!199158))

(declare-fun m!308653 () Bool)

(assert (=> d!67787 m!308653))

(declare-fun m!308655 () Bool)

(assert (=> d!67787 m!308655))

(assert (=> b!198944 d!67787))

(declare-fun d!67789 () Bool)

(assert (=> d!67789 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310342)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309597))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309597))) lt!310359) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310342)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309597))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309597)))) lt!310359))))

(declare-fun bs!16758 () Bool)

(assert (= bs!16758 d!67789))

(declare-fun m!308657 () Bool)

(assert (=> bs!16758 m!308657))

(assert (=> b!198944 d!67789))

(declare-fun d!67791 () Bool)

(declare-fun lt!310934 () tuple2!17134)

(assert (=> d!67791 (= lt!310934 (readNBitsLSBFirstsLoop!0 (_1!9207 lt!310365) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!310352 (ite (_2!9209 lt!310325) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!67791 (= (readNBitsLSBFirstsLoopPure!0 (_1!9207 lt!310365) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!310352 (ite (_2!9209 lt!310325) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!17121 (_2!9215 lt!310934) (_1!9215 lt!310934)))))

(declare-fun bs!16759 () Bool)

(assert (= bs!16759 d!67791))

(declare-fun m!308659 () Bool)

(assert (=> bs!16759 m!308659))

(assert (=> b!198944 d!67791))

(declare-fun d!67793 () Bool)

(assert (=> d!67793 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310342)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309597))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309597))) lt!310367) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310342)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309597))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309597)))) lt!310367))))

(declare-fun bs!16760 () Bool)

(assert (= bs!16760 d!67793))

(assert (=> bs!16760 m!308657))

(assert (=> b!198944 d!67793))

(declare-fun d!67795 () Bool)

(declare-fun lt!310935 () tuple2!17132)

(assert (=> d!67795 (= lt!310935 (readBit!0 lt!310335))))

(assert (=> d!67795 (= (readBitPure!0 lt!310335) (tuple2!17123 (_2!9214 lt!310935) (_1!9214 lt!310935)))))

(declare-fun bs!16761 () Bool)

(assert (= bs!16761 d!67795))

(declare-fun m!308661 () Bool)

(assert (=> bs!16761 m!308661))

(assert (=> b!198944 d!67795))

(declare-fun d!67797 () Bool)

(assert (=> d!67797 (validate_offset_bits!1 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310342)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309597))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309597))) lt!310359)))

(declare-fun lt!310936 () Unit!14060)

(assert (=> d!67797 (= lt!310936 (choose!9 (_2!9206 lt!309597) (buf!4949 (_2!9206 lt!310342)) lt!310359 (BitStream!8023 (buf!4949 (_2!9206 lt!310342)) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597)))))))

(assert (=> d!67797 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9206 lt!309597) (buf!4949 (_2!9206 lt!310342)) lt!310359) lt!310936)))

(declare-fun bs!16762 () Bool)

(assert (= bs!16762 d!67797))

(assert (=> bs!16762 m!308147))

(declare-fun m!308663 () Bool)

(assert (=> bs!16762 m!308663))

(assert (=> b!198944 d!67797))

(declare-fun lt!310937 () tuple2!17134)

(declare-fun d!67799 () Bool)

(assert (=> d!67799 (= lt!310937 (readNBitsLSBFirstsLoop!0 (_1!9207 lt!310355) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(assert (=> d!67799 (= (readNBitsLSBFirstsLoopPure!0 (_1!9207 lt!310355) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))) (tuple2!17121 (_2!9215 lt!310937) (_1!9215 lt!310937)))))

(declare-fun bs!16763 () Bool)

(assert (= bs!16763 d!67799))

(declare-fun m!308665 () Bool)

(assert (=> bs!16763 m!308665))

(assert (=> b!198944 d!67799))

(declare-fun b!199159 () Bool)

(declare-fun res!166717 () Bool)

(declare-fun e!136669 () Bool)

(assert (=> b!199159 (=> (not res!166717) (not e!136669))))

(declare-fun lt!310950 () tuple2!17118)

(assert (=> b!199159 (= res!166717 (isPrefixOf!0 (_2!9207 lt!310950) (_2!9206 lt!310342)))))

(declare-fun d!67801 () Bool)

(assert (=> d!67801 e!136669))

(declare-fun res!166718 () Bool)

(assert (=> d!67801 (=> (not res!166718) (not e!136669))))

(assert (=> d!67801 (= res!166718 (isPrefixOf!0 (_1!9207 lt!310950) (_2!9207 lt!310950)))))

(declare-fun lt!310952 () BitStream!8022)

(assert (=> d!67801 (= lt!310950 (tuple2!17119 lt!310952 (_2!9206 lt!310342)))))

(declare-fun lt!310938 () Unit!14060)

(declare-fun lt!310941 () Unit!14060)

(assert (=> d!67801 (= lt!310938 lt!310941)))

(assert (=> d!67801 (isPrefixOf!0 lt!310952 (_2!9206 lt!310342))))

(assert (=> d!67801 (= lt!310941 (lemmaIsPrefixTransitive!0 lt!310952 (_2!9206 lt!310342) (_2!9206 lt!310342)))))

(declare-fun lt!310944 () Unit!14060)

(declare-fun lt!310947 () Unit!14060)

(assert (=> d!67801 (= lt!310944 lt!310947)))

(assert (=> d!67801 (isPrefixOf!0 lt!310952 (_2!9206 lt!310342))))

(assert (=> d!67801 (= lt!310947 (lemmaIsPrefixTransitive!0 lt!310952 (_2!9206 lt!310334) (_2!9206 lt!310342)))))

(declare-fun lt!310949 () Unit!14060)

(declare-fun e!136670 () Unit!14060)

(assert (=> d!67801 (= lt!310949 e!136670)))

(declare-fun c!9928 () Bool)

(assert (=> d!67801 (= c!9928 (not (= (size!4457 (buf!4949 (_2!9206 lt!310334))) #b00000000000000000000000000000000)))))

(declare-fun lt!310954 () Unit!14060)

(declare-fun lt!310946 () Unit!14060)

(assert (=> d!67801 (= lt!310954 lt!310946)))

(assert (=> d!67801 (isPrefixOf!0 (_2!9206 lt!310342) (_2!9206 lt!310342))))

(assert (=> d!67801 (= lt!310946 (lemmaIsPrefixRefl!0 (_2!9206 lt!310342)))))

(declare-fun lt!310951 () Unit!14060)

(declare-fun lt!310956 () Unit!14060)

(assert (=> d!67801 (= lt!310951 lt!310956)))

(assert (=> d!67801 (= lt!310956 (lemmaIsPrefixRefl!0 (_2!9206 lt!310342)))))

(declare-fun lt!310948 () Unit!14060)

(declare-fun lt!310943 () Unit!14060)

(assert (=> d!67801 (= lt!310948 lt!310943)))

(assert (=> d!67801 (isPrefixOf!0 lt!310952 lt!310952)))

(assert (=> d!67801 (= lt!310943 (lemmaIsPrefixRefl!0 lt!310952))))

(declare-fun lt!310940 () Unit!14060)

(declare-fun lt!310955 () Unit!14060)

(assert (=> d!67801 (= lt!310940 lt!310955)))

(assert (=> d!67801 (isPrefixOf!0 (_2!9206 lt!310334) (_2!9206 lt!310334))))

(assert (=> d!67801 (= lt!310955 (lemmaIsPrefixRefl!0 (_2!9206 lt!310334)))))

(assert (=> d!67801 (= lt!310952 (BitStream!8023 (buf!4949 (_2!9206 lt!310342)) (currentByte!9296 (_2!9206 lt!310334)) (currentBit!9291 (_2!9206 lt!310334))))))

(assert (=> d!67801 (isPrefixOf!0 (_2!9206 lt!310334) (_2!9206 lt!310342))))

(assert (=> d!67801 (= (reader!0 (_2!9206 lt!310334) (_2!9206 lt!310342)) lt!310950)))

(declare-fun lt!310953 () (_ BitVec 64))

(declare-fun lt!310957 () (_ BitVec 64))

(declare-fun b!199160 () Bool)

(assert (=> b!199160 (= e!136669 (= (_1!9207 lt!310950) (withMovedBitIndex!0 (_2!9207 lt!310950) (bvsub lt!310957 lt!310953))))))

(assert (=> b!199160 (or (= (bvand lt!310957 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310953 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!310957 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!310957 lt!310953) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199160 (= lt!310953 (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310342))) (currentByte!9296 (_2!9206 lt!310342)) (currentBit!9291 (_2!9206 lt!310342))))))

(assert (=> b!199160 (= lt!310957 (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310334))) (currentByte!9296 (_2!9206 lt!310334)) (currentBit!9291 (_2!9206 lt!310334))))))

(declare-fun b!199161 () Bool)

(declare-fun res!166719 () Bool)

(assert (=> b!199161 (=> (not res!166719) (not e!136669))))

(assert (=> b!199161 (= res!166719 (isPrefixOf!0 (_1!9207 lt!310950) (_2!9206 lt!310334)))))

(declare-fun b!199162 () Bool)

(declare-fun lt!310939 () Unit!14060)

(assert (=> b!199162 (= e!136670 lt!310939)))

(declare-fun lt!310945 () (_ BitVec 64))

(assert (=> b!199162 (= lt!310945 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!310942 () (_ BitVec 64))

(assert (=> b!199162 (= lt!310942 (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310334))) (currentByte!9296 (_2!9206 lt!310334)) (currentBit!9291 (_2!9206 lt!310334))))))

(assert (=> b!199162 (= lt!310939 (arrayBitRangesEqSymmetric!0 (buf!4949 (_2!9206 lt!310334)) (buf!4949 (_2!9206 lt!310342)) lt!310945 lt!310942))))

(assert (=> b!199162 (arrayBitRangesEq!0 (buf!4949 (_2!9206 lt!310342)) (buf!4949 (_2!9206 lt!310334)) lt!310945 lt!310942)))

(declare-fun b!199163 () Bool)

(declare-fun Unit!14114 () Unit!14060)

(assert (=> b!199163 (= e!136670 Unit!14114)))

(assert (= (and d!67801 c!9928) b!199162))

(assert (= (and d!67801 (not c!9928)) b!199163))

(assert (= (and d!67801 res!166718) b!199161))

(assert (= (and b!199161 res!166719) b!199159))

(assert (= (and b!199159 res!166717) b!199160))

(declare-fun m!308667 () Bool)

(assert (=> b!199159 m!308667))

(declare-fun m!308669 () Bool)

(assert (=> b!199160 m!308669))

(assert (=> b!199160 m!308143))

(assert (=> b!199160 m!308149))

(assert (=> b!199162 m!308149))

(declare-fun m!308671 () Bool)

(assert (=> b!199162 m!308671))

(declare-fun m!308673 () Bool)

(assert (=> b!199162 m!308673))

(declare-fun m!308675 () Bool)

(assert (=> d!67801 m!308675))

(declare-fun m!308677 () Bool)

(assert (=> d!67801 m!308677))

(declare-fun m!308679 () Bool)

(assert (=> d!67801 m!308679))

(assert (=> d!67801 m!308629))

(declare-fun m!308681 () Bool)

(assert (=> d!67801 m!308681))

(declare-fun m!308683 () Bool)

(assert (=> d!67801 m!308683))

(declare-fun m!308685 () Bool)

(assert (=> d!67801 m!308685))

(declare-fun m!308687 () Bool)

(assert (=> d!67801 m!308687))

(declare-fun m!308689 () Bool)

(assert (=> d!67801 m!308689))

(declare-fun m!308691 () Bool)

(assert (=> d!67801 m!308691))

(declare-fun m!308693 () Bool)

(assert (=> d!67801 m!308693))

(declare-fun m!308695 () Bool)

(assert (=> b!199161 m!308695))

(assert (=> b!198944 d!67801))

(declare-fun d!67803 () Bool)

(declare-fun lt!310958 () tuple2!17134)

(assert (=> d!67803 (= lt!310958 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!9207 lt!310339) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!310352 e!136539)))))

(assert (=> d!67803 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9207 lt!310339) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!310352 e!136539)) (tuple2!17121 (_2!9215 lt!310958) (_1!9215 lt!310958)))))

(declare-fun bs!16764 () Bool)

(assert (= bs!16764 d!67803))

(assert (=> bs!16764 m!308151))

(declare-fun m!308697 () Bool)

(assert (=> bs!16764 m!308697))

(assert (=> b!198944 d!67803))

(declare-fun d!67805 () Bool)

(declare-fun lt!310959 () tuple2!17120)

(declare-fun lt!310962 () tuple2!17120)

(assert (=> d!67805 (and (= (_2!9208 lt!310959) (_2!9208 lt!310962)) (= (_1!9208 lt!310959) (_1!9208 lt!310962)))))

(declare-fun lt!310963 () BitStream!8022)

(declare-fun lt!310960 () Unit!14060)

(declare-fun lt!310964 () Bool)

(declare-fun lt!310961 () (_ BitVec 64))

(assert (=> d!67805 (= lt!310960 (choose!56 (_1!9207 lt!310339) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!310352 lt!310959 (tuple2!17121 (_1!9208 lt!310959) (_2!9208 lt!310959)) (_1!9208 lt!310959) (_2!9208 lt!310959) lt!310964 lt!310963 lt!310961 lt!310962 (tuple2!17121 (_1!9208 lt!310962) (_2!9208 lt!310962)) (_1!9208 lt!310962) (_2!9208 lt!310962)))))

(assert (=> d!67805 (= lt!310962 (readNBitsLSBFirstsLoopPure!0 lt!310963 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!310961))))

(assert (=> d!67805 (= lt!310961 (bvor lt!310352 (ite lt!310964 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67805 (= lt!310963 (withMovedBitIndex!0 (_1!9207 lt!310339) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!67805 (= lt!310964 (_2!9209 (readBitPure!0 (_1!9207 lt!310339))))))

(assert (=> d!67805 (= lt!310959 (readNBitsLSBFirstsLoopPure!0 (_1!9207 lt!310339) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!310352))))

(assert (=> d!67805 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9207 lt!310339) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!310352) lt!310960)))

(declare-fun bs!16765 () Bool)

(assert (= bs!16765 d!67805))

(declare-fun m!308699 () Bool)

(assert (=> bs!16765 m!308699))

(assert (=> bs!16765 m!308197))

(declare-fun m!308701 () Bool)

(assert (=> bs!16765 m!308701))

(assert (=> bs!16765 m!308151))

(assert (=> bs!16765 m!308139))

(assert (=> b!198944 d!67805))

(declare-fun d!67807 () Bool)

(declare-fun e!136671 () Bool)

(assert (=> d!67807 e!136671))

(declare-fun res!166721 () Bool)

(assert (=> d!67807 (=> (not res!166721) (not e!136671))))

(declare-fun lt!310968 () (_ BitVec 64))

(declare-fun lt!310969 () (_ BitVec 64))

(declare-fun lt!310967 () (_ BitVec 64))

(assert (=> d!67807 (= res!166721 (= lt!310967 (bvsub lt!310968 lt!310969)))))

(assert (=> d!67807 (or (= (bvand lt!310968 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310969 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!310968 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!310968 lt!310969) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67807 (= lt!310969 (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310342)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!310342))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!310342)))))))

(declare-fun lt!310966 () (_ BitVec 64))

(declare-fun lt!310970 () (_ BitVec 64))

(assert (=> d!67807 (= lt!310968 (bvmul lt!310966 lt!310970))))

(assert (=> d!67807 (or (= lt!310966 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!310970 (bvsdiv (bvmul lt!310966 lt!310970) lt!310966)))))

(assert (=> d!67807 (= lt!310970 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67807 (= lt!310966 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310342)))))))

(assert (=> d!67807 (= lt!310967 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!310342))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!310342)))))))

(assert (=> d!67807 (invariant!0 (currentBit!9291 (_2!9206 lt!310342)) (currentByte!9296 (_2!9206 lt!310342)) (size!4457 (buf!4949 (_2!9206 lt!310342))))))

(assert (=> d!67807 (= (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310342))) (currentByte!9296 (_2!9206 lt!310342)) (currentBit!9291 (_2!9206 lt!310342))) lt!310967)))

(declare-fun b!199164 () Bool)

(declare-fun res!166720 () Bool)

(assert (=> b!199164 (=> (not res!166720) (not e!136671))))

(assert (=> b!199164 (= res!166720 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!310967))))

(declare-fun b!199165 () Bool)

(declare-fun lt!310965 () (_ BitVec 64))

(assert (=> b!199165 (= e!136671 (bvsle lt!310967 (bvmul lt!310965 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199165 (or (= lt!310965 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!310965 #b0000000000000000000000000000000000000000000000000000000000001000) lt!310965)))))

(assert (=> b!199165 (= lt!310965 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310342)))))))

(assert (= (and d!67807 res!166721) b!199164))

(assert (= (and b!199164 res!166720) b!199165))

(declare-fun m!308703 () Bool)

(assert (=> d!67807 m!308703))

(assert (=> d!67807 m!308169))

(assert (=> b!198944 d!67807))

(declare-fun d!67809 () Bool)

(declare-fun lt!310971 () tuple2!17132)

(assert (=> d!67809 (= lt!310971 (readBit!0 (_1!9207 lt!310339)))))

(assert (=> d!67809 (= (readBitPure!0 (_1!9207 lt!310339)) (tuple2!17123 (_2!9214 lt!310971) (_1!9214 lt!310971)))))

(declare-fun bs!16766 () Bool)

(assert (= bs!16766 d!67809))

(declare-fun m!308705 () Bool)

(assert (=> bs!16766 m!308705))

(assert (=> b!198944 d!67809))

(declare-fun d!67811 () Bool)

(assert (=> d!67811 (= (invariant!0 (currentBit!9291 lt!310357) (currentByte!9296 lt!310357) (size!4457 (buf!4949 (_2!9206 lt!310342)))) (and (bvsge (currentBit!9291 lt!310357) #b00000000000000000000000000000000) (bvslt (currentBit!9291 lt!310357) #b00000000000000000000000000001000) (bvsge (currentByte!9296 lt!310357) #b00000000000000000000000000000000) (or (bvslt (currentByte!9296 lt!310357) (size!4457 (buf!4949 (_2!9206 lt!310342)))) (and (= (currentBit!9291 lt!310357) #b00000000000000000000000000000000) (= (currentByte!9296 lt!310357) (size!4457 (buf!4949 (_2!9206 lt!310342))))))))))

(assert (=> b!198944 d!67811))

(declare-fun b!199166 () Bool)

(declare-fun res!166722 () Bool)

(declare-fun e!136672 () Bool)

(assert (=> b!199166 (=> (not res!166722) (not e!136672))))

(declare-fun lt!310984 () tuple2!17118)

(assert (=> b!199166 (= res!166722 (isPrefixOf!0 (_2!9207 lt!310984) (_2!9206 lt!310342)))))

(declare-fun d!67813 () Bool)

(assert (=> d!67813 e!136672))

(declare-fun res!166723 () Bool)

(assert (=> d!67813 (=> (not res!166723) (not e!136672))))

(assert (=> d!67813 (= res!166723 (isPrefixOf!0 (_1!9207 lt!310984) (_2!9207 lt!310984)))))

(declare-fun lt!310986 () BitStream!8022)

(assert (=> d!67813 (= lt!310984 (tuple2!17119 lt!310986 (_2!9206 lt!310342)))))

(declare-fun lt!310972 () Unit!14060)

(declare-fun lt!310975 () Unit!14060)

(assert (=> d!67813 (= lt!310972 lt!310975)))

(assert (=> d!67813 (isPrefixOf!0 lt!310986 (_2!9206 lt!310342))))

(assert (=> d!67813 (= lt!310975 (lemmaIsPrefixTransitive!0 lt!310986 (_2!9206 lt!310342) (_2!9206 lt!310342)))))

(declare-fun lt!310978 () Unit!14060)

(declare-fun lt!310981 () Unit!14060)

(assert (=> d!67813 (= lt!310978 lt!310981)))

(assert (=> d!67813 (isPrefixOf!0 lt!310986 (_2!9206 lt!310342))))

(assert (=> d!67813 (= lt!310981 (lemmaIsPrefixTransitive!0 lt!310986 (_2!9206 lt!309597) (_2!9206 lt!310342)))))

(declare-fun lt!310983 () Unit!14060)

(declare-fun e!136673 () Unit!14060)

(assert (=> d!67813 (= lt!310983 e!136673)))

(declare-fun c!9929 () Bool)

(assert (=> d!67813 (= c!9929 (not (= (size!4457 (buf!4949 (_2!9206 lt!309597))) #b00000000000000000000000000000000)))))

(declare-fun lt!310988 () Unit!14060)

(declare-fun lt!310980 () Unit!14060)

(assert (=> d!67813 (= lt!310988 lt!310980)))

(assert (=> d!67813 (isPrefixOf!0 (_2!9206 lt!310342) (_2!9206 lt!310342))))

(assert (=> d!67813 (= lt!310980 (lemmaIsPrefixRefl!0 (_2!9206 lt!310342)))))

(declare-fun lt!310985 () Unit!14060)

(declare-fun lt!310990 () Unit!14060)

(assert (=> d!67813 (= lt!310985 lt!310990)))

(assert (=> d!67813 (= lt!310990 (lemmaIsPrefixRefl!0 (_2!9206 lt!310342)))))

(declare-fun lt!310982 () Unit!14060)

(declare-fun lt!310977 () Unit!14060)

(assert (=> d!67813 (= lt!310982 lt!310977)))

(assert (=> d!67813 (isPrefixOf!0 lt!310986 lt!310986)))

(assert (=> d!67813 (= lt!310977 (lemmaIsPrefixRefl!0 lt!310986))))

(declare-fun lt!310974 () Unit!14060)

(declare-fun lt!310989 () Unit!14060)

(assert (=> d!67813 (= lt!310974 lt!310989)))

(assert (=> d!67813 (isPrefixOf!0 (_2!9206 lt!309597) (_2!9206 lt!309597))))

(assert (=> d!67813 (= lt!310989 (lemmaIsPrefixRefl!0 (_2!9206 lt!309597)))))

(assert (=> d!67813 (= lt!310986 (BitStream!8023 (buf!4949 (_2!9206 lt!310342)) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))))))

(assert (=> d!67813 (isPrefixOf!0 (_2!9206 lt!309597) (_2!9206 lt!310342))))

(assert (=> d!67813 (= (reader!0 (_2!9206 lt!309597) (_2!9206 lt!310342)) lt!310984)))

(declare-fun b!199167 () Bool)

(declare-fun lt!310987 () (_ BitVec 64))

(declare-fun lt!310991 () (_ BitVec 64))

(assert (=> b!199167 (= e!136672 (= (_1!9207 lt!310984) (withMovedBitIndex!0 (_2!9207 lt!310984) (bvsub lt!310991 lt!310987))))))

(assert (=> b!199167 (or (= (bvand lt!310991 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310987 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!310991 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!310991 lt!310987) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199167 (= lt!310987 (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310342))) (currentByte!9296 (_2!9206 lt!310342)) (currentBit!9291 (_2!9206 lt!310342))))))

(assert (=> b!199167 (= lt!310991 (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))))))

(declare-fun b!199168 () Bool)

(declare-fun res!166724 () Bool)

(assert (=> b!199168 (=> (not res!166724) (not e!136672))))

(assert (=> b!199168 (= res!166724 (isPrefixOf!0 (_1!9207 lt!310984) (_2!9206 lt!309597)))))

(declare-fun b!199169 () Bool)

(declare-fun lt!310973 () Unit!14060)

(assert (=> b!199169 (= e!136673 lt!310973)))

(declare-fun lt!310979 () (_ BitVec 64))

(assert (=> b!199169 (= lt!310979 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!310976 () (_ BitVec 64))

(assert (=> b!199169 (= lt!310976 (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))))))

(assert (=> b!199169 (= lt!310973 (arrayBitRangesEqSymmetric!0 (buf!4949 (_2!9206 lt!309597)) (buf!4949 (_2!9206 lt!310342)) lt!310979 lt!310976))))

(assert (=> b!199169 (arrayBitRangesEq!0 (buf!4949 (_2!9206 lt!310342)) (buf!4949 (_2!9206 lt!309597)) lt!310979 lt!310976)))

(declare-fun b!199170 () Bool)

(declare-fun Unit!14115 () Unit!14060)

(assert (=> b!199170 (= e!136673 Unit!14115)))

(assert (= (and d!67813 c!9929) b!199169))

(assert (= (and d!67813 (not c!9929)) b!199170))

(assert (= (and d!67813 res!166723) b!199168))

(assert (= (and b!199168 res!166724) b!199166))

(assert (= (and b!199166 res!166722) b!199167))

(declare-fun m!308707 () Bool)

(assert (=> b!199166 m!308707))

(declare-fun m!308709 () Bool)

(assert (=> b!199167 m!308709))

(assert (=> b!199167 m!308143))

(assert (=> b!199167 m!307607))

(assert (=> b!199169 m!307607))

(declare-fun m!308711 () Bool)

(assert (=> b!199169 m!308711))

(declare-fun m!308713 () Bool)

(assert (=> b!199169 m!308713))

(declare-fun m!308715 () Bool)

(assert (=> d!67813 m!308715))

(declare-fun m!308717 () Bool)

(assert (=> d!67813 m!308717))

(declare-fun m!308719 () Bool)

(assert (=> d!67813 m!308719))

(assert (=> d!67813 m!307801))

(declare-fun m!308721 () Bool)

(assert (=> d!67813 m!308721))

(assert (=> d!67813 m!308157))

(declare-fun m!308723 () Bool)

(assert (=> d!67813 m!308723))

(assert (=> d!67813 m!308687))

(assert (=> d!67813 m!307807))

(assert (=> d!67813 m!308691))

(declare-fun m!308725 () Bool)

(assert (=> d!67813 m!308725))

(declare-fun m!308727 () Bool)

(assert (=> b!199168 m!308727))

(assert (=> b!198944 d!67813))

(declare-fun lt!310992 () tuple2!17134)

(declare-fun d!67815 () Bool)

(assert (=> d!67815 (= lt!310992 (readNBitsLSBFirstsLoop!0 (_1!9207 lt!310339) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!310352))))

(assert (=> d!67815 (= (readNBitsLSBFirstsLoopPure!0 (_1!9207 lt!310339) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!310352) (tuple2!17121 (_2!9215 lt!310992) (_1!9215 lt!310992)))))

(declare-fun bs!16767 () Bool)

(assert (= bs!16767 d!67815))

(declare-fun m!308729 () Bool)

(assert (=> bs!16767 m!308729))

(assert (=> b!198944 d!67815))

(declare-fun d!67817 () Bool)

(declare-fun lt!310993 () tuple2!17132)

(assert (=> d!67817 (= lt!310993 (readBit!0 lt!310357))))

(assert (=> d!67817 (= (readBitPure!0 lt!310357) (tuple2!17123 (_2!9214 lt!310993) (_1!9214 lt!310993)))))

(declare-fun bs!16768 () Bool)

(assert (= bs!16768 d!67817))

(declare-fun m!308731 () Bool)

(assert (=> bs!16768 m!308731))

(assert (=> b!198944 d!67817))

(declare-fun d!67819 () Bool)

(declare-fun e!136674 () Bool)

(assert (=> d!67819 e!136674))

(declare-fun res!166725 () Bool)

(assert (=> d!67819 (=> (not res!166725) (not e!136674))))

(declare-fun lt!310994 () BitStream!8022)

(declare-fun lt!310995 () (_ BitVec 64))

(assert (=> d!67819 (= res!166725 (= (bvadd lt!310995 (bvsub (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310342))) (currentByte!9296 (_2!9206 lt!310342)) (currentBit!9291 (_2!9206 lt!310342))))) (bitIndex!0 (size!4457 (buf!4949 lt!310994)) (currentByte!9296 lt!310994) (currentBit!9291 lt!310994))))))

(assert (=> d!67819 (or (not (= (bvand lt!310995 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310342))) (currentByte!9296 (_2!9206 lt!310342)) (currentBit!9291 (_2!9206 lt!310342)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!310995 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!310995 (bvsub (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310342))) (currentByte!9296 (_2!9206 lt!310342)) (currentBit!9291 (_2!9206 lt!310342))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67819 (= lt!310995 (bitIndex!0 (size!4457 (buf!4949 (_2!9207 lt!310339))) (currentByte!9296 (_2!9207 lt!310339)) (currentBit!9291 (_2!9207 lt!310339))))))

(assert (=> d!67819 (= lt!310994 (_2!9206 (moveBitIndex!0 (_2!9207 lt!310339) (bvsub (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310342))) (currentByte!9296 (_2!9206 lt!310342)) (currentBit!9291 (_2!9206 lt!310342)))))))))

(assert (=> d!67819 (moveBitIndexPrecond!0 (_2!9207 lt!310339) (bvsub (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310342))) (currentByte!9296 (_2!9206 lt!310342)) (currentBit!9291 (_2!9206 lt!310342)))))))

(assert (=> d!67819 (= (withMovedBitIndex!0 (_2!9207 lt!310339) (bvsub (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310342))) (currentByte!9296 (_2!9206 lt!310342)) (currentBit!9291 (_2!9206 lt!310342))))) lt!310994)))

(declare-fun b!199171 () Bool)

(assert (=> b!199171 (= e!136674 (= (size!4457 (buf!4949 (_2!9207 lt!310339))) (size!4457 (buf!4949 lt!310994))))))

(assert (= (and d!67819 res!166725) b!199171))

(declare-fun m!308733 () Bool)

(assert (=> d!67819 m!308733))

(declare-fun m!308735 () Bool)

(assert (=> d!67819 m!308735))

(declare-fun m!308737 () Bool)

(assert (=> d!67819 m!308737))

(declare-fun m!308739 () Bool)

(assert (=> d!67819 m!308739))

(assert (=> b!198944 d!67819))

(declare-fun d!67821 () Bool)

(declare-fun e!136675 () Bool)

(assert (=> d!67821 e!136675))

(declare-fun res!166726 () Bool)

(assert (=> d!67821 (=> (not res!166726) (not e!136675))))

(declare-fun lt!310997 () (_ BitVec 64))

(declare-fun lt!310996 () BitStream!8022)

(assert (=> d!67821 (= res!166726 (= (bvadd lt!310997 (bvsub (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310334))) (currentByte!9296 (_2!9206 lt!310334)) (currentBit!9291 (_2!9206 lt!310334))) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310342))) (currentByte!9296 (_2!9206 lt!310342)) (currentBit!9291 (_2!9206 lt!310342))))) (bitIndex!0 (size!4457 (buf!4949 lt!310996)) (currentByte!9296 lt!310996) (currentBit!9291 lt!310996))))))

(assert (=> d!67821 (or (not (= (bvand lt!310997 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310334))) (currentByte!9296 (_2!9206 lt!310334)) (currentBit!9291 (_2!9206 lt!310334))) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310342))) (currentByte!9296 (_2!9206 lt!310342)) (currentBit!9291 (_2!9206 lt!310342)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!310997 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!310997 (bvsub (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310334))) (currentByte!9296 (_2!9206 lt!310334)) (currentBit!9291 (_2!9206 lt!310334))) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310342))) (currentByte!9296 (_2!9206 lt!310342)) (currentBit!9291 (_2!9206 lt!310342))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67821 (= lt!310997 (bitIndex!0 (size!4457 (buf!4949 (_2!9207 lt!310365))) (currentByte!9296 (_2!9207 lt!310365)) (currentBit!9291 (_2!9207 lt!310365))))))

(assert (=> d!67821 (= lt!310996 (_2!9206 (moveBitIndex!0 (_2!9207 lt!310365) (bvsub (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310334))) (currentByte!9296 (_2!9206 lt!310334)) (currentBit!9291 (_2!9206 lt!310334))) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310342))) (currentByte!9296 (_2!9206 lt!310342)) (currentBit!9291 (_2!9206 lt!310342)))))))))

(assert (=> d!67821 (moveBitIndexPrecond!0 (_2!9207 lt!310365) (bvsub (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310334))) (currentByte!9296 (_2!9206 lt!310334)) (currentBit!9291 (_2!9206 lt!310334))) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310342))) (currentByte!9296 (_2!9206 lt!310342)) (currentBit!9291 (_2!9206 lt!310342)))))))

(assert (=> d!67821 (= (withMovedBitIndex!0 (_2!9207 lt!310365) (bvsub (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310334))) (currentByte!9296 (_2!9206 lt!310334)) (currentBit!9291 (_2!9206 lt!310334))) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310342))) (currentByte!9296 (_2!9206 lt!310342)) (currentBit!9291 (_2!9206 lt!310342))))) lt!310996)))

(declare-fun b!199172 () Bool)

(assert (=> b!199172 (= e!136675 (= (size!4457 (buf!4949 (_2!9207 lt!310365))) (size!4457 (buf!4949 lt!310996))))))

(assert (= (and d!67821 res!166726) b!199172))

(declare-fun m!308741 () Bool)

(assert (=> d!67821 m!308741))

(declare-fun m!308743 () Bool)

(assert (=> d!67821 m!308743))

(declare-fun m!308745 () Bool)

(assert (=> d!67821 m!308745))

(declare-fun m!308747 () Bool)

(assert (=> d!67821 m!308747))

(assert (=> b!198944 d!67821))

(declare-fun d!67823 () Bool)

(declare-fun e!136676 () Bool)

(assert (=> d!67823 e!136676))

(declare-fun res!166727 () Bool)

(assert (=> d!67823 (=> (not res!166727) (not e!136676))))

(declare-fun lt!310999 () (_ BitVec 64))

(declare-fun lt!310998 () BitStream!8022)

(assert (=> d!67823 (= res!166727 (= (bvadd lt!310999 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4457 (buf!4949 lt!310998)) (currentByte!9296 lt!310998) (currentBit!9291 lt!310998))))))

(assert (=> d!67823 (or (not (= (bvand lt!310999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!310999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!310999 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67823 (= lt!310999 (bitIndex!0 (size!4457 (buf!4949 (_1!9207 lt!310339))) (currentByte!9296 (_1!9207 lt!310339)) (currentBit!9291 (_1!9207 lt!310339))))))

(assert (=> d!67823 (= lt!310998 (_2!9206 (moveBitIndex!0 (_1!9207 lt!310339) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!67823 (moveBitIndexPrecond!0 (_1!9207 lt!310339) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!67823 (= (withMovedBitIndex!0 (_1!9207 lt!310339) #b0000000000000000000000000000000000000000000000000000000000000001) lt!310998)))

(declare-fun b!199173 () Bool)

(assert (=> b!199173 (= e!136676 (= (size!4457 (buf!4949 (_1!9207 lt!310339))) (size!4457 (buf!4949 lt!310998))))))

(assert (= (and d!67823 res!166727) b!199173))

(declare-fun m!308749 () Bool)

(assert (=> d!67823 m!308749))

(declare-fun m!308751 () Bool)

(assert (=> d!67823 m!308751))

(declare-fun m!308753 () Bool)

(assert (=> d!67823 m!308753))

(declare-fun m!308755 () Bool)

(assert (=> d!67823 m!308755))

(assert (=> b!198944 d!67823))

(assert (=> b!198944 d!67517))

(declare-fun d!67825 () Bool)

(assert (=> d!67825 (validate_offset_bits!1 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310342)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309597))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309597))) lt!310367)))

(declare-fun lt!311000 () Unit!14060)

(assert (=> d!67825 (= lt!311000 (choose!9 (_2!9206 lt!309597) (buf!4949 (_2!9206 lt!310342)) lt!310367 (BitStream!8023 (buf!4949 (_2!9206 lt!310342)) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597)))))))

(assert (=> d!67825 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9206 lt!309597) (buf!4949 (_2!9206 lt!310342)) lt!310367) lt!311000)))

(declare-fun bs!16769 () Bool)

(assert (= bs!16769 d!67825))

(assert (=> bs!16769 m!308201))

(declare-fun m!308757 () Bool)

(assert (=> bs!16769 m!308757))

(assert (=> b!198944 d!67825))

(declare-fun d!67827 () Bool)

(assert (=> d!67827 (isPrefixOf!0 (_2!9206 lt!309597) (_2!9206 lt!310342))))

(declare-fun lt!311001 () Unit!14060)

(assert (=> d!67827 (= lt!311001 (choose!30 (_2!9206 lt!309597) (_2!9206 lt!310334) (_2!9206 lt!310342)))))

(assert (=> d!67827 (isPrefixOf!0 (_2!9206 lt!309597) (_2!9206 lt!310334))))

(assert (=> d!67827 (= (lemmaIsPrefixTransitive!0 (_2!9206 lt!309597) (_2!9206 lt!310334) (_2!9206 lt!310342)) lt!311001)))

(declare-fun bs!16770 () Bool)

(assert (= bs!16770 d!67827))

(assert (=> bs!16770 m!308157))

(declare-fun m!308759 () Bool)

(assert (=> bs!16770 m!308759))

(declare-fun m!308761 () Bool)

(assert (=> bs!16770 m!308761))

(assert (=> b!198944 d!67827))

(declare-fun d!67829 () Bool)

(assert (=> d!67829 (validate_offset_bits!1 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310342)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!310334))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!310334))) lt!310345)))

(declare-fun lt!311002 () Unit!14060)

(assert (=> d!67829 (= lt!311002 (choose!9 (_2!9206 lt!310334) (buf!4949 (_2!9206 lt!310342)) lt!310345 (BitStream!8023 (buf!4949 (_2!9206 lt!310342)) (currentByte!9296 (_2!9206 lt!310334)) (currentBit!9291 (_2!9206 lt!310334)))))))

(assert (=> d!67829 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9206 lt!310334) (buf!4949 (_2!9206 lt!310342)) lt!310345) lt!311002)))

(declare-fun bs!16771 () Bool)

(assert (= bs!16771 d!67829))

(assert (=> bs!16771 m!308185))

(declare-fun m!308763 () Bool)

(assert (=> bs!16771 m!308763))

(assert (=> b!198944 d!67829))

(declare-fun d!67831 () Bool)

(assert (=> d!67831 (= (onesLSBLong!0 nBits!348) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!348))))))

(assert (=> b!198944 d!67831))

(declare-fun d!67833 () Bool)

(declare-fun e!136677 () Bool)

(assert (=> d!67833 e!136677))

(declare-fun res!166729 () Bool)

(assert (=> d!67833 (=> (not res!166729) (not e!136677))))

(declare-fun lt!311005 () (_ BitVec 64))

(declare-fun lt!311007 () (_ BitVec 64))

(declare-fun lt!311006 () (_ BitVec 64))

(assert (=> d!67833 (= res!166729 (= lt!311005 (bvsub lt!311006 lt!311007)))))

(assert (=> d!67833 (or (= (bvand lt!311006 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311007 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311006 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311006 lt!311007) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67833 (= lt!311007 (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 lt!309848))) ((_ sign_extend 32) (currentByte!9296 lt!309848)) ((_ sign_extend 32) (currentBit!9291 lt!309848))))))

(declare-fun lt!311004 () (_ BitVec 64))

(declare-fun lt!311008 () (_ BitVec 64))

(assert (=> d!67833 (= lt!311006 (bvmul lt!311004 lt!311008))))

(assert (=> d!67833 (or (= lt!311004 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311008 (bvsdiv (bvmul lt!311004 lt!311008) lt!311004)))))

(assert (=> d!67833 (= lt!311008 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67833 (= lt!311004 ((_ sign_extend 32) (size!4457 (buf!4949 lt!309848))))))

(assert (=> d!67833 (= lt!311005 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 lt!309848)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 lt!309848))))))

(assert (=> d!67833 (invariant!0 (currentBit!9291 lt!309848) (currentByte!9296 lt!309848) (size!4457 (buf!4949 lt!309848)))))

(assert (=> d!67833 (= (bitIndex!0 (size!4457 (buf!4949 lt!309848)) (currentByte!9296 lt!309848) (currentBit!9291 lt!309848)) lt!311005)))

(declare-fun b!199174 () Bool)

(declare-fun res!166728 () Bool)

(assert (=> b!199174 (=> (not res!166728) (not e!136677))))

(assert (=> b!199174 (= res!166728 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311005))))

(declare-fun b!199175 () Bool)

(declare-fun lt!311003 () (_ BitVec 64))

(assert (=> b!199175 (= e!136677 (bvsle lt!311005 (bvmul lt!311003 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199175 (or (= lt!311003 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311003 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311003)))))

(assert (=> b!199175 (= lt!311003 ((_ sign_extend 32) (size!4457 (buf!4949 lt!309848))))))

(assert (= (and d!67833 res!166729) b!199174))

(assert (= (and b!199174 res!166728) b!199175))

(declare-fun m!308765 () Bool)

(assert (=> d!67833 m!308765))

(declare-fun m!308767 () Bool)

(assert (=> d!67833 m!308767))

(assert (=> d!67557 d!67833))

(declare-fun d!67835 () Bool)

(declare-fun e!136678 () Bool)

(assert (=> d!67835 e!136678))

(declare-fun res!166731 () Bool)

(assert (=> d!67835 (=> (not res!166731) (not e!136678))))

(declare-fun lt!311012 () (_ BitVec 64))

(declare-fun lt!311011 () (_ BitVec 64))

(declare-fun lt!311013 () (_ BitVec 64))

(assert (=> d!67835 (= res!166731 (= lt!311011 (bvsub lt!311012 lt!311013)))))

(assert (=> d!67835 (or (= (bvand lt!311012 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311013 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311012 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311012 lt!311013) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67835 (= lt!311013 (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9207 lt!309604)))) ((_ sign_extend 32) (currentByte!9296 (_2!9207 lt!309604))) ((_ sign_extend 32) (currentBit!9291 (_2!9207 lt!309604)))))))

(declare-fun lt!311010 () (_ BitVec 64))

(declare-fun lt!311014 () (_ BitVec 64))

(assert (=> d!67835 (= lt!311012 (bvmul lt!311010 lt!311014))))

(assert (=> d!67835 (or (= lt!311010 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311014 (bvsdiv (bvmul lt!311010 lt!311014) lt!311010)))))

(assert (=> d!67835 (= lt!311014 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67835 (= lt!311010 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9207 lt!309604)))))))

(assert (=> d!67835 (= lt!311011 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 (_2!9207 lt!309604))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 (_2!9207 lt!309604)))))))

(assert (=> d!67835 (invariant!0 (currentBit!9291 (_2!9207 lt!309604)) (currentByte!9296 (_2!9207 lt!309604)) (size!4457 (buf!4949 (_2!9207 lt!309604))))))

(assert (=> d!67835 (= (bitIndex!0 (size!4457 (buf!4949 (_2!9207 lt!309604))) (currentByte!9296 (_2!9207 lt!309604)) (currentBit!9291 (_2!9207 lt!309604))) lt!311011)))

(declare-fun b!199176 () Bool)

(declare-fun res!166730 () Bool)

(assert (=> b!199176 (=> (not res!166730) (not e!136678))))

(assert (=> b!199176 (= res!166730 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311011))))

(declare-fun b!199177 () Bool)

(declare-fun lt!311009 () (_ BitVec 64))

(assert (=> b!199177 (= e!136678 (bvsle lt!311011 (bvmul lt!311009 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199177 (or (= lt!311009 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311009 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311009)))))

(assert (=> b!199177 (= lt!311009 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9207 lt!309604)))))))

(assert (= (and d!67835 res!166731) b!199176))

(assert (= (and b!199176 res!166730) b!199177))

(declare-fun m!308769 () Bool)

(assert (=> d!67835 m!308769))

(declare-fun m!308771 () Bool)

(assert (=> d!67835 m!308771))

(assert (=> d!67557 d!67835))

(declare-fun d!67837 () Bool)

(declare-fun lt!311032 () (_ BitVec 32))

(assert (=> d!67837 (= lt!311032 ((_ extract 31 0) (bvsrem (bvsub lt!309611 lt!309606) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!311030 () (_ BitVec 32))

(assert (=> d!67837 (= lt!311030 ((_ extract 31 0) (bvsdiv (bvsub lt!309611 lt!309606) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!136683 () Bool)

(assert (=> d!67837 e!136683))

(declare-fun res!166737 () Bool)

(assert (=> d!67837 (=> (not res!166737) (not e!136683))))

(assert (=> d!67837 (= res!166737 (moveBitIndexPrecond!0 (_2!9207 lt!309604) (bvsub lt!309611 lt!309606)))))

(declare-fun Unit!14116 () Unit!14060)

(declare-fun Unit!14117 () Unit!14060)

(declare-fun Unit!14118 () Unit!14060)

(assert (=> d!67837 (= (moveBitIndex!0 (_2!9207 lt!309604) (bvsub lt!309611 lt!309606)) (ite (bvslt (bvadd (currentBit!9291 (_2!9207 lt!309604)) lt!311032) #b00000000000000000000000000000000) (tuple2!17117 Unit!14116 (BitStream!8023 (buf!4949 (_2!9207 lt!309604)) (bvsub (bvadd (currentByte!9296 (_2!9207 lt!309604)) lt!311030) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!311032 (currentBit!9291 (_2!9207 lt!309604))))) (ite (bvsge (bvadd (currentBit!9291 (_2!9207 lt!309604)) lt!311032) #b00000000000000000000000000001000) (tuple2!17117 Unit!14117 (BitStream!8023 (buf!4949 (_2!9207 lt!309604)) (bvadd (currentByte!9296 (_2!9207 lt!309604)) lt!311030 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9291 (_2!9207 lt!309604)) lt!311032) #b00000000000000000000000000001000))) (tuple2!17117 Unit!14118 (BitStream!8023 (buf!4949 (_2!9207 lt!309604)) (bvadd (currentByte!9296 (_2!9207 lt!309604)) lt!311030) (bvadd (currentBit!9291 (_2!9207 lt!309604)) lt!311032))))))))

(declare-fun b!199182 () Bool)

(declare-fun e!136684 () Bool)

(assert (=> b!199182 (= e!136683 e!136684)))

(declare-fun res!166736 () Bool)

(assert (=> b!199182 (=> (not res!166736) (not e!136684))))

(declare-fun lt!311029 () tuple2!17116)

(declare-fun lt!311031 () (_ BitVec 64))

(assert (=> b!199182 (= res!166736 (= (bvadd lt!311031 (bvsub lt!309611 lt!309606)) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!311029))) (currentByte!9296 (_2!9206 lt!311029)) (currentBit!9291 (_2!9206 lt!311029)))))))

(assert (=> b!199182 (or (not (= (bvand lt!311031 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309611 lt!309606) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311031 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311031 (bvsub lt!309611 lt!309606)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199182 (= lt!311031 (bitIndex!0 (size!4457 (buf!4949 (_2!9207 lt!309604))) (currentByte!9296 (_2!9207 lt!309604)) (currentBit!9291 (_2!9207 lt!309604))))))

(declare-fun lt!311027 () (_ BitVec 32))

(declare-fun lt!311028 () (_ BitVec 32))

(declare-fun Unit!14119 () Unit!14060)

(declare-fun Unit!14120 () Unit!14060)

(declare-fun Unit!14121 () Unit!14060)

(assert (=> b!199182 (= lt!311029 (ite (bvslt (bvadd (currentBit!9291 (_2!9207 lt!309604)) lt!311027) #b00000000000000000000000000000000) (tuple2!17117 Unit!14119 (BitStream!8023 (buf!4949 (_2!9207 lt!309604)) (bvsub (bvadd (currentByte!9296 (_2!9207 lt!309604)) lt!311028) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!311027 (currentBit!9291 (_2!9207 lt!309604))))) (ite (bvsge (bvadd (currentBit!9291 (_2!9207 lt!309604)) lt!311027) #b00000000000000000000000000001000) (tuple2!17117 Unit!14120 (BitStream!8023 (buf!4949 (_2!9207 lt!309604)) (bvadd (currentByte!9296 (_2!9207 lt!309604)) lt!311028 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9291 (_2!9207 lt!309604)) lt!311027) #b00000000000000000000000000001000))) (tuple2!17117 Unit!14121 (BitStream!8023 (buf!4949 (_2!9207 lt!309604)) (bvadd (currentByte!9296 (_2!9207 lt!309604)) lt!311028) (bvadd (currentBit!9291 (_2!9207 lt!309604)) lt!311027))))))))

(assert (=> b!199182 (= lt!311027 ((_ extract 31 0) (bvsrem (bvsub lt!309611 lt!309606) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199182 (= lt!311028 ((_ extract 31 0) (bvsdiv (bvsub lt!309611 lt!309606) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!199183 () Bool)

(assert (=> b!199183 (= e!136684 (and (= (size!4457 (buf!4949 (_2!9207 lt!309604))) (size!4457 (buf!4949 (_2!9206 lt!311029)))) (= (buf!4949 (_2!9207 lt!309604)) (buf!4949 (_2!9206 lt!311029)))))))

(assert (= (and d!67837 res!166737) b!199182))

(assert (= (and b!199182 res!166736) b!199183))

(assert (=> d!67837 m!307843))

(declare-fun m!308773 () Bool)

(assert (=> b!199182 m!308773))

(assert (=> b!199182 m!307839))

(assert (=> d!67557 d!67837))

(declare-fun d!67841 () Bool)

(declare-fun res!166740 () Bool)

(declare-fun e!136687 () Bool)

(assert (=> d!67841 (=> (not res!166740) (not e!136687))))

(assert (=> d!67841 (= res!166740 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9207 lt!309604))))) (bvsub lt!309611 lt!309606)) (bvsle (bvsub lt!309611 lt!309606) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9207 lt!309604))))))))))

(assert (=> d!67841 (= (moveBitIndexPrecond!0 (_2!9207 lt!309604) (bvsub lt!309611 lt!309606)) e!136687)))

(declare-fun b!199187 () Bool)

(declare-fun lt!311035 () (_ BitVec 64))

(assert (=> b!199187 (= e!136687 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311035) (bvsle lt!311035 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9207 lt!309604))))))))))

(assert (=> b!199187 (= lt!311035 (bvadd (bitIndex!0 (size!4457 (buf!4949 (_2!9207 lt!309604))) (currentByte!9296 (_2!9207 lt!309604)) (currentBit!9291 (_2!9207 lt!309604))) (bvsub lt!309611 lt!309606)))))

(assert (= (and d!67841 res!166740) b!199187))

(assert (=> b!199187 m!307839))

(assert (=> d!67557 d!67841))

(declare-fun d!67843 () Bool)

(declare-fun lt!311041 () tuple2!17120)

(declare-fun lt!311040 () tuple2!17120)

(assert (=> d!67843 (and (= (_2!9208 lt!311041) (_2!9208 lt!311040)) (= (_1!9208 lt!311041) (_1!9208 lt!311040)))))

(declare-fun e!136690 () (_ BitVec 64))

(assert (=> d!67843 (= lt!311040 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9207 lt!309604) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd i!590 #b00000000000000000000000000000001) (bvor lt!309607 e!136690)))))

(declare-fun c!9932 () Bool)

(assert (=> d!67843 (= c!9932 (_2!9209 (readBitPure!0 (_1!9207 lt!309604))))))

(assert (=> d!67843 (= lt!311041 (readNBitsLSBFirstsLoopPure!0 (_1!9207 lt!309604) nBits!348 i!590 lt!309607))))

(assert (=> d!67843 true))

(declare-fun _$10!28 () Unit!14060)

(assert (=> d!67843 (= (choose!56 (_1!9207 lt!309604) nBits!348 i!590 lt!309607 lt!309875 (tuple2!17121 (_1!9208 lt!309875) (_2!9208 lt!309875)) (_1!9208 lt!309875) (_2!9208 lt!309875) lt!309880 lt!309879 lt!309877 lt!309878 (tuple2!17121 (_1!9208 lt!309878) (_2!9208 lt!309878)) (_1!9208 lt!309878) (_2!9208 lt!309878)) _$10!28)))

(declare-fun b!199192 () Bool)

(assert (=> b!199192 (= e!136690 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!199193 () Bool)

(assert (=> b!199193 (= e!136690 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and d!67843 c!9932) b!199192))

(assert (= (and d!67843 (not c!9932)) b!199193))

(assert (=> d!67843 m!307625))

(assert (=> d!67843 m!307625))

(declare-fun m!308775 () Bool)

(assert (=> d!67843 m!308775))

(assert (=> d!67843 m!307583))

(assert (=> d!67843 m!307599))

(assert (=> d!67569 d!67843))

(assert (=> d!67569 d!67573))

(assert (=> d!67569 d!67529))

(assert (=> d!67569 d!67549))

(declare-fun lt!311042 () tuple2!17134)

(declare-fun d!67845 () Bool)

(assert (=> d!67845 (= lt!311042 (readNBitsLSBFirstsLoop!0 lt!309879 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!309877))))

(assert (=> d!67845 (= (readNBitsLSBFirstsLoopPure!0 lt!309879 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!309877) (tuple2!17121 (_2!9215 lt!311042) (_1!9215 lt!311042)))))

(declare-fun bs!16773 () Bool)

(assert (= bs!16773 d!67845))

(declare-fun m!308777 () Bool)

(assert (=> bs!16773 m!308777))

(assert (=> d!67569 d!67845))

(declare-fun d!67847 () Bool)

(assert (=> d!67847 (= (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!309602)))) ((_ sign_extend 32) (currentByte!9296 (_1!9209 lt!309602))) ((_ sign_extend 32) (currentBit!9291 (_1!9209 lt!309602)))) (bvsub (bvmul ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!309602)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 (_1!9209 lt!309602))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 (_1!9209 lt!309602))))))))

(assert (=> d!67523 d!67847))

(declare-fun d!67849 () Bool)

(assert (=> d!67849 (= (invariant!0 (currentBit!9291 (_1!9209 lt!309602)) (currentByte!9296 (_1!9209 lt!309602)) (size!4457 (buf!4949 (_1!9209 lt!309602)))) (and (bvsge (currentBit!9291 (_1!9209 lt!309602)) #b00000000000000000000000000000000) (bvslt (currentBit!9291 (_1!9209 lt!309602)) #b00000000000000000000000000001000) (bvsge (currentByte!9296 (_1!9209 lt!309602)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9296 (_1!9209 lt!309602)) (size!4457 (buf!4949 (_1!9209 lt!309602)))) (and (= (currentBit!9291 (_1!9209 lt!309602)) #b00000000000000000000000000000000) (= (currentByte!9296 (_1!9209 lt!309602)) (size!4457 (buf!4949 (_1!9209 lt!309602))))))))))

(assert (=> d!67523 d!67849))

(declare-fun d!67851 () Bool)

(declare-fun e!136691 () Bool)

(assert (=> d!67851 e!136691))

(declare-fun res!166742 () Bool)

(assert (=> d!67851 (=> (not res!166742) (not e!136691))))

(declare-fun lt!311046 () (_ BitVec 64))

(declare-fun lt!311047 () (_ BitVec 64))

(declare-fun lt!311045 () (_ BitVec 64))

(assert (=> d!67851 (= res!166742 (= lt!311045 (bvsub lt!311046 lt!311047)))))

(assert (=> d!67851 (or (= (bvand lt!311046 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311047 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311046 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311046 lt!311047) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67851 (= lt!311047 (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309859)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309859))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309859)))))))

(declare-fun lt!311044 () (_ BitVec 64))

(declare-fun lt!311048 () (_ BitVec 64))

(assert (=> d!67851 (= lt!311046 (bvmul lt!311044 lt!311048))))

(assert (=> d!67851 (or (= lt!311044 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311048 (bvsdiv (bvmul lt!311044 lt!311048) lt!311044)))))

(assert (=> d!67851 (= lt!311048 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67851 (= lt!311044 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309859)))))))

(assert (=> d!67851 (= lt!311045 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309859))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309859)))))))

(assert (=> d!67851 (invariant!0 (currentBit!9291 (_2!9206 lt!309859)) (currentByte!9296 (_2!9206 lt!309859)) (size!4457 (buf!4949 (_2!9206 lt!309859))))))

(assert (=> d!67851 (= (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309859))) (currentByte!9296 (_2!9206 lt!309859)) (currentBit!9291 (_2!9206 lt!309859))) lt!311045)))

(declare-fun b!199194 () Bool)

(declare-fun res!166741 () Bool)

(assert (=> b!199194 (=> (not res!166741) (not e!136691))))

(assert (=> b!199194 (= res!166741 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311045))))

(declare-fun b!199195 () Bool)

(declare-fun lt!311043 () (_ BitVec 64))

(assert (=> b!199195 (= e!136691 (bvsle lt!311045 (bvmul lt!311043 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199195 (or (= lt!311043 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311043 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311043)))))

(assert (=> b!199195 (= lt!311043 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309859)))))))

(assert (= (and d!67851 res!166742) b!199194))

(assert (= (and b!199194 res!166741) b!199195))

(declare-fun m!308779 () Bool)

(assert (=> d!67851 m!308779))

(declare-fun m!308781 () Bool)

(assert (=> d!67851 m!308781))

(assert (=> b!198771 d!67851))

(assert (=> b!198771 d!67519))

(assert (=> b!198938 d!67775))

(declare-fun d!67853 () Bool)

(assert (=> d!67853 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310327)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309597))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309597))) lt!310364) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310327)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309597))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309597)))) lt!310364))))

(declare-fun bs!16774 () Bool)

(assert (= bs!16774 d!67853))

(declare-fun m!308783 () Bool)

(assert (=> bs!16774 m!308783))

(assert (=> b!198938 d!67853))

(declare-fun d!67855 () Bool)

(declare-fun lt!311049 () tuple2!17134)

(assert (=> d!67855 (= lt!311049 (readNBitsLSBFirstsLoop!0 (_1!9207 lt!310372) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(assert (=> d!67855 (= (readNBitsLSBFirstsLoopPure!0 (_1!9207 lt!310372) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))) (tuple2!17121 (_2!9215 lt!311049) (_1!9215 lt!311049)))))

(declare-fun bs!16775 () Bool)

(assert (= bs!16775 d!67855))

(declare-fun m!308785 () Bool)

(assert (=> bs!16775 m!308785))

(assert (=> b!198938 d!67855))

(declare-fun b!199196 () Bool)

(declare-fun res!166743 () Bool)

(declare-fun e!136692 () Bool)

(assert (=> b!199196 (=> (not res!166743) (not e!136692))))

(declare-fun lt!311062 () tuple2!17118)

(assert (=> b!199196 (= res!166743 (isPrefixOf!0 (_2!9207 lt!311062) (_2!9206 lt!310327)))))

(declare-fun d!67857 () Bool)

(assert (=> d!67857 e!136692))

(declare-fun res!166744 () Bool)

(assert (=> d!67857 (=> (not res!166744) (not e!136692))))

(assert (=> d!67857 (= res!166744 (isPrefixOf!0 (_1!9207 lt!311062) (_2!9207 lt!311062)))))

(declare-fun lt!311064 () BitStream!8022)

(assert (=> d!67857 (= lt!311062 (tuple2!17119 lt!311064 (_2!9206 lt!310327)))))

(declare-fun lt!311050 () Unit!14060)

(declare-fun lt!311053 () Unit!14060)

(assert (=> d!67857 (= lt!311050 lt!311053)))

(assert (=> d!67857 (isPrefixOf!0 lt!311064 (_2!9206 lt!310327))))

(assert (=> d!67857 (= lt!311053 (lemmaIsPrefixTransitive!0 lt!311064 (_2!9206 lt!310327) (_2!9206 lt!310327)))))

(declare-fun lt!311056 () Unit!14060)

(declare-fun lt!311059 () Unit!14060)

(assert (=> d!67857 (= lt!311056 lt!311059)))

(assert (=> d!67857 (isPrefixOf!0 lt!311064 (_2!9206 lt!310327))))

(assert (=> d!67857 (= lt!311059 (lemmaIsPrefixTransitive!0 lt!311064 (_2!9206 lt!309597) (_2!9206 lt!310327)))))

(declare-fun lt!311061 () Unit!14060)

(declare-fun e!136693 () Unit!14060)

(assert (=> d!67857 (= lt!311061 e!136693)))

(declare-fun c!9933 () Bool)

(assert (=> d!67857 (= c!9933 (not (= (size!4457 (buf!4949 (_2!9206 lt!309597))) #b00000000000000000000000000000000)))))

(declare-fun lt!311066 () Unit!14060)

(declare-fun lt!311058 () Unit!14060)

(assert (=> d!67857 (= lt!311066 lt!311058)))

(assert (=> d!67857 (isPrefixOf!0 (_2!9206 lt!310327) (_2!9206 lt!310327))))

(assert (=> d!67857 (= lt!311058 (lemmaIsPrefixRefl!0 (_2!9206 lt!310327)))))

(declare-fun lt!311063 () Unit!14060)

(declare-fun lt!311068 () Unit!14060)

(assert (=> d!67857 (= lt!311063 lt!311068)))

(assert (=> d!67857 (= lt!311068 (lemmaIsPrefixRefl!0 (_2!9206 lt!310327)))))

(declare-fun lt!311060 () Unit!14060)

(declare-fun lt!311055 () Unit!14060)

(assert (=> d!67857 (= lt!311060 lt!311055)))

(assert (=> d!67857 (isPrefixOf!0 lt!311064 lt!311064)))

(assert (=> d!67857 (= lt!311055 (lemmaIsPrefixRefl!0 lt!311064))))

(declare-fun lt!311052 () Unit!14060)

(declare-fun lt!311067 () Unit!14060)

(assert (=> d!67857 (= lt!311052 lt!311067)))

(assert (=> d!67857 (isPrefixOf!0 (_2!9206 lt!309597) (_2!9206 lt!309597))))

(assert (=> d!67857 (= lt!311067 (lemmaIsPrefixRefl!0 (_2!9206 lt!309597)))))

(assert (=> d!67857 (= lt!311064 (BitStream!8023 (buf!4949 (_2!9206 lt!310327)) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))))))

(assert (=> d!67857 (isPrefixOf!0 (_2!9206 lt!309597) (_2!9206 lt!310327))))

(assert (=> d!67857 (= (reader!0 (_2!9206 lt!309597) (_2!9206 lt!310327)) lt!311062)))

(declare-fun lt!311065 () (_ BitVec 64))

(declare-fun b!199197 () Bool)

(declare-fun lt!311069 () (_ BitVec 64))

(assert (=> b!199197 (= e!136692 (= (_1!9207 lt!311062) (withMovedBitIndex!0 (_2!9207 lt!311062) (bvsub lt!311069 lt!311065))))))

(assert (=> b!199197 (or (= (bvand lt!311069 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311065 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311069 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311069 lt!311065) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199197 (= lt!311065 (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310327))) (currentByte!9296 (_2!9206 lt!310327)) (currentBit!9291 (_2!9206 lt!310327))))))

(assert (=> b!199197 (= lt!311069 (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))))))

(declare-fun b!199198 () Bool)

(declare-fun res!166745 () Bool)

(assert (=> b!199198 (=> (not res!166745) (not e!136692))))

(assert (=> b!199198 (= res!166745 (isPrefixOf!0 (_1!9207 lt!311062) (_2!9206 lt!309597)))))

(declare-fun b!199199 () Bool)

(declare-fun lt!311051 () Unit!14060)

(assert (=> b!199199 (= e!136693 lt!311051)))

(declare-fun lt!311057 () (_ BitVec 64))

(assert (=> b!199199 (= lt!311057 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!311054 () (_ BitVec 64))

(assert (=> b!199199 (= lt!311054 (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))))))

(assert (=> b!199199 (= lt!311051 (arrayBitRangesEqSymmetric!0 (buf!4949 (_2!9206 lt!309597)) (buf!4949 (_2!9206 lt!310327)) lt!311057 lt!311054))))

(assert (=> b!199199 (arrayBitRangesEq!0 (buf!4949 (_2!9206 lt!310327)) (buf!4949 (_2!9206 lt!309597)) lt!311057 lt!311054)))

(declare-fun b!199200 () Bool)

(declare-fun Unit!14122 () Unit!14060)

(assert (=> b!199200 (= e!136693 Unit!14122)))

(assert (= (and d!67857 c!9933) b!199199))

(assert (= (and d!67857 (not c!9933)) b!199200))

(assert (= (and d!67857 res!166744) b!199198))

(assert (= (and b!199198 res!166745) b!199196))

(assert (= (and b!199196 res!166743) b!199197))

(declare-fun m!308787 () Bool)

(assert (=> b!199196 m!308787))

(declare-fun m!308789 () Bool)

(assert (=> b!199197 m!308789))

(assert (=> b!199197 m!308121))

(assert (=> b!199197 m!307607))

(assert (=> b!199199 m!307607))

(declare-fun m!308791 () Bool)

(assert (=> b!199199 m!308791))

(declare-fun m!308793 () Bool)

(assert (=> b!199199 m!308793))

(declare-fun m!308795 () Bool)

(assert (=> d!67857 m!308795))

(declare-fun m!308797 () Bool)

(assert (=> d!67857 m!308797))

(declare-fun m!308799 () Bool)

(assert (=> d!67857 m!308799))

(assert (=> d!67857 m!307801))

(declare-fun m!308801 () Bool)

(assert (=> d!67857 m!308801))

(assert (=> d!67857 m!308119))

(declare-fun m!308803 () Bool)

(assert (=> d!67857 m!308803))

(declare-fun m!308805 () Bool)

(assert (=> d!67857 m!308805))

(assert (=> d!67857 m!307807))

(declare-fun m!308807 () Bool)

(assert (=> d!67857 m!308807))

(declare-fun m!308809 () Bool)

(assert (=> d!67857 m!308809))

(declare-fun m!308811 () Bool)

(assert (=> b!199198 m!308811))

(assert (=> b!198938 d!67857))

(assert (=> b!198938 d!67831))

(declare-fun d!67859 () Bool)

(assert (=> d!67859 (validate_offset_bits!1 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310327)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309597))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309597))) lt!310364)))

(declare-fun lt!311070 () Unit!14060)

(assert (=> d!67859 (= lt!311070 (choose!9 (_2!9206 lt!309597) (buf!4949 (_2!9206 lt!310327)) lt!310364 (BitStream!8023 (buf!4949 (_2!9206 lt!310327)) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597)))))))

(assert (=> d!67859 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9206 lt!309597) (buf!4949 (_2!9206 lt!310327)) lt!310364) lt!311070)))

(declare-fun bs!16776 () Bool)

(assert (= bs!16776 d!67859))

(assert (=> bs!16776 m!308209))

(declare-fun m!308813 () Bool)

(assert (=> bs!16776 m!308813))

(assert (=> b!198938 d!67859))

(declare-fun d!67861 () Bool)

(assert (=> d!67861 (= (invariant!0 (currentBit!9291 (_2!9206 lt!309597)) (currentByte!9296 (_2!9206 lt!309597)) (size!4457 (buf!4949 (_2!9206 lt!309597)))) (and (bvsge (currentBit!9291 (_2!9206 lt!309597)) #b00000000000000000000000000000000) (bvslt (currentBit!9291 (_2!9206 lt!309597)) #b00000000000000000000000000001000) (bvsge (currentByte!9296 (_2!9206 lt!309597)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9296 (_2!9206 lt!309597)) (size!4457 (buf!4949 (_2!9206 lt!309597)))) (and (= (currentBit!9291 (_2!9206 lt!309597)) #b00000000000000000000000000000000) (= (currentByte!9296 (_2!9206 lt!309597)) (size!4457 (buf!4949 (_2!9206 lt!309597))))))))))

(assert (=> d!67567 d!67861))

(declare-fun d!67863 () Bool)

(declare-fun lt!311071 () tuple2!17132)

(assert (=> d!67863 (= lt!311071 (readBit!0 (readerFrom!0 (_2!9206 lt!309859) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204))))))

(assert (=> d!67863 (= (readBitPure!0 (readerFrom!0 (_2!9206 lt!309859) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204))) (tuple2!17123 (_2!9214 lt!311071) (_1!9214 lt!311071)))))

(declare-fun bs!16777 () Bool)

(assert (= bs!16777 d!67863))

(assert (=> bs!16777 m!307845))

(declare-fun m!308815 () Bool)

(assert (=> bs!16777 m!308815))

(assert (=> b!198773 d!67863))

(declare-fun d!67865 () Bool)

(declare-fun e!136694 () Bool)

(assert (=> d!67865 e!136694))

(declare-fun res!166746 () Bool)

(assert (=> d!67865 (=> (not res!166746) (not e!136694))))

(assert (=> d!67865 (= res!166746 (invariant!0 (currentBit!9291 (_2!9206 lt!309859)) (currentByte!9296 (_2!9206 lt!309859)) (size!4457 (buf!4949 (_2!9206 lt!309859)))))))

(assert (=> d!67865 (= (readerFrom!0 (_2!9206 lt!309859) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204)) (BitStream!8023 (buf!4949 (_2!9206 lt!309859)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)))))

(declare-fun b!199201 () Bool)

(assert (=> b!199201 (= e!136694 (invariant!0 (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204) (size!4457 (buf!4949 (_2!9206 lt!309859)))))))

(assert (= (and d!67865 res!166746) b!199201))

(assert (=> d!67865 m!308781))

(declare-fun m!308817 () Bool)

(assert (=> b!199201 m!308817))

(assert (=> b!198773 d!67865))

(declare-fun d!67867 () Bool)

(declare-fun e!136695 () Bool)

(assert (=> d!67867 e!136695))

(declare-fun res!166748 () Bool)

(assert (=> d!67867 (=> (not res!166748) (not e!136695))))

(declare-fun lt!311074 () (_ BitVec 64))

(declare-fun lt!311076 () (_ BitVec 64))

(declare-fun lt!311075 () (_ BitVec 64))

(assert (=> d!67867 (= res!166748 (= lt!311074 (bvsub lt!311075 lt!311076)))))

(assert (=> d!67867 (or (= (bvand lt!311075 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311076 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311075 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311075 lt!311076) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67867 (= lt!311076 (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 lt!309846))) ((_ sign_extend 32) (currentByte!9296 lt!309846)) ((_ sign_extend 32) (currentBit!9291 lt!309846))))))

(declare-fun lt!311073 () (_ BitVec 64))

(declare-fun lt!311077 () (_ BitVec 64))

(assert (=> d!67867 (= lt!311075 (bvmul lt!311073 lt!311077))))

(assert (=> d!67867 (or (= lt!311073 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311077 (bvsdiv (bvmul lt!311073 lt!311077) lt!311073)))))

(assert (=> d!67867 (= lt!311077 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67867 (= lt!311073 ((_ sign_extend 32) (size!4457 (buf!4949 lt!309846))))))

(assert (=> d!67867 (= lt!311074 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 lt!309846)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 lt!309846))))))

(assert (=> d!67867 (invariant!0 (currentBit!9291 lt!309846) (currentByte!9296 lt!309846) (size!4457 (buf!4949 lt!309846)))))

(assert (=> d!67867 (= (bitIndex!0 (size!4457 (buf!4949 lt!309846)) (currentByte!9296 lt!309846) (currentBit!9291 lt!309846)) lt!311074)))

(declare-fun b!199202 () Bool)

(declare-fun res!166747 () Bool)

(assert (=> b!199202 (=> (not res!166747) (not e!136695))))

(assert (=> b!199202 (= res!166747 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311074))))

(declare-fun b!199203 () Bool)

(declare-fun lt!311072 () (_ BitVec 64))

(assert (=> b!199203 (= e!136695 (bvsle lt!311074 (bvmul lt!311072 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199203 (or (= lt!311072 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311072 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311072)))))

(assert (=> b!199203 (= lt!311072 ((_ sign_extend 32) (size!4457 (buf!4949 lt!309846))))))

(assert (= (and d!67867 res!166748) b!199202))

(assert (= (and b!199202 res!166747) b!199203))

(declare-fun m!308819 () Bool)

(assert (=> d!67867 m!308819))

(declare-fun m!308821 () Bool)

(assert (=> d!67867 m!308821))

(assert (=> d!67553 d!67867))

(declare-fun d!67869 () Bool)

(declare-fun e!136696 () Bool)

(assert (=> d!67869 e!136696))

(declare-fun res!166750 () Bool)

(assert (=> d!67869 (=> (not res!166750) (not e!136696))))

(declare-fun lt!311080 () (_ BitVec 64))

(declare-fun lt!311082 () (_ BitVec 64))

(declare-fun lt!311081 () (_ BitVec 64))

(assert (=> d!67869 (= res!166750 (= lt!311080 (bvsub lt!311081 lt!311082)))))

(assert (=> d!67869 (or (= (bvand lt!311081 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311082 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311081 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311081 lt!311082) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67869 (= lt!311082 (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9207 lt!309590)))) ((_ sign_extend 32) (currentByte!9296 (_2!9207 lt!309590))) ((_ sign_extend 32) (currentBit!9291 (_2!9207 lt!309590)))))))

(declare-fun lt!311079 () (_ BitVec 64))

(declare-fun lt!311083 () (_ BitVec 64))

(assert (=> d!67869 (= lt!311081 (bvmul lt!311079 lt!311083))))

(assert (=> d!67869 (or (= lt!311079 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311083 (bvsdiv (bvmul lt!311079 lt!311083) lt!311079)))))

(assert (=> d!67869 (= lt!311083 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67869 (= lt!311079 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9207 lt!309590)))))))

(assert (=> d!67869 (= lt!311080 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 (_2!9207 lt!309590))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 (_2!9207 lt!309590)))))))

(assert (=> d!67869 (invariant!0 (currentBit!9291 (_2!9207 lt!309590)) (currentByte!9296 (_2!9207 lt!309590)) (size!4457 (buf!4949 (_2!9207 lt!309590))))))

(assert (=> d!67869 (= (bitIndex!0 (size!4457 (buf!4949 (_2!9207 lt!309590))) (currentByte!9296 (_2!9207 lt!309590)) (currentBit!9291 (_2!9207 lt!309590))) lt!311080)))

(declare-fun b!199204 () Bool)

(declare-fun res!166749 () Bool)

(assert (=> b!199204 (=> (not res!166749) (not e!136696))))

(assert (=> b!199204 (= res!166749 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311080))))

(declare-fun b!199205 () Bool)

(declare-fun lt!311078 () (_ BitVec 64))

(assert (=> b!199205 (= e!136696 (bvsle lt!311080 (bvmul lt!311078 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199205 (or (= lt!311078 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311078 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311078)))))

(assert (=> b!199205 (= lt!311078 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9207 lt!309590)))))))

(assert (= (and d!67869 res!166750) b!199204))

(assert (= (and b!199204 res!166749) b!199205))

(declare-fun m!308823 () Bool)

(assert (=> d!67869 m!308823))

(declare-fun m!308825 () Bool)

(assert (=> d!67869 m!308825))

(assert (=> d!67553 d!67869))

(declare-fun d!67871 () Bool)

(declare-fun lt!311089 () (_ BitVec 32))

(assert (=> d!67871 (= lt!311089 ((_ extract 31 0) (bvsrem (bvsub lt!309614 lt!309606) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!311087 () (_ BitVec 32))

(assert (=> d!67871 (= lt!311087 ((_ extract 31 0) (bvsdiv (bvsub lt!309614 lt!309606) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!136697 () Bool)

(assert (=> d!67871 e!136697))

(declare-fun res!166752 () Bool)

(assert (=> d!67871 (=> (not res!166752) (not e!136697))))

(assert (=> d!67871 (= res!166752 (moveBitIndexPrecond!0 (_2!9207 lt!309590) (bvsub lt!309614 lt!309606)))))

(declare-fun Unit!14123 () Unit!14060)

(declare-fun Unit!14124 () Unit!14060)

(declare-fun Unit!14125 () Unit!14060)

(assert (=> d!67871 (= (moveBitIndex!0 (_2!9207 lt!309590) (bvsub lt!309614 lt!309606)) (ite (bvslt (bvadd (currentBit!9291 (_2!9207 lt!309590)) lt!311089) #b00000000000000000000000000000000) (tuple2!17117 Unit!14123 (BitStream!8023 (buf!4949 (_2!9207 lt!309590)) (bvsub (bvadd (currentByte!9296 (_2!9207 lt!309590)) lt!311087) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!311089 (currentBit!9291 (_2!9207 lt!309590))))) (ite (bvsge (bvadd (currentBit!9291 (_2!9207 lt!309590)) lt!311089) #b00000000000000000000000000001000) (tuple2!17117 Unit!14124 (BitStream!8023 (buf!4949 (_2!9207 lt!309590)) (bvadd (currentByte!9296 (_2!9207 lt!309590)) lt!311087 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9291 (_2!9207 lt!309590)) lt!311089) #b00000000000000000000000000001000))) (tuple2!17117 Unit!14125 (BitStream!8023 (buf!4949 (_2!9207 lt!309590)) (bvadd (currentByte!9296 (_2!9207 lt!309590)) lt!311087) (bvadd (currentBit!9291 (_2!9207 lt!309590)) lt!311089))))))))

(declare-fun b!199206 () Bool)

(declare-fun e!136698 () Bool)

(assert (=> b!199206 (= e!136697 e!136698)))

(declare-fun res!166751 () Bool)

(assert (=> b!199206 (=> (not res!166751) (not e!136698))))

(declare-fun lt!311088 () (_ BitVec 64))

(declare-fun lt!311086 () tuple2!17116)

(assert (=> b!199206 (= res!166751 (= (bvadd lt!311088 (bvsub lt!309614 lt!309606)) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!311086))) (currentByte!9296 (_2!9206 lt!311086)) (currentBit!9291 (_2!9206 lt!311086)))))))

(assert (=> b!199206 (or (not (= (bvand lt!311088 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309614 lt!309606) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311088 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311088 (bvsub lt!309614 lt!309606)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199206 (= lt!311088 (bitIndex!0 (size!4457 (buf!4949 (_2!9207 lt!309590))) (currentByte!9296 (_2!9207 lt!309590)) (currentBit!9291 (_2!9207 lt!309590))))))

(declare-fun lt!311084 () (_ BitVec 32))

(declare-fun lt!311085 () (_ BitVec 32))

(declare-fun Unit!14126 () Unit!14060)

(declare-fun Unit!14127 () Unit!14060)

(declare-fun Unit!14128 () Unit!14060)

(assert (=> b!199206 (= lt!311086 (ite (bvslt (bvadd (currentBit!9291 (_2!9207 lt!309590)) lt!311084) #b00000000000000000000000000000000) (tuple2!17117 Unit!14126 (BitStream!8023 (buf!4949 (_2!9207 lt!309590)) (bvsub (bvadd (currentByte!9296 (_2!9207 lt!309590)) lt!311085) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!311084 (currentBit!9291 (_2!9207 lt!309590))))) (ite (bvsge (bvadd (currentBit!9291 (_2!9207 lt!309590)) lt!311084) #b00000000000000000000000000001000) (tuple2!17117 Unit!14127 (BitStream!8023 (buf!4949 (_2!9207 lt!309590)) (bvadd (currentByte!9296 (_2!9207 lt!309590)) lt!311085 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9291 (_2!9207 lt!309590)) lt!311084) #b00000000000000000000000000001000))) (tuple2!17117 Unit!14128 (BitStream!8023 (buf!4949 (_2!9207 lt!309590)) (bvadd (currentByte!9296 (_2!9207 lt!309590)) lt!311085) (bvadd (currentBit!9291 (_2!9207 lt!309590)) lt!311084))))))))

(assert (=> b!199206 (= lt!311084 ((_ extract 31 0) (bvsrem (bvsub lt!309614 lt!309606) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199206 (= lt!311085 ((_ extract 31 0) (bvsdiv (bvsub lt!309614 lt!309606) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!199207 () Bool)

(assert (=> b!199207 (= e!136698 (and (= (size!4457 (buf!4949 (_2!9207 lt!309590))) (size!4457 (buf!4949 (_2!9206 lt!311086)))) (= (buf!4949 (_2!9207 lt!309590)) (buf!4949 (_2!9206 lt!311086)))))))

(assert (= (and d!67871 res!166752) b!199206))

(assert (= (and b!199206 res!166751) b!199207))

(assert (=> d!67871 m!307833))

(declare-fun m!308827 () Bool)

(assert (=> b!199206 m!308827))

(assert (=> b!199206 m!307829))

(assert (=> d!67553 d!67871))

(declare-fun d!67873 () Bool)

(declare-fun res!166753 () Bool)

(declare-fun e!136699 () Bool)

(assert (=> d!67873 (=> (not res!166753) (not e!136699))))

(assert (=> d!67873 (= res!166753 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9207 lt!309590))))) (bvsub lt!309614 lt!309606)) (bvsle (bvsub lt!309614 lt!309606) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9207 lt!309590))))))))))

(assert (=> d!67873 (= (moveBitIndexPrecond!0 (_2!9207 lt!309590) (bvsub lt!309614 lt!309606)) e!136699)))

(declare-fun b!199208 () Bool)

(declare-fun lt!311090 () (_ BitVec 64))

(assert (=> b!199208 (= e!136699 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311090) (bvsle lt!311090 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9207 lt!309590))))))))))

(assert (=> b!199208 (= lt!311090 (bvadd (bitIndex!0 (size!4457 (buf!4949 (_2!9207 lt!309590))) (currentByte!9296 (_2!9207 lt!309590)) (currentBit!9291 (_2!9207 lt!309590))) (bvsub lt!309614 lt!309606)))))

(assert (= (and d!67873 res!166753) b!199208))

(assert (=> b!199208 m!307829))

(assert (=> d!67553 d!67873))

(declare-fun lt!311091 () tuple4!264)

(declare-fun e!136700 () Bool)

(declare-fun b!199209 () Bool)

(assert (=> b!199209 (= e!136700 (arrayRangesEq!694 (buf!4949 thiss!1204) (buf!4949 (_2!9206 lt!309597)) (_1!9220 lt!311091) (_2!9220 lt!311091)))))

(declare-fun d!67875 () Bool)

(declare-fun res!166758 () Bool)

(declare-fun e!136704 () Bool)

(assert (=> d!67875 (=> res!166758 e!136704)))

(assert (=> d!67875 (= res!166758 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4457 (buf!4949 thiss!1204)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204))))))

(assert (=> d!67875 (= (arrayBitRangesEq!0 (buf!4949 thiss!1204) (buf!4949 (_2!9206 lt!309597)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4457 (buf!4949 thiss!1204)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204))) e!136704)))

(declare-fun b!199210 () Bool)

(declare-fun res!166754 () Bool)

(declare-fun lt!311092 () (_ BitVec 32))

(assert (=> b!199210 (= res!166754 (= lt!311092 #b00000000000000000000000000000000))))

(declare-fun e!136703 () Bool)

(assert (=> b!199210 (=> res!166754 e!136703)))

(declare-fun e!136705 () Bool)

(assert (=> b!199210 (= e!136705 e!136703)))

(declare-fun b!199211 () Bool)

(declare-fun e!136702 () Bool)

(assert (=> b!199211 (= e!136702 e!136705)))

(declare-fun res!166757 () Bool)

(declare-fun call!3148 () Bool)

(assert (=> b!199211 (= res!166757 call!3148)))

(assert (=> b!199211 (=> (not res!166757) (not e!136705))))

(declare-fun bm!3145 () Bool)

(declare-fun lt!311093 () (_ BitVec 32))

(declare-fun c!9934 () Bool)

(assert (=> bm!3145 (= call!3148 (byteRangesEq!0 (select (arr!5387 (buf!4949 thiss!1204)) (_3!648 lt!311091)) (select (arr!5387 (buf!4949 (_2!9206 lt!309597))) (_3!648 lt!311091)) lt!311093 (ite c!9934 lt!311092 #b00000000000000000000000000001000)))))

(declare-fun b!199212 () Bool)

(assert (=> b!199212 (= e!136702 call!3148)))

(declare-fun b!199213 () Bool)

(declare-fun e!136701 () Bool)

(assert (=> b!199213 (= e!136701 e!136702)))

(assert (=> b!199213 (= c!9934 (= (_3!648 lt!311091) (_4!132 lt!311091)))))

(declare-fun b!199214 () Bool)

(assert (=> b!199214 (= e!136703 (byteRangesEq!0 (select (arr!5387 (buf!4949 thiss!1204)) (_4!132 lt!311091)) (select (arr!5387 (buf!4949 (_2!9206 lt!309597))) (_4!132 lt!311091)) #b00000000000000000000000000000000 lt!311092))))

(declare-fun b!199215 () Bool)

(assert (=> b!199215 (= e!136704 e!136701)))

(declare-fun res!166756 () Bool)

(assert (=> b!199215 (=> (not res!166756) (not e!136701))))

(assert (=> b!199215 (= res!166756 e!136700)))

(declare-fun res!166755 () Bool)

(assert (=> b!199215 (=> res!166755 e!136700)))

(assert (=> b!199215 (= res!166755 (bvsge (_1!9220 lt!311091) (_2!9220 lt!311091)))))

(assert (=> b!199215 (= lt!311092 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4457 (buf!4949 thiss!1204)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199215 (= lt!311093 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199215 (= lt!311091 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4457 (buf!4949 thiss!1204)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204))))))

(assert (= (and d!67875 (not res!166758)) b!199215))

(assert (= (and b!199215 (not res!166755)) b!199209))

(assert (= (and b!199215 res!166756) b!199213))

(assert (= (and b!199213 c!9934) b!199212))

(assert (= (and b!199213 (not c!9934)) b!199211))

(assert (= (and b!199211 res!166757) b!199210))

(assert (= (and b!199210 (not res!166754)) b!199214))

(assert (= (or b!199212 b!199211) bm!3145))

(declare-fun m!308829 () Bool)

(assert (=> b!199209 m!308829))

(declare-fun m!308831 () Bool)

(assert (=> bm!3145 m!308831))

(declare-fun m!308833 () Bool)

(assert (=> bm!3145 m!308833))

(assert (=> bm!3145 m!308831))

(assert (=> bm!3145 m!308833))

(declare-fun m!308835 () Bool)

(assert (=> bm!3145 m!308835))

(declare-fun m!308837 () Bool)

(assert (=> b!199214 m!308837))

(declare-fun m!308839 () Bool)

(assert (=> b!199214 m!308839))

(assert (=> b!199214 m!308837))

(assert (=> b!199214 m!308839))

(declare-fun m!308841 () Bool)

(assert (=> b!199214 m!308841))

(assert (=> b!199215 m!307609))

(declare-fun m!308843 () Bool)

(assert (=> b!199215 m!308843))

(assert (=> b!198760 d!67875))

(assert (=> b!198760 d!67519))

(declare-fun d!67877 () Bool)

(declare-fun e!136706 () Bool)

(assert (=> d!67877 e!136706))

(declare-fun res!166759 () Bool)

(assert (=> d!67877 (=> (not res!166759) (not e!136706))))

(assert (=> d!67877 (= res!166759 (= (buf!4949 (_2!9206 (increaseBitIndex!0 lt!309591))) (buf!4949 lt!309591)))))

(declare-fun lt!311099 () Bool)

(assert (=> d!67877 (= lt!311099 (not (= (bvand ((_ sign_extend 24) (select (arr!5387 (buf!4949 lt!309591)) (currentByte!9296 lt!309591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9291 lt!309591)))) #b00000000000000000000000000000000)))))

(declare-fun lt!311097 () tuple2!17132)

(assert (=> d!67877 (= lt!311097 (tuple2!17133 (not (= (bvand ((_ sign_extend 24) (select (arr!5387 (buf!4949 lt!309591)) (currentByte!9296 lt!309591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9291 lt!309591)))) #b00000000000000000000000000000000)) (_2!9206 (increaseBitIndex!0 lt!309591))))))

(assert (=> d!67877 (validate_offset_bit!0 ((_ sign_extend 32) (size!4457 (buf!4949 lt!309591))) ((_ sign_extend 32) (currentByte!9296 lt!309591)) ((_ sign_extend 32) (currentBit!9291 lt!309591)))))

(assert (=> d!67877 (= (readBit!0 lt!309591) lt!311097)))

(declare-fun b!199216 () Bool)

(declare-fun lt!311098 () (_ BitVec 64))

(declare-fun lt!311095 () (_ BitVec 64))

(assert (=> b!199216 (= e!136706 (= (bitIndex!0 (size!4457 (buf!4949 (_2!9206 (increaseBitIndex!0 lt!309591)))) (currentByte!9296 (_2!9206 (increaseBitIndex!0 lt!309591))) (currentBit!9291 (_2!9206 (increaseBitIndex!0 lt!309591)))) (bvadd lt!311098 lt!311095)))))

(assert (=> b!199216 (or (not (= (bvand lt!311098 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311095 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311098 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311098 lt!311095) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199216 (= lt!311095 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!199216 (= lt!311098 (bitIndex!0 (size!4457 (buf!4949 lt!309591)) (currentByte!9296 lt!309591) (currentBit!9291 lt!309591)))))

(declare-fun lt!311096 () Bool)

(assert (=> b!199216 (= lt!311096 (not (= (bvand ((_ sign_extend 24) (select (arr!5387 (buf!4949 lt!309591)) (currentByte!9296 lt!309591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9291 lt!309591)))) #b00000000000000000000000000000000)))))

(declare-fun lt!311100 () Bool)

(assert (=> b!199216 (= lt!311100 (not (= (bvand ((_ sign_extend 24) (select (arr!5387 (buf!4949 lt!309591)) (currentByte!9296 lt!309591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9291 lt!309591)))) #b00000000000000000000000000000000)))))

(declare-fun lt!311094 () Bool)

(assert (=> b!199216 (= lt!311094 (not (= (bvand ((_ sign_extend 24) (select (arr!5387 (buf!4949 lt!309591)) (currentByte!9296 lt!309591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9291 lt!309591)))) #b00000000000000000000000000000000)))))

(assert (= (and d!67877 res!166759) b!199216))

(declare-fun m!308845 () Bool)

(assert (=> d!67877 m!308845))

(declare-fun m!308847 () Bool)

(assert (=> d!67877 m!308847))

(declare-fun m!308849 () Bool)

(assert (=> d!67877 m!308849))

(declare-fun m!308851 () Bool)

(assert (=> d!67877 m!308851))

(declare-fun m!308853 () Bool)

(assert (=> b!199216 m!308853))

(assert (=> b!199216 m!308847))

(assert (=> b!199216 m!308849))

(declare-fun m!308855 () Bool)

(assert (=> b!199216 m!308855))

(assert (=> b!199216 m!308845))

(assert (=> d!67525 d!67877))

(declare-fun d!67879 () Bool)

(declare-fun e!136707 () Bool)

(assert (=> d!67879 e!136707))

(declare-fun res!166760 () Bool)

(assert (=> d!67879 (=> (not res!166760) (not e!136707))))

(declare-fun lt!311101 () BitStream!8022)

(declare-fun lt!311102 () (_ BitVec 64))

(assert (=> d!67879 (= res!166760 (= (bvadd lt!311102 (bvsub lt!309800 lt!309796)) (bitIndex!0 (size!4457 (buf!4949 lt!311101)) (currentByte!9296 lt!311101) (currentBit!9291 lt!311101))))))

(assert (=> d!67879 (or (not (= (bvand lt!311102 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309800 lt!309796) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311102 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311102 (bvsub lt!309800 lt!309796)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67879 (= lt!311102 (bitIndex!0 (size!4457 (buf!4949 (_2!9207 lt!309793))) (currentByte!9296 (_2!9207 lt!309793)) (currentBit!9291 (_2!9207 lt!309793))))))

(assert (=> d!67879 (= lt!311101 (_2!9206 (moveBitIndex!0 (_2!9207 lt!309793) (bvsub lt!309800 lt!309796))))))

(assert (=> d!67879 (moveBitIndexPrecond!0 (_2!9207 lt!309793) (bvsub lt!309800 lt!309796))))

(assert (=> d!67879 (= (withMovedBitIndex!0 (_2!9207 lt!309793) (bvsub lt!309800 lt!309796)) lt!311101)))

(declare-fun b!199217 () Bool)

(assert (=> b!199217 (= e!136707 (= (size!4457 (buf!4949 (_2!9207 lt!309793))) (size!4457 (buf!4949 lt!311101))))))

(assert (= (and d!67879 res!166760) b!199217))

(declare-fun m!308857 () Bool)

(assert (=> d!67879 m!308857))

(declare-fun m!308859 () Bool)

(assert (=> d!67879 m!308859))

(declare-fun m!308861 () Bool)

(assert (=> d!67879 m!308861))

(declare-fun m!308863 () Bool)

(assert (=> d!67879 m!308863))

(assert (=> b!198735 d!67879))

(assert (=> b!198735 d!67575))

(assert (=> b!198735 d!67519))

(declare-fun d!67881 () Bool)

(declare-fun e!136708 () Bool)

(assert (=> d!67881 e!136708))

(declare-fun res!166761 () Bool)

(assert (=> d!67881 (=> (not res!166761) (not e!136708))))

(assert (=> d!67881 (= res!166761 (= (buf!4949 (_2!9206 (increaseBitIndex!0 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204))))) (buf!4949 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204)))))))

(declare-fun lt!311108 () Bool)

(assert (=> d!67881 (= lt!311108 (not (= (bvand ((_ sign_extend 24) (select (arr!5387 (buf!4949 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204)))) (currentByte!9296 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9291 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!311106 () tuple2!17132)

(assert (=> d!67881 (= lt!311106 (tuple2!17133 (not (= (bvand ((_ sign_extend 24) (select (arr!5387 (buf!4949 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204)))) (currentByte!9296 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9291 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204)))))) #b00000000000000000000000000000000)) (_2!9206 (increaseBitIndex!0 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204))))))))

(assert (=> d!67881 (validate_offset_bit!0 ((_ sign_extend 32) (size!4457 (buf!4949 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204))))) ((_ sign_extend 32) (currentByte!9296 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204)))) ((_ sign_extend 32) (currentBit!9291 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204)))))))

(assert (=> d!67881 (= (readBit!0 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204))) lt!311106)))

(declare-fun lt!311107 () (_ BitVec 64))

(declare-fun lt!311104 () (_ BitVec 64))

(declare-fun b!199218 () Bool)

(assert (=> b!199218 (= e!136708 (= (bitIndex!0 (size!4457 (buf!4949 (_2!9206 (increaseBitIndex!0 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204)))))) (currentByte!9296 (_2!9206 (increaseBitIndex!0 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204))))) (currentBit!9291 (_2!9206 (increaseBitIndex!0 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204)))))) (bvadd lt!311107 lt!311104)))))

(assert (=> b!199218 (or (not (= (bvand lt!311107 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311104 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311107 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311107 lt!311104) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199218 (= lt!311104 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!199218 (= lt!311107 (bitIndex!0 (size!4457 (buf!4949 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204)))) (currentByte!9296 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204))) (currentBit!9291 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204)))))))

(declare-fun lt!311105 () Bool)

(assert (=> b!199218 (= lt!311105 (not (= (bvand ((_ sign_extend 24) (select (arr!5387 (buf!4949 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204)))) (currentByte!9296 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9291 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!311109 () Bool)

(assert (=> b!199218 (= lt!311109 (not (= (bvand ((_ sign_extend 24) (select (arr!5387 (buf!4949 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204)))) (currentByte!9296 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9291 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!311103 () Bool)

(assert (=> b!199218 (= lt!311103 (not (= (bvand ((_ sign_extend 24) (select (arr!5387 (buf!4949 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204)))) (currentByte!9296 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9291 (readerFrom!0 (_2!9206 lt!309597) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!67881 res!166761) b!199218))

(assert (=> d!67881 m!307643))

(declare-fun m!308865 () Bool)

(assert (=> d!67881 m!308865))

(declare-fun m!308867 () Bool)

(assert (=> d!67881 m!308867))

(declare-fun m!308869 () Bool)

(assert (=> d!67881 m!308869))

(declare-fun m!308871 () Bool)

(assert (=> d!67881 m!308871))

(declare-fun m!308873 () Bool)

(assert (=> b!199218 m!308873))

(assert (=> b!199218 m!308867))

(assert (=> b!199218 m!308869))

(declare-fun m!308875 () Bool)

(assert (=> b!199218 m!308875))

(assert (=> b!199218 m!307643))

(assert (=> b!199218 m!308865))

(assert (=> d!67565 d!67881))

(assert (=> b!198737 d!67519))

(declare-fun d!67883 () Bool)

(assert (=> d!67883 (arrayBitRangesEq!0 (buf!4949 (_2!9206 lt!309593)) (buf!4949 thiss!1204) lt!309788 lt!309785)))

(declare-fun lt!311110 () Unit!14060)

(assert (=> d!67883 (= lt!311110 (choose!8 (buf!4949 thiss!1204) (buf!4949 (_2!9206 lt!309593)) lt!309788 lt!309785))))

(assert (=> d!67883 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!309788) (bvsle lt!309788 lt!309785))))

(assert (=> d!67883 (= (arrayBitRangesEqSymmetric!0 (buf!4949 thiss!1204) (buf!4949 (_2!9206 lt!309593)) lt!309788 lt!309785) lt!311110)))

(declare-fun bs!16778 () Bool)

(assert (= bs!16778 d!67883))

(assert (=> bs!16778 m!307755))

(declare-fun m!308877 () Bool)

(assert (=> bs!16778 m!308877))

(assert (=> b!198737 d!67883))

(declare-fun b!199219 () Bool)

(declare-fun e!136709 () Bool)

(declare-fun lt!311111 () tuple4!264)

(assert (=> b!199219 (= e!136709 (arrayRangesEq!694 (buf!4949 (_2!9206 lt!309593)) (buf!4949 thiss!1204) (_1!9220 lt!311111) (_2!9220 lt!311111)))))

(declare-fun d!67885 () Bool)

(declare-fun res!166766 () Bool)

(declare-fun e!136713 () Bool)

(assert (=> d!67885 (=> res!166766 e!136713)))

(assert (=> d!67885 (= res!166766 (bvsge lt!309788 lt!309785))))

(assert (=> d!67885 (= (arrayBitRangesEq!0 (buf!4949 (_2!9206 lt!309593)) (buf!4949 thiss!1204) lt!309788 lt!309785) e!136713)))

(declare-fun b!199220 () Bool)

(declare-fun res!166762 () Bool)

(declare-fun lt!311112 () (_ BitVec 32))

(assert (=> b!199220 (= res!166762 (= lt!311112 #b00000000000000000000000000000000))))

(declare-fun e!136712 () Bool)

(assert (=> b!199220 (=> res!166762 e!136712)))

(declare-fun e!136714 () Bool)

(assert (=> b!199220 (= e!136714 e!136712)))

(declare-fun b!199221 () Bool)

(declare-fun e!136711 () Bool)

(assert (=> b!199221 (= e!136711 e!136714)))

(declare-fun res!166765 () Bool)

(declare-fun call!3149 () Bool)

(assert (=> b!199221 (= res!166765 call!3149)))

(assert (=> b!199221 (=> (not res!166765) (not e!136714))))

(declare-fun c!9935 () Bool)

(declare-fun bm!3146 () Bool)

(declare-fun lt!311113 () (_ BitVec 32))

(assert (=> bm!3146 (= call!3149 (byteRangesEq!0 (select (arr!5387 (buf!4949 (_2!9206 lt!309593))) (_3!648 lt!311111)) (select (arr!5387 (buf!4949 thiss!1204)) (_3!648 lt!311111)) lt!311113 (ite c!9935 lt!311112 #b00000000000000000000000000001000)))))

(declare-fun b!199222 () Bool)

(assert (=> b!199222 (= e!136711 call!3149)))

(declare-fun b!199223 () Bool)

(declare-fun e!136710 () Bool)

(assert (=> b!199223 (= e!136710 e!136711)))

(assert (=> b!199223 (= c!9935 (= (_3!648 lt!311111) (_4!132 lt!311111)))))

(declare-fun b!199224 () Bool)

(assert (=> b!199224 (= e!136712 (byteRangesEq!0 (select (arr!5387 (buf!4949 (_2!9206 lt!309593))) (_4!132 lt!311111)) (select (arr!5387 (buf!4949 thiss!1204)) (_4!132 lt!311111)) #b00000000000000000000000000000000 lt!311112))))

(declare-fun b!199225 () Bool)

(assert (=> b!199225 (= e!136713 e!136710)))

(declare-fun res!166764 () Bool)

(assert (=> b!199225 (=> (not res!166764) (not e!136710))))

(assert (=> b!199225 (= res!166764 e!136709)))

(declare-fun res!166763 () Bool)

(assert (=> b!199225 (=> res!166763 e!136709)))

(assert (=> b!199225 (= res!166763 (bvsge (_1!9220 lt!311111) (_2!9220 lt!311111)))))

(assert (=> b!199225 (= lt!311112 ((_ extract 31 0) (bvsrem lt!309785 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199225 (= lt!311113 ((_ extract 31 0) (bvsrem lt!309788 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199225 (= lt!311111 (arrayBitIndices!0 lt!309788 lt!309785))))

(assert (= (and d!67885 (not res!166766)) b!199225))

(assert (= (and b!199225 (not res!166763)) b!199219))

(assert (= (and b!199225 res!166764) b!199223))

(assert (= (and b!199223 c!9935) b!199222))

(assert (= (and b!199223 (not c!9935)) b!199221))

(assert (= (and b!199221 res!166765) b!199220))

(assert (= (and b!199220 (not res!166762)) b!199224))

(assert (= (or b!199222 b!199221) bm!3146))

(declare-fun m!308879 () Bool)

(assert (=> b!199219 m!308879))

(declare-fun m!308881 () Bool)

(assert (=> bm!3146 m!308881))

(declare-fun m!308883 () Bool)

(assert (=> bm!3146 m!308883))

(assert (=> bm!3146 m!308881))

(assert (=> bm!3146 m!308883))

(declare-fun m!308885 () Bool)

(assert (=> bm!3146 m!308885))

(declare-fun m!308887 () Bool)

(assert (=> b!199224 m!308887))

(declare-fun m!308889 () Bool)

(assert (=> b!199224 m!308889))

(assert (=> b!199224 m!308887))

(assert (=> b!199224 m!308889))

(declare-fun m!308891 () Bool)

(assert (=> b!199224 m!308891))

(declare-fun m!308893 () Bool)

(assert (=> b!199225 m!308893))

(assert (=> b!198737 d!67885))

(assert (=> b!198777 d!67541))

(assert (=> d!67531 d!67539))

(declare-fun d!67887 () Bool)

(assert (=> d!67887 (validate_offset_bits!1 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309593)))) ((_ sign_extend 32) (currentByte!9296 thiss!1204)) ((_ sign_extend 32) (currentBit!9291 thiss!1204)) lt!309595)))

(assert (=> d!67887 true))

(declare-fun _$6!375 () Unit!14060)

(assert (=> d!67887 (= (choose!9 thiss!1204 (buf!4949 (_2!9206 lt!309593)) lt!309595 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204))) _$6!375)))

(declare-fun bs!16779 () Bool)

(assert (= bs!16779 d!67887))

(assert (=> bs!16779 m!307577))

(assert (=> d!67531 d!67887))

(declare-fun d!67889 () Bool)

(assert (=> d!67889 (= (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 thiss!1204))) ((_ sign_extend 32) (currentByte!9296 thiss!1204)) ((_ sign_extend 32) (currentBit!9291 thiss!1204))) (bvsub (bvmul ((_ sign_extend 32) (size!4457 (buf!4949 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 thiss!1204)))))))

(assert (=> d!67699 d!67889))

(declare-fun d!67891 () Bool)

(declare-fun res!166767 () Bool)

(declare-fun e!136716 () Bool)

(assert (=> d!67891 (=> (not res!166767) (not e!136716))))

(assert (=> d!67891 (= res!166767 (= (size!4457 (buf!4949 (_2!9206 lt!309597))) (size!4457 (buf!4949 (ite c!9907 (_2!9206 lt!309597) (_2!9206 lt!310330))))))))

(assert (=> d!67891 (= (isPrefixOf!0 (_2!9206 lt!309597) (ite c!9907 (_2!9206 lt!309597) (_2!9206 lt!310330))) e!136716)))

(declare-fun b!199226 () Bool)

(declare-fun res!166769 () Bool)

(assert (=> b!199226 (=> (not res!166769) (not e!136716))))

(assert (=> b!199226 (= res!166769 (bvsle (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))) (bitIndex!0 (size!4457 (buf!4949 (ite c!9907 (_2!9206 lt!309597) (_2!9206 lt!310330)))) (currentByte!9296 (ite c!9907 (_2!9206 lt!309597) (_2!9206 lt!310330))) (currentBit!9291 (ite c!9907 (_2!9206 lt!309597) (_2!9206 lt!310330))))))))

(declare-fun b!199227 () Bool)

(declare-fun e!136715 () Bool)

(assert (=> b!199227 (= e!136716 e!136715)))

(declare-fun res!166768 () Bool)

(assert (=> b!199227 (=> res!166768 e!136715)))

(assert (=> b!199227 (= res!166768 (= (size!4457 (buf!4949 (_2!9206 lt!309597))) #b00000000000000000000000000000000))))

(declare-fun b!199228 () Bool)

(assert (=> b!199228 (= e!136715 (arrayBitRangesEq!0 (buf!4949 (_2!9206 lt!309597)) (buf!4949 (ite c!9907 (_2!9206 lt!309597) (_2!9206 lt!310330))) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597)))))))

(assert (= (and d!67891 res!166767) b!199226))

(assert (= (and b!199226 res!166769) b!199227))

(assert (= (and b!199227 (not res!166768)) b!199228))

(assert (=> b!199226 m!307607))

(declare-fun m!308895 () Bool)

(assert (=> b!199226 m!308895))

(assert (=> b!199228 m!307607))

(assert (=> b!199228 m!307607))

(declare-fun m!308897 () Bool)

(assert (=> b!199228 m!308897))

(assert (=> bm!3134 d!67891))

(assert (=> b!198758 d!67519))

(assert (=> b!198758 d!67517))

(declare-fun d!67893 () Bool)

(assert (=> d!67893 (= (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309593)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309597))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309597)))) (bvsub (bvmul ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309593)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309597))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309597))))))))

(assert (=> d!67527 d!67893))

(declare-fun d!67895 () Bool)

(declare-fun lt!311114 () tuple2!17132)

(assert (=> d!67895 (= lt!311114 (readBit!0 (readerFrom!0 (_2!9206 lt!310330) (currentBit!9291 (_2!9206 lt!309597)) (currentByte!9296 (_2!9206 lt!309597)))))))

(assert (=> d!67895 (= (readBitPure!0 (readerFrom!0 (_2!9206 lt!310330) (currentBit!9291 (_2!9206 lt!309597)) (currentByte!9296 (_2!9206 lt!309597)))) (tuple2!17123 (_2!9214 lt!311114) (_1!9214 lt!311114)))))

(declare-fun bs!16780 () Bool)

(assert (= bs!16780 d!67895))

(assert (=> bs!16780 m!308131))

(declare-fun m!308899 () Bool)

(assert (=> bs!16780 m!308899))

(assert (=> b!198941 d!67895))

(declare-fun d!67897 () Bool)

(declare-fun e!136717 () Bool)

(assert (=> d!67897 e!136717))

(declare-fun res!166770 () Bool)

(assert (=> d!67897 (=> (not res!166770) (not e!136717))))

(assert (=> d!67897 (= res!166770 (invariant!0 (currentBit!9291 (_2!9206 lt!310330)) (currentByte!9296 (_2!9206 lt!310330)) (size!4457 (buf!4949 (_2!9206 lt!310330)))))))

(assert (=> d!67897 (= (readerFrom!0 (_2!9206 lt!310330) (currentBit!9291 (_2!9206 lt!309597)) (currentByte!9296 (_2!9206 lt!309597))) (BitStream!8023 (buf!4949 (_2!9206 lt!310330)) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))))))

(declare-fun b!199229 () Bool)

(assert (=> b!199229 (= e!136717 (invariant!0 (currentBit!9291 (_2!9206 lt!309597)) (currentByte!9296 (_2!9206 lt!309597)) (size!4457 (buf!4949 (_2!9206 lt!310330)))))))

(assert (= (and d!67897 res!166770) b!199229))

(declare-fun m!308901 () Bool)

(assert (=> d!67897 m!308901))

(declare-fun m!308903 () Bool)

(assert (=> b!199229 m!308903))

(assert (=> b!198941 d!67897))

(declare-fun d!67899 () Bool)

(declare-fun res!166771 () Bool)

(declare-fun e!136719 () Bool)

(assert (=> d!67899 (=> (not res!166771) (not e!136719))))

(assert (=> d!67899 (= res!166771 (= (size!4457 (buf!4949 (_2!9207 lt!309820))) (size!4457 (buf!4949 (_2!9206 lt!309593)))))))

(assert (=> d!67899 (= (isPrefixOf!0 (_2!9207 lt!309820) (_2!9206 lt!309593)) e!136719)))

(declare-fun b!199230 () Bool)

(declare-fun res!166773 () Bool)

(assert (=> b!199230 (=> (not res!166773) (not e!136719))))

(assert (=> b!199230 (= res!166773 (bvsle (bitIndex!0 (size!4457 (buf!4949 (_2!9207 lt!309820))) (currentByte!9296 (_2!9207 lt!309820)) (currentBit!9291 (_2!9207 lt!309820))) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309593))) (currentByte!9296 (_2!9206 lt!309593)) (currentBit!9291 (_2!9206 lt!309593)))))))

(declare-fun b!199231 () Bool)

(declare-fun e!136718 () Bool)

(assert (=> b!199231 (= e!136719 e!136718)))

(declare-fun res!166772 () Bool)

(assert (=> b!199231 (=> res!166772 e!136718)))

(assert (=> b!199231 (= res!166772 (= (size!4457 (buf!4949 (_2!9207 lt!309820))) #b00000000000000000000000000000000))))

(declare-fun b!199232 () Bool)

(assert (=> b!199232 (= e!136718 (arrayBitRangesEq!0 (buf!4949 (_2!9207 lt!309820)) (buf!4949 (_2!9206 lt!309593)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4457 (buf!4949 (_2!9207 lt!309820))) (currentByte!9296 (_2!9207 lt!309820)) (currentBit!9291 (_2!9207 lt!309820)))))))

(assert (= (and d!67899 res!166771) b!199230))

(assert (= (and b!199230 res!166773) b!199231))

(assert (= (and b!199231 (not res!166772)) b!199232))

(assert (=> b!199230 m!308521))

(assert (=> b!199230 m!307635))

(assert (=> b!199232 m!308521))

(assert (=> b!199232 m!308521))

(declare-fun m!308905 () Bool)

(assert (=> b!199232 m!308905))

(assert (=> b!198741 d!67899))

(declare-fun d!67901 () Bool)

(assert (=> d!67901 (= (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!309603)))) ((_ sign_extend 32) (currentByte!9296 (_1!9209 lt!309603))) ((_ sign_extend 32) (currentBit!9291 (_1!9209 lt!309603)))) (bvsub (bvmul ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!309603)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 (_1!9209 lt!309603))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 (_1!9209 lt!309603))))))))

(assert (=> d!67543 d!67901))

(declare-fun d!67903 () Bool)

(assert (=> d!67903 (= (invariant!0 (currentBit!9291 (_1!9209 lt!309603)) (currentByte!9296 (_1!9209 lt!309603)) (size!4457 (buf!4949 (_1!9209 lt!309603)))) (and (bvsge (currentBit!9291 (_1!9209 lt!309603)) #b00000000000000000000000000000000) (bvslt (currentBit!9291 (_1!9209 lt!309603)) #b00000000000000000000000000001000) (bvsge (currentByte!9296 (_1!9209 lt!309603)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9296 (_1!9209 lt!309603)) (size!4457 (buf!4949 (_1!9209 lt!309603)))) (and (= (currentBit!9291 (_1!9209 lt!309603)) #b00000000000000000000000000000000) (= (currentByte!9296 (_1!9209 lt!309603)) (size!4457 (buf!4949 (_1!9209 lt!309603))))))))))

(assert (=> d!67543 d!67903))

(declare-fun d!67905 () Bool)

(assert (=> d!67905 (= (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!309599)))) ((_ sign_extend 32) (currentByte!9296 (_1!9209 lt!309599))) ((_ sign_extend 32) (currentBit!9291 (_1!9209 lt!309599)))) (bvsub (bvmul ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!309599)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 (_1!9209 lt!309599))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 (_1!9209 lt!309599))))))))

(assert (=> d!67695 d!67905))

(declare-fun d!67907 () Bool)

(assert (=> d!67907 (= (invariant!0 (currentBit!9291 (_1!9209 lt!309599)) (currentByte!9296 (_1!9209 lt!309599)) (size!4457 (buf!4949 (_1!9209 lt!309599)))) (and (bvsge (currentBit!9291 (_1!9209 lt!309599)) #b00000000000000000000000000000000) (bvslt (currentBit!9291 (_1!9209 lt!309599)) #b00000000000000000000000000001000) (bvsge (currentByte!9296 (_1!9209 lt!309599)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9296 (_1!9209 lt!309599)) (size!4457 (buf!4949 (_1!9209 lt!309599)))) (and (= (currentBit!9291 (_1!9209 lt!309599)) #b00000000000000000000000000000000) (= (currentByte!9296 (_1!9209 lt!309599)) (size!4457 (buf!4949 (_1!9209 lt!309599))))))))))

(assert (=> d!67695 d!67907))

(declare-fun d!67909 () Bool)

(declare-fun res!166774 () Bool)

(declare-fun e!136721 () Bool)

(assert (=> d!67909 (=> (not res!166774) (not e!136721))))

(assert (=> d!67909 (= res!166774 (= (size!4457 (buf!4949 (_1!9207 lt!309820))) (size!4457 (buf!4949 (_2!9206 lt!309597)))))))

(assert (=> d!67909 (= (isPrefixOf!0 (_1!9207 lt!309820) (_2!9206 lt!309597)) e!136721)))

(declare-fun b!199233 () Bool)

(declare-fun res!166776 () Bool)

(assert (=> b!199233 (=> (not res!166776) (not e!136721))))

(assert (=> b!199233 (= res!166776 (bvsle (bitIndex!0 (size!4457 (buf!4949 (_1!9207 lt!309820))) (currentByte!9296 (_1!9207 lt!309820)) (currentBit!9291 (_1!9207 lt!309820))) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597)))))))

(declare-fun b!199234 () Bool)

(declare-fun e!136720 () Bool)

(assert (=> b!199234 (= e!136721 e!136720)))

(declare-fun res!166775 () Bool)

(assert (=> b!199234 (=> res!166775 e!136720)))

(assert (=> b!199234 (= res!166775 (= (size!4457 (buf!4949 (_1!9207 lt!309820))) #b00000000000000000000000000000000))))

(declare-fun b!199235 () Bool)

(assert (=> b!199235 (= e!136720 (arrayBitRangesEq!0 (buf!4949 (_1!9207 lt!309820)) (buf!4949 (_2!9206 lt!309597)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4457 (buf!4949 (_1!9207 lt!309820))) (currentByte!9296 (_1!9207 lt!309820)) (currentBit!9291 (_1!9207 lt!309820)))))))

(assert (= (and d!67909 res!166774) b!199233))

(assert (= (and b!199233 res!166776) b!199234))

(assert (= (and b!199234 (not res!166775)) b!199235))

(declare-fun m!308907 () Bool)

(assert (=> b!199233 m!308907))

(assert (=> b!199233 m!307607))

(assert (=> b!199235 m!308907))

(assert (=> b!199235 m!308907))

(declare-fun m!308909 () Bool)

(assert (=> b!199235 m!308909))

(assert (=> b!198743 d!67909))

(assert (=> b!198952 d!67517))

(assert (=> b!198952 d!67575))

(declare-fun d!67911 () Bool)

(declare-fun res!166777 () Bool)

(declare-fun e!136723 () Bool)

(assert (=> d!67911 (=> (not res!166777) (not e!136723))))

(assert (=> d!67911 (= res!166777 (= (size!4457 (buf!4949 (_2!9206 lt!309597))) (size!4457 (buf!4949 (_2!9206 lt!310327)))))))

(assert (=> d!67911 (= (isPrefixOf!0 (_2!9206 lt!309597) (_2!9206 lt!310327)) e!136723)))

(declare-fun b!199236 () Bool)

(declare-fun res!166779 () Bool)

(assert (=> b!199236 (=> (not res!166779) (not e!136723))))

(assert (=> b!199236 (= res!166779 (bvsle (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310327))) (currentByte!9296 (_2!9206 lt!310327)) (currentBit!9291 (_2!9206 lt!310327)))))))

(declare-fun b!199237 () Bool)

(declare-fun e!136722 () Bool)

(assert (=> b!199237 (= e!136723 e!136722)))

(declare-fun res!166778 () Bool)

(assert (=> b!199237 (=> res!166778 e!136722)))

(assert (=> b!199237 (= res!166778 (= (size!4457 (buf!4949 (_2!9206 lt!309597))) #b00000000000000000000000000000000))))

(declare-fun b!199238 () Bool)

(assert (=> b!199238 (= e!136722 (arrayBitRangesEq!0 (buf!4949 (_2!9206 lt!309597)) (buf!4949 (_2!9206 lt!310327)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597)))))))

(assert (= (and d!67911 res!166777) b!199236))

(assert (= (and b!199236 res!166779) b!199237))

(assert (= (and b!199237 (not res!166778)) b!199238))

(assert (=> b!199236 m!307607))

(assert (=> b!199236 m!308121))

(assert (=> b!199238 m!307607))

(assert (=> b!199238 m!307607))

(declare-fun m!308911 () Bool)

(assert (=> b!199238 m!308911))

(assert (=> b!198943 d!67911))

(declare-fun d!67913 () Bool)

(assert (=> d!67913 (isPrefixOf!0 lt!309795 (_2!9206 lt!309593))))

(declare-fun lt!311115 () Unit!14060)

(assert (=> d!67913 (= lt!311115 (choose!30 lt!309795 thiss!1204 (_2!9206 lt!309593)))))

(assert (=> d!67913 (isPrefixOf!0 lt!309795 thiss!1204)))

(assert (=> d!67913 (= (lemmaIsPrefixTransitive!0 lt!309795 thiss!1204 (_2!9206 lt!309593)) lt!311115)))

(declare-fun bs!16781 () Bool)

(assert (= bs!16781 d!67913))

(assert (=> bs!16781 m!307765))

(declare-fun m!308913 () Bool)

(assert (=> bs!16781 m!308913))

(declare-fun m!308915 () Bool)

(assert (=> bs!16781 m!308915))

(assert (=> d!67535 d!67913))

(assert (=> d!67535 d!67577))

(declare-fun d!67915 () Bool)

(declare-fun res!166780 () Bool)

(declare-fun e!136725 () Bool)

(assert (=> d!67915 (=> (not res!166780) (not e!136725))))

(assert (=> d!67915 (= res!166780 (= (size!4457 (buf!4949 (_1!9207 lt!309793))) (size!4457 (buf!4949 (_2!9207 lt!309793)))))))

(assert (=> d!67915 (= (isPrefixOf!0 (_1!9207 lt!309793) (_2!9207 lt!309793)) e!136725)))

(declare-fun b!199239 () Bool)

(declare-fun res!166782 () Bool)

(assert (=> b!199239 (=> (not res!166782) (not e!136725))))

(assert (=> b!199239 (= res!166782 (bvsle (bitIndex!0 (size!4457 (buf!4949 (_1!9207 lt!309793))) (currentByte!9296 (_1!9207 lt!309793)) (currentBit!9291 (_1!9207 lt!309793))) (bitIndex!0 (size!4457 (buf!4949 (_2!9207 lt!309793))) (currentByte!9296 (_2!9207 lt!309793)) (currentBit!9291 (_2!9207 lt!309793)))))))

(declare-fun b!199240 () Bool)

(declare-fun e!136724 () Bool)

(assert (=> b!199240 (= e!136725 e!136724)))

(declare-fun res!166781 () Bool)

(assert (=> b!199240 (=> res!166781 e!136724)))

(assert (=> b!199240 (= res!166781 (= (size!4457 (buf!4949 (_1!9207 lt!309793))) #b00000000000000000000000000000000))))

(declare-fun b!199241 () Bool)

(assert (=> b!199241 (= e!136724 (arrayBitRangesEq!0 (buf!4949 (_1!9207 lt!309793)) (buf!4949 (_2!9207 lt!309793)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4457 (buf!4949 (_1!9207 lt!309793))) (currentByte!9296 (_1!9207 lt!309793)) (currentBit!9291 (_1!9207 lt!309793)))))))

(assert (= (and d!67915 res!166780) b!199239))

(assert (= (and b!199239 res!166782) b!199240))

(assert (= (and b!199240 (not res!166781)) b!199241))

(declare-fun m!308917 () Bool)

(assert (=> b!199239 m!308917))

(assert (=> b!199239 m!308859))

(assert (=> b!199241 m!308917))

(assert (=> b!199241 m!308917))

(declare-fun m!308919 () Bool)

(assert (=> b!199241 m!308919))

(assert (=> d!67535 d!67915))

(declare-fun d!67917 () Bool)

(declare-fun res!166783 () Bool)

(declare-fun e!136727 () Bool)

(assert (=> d!67917 (=> (not res!166783) (not e!136727))))

(assert (=> d!67917 (= res!166783 (= (size!4457 (buf!4949 (_2!9206 lt!309593))) (size!4457 (buf!4949 (_2!9206 lt!309593)))))))

(assert (=> d!67917 (= (isPrefixOf!0 (_2!9206 lt!309593) (_2!9206 lt!309593)) e!136727)))

(declare-fun b!199242 () Bool)

(declare-fun res!166785 () Bool)

(assert (=> b!199242 (=> (not res!166785) (not e!136727))))

(assert (=> b!199242 (= res!166785 (bvsle (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309593))) (currentByte!9296 (_2!9206 lt!309593)) (currentBit!9291 (_2!9206 lt!309593))) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309593))) (currentByte!9296 (_2!9206 lt!309593)) (currentBit!9291 (_2!9206 lt!309593)))))))

(declare-fun b!199243 () Bool)

(declare-fun e!136726 () Bool)

(assert (=> b!199243 (= e!136727 e!136726)))

(declare-fun res!166784 () Bool)

(assert (=> b!199243 (=> res!166784 e!136726)))

(assert (=> b!199243 (= res!166784 (= (size!4457 (buf!4949 (_2!9206 lt!309593))) #b00000000000000000000000000000000))))

(declare-fun b!199244 () Bool)

(assert (=> b!199244 (= e!136726 (arrayBitRangesEq!0 (buf!4949 (_2!9206 lt!309593)) (buf!4949 (_2!9206 lt!309593)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309593))) (currentByte!9296 (_2!9206 lt!309593)) (currentBit!9291 (_2!9206 lt!309593)))))))

(assert (= (and d!67917 res!166783) b!199242))

(assert (= (and b!199242 res!166785) b!199243))

(assert (= (and b!199243 (not res!166784)) b!199244))

(assert (=> b!199242 m!307635))

(assert (=> b!199242 m!307635))

(assert (=> b!199244 m!307635))

(assert (=> b!199244 m!307635))

(declare-fun m!308921 () Bool)

(assert (=> b!199244 m!308921))

(assert (=> d!67535 d!67917))

(declare-fun d!67919 () Bool)

(declare-fun res!166786 () Bool)

(declare-fun e!136729 () Bool)

(assert (=> d!67919 (=> (not res!166786) (not e!136729))))

(assert (=> d!67919 (= res!166786 (= (size!4457 (buf!4949 lt!309795)) (size!4457 (buf!4949 lt!309795))))))

(assert (=> d!67919 (= (isPrefixOf!0 lt!309795 lt!309795) e!136729)))

(declare-fun b!199245 () Bool)

(declare-fun res!166788 () Bool)

(assert (=> b!199245 (=> (not res!166788) (not e!136729))))

(assert (=> b!199245 (= res!166788 (bvsle (bitIndex!0 (size!4457 (buf!4949 lt!309795)) (currentByte!9296 lt!309795) (currentBit!9291 lt!309795)) (bitIndex!0 (size!4457 (buf!4949 lt!309795)) (currentByte!9296 lt!309795) (currentBit!9291 lt!309795))))))

(declare-fun b!199246 () Bool)

(declare-fun e!136728 () Bool)

(assert (=> b!199246 (= e!136729 e!136728)))

(declare-fun res!166787 () Bool)

(assert (=> b!199246 (=> res!166787 e!136728)))

(assert (=> b!199246 (= res!166787 (= (size!4457 (buf!4949 lt!309795)) #b00000000000000000000000000000000))))

(declare-fun b!199247 () Bool)

(assert (=> b!199247 (= e!136728 (arrayBitRangesEq!0 (buf!4949 lt!309795) (buf!4949 lt!309795) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4457 (buf!4949 lt!309795)) (currentByte!9296 lt!309795) (currentBit!9291 lt!309795))))))

(assert (= (and d!67919 res!166786) b!199245))

(assert (= (and b!199245 res!166788) b!199246))

(assert (= (and b!199246 (not res!166787)) b!199247))

(declare-fun m!308923 () Bool)

(assert (=> b!199245 m!308923))

(assert (=> b!199245 m!308923))

(assert (=> b!199247 m!308923))

(assert (=> b!199247 m!308923))

(declare-fun m!308925 () Bool)

(assert (=> b!199247 m!308925))

(assert (=> d!67535 d!67919))

(declare-fun d!67921 () Bool)

(assert (=> d!67921 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!311118 () Unit!14060)

(declare-fun choose!11 (BitStream!8022) Unit!14060)

(assert (=> d!67921 (= lt!311118 (choose!11 thiss!1204))))

(assert (=> d!67921 (= (lemmaIsPrefixRefl!0 thiss!1204) lt!311118)))

(declare-fun bs!16783 () Bool)

(assert (= bs!16783 d!67921))

(assert (=> bs!16783 m!307771))

(declare-fun m!308927 () Bool)

(assert (=> bs!16783 m!308927))

(assert (=> d!67535 d!67921))

(declare-fun d!67923 () Bool)

(declare-fun res!166789 () Bool)

(declare-fun e!136731 () Bool)

(assert (=> d!67923 (=> (not res!166789) (not e!136731))))

(assert (=> d!67923 (= res!166789 (= (size!4457 (buf!4949 lt!309795)) (size!4457 (buf!4949 (_2!9206 lt!309593)))))))

(assert (=> d!67923 (= (isPrefixOf!0 lt!309795 (_2!9206 lt!309593)) e!136731)))

(declare-fun b!199248 () Bool)

(declare-fun res!166791 () Bool)

(assert (=> b!199248 (=> (not res!166791) (not e!136731))))

(assert (=> b!199248 (= res!166791 (bvsle (bitIndex!0 (size!4457 (buf!4949 lt!309795)) (currentByte!9296 lt!309795) (currentBit!9291 lt!309795)) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309593))) (currentByte!9296 (_2!9206 lt!309593)) (currentBit!9291 (_2!9206 lt!309593)))))))

(declare-fun b!199249 () Bool)

(declare-fun e!136730 () Bool)

(assert (=> b!199249 (= e!136731 e!136730)))

(declare-fun res!166790 () Bool)

(assert (=> b!199249 (=> res!166790 e!136730)))

(assert (=> b!199249 (= res!166790 (= (size!4457 (buf!4949 lt!309795)) #b00000000000000000000000000000000))))

(declare-fun b!199250 () Bool)

(assert (=> b!199250 (= e!136730 (arrayBitRangesEq!0 (buf!4949 lt!309795) (buf!4949 (_2!9206 lt!309593)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4457 (buf!4949 lt!309795)) (currentByte!9296 lt!309795) (currentBit!9291 lt!309795))))))

(assert (= (and d!67923 res!166789) b!199248))

(assert (= (and b!199248 res!166791) b!199249))

(assert (= (and b!199249 (not res!166790)) b!199250))

(assert (=> b!199248 m!308923))

(assert (=> b!199248 m!307635))

(assert (=> b!199250 m!308923))

(assert (=> b!199250 m!308923))

(declare-fun m!308929 () Bool)

(assert (=> b!199250 m!308929))

(assert (=> d!67535 d!67923))

(declare-fun d!67925 () Bool)

(declare-fun res!166792 () Bool)

(declare-fun e!136733 () Bool)

(assert (=> d!67925 (=> (not res!166792) (not e!136733))))

(assert (=> d!67925 (= res!166792 (= (size!4457 (buf!4949 thiss!1204)) (size!4457 (buf!4949 thiss!1204))))))

(assert (=> d!67925 (= (isPrefixOf!0 thiss!1204 thiss!1204) e!136733)))

(declare-fun b!199251 () Bool)

(declare-fun res!166794 () Bool)

(assert (=> b!199251 (=> (not res!166794) (not e!136733))))

(assert (=> b!199251 (= res!166794 (bvsle (bitIndex!0 (size!4457 (buf!4949 thiss!1204)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)) (bitIndex!0 (size!4457 (buf!4949 thiss!1204)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204))))))

(declare-fun b!199252 () Bool)

(declare-fun e!136732 () Bool)

(assert (=> b!199252 (= e!136733 e!136732)))

(declare-fun res!166793 () Bool)

(assert (=> b!199252 (=> res!166793 e!136732)))

(assert (=> b!199252 (= res!166793 (= (size!4457 (buf!4949 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!199253 () Bool)

(assert (=> b!199253 (= e!136732 (arrayBitRangesEq!0 (buf!4949 thiss!1204) (buf!4949 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4457 (buf!4949 thiss!1204)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204))))))

(assert (= (and d!67925 res!166792) b!199251))

(assert (= (and b!199251 res!166794) b!199252))

(assert (= (and b!199252 (not res!166793)) b!199253))

(assert (=> b!199251 m!307609))

(assert (=> b!199251 m!307609))

(assert (=> b!199253 m!307609))

(assert (=> b!199253 m!307609))

(declare-fun m!308931 () Bool)

(assert (=> b!199253 m!308931))

(assert (=> d!67535 d!67925))

(declare-fun d!67927 () Bool)

(assert (=> d!67927 (isPrefixOf!0 (_2!9206 lt!309593) (_2!9206 lt!309593))))

(declare-fun lt!311119 () Unit!14060)

(assert (=> d!67927 (= lt!311119 (choose!11 (_2!9206 lt!309593)))))

(assert (=> d!67927 (= (lemmaIsPrefixRefl!0 (_2!9206 lt!309593)) lt!311119)))

(declare-fun bs!16784 () Bool)

(assert (= bs!16784 d!67927))

(assert (=> bs!16784 m!307769))

(declare-fun m!308933 () Bool)

(assert (=> bs!16784 m!308933))

(assert (=> d!67535 d!67927))

(declare-fun d!67929 () Bool)

(assert (=> d!67929 (isPrefixOf!0 lt!309795 lt!309795)))

(declare-fun lt!311120 () Unit!14060)

(assert (=> d!67929 (= lt!311120 (choose!11 lt!309795))))

(assert (=> d!67929 (= (lemmaIsPrefixRefl!0 lt!309795) lt!311120)))

(declare-fun bs!16785 () Bool)

(assert (= bs!16785 d!67929))

(assert (=> bs!16785 m!307759))

(declare-fun m!308935 () Bool)

(assert (=> bs!16785 m!308935))

(assert (=> d!67535 d!67929))

(declare-fun d!67931 () Bool)

(assert (=> d!67931 (isPrefixOf!0 lt!309795 (_2!9206 lt!309593))))

(declare-fun lt!311121 () Unit!14060)

(assert (=> d!67931 (= lt!311121 (choose!30 lt!309795 (_2!9206 lt!309593) (_2!9206 lt!309593)))))

(assert (=> d!67931 (isPrefixOf!0 lt!309795 (_2!9206 lt!309593))))

(assert (=> d!67931 (= (lemmaIsPrefixTransitive!0 lt!309795 (_2!9206 lt!309593) (_2!9206 lt!309593)) lt!311121)))

(declare-fun bs!16786 () Bool)

(assert (= bs!16786 d!67931))

(assert (=> bs!16786 m!307765))

(declare-fun m!308937 () Bool)

(assert (=> bs!16786 m!308937))

(assert (=> bs!16786 m!307765))

(assert (=> d!67535 d!67931))

(declare-fun e!136734 () Bool)

(declare-fun b!199254 () Bool)

(declare-fun lt!311122 () tuple4!264)

(assert (=> b!199254 (= e!136734 (arrayRangesEq!694 (buf!4949 (_2!9206 lt!309597)) (buf!4949 (_2!9206 lt!309593)) (_1!9220 lt!311122) (_2!9220 lt!311122)))))

(declare-fun d!67933 () Bool)

(declare-fun res!166799 () Bool)

(declare-fun e!136738 () Bool)

(assert (=> d!67933 (=> res!166799 e!136738)))

(assert (=> d!67933 (= res!166799 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597)))))))

(assert (=> d!67933 (= (arrayBitRangesEq!0 (buf!4949 (_2!9206 lt!309597)) (buf!4949 (_2!9206 lt!309593)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597)))) e!136738)))

(declare-fun b!199255 () Bool)

(declare-fun res!166795 () Bool)

(declare-fun lt!311123 () (_ BitVec 32))

(assert (=> b!199255 (= res!166795 (= lt!311123 #b00000000000000000000000000000000))))

(declare-fun e!136737 () Bool)

(assert (=> b!199255 (=> res!166795 e!136737)))

(declare-fun e!136739 () Bool)

(assert (=> b!199255 (= e!136739 e!136737)))

(declare-fun b!199256 () Bool)

(declare-fun e!136736 () Bool)

(assert (=> b!199256 (= e!136736 e!136739)))

(declare-fun res!166798 () Bool)

(declare-fun call!3150 () Bool)

(assert (=> b!199256 (= res!166798 call!3150)))

(assert (=> b!199256 (=> (not res!166798) (not e!136739))))

(declare-fun lt!311124 () (_ BitVec 32))

(declare-fun bm!3147 () Bool)

(declare-fun c!9936 () Bool)

(assert (=> bm!3147 (= call!3150 (byteRangesEq!0 (select (arr!5387 (buf!4949 (_2!9206 lt!309597))) (_3!648 lt!311122)) (select (arr!5387 (buf!4949 (_2!9206 lt!309593))) (_3!648 lt!311122)) lt!311124 (ite c!9936 lt!311123 #b00000000000000000000000000001000)))))

(declare-fun b!199257 () Bool)

(assert (=> b!199257 (= e!136736 call!3150)))

(declare-fun b!199258 () Bool)

(declare-fun e!136735 () Bool)

(assert (=> b!199258 (= e!136735 e!136736)))

(assert (=> b!199258 (= c!9936 (= (_3!648 lt!311122) (_4!132 lt!311122)))))

(declare-fun b!199259 () Bool)

(assert (=> b!199259 (= e!136737 (byteRangesEq!0 (select (arr!5387 (buf!4949 (_2!9206 lt!309597))) (_4!132 lt!311122)) (select (arr!5387 (buf!4949 (_2!9206 lt!309593))) (_4!132 lt!311122)) #b00000000000000000000000000000000 lt!311123))))

(declare-fun b!199260 () Bool)

(assert (=> b!199260 (= e!136738 e!136735)))

(declare-fun res!166797 () Bool)

(assert (=> b!199260 (=> (not res!166797) (not e!136735))))

(assert (=> b!199260 (= res!166797 e!136734)))

(declare-fun res!166796 () Bool)

(assert (=> b!199260 (=> res!166796 e!136734)))

(assert (=> b!199260 (= res!166796 (bvsge (_1!9220 lt!311122) (_2!9220 lt!311122)))))

(assert (=> b!199260 (= lt!311123 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199260 (= lt!311124 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199260 (= lt!311122 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597)))))))

(assert (= (and d!67933 (not res!166799)) b!199260))

(assert (= (and b!199260 (not res!166796)) b!199254))

(assert (= (and b!199260 res!166797) b!199258))

(assert (= (and b!199258 c!9936) b!199257))

(assert (= (and b!199258 (not c!9936)) b!199256))

(assert (= (and b!199256 res!166798) b!199255))

(assert (= (and b!199255 (not res!166795)) b!199259))

(assert (= (or b!199257 b!199256) bm!3147))

(declare-fun m!308939 () Bool)

(assert (=> b!199254 m!308939))

(declare-fun m!308941 () Bool)

(assert (=> bm!3147 m!308941))

(declare-fun m!308943 () Bool)

(assert (=> bm!3147 m!308943))

(assert (=> bm!3147 m!308941))

(assert (=> bm!3147 m!308943))

(declare-fun m!308945 () Bool)

(assert (=> bm!3147 m!308945))

(declare-fun m!308947 () Bool)

(assert (=> b!199259 m!308947))

(declare-fun m!308949 () Bool)

(assert (=> b!199259 m!308949))

(assert (=> b!199259 m!308947))

(assert (=> b!199259 m!308949))

(declare-fun m!308951 () Bool)

(assert (=> b!199259 m!308951))

(assert (=> b!199260 m!307607))

(declare-fun m!308953 () Bool)

(assert (=> b!199260 m!308953))

(assert (=> b!198954 d!67933))

(assert (=> b!198954 d!67517))

(declare-fun d!67935 () Bool)

(declare-fun lt!311125 () tuple2!17132)

(assert (=> d!67935 (= lt!311125 (readBit!0 lt!309841))))

(assert (=> d!67935 (= (readBitPure!0 lt!309841) (tuple2!17123 (_2!9214 lt!311125) (_1!9214 lt!311125)))))

(declare-fun bs!16787 () Bool)

(assert (= bs!16787 d!67935))

(declare-fun m!308955 () Bool)

(assert (=> bs!16787 m!308955))

(assert (=> d!67551 d!67935))

(declare-fun d!67937 () Bool)

(assert (=> d!67937 (= (invariant!0 (currentBit!9291 lt!309591) (currentByte!9296 lt!309591) (size!4457 (buf!4949 (_2!9206 lt!309593)))) (and (bvsge (currentBit!9291 lt!309591) #b00000000000000000000000000000000) (bvslt (currentBit!9291 lt!309591) #b00000000000000000000000000001000) (bvsge (currentByte!9296 lt!309591) #b00000000000000000000000000000000) (or (bvslt (currentByte!9296 lt!309591) (size!4457 (buf!4949 (_2!9206 lt!309593)))) (and (= (currentBit!9291 lt!309591) #b00000000000000000000000000000000) (= (currentByte!9296 lt!309591) (size!4457 (buf!4949 (_2!9206 lt!309593))))))))))

(assert (=> d!67551 d!67937))

(declare-fun d!67939 () Bool)

(declare-fun e!136742 () Bool)

(assert (=> d!67939 e!136742))

(declare-fun res!166802 () Bool)

(assert (=> d!67939 (=> (not res!166802) (not e!136742))))

(declare-fun lt!311133 () tuple2!17122)

(declare-fun lt!311134 () tuple2!17122)

(assert (=> d!67939 (= res!166802 (= (bitIndex!0 (size!4457 (buf!4949 (_1!9209 lt!311133))) (currentByte!9296 (_1!9209 lt!311133)) (currentBit!9291 (_1!9209 lt!311133))) (bitIndex!0 (size!4457 (buf!4949 (_1!9209 lt!311134))) (currentByte!9296 (_1!9209 lt!311134)) (currentBit!9291 (_1!9209 lt!311134)))))))

(declare-fun lt!311132 () BitStream!8022)

(assert (=> d!67939 (= lt!311134 (readBitPure!0 lt!311132))))

(assert (=> d!67939 (= lt!311133 (readBitPure!0 lt!309591))))

(assert (=> d!67939 (= lt!311132 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 lt!309591) (currentBit!9291 lt!309591)))))

(assert (=> d!67939 (invariant!0 (currentBit!9291 lt!309591) (currentByte!9296 lt!309591) (size!4457 (buf!4949 (_2!9206 lt!309593))))))

(assert (=> d!67939 true))

(declare-fun _$9!78 () Unit!14060)

(assert (=> d!67939 (= (choose!50 lt!309591 (_2!9206 lt!309593) lt!309841 lt!309840 (tuple2!17123 (_1!9209 lt!309840) (_2!9209 lt!309840)) (_1!9209 lt!309840) (_2!9209 lt!309840) lt!309838 (tuple2!17123 (_1!9209 lt!309838) (_2!9209 lt!309838)) (_1!9209 lt!309838) (_2!9209 lt!309838)) _$9!78)))

(declare-fun b!199263 () Bool)

(assert (=> b!199263 (= e!136742 (= (_2!9209 lt!311133) (_2!9209 lt!311134)))))

(assert (= (and d!67939 res!166802) b!199263))

(declare-fun m!308957 () Bool)

(assert (=> d!67939 m!308957))

(declare-fun m!308959 () Bool)

(assert (=> d!67939 m!308959))

(declare-fun m!308961 () Bool)

(assert (=> d!67939 m!308961))

(assert (=> d!67939 m!307601))

(assert (=> d!67939 m!307823))

(assert (=> d!67551 d!67939))

(assert (=> d!67551 d!67525))

(declare-fun d!67941 () Bool)

(declare-fun e!136743 () Bool)

(assert (=> d!67941 e!136743))

(declare-fun res!166804 () Bool)

(assert (=> d!67941 (=> (not res!166804) (not e!136743))))

(declare-fun lt!311139 () (_ BitVec 64))

(declare-fun lt!311137 () (_ BitVec 64))

(declare-fun lt!311138 () (_ BitVec 64))

(assert (=> d!67941 (= res!166804 (= lt!311137 (bvsub lt!311138 lt!311139)))))

(assert (=> d!67941 (or (= (bvand lt!311138 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311139 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311138 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311138 lt!311139) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67941 (= lt!311139 (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!309838)))) ((_ sign_extend 32) (currentByte!9296 (_1!9209 lt!309838))) ((_ sign_extend 32) (currentBit!9291 (_1!9209 lt!309838)))))))

(declare-fun lt!311136 () (_ BitVec 64))

(declare-fun lt!311140 () (_ BitVec 64))

(assert (=> d!67941 (= lt!311138 (bvmul lt!311136 lt!311140))))

(assert (=> d!67941 (or (= lt!311136 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311140 (bvsdiv (bvmul lt!311136 lt!311140) lt!311136)))))

(assert (=> d!67941 (= lt!311140 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67941 (= lt!311136 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!309838)))))))

(assert (=> d!67941 (= lt!311137 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 (_1!9209 lt!309838))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 (_1!9209 lt!309838)))))))

(assert (=> d!67941 (invariant!0 (currentBit!9291 (_1!9209 lt!309838)) (currentByte!9296 (_1!9209 lt!309838)) (size!4457 (buf!4949 (_1!9209 lt!309838))))))

(assert (=> d!67941 (= (bitIndex!0 (size!4457 (buf!4949 (_1!9209 lt!309838))) (currentByte!9296 (_1!9209 lt!309838)) (currentBit!9291 (_1!9209 lt!309838))) lt!311137)))

(declare-fun b!199264 () Bool)

(declare-fun res!166803 () Bool)

(assert (=> b!199264 (=> (not res!166803) (not e!136743))))

(assert (=> b!199264 (= res!166803 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311137))))

(declare-fun b!199265 () Bool)

(declare-fun lt!311135 () (_ BitVec 64))

(assert (=> b!199265 (= e!136743 (bvsle lt!311137 (bvmul lt!311135 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199265 (or (= lt!311135 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311135 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311135)))))

(assert (=> b!199265 (= lt!311135 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!309838)))))))

(assert (= (and d!67941 res!166804) b!199264))

(assert (= (and b!199264 res!166803) b!199265))

(declare-fun m!308963 () Bool)

(assert (=> d!67941 m!308963))

(declare-fun m!308965 () Bool)

(assert (=> d!67941 m!308965))

(assert (=> d!67551 d!67941))

(declare-fun d!67943 () Bool)

(declare-fun e!136744 () Bool)

(assert (=> d!67943 e!136744))

(declare-fun res!166806 () Bool)

(assert (=> d!67943 (=> (not res!166806) (not e!136744))))

(declare-fun lt!311143 () (_ BitVec 64))

(declare-fun lt!311144 () (_ BitVec 64))

(declare-fun lt!311145 () (_ BitVec 64))

(assert (=> d!67943 (= res!166806 (= lt!311143 (bvsub lt!311144 lt!311145)))))

(assert (=> d!67943 (or (= (bvand lt!311144 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311145 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311144 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311144 lt!311145) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67943 (= lt!311145 (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!309840)))) ((_ sign_extend 32) (currentByte!9296 (_1!9209 lt!309840))) ((_ sign_extend 32) (currentBit!9291 (_1!9209 lt!309840)))))))

(declare-fun lt!311142 () (_ BitVec 64))

(declare-fun lt!311146 () (_ BitVec 64))

(assert (=> d!67943 (= lt!311144 (bvmul lt!311142 lt!311146))))

(assert (=> d!67943 (or (= lt!311142 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311146 (bvsdiv (bvmul lt!311142 lt!311146) lt!311142)))))

(assert (=> d!67943 (= lt!311146 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67943 (= lt!311142 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!309840)))))))

(assert (=> d!67943 (= lt!311143 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 (_1!9209 lt!309840))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 (_1!9209 lt!309840)))))))

(assert (=> d!67943 (invariant!0 (currentBit!9291 (_1!9209 lt!309840)) (currentByte!9296 (_1!9209 lt!309840)) (size!4457 (buf!4949 (_1!9209 lt!309840))))))

(assert (=> d!67943 (= (bitIndex!0 (size!4457 (buf!4949 (_1!9209 lt!309840))) (currentByte!9296 (_1!9209 lt!309840)) (currentBit!9291 (_1!9209 lt!309840))) lt!311143)))

(declare-fun b!199266 () Bool)

(declare-fun res!166805 () Bool)

(assert (=> b!199266 (=> (not res!166805) (not e!136744))))

(assert (=> b!199266 (= res!166805 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311143))))

(declare-fun b!199267 () Bool)

(declare-fun lt!311141 () (_ BitVec 64))

(assert (=> b!199267 (= e!136744 (bvsle lt!311143 (bvmul lt!311141 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199267 (or (= lt!311141 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311141 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311141)))))

(assert (=> b!199267 (= lt!311141 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!309840)))))))

(assert (= (and d!67943 res!166806) b!199266))

(assert (= (and b!199266 res!166805) b!199267))

(declare-fun m!308967 () Bool)

(assert (=> d!67943 m!308967))

(declare-fun m!308969 () Bool)

(assert (=> d!67943 m!308969))

(assert (=> d!67551 d!67943))

(declare-fun d!67945 () Bool)

(assert (=> d!67945 (isPrefixOf!0 lt!309822 (_2!9206 lt!309593))))

(declare-fun lt!311147 () Unit!14060)

(assert (=> d!67945 (= lt!311147 (choose!30 lt!309822 (_2!9206 lt!309593) (_2!9206 lt!309593)))))

(assert (=> d!67945 (isPrefixOf!0 lt!309822 (_2!9206 lt!309593))))

(assert (=> d!67945 (= (lemmaIsPrefixTransitive!0 lt!309822 (_2!9206 lt!309593) (_2!9206 lt!309593)) lt!311147)))

(declare-fun bs!16788 () Bool)

(assert (= bs!16788 d!67945))

(assert (=> bs!16788 m!307803))

(declare-fun m!308971 () Bool)

(assert (=> bs!16788 m!308971))

(assert (=> bs!16788 m!307803))

(assert (=> d!67545 d!67945))

(declare-fun d!67947 () Bool)

(assert (=> d!67947 (isPrefixOf!0 lt!309822 (_2!9206 lt!309593))))

(declare-fun lt!311148 () Unit!14060)

(assert (=> d!67947 (= lt!311148 (choose!30 lt!309822 (_2!9206 lt!309597) (_2!9206 lt!309593)))))

(assert (=> d!67947 (isPrefixOf!0 lt!309822 (_2!9206 lt!309597))))

(assert (=> d!67947 (= (lemmaIsPrefixTransitive!0 lt!309822 (_2!9206 lt!309597) (_2!9206 lt!309593)) lt!311148)))

(declare-fun bs!16789 () Bool)

(assert (= bs!16789 d!67947))

(assert (=> bs!16789 m!307803))

(declare-fun m!308973 () Bool)

(assert (=> bs!16789 m!308973))

(declare-fun m!308975 () Bool)

(assert (=> bs!16789 m!308975))

(assert (=> d!67545 d!67947))

(declare-fun d!67949 () Bool)

(assert (=> d!67949 (isPrefixOf!0 (_2!9206 lt!309597) (_2!9206 lt!309597))))

(declare-fun lt!311149 () Unit!14060)

(assert (=> d!67949 (= lt!311149 (choose!11 (_2!9206 lt!309597)))))

(assert (=> d!67949 (= (lemmaIsPrefixRefl!0 (_2!9206 lt!309597)) lt!311149)))

(declare-fun bs!16790 () Bool)

(assert (= bs!16790 d!67949))

(assert (=> bs!16790 m!307807))

(declare-fun m!308977 () Bool)

(assert (=> bs!16790 m!308977))

(assert (=> d!67545 d!67949))

(declare-fun d!67951 () Bool)

(declare-fun res!166807 () Bool)

(declare-fun e!136746 () Bool)

(assert (=> d!67951 (=> (not res!166807) (not e!136746))))

(assert (=> d!67951 (= res!166807 (= (size!4457 (buf!4949 (_1!9207 lt!309820))) (size!4457 (buf!4949 (_2!9207 lt!309820)))))))

(assert (=> d!67951 (= (isPrefixOf!0 (_1!9207 lt!309820) (_2!9207 lt!309820)) e!136746)))

(declare-fun b!199268 () Bool)

(declare-fun res!166809 () Bool)

(assert (=> b!199268 (=> (not res!166809) (not e!136746))))

(assert (=> b!199268 (= res!166809 (bvsle (bitIndex!0 (size!4457 (buf!4949 (_1!9207 lt!309820))) (currentByte!9296 (_1!9207 lt!309820)) (currentBit!9291 (_1!9207 lt!309820))) (bitIndex!0 (size!4457 (buf!4949 (_2!9207 lt!309820))) (currentByte!9296 (_2!9207 lt!309820)) (currentBit!9291 (_2!9207 lt!309820)))))))

(declare-fun b!199269 () Bool)

(declare-fun e!136745 () Bool)

(assert (=> b!199269 (= e!136746 e!136745)))

(declare-fun res!166808 () Bool)

(assert (=> b!199269 (=> res!166808 e!136745)))

(assert (=> b!199269 (= res!166808 (= (size!4457 (buf!4949 (_1!9207 lt!309820))) #b00000000000000000000000000000000))))

(declare-fun b!199270 () Bool)

(assert (=> b!199270 (= e!136745 (arrayBitRangesEq!0 (buf!4949 (_1!9207 lt!309820)) (buf!4949 (_2!9207 lt!309820)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4457 (buf!4949 (_1!9207 lt!309820))) (currentByte!9296 (_1!9207 lt!309820)) (currentBit!9291 (_1!9207 lt!309820)))))))

(assert (= (and d!67951 res!166807) b!199268))

(assert (= (and b!199268 res!166809) b!199269))

(assert (= (and b!199269 (not res!166808)) b!199270))

(assert (=> b!199268 m!308907))

(assert (=> b!199268 m!308521))

(assert (=> b!199270 m!308907))

(assert (=> b!199270 m!308907))

(declare-fun m!308979 () Bool)

(assert (=> b!199270 m!308979))

(assert (=> d!67545 d!67951))

(assert (=> d!67545 d!67917))

(declare-fun d!67953 () Bool)

(declare-fun res!166810 () Bool)

(declare-fun e!136748 () Bool)

(assert (=> d!67953 (=> (not res!166810) (not e!136748))))

(assert (=> d!67953 (= res!166810 (= (size!4457 (buf!4949 lt!309822)) (size!4457 (buf!4949 (_2!9206 lt!309593)))))))

(assert (=> d!67953 (= (isPrefixOf!0 lt!309822 (_2!9206 lt!309593)) e!136748)))

(declare-fun b!199271 () Bool)

(declare-fun res!166812 () Bool)

(assert (=> b!199271 (=> (not res!166812) (not e!136748))))

(assert (=> b!199271 (= res!166812 (bvsle (bitIndex!0 (size!4457 (buf!4949 lt!309822)) (currentByte!9296 lt!309822) (currentBit!9291 lt!309822)) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309593))) (currentByte!9296 (_2!9206 lt!309593)) (currentBit!9291 (_2!9206 lt!309593)))))))

(declare-fun b!199272 () Bool)

(declare-fun e!136747 () Bool)

(assert (=> b!199272 (= e!136748 e!136747)))

(declare-fun res!166811 () Bool)

(assert (=> b!199272 (=> res!166811 e!136747)))

(assert (=> b!199272 (= res!166811 (= (size!4457 (buf!4949 lt!309822)) #b00000000000000000000000000000000))))

(declare-fun b!199273 () Bool)

(assert (=> b!199273 (= e!136747 (arrayBitRangesEq!0 (buf!4949 lt!309822) (buf!4949 (_2!9206 lt!309593)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4457 (buf!4949 lt!309822)) (currentByte!9296 lt!309822) (currentBit!9291 lt!309822))))))

(assert (= (and d!67953 res!166810) b!199271))

(assert (= (and b!199271 res!166812) b!199272))

(assert (= (and b!199272 (not res!166811)) b!199273))

(declare-fun m!308981 () Bool)

(assert (=> b!199271 m!308981))

(assert (=> b!199271 m!307635))

(assert (=> b!199273 m!308981))

(assert (=> b!199273 m!308981))

(declare-fun m!308983 () Bool)

(assert (=> b!199273 m!308983))

(assert (=> d!67545 d!67953))

(declare-fun d!67955 () Bool)

(declare-fun res!166813 () Bool)

(declare-fun e!136750 () Bool)

(assert (=> d!67955 (=> (not res!166813) (not e!136750))))

(assert (=> d!67955 (= res!166813 (= (size!4457 (buf!4949 (_2!9206 lt!309597))) (size!4457 (buf!4949 (_2!9206 lt!309597)))))))

(assert (=> d!67955 (= (isPrefixOf!0 (_2!9206 lt!309597) (_2!9206 lt!309597)) e!136750)))

(declare-fun b!199274 () Bool)

(declare-fun res!166815 () Bool)

(assert (=> b!199274 (=> (not res!166815) (not e!136750))))

(assert (=> b!199274 (= res!166815 (bvsle (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597))) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597)))))))

(declare-fun b!199275 () Bool)

(declare-fun e!136749 () Bool)

(assert (=> b!199275 (= e!136750 e!136749)))

(declare-fun res!166814 () Bool)

(assert (=> b!199275 (=> res!166814 e!136749)))

(assert (=> b!199275 (= res!166814 (= (size!4457 (buf!4949 (_2!9206 lt!309597))) #b00000000000000000000000000000000))))

(declare-fun b!199276 () Bool)

(assert (=> b!199276 (= e!136749 (arrayBitRangesEq!0 (buf!4949 (_2!9206 lt!309597)) (buf!4949 (_2!9206 lt!309597)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309597))) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597)))))))

(assert (= (and d!67955 res!166813) b!199274))

(assert (= (and b!199274 res!166815) b!199275))

(assert (= (and b!199275 (not res!166814)) b!199276))

(assert (=> b!199274 m!307607))

(assert (=> b!199274 m!307607))

(assert (=> b!199276 m!307607))

(assert (=> b!199276 m!307607))

(declare-fun m!308985 () Bool)

(assert (=> b!199276 m!308985))

(assert (=> d!67545 d!67955))

(assert (=> d!67545 d!67697))

(declare-fun d!67957 () Bool)

(declare-fun res!166816 () Bool)

(declare-fun e!136752 () Bool)

(assert (=> d!67957 (=> (not res!166816) (not e!136752))))

(assert (=> d!67957 (= res!166816 (= (size!4457 (buf!4949 lt!309822)) (size!4457 (buf!4949 lt!309822))))))

(assert (=> d!67957 (= (isPrefixOf!0 lt!309822 lt!309822) e!136752)))

(declare-fun b!199277 () Bool)

(declare-fun res!166818 () Bool)

(assert (=> b!199277 (=> (not res!166818) (not e!136752))))

(assert (=> b!199277 (= res!166818 (bvsle (bitIndex!0 (size!4457 (buf!4949 lt!309822)) (currentByte!9296 lt!309822) (currentBit!9291 lt!309822)) (bitIndex!0 (size!4457 (buf!4949 lt!309822)) (currentByte!9296 lt!309822) (currentBit!9291 lt!309822))))))

(declare-fun b!199278 () Bool)

(declare-fun e!136751 () Bool)

(assert (=> b!199278 (= e!136752 e!136751)))

(declare-fun res!166817 () Bool)

(assert (=> b!199278 (=> res!166817 e!136751)))

(assert (=> b!199278 (= res!166817 (= (size!4457 (buf!4949 lt!309822)) #b00000000000000000000000000000000))))

(declare-fun b!199279 () Bool)

(assert (=> b!199279 (= e!136751 (arrayBitRangesEq!0 (buf!4949 lt!309822) (buf!4949 lt!309822) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4457 (buf!4949 lt!309822)) (currentByte!9296 lt!309822) (currentBit!9291 lt!309822))))))

(assert (= (and d!67957 res!166816) b!199277))

(assert (= (and b!199277 res!166818) b!199278))

(assert (= (and b!199278 (not res!166817)) b!199279))

(assert (=> b!199277 m!308981))

(assert (=> b!199277 m!308981))

(assert (=> b!199279 m!308981))

(assert (=> b!199279 m!308981))

(declare-fun m!308987 () Bool)

(assert (=> b!199279 m!308987))

(assert (=> d!67545 d!67957))

(assert (=> d!67545 d!67927))

(declare-fun d!67959 () Bool)

(assert (=> d!67959 (isPrefixOf!0 lt!309822 lt!309822)))

(declare-fun lt!311150 () Unit!14060)

(assert (=> d!67959 (= lt!311150 (choose!11 lt!309822))))

(assert (=> d!67959 (= (lemmaIsPrefixRefl!0 lt!309822) lt!311150)))

(declare-fun bs!16791 () Bool)

(assert (= bs!16791 d!67959))

(assert (=> bs!16791 m!307797))

(declare-fun m!308989 () Bool)

(assert (=> bs!16791 m!308989))

(assert (=> d!67545 d!67959))

(assert (=> d!67519 d!67889))

(assert (=> d!67519 d!67691))

(declare-fun d!67961 () Bool)

(declare-fun res!166819 () Bool)

(declare-fun e!136754 () Bool)

(assert (=> d!67961 (=> (not res!166819) (not e!136754))))

(assert (=> d!67961 (= res!166819 (= (size!4457 (buf!4949 thiss!1204)) (size!4457 (buf!4949 (_2!9206 lt!309859)))))))

(assert (=> d!67961 (= (isPrefixOf!0 thiss!1204 (_2!9206 lt!309859)) e!136754)))

(declare-fun b!199280 () Bool)

(declare-fun res!166821 () Bool)

(assert (=> b!199280 (=> (not res!166821) (not e!136754))))

(assert (=> b!199280 (= res!166821 (bvsle (bitIndex!0 (size!4457 (buf!4949 thiss!1204)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309859))) (currentByte!9296 (_2!9206 lt!309859)) (currentBit!9291 (_2!9206 lt!309859)))))))

(declare-fun b!199281 () Bool)

(declare-fun e!136753 () Bool)

(assert (=> b!199281 (= e!136754 e!136753)))

(declare-fun res!166820 () Bool)

(assert (=> b!199281 (=> res!166820 e!136753)))

(assert (=> b!199281 (= res!166820 (= (size!4457 (buf!4949 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!199282 () Bool)

(assert (=> b!199282 (= e!136753 (arrayBitRangesEq!0 (buf!4949 thiss!1204) (buf!4949 (_2!9206 lt!309859)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4457 (buf!4949 thiss!1204)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204))))))

(assert (= (and d!67961 res!166819) b!199280))

(assert (= (and b!199280 res!166821) b!199281))

(assert (= (and b!199281 (not res!166820)) b!199282))

(assert (=> b!199280 m!307609))

(assert (=> b!199280 m!307849))

(assert (=> b!199282 m!307609))

(assert (=> b!199282 m!307609))

(declare-fun m!308991 () Bool)

(assert (=> b!199282 m!308991))

(assert (=> b!198772 d!67961))

(declare-fun b!199283 () Bool)

(declare-fun res!166823 () Bool)

(declare-fun e!136755 () Bool)

(assert (=> b!199283 (=> (not res!166823) (not e!136755))))

(declare-fun lt!311151 () (_ BitVec 64))

(declare-fun lt!311154 () (_ BitVec 64))

(declare-fun lt!311155 () tuple2!17134)

(assert (=> b!199283 (= res!166823 (= (bitIndex!0 (size!4457 (buf!4949 (_2!9215 lt!311155))) (currentByte!9296 (_2!9215 lt!311155)) (currentBit!9291 (_2!9215 lt!311155))) (bvadd lt!311154 lt!311151)))))

(assert (=> b!199283 (or (not (= (bvand lt!311154 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311151 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311154 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311154 lt!311151) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199283 (= lt!311151 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!199283 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!199283 (= lt!311154 (bitIndex!0 (size!4457 (buf!4949 (_1!9207 lt!309590))) (currentByte!9296 (_1!9207 lt!309590)) (currentBit!9291 (_1!9207 lt!309590))))))

(declare-fun b!199284 () Bool)

(declare-fun res!166824 () Bool)

(assert (=> b!199284 (=> (not res!166824) (not e!136755))))

(assert (=> b!199284 (= res!166824 (= (bvand (_1!9215 lt!311155) (onesLSBLong!0 nBits!348)) (_1!9215 lt!311155)))))

(declare-fun lt!311156 () (_ BitVec 64))

(declare-fun e!136757 () Bool)

(declare-fun b!199285 () Bool)

(assert (=> b!199285 (= e!136757 (= (= (bvand (bvlshr (_1!9215 lt!311155) lt!311156) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!9209 (readBitPure!0 (_1!9207 lt!309590)))))))

(assert (=> b!199285 (and (bvsge lt!311156 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!311156 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!199285 (= lt!311156 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!199286 () Bool)

(assert (=> b!199286 (= e!136755 e!136757)))

(declare-fun res!166826 () Bool)

(assert (=> b!199286 (=> res!166826 e!136757)))

(assert (=> b!199286 (= res!166826 (not (bvslt (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-fun b!199287 () Bool)

(declare-fun res!166825 () Bool)

(assert (=> b!199287 (=> (not res!166825) (not e!136755))))

(assert (=> b!199287 (= res!166825 (= (bvand (_1!9215 lt!311155) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))) (bvand lt!309610 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun b!199289 () Bool)

(declare-fun e!136756 () tuple2!17134)

(assert (=> b!199289 (= e!136756 (tuple2!17135 lt!309610 (_1!9207 lt!309590)))))

(declare-fun b!199288 () Bool)

(declare-fun lt!311153 () tuple2!17134)

(assert (=> b!199288 (= e!136756 (tuple2!17135 (_1!9215 lt!311153) (_2!9215 lt!311153)))))

(declare-fun lt!311152 () tuple2!17132)

(assert (=> b!199288 (= lt!311152 (readBit!0 (_1!9207 lt!309590)))))

(assert (=> b!199288 (= lt!311153 (readNBitsLSBFirstsLoop!0 (_2!9214 lt!311152) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!309610 (ite (_1!9214 lt!311152) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!67963 () Bool)

(assert (=> d!67963 e!136755))

(declare-fun res!166822 () Bool)

(assert (=> d!67963 (=> (not res!166822) (not e!136755))))

(assert (=> d!67963 (= res!166822 (= (buf!4949 (_2!9215 lt!311155)) (buf!4949 (_1!9207 lt!309590))))))

(assert (=> d!67963 (= lt!311155 e!136756)))

(declare-fun c!9937 () Bool)

(assert (=> d!67963 (= c!9937 (= nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (=> d!67963 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsle (bvadd #b00000000000000000000000000000001 i!590) nBits!348) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!67963 (= (readNBitsLSBFirstsLoop!0 (_1!9207 lt!309590) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!309610) lt!311155)))

(assert (= (and d!67963 c!9937) b!199289))

(assert (= (and d!67963 (not c!9937)) b!199288))

(assert (= (and d!67963 res!166822) b!199283))

(assert (= (and b!199283 res!166823) b!199287))

(assert (= (and b!199287 res!166825) b!199284))

(assert (= (and b!199284 res!166824) b!199286))

(assert (= (and b!199286 (not res!166826)) b!199285))

(declare-fun m!308993 () Bool)

(assert (=> b!199283 m!308993))

(declare-fun m!308995 () Bool)

(assert (=> b!199283 m!308995))

(assert (=> b!199287 m!308171))

(declare-fun m!308997 () Bool)

(assert (=> b!199285 m!308997))

(assert (=> b!199284 m!308165))

(declare-fun m!308999 () Bool)

(assert (=> b!199288 m!308999))

(declare-fun m!309001 () Bool)

(assert (=> b!199288 m!309001))

(assert (=> d!67533 d!67963))

(declare-fun d!67965 () Bool)

(declare-fun e!136758 () Bool)

(assert (=> d!67965 e!136758))

(declare-fun res!166828 () Bool)

(assert (=> d!67965 (=> (not res!166828) (not e!136758))))

(declare-fun lt!311160 () (_ BitVec 64))

(declare-fun lt!311159 () (_ BitVec 64))

(declare-fun lt!311161 () (_ BitVec 64))

(assert (=> d!67965 (= res!166828 (= lt!311159 (bvsub lt!311160 lt!311161)))))

(assert (=> d!67965 (or (= (bvand lt!311160 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311161 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311160 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311160 lt!311161) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67965 (= lt!311161 (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310327)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!310327))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!310327)))))))

(declare-fun lt!311158 () (_ BitVec 64))

(declare-fun lt!311162 () (_ BitVec 64))

(assert (=> d!67965 (= lt!311160 (bvmul lt!311158 lt!311162))))

(assert (=> d!67965 (or (= lt!311158 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311162 (bvsdiv (bvmul lt!311158 lt!311162) lt!311158)))))

(assert (=> d!67965 (= lt!311162 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67965 (= lt!311158 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310327)))))))

(assert (=> d!67965 (= lt!311159 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!310327))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!310327)))))))

(assert (=> d!67965 (invariant!0 (currentBit!9291 (_2!9206 lt!310327)) (currentByte!9296 (_2!9206 lt!310327)) (size!4457 (buf!4949 (_2!9206 lt!310327))))))

(assert (=> d!67965 (= (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310327))) (currentByte!9296 (_2!9206 lt!310327)) (currentBit!9291 (_2!9206 lt!310327))) lt!311159)))

(declare-fun b!199290 () Bool)

(declare-fun res!166827 () Bool)

(assert (=> b!199290 (=> (not res!166827) (not e!136758))))

(assert (=> b!199290 (= res!166827 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311159))))

(declare-fun b!199291 () Bool)

(declare-fun lt!311157 () (_ BitVec 64))

(assert (=> b!199291 (= e!136758 (bvsle lt!311159 (bvmul lt!311157 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199291 (or (= lt!311157 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311157 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311157)))))

(assert (=> b!199291 (= lt!311157 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310327)))))))

(assert (= (and d!67965 res!166828) b!199290))

(assert (= (and b!199290 res!166827) b!199291))

(declare-fun m!309003 () Bool)

(assert (=> d!67965 m!309003))

(assert (=> d!67965 m!308135))

(assert (=> b!198935 d!67965))

(assert (=> b!198935 d!67517))

(declare-fun d!67967 () Bool)

(assert (=> d!67967 (= (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309597)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309597))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309597)))) (bvsub (bvmul ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309597)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309597))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309597))))))))

(assert (=> d!67517 d!67967))

(assert (=> d!67517 d!67861))

(declare-fun d!67969 () Bool)

(declare-fun e!136759 () Bool)

(assert (=> d!67969 e!136759))

(declare-fun res!166830 () Bool)

(assert (=> d!67969 (=> (not res!166830) (not e!136759))))

(declare-fun lt!311167 () (_ BitVec 64))

(declare-fun lt!311166 () (_ BitVec 64))

(declare-fun lt!311165 () (_ BitVec 64))

(assert (=> d!67969 (= res!166830 (= lt!311165 (bvsub lt!311166 lt!311167)))))

(assert (=> d!67969 (or (= (bvand lt!311166 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311167 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311166 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311166 lt!311167) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67969 (= lt!311167 (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!310371)))) ((_ sign_extend 32) (currentByte!9296 (_1!9209 lt!310371))) ((_ sign_extend 32) (currentBit!9291 (_1!9209 lt!310371)))))))

(declare-fun lt!311164 () (_ BitVec 64))

(declare-fun lt!311168 () (_ BitVec 64))

(assert (=> d!67969 (= lt!311166 (bvmul lt!311164 lt!311168))))

(assert (=> d!67969 (or (= lt!311164 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311168 (bvsdiv (bvmul lt!311164 lt!311168) lt!311164)))))

(assert (=> d!67969 (= lt!311168 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67969 (= lt!311164 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!310371)))))))

(assert (=> d!67969 (= lt!311165 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 (_1!9209 lt!310371))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 (_1!9209 lt!310371)))))))

(assert (=> d!67969 (invariant!0 (currentBit!9291 (_1!9209 lt!310371)) (currentByte!9296 (_1!9209 lt!310371)) (size!4457 (buf!4949 (_1!9209 lt!310371))))))

(assert (=> d!67969 (= (bitIndex!0 (size!4457 (buf!4949 (_1!9209 lt!310371))) (currentByte!9296 (_1!9209 lt!310371)) (currentBit!9291 (_1!9209 lt!310371))) lt!311165)))

(declare-fun b!199292 () Bool)

(declare-fun res!166829 () Bool)

(assert (=> b!199292 (=> (not res!166829) (not e!136759))))

(assert (=> b!199292 (= res!166829 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311165))))

(declare-fun b!199293 () Bool)

(declare-fun lt!311163 () (_ BitVec 64))

(assert (=> b!199293 (= e!136759 (bvsle lt!311165 (bvmul lt!311163 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199293 (or (= lt!311163 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311163 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311163)))))

(assert (=> b!199293 (= lt!311163 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!310371)))))))

(assert (= (and d!67969 res!166830) b!199292))

(assert (= (and b!199292 res!166829) b!199293))

(declare-fun m!309005 () Bool)

(assert (=> d!67969 m!309005))

(declare-fun m!309007 () Bool)

(assert (=> d!67969 m!309007))

(assert (=> b!198937 d!67969))

(declare-fun d!67971 () Bool)

(declare-fun e!136760 () Bool)

(assert (=> d!67971 e!136760))

(declare-fun res!166832 () Bool)

(assert (=> d!67971 (=> (not res!166832) (not e!136760))))

(declare-fun lt!311172 () (_ BitVec 64))

(declare-fun lt!311173 () (_ BitVec 64))

(declare-fun lt!311171 () (_ BitVec 64))

(assert (=> d!67971 (= res!166832 (= lt!311171 (bvsub lt!311172 lt!311173)))))

(assert (=> d!67971 (or (= (bvand lt!311172 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311173 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311172 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311172 lt!311173) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67971 (= lt!311173 (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310330)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!310330))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!310330)))))))

(declare-fun lt!311170 () (_ BitVec 64))

(declare-fun lt!311174 () (_ BitVec 64))

(assert (=> d!67971 (= lt!311172 (bvmul lt!311170 lt!311174))))

(assert (=> d!67971 (or (= lt!311170 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311174 (bvsdiv (bvmul lt!311170 lt!311174) lt!311170)))))

(assert (=> d!67971 (= lt!311174 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67971 (= lt!311170 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310330)))))))

(assert (=> d!67971 (= lt!311171 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!310330))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!310330)))))))

(assert (=> d!67971 (invariant!0 (currentBit!9291 (_2!9206 lt!310330)) (currentByte!9296 (_2!9206 lt!310330)) (size!4457 (buf!4949 (_2!9206 lt!310330))))))

(assert (=> d!67971 (= (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!310330))) (currentByte!9296 (_2!9206 lt!310330)) (currentBit!9291 (_2!9206 lt!310330))) lt!311171)))

(declare-fun b!199294 () Bool)

(declare-fun res!166831 () Bool)

(assert (=> b!199294 (=> (not res!166831) (not e!136760))))

(assert (=> b!199294 (= res!166831 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311171))))

(declare-fun b!199295 () Bool)

(declare-fun lt!311169 () (_ BitVec 64))

(assert (=> b!199295 (= e!136760 (bvsle lt!311171 (bvmul lt!311169 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199295 (or (= lt!311169 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311169 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311169)))))

(assert (=> b!199295 (= lt!311169 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!310330)))))))

(assert (= (and d!67971 res!166832) b!199294))

(assert (= (and b!199294 res!166831) b!199295))

(declare-fun m!309009 () Bool)

(assert (=> d!67971 m!309009))

(assert (=> d!67971 m!308901))

(assert (=> b!198937 d!67971))

(declare-fun b!199307 () Bool)

(declare-fun res!166844 () Bool)

(declare-fun e!136772 () Bool)

(assert (=> b!199307 (=> (not res!166844) (not e!136772))))

(declare-fun _$19!162 () tuple2!17116)

(assert (=> b!199307 (= res!166844 (isPrefixOf!0 thiss!1204 (_2!9206 _$19!162)))))

(declare-fun b!199308 () Bool)

(declare-fun e!136770 () Bool)

(assert (=> b!199308 (= e!136770 (array_inv!4198 (buf!4949 (_2!9206 _$19!162))))))

(declare-fun b!199309 () Bool)

(declare-fun e!136769 () Bool)

(declare-fun lt!311177 () tuple2!17122)

(assert (=> b!199309 (= e!136769 (= (bitIndex!0 (size!4457 (buf!4949 (_1!9209 lt!311177))) (currentByte!9296 (_1!9209 lt!311177)) (currentBit!9291 (_1!9209 lt!311177))) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 _$19!162))) (currentByte!9296 (_2!9206 _$19!162)) (currentBit!9291 (_2!9206 _$19!162)))))))

(declare-fun b!199310 () Bool)

(declare-fun res!166842 () Bool)

(assert (=> b!199310 (=> (not res!166842) (not e!136772))))

(assert (=> b!199310 (= res!166842 (= (bitIndex!0 (size!4457 (buf!4949 (_2!9206 _$19!162))) (currentByte!9296 (_2!9206 _$19!162)) (currentBit!9291 (_2!9206 _$19!162))) (bvadd (bitIndex!0 (size!4457 (buf!4949 thiss!1204)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!67973 () Bool)

(assert (=> d!67973 e!136772))

(declare-fun res!166841 () Bool)

(assert (=> d!67973 (=> (not res!166841) (not e!136772))))

(assert (=> d!67973 (= res!166841 (= (size!4457 (buf!4949 thiss!1204)) (size!4457 (buf!4949 (_2!9206 _$19!162)))))))

(assert (=> d!67973 (and (inv!12 (_2!9206 _$19!162)) e!136770)))

(assert (=> d!67973 (= (choose!16 thiss!1204 lt!309601) _$19!162)))

(declare-fun b!199311 () Bool)

(assert (=> b!199311 (= e!136772 e!136769)))

(declare-fun res!166843 () Bool)

(assert (=> b!199311 (=> (not res!166843) (not e!136769))))

(assert (=> b!199311 (= res!166843 (and (= (_2!9209 lt!311177) lt!309601) (= (_1!9209 lt!311177) (_2!9206 _$19!162))))))

(assert (=> b!199311 (= lt!311177 (readBitPure!0 (readerFrom!0 (_2!9206 _$19!162) (currentBit!9291 thiss!1204) (currentByte!9296 thiss!1204))))))

(assert (= d!67973 b!199308))

(assert (= (and d!67973 res!166841) b!199310))

(assert (= (and b!199310 res!166842) b!199307))

(assert (= (and b!199307 res!166844) b!199311))

(assert (= (and b!199311 res!166843) b!199309))

(declare-fun m!309011 () Bool)

(assert (=> d!67973 m!309011))

(declare-fun m!309013 () Bool)

(assert (=> b!199308 m!309013))

(declare-fun m!309015 () Bool)

(assert (=> b!199309 m!309015))

(declare-fun m!309017 () Bool)

(assert (=> b!199309 m!309017))

(assert (=> b!199310 m!309017))

(assert (=> b!199310 m!307609))

(declare-fun m!309019 () Bool)

(assert (=> b!199311 m!309019))

(assert (=> b!199311 m!309019))

(declare-fun m!309021 () Bool)

(assert (=> b!199311 m!309021))

(declare-fun m!309023 () Bool)

(assert (=> b!199307 m!309023))

(assert (=> d!67563 d!67973))

(declare-fun d!67975 () Bool)

(assert (=> d!67975 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4457 (buf!4949 thiss!1204))) ((_ sign_extend 32) (currentByte!9296 thiss!1204)) ((_ sign_extend 32) (currentBit!9291 thiss!1204))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 thiss!1204))) ((_ sign_extend 32) (currentByte!9296 thiss!1204)) ((_ sign_extend 32) (currentBit!9291 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!16792 () Bool)

(assert (= bs!16792 d!67975))

(assert (=> bs!16792 m!307733))

(assert (=> d!67563 d!67975))

(declare-fun d!67977 () Bool)

(declare-fun e!136773 () Bool)

(assert (=> d!67977 e!136773))

(declare-fun res!166846 () Bool)

(assert (=> d!67977 (=> (not res!166846) (not e!136773))))

(declare-fun lt!311182 () (_ BitVec 64))

(declare-fun lt!311180 () (_ BitVec 64))

(declare-fun lt!311181 () (_ BitVec 64))

(assert (=> d!67977 (= res!166846 (= lt!311180 (bvsub lt!311181 lt!311182)))))

(assert (=> d!67977 (or (= (bvand lt!311181 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311182 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311181 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311181 lt!311182) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67977 (= lt!311182 (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!309858)))) ((_ sign_extend 32) (currentByte!9296 (_1!9209 lt!309858))) ((_ sign_extend 32) (currentBit!9291 (_1!9209 lt!309858)))))))

(declare-fun lt!311179 () (_ BitVec 64))

(declare-fun lt!311183 () (_ BitVec 64))

(assert (=> d!67977 (= lt!311181 (bvmul lt!311179 lt!311183))))

(assert (=> d!67977 (or (= lt!311179 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311183 (bvsdiv (bvmul lt!311179 lt!311183) lt!311179)))))

(assert (=> d!67977 (= lt!311183 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67977 (= lt!311179 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!309858)))))))

(assert (=> d!67977 (= lt!311180 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 (_1!9209 lt!309858))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 (_1!9209 lt!309858)))))))

(assert (=> d!67977 (invariant!0 (currentBit!9291 (_1!9209 lt!309858)) (currentByte!9296 (_1!9209 lt!309858)) (size!4457 (buf!4949 (_1!9209 lt!309858))))))

(assert (=> d!67977 (= (bitIndex!0 (size!4457 (buf!4949 (_1!9209 lt!309858))) (currentByte!9296 (_1!9209 lt!309858)) (currentBit!9291 (_1!9209 lt!309858))) lt!311180)))

(declare-fun b!199312 () Bool)

(declare-fun res!166845 () Bool)

(assert (=> b!199312 (=> (not res!166845) (not e!136773))))

(assert (=> b!199312 (= res!166845 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311180))))

(declare-fun b!199313 () Bool)

(declare-fun lt!311178 () (_ BitVec 64))

(assert (=> b!199313 (= e!136773 (bvsle lt!311180 (bvmul lt!311178 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199313 (or (= lt!311178 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311178 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311178)))))

(assert (=> b!199313 (= lt!311178 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9209 lt!309858)))))))

(assert (= (and d!67977 res!166846) b!199312))

(assert (= (and b!199312 res!166845) b!199313))

(declare-fun m!309025 () Bool)

(assert (=> d!67977 m!309025))

(declare-fun m!309027 () Bool)

(assert (=> d!67977 m!309027))

(assert (=> b!198774 d!67977))

(assert (=> b!198774 d!67851))

(declare-fun d!67979 () Bool)

(declare-fun e!136774 () Bool)

(assert (=> d!67979 e!136774))

(declare-fun res!166847 () Bool)

(assert (=> d!67979 (=> (not res!166847) (not e!136774))))

(assert (=> d!67979 (= res!166847 (= (buf!4949 (_2!9206 (increaseBitIndex!0 (_1!9207 lt!309604)))) (buf!4949 (_1!9207 lt!309604))))))

(declare-fun lt!311189 () Bool)

(assert (=> d!67979 (= lt!311189 (not (= (bvand ((_ sign_extend 24) (select (arr!5387 (buf!4949 (_1!9207 lt!309604))) (currentByte!9296 (_1!9207 lt!309604)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9291 (_1!9207 lt!309604))))) #b00000000000000000000000000000000)))))

(declare-fun lt!311187 () tuple2!17132)

(assert (=> d!67979 (= lt!311187 (tuple2!17133 (not (= (bvand ((_ sign_extend 24) (select (arr!5387 (buf!4949 (_1!9207 lt!309604))) (currentByte!9296 (_1!9207 lt!309604)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9291 (_1!9207 lt!309604))))) #b00000000000000000000000000000000)) (_2!9206 (increaseBitIndex!0 (_1!9207 lt!309604)))))))

(assert (=> d!67979 (validate_offset_bit!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9207 lt!309604)))) ((_ sign_extend 32) (currentByte!9296 (_1!9207 lt!309604))) ((_ sign_extend 32) (currentBit!9291 (_1!9207 lt!309604))))))

(assert (=> d!67979 (= (readBit!0 (_1!9207 lt!309604)) lt!311187)))

(declare-fun b!199314 () Bool)

(declare-fun lt!311188 () (_ BitVec 64))

(declare-fun lt!311185 () (_ BitVec 64))

(assert (=> b!199314 (= e!136774 (= (bitIndex!0 (size!4457 (buf!4949 (_2!9206 (increaseBitIndex!0 (_1!9207 lt!309604))))) (currentByte!9296 (_2!9206 (increaseBitIndex!0 (_1!9207 lt!309604)))) (currentBit!9291 (_2!9206 (increaseBitIndex!0 (_1!9207 lt!309604))))) (bvadd lt!311188 lt!311185)))))

(assert (=> b!199314 (or (not (= (bvand lt!311188 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311185 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311188 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311188 lt!311185) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199314 (= lt!311185 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!199314 (= lt!311188 (bitIndex!0 (size!4457 (buf!4949 (_1!9207 lt!309604))) (currentByte!9296 (_1!9207 lt!309604)) (currentBit!9291 (_1!9207 lt!309604))))))

(declare-fun lt!311186 () Bool)

(assert (=> b!199314 (= lt!311186 (not (= (bvand ((_ sign_extend 24) (select (arr!5387 (buf!4949 (_1!9207 lt!309604))) (currentByte!9296 (_1!9207 lt!309604)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9291 (_1!9207 lt!309604))))) #b00000000000000000000000000000000)))))

(declare-fun lt!311190 () Bool)

(assert (=> b!199314 (= lt!311190 (not (= (bvand ((_ sign_extend 24) (select (arr!5387 (buf!4949 (_1!9207 lt!309604))) (currentByte!9296 (_1!9207 lt!309604)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9291 (_1!9207 lt!309604))))) #b00000000000000000000000000000000)))))

(declare-fun lt!311184 () Bool)

(assert (=> b!199314 (= lt!311184 (not (= (bvand ((_ sign_extend 24) (select (arr!5387 (buf!4949 (_1!9207 lt!309604))) (currentByte!9296 (_1!9207 lt!309604)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9291 (_1!9207 lt!309604))))) #b00000000000000000000000000000000)))))

(assert (= (and d!67979 res!166847) b!199314))

(declare-fun m!309029 () Bool)

(assert (=> d!67979 m!309029))

(declare-fun m!309031 () Bool)

(assert (=> d!67979 m!309031))

(declare-fun m!309033 () Bool)

(assert (=> d!67979 m!309033))

(declare-fun m!309035 () Bool)

(assert (=> d!67979 m!309035))

(assert (=> b!199314 m!307869))

(assert (=> b!199314 m!309031))

(assert (=> b!199314 m!309033))

(declare-fun m!309037 () Bool)

(assert (=> b!199314 m!309037))

(assert (=> b!199314 m!309029))

(assert (=> d!67549 d!67979))

(assert (=> b!198939 d!67949))

(assert (=> d!67547 d!67527))

(declare-fun d!67981 () Bool)

(assert (=> d!67981 (validate_offset_bits!1 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309593)))) ((_ sign_extend 32) (currentByte!9296 (_2!9206 lt!309597))) ((_ sign_extend 32) (currentBit!9291 (_2!9206 lt!309597))) lt!309598)))

(assert (=> d!67981 true))

(declare-fun _$6!376 () Unit!14060)

(assert (=> d!67981 (= (choose!9 (_2!9206 lt!309597) (buf!4949 (_2!9206 lt!309593)) lt!309598 (BitStream!8023 (buf!4949 (_2!9206 lt!309593)) (currentByte!9296 (_2!9206 lt!309597)) (currentBit!9291 (_2!9206 lt!309597)))) _$6!376)))

(declare-fun bs!16793 () Bool)

(assert (= bs!16793 d!67981))

(assert (=> bs!16793 m!307585))

(assert (=> d!67547 d!67981))

(declare-fun d!67983 () Bool)

(declare-fun res!166848 () Bool)

(declare-fun e!136776 () Bool)

(assert (=> d!67983 (=> (not res!166848) (not e!136776))))

(assert (=> d!67983 (= res!166848 (= (size!4457 (buf!4949 (_1!9207 lt!309793))) (size!4457 (buf!4949 thiss!1204))))))

(assert (=> d!67983 (= (isPrefixOf!0 (_1!9207 lt!309793) thiss!1204) e!136776)))

(declare-fun b!199315 () Bool)

(declare-fun res!166850 () Bool)

(assert (=> b!199315 (=> (not res!166850) (not e!136776))))

(assert (=> b!199315 (= res!166850 (bvsle (bitIndex!0 (size!4457 (buf!4949 (_1!9207 lt!309793))) (currentByte!9296 (_1!9207 lt!309793)) (currentBit!9291 (_1!9207 lt!309793))) (bitIndex!0 (size!4457 (buf!4949 thiss!1204)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204))))))

(declare-fun b!199316 () Bool)

(declare-fun e!136775 () Bool)

(assert (=> b!199316 (= e!136776 e!136775)))

(declare-fun res!166849 () Bool)

(assert (=> b!199316 (=> res!166849 e!136775)))

(assert (=> b!199316 (= res!166849 (= (size!4457 (buf!4949 (_1!9207 lt!309793))) #b00000000000000000000000000000000))))

(declare-fun b!199317 () Bool)

(assert (=> b!199317 (= e!136775 (arrayBitRangesEq!0 (buf!4949 (_1!9207 lt!309793)) (buf!4949 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4457 (buf!4949 (_1!9207 lt!309793))) (currentByte!9296 (_1!9207 lt!309793)) (currentBit!9291 (_1!9207 lt!309793)))))))

(assert (= (and d!67983 res!166848) b!199315))

(assert (= (and b!199315 res!166850) b!199316))

(assert (= (and b!199316 (not res!166849)) b!199317))

(assert (=> b!199315 m!308917))

(assert (=> b!199315 m!307609))

(assert (=> b!199317 m!308917))

(assert (=> b!199317 m!308917))

(declare-fun m!309039 () Bool)

(assert (=> b!199317 m!309039))

(assert (=> b!198736 d!67983))

(declare-fun b!199318 () Bool)

(declare-fun res!166852 () Bool)

(declare-fun e!136777 () Bool)

(assert (=> b!199318 (=> (not res!166852) (not e!136777))))

(declare-fun lt!311191 () (_ BitVec 64))

(declare-fun lt!311194 () (_ BitVec 64))

(declare-fun lt!311195 () tuple2!17134)

(assert (=> b!199318 (= res!166852 (= (bitIndex!0 (size!4457 (buf!4949 (_2!9215 lt!311195))) (currentByte!9296 (_2!9215 lt!311195)) (currentBit!9291 (_2!9215 lt!311195))) (bvadd lt!311194 lt!311191)))))

(assert (=> b!199318 (or (not (= (bvand lt!311194 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311191 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311194 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311194 lt!311191) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199318 (= lt!311191 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (=> b!199318 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand i!590 #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 i!590) #b10000000000000000000000000000000)))))

(assert (=> b!199318 (= lt!311194 (bitIndex!0 (size!4457 (buf!4949 (_1!9207 lt!309604))) (currentByte!9296 (_1!9207 lt!309604)) (currentBit!9291 (_1!9207 lt!309604))))))

(declare-fun b!199319 () Bool)

(declare-fun res!166853 () Bool)

(assert (=> b!199319 (=> (not res!166853) (not e!136777))))

(assert (=> b!199319 (= res!166853 (= (bvand (_1!9215 lt!311195) (onesLSBLong!0 nBits!348)) (_1!9215 lt!311195)))))

(declare-fun e!136779 () Bool)

(declare-fun b!199320 () Bool)

(declare-fun lt!311196 () (_ BitVec 64))

(assert (=> b!199320 (= e!136779 (= (= (bvand (bvlshr (_1!9215 lt!311195) lt!311196) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!9209 (readBitPure!0 (_1!9207 lt!309604)))))))

(assert (=> b!199320 (and (bvsge lt!311196 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!311196 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!199320 (= lt!311196 ((_ sign_extend 32) i!590))))

(declare-fun b!199321 () Bool)

(assert (=> b!199321 (= e!136777 e!136779)))

(declare-fun res!166855 () Bool)

(assert (=> b!199321 (=> res!166855 e!136779)))

(assert (=> b!199321 (= res!166855 (not (bvslt i!590 nBits!348)))))

(declare-fun b!199322 () Bool)

(declare-fun res!166854 () Bool)

(assert (=> b!199322 (=> (not res!166854) (not e!136777))))

(assert (=> b!199322 (= res!166854 (= (bvand (_1!9215 lt!311195) (onesLSBLong!0 i!590)) (bvand lt!309607 (onesLSBLong!0 i!590))))))

(declare-fun b!199324 () Bool)

(declare-fun e!136778 () tuple2!17134)

(assert (=> b!199324 (= e!136778 (tuple2!17135 lt!309607 (_1!9207 lt!309604)))))

(declare-fun b!199323 () Bool)

(declare-fun lt!311193 () tuple2!17134)

(assert (=> b!199323 (= e!136778 (tuple2!17135 (_1!9215 lt!311193) (_2!9215 lt!311193)))))

(declare-fun lt!311192 () tuple2!17132)

(assert (=> b!199323 (= lt!311192 (readBit!0 (_1!9207 lt!309604)))))

(assert (=> b!199323 (= lt!311193 (readNBitsLSBFirstsLoop!0 (_2!9214 lt!311192) nBits!348 (bvadd i!590 #b00000000000000000000000000000001) (bvor lt!309607 (ite (_1!9214 lt!311192) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!67985 () Bool)

(assert (=> d!67985 e!136777))

(declare-fun res!166851 () Bool)

(assert (=> d!67985 (=> (not res!166851) (not e!136777))))

(assert (=> d!67985 (= res!166851 (= (buf!4949 (_2!9215 lt!311195)) (buf!4949 (_1!9207 lt!309604))))))

(assert (=> d!67985 (= lt!311195 e!136778)))

(declare-fun c!9938 () Bool)

(assert (=> d!67985 (= c!9938 (= nBits!348 i!590))))

(assert (=> d!67985 (and (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!67985 (= (readNBitsLSBFirstsLoop!0 (_1!9207 lt!309604) nBits!348 i!590 lt!309607) lt!311195)))

(assert (= (and d!67985 c!9938) b!199324))

(assert (= (and d!67985 (not c!9938)) b!199323))

(assert (= (and d!67985 res!166851) b!199318))

(assert (= (and b!199318 res!166852) b!199322))

(assert (= (and b!199322 res!166854) b!199319))

(assert (= (and b!199319 res!166853) b!199321))

(assert (= (and b!199321 (not res!166855)) b!199320))

(declare-fun m!309041 () Bool)

(assert (=> b!199318 m!309041))

(assert (=> b!199318 m!307869))

(assert (=> b!199322 m!307587))

(assert (=> b!199320 m!307583))

(assert (=> b!199319 m!308165))

(assert (=> b!199323 m!307815))

(declare-fun m!309043 () Bool)

(assert (=> b!199323 m!309043))

(assert (=> d!67529 d!67985))

(declare-fun d!67987 () Bool)

(declare-fun e!136780 () Bool)

(assert (=> d!67987 e!136780))

(declare-fun res!166857 () Bool)

(assert (=> d!67987 (=> (not res!166857) (not e!136780))))

(declare-fun lt!311200 () (_ BitVec 64))

(declare-fun lt!311199 () (_ BitVec 64))

(declare-fun lt!311201 () (_ BitVec 64))

(assert (=> d!67987 (= res!166857 (= lt!311199 (bvsub lt!311200 lt!311201)))))

(assert (=> d!67987 (or (= (bvand lt!311200 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311201 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311200 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311200 lt!311201) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67987 (= lt!311201 (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 lt!309882))) ((_ sign_extend 32) (currentByte!9296 lt!309882)) ((_ sign_extend 32) (currentBit!9291 lt!309882))))))

(declare-fun lt!311198 () (_ BitVec 64))

(declare-fun lt!311202 () (_ BitVec 64))

(assert (=> d!67987 (= lt!311200 (bvmul lt!311198 lt!311202))))

(assert (=> d!67987 (or (= lt!311198 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311202 (bvsdiv (bvmul lt!311198 lt!311202) lt!311198)))))

(assert (=> d!67987 (= lt!311202 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67987 (= lt!311198 ((_ sign_extend 32) (size!4457 (buf!4949 lt!309882))))))

(assert (=> d!67987 (= lt!311199 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 lt!309882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 lt!309882))))))

(assert (=> d!67987 (invariant!0 (currentBit!9291 lt!309882) (currentByte!9296 lt!309882) (size!4457 (buf!4949 lt!309882)))))

(assert (=> d!67987 (= (bitIndex!0 (size!4457 (buf!4949 lt!309882)) (currentByte!9296 lt!309882) (currentBit!9291 lt!309882)) lt!311199)))

(declare-fun b!199325 () Bool)

(declare-fun res!166856 () Bool)

(assert (=> b!199325 (=> (not res!166856) (not e!136780))))

(assert (=> b!199325 (= res!166856 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311199))))

(declare-fun b!199326 () Bool)

(declare-fun lt!311197 () (_ BitVec 64))

(assert (=> b!199326 (= e!136780 (bvsle lt!311199 (bvmul lt!311197 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199326 (or (= lt!311197 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311197 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311197)))))

(assert (=> b!199326 (= lt!311197 ((_ sign_extend 32) (size!4457 (buf!4949 lt!309882))))))

(assert (= (and d!67987 res!166857) b!199325))

(assert (= (and b!199325 res!166856) b!199326))

(declare-fun m!309045 () Bool)

(assert (=> d!67987 m!309045))

(declare-fun m!309047 () Bool)

(assert (=> d!67987 m!309047))

(assert (=> d!67573 d!67987))

(declare-fun d!67989 () Bool)

(declare-fun e!136781 () Bool)

(assert (=> d!67989 e!136781))

(declare-fun res!166859 () Bool)

(assert (=> d!67989 (=> (not res!166859) (not e!136781))))

(declare-fun lt!311207 () (_ BitVec 64))

(declare-fun lt!311205 () (_ BitVec 64))

(declare-fun lt!311206 () (_ BitVec 64))

(assert (=> d!67989 (= res!166859 (= lt!311205 (bvsub lt!311206 lt!311207)))))

(assert (=> d!67989 (or (= (bvand lt!311206 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311207 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311206 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311206 lt!311207) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67989 (= lt!311207 (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9207 lt!309604)))) ((_ sign_extend 32) (currentByte!9296 (_1!9207 lt!309604))) ((_ sign_extend 32) (currentBit!9291 (_1!9207 lt!309604)))))))

(declare-fun lt!311204 () (_ BitVec 64))

(declare-fun lt!311208 () (_ BitVec 64))

(assert (=> d!67989 (= lt!311206 (bvmul lt!311204 lt!311208))))

(assert (=> d!67989 (or (= lt!311204 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311208 (bvsdiv (bvmul lt!311204 lt!311208) lt!311204)))))

(assert (=> d!67989 (= lt!311208 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67989 (= lt!311204 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9207 lt!309604)))))))

(assert (=> d!67989 (= lt!311205 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 (_1!9207 lt!309604))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 (_1!9207 lt!309604)))))))

(assert (=> d!67989 (invariant!0 (currentBit!9291 (_1!9207 lt!309604)) (currentByte!9296 (_1!9207 lt!309604)) (size!4457 (buf!4949 (_1!9207 lt!309604))))))

(assert (=> d!67989 (= (bitIndex!0 (size!4457 (buf!4949 (_1!9207 lt!309604))) (currentByte!9296 (_1!9207 lt!309604)) (currentBit!9291 (_1!9207 lt!309604))) lt!311205)))

(declare-fun b!199327 () Bool)

(declare-fun res!166858 () Bool)

(assert (=> b!199327 (=> (not res!166858) (not e!136781))))

(assert (=> b!199327 (= res!166858 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311205))))

(declare-fun b!199328 () Bool)

(declare-fun lt!311203 () (_ BitVec 64))

(assert (=> b!199328 (= e!136781 (bvsle lt!311205 (bvmul lt!311203 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199328 (or (= lt!311203 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311203 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311203)))))

(assert (=> b!199328 (= lt!311203 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9207 lt!309604)))))))

(assert (= (and d!67989 res!166859) b!199327))

(assert (= (and b!199327 res!166858) b!199328))

(declare-fun m!309049 () Bool)

(assert (=> d!67989 m!309049))

(declare-fun m!309051 () Bool)

(assert (=> d!67989 m!309051))

(assert (=> d!67573 d!67989))

(declare-fun d!67991 () Bool)

(declare-fun lt!311214 () (_ BitVec 32))

(assert (=> d!67991 (= lt!311214 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!311212 () (_ BitVec 32))

(assert (=> d!67991 (= lt!311212 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!136782 () Bool)

(assert (=> d!67991 e!136782))

(declare-fun res!166861 () Bool)

(assert (=> d!67991 (=> (not res!166861) (not e!136782))))

(assert (=> d!67991 (= res!166861 (moveBitIndexPrecond!0 (_1!9207 lt!309604) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!14129 () Unit!14060)

(declare-fun Unit!14130 () Unit!14060)

(declare-fun Unit!14131 () Unit!14060)

(assert (=> d!67991 (= (moveBitIndex!0 (_1!9207 lt!309604) #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!9291 (_1!9207 lt!309604)) lt!311214) #b00000000000000000000000000000000) (tuple2!17117 Unit!14129 (BitStream!8023 (buf!4949 (_1!9207 lt!309604)) (bvsub (bvadd (currentByte!9296 (_1!9207 lt!309604)) lt!311212) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!311214 (currentBit!9291 (_1!9207 lt!309604))))) (ite (bvsge (bvadd (currentBit!9291 (_1!9207 lt!309604)) lt!311214) #b00000000000000000000000000001000) (tuple2!17117 Unit!14130 (BitStream!8023 (buf!4949 (_1!9207 lt!309604)) (bvadd (currentByte!9296 (_1!9207 lt!309604)) lt!311212 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9291 (_1!9207 lt!309604)) lt!311214) #b00000000000000000000000000001000))) (tuple2!17117 Unit!14131 (BitStream!8023 (buf!4949 (_1!9207 lt!309604)) (bvadd (currentByte!9296 (_1!9207 lt!309604)) lt!311212) (bvadd (currentBit!9291 (_1!9207 lt!309604)) lt!311214))))))))

(declare-fun b!199329 () Bool)

(declare-fun e!136783 () Bool)

(assert (=> b!199329 (= e!136782 e!136783)))

(declare-fun res!166860 () Bool)

(assert (=> b!199329 (=> (not res!166860) (not e!136783))))

(declare-fun lt!311213 () (_ BitVec 64))

(declare-fun lt!311211 () tuple2!17116)

(assert (=> b!199329 (= res!166860 (= (bvadd lt!311213 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!311211))) (currentByte!9296 (_2!9206 lt!311211)) (currentBit!9291 (_2!9206 lt!311211)))))))

(assert (=> b!199329 (or (not (= (bvand lt!311213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311213 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199329 (= lt!311213 (bitIndex!0 (size!4457 (buf!4949 (_1!9207 lt!309604))) (currentByte!9296 (_1!9207 lt!309604)) (currentBit!9291 (_1!9207 lt!309604))))))

(declare-fun lt!311209 () (_ BitVec 32))

(declare-fun lt!311210 () (_ BitVec 32))

(declare-fun Unit!14132 () Unit!14060)

(declare-fun Unit!14133 () Unit!14060)

(declare-fun Unit!14134 () Unit!14060)

(assert (=> b!199329 (= lt!311211 (ite (bvslt (bvadd (currentBit!9291 (_1!9207 lt!309604)) lt!311209) #b00000000000000000000000000000000) (tuple2!17117 Unit!14132 (BitStream!8023 (buf!4949 (_1!9207 lt!309604)) (bvsub (bvadd (currentByte!9296 (_1!9207 lt!309604)) lt!311210) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!311209 (currentBit!9291 (_1!9207 lt!309604))))) (ite (bvsge (bvadd (currentBit!9291 (_1!9207 lt!309604)) lt!311209) #b00000000000000000000000000001000) (tuple2!17117 Unit!14133 (BitStream!8023 (buf!4949 (_1!9207 lt!309604)) (bvadd (currentByte!9296 (_1!9207 lt!309604)) lt!311210 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9291 (_1!9207 lt!309604)) lt!311209) #b00000000000000000000000000001000))) (tuple2!17117 Unit!14134 (BitStream!8023 (buf!4949 (_1!9207 lt!309604)) (bvadd (currentByte!9296 (_1!9207 lt!309604)) lt!311210) (bvadd (currentBit!9291 (_1!9207 lt!309604)) lt!311209))))))))

(assert (=> b!199329 (= lt!311209 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199329 (= lt!311210 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!199330 () Bool)

(assert (=> b!199330 (= e!136783 (and (= (size!4457 (buf!4949 (_1!9207 lt!309604))) (size!4457 (buf!4949 (_2!9206 lt!311211)))) (= (buf!4949 (_1!9207 lt!309604)) (buf!4949 (_2!9206 lt!311211)))))))

(assert (= (and d!67991 res!166861) b!199329))

(assert (= (and b!199329 res!166860) b!199330))

(assert (=> d!67991 m!307873))

(declare-fun m!309053 () Bool)

(assert (=> b!199329 m!309053))

(assert (=> b!199329 m!307869))

(assert (=> d!67573 d!67991))

(declare-fun d!67993 () Bool)

(declare-fun res!166862 () Bool)

(declare-fun e!136784 () Bool)

(assert (=> d!67993 (=> (not res!166862) (not e!136784))))

(assert (=> d!67993 (= res!166862 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9207 lt!309604))))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9207 lt!309604))))))))))

(assert (=> d!67993 (= (moveBitIndexPrecond!0 (_1!9207 lt!309604) #b0000000000000000000000000000000000000000000000000000000000000001) e!136784)))

(declare-fun b!199331 () Bool)

(declare-fun lt!311215 () (_ BitVec 64))

(assert (=> b!199331 (= e!136784 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311215) (bvsle lt!311215 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4457 (buf!4949 (_1!9207 lt!309604))))))))))

(assert (=> b!199331 (= lt!311215 (bvadd (bitIndex!0 (size!4457 (buf!4949 (_1!9207 lt!309604))) (currentByte!9296 (_1!9207 lt!309604)) (currentBit!9291 (_1!9207 lt!309604))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!67993 res!166862) b!199331))

(assert (=> b!199331 m!307869))

(assert (=> d!67573 d!67993))

(declare-fun d!67995 () Bool)

(declare-fun res!166863 () Bool)

(declare-fun e!136786 () Bool)

(assert (=> d!67995 (=> (not res!166863) (not e!136786))))

(assert (=> d!67995 (= res!166863 (= (size!4457 (buf!4949 (_2!9207 lt!309793))) (size!4457 (buf!4949 (_2!9206 lt!309593)))))))

(assert (=> d!67995 (= (isPrefixOf!0 (_2!9207 lt!309793) (_2!9206 lt!309593)) e!136786)))

(declare-fun b!199332 () Bool)

(declare-fun res!166865 () Bool)

(assert (=> b!199332 (=> (not res!166865) (not e!136786))))

(assert (=> b!199332 (= res!166865 (bvsle (bitIndex!0 (size!4457 (buf!4949 (_2!9207 lt!309793))) (currentByte!9296 (_2!9207 lt!309793)) (currentBit!9291 (_2!9207 lt!309793))) (bitIndex!0 (size!4457 (buf!4949 (_2!9206 lt!309593))) (currentByte!9296 (_2!9206 lt!309593)) (currentBit!9291 (_2!9206 lt!309593)))))))

(declare-fun b!199333 () Bool)

(declare-fun e!136785 () Bool)

(assert (=> b!199333 (= e!136786 e!136785)))

(declare-fun res!166864 () Bool)

(assert (=> b!199333 (=> res!166864 e!136785)))

(assert (=> b!199333 (= res!166864 (= (size!4457 (buf!4949 (_2!9207 lt!309793))) #b00000000000000000000000000000000))))

(declare-fun b!199334 () Bool)

(assert (=> b!199334 (= e!136785 (arrayBitRangesEq!0 (buf!4949 (_2!9207 lt!309793)) (buf!4949 (_2!9206 lt!309593)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4457 (buf!4949 (_2!9207 lt!309793))) (currentByte!9296 (_2!9207 lt!309793)) (currentBit!9291 (_2!9207 lt!309793)))))))

(assert (= (and d!67995 res!166863) b!199332))

(assert (= (and b!199332 res!166865) b!199333))

(assert (= (and b!199333 (not res!166864)) b!199334))

(assert (=> b!199332 m!308859))

(assert (=> b!199332 m!307635))

(assert (=> b!199334 m!308859))

(assert (=> b!199334 m!308859))

(declare-fun m!309055 () Bool)

(assert (=> b!199334 m!309055))

(assert (=> b!198734 d!67995))

(assert (=> d!67701 d!67691))

(declare-fun e!136787 () Bool)

(declare-fun lt!311216 () tuple4!264)

(declare-fun b!199335 () Bool)

(assert (=> b!199335 (= e!136787 (arrayRangesEq!694 (buf!4949 thiss!1204) (buf!4949 (_2!9206 lt!309593)) (_1!9220 lt!311216) (_2!9220 lt!311216)))))

(declare-fun d!67997 () Bool)

(declare-fun res!166870 () Bool)

(declare-fun e!136791 () Bool)

(assert (=> d!67997 (=> res!166870 e!136791)))

(assert (=> d!67997 (= res!166870 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4457 (buf!4949 thiss!1204)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204))))))

(assert (=> d!67997 (= (arrayBitRangesEq!0 (buf!4949 thiss!1204) (buf!4949 (_2!9206 lt!309593)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4457 (buf!4949 thiss!1204)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204))) e!136791)))

(declare-fun b!199336 () Bool)

(declare-fun res!166866 () Bool)

(declare-fun lt!311217 () (_ BitVec 32))

(assert (=> b!199336 (= res!166866 (= lt!311217 #b00000000000000000000000000000000))))

(declare-fun e!136790 () Bool)

(assert (=> b!199336 (=> res!166866 e!136790)))

(declare-fun e!136792 () Bool)

(assert (=> b!199336 (= e!136792 e!136790)))

(declare-fun b!199337 () Bool)

(declare-fun e!136789 () Bool)

(assert (=> b!199337 (= e!136789 e!136792)))

(declare-fun res!166869 () Bool)

(declare-fun call!3151 () Bool)

(assert (=> b!199337 (= res!166869 call!3151)))

(assert (=> b!199337 (=> (not res!166869) (not e!136792))))

(declare-fun bm!3148 () Bool)

(declare-fun lt!311218 () (_ BitVec 32))

(declare-fun c!9939 () Bool)

(assert (=> bm!3148 (= call!3151 (byteRangesEq!0 (select (arr!5387 (buf!4949 thiss!1204)) (_3!648 lt!311216)) (select (arr!5387 (buf!4949 (_2!9206 lt!309593))) (_3!648 lt!311216)) lt!311218 (ite c!9939 lt!311217 #b00000000000000000000000000001000)))))

(declare-fun b!199338 () Bool)

(assert (=> b!199338 (= e!136789 call!3151)))

(declare-fun b!199339 () Bool)

(declare-fun e!136788 () Bool)

(assert (=> b!199339 (= e!136788 e!136789)))

(assert (=> b!199339 (= c!9939 (= (_3!648 lt!311216) (_4!132 lt!311216)))))

(declare-fun b!199340 () Bool)

(assert (=> b!199340 (= e!136790 (byteRangesEq!0 (select (arr!5387 (buf!4949 thiss!1204)) (_4!132 lt!311216)) (select (arr!5387 (buf!4949 (_2!9206 lt!309593))) (_4!132 lt!311216)) #b00000000000000000000000000000000 lt!311217))))

(declare-fun b!199341 () Bool)

(assert (=> b!199341 (= e!136791 e!136788)))

(declare-fun res!166868 () Bool)

(assert (=> b!199341 (=> (not res!166868) (not e!136788))))

(assert (=> b!199341 (= res!166868 e!136787)))

(declare-fun res!166867 () Bool)

(assert (=> b!199341 (=> res!166867 e!136787)))

(assert (=> b!199341 (= res!166867 (bvsge (_1!9220 lt!311216) (_2!9220 lt!311216)))))

(assert (=> b!199341 (= lt!311217 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4457 (buf!4949 thiss!1204)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199341 (= lt!311218 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199341 (= lt!311216 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4457 (buf!4949 thiss!1204)) (currentByte!9296 thiss!1204) (currentBit!9291 thiss!1204))))))

(assert (= (and d!67997 (not res!166870)) b!199341))

(assert (= (and b!199341 (not res!166867)) b!199335))

(assert (= (and b!199341 res!166868) b!199339))

(assert (= (and b!199339 c!9939) b!199338))

(assert (= (and b!199339 (not c!9939)) b!199337))

(assert (= (and b!199337 res!166869) b!199336))

(assert (= (and b!199336 (not res!166866)) b!199340))

(assert (= (or b!199338 b!199337) bm!3148))

(declare-fun m!309057 () Bool)

(assert (=> b!199335 m!309057))

(declare-fun m!309059 () Bool)

(assert (=> bm!3148 m!309059))

(declare-fun m!309061 () Bool)

(assert (=> bm!3148 m!309061))

(assert (=> bm!3148 m!309059))

(assert (=> bm!3148 m!309061))

(declare-fun m!309063 () Bool)

(assert (=> bm!3148 m!309063))

(declare-fun m!309065 () Bool)

(assert (=> b!199340 m!309065))

(declare-fun m!309067 () Bool)

(assert (=> b!199340 m!309067))

(assert (=> b!199340 m!309065))

(assert (=> b!199340 m!309067))

(declare-fun m!309069 () Bool)

(assert (=> b!199340 m!309069))

(assert (=> b!199341 m!307609))

(assert (=> b!199341 m!308843))

(assert (=> b!198783 d!67997))

(assert (=> b!198783 d!67519))

(assert (=> d!67579 d!67577))

(declare-fun d!67999 () Bool)

(assert (=> d!67999 (isPrefixOf!0 thiss!1204 (_2!9206 lt!309593))))

(assert (=> d!67999 true))

(declare-fun _$15!297 () Unit!14060)

(assert (=> d!67999 (= (choose!30 thiss!1204 (_2!9206 lt!309597) (_2!9206 lt!309593)) _$15!297)))

(declare-fun bs!16794 () Bool)

(assert (= bs!16794 d!67999))

(assert (=> bs!16794 m!307637))

(assert (=> d!67579 d!67999))

(assert (=> d!67579 d!67555))

(declare-fun d!68001 () Bool)

(assert (=> d!68001 (= (remainingBits!0 ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309593)))) ((_ sign_extend 32) (currentByte!9296 thiss!1204)) ((_ sign_extend 32) (currentBit!9291 thiss!1204))) (bvsub (bvmul ((_ sign_extend 32) (size!4457 (buf!4949 (_2!9206 lt!309593)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9296 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9291 thiss!1204)))))))

(assert (=> d!67539 d!68001))

(assert (=> b!198948 d!67971))

(assert (=> b!198948 d!67517))

(check-sat (not d!67883) (not b!199129) (not b!199315) (not d!67779) (not b!199154) (not d!67821) (not d!67869) (not d!67783) (not d!67865) (not d!67753) (not b!199331) (not b!199253) (not b!199219) (not b!199245) (not d!67771) (not d!67781) (not b!199277) (not d!67801) (not b!199142) (not b!199141) (not b!199085) (not d!67959) (not d!67793) (not b!199166) (not b!199160) (not b!199244) (not d!67939) (not b!199101) (not b!199335) (not d!67845) (not d!67833) (not b!199209) (not b!199242) (not d!67895) (not d!67795) (not d!67805) (not b!199274) (not b!199270) (not d!67825) (not b!199153) (not b!199284) (not d!67931) (not d!67765) (not d!67761) (not b!199196) (not d!67863) (not d!67871) (not b!199241) (not b!199198) (not b!199146) (not b!199341) (not d!67943) (not b!199280) (not b!199260) (not d!67971) (not bm!3147) (not d!67991) (not b!199197) (not d!67969) (not b!199268) (not b!199235) (not b!199259) (not b!199233) (not d!67837) (not b!199254) (not d!67803) (not b!199273) (not d!67807) (not d!67787) (not b!199236) (not b!199187) (not b!199121) (not bm!3148) (not b!199104) (not b!199317) (not b!199271) (not d!67879) (not b!199285) (not d!67823) (not d!67979) (not d!67789) (not d!67755) (not b!199147) (not b!199322) (not d!67815) (not d!67791) (not d!67935) (not b!199151) (not b!199282) (not b!199105) (not b!199319) (not b!199215) (not b!199239) (not b!199162) (not b!199138) (not d!67859) (not b!199248) (not b!199224) (not bm!3146) (not d!67887) (not b!199144) (not d!67947) (not b!199308) (not b!199318) (not b!199283) (not d!67921) (not d!67853) (not b!199226) (not b!199229) (not b!199218) (not d!67975) (not bm!3143) (not d!67999) (not b!199199) (not b!199232) (not b!199276) (not b!199208) (not d!67881) (not d!67989) (not b!199140) (not d!67785) (not b!199287) (not d!67949) (not d!67927) (not d!67835) (not d!67827) (not d!67809) (not d!67777) (not d!67851) (not d!67797) (not d!67973) (not b!199279) (not d!67855) (not b!199100) (not b!199310) (not b!199206) (not d!67813) (not b!199314) (not b!199214) (not bm!3145) (not b!199311) (not b!199126) (not b!199156) (not b!199250) (not b!199127) (not d!67929) (not b!199247) (not b!199216) (not d!67981) (not b!199225) (not d!67843) (not b!199159) (not d!67867) (not b!199169) (not d!67877) (not b!199161) (not b!199309) (not b!199251) (not d!67987) (not d!67965) (not d!67817) (not b!199102) (not b!199334) (not d!67857) (not d!67799) (not b!199307) (not b!199332) (not d!67819) (not b!199182) (not b!199230) (not b!199143) (not b!199340) (not d!67829) (not b!199131) (not d!67897) (not b!199320) (not b!199167) (not b!199168) (not b!199288) (not d!67913) (not d!67977) (not b!199238) (not b!199201) (not b!199155) (not bm!3144) (not d!67945) (not b!199329) (not d!67941) (not b!199323) (not b!199228))
(check-sat)
