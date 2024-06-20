; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44684 () Bool)

(assert start!44684)

(declare-fun b!213625 () Bool)

(declare-fun e!145505 () Bool)

(declare-fun e!145503 () Bool)

(assert (=> b!213625 (= e!145505 e!145503)))

(declare-fun res!179541 () Bool)

(assert (=> b!213625 (=> res!179541 e!145503)))

(declare-fun lt!337240 () (_ BitVec 64))

(declare-fun lt!337251 () (_ BitVec 64))

(assert (=> b!213625 (= res!179541 (not (= lt!337240 lt!337251)))))

(declare-fun lt!337248 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!213625 (= lt!337251 (bvsub lt!337248 ((_ sign_extend 32) i!590)))))

(declare-fun lt!337253 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!213625 (= lt!337248 (bvadd lt!337253 ((_ sign_extend 32) nBits!348)))))

(declare-fun b!213626 () Bool)

(declare-fun res!179553 () Bool)

(declare-fun e!145506 () Bool)

(assert (=> b!213626 (=> (not res!179553) (not e!145506))))

(declare-datatypes ((array!10552 0))(
  ( (array!10553 (arr!5564 (Array (_ BitVec 32) (_ BitVec 8))) (size!4634 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8376 0))(
  ( (BitStream!8377 (buf!5166 array!10552) (currentByte!9738 (_ BitVec 32)) (currentBit!9733 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!18286 0))(
  ( (tuple2!18287 (_1!9798 BitStream!8376) (_2!9798 BitStream!8376)) )
))
(declare-fun lt!337246 () tuple2!18286)

(declare-fun withMovedBitIndex!0 (BitStream!8376 (_ BitVec 64)) BitStream!8376)

(assert (=> b!213626 (= res!179553 (= (_1!9798 lt!337246) (withMovedBitIndex!0 (_2!9798 lt!337246) (bvsub lt!337253 lt!337240))))))

(declare-fun lt!337265 () (_ BitVec 64))

(declare-fun b!213627 () Bool)

(declare-fun e!145493 () Bool)

(assert (=> b!213627 (= e!145493 (or (= lt!337265 (bvand ((_ sign_extend 32) i!590) #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!337265 (bvand lt!337251 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!213627 (= lt!337265 (bvand lt!337248 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun thiss!1204 () BitStream!8376)

(declare-datatypes ((Unit!15213 0))(
  ( (Unit!15214) )
))
(declare-datatypes ((tuple2!18288 0))(
  ( (tuple2!18289 (_1!9799 Unit!15213) (_2!9799 BitStream!8376)) )
))
(declare-fun lt!337264 () tuple2!18288)

(assert (=> b!213627 (= (size!4634 (buf!5166 thiss!1204)) (size!4634 (buf!5166 (_2!9799 lt!337264))))))

(declare-fun res!179543 () Bool)

(declare-fun e!145502 () Bool)

(assert (=> start!44684 (=> (not res!179543) (not e!145502))))

(assert (=> start!44684 (= res!179543 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44684 e!145502))

(assert (=> start!44684 true))

(declare-fun e!145492 () Bool)

(declare-fun inv!12 (BitStream!8376) Bool)

(assert (=> start!44684 (and (inv!12 thiss!1204) e!145492)))

(declare-fun b!213628 () Bool)

(declare-fun res!179550 () Bool)

(assert (=> b!213628 (=> res!179550 e!145505)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!213628 (= res!179550 (not (invariant!0 (currentBit!9733 (_2!9799 lt!337264)) (currentByte!9738 (_2!9799 lt!337264)) (size!4634 (buf!5166 (_2!9799 lt!337264))))))))

(declare-datatypes ((tuple2!18290 0))(
  ( (tuple2!18291 (_1!9800 BitStream!8376) (_2!9800 (_ BitVec 64))) )
))
(declare-fun lt!337254 () tuple2!18290)

(declare-fun b!213629 () Bool)

(declare-fun lt!337256 () (_ BitVec 64))

(declare-fun lt!337261 () tuple2!18286)

(declare-fun lt!337250 () tuple2!18290)

(declare-fun lt!337268 () BitStream!8376)

(assert (=> b!213629 (= e!145506 (and (= lt!337253 (bvsub lt!337256 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9798 lt!337261) lt!337268)) (= (_2!9800 lt!337254) (_2!9800 lt!337250)))))))

(declare-fun b!213630 () Bool)

(declare-fun e!145500 () Bool)

(assert (=> b!213630 (= e!145500 e!145493)))

(declare-fun res!179547 () Bool)

(assert (=> b!213630 (=> res!179547 e!145493)))

(assert (=> b!213630 (= res!179547 (not (= (_1!9798 lt!337261) lt!337268)))))

(assert (=> b!213630 e!145506))

(declare-fun res!179544 () Bool)

(assert (=> b!213630 (=> (not res!179544) (not e!145506))))

(declare-fun lt!337271 () tuple2!18290)

(assert (=> b!213630 (= res!179544 (and (= (_2!9800 lt!337254) (_2!9800 lt!337271)) (= (_1!9800 lt!337254) (_1!9800 lt!337271))))))

(declare-fun lt!337247 () (_ BitVec 64))

(declare-fun lt!337257 () Unit!15213)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8376 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15213)

(assert (=> b!213630 (= lt!337257 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9798 lt!337246) nBits!348 i!590 lt!337247))))

(declare-fun lt!337245 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8376 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18290)

(assert (=> b!213630 (= lt!337271 (readNBitsLSBFirstsLoopPure!0 lt!337268 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!337245))))

(assert (=> b!213630 (= lt!337268 (withMovedBitIndex!0 (_1!9798 lt!337246) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!213631 () Bool)

(declare-fun res!179556 () Bool)

(declare-fun e!145504 () Bool)

(assert (=> b!213631 (=> (not res!179556) (not e!145504))))

(assert (=> b!213631 (= res!179556 (invariant!0 (currentBit!9733 thiss!1204) (currentByte!9738 thiss!1204) (size!4634 (buf!5166 thiss!1204))))))

(declare-fun b!213632 () Bool)

(declare-fun res!179546 () Bool)

(assert (=> b!213632 (=> res!179546 e!145493)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!213632 (= res!179546 (not (= (bitIndex!0 (size!4634 (buf!5166 (_1!9800 lt!337254))) (currentByte!9738 (_1!9800 lt!337254)) (currentBit!9733 (_1!9800 lt!337254))) (bitIndex!0 (size!4634 (buf!5166 (_2!9798 lt!337246))) (currentByte!9738 (_2!9798 lt!337246)) (currentBit!9733 (_2!9798 lt!337246))))))))

(declare-fun b!213633 () Bool)

(declare-fun e!145494 () Bool)

(assert (=> b!213633 (= e!145504 (not e!145494))))

(declare-fun res!179559 () Bool)

(assert (=> b!213633 (=> res!179559 e!145494)))

(assert (=> b!213633 (= res!179559 (not (= lt!337256 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!337253))))))

(declare-fun lt!337263 () tuple2!18288)

(assert (=> b!213633 (= lt!337256 (bitIndex!0 (size!4634 (buf!5166 (_2!9799 lt!337263))) (currentByte!9738 (_2!9799 lt!337263)) (currentBit!9733 (_2!9799 lt!337263))))))

(assert (=> b!213633 (= lt!337253 (bitIndex!0 (size!4634 (buf!5166 thiss!1204)) (currentByte!9738 thiss!1204) (currentBit!9733 thiss!1204)))))

(declare-fun e!145497 () Bool)

(assert (=> b!213633 e!145497))

(declare-fun res!179554 () Bool)

(assert (=> b!213633 (=> (not res!179554) (not e!145497))))

(assert (=> b!213633 (= res!179554 (= (size!4634 (buf!5166 thiss!1204)) (size!4634 (buf!5166 (_2!9799 lt!337263)))))))

(declare-fun lt!337242 () Bool)

(declare-fun appendBit!0 (BitStream!8376 Bool) tuple2!18288)

(assert (=> b!213633 (= lt!337263 (appendBit!0 thiss!1204 lt!337242))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!337243 () (_ BitVec 64))

(assert (=> b!213633 (= lt!337242 (not (= (bvand v!189 lt!337243) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213633 (= lt!337243 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!213634 () Bool)

(declare-fun e!145495 () Bool)

(assert (=> b!213634 (= e!145497 e!145495)))

(declare-fun res!179552 () Bool)

(assert (=> b!213634 (=> (not res!179552) (not e!145495))))

(declare-fun lt!337244 () (_ BitVec 64))

(declare-fun lt!337262 () (_ BitVec 64))

(assert (=> b!213634 (= res!179552 (= lt!337244 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!337262)))))

(assert (=> b!213634 (= lt!337244 (bitIndex!0 (size!4634 (buf!5166 (_2!9799 lt!337263))) (currentByte!9738 (_2!9799 lt!337263)) (currentBit!9733 (_2!9799 lt!337263))))))

(assert (=> b!213634 (= lt!337262 (bitIndex!0 (size!4634 (buf!5166 thiss!1204)) (currentByte!9738 thiss!1204) (currentBit!9733 thiss!1204)))))

(declare-fun b!213635 () Bool)

(assert (=> b!213635 (= e!145494 e!145505)))

(declare-fun res!179558 () Bool)

(assert (=> b!213635 (=> res!179558 e!145505)))

(assert (=> b!213635 (= res!179558 (not (= lt!337240 (bvsub (bvsub (bvadd lt!337256 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!213635 (= lt!337240 (bitIndex!0 (size!4634 (buf!5166 (_2!9799 lt!337264))) (currentByte!9738 (_2!9799 lt!337264)) (currentBit!9733 (_2!9799 lt!337264))))))

(declare-fun isPrefixOf!0 (BitStream!8376 BitStream!8376) Bool)

(assert (=> b!213635 (isPrefixOf!0 thiss!1204 (_2!9799 lt!337264))))

(declare-fun lt!337241 () Unit!15213)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8376 BitStream!8376 BitStream!8376) Unit!15213)

(assert (=> b!213635 (= lt!337241 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9799 lt!337263) (_2!9799 lt!337264)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8376 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18288)

(assert (=> b!213635 (= lt!337264 (appendBitsLSBFirstLoopTR!0 (_2!9799 lt!337263) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!213636 () Bool)

(declare-fun res!179551 () Bool)

(assert (=> b!213636 (=> res!179551 e!145503)))

(assert (=> b!213636 (= res!179551 (not (isPrefixOf!0 (_2!9799 lt!337263) (_2!9799 lt!337264))))))

(declare-fun b!213637 () Bool)

(declare-fun e!145498 () Bool)

(assert (=> b!213637 (= e!145498 (invariant!0 (currentBit!9733 thiss!1204) (currentByte!9738 thiss!1204) (size!4634 (buf!5166 (_2!9799 lt!337264)))))))

(declare-fun b!213638 () Bool)

(declare-fun res!179545 () Bool)

(assert (=> b!213638 (=> (not res!179545) (not e!145495))))

(assert (=> b!213638 (= res!179545 (isPrefixOf!0 thiss!1204 (_2!9799 lt!337263)))))

(declare-fun b!213639 () Bool)

(declare-fun res!179555 () Bool)

(assert (=> b!213639 (=> (not res!179555) (not e!145504))))

(assert (=> b!213639 (= res!179555 (not (= i!590 nBits!348)))))

(declare-fun b!213640 () Bool)

(assert (=> b!213640 (= e!145502 e!145504)))

(declare-fun res!179540 () Bool)

(assert (=> b!213640 (=> (not res!179540) (not e!145504))))

(declare-fun lt!337266 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!213640 (= res!179540 (validate_offset_bits!1 ((_ sign_extend 32) (size!4634 (buf!5166 thiss!1204))) ((_ sign_extend 32) (currentByte!9738 thiss!1204)) ((_ sign_extend 32) (currentBit!9733 thiss!1204)) lt!337266))))

(assert (=> b!213640 (= lt!337266 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!213641 () Bool)

(declare-fun e!145501 () Bool)

(declare-datatypes ((tuple2!18292 0))(
  ( (tuple2!18293 (_1!9801 BitStream!8376) (_2!9801 Bool)) )
))
(declare-fun lt!337255 () tuple2!18292)

(declare-fun lt!337270 () tuple2!18292)

(assert (=> b!213641 (= e!145501 (= (_2!9801 lt!337255) (_2!9801 lt!337270)))))

(declare-fun b!213642 () Bool)

(declare-fun res!179542 () Bool)

(assert (=> b!213642 (=> res!179542 e!145503)))

(assert (=> b!213642 (= res!179542 (not (isPrefixOf!0 thiss!1204 (_2!9799 lt!337263))))))

(declare-fun b!213643 () Bool)

(declare-fun e!145499 () Bool)

(assert (=> b!213643 (= e!145495 e!145499)))

(declare-fun res!179561 () Bool)

(assert (=> b!213643 (=> (not res!179561) (not e!145499))))

(declare-fun lt!337269 () tuple2!18292)

(assert (=> b!213643 (= res!179561 (and (= (_2!9801 lt!337269) lt!337242) (= (_1!9801 lt!337269) (_2!9799 lt!337263))))))

(declare-fun readBitPure!0 (BitStream!8376) tuple2!18292)

(declare-fun readerFrom!0 (BitStream!8376 (_ BitVec 32) (_ BitVec 32)) BitStream!8376)

(assert (=> b!213643 (= lt!337269 (readBitPure!0 (readerFrom!0 (_2!9799 lt!337263) (currentBit!9733 thiss!1204) (currentByte!9738 thiss!1204))))))

(declare-fun b!213644 () Bool)

(declare-fun array_inv!4375 (array!10552) Bool)

(assert (=> b!213644 (= e!145492 (array_inv!4375 (buf!5166 thiss!1204)))))

(declare-fun b!213645 () Bool)

(assert (=> b!213645 (= e!145503 e!145500)))

(declare-fun res!179557 () Bool)

(assert (=> b!213645 (=> res!179557 e!145500)))

(assert (=> b!213645 (= res!179557 (not (= (_1!9800 lt!337250) (_2!9798 lt!337261))))))

(assert (=> b!213645 (= lt!337250 (readNBitsLSBFirstsLoopPure!0 (_1!9798 lt!337261) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!337245))))

(declare-fun lt!337260 () (_ BitVec 64))

(assert (=> b!213645 (validate_offset_bits!1 ((_ sign_extend 32) (size!4634 (buf!5166 (_2!9799 lt!337264)))) ((_ sign_extend 32) (currentByte!9738 (_2!9799 lt!337263))) ((_ sign_extend 32) (currentBit!9733 (_2!9799 lt!337263))) lt!337260)))

(declare-fun lt!337258 () Unit!15213)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8376 array!10552 (_ BitVec 64)) Unit!15213)

(assert (=> b!213645 (= lt!337258 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9799 lt!337263) (buf!5166 (_2!9799 lt!337264)) lt!337260))))

(assert (=> b!213645 (= lt!337260 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!337267 () tuple2!18292)

(assert (=> b!213645 (= lt!337245 (bvor lt!337247 (ite (_2!9801 lt!337267) lt!337243 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213645 (= lt!337254 (readNBitsLSBFirstsLoopPure!0 (_1!9798 lt!337246) nBits!348 i!590 lt!337247))))

(assert (=> b!213645 (validate_offset_bits!1 ((_ sign_extend 32) (size!4634 (buf!5166 (_2!9799 lt!337264)))) ((_ sign_extend 32) (currentByte!9738 thiss!1204)) ((_ sign_extend 32) (currentBit!9733 thiss!1204)) lt!337266)))

(declare-fun lt!337252 () Unit!15213)

(assert (=> b!213645 (= lt!337252 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5166 (_2!9799 lt!337264)) lt!337266))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!213645 (= lt!337247 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!213645 (= (_2!9801 lt!337267) lt!337242)))

(assert (=> b!213645 (= lt!337267 (readBitPure!0 (_1!9798 lt!337246)))))

(declare-fun reader!0 (BitStream!8376 BitStream!8376) tuple2!18286)

(assert (=> b!213645 (= lt!337261 (reader!0 (_2!9799 lt!337263) (_2!9799 lt!337264)))))

(assert (=> b!213645 (= lt!337246 (reader!0 thiss!1204 (_2!9799 lt!337264)))))

(assert (=> b!213645 e!145501))

(declare-fun res!179560 () Bool)

(assert (=> b!213645 (=> (not res!179560) (not e!145501))))

(assert (=> b!213645 (= res!179560 (= (bitIndex!0 (size!4634 (buf!5166 (_1!9801 lt!337255))) (currentByte!9738 (_1!9801 lt!337255)) (currentBit!9733 (_1!9801 lt!337255))) (bitIndex!0 (size!4634 (buf!5166 (_1!9801 lt!337270))) (currentByte!9738 (_1!9801 lt!337270)) (currentBit!9733 (_1!9801 lt!337270)))))))

(declare-fun lt!337249 () Unit!15213)

(declare-fun lt!337259 () BitStream!8376)

(declare-fun readBitPrefixLemma!0 (BitStream!8376 BitStream!8376) Unit!15213)

(assert (=> b!213645 (= lt!337249 (readBitPrefixLemma!0 lt!337259 (_2!9799 lt!337264)))))

(assert (=> b!213645 (= lt!337270 (readBitPure!0 (BitStream!8377 (buf!5166 (_2!9799 lt!337264)) (currentByte!9738 thiss!1204) (currentBit!9733 thiss!1204))))))

(assert (=> b!213645 (= lt!337255 (readBitPure!0 lt!337259))))

(assert (=> b!213645 e!145498))

(declare-fun res!179539 () Bool)

(assert (=> b!213645 (=> (not res!179539) (not e!145498))))

(assert (=> b!213645 (= res!179539 (invariant!0 (currentBit!9733 thiss!1204) (currentByte!9738 thiss!1204) (size!4634 (buf!5166 (_2!9799 lt!337263)))))))

(assert (=> b!213645 (= lt!337259 (BitStream!8377 (buf!5166 (_2!9799 lt!337263)) (currentByte!9738 thiss!1204) (currentBit!9733 thiss!1204)))))

(declare-fun b!213646 () Bool)

(declare-fun res!179549 () Bool)

(assert (=> b!213646 (=> (not res!179549) (not e!145506))))

(assert (=> b!213646 (= res!179549 (= (_1!9798 lt!337261) (withMovedBitIndex!0 (_2!9798 lt!337261) (bvsub lt!337256 lt!337240))))))

(declare-fun b!213647 () Bool)

(assert (=> b!213647 (= e!145499 (= (bitIndex!0 (size!4634 (buf!5166 (_1!9801 lt!337269))) (currentByte!9738 (_1!9801 lt!337269)) (currentBit!9733 (_1!9801 lt!337269))) lt!337244))))

(declare-fun b!213648 () Bool)

(declare-fun res!179548 () Bool)

(assert (=> b!213648 (=> res!179548 e!145505)))

(assert (=> b!213648 (= res!179548 (not (= (size!4634 (buf!5166 (_2!9799 lt!337264))) (size!4634 (buf!5166 thiss!1204)))))))

(assert (= (and start!44684 res!179543) b!213640))

(assert (= (and b!213640 res!179540) b!213631))

(assert (= (and b!213631 res!179556) b!213639))

(assert (= (and b!213639 res!179555) b!213633))

(assert (= (and b!213633 res!179554) b!213634))

(assert (= (and b!213634 res!179552) b!213638))

(assert (= (and b!213638 res!179545) b!213643))

(assert (= (and b!213643 res!179561) b!213647))

(assert (= (and b!213633 (not res!179559)) b!213635))

(assert (= (and b!213635 (not res!179558)) b!213628))

(assert (= (and b!213628 (not res!179550)) b!213648))

(assert (= (and b!213648 (not res!179548)) b!213625))

(assert (= (and b!213625 (not res!179541)) b!213636))

(assert (= (and b!213636 (not res!179551)) b!213642))

(assert (= (and b!213642 (not res!179542)) b!213645))

(assert (= (and b!213645 res!179539) b!213637))

(assert (= (and b!213645 res!179560) b!213641))

(assert (= (and b!213645 (not res!179557)) b!213630))

(assert (= (and b!213630 res!179544) b!213626))

(assert (= (and b!213626 res!179553) b!213646))

(assert (= (and b!213646 res!179549) b!213629))

(assert (= (and b!213630 (not res!179547)) b!213632))

(assert (= (and b!213632 (not res!179546)) b!213627))

(assert (= start!44684 b!213644))

(declare-fun m!329215 () Bool)

(assert (=> b!213640 m!329215))

(declare-fun m!329217 () Bool)

(assert (=> b!213626 m!329217))

(declare-fun m!329219 () Bool)

(assert (=> b!213646 m!329219))

(declare-fun m!329221 () Bool)

(assert (=> b!213631 m!329221))

(declare-fun m!329223 () Bool)

(assert (=> b!213635 m!329223))

(declare-fun m!329225 () Bool)

(assert (=> b!213635 m!329225))

(declare-fun m!329227 () Bool)

(assert (=> b!213635 m!329227))

(declare-fun m!329229 () Bool)

(assert (=> b!213635 m!329229))

(declare-fun m!329231 () Bool)

(assert (=> b!213633 m!329231))

(declare-fun m!329233 () Bool)

(assert (=> b!213633 m!329233))

(declare-fun m!329235 () Bool)

(assert (=> b!213633 m!329235))

(declare-fun m!329237 () Bool)

(assert (=> b!213642 m!329237))

(declare-fun m!329239 () Bool)

(assert (=> start!44684 m!329239))

(declare-fun m!329241 () Bool)

(assert (=> b!213645 m!329241))

(declare-fun m!329243 () Bool)

(assert (=> b!213645 m!329243))

(declare-fun m!329245 () Bool)

(assert (=> b!213645 m!329245))

(declare-fun m!329247 () Bool)

(assert (=> b!213645 m!329247))

(declare-fun m!329249 () Bool)

(assert (=> b!213645 m!329249))

(declare-fun m!329251 () Bool)

(assert (=> b!213645 m!329251))

(declare-fun m!329253 () Bool)

(assert (=> b!213645 m!329253))

(declare-fun m!329255 () Bool)

(assert (=> b!213645 m!329255))

(declare-fun m!329257 () Bool)

(assert (=> b!213645 m!329257))

(declare-fun m!329259 () Bool)

(assert (=> b!213645 m!329259))

(declare-fun m!329261 () Bool)

(assert (=> b!213645 m!329261))

(declare-fun m!329263 () Bool)

(assert (=> b!213645 m!329263))

(declare-fun m!329265 () Bool)

(assert (=> b!213645 m!329265))

(declare-fun m!329267 () Bool)

(assert (=> b!213645 m!329267))

(declare-fun m!329269 () Bool)

(assert (=> b!213645 m!329269))

(declare-fun m!329271 () Bool)

(assert (=> b!213645 m!329271))

(assert (=> b!213638 m!329237))

(declare-fun m!329273 () Bool)

(assert (=> b!213630 m!329273))

(declare-fun m!329275 () Bool)

(assert (=> b!213630 m!329275))

(declare-fun m!329277 () Bool)

(assert (=> b!213630 m!329277))

(declare-fun m!329279 () Bool)

(assert (=> b!213636 m!329279))

(declare-fun m!329281 () Bool)

(assert (=> b!213647 m!329281))

(declare-fun m!329283 () Bool)

(assert (=> b!213644 m!329283))

(declare-fun m!329285 () Bool)

(assert (=> b!213628 m!329285))

(declare-fun m!329287 () Bool)

(assert (=> b!213643 m!329287))

(assert (=> b!213643 m!329287))

(declare-fun m!329289 () Bool)

(assert (=> b!213643 m!329289))

(declare-fun m!329291 () Bool)

(assert (=> b!213632 m!329291))

(declare-fun m!329293 () Bool)

(assert (=> b!213632 m!329293))

(assert (=> b!213634 m!329231))

(assert (=> b!213634 m!329233))

(declare-fun m!329295 () Bool)

(assert (=> b!213637 m!329295))

(check-sat (not b!213640) (not b!213635) (not b!213642) (not b!213644) (not b!213638) (not b!213645) (not b!213632) (not b!213630) (not b!213628) (not b!213647) (not b!213634) (not b!213636) (not b!213633) (not b!213626) (not b!213631) (not b!213646) (not b!213643) (not start!44684) (not b!213637))
(check-sat)
(get-model)

(declare-fun d!72215 () Bool)

(declare-fun e!145554 () Bool)

(assert (=> d!72215 e!145554))

(declare-fun res!179633 () Bool)

(assert (=> d!72215 (=> (not res!179633) (not e!145554))))

(declare-fun lt!337373 () (_ BitVec 64))

(declare-fun lt!337372 () BitStream!8376)

(assert (=> d!72215 (= res!179633 (= (bvadd lt!337373 (bvsub lt!337253 lt!337240)) (bitIndex!0 (size!4634 (buf!5166 lt!337372)) (currentByte!9738 lt!337372) (currentBit!9733 lt!337372))))))

(assert (=> d!72215 (or (not (= (bvand lt!337373 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337253 lt!337240) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!337373 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!337373 (bvsub lt!337253 lt!337240)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72215 (= lt!337373 (bitIndex!0 (size!4634 (buf!5166 (_2!9798 lt!337246))) (currentByte!9738 (_2!9798 lt!337246)) (currentBit!9733 (_2!9798 lt!337246))))))

(declare-fun moveBitIndex!0 (BitStream!8376 (_ BitVec 64)) tuple2!18288)

(assert (=> d!72215 (= lt!337372 (_2!9799 (moveBitIndex!0 (_2!9798 lt!337246) (bvsub lt!337253 lt!337240))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8376 (_ BitVec 64)) Bool)

(assert (=> d!72215 (moveBitIndexPrecond!0 (_2!9798 lt!337246) (bvsub lt!337253 lt!337240))))

(assert (=> d!72215 (= (withMovedBitIndex!0 (_2!9798 lt!337246) (bvsub lt!337253 lt!337240)) lt!337372)))

(declare-fun b!213723 () Bool)

(assert (=> b!213723 (= e!145554 (= (size!4634 (buf!5166 (_2!9798 lt!337246))) (size!4634 (buf!5166 lt!337372))))))

(assert (= (and d!72215 res!179633) b!213723))

(declare-fun m!329379 () Bool)

(assert (=> d!72215 m!329379))

(assert (=> d!72215 m!329293))

(declare-fun m!329381 () Bool)

(assert (=> d!72215 m!329381))

(declare-fun m!329383 () Bool)

(assert (=> d!72215 m!329383))

(assert (=> b!213626 d!72215))

(declare-fun d!72217 () Bool)

(assert (=> d!72217 (= (invariant!0 (currentBit!9733 thiss!1204) (currentByte!9738 thiss!1204) (size!4634 (buf!5166 (_2!9799 lt!337264)))) (and (bvsge (currentBit!9733 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9733 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9738 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9738 thiss!1204) (size!4634 (buf!5166 (_2!9799 lt!337264)))) (and (= (currentBit!9733 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9738 thiss!1204) (size!4634 (buf!5166 (_2!9799 lt!337264))))))))))

(assert (=> b!213637 d!72217))

(declare-fun d!72219 () Bool)

(declare-fun e!145555 () Bool)

(assert (=> d!72219 e!145555))

(declare-fun res!179634 () Bool)

(assert (=> d!72219 (=> (not res!179634) (not e!145555))))

(declare-fun lt!337374 () BitStream!8376)

(declare-fun lt!337375 () (_ BitVec 64))

(assert (=> d!72219 (= res!179634 (= (bvadd lt!337375 (bvsub lt!337256 lt!337240)) (bitIndex!0 (size!4634 (buf!5166 lt!337374)) (currentByte!9738 lt!337374) (currentBit!9733 lt!337374))))))

(assert (=> d!72219 (or (not (= (bvand lt!337375 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337256 lt!337240) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!337375 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!337375 (bvsub lt!337256 lt!337240)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72219 (= lt!337375 (bitIndex!0 (size!4634 (buf!5166 (_2!9798 lt!337261))) (currentByte!9738 (_2!9798 lt!337261)) (currentBit!9733 (_2!9798 lt!337261))))))

(assert (=> d!72219 (= lt!337374 (_2!9799 (moveBitIndex!0 (_2!9798 lt!337261) (bvsub lt!337256 lt!337240))))))

(assert (=> d!72219 (moveBitIndexPrecond!0 (_2!9798 lt!337261) (bvsub lt!337256 lt!337240))))

(assert (=> d!72219 (= (withMovedBitIndex!0 (_2!9798 lt!337261) (bvsub lt!337256 lt!337240)) lt!337374)))

(declare-fun b!213724 () Bool)

(assert (=> b!213724 (= e!145555 (= (size!4634 (buf!5166 (_2!9798 lt!337261))) (size!4634 (buf!5166 lt!337374))))))

(assert (= (and d!72219 res!179634) b!213724))

(declare-fun m!329385 () Bool)

(assert (=> d!72219 m!329385))

(declare-fun m!329387 () Bool)

(assert (=> d!72219 m!329387))

(declare-fun m!329389 () Bool)

(assert (=> d!72219 m!329389))

(declare-fun m!329391 () Bool)

(assert (=> d!72219 m!329391))

(assert (=> b!213646 d!72219))

(declare-fun d!72221 () Bool)

(declare-fun res!179641 () Bool)

(declare-fun e!145560 () Bool)

(assert (=> d!72221 (=> (not res!179641) (not e!145560))))

(assert (=> d!72221 (= res!179641 (= (size!4634 (buf!5166 (_2!9799 lt!337263))) (size!4634 (buf!5166 (_2!9799 lt!337264)))))))

(assert (=> d!72221 (= (isPrefixOf!0 (_2!9799 lt!337263) (_2!9799 lt!337264)) e!145560)))

(declare-fun b!213731 () Bool)

(declare-fun res!179643 () Bool)

(assert (=> b!213731 (=> (not res!179643) (not e!145560))))

(assert (=> b!213731 (= res!179643 (bvsle (bitIndex!0 (size!4634 (buf!5166 (_2!9799 lt!337263))) (currentByte!9738 (_2!9799 lt!337263)) (currentBit!9733 (_2!9799 lt!337263))) (bitIndex!0 (size!4634 (buf!5166 (_2!9799 lt!337264))) (currentByte!9738 (_2!9799 lt!337264)) (currentBit!9733 (_2!9799 lt!337264)))))))

(declare-fun b!213732 () Bool)

(declare-fun e!145561 () Bool)

(assert (=> b!213732 (= e!145560 e!145561)))

(declare-fun res!179642 () Bool)

(assert (=> b!213732 (=> res!179642 e!145561)))

(assert (=> b!213732 (= res!179642 (= (size!4634 (buf!5166 (_2!9799 lt!337263))) #b00000000000000000000000000000000))))

(declare-fun b!213733 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10552 array!10552 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!213733 (= e!145561 (arrayBitRangesEq!0 (buf!5166 (_2!9799 lt!337263)) (buf!5166 (_2!9799 lt!337264)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4634 (buf!5166 (_2!9799 lt!337263))) (currentByte!9738 (_2!9799 lt!337263)) (currentBit!9733 (_2!9799 lt!337263)))))))

(assert (= (and d!72221 res!179641) b!213731))

(assert (= (and b!213731 res!179643) b!213732))

(assert (= (and b!213732 (not res!179642)) b!213733))

(assert (=> b!213731 m!329231))

(assert (=> b!213731 m!329223))

(assert (=> b!213733 m!329231))

(assert (=> b!213733 m!329231))

(declare-fun m!329393 () Bool)

(assert (=> b!213733 m!329393))

(assert (=> b!213636 d!72221))

(declare-fun d!72223 () Bool)

(declare-fun e!145564 () Bool)

(assert (=> d!72223 e!145564))

(declare-fun res!179649 () Bool)

(assert (=> d!72223 (=> (not res!179649) (not e!145564))))

(declare-fun lt!337393 () (_ BitVec 64))

(declare-fun lt!337388 () (_ BitVec 64))

(declare-fun lt!337392 () (_ BitVec 64))

(assert (=> d!72223 (= res!179649 (= lt!337393 (bvsub lt!337392 lt!337388)))))

(assert (=> d!72223 (or (= (bvand lt!337392 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!337388 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!337392 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337392 lt!337388) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!72223 (= lt!337388 (remainingBits!0 ((_ sign_extend 32) (size!4634 (buf!5166 (_1!9801 lt!337269)))) ((_ sign_extend 32) (currentByte!9738 (_1!9801 lt!337269))) ((_ sign_extend 32) (currentBit!9733 (_1!9801 lt!337269)))))))

(declare-fun lt!337390 () (_ BitVec 64))

(declare-fun lt!337389 () (_ BitVec 64))

(assert (=> d!72223 (= lt!337392 (bvmul lt!337390 lt!337389))))

(assert (=> d!72223 (or (= lt!337390 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!337389 (bvsdiv (bvmul lt!337390 lt!337389) lt!337390)))))

(assert (=> d!72223 (= lt!337389 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72223 (= lt!337390 ((_ sign_extend 32) (size!4634 (buf!5166 (_1!9801 lt!337269)))))))

(assert (=> d!72223 (= lt!337393 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9738 (_1!9801 lt!337269))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9733 (_1!9801 lt!337269)))))))

(assert (=> d!72223 (invariant!0 (currentBit!9733 (_1!9801 lt!337269)) (currentByte!9738 (_1!9801 lt!337269)) (size!4634 (buf!5166 (_1!9801 lt!337269))))))

(assert (=> d!72223 (= (bitIndex!0 (size!4634 (buf!5166 (_1!9801 lt!337269))) (currentByte!9738 (_1!9801 lt!337269)) (currentBit!9733 (_1!9801 lt!337269))) lt!337393)))

(declare-fun b!213738 () Bool)

(declare-fun res!179648 () Bool)

(assert (=> b!213738 (=> (not res!179648) (not e!145564))))

(assert (=> b!213738 (= res!179648 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!337393))))

(declare-fun b!213739 () Bool)

(declare-fun lt!337391 () (_ BitVec 64))

(assert (=> b!213739 (= e!145564 (bvsle lt!337393 (bvmul lt!337391 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213739 (or (= lt!337391 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!337391 #b0000000000000000000000000000000000000000000000000000000000001000) lt!337391)))))

(assert (=> b!213739 (= lt!337391 ((_ sign_extend 32) (size!4634 (buf!5166 (_1!9801 lt!337269)))))))

(assert (= (and d!72223 res!179649) b!213738))

(assert (= (and b!213738 res!179648) b!213739))

(declare-fun m!329395 () Bool)

(assert (=> d!72223 m!329395))

(declare-fun m!329397 () Bool)

(assert (=> d!72223 m!329397))

(assert (=> b!213647 d!72223))

(declare-fun d!72225 () Bool)

(declare-fun e!145565 () Bool)

(assert (=> d!72225 e!145565))

(declare-fun res!179651 () Bool)

(assert (=> d!72225 (=> (not res!179651) (not e!145565))))

(declare-fun lt!337399 () (_ BitVec 64))

(declare-fun lt!337394 () (_ BitVec 64))

(declare-fun lt!337398 () (_ BitVec 64))

(assert (=> d!72225 (= res!179651 (= lt!337399 (bvsub lt!337398 lt!337394)))))

(assert (=> d!72225 (or (= (bvand lt!337398 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!337394 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!337398 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337398 lt!337394) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72225 (= lt!337394 (remainingBits!0 ((_ sign_extend 32) (size!4634 (buf!5166 (_2!9799 lt!337263)))) ((_ sign_extend 32) (currentByte!9738 (_2!9799 lt!337263))) ((_ sign_extend 32) (currentBit!9733 (_2!9799 lt!337263)))))))

(declare-fun lt!337396 () (_ BitVec 64))

(declare-fun lt!337395 () (_ BitVec 64))

(assert (=> d!72225 (= lt!337398 (bvmul lt!337396 lt!337395))))

(assert (=> d!72225 (or (= lt!337396 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!337395 (bvsdiv (bvmul lt!337396 lt!337395) lt!337396)))))

(assert (=> d!72225 (= lt!337395 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72225 (= lt!337396 ((_ sign_extend 32) (size!4634 (buf!5166 (_2!9799 lt!337263)))))))

(assert (=> d!72225 (= lt!337399 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9738 (_2!9799 lt!337263))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9733 (_2!9799 lt!337263)))))))

(assert (=> d!72225 (invariant!0 (currentBit!9733 (_2!9799 lt!337263)) (currentByte!9738 (_2!9799 lt!337263)) (size!4634 (buf!5166 (_2!9799 lt!337263))))))

(assert (=> d!72225 (= (bitIndex!0 (size!4634 (buf!5166 (_2!9799 lt!337263))) (currentByte!9738 (_2!9799 lt!337263)) (currentBit!9733 (_2!9799 lt!337263))) lt!337399)))

(declare-fun b!213740 () Bool)

(declare-fun res!179650 () Bool)

(assert (=> b!213740 (=> (not res!179650) (not e!145565))))

(assert (=> b!213740 (= res!179650 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!337399))))

(declare-fun b!213741 () Bool)

(declare-fun lt!337397 () (_ BitVec 64))

(assert (=> b!213741 (= e!145565 (bvsle lt!337399 (bvmul lt!337397 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213741 (or (= lt!337397 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!337397 #b0000000000000000000000000000000000000000000000000000000000001000) lt!337397)))))

(assert (=> b!213741 (= lt!337397 ((_ sign_extend 32) (size!4634 (buf!5166 (_2!9799 lt!337263)))))))

(assert (= (and d!72225 res!179651) b!213740))

(assert (= (and b!213740 res!179650) b!213741))

(declare-fun m!329399 () Bool)

(assert (=> d!72225 m!329399))

(declare-fun m!329401 () Bool)

(assert (=> d!72225 m!329401))

(assert (=> b!213634 d!72225))

(declare-fun d!72227 () Bool)

(declare-fun e!145566 () Bool)

(assert (=> d!72227 e!145566))

(declare-fun res!179653 () Bool)

(assert (=> d!72227 (=> (not res!179653) (not e!145566))))

(declare-fun lt!337400 () (_ BitVec 64))

(declare-fun lt!337404 () (_ BitVec 64))

(declare-fun lt!337405 () (_ BitVec 64))

(assert (=> d!72227 (= res!179653 (= lt!337405 (bvsub lt!337404 lt!337400)))))

(assert (=> d!72227 (or (= (bvand lt!337404 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!337400 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!337404 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337404 lt!337400) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72227 (= lt!337400 (remainingBits!0 ((_ sign_extend 32) (size!4634 (buf!5166 thiss!1204))) ((_ sign_extend 32) (currentByte!9738 thiss!1204)) ((_ sign_extend 32) (currentBit!9733 thiss!1204))))))

(declare-fun lt!337402 () (_ BitVec 64))

(declare-fun lt!337401 () (_ BitVec 64))

(assert (=> d!72227 (= lt!337404 (bvmul lt!337402 lt!337401))))

(assert (=> d!72227 (or (= lt!337402 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!337401 (bvsdiv (bvmul lt!337402 lt!337401) lt!337402)))))

(assert (=> d!72227 (= lt!337401 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72227 (= lt!337402 ((_ sign_extend 32) (size!4634 (buf!5166 thiss!1204))))))

(assert (=> d!72227 (= lt!337405 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9738 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9733 thiss!1204))))))

(assert (=> d!72227 (invariant!0 (currentBit!9733 thiss!1204) (currentByte!9738 thiss!1204) (size!4634 (buf!5166 thiss!1204)))))

(assert (=> d!72227 (= (bitIndex!0 (size!4634 (buf!5166 thiss!1204)) (currentByte!9738 thiss!1204) (currentBit!9733 thiss!1204)) lt!337405)))

(declare-fun b!213742 () Bool)

(declare-fun res!179652 () Bool)

(assert (=> b!213742 (=> (not res!179652) (not e!145566))))

(assert (=> b!213742 (= res!179652 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!337405))))

(declare-fun b!213743 () Bool)

(declare-fun lt!337403 () (_ BitVec 64))

(assert (=> b!213743 (= e!145566 (bvsle lt!337405 (bvmul lt!337403 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213743 (or (= lt!337403 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!337403 #b0000000000000000000000000000000000000000000000000000000000001000) lt!337403)))))

(assert (=> b!213743 (= lt!337403 ((_ sign_extend 32) (size!4634 (buf!5166 thiss!1204))))))

(assert (= (and d!72227 res!179653) b!213742))

(assert (= (and b!213742 res!179652) b!213743))

(declare-fun m!329403 () Bool)

(assert (=> d!72227 m!329403))

(assert (=> d!72227 m!329221))

(assert (=> b!213634 d!72227))

(declare-fun d!72229 () Bool)

(declare-datatypes ((tuple2!18302 0))(
  ( (tuple2!18303 (_1!9806 Bool) (_2!9806 BitStream!8376)) )
))
(declare-fun lt!337408 () tuple2!18302)

(declare-fun readBit!0 (BitStream!8376) tuple2!18302)

(assert (=> d!72229 (= lt!337408 (readBit!0 (BitStream!8377 (buf!5166 (_2!9799 lt!337264)) (currentByte!9738 thiss!1204) (currentBit!9733 thiss!1204))))))

(assert (=> d!72229 (= (readBitPure!0 (BitStream!8377 (buf!5166 (_2!9799 lt!337264)) (currentByte!9738 thiss!1204) (currentBit!9733 thiss!1204))) (tuple2!18293 (_2!9806 lt!337408) (_1!9806 lt!337408)))))

(declare-fun bs!17715 () Bool)

(assert (= bs!17715 d!72229))

(declare-fun m!329405 () Bool)

(assert (=> bs!17715 m!329405))

(assert (=> b!213645 d!72229))

(declare-fun d!72231 () Bool)

(declare-fun e!145567 () Bool)

(assert (=> d!72231 e!145567))

(declare-fun res!179655 () Bool)

(assert (=> d!72231 (=> (not res!179655) (not e!145567))))

(declare-fun lt!337409 () (_ BitVec 64))

(declare-fun lt!337413 () (_ BitVec 64))

(declare-fun lt!337414 () (_ BitVec 64))

(assert (=> d!72231 (= res!179655 (= lt!337414 (bvsub lt!337413 lt!337409)))))

(assert (=> d!72231 (or (= (bvand lt!337413 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!337409 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!337413 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337413 lt!337409) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72231 (= lt!337409 (remainingBits!0 ((_ sign_extend 32) (size!4634 (buf!5166 (_1!9801 lt!337270)))) ((_ sign_extend 32) (currentByte!9738 (_1!9801 lt!337270))) ((_ sign_extend 32) (currentBit!9733 (_1!9801 lt!337270)))))))

(declare-fun lt!337411 () (_ BitVec 64))

(declare-fun lt!337410 () (_ BitVec 64))

(assert (=> d!72231 (= lt!337413 (bvmul lt!337411 lt!337410))))

(assert (=> d!72231 (or (= lt!337411 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!337410 (bvsdiv (bvmul lt!337411 lt!337410) lt!337411)))))

(assert (=> d!72231 (= lt!337410 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72231 (= lt!337411 ((_ sign_extend 32) (size!4634 (buf!5166 (_1!9801 lt!337270)))))))

(assert (=> d!72231 (= lt!337414 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9738 (_1!9801 lt!337270))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9733 (_1!9801 lt!337270)))))))

(assert (=> d!72231 (invariant!0 (currentBit!9733 (_1!9801 lt!337270)) (currentByte!9738 (_1!9801 lt!337270)) (size!4634 (buf!5166 (_1!9801 lt!337270))))))

(assert (=> d!72231 (= (bitIndex!0 (size!4634 (buf!5166 (_1!9801 lt!337270))) (currentByte!9738 (_1!9801 lt!337270)) (currentBit!9733 (_1!9801 lt!337270))) lt!337414)))

(declare-fun b!213744 () Bool)

(declare-fun res!179654 () Bool)

(assert (=> b!213744 (=> (not res!179654) (not e!145567))))

(assert (=> b!213744 (= res!179654 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!337414))))

(declare-fun b!213745 () Bool)

(declare-fun lt!337412 () (_ BitVec 64))

(assert (=> b!213745 (= e!145567 (bvsle lt!337414 (bvmul lt!337412 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213745 (or (= lt!337412 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!337412 #b0000000000000000000000000000000000000000000000000000000000001000) lt!337412)))))

(assert (=> b!213745 (= lt!337412 ((_ sign_extend 32) (size!4634 (buf!5166 (_1!9801 lt!337270)))))))

(assert (= (and d!72231 res!179655) b!213744))

(assert (= (and b!213744 res!179654) b!213745))

(declare-fun m!329407 () Bool)

(assert (=> d!72231 m!329407))

(declare-fun m!329409 () Bool)

(assert (=> d!72231 m!329409))

(assert (=> b!213645 d!72231))

(declare-fun d!72233 () Bool)

(assert (=> d!72233 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4634 (buf!5166 (_2!9799 lt!337264)))) ((_ sign_extend 32) (currentByte!9738 (_2!9799 lt!337263))) ((_ sign_extend 32) (currentBit!9733 (_2!9799 lt!337263))) lt!337260) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4634 (buf!5166 (_2!9799 lt!337264)))) ((_ sign_extend 32) (currentByte!9738 (_2!9799 lt!337263))) ((_ sign_extend 32) (currentBit!9733 (_2!9799 lt!337263)))) lt!337260))))

(declare-fun bs!17716 () Bool)

(assert (= bs!17716 d!72233))

(declare-fun m!329411 () Bool)

(assert (=> bs!17716 m!329411))

(assert (=> b!213645 d!72233))

(declare-fun d!72235 () Bool)

(assert (=> d!72235 (= (invariant!0 (currentBit!9733 thiss!1204) (currentByte!9738 thiss!1204) (size!4634 (buf!5166 (_2!9799 lt!337263)))) (and (bvsge (currentBit!9733 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9733 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9738 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9738 thiss!1204) (size!4634 (buf!5166 (_2!9799 lt!337263)))) (and (= (currentBit!9733 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9738 thiss!1204) (size!4634 (buf!5166 (_2!9799 lt!337263))))))))))

(assert (=> b!213645 d!72235))

(declare-fun d!72237 () Bool)

(declare-fun e!145572 () Bool)

(assert (=> d!72237 e!145572))

(declare-fun res!179663 () Bool)

(assert (=> d!72237 (=> (not res!179663) (not e!145572))))

(declare-fun lt!337460 () tuple2!18286)

(assert (=> d!72237 (= res!179663 (isPrefixOf!0 (_1!9798 lt!337460) (_2!9798 lt!337460)))))

(declare-fun lt!337471 () BitStream!8376)

(assert (=> d!72237 (= lt!337460 (tuple2!18287 lt!337471 (_2!9799 lt!337264)))))

(declare-fun lt!337470 () Unit!15213)

(declare-fun lt!337464 () Unit!15213)

(assert (=> d!72237 (= lt!337470 lt!337464)))

(assert (=> d!72237 (isPrefixOf!0 lt!337471 (_2!9799 lt!337264))))

(assert (=> d!72237 (= lt!337464 (lemmaIsPrefixTransitive!0 lt!337471 (_2!9799 lt!337264) (_2!9799 lt!337264)))))

(declare-fun lt!337466 () Unit!15213)

(declare-fun lt!337456 () Unit!15213)

(assert (=> d!72237 (= lt!337466 lt!337456)))

(assert (=> d!72237 (isPrefixOf!0 lt!337471 (_2!9799 lt!337264))))

(assert (=> d!72237 (= lt!337456 (lemmaIsPrefixTransitive!0 lt!337471 (_2!9799 lt!337263) (_2!9799 lt!337264)))))

(declare-fun lt!337459 () Unit!15213)

(declare-fun e!145573 () Unit!15213)

(assert (=> d!72237 (= lt!337459 e!145573)))

(declare-fun c!10481 () Bool)

(assert (=> d!72237 (= c!10481 (not (= (size!4634 (buf!5166 (_2!9799 lt!337263))) #b00000000000000000000000000000000)))))

(declare-fun lt!337468 () Unit!15213)

(declare-fun lt!337467 () Unit!15213)

(assert (=> d!72237 (= lt!337468 lt!337467)))

(assert (=> d!72237 (isPrefixOf!0 (_2!9799 lt!337264) (_2!9799 lt!337264))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8376) Unit!15213)

(assert (=> d!72237 (= lt!337467 (lemmaIsPrefixRefl!0 (_2!9799 lt!337264)))))

(declare-fun lt!337455 () Unit!15213)

(declare-fun lt!337463 () Unit!15213)

(assert (=> d!72237 (= lt!337455 lt!337463)))

(assert (=> d!72237 (= lt!337463 (lemmaIsPrefixRefl!0 (_2!9799 lt!337264)))))

(declare-fun lt!337458 () Unit!15213)

(declare-fun lt!337465 () Unit!15213)

(assert (=> d!72237 (= lt!337458 lt!337465)))

(assert (=> d!72237 (isPrefixOf!0 lt!337471 lt!337471)))

(assert (=> d!72237 (= lt!337465 (lemmaIsPrefixRefl!0 lt!337471))))

(declare-fun lt!337469 () Unit!15213)

(declare-fun lt!337462 () Unit!15213)

(assert (=> d!72237 (= lt!337469 lt!337462)))

(assert (=> d!72237 (isPrefixOf!0 (_2!9799 lt!337263) (_2!9799 lt!337263))))

(assert (=> d!72237 (= lt!337462 (lemmaIsPrefixRefl!0 (_2!9799 lt!337263)))))

(assert (=> d!72237 (= lt!337471 (BitStream!8377 (buf!5166 (_2!9799 lt!337264)) (currentByte!9738 (_2!9799 lt!337263)) (currentBit!9733 (_2!9799 lt!337263))))))

(assert (=> d!72237 (isPrefixOf!0 (_2!9799 lt!337263) (_2!9799 lt!337264))))

(assert (=> d!72237 (= (reader!0 (_2!9799 lt!337263) (_2!9799 lt!337264)) lt!337460)))

(declare-fun b!213756 () Bool)

(declare-fun lt!337461 () Unit!15213)

(assert (=> b!213756 (= e!145573 lt!337461)))

(declare-fun lt!337457 () (_ BitVec 64))

(assert (=> b!213756 (= lt!337457 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!337472 () (_ BitVec 64))

(assert (=> b!213756 (= lt!337472 (bitIndex!0 (size!4634 (buf!5166 (_2!9799 lt!337263))) (currentByte!9738 (_2!9799 lt!337263)) (currentBit!9733 (_2!9799 lt!337263))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10552 array!10552 (_ BitVec 64) (_ BitVec 64)) Unit!15213)

(assert (=> b!213756 (= lt!337461 (arrayBitRangesEqSymmetric!0 (buf!5166 (_2!9799 lt!337263)) (buf!5166 (_2!9799 lt!337264)) lt!337457 lt!337472))))

(assert (=> b!213756 (arrayBitRangesEq!0 (buf!5166 (_2!9799 lt!337264)) (buf!5166 (_2!9799 lt!337263)) lt!337457 lt!337472)))

(declare-fun b!213757 () Bool)

(declare-fun lt!337473 () (_ BitVec 64))

(declare-fun lt!337474 () (_ BitVec 64))

(assert (=> b!213757 (= e!145572 (= (_1!9798 lt!337460) (withMovedBitIndex!0 (_2!9798 lt!337460) (bvsub lt!337474 lt!337473))))))

(assert (=> b!213757 (or (= (bvand lt!337474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!337473 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!337474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337474 lt!337473) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213757 (= lt!337473 (bitIndex!0 (size!4634 (buf!5166 (_2!9799 lt!337264))) (currentByte!9738 (_2!9799 lt!337264)) (currentBit!9733 (_2!9799 lt!337264))))))

(assert (=> b!213757 (= lt!337474 (bitIndex!0 (size!4634 (buf!5166 (_2!9799 lt!337263))) (currentByte!9738 (_2!9799 lt!337263)) (currentBit!9733 (_2!9799 lt!337263))))))

(declare-fun b!213758 () Bool)

(declare-fun res!179664 () Bool)

(assert (=> b!213758 (=> (not res!179664) (not e!145572))))

(assert (=> b!213758 (= res!179664 (isPrefixOf!0 (_1!9798 lt!337460) (_2!9799 lt!337263)))))

(declare-fun b!213759 () Bool)

(declare-fun res!179662 () Bool)

(assert (=> b!213759 (=> (not res!179662) (not e!145572))))

(assert (=> b!213759 (= res!179662 (isPrefixOf!0 (_2!9798 lt!337460) (_2!9799 lt!337264)))))

(declare-fun b!213760 () Bool)

(declare-fun Unit!15217 () Unit!15213)

(assert (=> b!213760 (= e!145573 Unit!15217)))

(assert (= (and d!72237 c!10481) b!213756))

(assert (= (and d!72237 (not c!10481)) b!213760))

(assert (= (and d!72237 res!179663) b!213758))

(assert (= (and b!213758 res!179664) b!213759))

(assert (= (and b!213759 res!179662) b!213757))

(declare-fun m!329413 () Bool)

(assert (=> b!213759 m!329413))

(assert (=> b!213756 m!329231))

(declare-fun m!329415 () Bool)

(assert (=> b!213756 m!329415))

(declare-fun m!329417 () Bool)

(assert (=> b!213756 m!329417))

(declare-fun m!329419 () Bool)

(assert (=> b!213758 m!329419))

(declare-fun m!329421 () Bool)

(assert (=> b!213757 m!329421))

(assert (=> b!213757 m!329223))

(assert (=> b!213757 m!329231))

(declare-fun m!329423 () Bool)

(assert (=> d!72237 m!329423))

(assert (=> d!72237 m!329279))

(declare-fun m!329425 () Bool)

(assert (=> d!72237 m!329425))

(declare-fun m!329427 () Bool)

(assert (=> d!72237 m!329427))

(declare-fun m!329429 () Bool)

(assert (=> d!72237 m!329429))

(declare-fun m!329431 () Bool)

(assert (=> d!72237 m!329431))

(declare-fun m!329433 () Bool)

(assert (=> d!72237 m!329433))

(declare-fun m!329435 () Bool)

(assert (=> d!72237 m!329435))

(declare-fun m!329437 () Bool)

(assert (=> d!72237 m!329437))

(declare-fun m!329439 () Bool)

(assert (=> d!72237 m!329439))

(declare-fun m!329441 () Bool)

(assert (=> d!72237 m!329441))

(assert (=> b!213645 d!72237))

(declare-datatypes ((tuple2!18304 0))(
  ( (tuple2!18305 (_1!9807 (_ BitVec 64)) (_2!9807 BitStream!8376)) )
))
(declare-fun lt!337477 () tuple2!18304)

(declare-fun d!72239 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8376 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18304)

(assert (=> d!72239 (= lt!337477 (readNBitsLSBFirstsLoop!0 (_1!9798 lt!337246) nBits!348 i!590 lt!337247))))

(assert (=> d!72239 (= (readNBitsLSBFirstsLoopPure!0 (_1!9798 lt!337246) nBits!348 i!590 lt!337247) (tuple2!18291 (_2!9807 lt!337477) (_1!9807 lt!337477)))))

(declare-fun bs!17717 () Bool)

(assert (= bs!17717 d!72239))

(declare-fun m!329443 () Bool)

(assert (=> bs!17717 m!329443))

(assert (=> b!213645 d!72239))

(declare-fun d!72241 () Bool)

(declare-fun lt!337478 () tuple2!18302)

(assert (=> d!72241 (= lt!337478 (readBit!0 lt!337259))))

(assert (=> d!72241 (= (readBitPure!0 lt!337259) (tuple2!18293 (_2!9806 lt!337478) (_1!9806 lt!337478)))))

(declare-fun bs!17718 () Bool)

(assert (= bs!17718 d!72241))

(declare-fun m!329445 () Bool)

(assert (=> bs!17718 m!329445))

(assert (=> b!213645 d!72241))

(declare-fun d!72243 () Bool)

(declare-fun e!145574 () Bool)

(assert (=> d!72243 e!145574))

(declare-fun res!179666 () Bool)

(assert (=> d!72243 (=> (not res!179666) (not e!145574))))

(declare-fun lt!337484 () tuple2!18286)

(assert (=> d!72243 (= res!179666 (isPrefixOf!0 (_1!9798 lt!337484) (_2!9798 lt!337484)))))

(declare-fun lt!337495 () BitStream!8376)

(assert (=> d!72243 (= lt!337484 (tuple2!18287 lt!337495 (_2!9799 lt!337264)))))

(declare-fun lt!337494 () Unit!15213)

(declare-fun lt!337488 () Unit!15213)

(assert (=> d!72243 (= lt!337494 lt!337488)))

(assert (=> d!72243 (isPrefixOf!0 lt!337495 (_2!9799 lt!337264))))

(assert (=> d!72243 (= lt!337488 (lemmaIsPrefixTransitive!0 lt!337495 (_2!9799 lt!337264) (_2!9799 lt!337264)))))

(declare-fun lt!337490 () Unit!15213)

(declare-fun lt!337480 () Unit!15213)

(assert (=> d!72243 (= lt!337490 lt!337480)))

(assert (=> d!72243 (isPrefixOf!0 lt!337495 (_2!9799 lt!337264))))

(assert (=> d!72243 (= lt!337480 (lemmaIsPrefixTransitive!0 lt!337495 thiss!1204 (_2!9799 lt!337264)))))

(declare-fun lt!337483 () Unit!15213)

(declare-fun e!145575 () Unit!15213)

(assert (=> d!72243 (= lt!337483 e!145575)))

(declare-fun c!10482 () Bool)

(assert (=> d!72243 (= c!10482 (not (= (size!4634 (buf!5166 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!337492 () Unit!15213)

(declare-fun lt!337491 () Unit!15213)

(assert (=> d!72243 (= lt!337492 lt!337491)))

(assert (=> d!72243 (isPrefixOf!0 (_2!9799 lt!337264) (_2!9799 lt!337264))))

(assert (=> d!72243 (= lt!337491 (lemmaIsPrefixRefl!0 (_2!9799 lt!337264)))))

(declare-fun lt!337479 () Unit!15213)

(declare-fun lt!337487 () Unit!15213)

(assert (=> d!72243 (= lt!337479 lt!337487)))

(assert (=> d!72243 (= lt!337487 (lemmaIsPrefixRefl!0 (_2!9799 lt!337264)))))

(declare-fun lt!337482 () Unit!15213)

(declare-fun lt!337489 () Unit!15213)

(assert (=> d!72243 (= lt!337482 lt!337489)))

(assert (=> d!72243 (isPrefixOf!0 lt!337495 lt!337495)))

(assert (=> d!72243 (= lt!337489 (lemmaIsPrefixRefl!0 lt!337495))))

(declare-fun lt!337493 () Unit!15213)

(declare-fun lt!337486 () Unit!15213)

(assert (=> d!72243 (= lt!337493 lt!337486)))

(assert (=> d!72243 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!72243 (= lt!337486 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!72243 (= lt!337495 (BitStream!8377 (buf!5166 (_2!9799 lt!337264)) (currentByte!9738 thiss!1204) (currentBit!9733 thiss!1204)))))

(assert (=> d!72243 (isPrefixOf!0 thiss!1204 (_2!9799 lt!337264))))

(assert (=> d!72243 (= (reader!0 thiss!1204 (_2!9799 lt!337264)) lt!337484)))

(declare-fun b!213761 () Bool)

(declare-fun lt!337485 () Unit!15213)

(assert (=> b!213761 (= e!145575 lt!337485)))

(declare-fun lt!337481 () (_ BitVec 64))

(assert (=> b!213761 (= lt!337481 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!337496 () (_ BitVec 64))

(assert (=> b!213761 (= lt!337496 (bitIndex!0 (size!4634 (buf!5166 thiss!1204)) (currentByte!9738 thiss!1204) (currentBit!9733 thiss!1204)))))

(assert (=> b!213761 (= lt!337485 (arrayBitRangesEqSymmetric!0 (buf!5166 thiss!1204) (buf!5166 (_2!9799 lt!337264)) lt!337481 lt!337496))))

(assert (=> b!213761 (arrayBitRangesEq!0 (buf!5166 (_2!9799 lt!337264)) (buf!5166 thiss!1204) lt!337481 lt!337496)))

(declare-fun lt!337497 () (_ BitVec 64))

(declare-fun lt!337498 () (_ BitVec 64))

(declare-fun b!213762 () Bool)

(assert (=> b!213762 (= e!145574 (= (_1!9798 lt!337484) (withMovedBitIndex!0 (_2!9798 lt!337484) (bvsub lt!337498 lt!337497))))))

(assert (=> b!213762 (or (= (bvand lt!337498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!337497 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!337498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337498 lt!337497) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213762 (= lt!337497 (bitIndex!0 (size!4634 (buf!5166 (_2!9799 lt!337264))) (currentByte!9738 (_2!9799 lt!337264)) (currentBit!9733 (_2!9799 lt!337264))))))

(assert (=> b!213762 (= lt!337498 (bitIndex!0 (size!4634 (buf!5166 thiss!1204)) (currentByte!9738 thiss!1204) (currentBit!9733 thiss!1204)))))

(declare-fun b!213763 () Bool)

(declare-fun res!179667 () Bool)

(assert (=> b!213763 (=> (not res!179667) (not e!145574))))

(assert (=> b!213763 (= res!179667 (isPrefixOf!0 (_1!9798 lt!337484) thiss!1204))))

(declare-fun b!213764 () Bool)

(declare-fun res!179665 () Bool)

(assert (=> b!213764 (=> (not res!179665) (not e!145574))))

(assert (=> b!213764 (= res!179665 (isPrefixOf!0 (_2!9798 lt!337484) (_2!9799 lt!337264)))))

(declare-fun b!213765 () Bool)

(declare-fun Unit!15218 () Unit!15213)

(assert (=> b!213765 (= e!145575 Unit!15218)))

(assert (= (and d!72243 c!10482) b!213761))

(assert (= (and d!72243 (not c!10482)) b!213765))

(assert (= (and d!72243 res!179666) b!213763))

(assert (= (and b!213763 res!179667) b!213764))

(assert (= (and b!213764 res!179665) b!213762))

(declare-fun m!329447 () Bool)

(assert (=> b!213764 m!329447))

(assert (=> b!213761 m!329233))

(declare-fun m!329449 () Bool)

(assert (=> b!213761 m!329449))

(declare-fun m!329451 () Bool)

(assert (=> b!213761 m!329451))

(declare-fun m!329453 () Bool)

(assert (=> b!213763 m!329453))

(declare-fun m!329455 () Bool)

(assert (=> b!213762 m!329455))

(assert (=> b!213762 m!329223))

(assert (=> b!213762 m!329233))

(declare-fun m!329457 () Bool)

(assert (=> d!72243 m!329457))

(assert (=> d!72243 m!329225))

(declare-fun m!329459 () Bool)

(assert (=> d!72243 m!329459))

(assert (=> d!72243 m!329427))

(declare-fun m!329461 () Bool)

(assert (=> d!72243 m!329461))

(declare-fun m!329463 () Bool)

(assert (=> d!72243 m!329463))

(assert (=> d!72243 m!329433))

(declare-fun m!329465 () Bool)

(assert (=> d!72243 m!329465))

(declare-fun m!329467 () Bool)

(assert (=> d!72243 m!329467))

(declare-fun m!329469 () Bool)

(assert (=> d!72243 m!329469))

(declare-fun m!329471 () Bool)

(assert (=> d!72243 m!329471))

(assert (=> b!213645 d!72243))

(declare-fun d!72245 () Bool)

(assert (=> d!72245 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4634 (buf!5166 (_2!9799 lt!337264)))) ((_ sign_extend 32) (currentByte!9738 thiss!1204)) ((_ sign_extend 32) (currentBit!9733 thiss!1204)) lt!337266) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4634 (buf!5166 (_2!9799 lt!337264)))) ((_ sign_extend 32) (currentByte!9738 thiss!1204)) ((_ sign_extend 32) (currentBit!9733 thiss!1204))) lt!337266))))

(declare-fun bs!17719 () Bool)

(assert (= bs!17719 d!72245))

(declare-fun m!329473 () Bool)

(assert (=> bs!17719 m!329473))

(assert (=> b!213645 d!72245))

(declare-fun d!72247 () Bool)

(declare-fun e!145578 () Bool)

(assert (=> d!72247 e!145578))

(declare-fun res!179670 () Bool)

(assert (=> d!72247 (=> (not res!179670) (not e!145578))))

(declare-fun lt!337510 () tuple2!18292)

(declare-fun lt!337508 () tuple2!18292)

(assert (=> d!72247 (= res!179670 (= (bitIndex!0 (size!4634 (buf!5166 (_1!9801 lt!337510))) (currentByte!9738 (_1!9801 lt!337510)) (currentBit!9733 (_1!9801 lt!337510))) (bitIndex!0 (size!4634 (buf!5166 (_1!9801 lt!337508))) (currentByte!9738 (_1!9801 lt!337508)) (currentBit!9733 (_1!9801 lt!337508)))))))

(declare-fun lt!337509 () Unit!15213)

(declare-fun lt!337507 () BitStream!8376)

(declare-fun choose!50 (BitStream!8376 BitStream!8376 BitStream!8376 tuple2!18292 tuple2!18292 BitStream!8376 Bool tuple2!18292 tuple2!18292 BitStream!8376 Bool) Unit!15213)

(assert (=> d!72247 (= lt!337509 (choose!50 lt!337259 (_2!9799 lt!337264) lt!337507 lt!337510 (tuple2!18293 (_1!9801 lt!337510) (_2!9801 lt!337510)) (_1!9801 lt!337510) (_2!9801 lt!337510) lt!337508 (tuple2!18293 (_1!9801 lt!337508) (_2!9801 lt!337508)) (_1!9801 lt!337508) (_2!9801 lt!337508)))))

(assert (=> d!72247 (= lt!337508 (readBitPure!0 lt!337507))))

(assert (=> d!72247 (= lt!337510 (readBitPure!0 lt!337259))))

(assert (=> d!72247 (= lt!337507 (BitStream!8377 (buf!5166 (_2!9799 lt!337264)) (currentByte!9738 lt!337259) (currentBit!9733 lt!337259)))))

(assert (=> d!72247 (invariant!0 (currentBit!9733 lt!337259) (currentByte!9738 lt!337259) (size!4634 (buf!5166 (_2!9799 lt!337264))))))

(assert (=> d!72247 (= (readBitPrefixLemma!0 lt!337259 (_2!9799 lt!337264)) lt!337509)))

(declare-fun b!213768 () Bool)

(assert (=> b!213768 (= e!145578 (= (_2!9801 lt!337510) (_2!9801 lt!337508)))))

(assert (= (and d!72247 res!179670) b!213768))

(assert (=> d!72247 m!329243))

(declare-fun m!329475 () Bool)

(assert (=> d!72247 m!329475))

(declare-fun m!329477 () Bool)

(assert (=> d!72247 m!329477))

(declare-fun m!329479 () Bool)

(assert (=> d!72247 m!329479))

(declare-fun m!329481 () Bool)

(assert (=> d!72247 m!329481))

(declare-fun m!329483 () Bool)

(assert (=> d!72247 m!329483))

(assert (=> b!213645 d!72247))

(declare-fun d!72249 () Bool)

(assert (=> d!72249 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!213645 d!72249))

(declare-fun d!72251 () Bool)

(assert (=> d!72251 (validate_offset_bits!1 ((_ sign_extend 32) (size!4634 (buf!5166 (_2!9799 lt!337264)))) ((_ sign_extend 32) (currentByte!9738 (_2!9799 lt!337263))) ((_ sign_extend 32) (currentBit!9733 (_2!9799 lt!337263))) lt!337260)))

(declare-fun lt!337513 () Unit!15213)

(declare-fun choose!9 (BitStream!8376 array!10552 (_ BitVec 64) BitStream!8376) Unit!15213)

(assert (=> d!72251 (= lt!337513 (choose!9 (_2!9799 lt!337263) (buf!5166 (_2!9799 lt!337264)) lt!337260 (BitStream!8377 (buf!5166 (_2!9799 lt!337264)) (currentByte!9738 (_2!9799 lt!337263)) (currentBit!9733 (_2!9799 lt!337263)))))))

(assert (=> d!72251 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9799 lt!337263) (buf!5166 (_2!9799 lt!337264)) lt!337260) lt!337513)))

(declare-fun bs!17720 () Bool)

(assert (= bs!17720 d!72251))

(assert (=> bs!17720 m!329259))

(declare-fun m!329485 () Bool)

(assert (=> bs!17720 m!329485))

(assert (=> b!213645 d!72251))

(declare-fun lt!337514 () tuple2!18304)

(declare-fun d!72253 () Bool)

(assert (=> d!72253 (= lt!337514 (readNBitsLSBFirstsLoop!0 (_1!9798 lt!337261) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!337245))))

(assert (=> d!72253 (= (readNBitsLSBFirstsLoopPure!0 (_1!9798 lt!337261) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!337245) (tuple2!18291 (_2!9807 lt!337514) (_1!9807 lt!337514)))))

(declare-fun bs!17721 () Bool)

(assert (= bs!17721 d!72253))

(declare-fun m!329487 () Bool)

(assert (=> bs!17721 m!329487))

(assert (=> b!213645 d!72253))

(declare-fun d!72255 () Bool)

(declare-fun e!145579 () Bool)

(assert (=> d!72255 e!145579))

(declare-fun res!179672 () Bool)

(assert (=> d!72255 (=> (not res!179672) (not e!145579))))

(declare-fun lt!337520 () (_ BitVec 64))

(declare-fun lt!337515 () (_ BitVec 64))

(declare-fun lt!337519 () (_ BitVec 64))

(assert (=> d!72255 (= res!179672 (= lt!337520 (bvsub lt!337519 lt!337515)))))

(assert (=> d!72255 (or (= (bvand lt!337519 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!337515 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!337519 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337519 lt!337515) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72255 (= lt!337515 (remainingBits!0 ((_ sign_extend 32) (size!4634 (buf!5166 (_1!9801 lt!337255)))) ((_ sign_extend 32) (currentByte!9738 (_1!9801 lt!337255))) ((_ sign_extend 32) (currentBit!9733 (_1!9801 lt!337255)))))))

(declare-fun lt!337517 () (_ BitVec 64))

(declare-fun lt!337516 () (_ BitVec 64))

(assert (=> d!72255 (= lt!337519 (bvmul lt!337517 lt!337516))))

(assert (=> d!72255 (or (= lt!337517 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!337516 (bvsdiv (bvmul lt!337517 lt!337516) lt!337517)))))

(assert (=> d!72255 (= lt!337516 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72255 (= lt!337517 ((_ sign_extend 32) (size!4634 (buf!5166 (_1!9801 lt!337255)))))))

(assert (=> d!72255 (= lt!337520 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9738 (_1!9801 lt!337255))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9733 (_1!9801 lt!337255)))))))

(assert (=> d!72255 (invariant!0 (currentBit!9733 (_1!9801 lt!337255)) (currentByte!9738 (_1!9801 lt!337255)) (size!4634 (buf!5166 (_1!9801 lt!337255))))))

(assert (=> d!72255 (= (bitIndex!0 (size!4634 (buf!5166 (_1!9801 lt!337255))) (currentByte!9738 (_1!9801 lt!337255)) (currentBit!9733 (_1!9801 lt!337255))) lt!337520)))

(declare-fun b!213769 () Bool)

(declare-fun res!179671 () Bool)

(assert (=> b!213769 (=> (not res!179671) (not e!145579))))

(assert (=> b!213769 (= res!179671 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!337520))))

(declare-fun b!213770 () Bool)

(declare-fun lt!337518 () (_ BitVec 64))

(assert (=> b!213770 (= e!145579 (bvsle lt!337520 (bvmul lt!337518 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213770 (or (= lt!337518 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!337518 #b0000000000000000000000000000000000000000000000000000000000001000) lt!337518)))))

(assert (=> b!213770 (= lt!337518 ((_ sign_extend 32) (size!4634 (buf!5166 (_1!9801 lt!337255)))))))

(assert (= (and d!72255 res!179672) b!213769))

(assert (= (and b!213769 res!179671) b!213770))

(declare-fun m!329489 () Bool)

(assert (=> d!72255 m!329489))

(declare-fun m!329491 () Bool)

(assert (=> d!72255 m!329491))

(assert (=> b!213645 d!72255))

(declare-fun d!72257 () Bool)

(assert (=> d!72257 (validate_offset_bits!1 ((_ sign_extend 32) (size!4634 (buf!5166 (_2!9799 lt!337264)))) ((_ sign_extend 32) (currentByte!9738 thiss!1204)) ((_ sign_extend 32) (currentBit!9733 thiss!1204)) lt!337266)))

(declare-fun lt!337521 () Unit!15213)

(assert (=> d!72257 (= lt!337521 (choose!9 thiss!1204 (buf!5166 (_2!9799 lt!337264)) lt!337266 (BitStream!8377 (buf!5166 (_2!9799 lt!337264)) (currentByte!9738 thiss!1204) (currentBit!9733 thiss!1204))))))

(assert (=> d!72257 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5166 (_2!9799 lt!337264)) lt!337266) lt!337521)))

(declare-fun bs!17722 () Bool)

(assert (= bs!17722 d!72257))

(assert (=> bs!17722 m!329245))

(declare-fun m!329493 () Bool)

(assert (=> bs!17722 m!329493))

(assert (=> b!213645 d!72257))

(declare-fun d!72259 () Bool)

(declare-fun lt!337522 () tuple2!18302)

(assert (=> d!72259 (= lt!337522 (readBit!0 (_1!9798 lt!337246)))))

(assert (=> d!72259 (= (readBitPure!0 (_1!9798 lt!337246)) (tuple2!18293 (_2!9806 lt!337522) (_1!9806 lt!337522)))))

(declare-fun bs!17723 () Bool)

(assert (= bs!17723 d!72259))

(declare-fun m!329495 () Bool)

(assert (=> bs!17723 m!329495))

(assert (=> b!213645 d!72259))

(declare-fun d!72261 () Bool)

(declare-fun e!145580 () Bool)

(assert (=> d!72261 e!145580))

(declare-fun res!179674 () Bool)

(assert (=> d!72261 (=> (not res!179674) (not e!145580))))

(declare-fun lt!337523 () (_ BitVec 64))

(declare-fun lt!337528 () (_ BitVec 64))

(declare-fun lt!337527 () (_ BitVec 64))

(assert (=> d!72261 (= res!179674 (= lt!337528 (bvsub lt!337527 lt!337523)))))

(assert (=> d!72261 (or (= (bvand lt!337527 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!337523 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!337527 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337527 lt!337523) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72261 (= lt!337523 (remainingBits!0 ((_ sign_extend 32) (size!4634 (buf!5166 (_2!9799 lt!337264)))) ((_ sign_extend 32) (currentByte!9738 (_2!9799 lt!337264))) ((_ sign_extend 32) (currentBit!9733 (_2!9799 lt!337264)))))))

(declare-fun lt!337525 () (_ BitVec 64))

(declare-fun lt!337524 () (_ BitVec 64))

(assert (=> d!72261 (= lt!337527 (bvmul lt!337525 lt!337524))))

(assert (=> d!72261 (or (= lt!337525 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!337524 (bvsdiv (bvmul lt!337525 lt!337524) lt!337525)))))

(assert (=> d!72261 (= lt!337524 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72261 (= lt!337525 ((_ sign_extend 32) (size!4634 (buf!5166 (_2!9799 lt!337264)))))))

(assert (=> d!72261 (= lt!337528 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9738 (_2!9799 lt!337264))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9733 (_2!9799 lt!337264)))))))

(assert (=> d!72261 (invariant!0 (currentBit!9733 (_2!9799 lt!337264)) (currentByte!9738 (_2!9799 lt!337264)) (size!4634 (buf!5166 (_2!9799 lt!337264))))))

(assert (=> d!72261 (= (bitIndex!0 (size!4634 (buf!5166 (_2!9799 lt!337264))) (currentByte!9738 (_2!9799 lt!337264)) (currentBit!9733 (_2!9799 lt!337264))) lt!337528)))

(declare-fun b!213771 () Bool)

(declare-fun res!179673 () Bool)

(assert (=> b!213771 (=> (not res!179673) (not e!145580))))

(assert (=> b!213771 (= res!179673 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!337528))))

(declare-fun b!213772 () Bool)

(declare-fun lt!337526 () (_ BitVec 64))

(assert (=> b!213772 (= e!145580 (bvsle lt!337528 (bvmul lt!337526 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213772 (or (= lt!337526 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!337526 #b0000000000000000000000000000000000000000000000000000000000001000) lt!337526)))))

(assert (=> b!213772 (= lt!337526 ((_ sign_extend 32) (size!4634 (buf!5166 (_2!9799 lt!337264)))))))

(assert (= (and d!72261 res!179674) b!213771))

(assert (= (and b!213771 res!179673) b!213772))

(declare-fun m!329497 () Bool)

(assert (=> d!72261 m!329497))

(assert (=> d!72261 m!329285))

(assert (=> b!213635 d!72261))

(declare-fun d!72263 () Bool)

(declare-fun res!179675 () Bool)

(declare-fun e!145581 () Bool)

(assert (=> d!72263 (=> (not res!179675) (not e!145581))))

(assert (=> d!72263 (= res!179675 (= (size!4634 (buf!5166 thiss!1204)) (size!4634 (buf!5166 (_2!9799 lt!337264)))))))

(assert (=> d!72263 (= (isPrefixOf!0 thiss!1204 (_2!9799 lt!337264)) e!145581)))

(declare-fun b!213773 () Bool)

(declare-fun res!179677 () Bool)

(assert (=> b!213773 (=> (not res!179677) (not e!145581))))

(assert (=> b!213773 (= res!179677 (bvsle (bitIndex!0 (size!4634 (buf!5166 thiss!1204)) (currentByte!9738 thiss!1204) (currentBit!9733 thiss!1204)) (bitIndex!0 (size!4634 (buf!5166 (_2!9799 lt!337264))) (currentByte!9738 (_2!9799 lt!337264)) (currentBit!9733 (_2!9799 lt!337264)))))))

(declare-fun b!213774 () Bool)

(declare-fun e!145582 () Bool)

(assert (=> b!213774 (= e!145581 e!145582)))

(declare-fun res!179676 () Bool)

(assert (=> b!213774 (=> res!179676 e!145582)))

(assert (=> b!213774 (= res!179676 (= (size!4634 (buf!5166 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!213775 () Bool)

(assert (=> b!213775 (= e!145582 (arrayBitRangesEq!0 (buf!5166 thiss!1204) (buf!5166 (_2!9799 lt!337264)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4634 (buf!5166 thiss!1204)) (currentByte!9738 thiss!1204) (currentBit!9733 thiss!1204))))))

(assert (= (and d!72263 res!179675) b!213773))

(assert (= (and b!213773 res!179677) b!213774))

(assert (= (and b!213774 (not res!179676)) b!213775))

(assert (=> b!213773 m!329233))

(assert (=> b!213773 m!329223))

(assert (=> b!213775 m!329233))

(assert (=> b!213775 m!329233))

(declare-fun m!329499 () Bool)

(assert (=> b!213775 m!329499))

(assert (=> b!213635 d!72263))

(declare-fun d!72265 () Bool)

(assert (=> d!72265 (isPrefixOf!0 thiss!1204 (_2!9799 lt!337264))))

(declare-fun lt!337531 () Unit!15213)

(declare-fun choose!30 (BitStream!8376 BitStream!8376 BitStream!8376) Unit!15213)

(assert (=> d!72265 (= lt!337531 (choose!30 thiss!1204 (_2!9799 lt!337263) (_2!9799 lt!337264)))))

(assert (=> d!72265 (isPrefixOf!0 thiss!1204 (_2!9799 lt!337263))))

(assert (=> d!72265 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9799 lt!337263) (_2!9799 lt!337264)) lt!337531)))

(declare-fun bs!17724 () Bool)

(assert (= bs!17724 d!72265))

(assert (=> bs!17724 m!329225))

(declare-fun m!329501 () Bool)

(assert (=> bs!17724 m!329501))

(assert (=> bs!17724 m!329237))

(assert (=> b!213635 d!72265))

(declare-fun d!72267 () Bool)

(declare-fun e!145649 () Bool)

(assert (=> d!72267 e!145649))

(declare-fun res!179789 () Bool)

(assert (=> d!72267 (=> (not res!179789) (not e!145649))))

(declare-fun lt!337863 () tuple2!18288)

(assert (=> d!72267 (= res!179789 (invariant!0 (currentBit!9733 (_2!9799 lt!337863)) (currentByte!9738 (_2!9799 lt!337863)) (size!4634 (buf!5166 (_2!9799 lt!337863)))))))

(declare-fun e!145652 () tuple2!18288)

(assert (=> d!72267 (= lt!337863 e!145652)))

(declare-fun c!10492 () Bool)

(assert (=> d!72267 (= c!10492 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!72267 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!72267 (= (appendBitsLSBFirstLoopTR!0 (_2!9799 lt!337263) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!337863)))

(declare-fun b!213894 () Bool)

(declare-fun e!145656 () Bool)

(declare-fun lt!337903 () tuple2!18290)

(declare-fun lt!337893 () tuple2!18286)

(assert (=> b!213894 (= e!145656 (= (_1!9800 lt!337903) (_2!9798 lt!337893)))))

(declare-fun b!213895 () Bool)

(declare-fun res!179790 () Bool)

(assert (=> b!213895 (=> (not res!179790) (not e!145649))))

(declare-fun lt!337901 () (_ BitVec 64))

(declare-fun lt!337881 () (_ BitVec 64))

(assert (=> b!213895 (= res!179790 (= (bitIndex!0 (size!4634 (buf!5166 (_2!9799 lt!337863))) (currentByte!9738 (_2!9799 lt!337863)) (currentBit!9733 (_2!9799 lt!337863))) (bvsub lt!337881 lt!337901)))))

(assert (=> b!213895 (or (= (bvand lt!337881 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!337901 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!337881 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337881 lt!337901) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213895 (= lt!337901 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!337882 () (_ BitVec 64))

(declare-fun lt!337895 () (_ BitVec 64))

(assert (=> b!213895 (= lt!337881 (bvadd lt!337882 lt!337895))))

(assert (=> b!213895 (or (not (= (bvand lt!337882 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!337895 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!337882 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!337882 lt!337895) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213895 (= lt!337895 ((_ sign_extend 32) nBits!348))))

(assert (=> b!213895 (= lt!337882 (bitIndex!0 (size!4634 (buf!5166 (_2!9799 lt!337263))) (currentByte!9738 (_2!9799 lt!337263)) (currentBit!9733 (_2!9799 lt!337263))))))

(declare-fun b!213896 () Bool)

(assert (=> b!213896 (= e!145649 e!145656)))

(declare-fun res!179784 () Bool)

(assert (=> b!213896 (=> (not res!179784) (not e!145656))))

(assert (=> b!213896 (= res!179784 (= (_2!9800 lt!337903) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!213896 (= lt!337903 (readNBitsLSBFirstsLoopPure!0 (_1!9798 lt!337893) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!337883 () Unit!15213)

(declare-fun lt!337885 () Unit!15213)

(assert (=> b!213896 (= lt!337883 lt!337885)))

(declare-fun lt!337889 () (_ BitVec 64))

(assert (=> b!213896 (validate_offset_bits!1 ((_ sign_extend 32) (size!4634 (buf!5166 (_2!9799 lt!337863)))) ((_ sign_extend 32) (currentByte!9738 (_2!9799 lt!337263))) ((_ sign_extend 32) (currentBit!9733 (_2!9799 lt!337263))) lt!337889)))

(assert (=> b!213896 (= lt!337885 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9799 lt!337263) (buf!5166 (_2!9799 lt!337863)) lt!337889))))

(declare-fun e!145657 () Bool)

(assert (=> b!213896 e!145657))

(declare-fun res!179787 () Bool)

(assert (=> b!213896 (=> (not res!179787) (not e!145657))))

(assert (=> b!213896 (= res!179787 (and (= (size!4634 (buf!5166 (_2!9799 lt!337263))) (size!4634 (buf!5166 (_2!9799 lt!337863)))) (bvsge lt!337889 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213896 (= lt!337889 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!213896 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!213896 (= lt!337893 (reader!0 (_2!9799 lt!337263) (_2!9799 lt!337863)))))

(declare-fun b!213897 () Bool)

(declare-fun e!145650 () Bool)

(declare-fun lt!337884 () tuple2!18290)

(declare-fun lt!337912 () tuple2!18286)

(assert (=> b!213897 (= e!145650 (= (_1!9800 lt!337884) (_2!9798 lt!337912)))))

(declare-fun b!213898 () Bool)

(declare-fun e!145653 () (_ BitVec 64))

(assert (=> b!213898 (= e!145653 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!213899 () Bool)

(assert (=> b!213899 (= e!145653 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!213900 () Bool)

(declare-fun lt!337898 () tuple2!18292)

(declare-fun lt!337860 () tuple2!18288)

(assert (=> b!213900 (= lt!337898 (readBitPure!0 (readerFrom!0 (_2!9799 lt!337860) (currentBit!9733 (_2!9799 lt!337263)) (currentByte!9738 (_2!9799 lt!337263)))))))

(declare-fun lt!337869 () Bool)

(declare-fun res!179785 () Bool)

(assert (=> b!213900 (= res!179785 (and (= (_2!9801 lt!337898) lt!337869) (= (_1!9801 lt!337898) (_2!9799 lt!337860))))))

(declare-fun e!145654 () Bool)

(assert (=> b!213900 (=> (not res!179785) (not e!145654))))

(declare-fun e!145651 () Bool)

(assert (=> b!213900 (= e!145651 e!145654)))

(declare-fun b!213901 () Bool)

(declare-fun res!179781 () Bool)

(assert (=> b!213901 (= res!179781 (= (bitIndex!0 (size!4634 (buf!5166 (_2!9799 lt!337860))) (currentByte!9738 (_2!9799 lt!337860)) (currentBit!9733 (_2!9799 lt!337860))) (bvadd (bitIndex!0 (size!4634 (buf!5166 (_2!9799 lt!337263))) (currentByte!9738 (_2!9799 lt!337263)) (currentBit!9733 (_2!9799 lt!337263))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!213901 (=> (not res!179781) (not e!145651))))

(declare-fun b!213902 () Bool)

(declare-fun e!145655 () Bool)

(declare-fun lt!337871 () tuple2!18292)

(declare-fun lt!337911 () tuple2!18292)

(assert (=> b!213902 (= e!145655 (= (_2!9801 lt!337871) (_2!9801 lt!337911)))))

(declare-fun b!213903 () Bool)

(declare-fun Unit!15219 () Unit!15213)

(assert (=> b!213903 (= e!145652 (tuple2!18289 Unit!15219 (_2!9799 lt!337263)))))

(declare-fun lt!337899 () Unit!15213)

(assert (=> b!213903 (= lt!337899 (lemmaIsPrefixRefl!0 (_2!9799 lt!337263)))))

(declare-fun call!3354 () Bool)

(assert (=> b!213903 call!3354))

(declare-fun lt!337872 () Unit!15213)

(assert (=> b!213903 (= lt!337872 lt!337899)))

(declare-fun bm!3351 () Bool)

(declare-fun lt!337897 () tuple2!18288)

(assert (=> bm!3351 (= call!3354 (isPrefixOf!0 (_2!9799 lt!337263) (ite c!10492 (_2!9799 lt!337263) (_2!9799 lt!337897))))))

(declare-fun b!213904 () Bool)

(declare-fun res!179788 () Bool)

(assert (=> b!213904 (=> (not res!179788) (not e!145649))))

(assert (=> b!213904 (= res!179788 (= (size!4634 (buf!5166 (_2!9799 lt!337263))) (size!4634 (buf!5166 (_2!9799 lt!337863)))))))

(declare-fun b!213905 () Bool)

(assert (=> b!213905 (= e!145657 (validate_offset_bits!1 ((_ sign_extend 32) (size!4634 (buf!5166 (_2!9799 lt!337263)))) ((_ sign_extend 32) (currentByte!9738 (_2!9799 lt!337263))) ((_ sign_extend 32) (currentBit!9733 (_2!9799 lt!337263))) lt!337889))))

(declare-fun b!213906 () Bool)

(declare-fun res!179783 () Bool)

(assert (=> b!213906 (=> (not res!179783) (not e!145649))))

(assert (=> b!213906 (= res!179783 (isPrefixOf!0 (_2!9799 lt!337263) (_2!9799 lt!337863)))))

(declare-fun b!213907 () Bool)

(assert (=> b!213907 (= e!145654 (= (bitIndex!0 (size!4634 (buf!5166 (_1!9801 lt!337898))) (currentByte!9738 (_1!9801 lt!337898)) (currentBit!9733 (_1!9801 lt!337898))) (bitIndex!0 (size!4634 (buf!5166 (_2!9799 lt!337860))) (currentByte!9738 (_2!9799 lt!337860)) (currentBit!9733 (_2!9799 lt!337860)))))))

(declare-fun b!213908 () Bool)

(declare-fun res!179782 () Bool)

(assert (=> b!213908 (= res!179782 (isPrefixOf!0 (_2!9799 lt!337263) (_2!9799 lt!337860)))))

(assert (=> b!213908 (=> (not res!179782) (not e!145651))))

(declare-fun b!213909 () Bool)

(assert (=> b!213909 (= e!145652 (tuple2!18289 (_1!9799 lt!337897) (_2!9799 lt!337897)))))

(assert (=> b!213909 (= lt!337869 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213909 (= lt!337860 (appendBit!0 (_2!9799 lt!337263) lt!337869))))

(declare-fun res!179780 () Bool)

(assert (=> b!213909 (= res!179780 (= (size!4634 (buf!5166 (_2!9799 lt!337263))) (size!4634 (buf!5166 (_2!9799 lt!337860)))))))

(assert (=> b!213909 (=> (not res!179780) (not e!145651))))

(assert (=> b!213909 e!145651))

(declare-fun lt!337894 () tuple2!18288)

(assert (=> b!213909 (= lt!337894 lt!337860)))

(assert (=> b!213909 (= lt!337897 (appendBitsLSBFirstLoopTR!0 (_2!9799 lt!337894) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!337900 () Unit!15213)

(assert (=> b!213909 (= lt!337900 (lemmaIsPrefixTransitive!0 (_2!9799 lt!337263) (_2!9799 lt!337894) (_2!9799 lt!337897)))))

(assert (=> b!213909 call!3354))

(declare-fun lt!337886 () Unit!15213)

(assert (=> b!213909 (= lt!337886 lt!337900)))

(assert (=> b!213909 (invariant!0 (currentBit!9733 (_2!9799 lt!337263)) (currentByte!9738 (_2!9799 lt!337263)) (size!4634 (buf!5166 (_2!9799 lt!337894))))))

(declare-fun lt!337904 () BitStream!8376)

(assert (=> b!213909 (= lt!337904 (BitStream!8377 (buf!5166 (_2!9799 lt!337894)) (currentByte!9738 (_2!9799 lt!337263)) (currentBit!9733 (_2!9799 lt!337263))))))

(assert (=> b!213909 (invariant!0 (currentBit!9733 lt!337904) (currentByte!9738 lt!337904) (size!4634 (buf!5166 (_2!9799 lt!337897))))))

(declare-fun lt!337867 () BitStream!8376)

(assert (=> b!213909 (= lt!337867 (BitStream!8377 (buf!5166 (_2!9799 lt!337897)) (currentByte!9738 lt!337904) (currentBit!9733 lt!337904)))))

(assert (=> b!213909 (= lt!337871 (readBitPure!0 lt!337904))))

(assert (=> b!213909 (= lt!337911 (readBitPure!0 lt!337867))))

(declare-fun lt!337879 () Unit!15213)

(assert (=> b!213909 (= lt!337879 (readBitPrefixLemma!0 lt!337904 (_2!9799 lt!337897)))))

(declare-fun res!179786 () Bool)

(assert (=> b!213909 (= res!179786 (= (bitIndex!0 (size!4634 (buf!5166 (_1!9801 lt!337871))) (currentByte!9738 (_1!9801 lt!337871)) (currentBit!9733 (_1!9801 lt!337871))) (bitIndex!0 (size!4634 (buf!5166 (_1!9801 lt!337911))) (currentByte!9738 (_1!9801 lt!337911)) (currentBit!9733 (_1!9801 lt!337911)))))))

(assert (=> b!213909 (=> (not res!179786) (not e!145655))))

(assert (=> b!213909 e!145655))

(declare-fun lt!337888 () Unit!15213)

(assert (=> b!213909 (= lt!337888 lt!337879)))

(declare-fun lt!337910 () tuple2!18286)

(assert (=> b!213909 (= lt!337910 (reader!0 (_2!9799 lt!337263) (_2!9799 lt!337897)))))

(declare-fun lt!337862 () tuple2!18286)

(assert (=> b!213909 (= lt!337862 (reader!0 (_2!9799 lt!337894) (_2!9799 lt!337897)))))

(declare-fun lt!337877 () tuple2!18292)

(assert (=> b!213909 (= lt!337877 (readBitPure!0 (_1!9798 lt!337910)))))

(assert (=> b!213909 (= (_2!9801 lt!337877) lt!337869)))

(declare-fun lt!337870 () Unit!15213)

(declare-fun Unit!15220 () Unit!15213)

(assert (=> b!213909 (= lt!337870 Unit!15220)))

(declare-fun lt!337891 () (_ BitVec 64))

(assert (=> b!213909 (= lt!337891 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!337861 () (_ BitVec 64))

(assert (=> b!213909 (= lt!337861 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!337875 () Unit!15213)

(assert (=> b!213909 (= lt!337875 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9799 lt!337263) (buf!5166 (_2!9799 lt!337897)) lt!337861))))

(assert (=> b!213909 (validate_offset_bits!1 ((_ sign_extend 32) (size!4634 (buf!5166 (_2!9799 lt!337897)))) ((_ sign_extend 32) (currentByte!9738 (_2!9799 lt!337263))) ((_ sign_extend 32) (currentBit!9733 (_2!9799 lt!337263))) lt!337861)))

(declare-fun lt!337865 () Unit!15213)

(assert (=> b!213909 (= lt!337865 lt!337875)))

(declare-fun lt!337876 () tuple2!18290)

(assert (=> b!213909 (= lt!337876 (readNBitsLSBFirstsLoopPure!0 (_1!9798 lt!337910) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!337891))))

(declare-fun lt!337906 () (_ BitVec 64))

(assert (=> b!213909 (= lt!337906 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!337902 () Unit!15213)

(assert (=> b!213909 (= lt!337902 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9799 lt!337894) (buf!5166 (_2!9799 lt!337897)) lt!337906))))

(assert (=> b!213909 (validate_offset_bits!1 ((_ sign_extend 32) (size!4634 (buf!5166 (_2!9799 lt!337897)))) ((_ sign_extend 32) (currentByte!9738 (_2!9799 lt!337894))) ((_ sign_extend 32) (currentBit!9733 (_2!9799 lt!337894))) lt!337906)))

(declare-fun lt!337880 () Unit!15213)

(assert (=> b!213909 (= lt!337880 lt!337902)))

(declare-fun lt!337907 () tuple2!18290)

(assert (=> b!213909 (= lt!337907 (readNBitsLSBFirstsLoopPure!0 (_1!9798 lt!337862) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!337891 (ite (_2!9801 lt!337877) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!337858 () tuple2!18290)

(assert (=> b!213909 (= lt!337858 (readNBitsLSBFirstsLoopPure!0 (_1!9798 lt!337910) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!337891))))

(declare-fun c!10491 () Bool)

(assert (=> b!213909 (= c!10491 (_2!9801 (readBitPure!0 (_1!9798 lt!337910))))))

(declare-fun lt!337859 () tuple2!18290)

(assert (=> b!213909 (= lt!337859 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9798 lt!337910) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!337891 e!145653)))))

(declare-fun lt!337873 () Unit!15213)

(assert (=> b!213909 (= lt!337873 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9798 lt!337910) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!337891))))

(assert (=> b!213909 (and (= (_2!9800 lt!337858) (_2!9800 lt!337859)) (= (_1!9800 lt!337858) (_1!9800 lt!337859)))))

(declare-fun lt!337857 () Unit!15213)

(assert (=> b!213909 (= lt!337857 lt!337873)))

(assert (=> b!213909 (= (_1!9798 lt!337910) (withMovedBitIndex!0 (_2!9798 lt!337910) (bvsub (bitIndex!0 (size!4634 (buf!5166 (_2!9799 lt!337263))) (currentByte!9738 (_2!9799 lt!337263)) (currentBit!9733 (_2!9799 lt!337263))) (bitIndex!0 (size!4634 (buf!5166 (_2!9799 lt!337897))) (currentByte!9738 (_2!9799 lt!337897)) (currentBit!9733 (_2!9799 lt!337897))))))))

(declare-fun lt!337866 () Unit!15213)

(declare-fun Unit!15221 () Unit!15213)

(assert (=> b!213909 (= lt!337866 Unit!15221)))

(assert (=> b!213909 (= (_1!9798 lt!337862) (withMovedBitIndex!0 (_2!9798 lt!337862) (bvsub (bitIndex!0 (size!4634 (buf!5166 (_2!9799 lt!337894))) (currentByte!9738 (_2!9799 lt!337894)) (currentBit!9733 (_2!9799 lt!337894))) (bitIndex!0 (size!4634 (buf!5166 (_2!9799 lt!337897))) (currentByte!9738 (_2!9799 lt!337897)) (currentBit!9733 (_2!9799 lt!337897))))))))

(declare-fun lt!337909 () Unit!15213)

(declare-fun Unit!15222 () Unit!15213)

(assert (=> b!213909 (= lt!337909 Unit!15222)))

(assert (=> b!213909 (= (bitIndex!0 (size!4634 (buf!5166 (_2!9799 lt!337263))) (currentByte!9738 (_2!9799 lt!337263)) (currentBit!9733 (_2!9799 lt!337263))) (bvsub (bitIndex!0 (size!4634 (buf!5166 (_2!9799 lt!337894))) (currentByte!9738 (_2!9799 lt!337894)) (currentBit!9733 (_2!9799 lt!337894))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!337905 () Unit!15213)

(declare-fun Unit!15223 () Unit!15213)

(assert (=> b!213909 (= lt!337905 Unit!15223)))

(assert (=> b!213909 (= (_2!9800 lt!337876) (_2!9800 lt!337907))))

(declare-fun lt!337878 () Unit!15213)

(declare-fun Unit!15224 () Unit!15213)

(assert (=> b!213909 (= lt!337878 Unit!15224)))

(assert (=> b!213909 (invariant!0 (currentBit!9733 (_2!9799 lt!337897)) (currentByte!9738 (_2!9799 lt!337897)) (size!4634 (buf!5166 (_2!9799 lt!337897))))))

(declare-fun lt!337868 () Unit!15213)

(declare-fun Unit!15225 () Unit!15213)

(assert (=> b!213909 (= lt!337868 Unit!15225)))

(assert (=> b!213909 (= (size!4634 (buf!5166 (_2!9799 lt!337263))) (size!4634 (buf!5166 (_2!9799 lt!337897))))))

(declare-fun lt!337892 () Unit!15213)

(declare-fun Unit!15226 () Unit!15213)

(assert (=> b!213909 (= lt!337892 Unit!15226)))

(assert (=> b!213909 (= (bitIndex!0 (size!4634 (buf!5166 (_2!9799 lt!337897))) (currentByte!9738 (_2!9799 lt!337897)) (currentBit!9733 (_2!9799 lt!337897))) (bvsub (bvadd (bitIndex!0 (size!4634 (buf!5166 (_2!9799 lt!337263))) (currentByte!9738 (_2!9799 lt!337263)) (currentBit!9733 (_2!9799 lt!337263))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!337896 () Unit!15213)

(declare-fun Unit!15227 () Unit!15213)

(assert (=> b!213909 (= lt!337896 Unit!15227)))

(declare-fun lt!337887 () Unit!15213)

(declare-fun Unit!15228 () Unit!15213)

(assert (=> b!213909 (= lt!337887 Unit!15228)))

(assert (=> b!213909 (= lt!337912 (reader!0 (_2!9799 lt!337263) (_2!9799 lt!337897)))))

(declare-fun lt!337874 () (_ BitVec 64))

(assert (=> b!213909 (= lt!337874 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!337890 () Unit!15213)

(assert (=> b!213909 (= lt!337890 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9799 lt!337263) (buf!5166 (_2!9799 lt!337897)) lt!337874))))

(assert (=> b!213909 (validate_offset_bits!1 ((_ sign_extend 32) (size!4634 (buf!5166 (_2!9799 lt!337897)))) ((_ sign_extend 32) (currentByte!9738 (_2!9799 lt!337263))) ((_ sign_extend 32) (currentBit!9733 (_2!9799 lt!337263))) lt!337874)))

(declare-fun lt!337864 () Unit!15213)

(assert (=> b!213909 (= lt!337864 lt!337890)))

(assert (=> b!213909 (= lt!337884 (readNBitsLSBFirstsLoopPure!0 (_1!9798 lt!337912) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!179779 () Bool)

(assert (=> b!213909 (= res!179779 (= (_2!9800 lt!337884) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!213909 (=> (not res!179779) (not e!145650))))

(assert (=> b!213909 e!145650))

(declare-fun lt!337908 () Unit!15213)

(declare-fun Unit!15229 () Unit!15213)

(assert (=> b!213909 (= lt!337908 Unit!15229)))

(assert (= (and d!72267 c!10492) b!213903))

(assert (= (and d!72267 (not c!10492)) b!213909))

(assert (= (and b!213909 res!179780) b!213901))

(assert (= (and b!213901 res!179781) b!213908))

(assert (= (and b!213908 res!179782) b!213900))

(assert (= (and b!213900 res!179785) b!213907))

(assert (= (and b!213909 res!179786) b!213902))

(assert (= (and b!213909 c!10491) b!213899))

(assert (= (and b!213909 (not c!10491)) b!213898))

(assert (= (and b!213909 res!179779) b!213897))

(assert (= (or b!213903 b!213909) bm!3351))

(assert (= (and d!72267 res!179789) b!213904))

(assert (= (and b!213904 res!179788) b!213895))

(assert (= (and b!213895 res!179790) b!213906))

(assert (= (and b!213906 res!179783) b!213896))

(assert (= (and b!213896 res!179787) b!213905))

(assert (= (and b!213896 res!179784) b!213894))

(declare-fun m!329651 () Bool)

(assert (=> b!213906 m!329651))

(declare-fun m!329653 () Bool)

(assert (=> b!213900 m!329653))

(assert (=> b!213900 m!329653))

(declare-fun m!329655 () Bool)

(assert (=> b!213900 m!329655))

(declare-fun m!329657 () Bool)

(assert (=> b!213905 m!329657))

(declare-fun m!329659 () Bool)

(assert (=> bm!3351 m!329659))

(declare-fun m!329661 () Bool)

(assert (=> b!213901 m!329661))

(assert (=> b!213901 m!329231))

(declare-fun m!329663 () Bool)

(assert (=> d!72267 m!329663))

(declare-fun m!329665 () Bool)

(assert (=> b!213908 m!329665))

(declare-fun m!329667 () Bool)

(assert (=> b!213895 m!329667))

(assert (=> b!213895 m!329231))

(declare-fun m!329669 () Bool)

(assert (=> b!213909 m!329669))

(declare-fun m!329671 () Bool)

(assert (=> b!213909 m!329671))

(declare-fun m!329673 () Bool)

(assert (=> b!213909 m!329673))

(declare-fun m!329675 () Bool)

(assert (=> b!213909 m!329675))

(declare-fun m!329677 () Bool)

(assert (=> b!213909 m!329677))

(declare-fun m!329679 () Bool)

(assert (=> b!213909 m!329679))

(declare-fun m!329681 () Bool)

(assert (=> b!213909 m!329681))

(declare-fun m!329683 () Bool)

(assert (=> b!213909 m!329683))

(declare-fun m!329685 () Bool)

(assert (=> b!213909 m!329685))

(declare-fun m!329687 () Bool)

(assert (=> b!213909 m!329687))

(declare-fun m!329689 () Bool)

(assert (=> b!213909 m!329689))

(declare-fun m!329691 () Bool)

(assert (=> b!213909 m!329691))

(declare-fun m!329693 () Bool)

(assert (=> b!213909 m!329693))

(declare-fun m!329695 () Bool)

(assert (=> b!213909 m!329695))

(declare-fun m!329697 () Bool)

(assert (=> b!213909 m!329697))

(declare-fun m!329699 () Bool)

(assert (=> b!213909 m!329699))

(declare-fun m!329701 () Bool)

(assert (=> b!213909 m!329701))

(declare-fun m!329703 () Bool)

(assert (=> b!213909 m!329703))

(declare-fun m!329705 () Bool)

(assert (=> b!213909 m!329705))

(declare-fun m!329707 () Bool)

(assert (=> b!213909 m!329707))

(declare-fun m!329709 () Bool)

(assert (=> b!213909 m!329709))

(declare-fun m!329711 () Bool)

(assert (=> b!213909 m!329711))

(declare-fun m!329713 () Bool)

(assert (=> b!213909 m!329713))

(declare-fun m!329715 () Bool)

(assert (=> b!213909 m!329715))

(declare-fun m!329717 () Bool)

(assert (=> b!213909 m!329717))

(declare-fun m!329719 () Bool)

(assert (=> b!213909 m!329719))

(declare-fun m!329721 () Bool)

(assert (=> b!213909 m!329721))

(declare-fun m!329723 () Bool)

(assert (=> b!213909 m!329723))

(declare-fun m!329725 () Bool)

(assert (=> b!213909 m!329725))

(declare-fun m!329727 () Bool)

(assert (=> b!213909 m!329727))

(declare-fun m!329729 () Bool)

(assert (=> b!213909 m!329729))

(assert (=> b!213909 m!329231))

(assert (=> b!213909 m!329683))

(declare-fun m!329731 () Bool)

(assert (=> b!213909 m!329731))

(declare-fun m!329733 () Bool)

(assert (=> b!213896 m!329733))

(declare-fun m!329735 () Bool)

(assert (=> b!213896 m!329735))

(declare-fun m!329737 () Bool)

(assert (=> b!213896 m!329737))

(declare-fun m!329739 () Bool)

(assert (=> b!213896 m!329739))

(assert (=> b!213896 m!329687))

(assert (=> b!213896 m!329695))

(assert (=> b!213903 m!329425))

(declare-fun m!329741 () Bool)

(assert (=> b!213907 m!329741))

(assert (=> b!213907 m!329661))

(assert (=> b!213635 d!72267))

(declare-fun d!72339 () Bool)

(assert (=> d!72339 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9733 thiss!1204) (currentByte!9738 thiss!1204) (size!4634 (buf!5166 thiss!1204))))))

(declare-fun bs!17737 () Bool)

(assert (= bs!17737 d!72339))

(assert (=> bs!17737 m!329221))

(assert (=> start!44684 d!72339))

(assert (=> b!213633 d!72225))

(assert (=> b!213633 d!72227))

(declare-fun b!213922 () Bool)

(declare-fun e!145663 () Bool)

(declare-fun lt!337922 () tuple2!18292)

(declare-fun lt!337921 () tuple2!18288)

(assert (=> b!213922 (= e!145663 (= (bitIndex!0 (size!4634 (buf!5166 (_1!9801 lt!337922))) (currentByte!9738 (_1!9801 lt!337922)) (currentBit!9733 (_1!9801 lt!337922))) (bitIndex!0 (size!4634 (buf!5166 (_2!9799 lt!337921))) (currentByte!9738 (_2!9799 lt!337921)) (currentBit!9733 (_2!9799 lt!337921)))))))

(declare-fun b!213921 () Bool)

(declare-fun e!145662 () Bool)

(assert (=> b!213921 (= e!145662 e!145663)))

(declare-fun res!179799 () Bool)

(assert (=> b!213921 (=> (not res!179799) (not e!145663))))

(assert (=> b!213921 (= res!179799 (and (= (_2!9801 lt!337922) lt!337242) (= (_1!9801 lt!337922) (_2!9799 lt!337921))))))

(assert (=> b!213921 (= lt!337922 (readBitPure!0 (readerFrom!0 (_2!9799 lt!337921) (currentBit!9733 thiss!1204) (currentByte!9738 thiss!1204))))))

(declare-fun d!72341 () Bool)

(assert (=> d!72341 e!145662))

(declare-fun res!179802 () Bool)

(assert (=> d!72341 (=> (not res!179802) (not e!145662))))

(assert (=> d!72341 (= res!179802 (= (size!4634 (buf!5166 thiss!1204)) (size!4634 (buf!5166 (_2!9799 lt!337921)))))))

(declare-fun choose!16 (BitStream!8376 Bool) tuple2!18288)

(assert (=> d!72341 (= lt!337921 (choose!16 thiss!1204 lt!337242))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!72341 (validate_offset_bit!0 ((_ sign_extend 32) (size!4634 (buf!5166 thiss!1204))) ((_ sign_extend 32) (currentByte!9738 thiss!1204)) ((_ sign_extend 32) (currentBit!9733 thiss!1204)))))

(assert (=> d!72341 (= (appendBit!0 thiss!1204 lt!337242) lt!337921)))

(declare-fun b!213919 () Bool)

(declare-fun res!179800 () Bool)

(assert (=> b!213919 (=> (not res!179800) (not e!145662))))

(declare-fun lt!337923 () (_ BitVec 64))

(declare-fun lt!337924 () (_ BitVec 64))

(assert (=> b!213919 (= res!179800 (= (bitIndex!0 (size!4634 (buf!5166 (_2!9799 lt!337921))) (currentByte!9738 (_2!9799 lt!337921)) (currentBit!9733 (_2!9799 lt!337921))) (bvadd lt!337923 lt!337924)))))

(assert (=> b!213919 (or (not (= (bvand lt!337923 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!337924 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!337923 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!337923 lt!337924) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213919 (= lt!337924 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!213919 (= lt!337923 (bitIndex!0 (size!4634 (buf!5166 thiss!1204)) (currentByte!9738 thiss!1204) (currentBit!9733 thiss!1204)))))

(declare-fun b!213920 () Bool)

(declare-fun res!179801 () Bool)

(assert (=> b!213920 (=> (not res!179801) (not e!145662))))

(assert (=> b!213920 (= res!179801 (isPrefixOf!0 thiss!1204 (_2!9799 lt!337921)))))

(assert (= (and d!72341 res!179802) b!213919))

(assert (= (and b!213919 res!179800) b!213920))

(assert (= (and b!213920 res!179801) b!213921))

(assert (= (and b!213921 res!179799) b!213922))

(declare-fun m!329743 () Bool)

(assert (=> b!213922 m!329743))

(declare-fun m!329745 () Bool)

(assert (=> b!213922 m!329745))

(declare-fun m!329747 () Bool)

(assert (=> b!213920 m!329747))

(assert (=> b!213919 m!329745))

(assert (=> b!213919 m!329233))

(declare-fun m!329749 () Bool)

(assert (=> b!213921 m!329749))

(assert (=> b!213921 m!329749))

(declare-fun m!329751 () Bool)

(assert (=> b!213921 m!329751))

(declare-fun m!329753 () Bool)

(assert (=> d!72341 m!329753))

(declare-fun m!329755 () Bool)

(assert (=> d!72341 m!329755))

(assert (=> b!213633 d!72341))

(declare-fun d!72343 () Bool)

(assert (=> d!72343 (= (array_inv!4375 (buf!5166 thiss!1204)) (bvsge (size!4634 (buf!5166 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!213644 d!72343))

(declare-fun d!72345 () Bool)

(declare-fun res!179803 () Bool)

(declare-fun e!145664 () Bool)

(assert (=> d!72345 (=> (not res!179803) (not e!145664))))

(assert (=> d!72345 (= res!179803 (= (size!4634 (buf!5166 thiss!1204)) (size!4634 (buf!5166 (_2!9799 lt!337263)))))))

(assert (=> d!72345 (= (isPrefixOf!0 thiss!1204 (_2!9799 lt!337263)) e!145664)))

(declare-fun b!213923 () Bool)

(declare-fun res!179805 () Bool)

(assert (=> b!213923 (=> (not res!179805) (not e!145664))))

(assert (=> b!213923 (= res!179805 (bvsle (bitIndex!0 (size!4634 (buf!5166 thiss!1204)) (currentByte!9738 thiss!1204) (currentBit!9733 thiss!1204)) (bitIndex!0 (size!4634 (buf!5166 (_2!9799 lt!337263))) (currentByte!9738 (_2!9799 lt!337263)) (currentBit!9733 (_2!9799 lt!337263)))))))

(declare-fun b!213924 () Bool)

(declare-fun e!145665 () Bool)

(assert (=> b!213924 (= e!145664 e!145665)))

(declare-fun res!179804 () Bool)

(assert (=> b!213924 (=> res!179804 e!145665)))

(assert (=> b!213924 (= res!179804 (= (size!4634 (buf!5166 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!213925 () Bool)

(assert (=> b!213925 (= e!145665 (arrayBitRangesEq!0 (buf!5166 thiss!1204) (buf!5166 (_2!9799 lt!337263)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4634 (buf!5166 thiss!1204)) (currentByte!9738 thiss!1204) (currentBit!9733 thiss!1204))))))

(assert (= (and d!72345 res!179803) b!213923))

(assert (= (and b!213923 res!179805) b!213924))

(assert (= (and b!213924 (not res!179804)) b!213925))

(assert (=> b!213923 m!329233))

(assert (=> b!213923 m!329231))

(assert (=> b!213925 m!329233))

(assert (=> b!213925 m!329233))

(declare-fun m!329757 () Bool)

(assert (=> b!213925 m!329757))

(assert (=> b!213642 d!72345))

(declare-fun d!72347 () Bool)

(declare-fun e!145666 () Bool)

(assert (=> d!72347 e!145666))

(declare-fun res!179807 () Bool)

(assert (=> d!72347 (=> (not res!179807) (not e!145666))))

(declare-fun lt!337929 () (_ BitVec 64))

(declare-fun lt!337925 () (_ BitVec 64))

(declare-fun lt!337930 () (_ BitVec 64))

(assert (=> d!72347 (= res!179807 (= lt!337930 (bvsub lt!337929 lt!337925)))))

(assert (=> d!72347 (or (= (bvand lt!337929 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!337925 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!337929 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337929 lt!337925) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72347 (= lt!337925 (remainingBits!0 ((_ sign_extend 32) (size!4634 (buf!5166 (_1!9800 lt!337254)))) ((_ sign_extend 32) (currentByte!9738 (_1!9800 lt!337254))) ((_ sign_extend 32) (currentBit!9733 (_1!9800 lt!337254)))))))

(declare-fun lt!337927 () (_ BitVec 64))

(declare-fun lt!337926 () (_ BitVec 64))

(assert (=> d!72347 (= lt!337929 (bvmul lt!337927 lt!337926))))

(assert (=> d!72347 (or (= lt!337927 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!337926 (bvsdiv (bvmul lt!337927 lt!337926) lt!337927)))))

(assert (=> d!72347 (= lt!337926 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72347 (= lt!337927 ((_ sign_extend 32) (size!4634 (buf!5166 (_1!9800 lt!337254)))))))

(assert (=> d!72347 (= lt!337930 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9738 (_1!9800 lt!337254))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9733 (_1!9800 lt!337254)))))))

(assert (=> d!72347 (invariant!0 (currentBit!9733 (_1!9800 lt!337254)) (currentByte!9738 (_1!9800 lt!337254)) (size!4634 (buf!5166 (_1!9800 lt!337254))))))

(assert (=> d!72347 (= (bitIndex!0 (size!4634 (buf!5166 (_1!9800 lt!337254))) (currentByte!9738 (_1!9800 lt!337254)) (currentBit!9733 (_1!9800 lt!337254))) lt!337930)))

(declare-fun b!213926 () Bool)

(declare-fun res!179806 () Bool)

(assert (=> b!213926 (=> (not res!179806) (not e!145666))))

(assert (=> b!213926 (= res!179806 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!337930))))

(declare-fun b!213927 () Bool)

(declare-fun lt!337928 () (_ BitVec 64))

(assert (=> b!213927 (= e!145666 (bvsle lt!337930 (bvmul lt!337928 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213927 (or (= lt!337928 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!337928 #b0000000000000000000000000000000000000000000000000000000000001000) lt!337928)))))

(assert (=> b!213927 (= lt!337928 ((_ sign_extend 32) (size!4634 (buf!5166 (_1!9800 lt!337254)))))))

(assert (= (and d!72347 res!179807) b!213926))

(assert (= (and b!213926 res!179806) b!213927))

(declare-fun m!329759 () Bool)

(assert (=> d!72347 m!329759))

(declare-fun m!329761 () Bool)

(assert (=> d!72347 m!329761))

(assert (=> b!213632 d!72347))

(declare-fun d!72349 () Bool)

(declare-fun e!145667 () Bool)

(assert (=> d!72349 e!145667))

(declare-fun res!179809 () Bool)

(assert (=> d!72349 (=> (not res!179809) (not e!145667))))

(declare-fun lt!337936 () (_ BitVec 64))

(declare-fun lt!337931 () (_ BitVec 64))

(declare-fun lt!337935 () (_ BitVec 64))

(assert (=> d!72349 (= res!179809 (= lt!337936 (bvsub lt!337935 lt!337931)))))

(assert (=> d!72349 (or (= (bvand lt!337935 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!337931 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!337935 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337935 lt!337931) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72349 (= lt!337931 (remainingBits!0 ((_ sign_extend 32) (size!4634 (buf!5166 (_2!9798 lt!337246)))) ((_ sign_extend 32) (currentByte!9738 (_2!9798 lt!337246))) ((_ sign_extend 32) (currentBit!9733 (_2!9798 lt!337246)))))))

(declare-fun lt!337933 () (_ BitVec 64))

(declare-fun lt!337932 () (_ BitVec 64))

(assert (=> d!72349 (= lt!337935 (bvmul lt!337933 lt!337932))))

(assert (=> d!72349 (or (= lt!337933 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!337932 (bvsdiv (bvmul lt!337933 lt!337932) lt!337933)))))

(assert (=> d!72349 (= lt!337932 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72349 (= lt!337933 ((_ sign_extend 32) (size!4634 (buf!5166 (_2!9798 lt!337246)))))))

(assert (=> d!72349 (= lt!337936 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9738 (_2!9798 lt!337246))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9733 (_2!9798 lt!337246)))))))

(assert (=> d!72349 (invariant!0 (currentBit!9733 (_2!9798 lt!337246)) (currentByte!9738 (_2!9798 lt!337246)) (size!4634 (buf!5166 (_2!9798 lt!337246))))))

(assert (=> d!72349 (= (bitIndex!0 (size!4634 (buf!5166 (_2!9798 lt!337246))) (currentByte!9738 (_2!9798 lt!337246)) (currentBit!9733 (_2!9798 lt!337246))) lt!337936)))

(declare-fun b!213928 () Bool)

(declare-fun res!179808 () Bool)

(assert (=> b!213928 (=> (not res!179808) (not e!145667))))

(assert (=> b!213928 (= res!179808 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!337936))))

(declare-fun b!213929 () Bool)

(declare-fun lt!337934 () (_ BitVec 64))

(assert (=> b!213929 (= e!145667 (bvsle lt!337936 (bvmul lt!337934 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213929 (or (= lt!337934 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!337934 #b0000000000000000000000000000000000000000000000000000000000001000) lt!337934)))))

(assert (=> b!213929 (= lt!337934 ((_ sign_extend 32) (size!4634 (buf!5166 (_2!9798 lt!337246)))))))

(assert (= (and d!72349 res!179809) b!213928))

(assert (= (and b!213928 res!179808) b!213929))

(declare-fun m!329763 () Bool)

(assert (=> d!72349 m!329763))

(declare-fun m!329765 () Bool)

(assert (=> d!72349 m!329765))

(assert (=> b!213632 d!72349))

(declare-fun d!72351 () Bool)

(declare-fun lt!337937 () tuple2!18302)

(assert (=> d!72351 (= lt!337937 (readBit!0 (readerFrom!0 (_2!9799 lt!337263) (currentBit!9733 thiss!1204) (currentByte!9738 thiss!1204))))))

(assert (=> d!72351 (= (readBitPure!0 (readerFrom!0 (_2!9799 lt!337263) (currentBit!9733 thiss!1204) (currentByte!9738 thiss!1204))) (tuple2!18293 (_2!9806 lt!337937) (_1!9806 lt!337937)))))

(declare-fun bs!17738 () Bool)

(assert (= bs!17738 d!72351))

(assert (=> bs!17738 m!329287))

(declare-fun m!329767 () Bool)

(assert (=> bs!17738 m!329767))

(assert (=> b!213643 d!72351))

(declare-fun d!72353 () Bool)

(declare-fun e!145670 () Bool)

(assert (=> d!72353 e!145670))

(declare-fun res!179813 () Bool)

(assert (=> d!72353 (=> (not res!179813) (not e!145670))))

(assert (=> d!72353 (= res!179813 (invariant!0 (currentBit!9733 (_2!9799 lt!337263)) (currentByte!9738 (_2!9799 lt!337263)) (size!4634 (buf!5166 (_2!9799 lt!337263)))))))

(assert (=> d!72353 (= (readerFrom!0 (_2!9799 lt!337263) (currentBit!9733 thiss!1204) (currentByte!9738 thiss!1204)) (BitStream!8377 (buf!5166 (_2!9799 lt!337263)) (currentByte!9738 thiss!1204) (currentBit!9733 thiss!1204)))))

(declare-fun b!213932 () Bool)

(assert (=> b!213932 (= e!145670 (invariant!0 (currentBit!9733 thiss!1204) (currentByte!9738 thiss!1204) (size!4634 (buf!5166 (_2!9799 lt!337263)))))))

(assert (= (and d!72353 res!179813) b!213932))

(assert (=> d!72353 m!329401))

(assert (=> b!213932 m!329269))

(assert (=> b!213643 d!72353))

(declare-fun d!72355 () Bool)

(declare-fun lt!337954 () tuple2!18290)

(declare-fun lt!337952 () tuple2!18290)

(assert (=> d!72355 (and (= (_2!9800 lt!337954) (_2!9800 lt!337952)) (= (_1!9800 lt!337954) (_1!9800 lt!337952)))))

(declare-fun lt!337951 () Bool)

(declare-fun lt!337955 () Unit!15213)

(declare-fun lt!337950 () (_ BitVec 64))

(declare-fun lt!337953 () BitStream!8376)

(declare-fun choose!56 (BitStream!8376 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!18290 tuple2!18290 BitStream!8376 (_ BitVec 64) Bool BitStream!8376 (_ BitVec 64) tuple2!18290 tuple2!18290 BitStream!8376 (_ BitVec 64)) Unit!15213)

(assert (=> d!72355 (= lt!337955 (choose!56 (_1!9798 lt!337246) nBits!348 i!590 lt!337247 lt!337954 (tuple2!18291 (_1!9800 lt!337954) (_2!9800 lt!337954)) (_1!9800 lt!337954) (_2!9800 lt!337954) lt!337951 lt!337953 lt!337950 lt!337952 (tuple2!18291 (_1!9800 lt!337952) (_2!9800 lt!337952)) (_1!9800 lt!337952) (_2!9800 lt!337952)))))

(assert (=> d!72355 (= lt!337952 (readNBitsLSBFirstsLoopPure!0 lt!337953 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!337950))))

(assert (=> d!72355 (= lt!337950 (bvor lt!337247 (ite lt!337951 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72355 (= lt!337953 (withMovedBitIndex!0 (_1!9798 lt!337246) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!72355 (= lt!337951 (_2!9801 (readBitPure!0 (_1!9798 lt!337246))))))

(assert (=> d!72355 (= lt!337954 (readNBitsLSBFirstsLoopPure!0 (_1!9798 lt!337246) nBits!348 i!590 lt!337247))))

(assert (=> d!72355 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9798 lt!337246) nBits!348 i!590 lt!337247) lt!337955)))

(declare-fun bs!17740 () Bool)

(assert (= bs!17740 d!72355))

(declare-fun m!329769 () Bool)

(assert (=> bs!17740 m!329769))

(assert (=> bs!17740 m!329253))

(assert (=> bs!17740 m!329277))

(assert (=> bs!17740 m!329263))

(declare-fun m!329771 () Bool)

(assert (=> bs!17740 m!329771))

(assert (=> b!213630 d!72355))

(declare-fun d!72357 () Bool)

(declare-fun lt!337956 () tuple2!18304)

(assert (=> d!72357 (= lt!337956 (readNBitsLSBFirstsLoop!0 lt!337268 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!337245))))

(assert (=> d!72357 (= (readNBitsLSBFirstsLoopPure!0 lt!337268 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!337245) (tuple2!18291 (_2!9807 lt!337956) (_1!9807 lt!337956)))))

(declare-fun bs!17741 () Bool)

(assert (= bs!17741 d!72357))

(declare-fun m!329773 () Bool)

(assert (=> bs!17741 m!329773))

(assert (=> b!213630 d!72357))

(declare-fun d!72359 () Bool)

(declare-fun e!145671 () Bool)

(assert (=> d!72359 e!145671))

(declare-fun res!179814 () Bool)

(assert (=> d!72359 (=> (not res!179814) (not e!145671))))

(declare-fun lt!337958 () (_ BitVec 64))

(declare-fun lt!337957 () BitStream!8376)

(assert (=> d!72359 (= res!179814 (= (bvadd lt!337958 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4634 (buf!5166 lt!337957)) (currentByte!9738 lt!337957) (currentBit!9733 lt!337957))))))

(assert (=> d!72359 (or (not (= (bvand lt!337958 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!337958 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!337958 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72359 (= lt!337958 (bitIndex!0 (size!4634 (buf!5166 (_1!9798 lt!337246))) (currentByte!9738 (_1!9798 lt!337246)) (currentBit!9733 (_1!9798 lt!337246))))))

(assert (=> d!72359 (= lt!337957 (_2!9799 (moveBitIndex!0 (_1!9798 lt!337246) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!72359 (moveBitIndexPrecond!0 (_1!9798 lt!337246) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!72359 (= (withMovedBitIndex!0 (_1!9798 lt!337246) #b0000000000000000000000000000000000000000000000000000000000000001) lt!337957)))

(declare-fun b!213933 () Bool)

(assert (=> b!213933 (= e!145671 (= (size!4634 (buf!5166 (_1!9798 lt!337246))) (size!4634 (buf!5166 lt!337957))))))

(assert (= (and d!72359 res!179814) b!213933))

(declare-fun m!329775 () Bool)

(assert (=> d!72359 m!329775))

(declare-fun m!329777 () Bool)

(assert (=> d!72359 m!329777))

(declare-fun m!329779 () Bool)

(assert (=> d!72359 m!329779))

(declare-fun m!329781 () Bool)

(assert (=> d!72359 m!329781))

(assert (=> b!213630 d!72359))

(declare-fun d!72361 () Bool)

(assert (=> d!72361 (= (invariant!0 (currentBit!9733 thiss!1204) (currentByte!9738 thiss!1204) (size!4634 (buf!5166 thiss!1204))) (and (bvsge (currentBit!9733 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9733 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9738 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9738 thiss!1204) (size!4634 (buf!5166 thiss!1204))) (and (= (currentBit!9733 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9738 thiss!1204) (size!4634 (buf!5166 thiss!1204)))))))))

(assert (=> b!213631 d!72361))

(declare-fun d!72363 () Bool)

(assert (=> d!72363 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4634 (buf!5166 thiss!1204))) ((_ sign_extend 32) (currentByte!9738 thiss!1204)) ((_ sign_extend 32) (currentBit!9733 thiss!1204)) lt!337266) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4634 (buf!5166 thiss!1204))) ((_ sign_extend 32) (currentByte!9738 thiss!1204)) ((_ sign_extend 32) (currentBit!9733 thiss!1204))) lt!337266))))

(declare-fun bs!17742 () Bool)

(assert (= bs!17742 d!72363))

(assert (=> bs!17742 m!329403))

(assert (=> b!213640 d!72363))

(assert (=> b!213638 d!72345))

(declare-fun d!72365 () Bool)

(assert (=> d!72365 (= (invariant!0 (currentBit!9733 (_2!9799 lt!337264)) (currentByte!9738 (_2!9799 lt!337264)) (size!4634 (buf!5166 (_2!9799 lt!337264)))) (and (bvsge (currentBit!9733 (_2!9799 lt!337264)) #b00000000000000000000000000000000) (bvslt (currentBit!9733 (_2!9799 lt!337264)) #b00000000000000000000000000001000) (bvsge (currentByte!9738 (_2!9799 lt!337264)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9738 (_2!9799 lt!337264)) (size!4634 (buf!5166 (_2!9799 lt!337264)))) (and (= (currentBit!9733 (_2!9799 lt!337264)) #b00000000000000000000000000000000) (= (currentByte!9738 (_2!9799 lt!337264)) (size!4634 (buf!5166 (_2!9799 lt!337264))))))))))

(assert (=> b!213628 d!72365))

(check-sat (not b!213733) (not d!72245) (not d!72255) (not d!72261) (not d!72227) (not d!72215) (not b!213731) (not b!213932) (not d!72339) (not b!213759) (not b!213921) (not d!72243) (not b!213896) (not b!213923) (not b!213761) (not d!72351) (not b!213762) (not b!213907) (not d!72251) (not d!72355) (not b!213758) (not b!213906) (not d!72265) (not d!72229) (not b!213756) (not d!72253) (not d!72359) (not b!213920) (not d!72247) (not b!213909) (not d!72357) (not b!213757) (not d!72231) (not b!213903) (not b!213763) (not d!72237) (not b!213764) (not d!72257) (not b!213908) (not b!213925) (not d!72223) (not b!213895) (not bm!3351) (not d!72349) (not b!213901) (not d!72267) (not d!72219) (not d!72363) (not d!72259) (not b!213775) (not d!72353) (not d!72233) (not d!72347) (not d!72241) (not b!213919) (not b!213773) (not b!213905) (not d!72239) (not d!72341) (not b!213922) (not b!213900) (not d!72225))
