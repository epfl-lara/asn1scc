; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44432 () Bool)

(assert start!44432)

(declare-fun b!211685 () Bool)

(declare-fun e!144329 () Bool)

(declare-fun lt!333422 () (_ BitVec 64))

(declare-fun lt!333414 () (_ BitVec 64))

(assert (=> b!211685 (= e!144329 (or (= lt!333422 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!333422 (bvand (bvsub lt!333414 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!211685 (= lt!333422 (bvand lt!333414 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!144327 () Bool)

(assert (=> b!211685 e!144327))

(declare-fun res!177778 () Bool)

(assert (=> b!211685 (=> (not res!177778) (not e!144327))))

(declare-datatypes ((array!10510 0))(
  ( (array!10511 (arr!5546 (Array (_ BitVec 32) (_ BitVec 8))) (size!4616 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8340 0))(
  ( (BitStream!8341 (buf!5142 array!10510) (currentByte!9702 (_ BitVec 32)) (currentBit!9697 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!18118 0))(
  ( (tuple2!18119 (_1!9714 BitStream!8340) (_2!9714 (_ BitVec 64))) )
))
(declare-fun lt!333435 () tuple2!18118)

(declare-fun lt!333437 () tuple2!18118)

(assert (=> b!211685 (= res!177778 (and (= (_2!9714 lt!333435) (_2!9714 lt!333437)) (= (_1!9714 lt!333435) (_1!9714 lt!333437))))))

(declare-fun lt!333415 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((Unit!15099 0))(
  ( (Unit!15100) )
))
(declare-fun lt!333417 () Unit!15099)

(declare-datatypes ((tuple2!18120 0))(
  ( (tuple2!18121 (_1!9715 BitStream!8340) (_2!9715 BitStream!8340)) )
))
(declare-fun lt!333413 () tuple2!18120)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8340 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15099)

(assert (=> b!211685 (= lt!333417 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9715 lt!333413) nBits!348 i!590 lt!333415))))

(declare-fun lt!333420 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8340 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18118)

(declare-fun withMovedBitIndex!0 (BitStream!8340 (_ BitVec 64)) BitStream!8340)

(assert (=> b!211685 (= lt!333437 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9715 lt!333413) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!333420))))

(declare-fun b!211686 () Bool)

(declare-fun e!144322 () Bool)

(declare-fun e!144326 () Bool)

(assert (=> b!211686 (= e!144322 e!144326)))

(declare-fun res!177774 () Bool)

(assert (=> b!211686 (=> (not res!177774) (not e!144326))))

(declare-datatypes ((tuple2!18122 0))(
  ( (tuple2!18123 (_1!9716 BitStream!8340) (_2!9716 Bool)) )
))
(declare-fun lt!333433 () tuple2!18122)

(declare-fun lt!333426 () Bool)

(declare-datatypes ((tuple2!18124 0))(
  ( (tuple2!18125 (_1!9717 Unit!15099) (_2!9717 BitStream!8340)) )
))
(declare-fun lt!333423 () tuple2!18124)

(assert (=> b!211686 (= res!177774 (and (= (_2!9716 lt!333433) lt!333426) (= (_1!9716 lt!333433) (_2!9717 lt!333423))))))

(declare-fun thiss!1204 () BitStream!8340)

(declare-fun readBitPure!0 (BitStream!8340) tuple2!18122)

(declare-fun readerFrom!0 (BitStream!8340 (_ BitVec 32) (_ BitVec 32)) BitStream!8340)

(assert (=> b!211686 (= lt!333433 (readBitPure!0 (readerFrom!0 (_2!9717 lt!333423) (currentBit!9697 thiss!1204) (currentByte!9702 thiss!1204))))))

(declare-fun b!211687 () Bool)

(declare-fun e!144319 () Bool)

(declare-fun e!144324 () Bool)

(assert (=> b!211687 (= e!144319 e!144324)))

(declare-fun res!177784 () Bool)

(assert (=> b!211687 (=> (not res!177784) (not e!144324))))

(declare-fun lt!333436 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!211687 (= res!177784 (validate_offset_bits!1 ((_ sign_extend 32) (size!4616 (buf!5142 thiss!1204))) ((_ sign_extend 32) (currentByte!9702 thiss!1204)) ((_ sign_extend 32) (currentBit!9697 thiss!1204)) lt!333436))))

(assert (=> b!211687 (= lt!333436 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!211688 () Bool)

(declare-fun e!144325 () Bool)

(declare-fun lt!333430 () tuple2!18124)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!211688 (= e!144325 (invariant!0 (currentBit!9697 thiss!1204) (currentByte!9702 thiss!1204) (size!4616 (buf!5142 (_2!9717 lt!333430)))))))

(declare-fun b!211689 () Bool)

(declare-fun e!144318 () Bool)

(assert (=> b!211689 (= e!144318 e!144329)))

(declare-fun res!177779 () Bool)

(assert (=> b!211689 (=> res!177779 e!144329)))

(declare-fun lt!333439 () tuple2!18120)

(assert (=> b!211689 (= res!177779 (not (= (_1!9714 (readNBitsLSBFirstsLoopPure!0 (_1!9715 lt!333439) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!333420)) (_2!9715 lt!333439))))))

(declare-fun lt!333419 () (_ BitVec 64))

(assert (=> b!211689 (validate_offset_bits!1 ((_ sign_extend 32) (size!4616 (buf!5142 (_2!9717 lt!333430)))) ((_ sign_extend 32) (currentByte!9702 (_2!9717 lt!333423))) ((_ sign_extend 32) (currentBit!9697 (_2!9717 lt!333423))) lt!333419)))

(declare-fun lt!333428 () Unit!15099)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8340 array!10510 (_ BitVec 64)) Unit!15099)

(assert (=> b!211689 (= lt!333428 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9717 lt!333423) (buf!5142 (_2!9717 lt!333430)) lt!333419))))

(assert (=> b!211689 (= lt!333419 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!333418 () (_ BitVec 64))

(declare-fun lt!333440 () tuple2!18122)

(assert (=> b!211689 (= lt!333420 (bvor lt!333415 (ite (_2!9716 lt!333440) lt!333418 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211689 (= lt!333435 (readNBitsLSBFirstsLoopPure!0 (_1!9715 lt!333413) nBits!348 i!590 lt!333415))))

(assert (=> b!211689 (validate_offset_bits!1 ((_ sign_extend 32) (size!4616 (buf!5142 (_2!9717 lt!333430)))) ((_ sign_extend 32) (currentByte!9702 thiss!1204)) ((_ sign_extend 32) (currentBit!9697 thiss!1204)) lt!333436)))

(declare-fun lt!333421 () Unit!15099)

(assert (=> b!211689 (= lt!333421 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5142 (_2!9717 lt!333430)) lt!333436))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!211689 (= lt!333415 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!211689 (= (_2!9716 lt!333440) lt!333426)))

(assert (=> b!211689 (= lt!333440 (readBitPure!0 (_1!9715 lt!333413)))))

(declare-fun reader!0 (BitStream!8340 BitStream!8340) tuple2!18120)

(assert (=> b!211689 (= lt!333439 (reader!0 (_2!9717 lt!333423) (_2!9717 lt!333430)))))

(assert (=> b!211689 (= lt!333413 (reader!0 thiss!1204 (_2!9717 lt!333430)))))

(declare-fun e!144321 () Bool)

(assert (=> b!211689 e!144321))

(declare-fun res!177791 () Bool)

(assert (=> b!211689 (=> (not res!177791) (not e!144321))))

(declare-fun lt!333431 () tuple2!18122)

(declare-fun lt!333416 () tuple2!18122)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!211689 (= res!177791 (= (bitIndex!0 (size!4616 (buf!5142 (_1!9716 lt!333431))) (currentByte!9702 (_1!9716 lt!333431)) (currentBit!9697 (_1!9716 lt!333431))) (bitIndex!0 (size!4616 (buf!5142 (_1!9716 lt!333416))) (currentByte!9702 (_1!9716 lt!333416)) (currentBit!9697 (_1!9716 lt!333416)))))))

(declare-fun lt!333432 () Unit!15099)

(declare-fun lt!333438 () BitStream!8340)

(declare-fun readBitPrefixLemma!0 (BitStream!8340 BitStream!8340) Unit!15099)

(assert (=> b!211689 (= lt!333432 (readBitPrefixLemma!0 lt!333438 (_2!9717 lt!333430)))))

(assert (=> b!211689 (= lt!333416 (readBitPure!0 (BitStream!8341 (buf!5142 (_2!9717 lt!333430)) (currentByte!9702 thiss!1204) (currentBit!9697 thiss!1204))))))

(assert (=> b!211689 (= lt!333431 (readBitPure!0 lt!333438))))

(assert (=> b!211689 e!144325))

(declare-fun res!177781 () Bool)

(assert (=> b!211689 (=> (not res!177781) (not e!144325))))

(assert (=> b!211689 (= res!177781 (invariant!0 (currentBit!9697 thiss!1204) (currentByte!9702 thiss!1204) (size!4616 (buf!5142 (_2!9717 lt!333423)))))))

(assert (=> b!211689 (= lt!333438 (BitStream!8341 (buf!5142 (_2!9717 lt!333423)) (currentByte!9702 thiss!1204) (currentBit!9697 thiss!1204)))))

(declare-fun b!211690 () Bool)

(declare-fun res!177775 () Bool)

(assert (=> b!211690 (=> res!177775 e!144318)))

(declare-fun isPrefixOf!0 (BitStream!8340 BitStream!8340) Bool)

(assert (=> b!211690 (= res!177775 (not (isPrefixOf!0 thiss!1204 (_2!9717 lt!333423))))))

(declare-fun b!211691 () Bool)

(declare-fun res!177785 () Bool)

(assert (=> b!211691 (=> res!177785 e!144318)))

(assert (=> b!211691 (= res!177785 (not (isPrefixOf!0 (_2!9717 lt!333423) (_2!9717 lt!333430))))))

(declare-fun b!211692 () Bool)

(declare-fun e!144320 () Bool)

(assert (=> b!211692 (= e!144324 (not e!144320))))

(declare-fun res!177789 () Bool)

(assert (=> b!211692 (=> res!177789 e!144320)))

(declare-fun lt!333427 () (_ BitVec 64))

(assert (=> b!211692 (= res!177789 (not (= lt!333414 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!333427))))))

(assert (=> b!211692 (= lt!333414 (bitIndex!0 (size!4616 (buf!5142 (_2!9717 lt!333423))) (currentByte!9702 (_2!9717 lt!333423)) (currentBit!9697 (_2!9717 lt!333423))))))

(assert (=> b!211692 (= lt!333427 (bitIndex!0 (size!4616 (buf!5142 thiss!1204)) (currentByte!9702 thiss!1204) (currentBit!9697 thiss!1204)))))

(declare-fun e!144328 () Bool)

(assert (=> b!211692 e!144328))

(declare-fun res!177773 () Bool)

(assert (=> b!211692 (=> (not res!177773) (not e!144328))))

(assert (=> b!211692 (= res!177773 (= (size!4616 (buf!5142 thiss!1204)) (size!4616 (buf!5142 (_2!9717 lt!333423)))))))

(declare-fun appendBit!0 (BitStream!8340 Bool) tuple2!18124)

(assert (=> b!211692 (= lt!333423 (appendBit!0 thiss!1204 lt!333426))))

(assert (=> b!211692 (= lt!333426 (not (= (bvand v!189 lt!333418) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211692 (= lt!333418 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!211693 () Bool)

(assert (=> b!211693 (= e!144320 e!144318)))

(declare-fun res!177786 () Bool)

(assert (=> b!211693 (=> res!177786 e!144318)))

(declare-fun lt!333425 () (_ BitVec 64))

(assert (=> b!211693 (= res!177786 (not (= lt!333425 (bvsub (bvsub (bvadd lt!333414 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!211693 (= lt!333425 (bitIndex!0 (size!4616 (buf!5142 (_2!9717 lt!333430))) (currentByte!9702 (_2!9717 lt!333430)) (currentBit!9697 (_2!9717 lt!333430))))))

(assert (=> b!211693 (isPrefixOf!0 thiss!1204 (_2!9717 lt!333430))))

(declare-fun lt!333424 () Unit!15099)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8340 BitStream!8340 BitStream!8340) Unit!15099)

(assert (=> b!211693 (= lt!333424 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9717 lt!333423) (_2!9717 lt!333430)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8340 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18124)

(assert (=> b!211693 (= lt!333430 (appendBitsLSBFirstLoopTR!0 (_2!9717 lt!333423) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!211694 () Bool)

(assert (=> b!211694 (= e!144328 e!144322)))

(declare-fun res!177787 () Bool)

(assert (=> b!211694 (=> (not res!177787) (not e!144322))))

(declare-fun lt!333429 () (_ BitVec 64))

(declare-fun lt!333434 () (_ BitVec 64))

(assert (=> b!211694 (= res!177787 (= lt!333429 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!333434)))))

(assert (=> b!211694 (= lt!333429 (bitIndex!0 (size!4616 (buf!5142 (_2!9717 lt!333423))) (currentByte!9702 (_2!9717 lt!333423)) (currentBit!9697 (_2!9717 lt!333423))))))

(assert (=> b!211694 (= lt!333434 (bitIndex!0 (size!4616 (buf!5142 thiss!1204)) (currentByte!9702 thiss!1204) (currentBit!9697 thiss!1204)))))

(declare-fun b!211695 () Bool)

(assert (=> b!211695 (= e!144321 (= (_2!9716 lt!333431) (_2!9716 lt!333416)))))

(declare-fun res!177776 () Bool)

(assert (=> start!44432 (=> (not res!177776) (not e!144319))))

(assert (=> start!44432 (= res!177776 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44432 e!144319))

(assert (=> start!44432 true))

(declare-fun e!144330 () Bool)

(declare-fun inv!12 (BitStream!8340) Bool)

(assert (=> start!44432 (and (inv!12 thiss!1204) e!144330)))

(declare-fun b!211696 () Bool)

(declare-fun res!177782 () Bool)

(assert (=> b!211696 (=> (not res!177782) (not e!144322))))

(assert (=> b!211696 (= res!177782 (isPrefixOf!0 thiss!1204 (_2!9717 lt!333423)))))

(declare-fun b!211697 () Bool)

(declare-fun res!177780 () Bool)

(assert (=> b!211697 (=> res!177780 e!144318)))

(assert (=> b!211697 (= res!177780 (or (not (= (size!4616 (buf!5142 (_2!9717 lt!333430))) (size!4616 (buf!5142 thiss!1204)))) (not (= lt!333425 (bvsub (bvadd lt!333427 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!211698 () Bool)

(declare-fun res!177777 () Bool)

(assert (=> b!211698 (=> res!177777 e!144318)))

(assert (=> b!211698 (= res!177777 (not (invariant!0 (currentBit!9697 (_2!9717 lt!333430)) (currentByte!9702 (_2!9717 lt!333430)) (size!4616 (buf!5142 (_2!9717 lt!333430))))))))

(declare-fun b!211699 () Bool)

(declare-fun array_inv!4357 (array!10510) Bool)

(assert (=> b!211699 (= e!144330 (array_inv!4357 (buf!5142 thiss!1204)))))

(declare-fun b!211700 () Bool)

(declare-fun res!177790 () Bool)

(assert (=> b!211700 (=> (not res!177790) (not e!144327))))

(assert (=> b!211700 (= res!177790 (= (_1!9715 lt!333413) (withMovedBitIndex!0 (_2!9715 lt!333413) (bvsub lt!333427 lt!333425))))))

(declare-fun b!211701 () Bool)

(declare-fun res!177788 () Bool)

(assert (=> b!211701 (=> (not res!177788) (not e!144324))))

(assert (=> b!211701 (= res!177788 (invariant!0 (currentBit!9697 thiss!1204) (currentByte!9702 thiss!1204) (size!4616 (buf!5142 thiss!1204))))))

(declare-fun b!211702 () Bool)

(declare-fun res!177783 () Bool)

(assert (=> b!211702 (=> (not res!177783) (not e!144324))))

(assert (=> b!211702 (= res!177783 (not (= i!590 nBits!348)))))

(declare-fun b!211703 () Bool)

(assert (=> b!211703 (= e!144327 (= (_1!9715 lt!333439) (withMovedBitIndex!0 (_2!9715 lt!333439) (bvsub lt!333414 lt!333425))))))

(declare-fun b!211704 () Bool)

(assert (=> b!211704 (= e!144326 (= (bitIndex!0 (size!4616 (buf!5142 (_1!9716 lt!333433))) (currentByte!9702 (_1!9716 lt!333433)) (currentBit!9697 (_1!9716 lt!333433))) lt!333429))))

(assert (= (and start!44432 res!177776) b!211687))

(assert (= (and b!211687 res!177784) b!211701))

(assert (= (and b!211701 res!177788) b!211702))

(assert (= (and b!211702 res!177783) b!211692))

(assert (= (and b!211692 res!177773) b!211694))

(assert (= (and b!211694 res!177787) b!211696))

(assert (= (and b!211696 res!177782) b!211686))

(assert (= (and b!211686 res!177774) b!211704))

(assert (= (and b!211692 (not res!177789)) b!211693))

(assert (= (and b!211693 (not res!177786)) b!211698))

(assert (= (and b!211698 (not res!177777)) b!211697))

(assert (= (and b!211697 (not res!177780)) b!211691))

(assert (= (and b!211691 (not res!177785)) b!211690))

(assert (= (and b!211690 (not res!177775)) b!211689))

(assert (= (and b!211689 res!177781) b!211688))

(assert (= (and b!211689 res!177791) b!211695))

(assert (= (and b!211689 (not res!177779)) b!211685))

(assert (= (and b!211685 res!177778) b!211700))

(assert (= (and b!211700 res!177790) b!211703))

(assert (= start!44432 b!211699))

(declare-fun m!326253 () Bool)

(assert (=> b!211688 m!326253))

(declare-fun m!326255 () Bool)

(assert (=> b!211689 m!326255))

(declare-fun m!326257 () Bool)

(assert (=> b!211689 m!326257))

(declare-fun m!326259 () Bool)

(assert (=> b!211689 m!326259))

(declare-fun m!326261 () Bool)

(assert (=> b!211689 m!326261))

(declare-fun m!326263 () Bool)

(assert (=> b!211689 m!326263))

(declare-fun m!326265 () Bool)

(assert (=> b!211689 m!326265))

(declare-fun m!326267 () Bool)

(assert (=> b!211689 m!326267))

(declare-fun m!326269 () Bool)

(assert (=> b!211689 m!326269))

(declare-fun m!326271 () Bool)

(assert (=> b!211689 m!326271))

(declare-fun m!326273 () Bool)

(assert (=> b!211689 m!326273))

(declare-fun m!326275 () Bool)

(assert (=> b!211689 m!326275))

(declare-fun m!326277 () Bool)

(assert (=> b!211689 m!326277))

(declare-fun m!326279 () Bool)

(assert (=> b!211689 m!326279))

(declare-fun m!326281 () Bool)

(assert (=> b!211689 m!326281))

(declare-fun m!326283 () Bool)

(assert (=> b!211689 m!326283))

(declare-fun m!326285 () Bool)

(assert (=> b!211689 m!326285))

(declare-fun m!326287 () Bool)

(assert (=> b!211687 m!326287))

(declare-fun m!326289 () Bool)

(assert (=> b!211685 m!326289))

(declare-fun m!326291 () Bool)

(assert (=> b!211685 m!326291))

(assert (=> b!211685 m!326291))

(declare-fun m!326293 () Bool)

(assert (=> b!211685 m!326293))

(declare-fun m!326295 () Bool)

(assert (=> start!44432 m!326295))

(declare-fun m!326297 () Bool)

(assert (=> b!211704 m!326297))

(declare-fun m!326299 () Bool)

(assert (=> b!211699 m!326299))

(declare-fun m!326301 () Bool)

(assert (=> b!211693 m!326301))

(declare-fun m!326303 () Bool)

(assert (=> b!211693 m!326303))

(declare-fun m!326305 () Bool)

(assert (=> b!211693 m!326305))

(declare-fun m!326307 () Bool)

(assert (=> b!211693 m!326307))

(declare-fun m!326309 () Bool)

(assert (=> b!211686 m!326309))

(assert (=> b!211686 m!326309))

(declare-fun m!326311 () Bool)

(assert (=> b!211686 m!326311))

(declare-fun m!326313 () Bool)

(assert (=> b!211691 m!326313))

(declare-fun m!326315 () Bool)

(assert (=> b!211696 m!326315))

(declare-fun m!326317 () Bool)

(assert (=> b!211694 m!326317))

(declare-fun m!326319 () Bool)

(assert (=> b!211694 m!326319))

(declare-fun m!326321 () Bool)

(assert (=> b!211701 m!326321))

(assert (=> b!211692 m!326317))

(assert (=> b!211692 m!326319))

(declare-fun m!326323 () Bool)

(assert (=> b!211692 m!326323))

(declare-fun m!326325 () Bool)

(assert (=> b!211700 m!326325))

(declare-fun m!326327 () Bool)

(assert (=> b!211698 m!326327))

(declare-fun m!326329 () Bool)

(assert (=> b!211703 m!326329))

(assert (=> b!211690 m!326315))

(check-sat (not b!211699) (not b!211688) (not b!211687) (not b!211698) (not b!211694) (not b!211700) (not b!211685) (not b!211691) (not b!211690) (not b!211704) (not b!211703) (not b!211692) (not b!211696) (not start!44432) (not b!211686) (not b!211701) (not b!211689) (not b!211693))
(check-sat)
(get-model)

(declare-fun d!71845 () Bool)

(assert (=> d!71845 (= (invariant!0 (currentBit!9697 (_2!9717 lt!333430)) (currentByte!9702 (_2!9717 lt!333430)) (size!4616 (buf!5142 (_2!9717 lt!333430)))) (and (bvsge (currentBit!9697 (_2!9717 lt!333430)) #b00000000000000000000000000000000) (bvslt (currentBit!9697 (_2!9717 lt!333430)) #b00000000000000000000000000001000) (bvsge (currentByte!9702 (_2!9717 lt!333430)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9702 (_2!9717 lt!333430)) (size!4616 (buf!5142 (_2!9717 lt!333430)))) (and (= (currentBit!9697 (_2!9717 lt!333430)) #b00000000000000000000000000000000) (= (currentByte!9702 (_2!9717 lt!333430)) (size!4616 (buf!5142 (_2!9717 lt!333430))))))))))

(assert (=> b!211698 d!71845))

(declare-fun d!71847 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!71847 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4616 (buf!5142 thiss!1204))) ((_ sign_extend 32) (currentByte!9702 thiss!1204)) ((_ sign_extend 32) (currentBit!9697 thiss!1204)) lt!333436) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4616 (buf!5142 thiss!1204))) ((_ sign_extend 32) (currentByte!9702 thiss!1204)) ((_ sign_extend 32) (currentBit!9697 thiss!1204))) lt!333436))))

(declare-fun bs!17624 () Bool)

(assert (= bs!17624 d!71847))

(declare-fun m!326801 () Bool)

(assert (=> bs!17624 m!326801))

(assert (=> b!211687 d!71847))

(declare-fun d!71849 () Bool)

(assert (=> d!71849 (= (invariant!0 (currentBit!9697 thiss!1204) (currentByte!9702 thiss!1204) (size!4616 (buf!5142 (_2!9717 lt!333430)))) (and (bvsge (currentBit!9697 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9697 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9702 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9702 thiss!1204) (size!4616 (buf!5142 (_2!9717 lt!333430)))) (and (= (currentBit!9697 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9702 thiss!1204) (size!4616 (buf!5142 (_2!9717 lt!333430))))))))))

(assert (=> b!211688 d!71849))

(declare-fun d!71851 () Bool)

(assert (=> d!71851 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9697 thiss!1204) (currentByte!9702 thiss!1204) (size!4616 (buf!5142 thiss!1204))))))

(declare-fun bs!17625 () Bool)

(assert (= bs!17625 d!71851))

(assert (=> bs!17625 m!326321))

(assert (=> start!44432 d!71851))

(declare-fun d!71853 () Bool)

(assert (=> d!71853 (= (array_inv!4357 (buf!5142 thiss!1204)) (bvsge (size!4616 (buf!5142 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!211699 d!71853))

(declare-fun d!71855 () Bool)

(declare-fun e!144496 () Bool)

(assert (=> d!71855 e!144496))

(declare-fun res!178034 () Bool)

(assert (=> d!71855 (=> (not res!178034) (not e!144496))))

(declare-fun lt!334139 () BitStream!8340)

(declare-fun lt!334140 () (_ BitVec 64))

(assert (=> d!71855 (= res!178034 (= (bvadd lt!334140 (bvsub lt!333427 lt!333425)) (bitIndex!0 (size!4616 (buf!5142 lt!334139)) (currentByte!9702 lt!334139) (currentBit!9697 lt!334139))))))

(assert (=> d!71855 (or (not (= (bvand lt!334140 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!333427 lt!333425) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!334140 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!334140 (bvsub lt!333427 lt!333425)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71855 (= lt!334140 (bitIndex!0 (size!4616 (buf!5142 (_2!9715 lt!333413))) (currentByte!9702 (_2!9715 lt!333413)) (currentBit!9697 (_2!9715 lt!333413))))))

(declare-fun moveBitIndex!0 (BitStream!8340 (_ BitVec 64)) tuple2!18124)

(assert (=> d!71855 (= lt!334139 (_2!9717 (moveBitIndex!0 (_2!9715 lt!333413) (bvsub lt!333427 lt!333425))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8340 (_ BitVec 64)) Bool)

(assert (=> d!71855 (moveBitIndexPrecond!0 (_2!9715 lt!333413) (bvsub lt!333427 lt!333425))))

(assert (=> d!71855 (= (withMovedBitIndex!0 (_2!9715 lt!333413) (bvsub lt!333427 lt!333425)) lt!334139)))

(declare-fun b!211982 () Bool)

(assert (=> b!211982 (= e!144496 (= (size!4616 (buf!5142 (_2!9715 lt!333413))) (size!4616 (buf!5142 lt!334139))))))

(assert (= (and d!71855 res!178034) b!211982))

(declare-fun m!326803 () Bool)

(assert (=> d!71855 m!326803))

(declare-fun m!326805 () Bool)

(assert (=> d!71855 m!326805))

(declare-fun m!326807 () Bool)

(assert (=> d!71855 m!326807))

(declare-fun m!326809 () Bool)

(assert (=> d!71855 m!326809))

(assert (=> b!211700 d!71855))

(declare-fun d!71857 () Bool)

(assert (=> d!71857 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4616 (buf!5142 (_2!9717 lt!333430)))) ((_ sign_extend 32) (currentByte!9702 thiss!1204)) ((_ sign_extend 32) (currentBit!9697 thiss!1204)) lt!333436) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4616 (buf!5142 (_2!9717 lt!333430)))) ((_ sign_extend 32) (currentByte!9702 thiss!1204)) ((_ sign_extend 32) (currentBit!9697 thiss!1204))) lt!333436))))

(declare-fun bs!17626 () Bool)

(assert (= bs!17626 d!71857))

(declare-fun m!326811 () Bool)

(assert (=> bs!17626 m!326811))

(assert (=> b!211689 d!71857))

(declare-fun d!71859 () Bool)

(declare-datatypes ((tuple2!18142 0))(
  ( (tuple2!18143 (_1!9726 (_ BitVec 64)) (_2!9726 BitStream!8340)) )
))
(declare-fun lt!334143 () tuple2!18142)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8340 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18142)

(assert (=> d!71859 (= lt!334143 (readNBitsLSBFirstsLoop!0 (_1!9715 lt!333439) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!333420))))

(assert (=> d!71859 (= (readNBitsLSBFirstsLoopPure!0 (_1!9715 lt!333439) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!333420) (tuple2!18119 (_2!9726 lt!334143) (_1!9726 lt!334143)))))

(declare-fun bs!17627 () Bool)

(assert (= bs!17627 d!71859))

(declare-fun m!326813 () Bool)

(assert (=> bs!17627 m!326813))

(assert (=> b!211689 d!71859))

(declare-fun d!71861 () Bool)

(assert (=> d!71861 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!211689 d!71861))

(declare-fun d!71863 () Bool)

(assert (=> d!71863 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4616 (buf!5142 (_2!9717 lt!333430)))) ((_ sign_extend 32) (currentByte!9702 (_2!9717 lt!333423))) ((_ sign_extend 32) (currentBit!9697 (_2!9717 lt!333423))) lt!333419) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4616 (buf!5142 (_2!9717 lt!333430)))) ((_ sign_extend 32) (currentByte!9702 (_2!9717 lt!333423))) ((_ sign_extend 32) (currentBit!9697 (_2!9717 lt!333423)))) lt!333419))))

(declare-fun bs!17628 () Bool)

(assert (= bs!17628 d!71863))

(declare-fun m!326815 () Bool)

(assert (=> bs!17628 m!326815))

(assert (=> b!211689 d!71863))

(declare-fun d!71865 () Bool)

(declare-datatypes ((tuple2!18144 0))(
  ( (tuple2!18145 (_1!9727 Bool) (_2!9727 BitStream!8340)) )
))
(declare-fun lt!334146 () tuple2!18144)

(declare-fun readBit!0 (BitStream!8340) tuple2!18144)

(assert (=> d!71865 (= lt!334146 (readBit!0 (_1!9715 lt!333413)))))

(assert (=> d!71865 (= (readBitPure!0 (_1!9715 lt!333413)) (tuple2!18123 (_2!9727 lt!334146) (_1!9727 lt!334146)))))

(declare-fun bs!17629 () Bool)

(assert (= bs!17629 d!71865))

(declare-fun m!326817 () Bool)

(assert (=> bs!17629 m!326817))

(assert (=> b!211689 d!71865))

(declare-fun d!71867 () Bool)

(assert (=> d!71867 (validate_offset_bits!1 ((_ sign_extend 32) (size!4616 (buf!5142 (_2!9717 lt!333430)))) ((_ sign_extend 32) (currentByte!9702 thiss!1204)) ((_ sign_extend 32) (currentBit!9697 thiss!1204)) lt!333436)))

(declare-fun lt!334149 () Unit!15099)

(declare-fun choose!9 (BitStream!8340 array!10510 (_ BitVec 64) BitStream!8340) Unit!15099)

(assert (=> d!71867 (= lt!334149 (choose!9 thiss!1204 (buf!5142 (_2!9717 lt!333430)) lt!333436 (BitStream!8341 (buf!5142 (_2!9717 lt!333430)) (currentByte!9702 thiss!1204) (currentBit!9697 thiss!1204))))))

(assert (=> d!71867 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5142 (_2!9717 lt!333430)) lt!333436) lt!334149)))

(declare-fun bs!17630 () Bool)

(assert (= bs!17630 d!71867))

(assert (=> bs!17630 m!326281))

(declare-fun m!326819 () Bool)

(assert (=> bs!17630 m!326819))

(assert (=> b!211689 d!71867))

(declare-fun b!212024 () Bool)

(declare-fun e!144518 () Unit!15099)

(declare-fun Unit!15129 () Unit!15099)

(assert (=> b!212024 (= e!144518 Unit!15129)))

(declare-fun b!212025 () Bool)

(declare-fun res!178066 () Bool)

(declare-fun e!144517 () Bool)

(assert (=> b!212025 (=> (not res!178066) (not e!144517))))

(declare-fun lt!334331 () tuple2!18120)

(assert (=> b!212025 (= res!178066 (isPrefixOf!0 (_2!9715 lt!334331) (_2!9717 lt!333430)))))

(declare-fun lt!334326 () (_ BitVec 64))

(declare-fun lt!334330 () (_ BitVec 64))

(declare-fun b!212026 () Bool)

(assert (=> b!212026 (= e!144517 (= (_1!9715 lt!334331) (withMovedBitIndex!0 (_2!9715 lt!334331) (bvsub lt!334326 lt!334330))))))

(assert (=> b!212026 (or (= (bvand lt!334326 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!334330 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!334326 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!334326 lt!334330) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212026 (= lt!334330 (bitIndex!0 (size!4616 (buf!5142 (_2!9717 lt!333430))) (currentByte!9702 (_2!9717 lt!333430)) (currentBit!9697 (_2!9717 lt!333430))))))

(assert (=> b!212026 (= lt!334326 (bitIndex!0 (size!4616 (buf!5142 thiss!1204)) (currentByte!9702 thiss!1204) (currentBit!9697 thiss!1204)))))

(declare-fun d!71869 () Bool)

(assert (=> d!71869 e!144517))

(declare-fun res!178064 () Bool)

(assert (=> d!71869 (=> (not res!178064) (not e!144517))))

(assert (=> d!71869 (= res!178064 (isPrefixOf!0 (_1!9715 lt!334331) (_2!9715 lt!334331)))))

(declare-fun lt!334319 () BitStream!8340)

(assert (=> d!71869 (= lt!334331 (tuple2!18121 lt!334319 (_2!9717 lt!333430)))))

(declare-fun lt!334329 () Unit!15099)

(declare-fun lt!334312 () Unit!15099)

(assert (=> d!71869 (= lt!334329 lt!334312)))

(assert (=> d!71869 (isPrefixOf!0 lt!334319 (_2!9717 lt!333430))))

(assert (=> d!71869 (= lt!334312 (lemmaIsPrefixTransitive!0 lt!334319 (_2!9717 lt!333430) (_2!9717 lt!333430)))))

(declare-fun lt!334318 () Unit!15099)

(declare-fun lt!334313 () Unit!15099)

(assert (=> d!71869 (= lt!334318 lt!334313)))

(assert (=> d!71869 (isPrefixOf!0 lt!334319 (_2!9717 lt!333430))))

(assert (=> d!71869 (= lt!334313 (lemmaIsPrefixTransitive!0 lt!334319 thiss!1204 (_2!9717 lt!333430)))))

(declare-fun lt!334328 () Unit!15099)

(assert (=> d!71869 (= lt!334328 e!144518)))

(declare-fun c!10441 () Bool)

(assert (=> d!71869 (= c!10441 (not (= (size!4616 (buf!5142 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!334321 () Unit!15099)

(declare-fun lt!334322 () Unit!15099)

(assert (=> d!71869 (= lt!334321 lt!334322)))

(assert (=> d!71869 (isPrefixOf!0 (_2!9717 lt!333430) (_2!9717 lt!333430))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8340) Unit!15099)

(assert (=> d!71869 (= lt!334322 (lemmaIsPrefixRefl!0 (_2!9717 lt!333430)))))

(declare-fun lt!334316 () Unit!15099)

(declare-fun lt!334315 () Unit!15099)

(assert (=> d!71869 (= lt!334316 lt!334315)))

(assert (=> d!71869 (= lt!334315 (lemmaIsPrefixRefl!0 (_2!9717 lt!333430)))))

(declare-fun lt!334317 () Unit!15099)

(declare-fun lt!334320 () Unit!15099)

(assert (=> d!71869 (= lt!334317 lt!334320)))

(assert (=> d!71869 (isPrefixOf!0 lt!334319 lt!334319)))

(assert (=> d!71869 (= lt!334320 (lemmaIsPrefixRefl!0 lt!334319))))

(declare-fun lt!334325 () Unit!15099)

(declare-fun lt!334314 () Unit!15099)

(assert (=> d!71869 (= lt!334325 lt!334314)))

(assert (=> d!71869 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!71869 (= lt!334314 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!71869 (= lt!334319 (BitStream!8341 (buf!5142 (_2!9717 lt!333430)) (currentByte!9702 thiss!1204) (currentBit!9697 thiss!1204)))))

(assert (=> d!71869 (isPrefixOf!0 thiss!1204 (_2!9717 lt!333430))))

(assert (=> d!71869 (= (reader!0 thiss!1204 (_2!9717 lt!333430)) lt!334331)))

(declare-fun b!212027 () Bool)

(declare-fun lt!334323 () Unit!15099)

(assert (=> b!212027 (= e!144518 lt!334323)))

(declare-fun lt!334327 () (_ BitVec 64))

(assert (=> b!212027 (= lt!334327 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!334324 () (_ BitVec 64))

(assert (=> b!212027 (= lt!334324 (bitIndex!0 (size!4616 (buf!5142 thiss!1204)) (currentByte!9702 thiss!1204) (currentBit!9697 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10510 array!10510 (_ BitVec 64) (_ BitVec 64)) Unit!15099)

(assert (=> b!212027 (= lt!334323 (arrayBitRangesEqSymmetric!0 (buf!5142 thiss!1204) (buf!5142 (_2!9717 lt!333430)) lt!334327 lt!334324))))

(declare-fun arrayBitRangesEq!0 (array!10510 array!10510 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!212027 (arrayBitRangesEq!0 (buf!5142 (_2!9717 lt!333430)) (buf!5142 thiss!1204) lt!334327 lt!334324)))

(declare-fun b!212028 () Bool)

(declare-fun res!178065 () Bool)

(assert (=> b!212028 (=> (not res!178065) (not e!144517))))

(assert (=> b!212028 (= res!178065 (isPrefixOf!0 (_1!9715 lt!334331) thiss!1204))))

(assert (= (and d!71869 c!10441) b!212027))

(assert (= (and d!71869 (not c!10441)) b!212024))

(assert (= (and d!71869 res!178064) b!212028))

(assert (= (and b!212028 res!178065) b!212025))

(assert (= (and b!212025 res!178066) b!212026))

(declare-fun m!326929 () Bool)

(assert (=> b!212028 m!326929))

(assert (=> b!212027 m!326319))

(declare-fun m!326931 () Bool)

(assert (=> b!212027 m!326931))

(declare-fun m!326933 () Bool)

(assert (=> b!212027 m!326933))

(declare-fun m!326935 () Bool)

(assert (=> d!71869 m!326935))

(assert (=> d!71869 m!326303))

(declare-fun m!326937 () Bool)

(assert (=> d!71869 m!326937))

(declare-fun m!326939 () Bool)

(assert (=> d!71869 m!326939))

(declare-fun m!326941 () Bool)

(assert (=> d!71869 m!326941))

(declare-fun m!326943 () Bool)

(assert (=> d!71869 m!326943))

(declare-fun m!326945 () Bool)

(assert (=> d!71869 m!326945))

(declare-fun m!326947 () Bool)

(assert (=> d!71869 m!326947))

(declare-fun m!326949 () Bool)

(assert (=> d!71869 m!326949))

(declare-fun m!326951 () Bool)

(assert (=> d!71869 m!326951))

(declare-fun m!326953 () Bool)

(assert (=> d!71869 m!326953))

(declare-fun m!326955 () Bool)

(assert (=> b!212025 m!326955))

(declare-fun m!326957 () Bool)

(assert (=> b!212026 m!326957))

(assert (=> b!212026 m!326301))

(assert (=> b!212026 m!326319))

(assert (=> b!211689 d!71869))

(declare-fun d!71905 () Bool)

(assert (=> d!71905 (= (invariant!0 (currentBit!9697 thiss!1204) (currentByte!9702 thiss!1204) (size!4616 (buf!5142 (_2!9717 lt!333423)))) (and (bvsge (currentBit!9697 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9697 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9702 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9702 thiss!1204) (size!4616 (buf!5142 (_2!9717 lt!333423)))) (and (= (currentBit!9697 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9702 thiss!1204) (size!4616 (buf!5142 (_2!9717 lt!333423))))))))))

(assert (=> b!211689 d!71905))

(declare-fun lt!334332 () tuple2!18142)

(declare-fun d!71907 () Bool)

(assert (=> d!71907 (= lt!334332 (readNBitsLSBFirstsLoop!0 (_1!9715 lt!333413) nBits!348 i!590 lt!333415))))

(assert (=> d!71907 (= (readNBitsLSBFirstsLoopPure!0 (_1!9715 lt!333413) nBits!348 i!590 lt!333415) (tuple2!18119 (_2!9726 lt!334332) (_1!9726 lt!334332)))))

(declare-fun bs!17640 () Bool)

(assert (= bs!17640 d!71907))

(declare-fun m!326959 () Bool)

(assert (=> bs!17640 m!326959))

(assert (=> b!211689 d!71907))

(declare-fun d!71909 () Bool)

(declare-fun e!144521 () Bool)

(assert (=> d!71909 e!144521))

(declare-fun res!178069 () Bool)

(assert (=> d!71909 (=> (not res!178069) (not e!144521))))

(declare-fun lt!334344 () tuple2!18122)

(declare-fun lt!334341 () tuple2!18122)

(assert (=> d!71909 (= res!178069 (= (bitIndex!0 (size!4616 (buf!5142 (_1!9716 lt!334344))) (currentByte!9702 (_1!9716 lt!334344)) (currentBit!9697 (_1!9716 lt!334344))) (bitIndex!0 (size!4616 (buf!5142 (_1!9716 lt!334341))) (currentByte!9702 (_1!9716 lt!334341)) (currentBit!9697 (_1!9716 lt!334341)))))))

(declare-fun lt!334343 () BitStream!8340)

(declare-fun lt!334342 () Unit!15099)

(declare-fun choose!50 (BitStream!8340 BitStream!8340 BitStream!8340 tuple2!18122 tuple2!18122 BitStream!8340 Bool tuple2!18122 tuple2!18122 BitStream!8340 Bool) Unit!15099)

(assert (=> d!71909 (= lt!334342 (choose!50 lt!333438 (_2!9717 lt!333430) lt!334343 lt!334344 (tuple2!18123 (_1!9716 lt!334344) (_2!9716 lt!334344)) (_1!9716 lt!334344) (_2!9716 lt!334344) lt!334341 (tuple2!18123 (_1!9716 lt!334341) (_2!9716 lt!334341)) (_1!9716 lt!334341) (_2!9716 lt!334341)))))

(assert (=> d!71909 (= lt!334341 (readBitPure!0 lt!334343))))

(assert (=> d!71909 (= lt!334344 (readBitPure!0 lt!333438))))

(assert (=> d!71909 (= lt!334343 (BitStream!8341 (buf!5142 (_2!9717 lt!333430)) (currentByte!9702 lt!333438) (currentBit!9697 lt!333438)))))

(assert (=> d!71909 (invariant!0 (currentBit!9697 lt!333438) (currentByte!9702 lt!333438) (size!4616 (buf!5142 (_2!9717 lt!333430))))))

(assert (=> d!71909 (= (readBitPrefixLemma!0 lt!333438 (_2!9717 lt!333430)) lt!334342)))

(declare-fun b!212031 () Bool)

(assert (=> b!212031 (= e!144521 (= (_2!9716 lt!334344) (_2!9716 lt!334341)))))

(assert (= (and d!71909 res!178069) b!212031))

(declare-fun m!326961 () Bool)

(assert (=> d!71909 m!326961))

(declare-fun m!326963 () Bool)

(assert (=> d!71909 m!326963))

(declare-fun m!326965 () Bool)

(assert (=> d!71909 m!326965))

(declare-fun m!326967 () Bool)

(assert (=> d!71909 m!326967))

(assert (=> d!71909 m!326261))

(declare-fun m!326969 () Bool)

(assert (=> d!71909 m!326969))

(assert (=> b!211689 d!71909))

(declare-fun d!71911 () Bool)

(declare-fun e!144524 () Bool)

(assert (=> d!71911 e!144524))

(declare-fun res!178074 () Bool)

(assert (=> d!71911 (=> (not res!178074) (not e!144524))))

(declare-fun lt!334357 () (_ BitVec 64))

(declare-fun lt!334362 () (_ BitVec 64))

(declare-fun lt!334360 () (_ BitVec 64))

(assert (=> d!71911 (= res!178074 (= lt!334362 (bvsub lt!334360 lt!334357)))))

(assert (=> d!71911 (or (= (bvand lt!334360 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!334357 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!334360 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!334360 lt!334357) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71911 (= lt!334357 (remainingBits!0 ((_ sign_extend 32) (size!4616 (buf!5142 (_1!9716 lt!333416)))) ((_ sign_extend 32) (currentByte!9702 (_1!9716 lt!333416))) ((_ sign_extend 32) (currentBit!9697 (_1!9716 lt!333416)))))))

(declare-fun lt!334359 () (_ BitVec 64))

(declare-fun lt!334361 () (_ BitVec 64))

(assert (=> d!71911 (= lt!334360 (bvmul lt!334359 lt!334361))))

(assert (=> d!71911 (or (= lt!334359 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!334361 (bvsdiv (bvmul lt!334359 lt!334361) lt!334359)))))

(assert (=> d!71911 (= lt!334361 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71911 (= lt!334359 ((_ sign_extend 32) (size!4616 (buf!5142 (_1!9716 lt!333416)))))))

(assert (=> d!71911 (= lt!334362 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9702 (_1!9716 lt!333416))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9697 (_1!9716 lt!333416)))))))

(assert (=> d!71911 (invariant!0 (currentBit!9697 (_1!9716 lt!333416)) (currentByte!9702 (_1!9716 lt!333416)) (size!4616 (buf!5142 (_1!9716 lt!333416))))))

(assert (=> d!71911 (= (bitIndex!0 (size!4616 (buf!5142 (_1!9716 lt!333416))) (currentByte!9702 (_1!9716 lt!333416)) (currentBit!9697 (_1!9716 lt!333416))) lt!334362)))

(declare-fun b!212036 () Bool)

(declare-fun res!178075 () Bool)

(assert (=> b!212036 (=> (not res!178075) (not e!144524))))

(assert (=> b!212036 (= res!178075 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!334362))))

(declare-fun b!212037 () Bool)

(declare-fun lt!334358 () (_ BitVec 64))

(assert (=> b!212037 (= e!144524 (bvsle lt!334362 (bvmul lt!334358 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!212037 (or (= lt!334358 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!334358 #b0000000000000000000000000000000000000000000000000000000000001000) lt!334358)))))

(assert (=> b!212037 (= lt!334358 ((_ sign_extend 32) (size!4616 (buf!5142 (_1!9716 lt!333416)))))))

(assert (= (and d!71911 res!178074) b!212036))

(assert (= (and b!212036 res!178075) b!212037))

(declare-fun m!326971 () Bool)

(assert (=> d!71911 m!326971))

(declare-fun m!326973 () Bool)

(assert (=> d!71911 m!326973))

(assert (=> b!211689 d!71911))

(declare-fun d!71913 () Bool)

(assert (=> d!71913 (validate_offset_bits!1 ((_ sign_extend 32) (size!4616 (buf!5142 (_2!9717 lt!333430)))) ((_ sign_extend 32) (currentByte!9702 (_2!9717 lt!333423))) ((_ sign_extend 32) (currentBit!9697 (_2!9717 lt!333423))) lt!333419)))

(declare-fun lt!334363 () Unit!15099)

(assert (=> d!71913 (= lt!334363 (choose!9 (_2!9717 lt!333423) (buf!5142 (_2!9717 lt!333430)) lt!333419 (BitStream!8341 (buf!5142 (_2!9717 lt!333430)) (currentByte!9702 (_2!9717 lt!333423)) (currentBit!9697 (_2!9717 lt!333423)))))))

(assert (=> d!71913 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9717 lt!333423) (buf!5142 (_2!9717 lt!333430)) lt!333419) lt!334363)))

(declare-fun bs!17641 () Bool)

(assert (= bs!17641 d!71913))

(assert (=> bs!17641 m!326265))

(declare-fun m!326975 () Bool)

(assert (=> bs!17641 m!326975))

(assert (=> b!211689 d!71913))

(declare-fun d!71915 () Bool)

(declare-fun lt!334364 () tuple2!18144)

(assert (=> d!71915 (= lt!334364 (readBit!0 (BitStream!8341 (buf!5142 (_2!9717 lt!333430)) (currentByte!9702 thiss!1204) (currentBit!9697 thiss!1204))))))

(assert (=> d!71915 (= (readBitPure!0 (BitStream!8341 (buf!5142 (_2!9717 lt!333430)) (currentByte!9702 thiss!1204) (currentBit!9697 thiss!1204))) (tuple2!18123 (_2!9727 lt!334364) (_1!9727 lt!334364)))))

(declare-fun bs!17642 () Bool)

(assert (= bs!17642 d!71915))

(declare-fun m!326977 () Bool)

(assert (=> bs!17642 m!326977))

(assert (=> b!211689 d!71915))

(declare-fun d!71917 () Bool)

(declare-fun lt!334365 () tuple2!18144)

(assert (=> d!71917 (= lt!334365 (readBit!0 lt!333438))))

(assert (=> d!71917 (= (readBitPure!0 lt!333438) (tuple2!18123 (_2!9727 lt!334365) (_1!9727 lt!334365)))))

(declare-fun bs!17643 () Bool)

(assert (= bs!17643 d!71917))

(declare-fun m!326979 () Bool)

(assert (=> bs!17643 m!326979))

(assert (=> b!211689 d!71917))

(declare-fun d!71919 () Bool)

(declare-fun e!144525 () Bool)

(assert (=> d!71919 e!144525))

(declare-fun res!178076 () Bool)

(assert (=> d!71919 (=> (not res!178076) (not e!144525))))

(declare-fun lt!334369 () (_ BitVec 64))

(declare-fun lt!334366 () (_ BitVec 64))

(declare-fun lt!334371 () (_ BitVec 64))

(assert (=> d!71919 (= res!178076 (= lt!334371 (bvsub lt!334369 lt!334366)))))

(assert (=> d!71919 (or (= (bvand lt!334369 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!334366 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!334369 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!334369 lt!334366) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71919 (= lt!334366 (remainingBits!0 ((_ sign_extend 32) (size!4616 (buf!5142 (_1!9716 lt!333431)))) ((_ sign_extend 32) (currentByte!9702 (_1!9716 lt!333431))) ((_ sign_extend 32) (currentBit!9697 (_1!9716 lt!333431)))))))

(declare-fun lt!334368 () (_ BitVec 64))

(declare-fun lt!334370 () (_ BitVec 64))

(assert (=> d!71919 (= lt!334369 (bvmul lt!334368 lt!334370))))

(assert (=> d!71919 (or (= lt!334368 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!334370 (bvsdiv (bvmul lt!334368 lt!334370) lt!334368)))))

(assert (=> d!71919 (= lt!334370 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71919 (= lt!334368 ((_ sign_extend 32) (size!4616 (buf!5142 (_1!9716 lt!333431)))))))

(assert (=> d!71919 (= lt!334371 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9702 (_1!9716 lt!333431))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9697 (_1!9716 lt!333431)))))))

(assert (=> d!71919 (invariant!0 (currentBit!9697 (_1!9716 lt!333431)) (currentByte!9702 (_1!9716 lt!333431)) (size!4616 (buf!5142 (_1!9716 lt!333431))))))

(assert (=> d!71919 (= (bitIndex!0 (size!4616 (buf!5142 (_1!9716 lt!333431))) (currentByte!9702 (_1!9716 lt!333431)) (currentBit!9697 (_1!9716 lt!333431))) lt!334371)))

(declare-fun b!212038 () Bool)

(declare-fun res!178077 () Bool)

(assert (=> b!212038 (=> (not res!178077) (not e!144525))))

(assert (=> b!212038 (= res!178077 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!334371))))

(declare-fun b!212039 () Bool)

(declare-fun lt!334367 () (_ BitVec 64))

(assert (=> b!212039 (= e!144525 (bvsle lt!334371 (bvmul lt!334367 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!212039 (or (= lt!334367 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!334367 #b0000000000000000000000000000000000000000000000000000000000001000) lt!334367)))))

(assert (=> b!212039 (= lt!334367 ((_ sign_extend 32) (size!4616 (buf!5142 (_1!9716 lt!333431)))))))

(assert (= (and d!71919 res!178076) b!212038))

(assert (= (and b!212038 res!178077) b!212039))

(declare-fun m!326981 () Bool)

(assert (=> d!71919 m!326981))

(declare-fun m!326983 () Bool)

(assert (=> d!71919 m!326983))

(assert (=> b!211689 d!71919))

(declare-fun b!212040 () Bool)

(declare-fun e!144527 () Unit!15099)

(declare-fun Unit!15130 () Unit!15099)

(assert (=> b!212040 (= e!144527 Unit!15130)))

(declare-fun b!212041 () Bool)

(declare-fun res!178080 () Bool)

(declare-fun e!144526 () Bool)

(assert (=> b!212041 (=> (not res!178080) (not e!144526))))

(declare-fun lt!334391 () tuple2!18120)

(assert (=> b!212041 (= res!178080 (isPrefixOf!0 (_2!9715 lt!334391) (_2!9717 lt!333430)))))

(declare-fun b!212042 () Bool)

(declare-fun lt!334390 () (_ BitVec 64))

(declare-fun lt!334386 () (_ BitVec 64))

(assert (=> b!212042 (= e!144526 (= (_1!9715 lt!334391) (withMovedBitIndex!0 (_2!9715 lt!334391) (bvsub lt!334386 lt!334390))))))

(assert (=> b!212042 (or (= (bvand lt!334386 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!334390 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!334386 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!334386 lt!334390) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212042 (= lt!334390 (bitIndex!0 (size!4616 (buf!5142 (_2!9717 lt!333430))) (currentByte!9702 (_2!9717 lt!333430)) (currentBit!9697 (_2!9717 lt!333430))))))

(assert (=> b!212042 (= lt!334386 (bitIndex!0 (size!4616 (buf!5142 (_2!9717 lt!333423))) (currentByte!9702 (_2!9717 lt!333423)) (currentBit!9697 (_2!9717 lt!333423))))))

(declare-fun d!71921 () Bool)

(assert (=> d!71921 e!144526))

(declare-fun res!178078 () Bool)

(assert (=> d!71921 (=> (not res!178078) (not e!144526))))

(assert (=> d!71921 (= res!178078 (isPrefixOf!0 (_1!9715 lt!334391) (_2!9715 lt!334391)))))

(declare-fun lt!334379 () BitStream!8340)

(assert (=> d!71921 (= lt!334391 (tuple2!18121 lt!334379 (_2!9717 lt!333430)))))

(declare-fun lt!334389 () Unit!15099)

(declare-fun lt!334372 () Unit!15099)

(assert (=> d!71921 (= lt!334389 lt!334372)))

(assert (=> d!71921 (isPrefixOf!0 lt!334379 (_2!9717 lt!333430))))

(assert (=> d!71921 (= lt!334372 (lemmaIsPrefixTransitive!0 lt!334379 (_2!9717 lt!333430) (_2!9717 lt!333430)))))

(declare-fun lt!334378 () Unit!15099)

(declare-fun lt!334373 () Unit!15099)

(assert (=> d!71921 (= lt!334378 lt!334373)))

(assert (=> d!71921 (isPrefixOf!0 lt!334379 (_2!9717 lt!333430))))

(assert (=> d!71921 (= lt!334373 (lemmaIsPrefixTransitive!0 lt!334379 (_2!9717 lt!333423) (_2!9717 lt!333430)))))

(declare-fun lt!334388 () Unit!15099)

(assert (=> d!71921 (= lt!334388 e!144527)))

(declare-fun c!10442 () Bool)

(assert (=> d!71921 (= c!10442 (not (= (size!4616 (buf!5142 (_2!9717 lt!333423))) #b00000000000000000000000000000000)))))

(declare-fun lt!334381 () Unit!15099)

(declare-fun lt!334382 () Unit!15099)

(assert (=> d!71921 (= lt!334381 lt!334382)))

(assert (=> d!71921 (isPrefixOf!0 (_2!9717 lt!333430) (_2!9717 lt!333430))))

(assert (=> d!71921 (= lt!334382 (lemmaIsPrefixRefl!0 (_2!9717 lt!333430)))))

(declare-fun lt!334376 () Unit!15099)

(declare-fun lt!334375 () Unit!15099)

(assert (=> d!71921 (= lt!334376 lt!334375)))

(assert (=> d!71921 (= lt!334375 (lemmaIsPrefixRefl!0 (_2!9717 lt!333430)))))

(declare-fun lt!334377 () Unit!15099)

(declare-fun lt!334380 () Unit!15099)

(assert (=> d!71921 (= lt!334377 lt!334380)))

(assert (=> d!71921 (isPrefixOf!0 lt!334379 lt!334379)))

(assert (=> d!71921 (= lt!334380 (lemmaIsPrefixRefl!0 lt!334379))))

(declare-fun lt!334385 () Unit!15099)

(declare-fun lt!334374 () Unit!15099)

(assert (=> d!71921 (= lt!334385 lt!334374)))

(assert (=> d!71921 (isPrefixOf!0 (_2!9717 lt!333423) (_2!9717 lt!333423))))

(assert (=> d!71921 (= lt!334374 (lemmaIsPrefixRefl!0 (_2!9717 lt!333423)))))

(assert (=> d!71921 (= lt!334379 (BitStream!8341 (buf!5142 (_2!9717 lt!333430)) (currentByte!9702 (_2!9717 lt!333423)) (currentBit!9697 (_2!9717 lt!333423))))))

(assert (=> d!71921 (isPrefixOf!0 (_2!9717 lt!333423) (_2!9717 lt!333430))))

(assert (=> d!71921 (= (reader!0 (_2!9717 lt!333423) (_2!9717 lt!333430)) lt!334391)))

(declare-fun b!212043 () Bool)

(declare-fun lt!334383 () Unit!15099)

(assert (=> b!212043 (= e!144527 lt!334383)))

(declare-fun lt!334387 () (_ BitVec 64))

(assert (=> b!212043 (= lt!334387 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!334384 () (_ BitVec 64))

(assert (=> b!212043 (= lt!334384 (bitIndex!0 (size!4616 (buf!5142 (_2!9717 lt!333423))) (currentByte!9702 (_2!9717 lt!333423)) (currentBit!9697 (_2!9717 lt!333423))))))

(assert (=> b!212043 (= lt!334383 (arrayBitRangesEqSymmetric!0 (buf!5142 (_2!9717 lt!333423)) (buf!5142 (_2!9717 lt!333430)) lt!334387 lt!334384))))

(assert (=> b!212043 (arrayBitRangesEq!0 (buf!5142 (_2!9717 lt!333430)) (buf!5142 (_2!9717 lt!333423)) lt!334387 lt!334384)))

(declare-fun b!212044 () Bool)

(declare-fun res!178079 () Bool)

(assert (=> b!212044 (=> (not res!178079) (not e!144526))))

(assert (=> b!212044 (= res!178079 (isPrefixOf!0 (_1!9715 lt!334391) (_2!9717 lt!333423)))))

(assert (= (and d!71921 c!10442) b!212043))

(assert (= (and d!71921 (not c!10442)) b!212040))

(assert (= (and d!71921 res!178078) b!212044))

(assert (= (and b!212044 res!178079) b!212041))

(assert (= (and b!212041 res!178080) b!212042))

(declare-fun m!326985 () Bool)

(assert (=> b!212044 m!326985))

(assert (=> b!212043 m!326317))

(declare-fun m!326987 () Bool)

(assert (=> b!212043 m!326987))

(declare-fun m!326989 () Bool)

(assert (=> b!212043 m!326989))

(declare-fun m!326991 () Bool)

(assert (=> d!71921 m!326991))

(assert (=> d!71921 m!326313))

(assert (=> d!71921 m!326937))

(declare-fun m!326993 () Bool)

(assert (=> d!71921 m!326993))

(assert (=> d!71921 m!326941))

(declare-fun m!326995 () Bool)

(assert (=> d!71921 m!326995))

(declare-fun m!326997 () Bool)

(assert (=> d!71921 m!326997))

(declare-fun m!326999 () Bool)

(assert (=> d!71921 m!326999))

(declare-fun m!327001 () Bool)

(assert (=> d!71921 m!327001))

(declare-fun m!327003 () Bool)

(assert (=> d!71921 m!327003))

(declare-fun m!327005 () Bool)

(assert (=> d!71921 m!327005))

(declare-fun m!327007 () Bool)

(assert (=> b!212041 m!327007))

(declare-fun m!327009 () Bool)

(assert (=> b!212042 m!327009))

(assert (=> b!212042 m!326301))

(assert (=> b!212042 m!326317))

(assert (=> b!211689 d!71921))

(declare-fun d!71923 () Bool)

(declare-fun res!178088 () Bool)

(declare-fun e!144533 () Bool)

(assert (=> d!71923 (=> (not res!178088) (not e!144533))))

(assert (=> d!71923 (= res!178088 (= (size!4616 (buf!5142 thiss!1204)) (size!4616 (buf!5142 (_2!9717 lt!333423)))))))

(assert (=> d!71923 (= (isPrefixOf!0 thiss!1204 (_2!9717 lt!333423)) e!144533)))

(declare-fun b!212051 () Bool)

(declare-fun res!178087 () Bool)

(assert (=> b!212051 (=> (not res!178087) (not e!144533))))

(assert (=> b!212051 (= res!178087 (bvsle (bitIndex!0 (size!4616 (buf!5142 thiss!1204)) (currentByte!9702 thiss!1204) (currentBit!9697 thiss!1204)) (bitIndex!0 (size!4616 (buf!5142 (_2!9717 lt!333423))) (currentByte!9702 (_2!9717 lt!333423)) (currentBit!9697 (_2!9717 lt!333423)))))))

(declare-fun b!212052 () Bool)

(declare-fun e!144532 () Bool)

(assert (=> b!212052 (= e!144533 e!144532)))

(declare-fun res!178089 () Bool)

(assert (=> b!212052 (=> res!178089 e!144532)))

(assert (=> b!212052 (= res!178089 (= (size!4616 (buf!5142 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!212053 () Bool)

(assert (=> b!212053 (= e!144532 (arrayBitRangesEq!0 (buf!5142 thiss!1204) (buf!5142 (_2!9717 lt!333423)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4616 (buf!5142 thiss!1204)) (currentByte!9702 thiss!1204) (currentBit!9697 thiss!1204))))))

(assert (= (and d!71923 res!178088) b!212051))

(assert (= (and b!212051 res!178087) b!212052))

(assert (= (and b!212052 (not res!178089)) b!212053))

(assert (=> b!212051 m!326319))

(assert (=> b!212051 m!326317))

(assert (=> b!212053 m!326319))

(assert (=> b!212053 m!326319))

(declare-fun m!327011 () Bool)

(assert (=> b!212053 m!327011))

(assert (=> b!211696 d!71923))

(declare-fun d!71925 () Bool)

(declare-fun lt!334407 () tuple2!18118)

(declare-fun lt!334404 () tuple2!18118)

(assert (=> d!71925 (and (= (_2!9714 lt!334407) (_2!9714 lt!334404)) (= (_1!9714 lt!334407) (_1!9714 lt!334404)))))

(declare-fun lt!334409 () BitStream!8340)

(declare-fun lt!334406 () Bool)

(declare-fun lt!334405 () Unit!15099)

(declare-fun lt!334408 () (_ BitVec 64))

(declare-fun choose!56 (BitStream!8340 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!18118 tuple2!18118 BitStream!8340 (_ BitVec 64) Bool BitStream!8340 (_ BitVec 64) tuple2!18118 tuple2!18118 BitStream!8340 (_ BitVec 64)) Unit!15099)

(assert (=> d!71925 (= lt!334405 (choose!56 (_1!9715 lt!333413) nBits!348 i!590 lt!333415 lt!334407 (tuple2!18119 (_1!9714 lt!334407) (_2!9714 lt!334407)) (_1!9714 lt!334407) (_2!9714 lt!334407) lt!334406 lt!334409 lt!334408 lt!334404 (tuple2!18119 (_1!9714 lt!334404) (_2!9714 lt!334404)) (_1!9714 lt!334404) (_2!9714 lt!334404)))))

(assert (=> d!71925 (= lt!334404 (readNBitsLSBFirstsLoopPure!0 lt!334409 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!334408))))

(assert (=> d!71925 (= lt!334408 (bvor lt!333415 (ite lt!334406 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71925 (= lt!334409 (withMovedBitIndex!0 (_1!9715 lt!333413) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!71925 (= lt!334406 (_2!9716 (readBitPure!0 (_1!9715 lt!333413))))))

(assert (=> d!71925 (= lt!334407 (readNBitsLSBFirstsLoopPure!0 (_1!9715 lt!333413) nBits!348 i!590 lt!333415))))

(assert (=> d!71925 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9715 lt!333413) nBits!348 i!590 lt!333415) lt!334405)))

(declare-fun bs!17645 () Bool)

(assert (= bs!17645 d!71925))

(declare-fun m!327013 () Bool)

(assert (=> bs!17645 m!327013))

(assert (=> bs!17645 m!326259))

(declare-fun m!327015 () Bool)

(assert (=> bs!17645 m!327015))

(assert (=> bs!17645 m!326257))

(assert (=> bs!17645 m!326291))

(assert (=> b!211685 d!71925))

(declare-fun d!71927 () Bool)

(declare-fun lt!334410 () tuple2!18142)

(assert (=> d!71927 (= lt!334410 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!9715 lt!333413) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!333420))))

(assert (=> d!71927 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9715 lt!333413) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!333420) (tuple2!18119 (_2!9726 lt!334410) (_1!9726 lt!334410)))))

(declare-fun bs!17646 () Bool)

(assert (= bs!17646 d!71927))

(assert (=> bs!17646 m!326291))

(declare-fun m!327017 () Bool)

(assert (=> bs!17646 m!327017))

(assert (=> b!211685 d!71927))

(declare-fun d!71929 () Bool)

(declare-fun e!144534 () Bool)

(assert (=> d!71929 e!144534))

(declare-fun res!178090 () Bool)

(assert (=> d!71929 (=> (not res!178090) (not e!144534))))

(declare-fun lt!334412 () (_ BitVec 64))

(declare-fun lt!334411 () BitStream!8340)

(assert (=> d!71929 (= res!178090 (= (bvadd lt!334412 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4616 (buf!5142 lt!334411)) (currentByte!9702 lt!334411) (currentBit!9697 lt!334411))))))

(assert (=> d!71929 (or (not (= (bvand lt!334412 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!334412 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!334412 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71929 (= lt!334412 (bitIndex!0 (size!4616 (buf!5142 (_1!9715 lt!333413))) (currentByte!9702 (_1!9715 lt!333413)) (currentBit!9697 (_1!9715 lt!333413))))))

(assert (=> d!71929 (= lt!334411 (_2!9717 (moveBitIndex!0 (_1!9715 lt!333413) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!71929 (moveBitIndexPrecond!0 (_1!9715 lt!333413) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!71929 (= (withMovedBitIndex!0 (_1!9715 lt!333413) #b0000000000000000000000000000000000000000000000000000000000000001) lt!334411)))

(declare-fun b!212054 () Bool)

(assert (=> b!212054 (= e!144534 (= (size!4616 (buf!5142 (_1!9715 lt!333413))) (size!4616 (buf!5142 lt!334411))))))

(assert (= (and d!71929 res!178090) b!212054))

(declare-fun m!327019 () Bool)

(assert (=> d!71929 m!327019))

(declare-fun m!327021 () Bool)

(assert (=> d!71929 m!327021))

(declare-fun m!327023 () Bool)

(assert (=> d!71929 m!327023))

(declare-fun m!327025 () Bool)

(assert (=> d!71929 m!327025))

(assert (=> b!211685 d!71929))

(declare-fun d!71931 () Bool)

(declare-fun lt!334413 () tuple2!18144)

(assert (=> d!71931 (= lt!334413 (readBit!0 (readerFrom!0 (_2!9717 lt!333423) (currentBit!9697 thiss!1204) (currentByte!9702 thiss!1204))))))

(assert (=> d!71931 (= (readBitPure!0 (readerFrom!0 (_2!9717 lt!333423) (currentBit!9697 thiss!1204) (currentByte!9702 thiss!1204))) (tuple2!18123 (_2!9727 lt!334413) (_1!9727 lt!334413)))))

(declare-fun bs!17647 () Bool)

(assert (= bs!17647 d!71931))

(assert (=> bs!17647 m!326309))

(declare-fun m!327027 () Bool)

(assert (=> bs!17647 m!327027))

(assert (=> b!211686 d!71931))

(declare-fun d!71933 () Bool)

(declare-fun e!144537 () Bool)

(assert (=> d!71933 e!144537))

(declare-fun res!178094 () Bool)

(assert (=> d!71933 (=> (not res!178094) (not e!144537))))

(assert (=> d!71933 (= res!178094 (invariant!0 (currentBit!9697 (_2!9717 lt!333423)) (currentByte!9702 (_2!9717 lt!333423)) (size!4616 (buf!5142 (_2!9717 lt!333423)))))))

(assert (=> d!71933 (= (readerFrom!0 (_2!9717 lt!333423) (currentBit!9697 thiss!1204) (currentByte!9702 thiss!1204)) (BitStream!8341 (buf!5142 (_2!9717 lt!333423)) (currentByte!9702 thiss!1204) (currentBit!9697 thiss!1204)))))

(declare-fun b!212057 () Bool)

(assert (=> b!212057 (= e!144537 (invariant!0 (currentBit!9697 thiss!1204) (currentByte!9702 thiss!1204) (size!4616 (buf!5142 (_2!9717 lt!333423)))))))

(assert (= (and d!71933 res!178094) b!212057))

(declare-fun m!327029 () Bool)

(assert (=> d!71933 m!327029))

(assert (=> b!212057 m!326255))

(assert (=> b!211686 d!71933))

(declare-fun d!71935 () Bool)

(declare-fun e!144538 () Bool)

(assert (=> d!71935 e!144538))

(declare-fun res!178095 () Bool)

(assert (=> d!71935 (=> (not res!178095) (not e!144538))))

(declare-fun lt!334415 () (_ BitVec 64))

(declare-fun lt!334414 () BitStream!8340)

(assert (=> d!71935 (= res!178095 (= (bvadd lt!334415 (bvsub lt!333414 lt!333425)) (bitIndex!0 (size!4616 (buf!5142 lt!334414)) (currentByte!9702 lt!334414) (currentBit!9697 lt!334414))))))

(assert (=> d!71935 (or (not (= (bvand lt!334415 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!333414 lt!333425) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!334415 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!334415 (bvsub lt!333414 lt!333425)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71935 (= lt!334415 (bitIndex!0 (size!4616 (buf!5142 (_2!9715 lt!333439))) (currentByte!9702 (_2!9715 lt!333439)) (currentBit!9697 (_2!9715 lt!333439))))))

(assert (=> d!71935 (= lt!334414 (_2!9717 (moveBitIndex!0 (_2!9715 lt!333439) (bvsub lt!333414 lt!333425))))))

(assert (=> d!71935 (moveBitIndexPrecond!0 (_2!9715 lt!333439) (bvsub lt!333414 lt!333425))))

(assert (=> d!71935 (= (withMovedBitIndex!0 (_2!9715 lt!333439) (bvsub lt!333414 lt!333425)) lt!334414)))

(declare-fun b!212058 () Bool)

(assert (=> b!212058 (= e!144538 (= (size!4616 (buf!5142 (_2!9715 lt!333439))) (size!4616 (buf!5142 lt!334414))))))

(assert (= (and d!71935 res!178095) b!212058))

(declare-fun m!327031 () Bool)

(assert (=> d!71935 m!327031))

(declare-fun m!327033 () Bool)

(assert (=> d!71935 m!327033))

(declare-fun m!327035 () Bool)

(assert (=> d!71935 m!327035))

(declare-fun m!327037 () Bool)

(assert (=> d!71935 m!327037))

(assert (=> b!211703 d!71935))

(declare-fun d!71937 () Bool)

(declare-fun e!144539 () Bool)

(assert (=> d!71937 e!144539))

(declare-fun res!178096 () Bool)

(assert (=> d!71937 (=> (not res!178096) (not e!144539))))

(declare-fun lt!334419 () (_ BitVec 64))

(declare-fun lt!334421 () (_ BitVec 64))

(declare-fun lt!334416 () (_ BitVec 64))

(assert (=> d!71937 (= res!178096 (= lt!334421 (bvsub lt!334419 lt!334416)))))

(assert (=> d!71937 (or (= (bvand lt!334419 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!334416 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!334419 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!334419 lt!334416) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71937 (= lt!334416 (remainingBits!0 ((_ sign_extend 32) (size!4616 (buf!5142 (_1!9716 lt!333433)))) ((_ sign_extend 32) (currentByte!9702 (_1!9716 lt!333433))) ((_ sign_extend 32) (currentBit!9697 (_1!9716 lt!333433)))))))

(declare-fun lt!334418 () (_ BitVec 64))

(declare-fun lt!334420 () (_ BitVec 64))

(assert (=> d!71937 (= lt!334419 (bvmul lt!334418 lt!334420))))

(assert (=> d!71937 (or (= lt!334418 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!334420 (bvsdiv (bvmul lt!334418 lt!334420) lt!334418)))))

(assert (=> d!71937 (= lt!334420 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71937 (= lt!334418 ((_ sign_extend 32) (size!4616 (buf!5142 (_1!9716 lt!333433)))))))

(assert (=> d!71937 (= lt!334421 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9702 (_1!9716 lt!333433))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9697 (_1!9716 lt!333433)))))))

(assert (=> d!71937 (invariant!0 (currentBit!9697 (_1!9716 lt!333433)) (currentByte!9702 (_1!9716 lt!333433)) (size!4616 (buf!5142 (_1!9716 lt!333433))))))

(assert (=> d!71937 (= (bitIndex!0 (size!4616 (buf!5142 (_1!9716 lt!333433))) (currentByte!9702 (_1!9716 lt!333433)) (currentBit!9697 (_1!9716 lt!333433))) lt!334421)))

(declare-fun b!212059 () Bool)

(declare-fun res!178097 () Bool)

(assert (=> b!212059 (=> (not res!178097) (not e!144539))))

(assert (=> b!212059 (= res!178097 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!334421))))

(declare-fun b!212060 () Bool)

(declare-fun lt!334417 () (_ BitVec 64))

(assert (=> b!212060 (= e!144539 (bvsle lt!334421 (bvmul lt!334417 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!212060 (or (= lt!334417 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!334417 #b0000000000000000000000000000000000000000000000000000000000001000) lt!334417)))))

(assert (=> b!212060 (= lt!334417 ((_ sign_extend 32) (size!4616 (buf!5142 (_1!9716 lt!333433)))))))

(assert (= (and d!71937 res!178096) b!212059))

(assert (= (and b!212059 res!178097) b!212060))

(declare-fun m!327039 () Bool)

(assert (=> d!71937 m!327039))

(declare-fun m!327041 () Bool)

(assert (=> d!71937 m!327041))

(assert (=> b!211704 d!71937))

(declare-fun d!71939 () Bool)

(declare-fun e!144540 () Bool)

(assert (=> d!71939 e!144540))

(declare-fun res!178098 () Bool)

(assert (=> d!71939 (=> (not res!178098) (not e!144540))))

(declare-fun lt!334422 () (_ BitVec 64))

(declare-fun lt!334427 () (_ BitVec 64))

(declare-fun lt!334425 () (_ BitVec 64))

(assert (=> d!71939 (= res!178098 (= lt!334427 (bvsub lt!334425 lt!334422)))))

(assert (=> d!71939 (or (= (bvand lt!334425 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!334422 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!334425 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!334425 lt!334422) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71939 (= lt!334422 (remainingBits!0 ((_ sign_extend 32) (size!4616 (buf!5142 (_2!9717 lt!333430)))) ((_ sign_extend 32) (currentByte!9702 (_2!9717 lt!333430))) ((_ sign_extend 32) (currentBit!9697 (_2!9717 lt!333430)))))))

(declare-fun lt!334424 () (_ BitVec 64))

(declare-fun lt!334426 () (_ BitVec 64))

(assert (=> d!71939 (= lt!334425 (bvmul lt!334424 lt!334426))))

(assert (=> d!71939 (or (= lt!334424 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!334426 (bvsdiv (bvmul lt!334424 lt!334426) lt!334424)))))

(assert (=> d!71939 (= lt!334426 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71939 (= lt!334424 ((_ sign_extend 32) (size!4616 (buf!5142 (_2!9717 lt!333430)))))))

(assert (=> d!71939 (= lt!334427 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9702 (_2!9717 lt!333430))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9697 (_2!9717 lt!333430)))))))

(assert (=> d!71939 (invariant!0 (currentBit!9697 (_2!9717 lt!333430)) (currentByte!9702 (_2!9717 lt!333430)) (size!4616 (buf!5142 (_2!9717 lt!333430))))))

(assert (=> d!71939 (= (bitIndex!0 (size!4616 (buf!5142 (_2!9717 lt!333430))) (currentByte!9702 (_2!9717 lt!333430)) (currentBit!9697 (_2!9717 lt!333430))) lt!334427)))

(declare-fun b!212061 () Bool)

(declare-fun res!178099 () Bool)

(assert (=> b!212061 (=> (not res!178099) (not e!144540))))

(assert (=> b!212061 (= res!178099 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!334427))))

(declare-fun b!212062 () Bool)

(declare-fun lt!334423 () (_ BitVec 64))

(assert (=> b!212062 (= e!144540 (bvsle lt!334427 (bvmul lt!334423 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!212062 (or (= lt!334423 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!334423 #b0000000000000000000000000000000000000000000000000000000000001000) lt!334423)))))

(assert (=> b!212062 (= lt!334423 ((_ sign_extend 32) (size!4616 (buf!5142 (_2!9717 lt!333430)))))))

(assert (= (and d!71939 res!178098) b!212061))

(assert (= (and b!212061 res!178099) b!212062))

(declare-fun m!327043 () Bool)

(assert (=> d!71939 m!327043))

(assert (=> d!71939 m!326327))

(assert (=> b!211693 d!71939))

(declare-fun d!71941 () Bool)

(declare-fun res!178101 () Bool)

(declare-fun e!144542 () Bool)

(assert (=> d!71941 (=> (not res!178101) (not e!144542))))

(assert (=> d!71941 (= res!178101 (= (size!4616 (buf!5142 thiss!1204)) (size!4616 (buf!5142 (_2!9717 lt!333430)))))))

(assert (=> d!71941 (= (isPrefixOf!0 thiss!1204 (_2!9717 lt!333430)) e!144542)))

(declare-fun b!212063 () Bool)

(declare-fun res!178100 () Bool)

(assert (=> b!212063 (=> (not res!178100) (not e!144542))))

(assert (=> b!212063 (= res!178100 (bvsle (bitIndex!0 (size!4616 (buf!5142 thiss!1204)) (currentByte!9702 thiss!1204) (currentBit!9697 thiss!1204)) (bitIndex!0 (size!4616 (buf!5142 (_2!9717 lt!333430))) (currentByte!9702 (_2!9717 lt!333430)) (currentBit!9697 (_2!9717 lt!333430)))))))

(declare-fun b!212064 () Bool)

(declare-fun e!144541 () Bool)

(assert (=> b!212064 (= e!144542 e!144541)))

(declare-fun res!178102 () Bool)

(assert (=> b!212064 (=> res!178102 e!144541)))

(assert (=> b!212064 (= res!178102 (= (size!4616 (buf!5142 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!212065 () Bool)

(assert (=> b!212065 (= e!144541 (arrayBitRangesEq!0 (buf!5142 thiss!1204) (buf!5142 (_2!9717 lt!333430)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4616 (buf!5142 thiss!1204)) (currentByte!9702 thiss!1204) (currentBit!9697 thiss!1204))))))

(assert (= (and d!71941 res!178101) b!212063))

(assert (= (and b!212063 res!178100) b!212064))

(assert (= (and b!212064 (not res!178102)) b!212065))

(assert (=> b!212063 m!326319))

(assert (=> b!212063 m!326301))

(assert (=> b!212065 m!326319))

(assert (=> b!212065 m!326319))

(declare-fun m!327045 () Bool)

(assert (=> b!212065 m!327045))

(assert (=> b!211693 d!71941))

(declare-fun d!71943 () Bool)

(assert (=> d!71943 (isPrefixOf!0 thiss!1204 (_2!9717 lt!333430))))

(declare-fun lt!334430 () Unit!15099)

(declare-fun choose!30 (BitStream!8340 BitStream!8340 BitStream!8340) Unit!15099)

(assert (=> d!71943 (= lt!334430 (choose!30 thiss!1204 (_2!9717 lt!333423) (_2!9717 lt!333430)))))

(assert (=> d!71943 (isPrefixOf!0 thiss!1204 (_2!9717 lt!333423))))

(assert (=> d!71943 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9717 lt!333423) (_2!9717 lt!333430)) lt!334430)))

(declare-fun bs!17648 () Bool)

(assert (= bs!17648 d!71943))

(assert (=> bs!17648 m!326303))

(declare-fun m!327047 () Bool)

(assert (=> bs!17648 m!327047))

(assert (=> bs!17648 m!326315))

(assert (=> b!211693 d!71943))

(declare-fun b!212098 () Bool)

(declare-fun e!144568 () (_ BitVec 64))

(assert (=> b!212098 (= e!144568 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!212099 () Bool)

(declare-fun res!178133 () Bool)

(declare-fun e!144561 () Bool)

(assert (=> b!212099 (=> (not res!178133) (not e!144561))))

(declare-fun lt!334565 () tuple2!18124)

(assert (=> b!212099 (= res!178133 (isPrefixOf!0 (_2!9717 lt!333423) (_2!9717 lt!334565)))))

(declare-fun b!212100 () Bool)

(declare-fun e!144564 () Bool)

(declare-fun lt!334581 () tuple2!18118)

(declare-fun lt!334591 () tuple2!18120)

(assert (=> b!212100 (= e!144564 (= (_1!9714 lt!334581) (_2!9715 lt!334591)))))

(declare-fun b!212102 () Bool)

(assert (=> b!212102 (= e!144561 e!144564)))

(declare-fun res!178137 () Bool)

(assert (=> b!212102 (=> (not res!178137) (not e!144564))))

(assert (=> b!212102 (= res!178137 (= (_2!9714 lt!334581) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!212102 (= lt!334581 (readNBitsLSBFirstsLoopPure!0 (_1!9715 lt!334591) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!334580 () Unit!15099)

(declare-fun lt!334579 () Unit!15099)

(assert (=> b!212102 (= lt!334580 lt!334579)))

(declare-fun lt!334593 () (_ BitVec 64))

(assert (=> b!212102 (validate_offset_bits!1 ((_ sign_extend 32) (size!4616 (buf!5142 (_2!9717 lt!334565)))) ((_ sign_extend 32) (currentByte!9702 (_2!9717 lt!333423))) ((_ sign_extend 32) (currentBit!9697 (_2!9717 lt!333423))) lt!334593)))

(assert (=> b!212102 (= lt!334579 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9717 lt!333423) (buf!5142 (_2!9717 lt!334565)) lt!334593))))

(declare-fun e!144562 () Bool)

(assert (=> b!212102 e!144562))

(declare-fun res!178136 () Bool)

(assert (=> b!212102 (=> (not res!178136) (not e!144562))))

(assert (=> b!212102 (= res!178136 (and (= (size!4616 (buf!5142 (_2!9717 lt!333423))) (size!4616 (buf!5142 (_2!9717 lt!334565)))) (bvsge lt!334593 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212102 (= lt!334593 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!212102 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!212102 (= lt!334591 (reader!0 (_2!9717 lt!333423) (_2!9717 lt!334565)))))

(declare-fun b!212103 () Bool)

(declare-fun e!144567 () tuple2!18124)

(declare-fun lt!334588 () tuple2!18124)

(assert (=> b!212103 (= e!144567 (tuple2!18125 (_1!9717 lt!334588) (_2!9717 lt!334588)))))

(declare-fun lt!334595 () Bool)

(assert (=> b!212103 (= lt!334595 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!334548 () tuple2!18124)

(assert (=> b!212103 (= lt!334548 (appendBit!0 (_2!9717 lt!333423) lt!334595))))

(declare-fun res!178134 () Bool)

(assert (=> b!212103 (= res!178134 (= (size!4616 (buf!5142 (_2!9717 lt!333423))) (size!4616 (buf!5142 (_2!9717 lt!334548)))))))

(declare-fun e!144569 () Bool)

(assert (=> b!212103 (=> (not res!178134) (not e!144569))))

(assert (=> b!212103 e!144569))

(declare-fun lt!334587 () tuple2!18124)

(assert (=> b!212103 (= lt!334587 lt!334548)))

(assert (=> b!212103 (= lt!334588 (appendBitsLSBFirstLoopTR!0 (_2!9717 lt!334587) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!334573 () Unit!15099)

(assert (=> b!212103 (= lt!334573 (lemmaIsPrefixTransitive!0 (_2!9717 lt!333423) (_2!9717 lt!334587) (_2!9717 lt!334588)))))

(assert (=> b!212103 (isPrefixOf!0 (_2!9717 lt!333423) (_2!9717 lt!334588))))

(declare-fun lt!334577 () Unit!15099)

(assert (=> b!212103 (= lt!334577 lt!334573)))

(assert (=> b!212103 (invariant!0 (currentBit!9697 (_2!9717 lt!333423)) (currentByte!9702 (_2!9717 lt!333423)) (size!4616 (buf!5142 (_2!9717 lt!334587))))))

(declare-fun lt!334569 () BitStream!8340)

(assert (=> b!212103 (= lt!334569 (BitStream!8341 (buf!5142 (_2!9717 lt!334587)) (currentByte!9702 (_2!9717 lt!333423)) (currentBit!9697 (_2!9717 lt!333423))))))

(assert (=> b!212103 (invariant!0 (currentBit!9697 lt!334569) (currentByte!9702 lt!334569) (size!4616 (buf!5142 (_2!9717 lt!334588))))))

(declare-fun lt!334598 () BitStream!8340)

(assert (=> b!212103 (= lt!334598 (BitStream!8341 (buf!5142 (_2!9717 lt!334588)) (currentByte!9702 lt!334569) (currentBit!9697 lt!334569)))))

(declare-fun lt!334549 () tuple2!18122)

(assert (=> b!212103 (= lt!334549 (readBitPure!0 lt!334569))))

(declare-fun lt!334563 () tuple2!18122)

(assert (=> b!212103 (= lt!334563 (readBitPure!0 lt!334598))))

(declare-fun lt!334559 () Unit!15099)

(assert (=> b!212103 (= lt!334559 (readBitPrefixLemma!0 lt!334569 (_2!9717 lt!334588)))))

(declare-fun res!178128 () Bool)

(assert (=> b!212103 (= res!178128 (= (bitIndex!0 (size!4616 (buf!5142 (_1!9716 lt!334549))) (currentByte!9702 (_1!9716 lt!334549)) (currentBit!9697 (_1!9716 lt!334549))) (bitIndex!0 (size!4616 (buf!5142 (_1!9716 lt!334563))) (currentByte!9702 (_1!9716 lt!334563)) (currentBit!9697 (_1!9716 lt!334563)))))))

(declare-fun e!144565 () Bool)

(assert (=> b!212103 (=> (not res!178128) (not e!144565))))

(assert (=> b!212103 e!144565))

(declare-fun lt!334560 () Unit!15099)

(assert (=> b!212103 (= lt!334560 lt!334559)))

(declare-fun lt!334545 () tuple2!18120)

(assert (=> b!212103 (= lt!334545 (reader!0 (_2!9717 lt!333423) (_2!9717 lt!334588)))))

(declare-fun lt!334583 () tuple2!18120)

(assert (=> b!212103 (= lt!334583 (reader!0 (_2!9717 lt!334587) (_2!9717 lt!334588)))))

(declare-fun lt!334571 () tuple2!18122)

(assert (=> b!212103 (= lt!334571 (readBitPure!0 (_1!9715 lt!334545)))))

(assert (=> b!212103 (= (_2!9716 lt!334571) lt!334595)))

(declare-fun lt!334564 () Unit!15099)

(declare-fun Unit!15131 () Unit!15099)

(assert (=> b!212103 (= lt!334564 Unit!15131)))

(declare-fun lt!334544 () (_ BitVec 64))

(assert (=> b!212103 (= lt!334544 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!334586 () (_ BitVec 64))

(assert (=> b!212103 (= lt!334586 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!334596 () Unit!15099)

(assert (=> b!212103 (= lt!334596 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9717 lt!333423) (buf!5142 (_2!9717 lt!334588)) lt!334586))))

(assert (=> b!212103 (validate_offset_bits!1 ((_ sign_extend 32) (size!4616 (buf!5142 (_2!9717 lt!334588)))) ((_ sign_extend 32) (currentByte!9702 (_2!9717 lt!333423))) ((_ sign_extend 32) (currentBit!9697 (_2!9717 lt!333423))) lt!334586)))

(declare-fun lt!334575 () Unit!15099)

(assert (=> b!212103 (= lt!334575 lt!334596)))

(declare-fun lt!334555 () tuple2!18118)

(assert (=> b!212103 (= lt!334555 (readNBitsLSBFirstsLoopPure!0 (_1!9715 lt!334545) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!334544))))

(declare-fun lt!334567 () (_ BitVec 64))

(assert (=> b!212103 (= lt!334567 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!334557 () Unit!15099)

(assert (=> b!212103 (= lt!334557 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9717 lt!334587) (buf!5142 (_2!9717 lt!334588)) lt!334567))))

(assert (=> b!212103 (validate_offset_bits!1 ((_ sign_extend 32) (size!4616 (buf!5142 (_2!9717 lt!334588)))) ((_ sign_extend 32) (currentByte!9702 (_2!9717 lt!334587))) ((_ sign_extend 32) (currentBit!9697 (_2!9717 lt!334587))) lt!334567)))

(declare-fun lt!334592 () Unit!15099)

(assert (=> b!212103 (= lt!334592 lt!334557)))

(declare-fun lt!334576 () tuple2!18118)

(assert (=> b!212103 (= lt!334576 (readNBitsLSBFirstsLoopPure!0 (_1!9715 lt!334583) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!334544 (ite (_2!9716 lt!334571) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!334574 () tuple2!18118)

(assert (=> b!212103 (= lt!334574 (readNBitsLSBFirstsLoopPure!0 (_1!9715 lt!334545) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!334544))))

(declare-fun c!10448 () Bool)

(assert (=> b!212103 (= c!10448 (_2!9716 (readBitPure!0 (_1!9715 lt!334545))))))

(declare-fun lt!334554 () tuple2!18118)

(assert (=> b!212103 (= lt!334554 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9715 lt!334545) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!334544 e!144568)))))

(declare-fun lt!334589 () Unit!15099)

(assert (=> b!212103 (= lt!334589 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9715 lt!334545) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!334544))))

(assert (=> b!212103 (and (= (_2!9714 lt!334574) (_2!9714 lt!334554)) (= (_1!9714 lt!334574) (_1!9714 lt!334554)))))

(declare-fun lt!334590 () Unit!15099)

(assert (=> b!212103 (= lt!334590 lt!334589)))

(assert (=> b!212103 (= (_1!9715 lt!334545) (withMovedBitIndex!0 (_2!9715 lt!334545) (bvsub (bitIndex!0 (size!4616 (buf!5142 (_2!9717 lt!333423))) (currentByte!9702 (_2!9717 lt!333423)) (currentBit!9697 (_2!9717 lt!333423))) (bitIndex!0 (size!4616 (buf!5142 (_2!9717 lt!334588))) (currentByte!9702 (_2!9717 lt!334588)) (currentBit!9697 (_2!9717 lt!334588))))))))

(declare-fun lt!334552 () Unit!15099)

(declare-fun Unit!15132 () Unit!15099)

(assert (=> b!212103 (= lt!334552 Unit!15132)))

(assert (=> b!212103 (= (_1!9715 lt!334583) (withMovedBitIndex!0 (_2!9715 lt!334583) (bvsub (bitIndex!0 (size!4616 (buf!5142 (_2!9717 lt!334587))) (currentByte!9702 (_2!9717 lt!334587)) (currentBit!9697 (_2!9717 lt!334587))) (bitIndex!0 (size!4616 (buf!5142 (_2!9717 lt!334588))) (currentByte!9702 (_2!9717 lt!334588)) (currentBit!9697 (_2!9717 lt!334588))))))))

(declare-fun lt!334570 () Unit!15099)

(declare-fun Unit!15133 () Unit!15099)

(assert (=> b!212103 (= lt!334570 Unit!15133)))

(assert (=> b!212103 (= (bitIndex!0 (size!4616 (buf!5142 (_2!9717 lt!333423))) (currentByte!9702 (_2!9717 lt!333423)) (currentBit!9697 (_2!9717 lt!333423))) (bvsub (bitIndex!0 (size!4616 (buf!5142 (_2!9717 lt!334587))) (currentByte!9702 (_2!9717 lt!334587)) (currentBit!9697 (_2!9717 lt!334587))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!334547 () Unit!15099)

(declare-fun Unit!15134 () Unit!15099)

(assert (=> b!212103 (= lt!334547 Unit!15134)))

(assert (=> b!212103 (= (_2!9714 lt!334555) (_2!9714 lt!334576))))

(declare-fun lt!334582 () Unit!15099)

(declare-fun Unit!15135 () Unit!15099)

(assert (=> b!212103 (= lt!334582 Unit!15135)))

(assert (=> b!212103 (invariant!0 (currentBit!9697 (_2!9717 lt!334588)) (currentByte!9702 (_2!9717 lt!334588)) (size!4616 (buf!5142 (_2!9717 lt!334588))))))

(declare-fun lt!334594 () Unit!15099)

(declare-fun Unit!15136 () Unit!15099)

(assert (=> b!212103 (= lt!334594 Unit!15136)))

(assert (=> b!212103 (= (size!4616 (buf!5142 (_2!9717 lt!333423))) (size!4616 (buf!5142 (_2!9717 lt!334588))))))

(declare-fun lt!334578 () Unit!15099)

(declare-fun Unit!15137 () Unit!15099)

(assert (=> b!212103 (= lt!334578 Unit!15137)))

(assert (=> b!212103 (= (bitIndex!0 (size!4616 (buf!5142 (_2!9717 lt!334588))) (currentByte!9702 (_2!9717 lt!334588)) (currentBit!9697 (_2!9717 lt!334588))) (bvsub (bvadd (bitIndex!0 (size!4616 (buf!5142 (_2!9717 lt!333423))) (currentByte!9702 (_2!9717 lt!333423)) (currentBit!9697 (_2!9717 lt!333423))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!334553 () Unit!15099)

(declare-fun Unit!15138 () Unit!15099)

(assert (=> b!212103 (= lt!334553 Unit!15138)))

(declare-fun lt!334546 () Unit!15099)

(declare-fun Unit!15139 () Unit!15099)

(assert (=> b!212103 (= lt!334546 Unit!15139)))

(declare-fun lt!334572 () tuple2!18120)

(assert (=> b!212103 (= lt!334572 (reader!0 (_2!9717 lt!333423) (_2!9717 lt!334588)))))

(declare-fun lt!334566 () (_ BitVec 64))

(assert (=> b!212103 (= lt!334566 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!334568 () Unit!15099)

(assert (=> b!212103 (= lt!334568 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9717 lt!333423) (buf!5142 (_2!9717 lt!334588)) lt!334566))))

(assert (=> b!212103 (validate_offset_bits!1 ((_ sign_extend 32) (size!4616 (buf!5142 (_2!9717 lt!334588)))) ((_ sign_extend 32) (currentByte!9702 (_2!9717 lt!333423))) ((_ sign_extend 32) (currentBit!9697 (_2!9717 lt!333423))) lt!334566)))

(declare-fun lt!334585 () Unit!15099)

(assert (=> b!212103 (= lt!334585 lt!334568)))

(declare-fun lt!334558 () tuple2!18118)

(assert (=> b!212103 (= lt!334558 (readNBitsLSBFirstsLoopPure!0 (_1!9715 lt!334572) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!178131 () Bool)

(assert (=> b!212103 (= res!178131 (= (_2!9714 lt!334558) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!144563 () Bool)

(assert (=> b!212103 (=> (not res!178131) (not e!144563))))

(assert (=> b!212103 e!144563))

(declare-fun lt!334550 () Unit!15099)

(declare-fun Unit!15140 () Unit!15099)

(assert (=> b!212103 (= lt!334550 Unit!15140)))

(declare-fun b!212104 () Bool)

(declare-fun e!144566 () Bool)

(declare-fun lt!334584 () tuple2!18122)

(assert (=> b!212104 (= e!144566 (= (bitIndex!0 (size!4616 (buf!5142 (_1!9716 lt!334584))) (currentByte!9702 (_1!9716 lt!334584)) (currentBit!9697 (_1!9716 lt!334584))) (bitIndex!0 (size!4616 (buf!5142 (_2!9717 lt!334548))) (currentByte!9702 (_2!9717 lt!334548)) (currentBit!9697 (_2!9717 lt!334548)))))))

(declare-fun b!212105 () Bool)

(declare-fun res!178132 () Bool)

(assert (=> b!212105 (= res!178132 (= (bitIndex!0 (size!4616 (buf!5142 (_2!9717 lt!334548))) (currentByte!9702 (_2!9717 lt!334548)) (currentBit!9697 (_2!9717 lt!334548))) (bvadd (bitIndex!0 (size!4616 (buf!5142 (_2!9717 lt!333423))) (currentByte!9702 (_2!9717 lt!333423)) (currentBit!9697 (_2!9717 lt!333423))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!212105 (=> (not res!178132) (not e!144569))))

(declare-fun b!212106 () Bool)

(declare-fun res!178130 () Bool)

(assert (=> b!212106 (=> (not res!178130) (not e!144561))))

(assert (=> b!212106 (= res!178130 (= (size!4616 (buf!5142 (_2!9717 lt!333423))) (size!4616 (buf!5142 (_2!9717 lt!334565)))))))

(declare-fun b!212107 () Bool)

(assert (=> b!212107 (= e!144562 (validate_offset_bits!1 ((_ sign_extend 32) (size!4616 (buf!5142 (_2!9717 lt!333423)))) ((_ sign_extend 32) (currentByte!9702 (_2!9717 lt!333423))) ((_ sign_extend 32) (currentBit!9697 (_2!9717 lt!333423))) lt!334593))))

(declare-fun b!212108 () Bool)

(assert (=> b!212108 (= e!144563 (= (_1!9714 lt!334558) (_2!9715 lt!334572)))))

(declare-fun b!212109 () Bool)

(assert (=> b!212109 (= lt!334584 (readBitPure!0 (readerFrom!0 (_2!9717 lt!334548) (currentBit!9697 (_2!9717 lt!333423)) (currentByte!9702 (_2!9717 lt!333423)))))))

(declare-fun res!178129 () Bool)

(assert (=> b!212109 (= res!178129 (and (= (_2!9716 lt!334584) lt!334595) (= (_1!9716 lt!334584) (_2!9717 lt!334548))))))

(assert (=> b!212109 (=> (not res!178129) (not e!144566))))

(assert (=> b!212109 (= e!144569 e!144566)))

(declare-fun b!212110 () Bool)

(declare-fun Unit!15141 () Unit!15099)

(assert (=> b!212110 (= e!144567 (tuple2!18125 Unit!15141 (_2!9717 lt!333423)))))

(declare-fun lt!334556 () Unit!15099)

(assert (=> b!212110 (= lt!334556 (lemmaIsPrefixRefl!0 (_2!9717 lt!333423)))))

(declare-fun call!3342 () Bool)

(assert (=> b!212110 call!3342))

(declare-fun lt!334543 () Unit!15099)

(assert (=> b!212110 (= lt!334543 lt!334556)))

(declare-fun d!71945 () Bool)

(assert (=> d!71945 e!144561))

(declare-fun res!178138 () Bool)

(assert (=> d!71945 (=> (not res!178138) (not e!144561))))

(assert (=> d!71945 (= res!178138 (invariant!0 (currentBit!9697 (_2!9717 lt!334565)) (currentByte!9702 (_2!9717 lt!334565)) (size!4616 (buf!5142 (_2!9717 lt!334565)))))))

(assert (=> d!71945 (= lt!334565 e!144567)))

(declare-fun c!10447 () Bool)

(assert (=> d!71945 (= c!10447 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!71945 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!71945 (= (appendBitsLSBFirstLoopTR!0 (_2!9717 lt!333423) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!334565)))

(declare-fun b!212101 () Bool)

(assert (=> b!212101 (= e!144568 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun bm!3339 () Bool)

(assert (=> bm!3339 (= call!3342 (isPrefixOf!0 (_2!9717 lt!333423) (ite c!10447 (_2!9717 lt!333423) (_2!9717 lt!334548))))))

(declare-fun b!212111 () Bool)

(declare-fun res!178127 () Bool)

(assert (=> b!212111 (=> (not res!178127) (not e!144561))))

(declare-fun lt!334561 () (_ BitVec 64))

(declare-fun lt!334597 () (_ BitVec 64))

(assert (=> b!212111 (= res!178127 (= (bitIndex!0 (size!4616 (buf!5142 (_2!9717 lt!334565))) (currentByte!9702 (_2!9717 lt!334565)) (currentBit!9697 (_2!9717 lt!334565))) (bvsub lt!334597 lt!334561)))))

(assert (=> b!212111 (or (= (bvand lt!334597 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!334561 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!334597 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!334597 lt!334561) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212111 (= lt!334561 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!334562 () (_ BitVec 64))

(declare-fun lt!334551 () (_ BitVec 64))

(assert (=> b!212111 (= lt!334597 (bvadd lt!334562 lt!334551))))

(assert (=> b!212111 (or (not (= (bvand lt!334562 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!334551 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!334562 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!334562 lt!334551) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212111 (= lt!334551 ((_ sign_extend 32) nBits!348))))

(assert (=> b!212111 (= lt!334562 (bitIndex!0 (size!4616 (buf!5142 (_2!9717 lt!333423))) (currentByte!9702 (_2!9717 lt!333423)) (currentBit!9697 (_2!9717 lt!333423))))))

(declare-fun b!212112 () Bool)

(declare-fun res!178135 () Bool)

(assert (=> b!212112 (= res!178135 call!3342)))

(assert (=> b!212112 (=> (not res!178135) (not e!144569))))

(declare-fun b!212113 () Bool)

(assert (=> b!212113 (= e!144565 (= (_2!9716 lt!334549) (_2!9716 lt!334563)))))

(assert (= (and d!71945 c!10447) b!212110))

(assert (= (and d!71945 (not c!10447)) b!212103))

(assert (= (and b!212103 res!178134) b!212105))

(assert (= (and b!212105 res!178132) b!212112))

(assert (= (and b!212112 res!178135) b!212109))

(assert (= (and b!212109 res!178129) b!212104))

(assert (= (and b!212103 res!178128) b!212113))

(assert (= (and b!212103 c!10448) b!212098))

(assert (= (and b!212103 (not c!10448)) b!212101))

(assert (= (and b!212103 res!178131) b!212108))

(assert (= (or b!212110 b!212112) bm!3339))

(assert (= (and d!71945 res!178138) b!212106))

(assert (= (and b!212106 res!178130) b!212111))

(assert (= (and b!212111 res!178127) b!212099))

(assert (= (and b!212099 res!178133) b!212102))

(assert (= (and b!212102 res!178136) b!212107))

(assert (= (and b!212102 res!178137) b!212100))

(declare-fun m!327049 () Bool)

(assert (=> b!212099 m!327049))

(declare-fun m!327051 () Bool)

(assert (=> b!212103 m!327051))

(declare-fun m!327053 () Bool)

(assert (=> b!212103 m!327053))

(declare-fun m!327055 () Bool)

(assert (=> b!212103 m!327055))

(declare-fun m!327057 () Bool)

(assert (=> b!212103 m!327057))

(declare-fun m!327059 () Bool)

(assert (=> b!212103 m!327059))

(declare-fun m!327061 () Bool)

(assert (=> b!212103 m!327061))

(declare-fun m!327063 () Bool)

(assert (=> b!212103 m!327063))

(declare-fun m!327065 () Bool)

(assert (=> b!212103 m!327065))

(declare-fun m!327067 () Bool)

(assert (=> b!212103 m!327067))

(assert (=> b!212103 m!326317))

(declare-fun m!327069 () Bool)

(assert (=> b!212103 m!327069))

(declare-fun m!327071 () Bool)

(assert (=> b!212103 m!327071))

(declare-fun m!327073 () Bool)

(assert (=> b!212103 m!327073))

(declare-fun m!327075 () Bool)

(assert (=> b!212103 m!327075))

(declare-fun m!327077 () Bool)

(assert (=> b!212103 m!327077))

(declare-fun m!327079 () Bool)

(assert (=> b!212103 m!327079))

(declare-fun m!327081 () Bool)

(assert (=> b!212103 m!327081))

(declare-fun m!327083 () Bool)

(assert (=> b!212103 m!327083))

(declare-fun m!327085 () Bool)

(assert (=> b!212103 m!327085))

(declare-fun m!327087 () Bool)

(assert (=> b!212103 m!327087))

(declare-fun m!327089 () Bool)

(assert (=> b!212103 m!327089))

(declare-fun m!327091 () Bool)

(assert (=> b!212103 m!327091))

(declare-fun m!327093 () Bool)

(assert (=> b!212103 m!327093))

(declare-fun m!327095 () Bool)

(assert (=> b!212103 m!327095))

(declare-fun m!327097 () Bool)

(assert (=> b!212103 m!327097))

(assert (=> b!212103 m!327097))

(declare-fun m!327099 () Bool)

(assert (=> b!212103 m!327099))

(declare-fun m!327101 () Bool)

(assert (=> b!212103 m!327101))

(declare-fun m!327103 () Bool)

(assert (=> b!212103 m!327103))

(declare-fun m!327105 () Bool)

(assert (=> b!212103 m!327105))

(declare-fun m!327107 () Bool)

(assert (=> b!212103 m!327107))

(declare-fun m!327109 () Bool)

(assert (=> b!212103 m!327109))

(declare-fun m!327111 () Bool)

(assert (=> b!212103 m!327111))

(declare-fun m!327113 () Bool)

(assert (=> b!212103 m!327113))

(declare-fun m!327115 () Bool)

(assert (=> b!212103 m!327115))

(declare-fun m!327117 () Bool)

(assert (=> b!212104 m!327117))

(declare-fun m!327119 () Bool)

(assert (=> b!212104 m!327119))

(declare-fun m!327121 () Bool)

(assert (=> d!71945 m!327121))

(declare-fun m!327123 () Bool)

(assert (=> bm!3339 m!327123))

(declare-fun m!327125 () Bool)

(assert (=> b!212111 m!327125))

(assert (=> b!212111 m!326317))

(declare-fun m!327127 () Bool)

(assert (=> b!212107 m!327127))

(assert (=> b!212105 m!327119))

(assert (=> b!212105 m!326317))

(declare-fun m!327129 () Bool)

(assert (=> b!212102 m!327129))

(declare-fun m!327131 () Bool)

(assert (=> b!212102 m!327131))

(declare-fun m!327133 () Bool)

(assert (=> b!212102 m!327133))

(assert (=> b!212102 m!327113))

(declare-fun m!327135 () Bool)

(assert (=> b!212102 m!327135))

(assert (=> b!212102 m!327061))

(assert (=> b!212110 m!326999))

(declare-fun m!327137 () Bool)

(assert (=> b!212109 m!327137))

(assert (=> b!212109 m!327137))

(declare-fun m!327139 () Bool)

(assert (=> b!212109 m!327139))

(assert (=> b!211693 d!71945))

(declare-fun d!71947 () Bool)

(declare-fun e!144570 () Bool)

(assert (=> d!71947 e!144570))

(declare-fun res!178139 () Bool)

(assert (=> d!71947 (=> (not res!178139) (not e!144570))))

(declare-fun lt!334604 () (_ BitVec 64))

(declare-fun lt!334599 () (_ BitVec 64))

(declare-fun lt!334602 () (_ BitVec 64))

(assert (=> d!71947 (= res!178139 (= lt!334604 (bvsub lt!334602 lt!334599)))))

(assert (=> d!71947 (or (= (bvand lt!334602 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!334599 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!334602 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!334602 lt!334599) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71947 (= lt!334599 (remainingBits!0 ((_ sign_extend 32) (size!4616 (buf!5142 (_2!9717 lt!333423)))) ((_ sign_extend 32) (currentByte!9702 (_2!9717 lt!333423))) ((_ sign_extend 32) (currentBit!9697 (_2!9717 lt!333423)))))))

(declare-fun lt!334601 () (_ BitVec 64))

(declare-fun lt!334603 () (_ BitVec 64))

(assert (=> d!71947 (= lt!334602 (bvmul lt!334601 lt!334603))))

(assert (=> d!71947 (or (= lt!334601 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!334603 (bvsdiv (bvmul lt!334601 lt!334603) lt!334601)))))

(assert (=> d!71947 (= lt!334603 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71947 (= lt!334601 ((_ sign_extend 32) (size!4616 (buf!5142 (_2!9717 lt!333423)))))))

(assert (=> d!71947 (= lt!334604 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9702 (_2!9717 lt!333423))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9697 (_2!9717 lt!333423)))))))

(assert (=> d!71947 (invariant!0 (currentBit!9697 (_2!9717 lt!333423)) (currentByte!9702 (_2!9717 lt!333423)) (size!4616 (buf!5142 (_2!9717 lt!333423))))))

(assert (=> d!71947 (= (bitIndex!0 (size!4616 (buf!5142 (_2!9717 lt!333423))) (currentByte!9702 (_2!9717 lt!333423)) (currentBit!9697 (_2!9717 lt!333423))) lt!334604)))

(declare-fun b!212114 () Bool)

(declare-fun res!178140 () Bool)

(assert (=> b!212114 (=> (not res!178140) (not e!144570))))

(assert (=> b!212114 (= res!178140 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!334604))))

(declare-fun b!212115 () Bool)

(declare-fun lt!334600 () (_ BitVec 64))

(assert (=> b!212115 (= e!144570 (bvsle lt!334604 (bvmul lt!334600 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!212115 (or (= lt!334600 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!334600 #b0000000000000000000000000000000000000000000000000000000000001000) lt!334600)))))

(assert (=> b!212115 (= lt!334600 ((_ sign_extend 32) (size!4616 (buf!5142 (_2!9717 lt!333423)))))))

(assert (= (and d!71947 res!178139) b!212114))

(assert (= (and b!212114 res!178140) b!212115))

(declare-fun m!327141 () Bool)

(assert (=> d!71947 m!327141))

(assert (=> d!71947 m!327029))

(assert (=> b!211694 d!71947))

(declare-fun d!71949 () Bool)

(declare-fun e!144571 () Bool)

(assert (=> d!71949 e!144571))

(declare-fun res!178141 () Bool)

(assert (=> d!71949 (=> (not res!178141) (not e!144571))))

(declare-fun lt!334610 () (_ BitVec 64))

(declare-fun lt!334608 () (_ BitVec 64))

(declare-fun lt!334605 () (_ BitVec 64))

(assert (=> d!71949 (= res!178141 (= lt!334610 (bvsub lt!334608 lt!334605)))))

(assert (=> d!71949 (or (= (bvand lt!334608 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!334605 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!334608 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!334608 lt!334605) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71949 (= lt!334605 (remainingBits!0 ((_ sign_extend 32) (size!4616 (buf!5142 thiss!1204))) ((_ sign_extend 32) (currentByte!9702 thiss!1204)) ((_ sign_extend 32) (currentBit!9697 thiss!1204))))))

(declare-fun lt!334607 () (_ BitVec 64))

(declare-fun lt!334609 () (_ BitVec 64))

(assert (=> d!71949 (= lt!334608 (bvmul lt!334607 lt!334609))))

(assert (=> d!71949 (or (= lt!334607 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!334609 (bvsdiv (bvmul lt!334607 lt!334609) lt!334607)))))

(assert (=> d!71949 (= lt!334609 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71949 (= lt!334607 ((_ sign_extend 32) (size!4616 (buf!5142 thiss!1204))))))

(assert (=> d!71949 (= lt!334610 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9702 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9697 thiss!1204))))))

(assert (=> d!71949 (invariant!0 (currentBit!9697 thiss!1204) (currentByte!9702 thiss!1204) (size!4616 (buf!5142 thiss!1204)))))

(assert (=> d!71949 (= (bitIndex!0 (size!4616 (buf!5142 thiss!1204)) (currentByte!9702 thiss!1204) (currentBit!9697 thiss!1204)) lt!334610)))

(declare-fun b!212116 () Bool)

(declare-fun res!178142 () Bool)

(assert (=> b!212116 (=> (not res!178142) (not e!144571))))

(assert (=> b!212116 (= res!178142 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!334610))))

(declare-fun b!212117 () Bool)

(declare-fun lt!334606 () (_ BitVec 64))

(assert (=> b!212117 (= e!144571 (bvsle lt!334610 (bvmul lt!334606 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!212117 (or (= lt!334606 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!334606 #b0000000000000000000000000000000000000000000000000000000000001000) lt!334606)))))

(assert (=> b!212117 (= lt!334606 ((_ sign_extend 32) (size!4616 (buf!5142 thiss!1204))))))

(assert (= (and d!71949 res!178141) b!212116))

(assert (= (and b!212116 res!178142) b!212117))

(assert (=> d!71949 m!326801))

(assert (=> d!71949 m!326321))

(assert (=> b!211694 d!71949))

(assert (=> b!211690 d!71923))

(declare-fun d!71951 () Bool)

(assert (=> d!71951 (= (invariant!0 (currentBit!9697 thiss!1204) (currentByte!9702 thiss!1204) (size!4616 (buf!5142 thiss!1204))) (and (bvsge (currentBit!9697 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9697 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9702 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9702 thiss!1204) (size!4616 (buf!5142 thiss!1204))) (and (= (currentBit!9697 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9702 thiss!1204) (size!4616 (buf!5142 thiss!1204)))))))))

(assert (=> b!211701 d!71951))

(declare-fun d!71953 () Bool)

(declare-fun res!178144 () Bool)

(declare-fun e!144573 () Bool)

(assert (=> d!71953 (=> (not res!178144) (not e!144573))))

(assert (=> d!71953 (= res!178144 (= (size!4616 (buf!5142 (_2!9717 lt!333423))) (size!4616 (buf!5142 (_2!9717 lt!333430)))))))

(assert (=> d!71953 (= (isPrefixOf!0 (_2!9717 lt!333423) (_2!9717 lt!333430)) e!144573)))

(declare-fun b!212118 () Bool)

(declare-fun res!178143 () Bool)

(assert (=> b!212118 (=> (not res!178143) (not e!144573))))

(assert (=> b!212118 (= res!178143 (bvsle (bitIndex!0 (size!4616 (buf!5142 (_2!9717 lt!333423))) (currentByte!9702 (_2!9717 lt!333423)) (currentBit!9697 (_2!9717 lt!333423))) (bitIndex!0 (size!4616 (buf!5142 (_2!9717 lt!333430))) (currentByte!9702 (_2!9717 lt!333430)) (currentBit!9697 (_2!9717 lt!333430)))))))

(declare-fun b!212119 () Bool)

(declare-fun e!144572 () Bool)

(assert (=> b!212119 (= e!144573 e!144572)))

(declare-fun res!178145 () Bool)

(assert (=> b!212119 (=> res!178145 e!144572)))

(assert (=> b!212119 (= res!178145 (= (size!4616 (buf!5142 (_2!9717 lt!333423))) #b00000000000000000000000000000000))))

(declare-fun b!212120 () Bool)

(assert (=> b!212120 (= e!144572 (arrayBitRangesEq!0 (buf!5142 (_2!9717 lt!333423)) (buf!5142 (_2!9717 lt!333430)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4616 (buf!5142 (_2!9717 lt!333423))) (currentByte!9702 (_2!9717 lt!333423)) (currentBit!9697 (_2!9717 lt!333423)))))))

(assert (= (and d!71953 res!178144) b!212118))

(assert (= (and b!212118 res!178143) b!212119))

(assert (= (and b!212119 (not res!178145)) b!212120))

(assert (=> b!212118 m!326317))

(assert (=> b!212118 m!326301))

(assert (=> b!212120 m!326317))

(assert (=> b!212120 m!326317))

(declare-fun m!327143 () Bool)

(assert (=> b!212120 m!327143))

(assert (=> b!211691 d!71953))

(assert (=> b!211692 d!71947))

(assert (=> b!211692 d!71949))

(declare-fun b!212130 () Bool)

(declare-fun res!178157 () Bool)

(declare-fun e!144578 () Bool)

(assert (=> b!212130 (=> (not res!178157) (not e!144578))))

(declare-fun lt!334620 () (_ BitVec 64))

(declare-fun lt!334622 () (_ BitVec 64))

(declare-fun lt!334621 () tuple2!18124)

(assert (=> b!212130 (= res!178157 (= (bitIndex!0 (size!4616 (buf!5142 (_2!9717 lt!334621))) (currentByte!9702 (_2!9717 lt!334621)) (currentBit!9697 (_2!9717 lt!334621))) (bvadd lt!334622 lt!334620)))))

(assert (=> b!212130 (or (not (= (bvand lt!334622 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!334620 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!334622 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!334622 lt!334620) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212130 (= lt!334620 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!212130 (= lt!334622 (bitIndex!0 (size!4616 (buf!5142 thiss!1204)) (currentByte!9702 thiss!1204) (currentBit!9697 thiss!1204)))))

(declare-fun d!71955 () Bool)

(assert (=> d!71955 e!144578))

(declare-fun res!178154 () Bool)

(assert (=> d!71955 (=> (not res!178154) (not e!144578))))

(assert (=> d!71955 (= res!178154 (= (size!4616 (buf!5142 thiss!1204)) (size!4616 (buf!5142 (_2!9717 lt!334621)))))))

(declare-fun choose!16 (BitStream!8340 Bool) tuple2!18124)

(assert (=> d!71955 (= lt!334621 (choose!16 thiss!1204 lt!333426))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!71955 (validate_offset_bit!0 ((_ sign_extend 32) (size!4616 (buf!5142 thiss!1204))) ((_ sign_extend 32) (currentByte!9702 thiss!1204)) ((_ sign_extend 32) (currentBit!9697 thiss!1204)))))

(assert (=> d!71955 (= (appendBit!0 thiss!1204 lt!333426) lt!334621)))

(declare-fun b!212133 () Bool)

(declare-fun e!144579 () Bool)

(declare-fun lt!334619 () tuple2!18122)

(assert (=> b!212133 (= e!144579 (= (bitIndex!0 (size!4616 (buf!5142 (_1!9716 lt!334619))) (currentByte!9702 (_1!9716 lt!334619)) (currentBit!9697 (_1!9716 lt!334619))) (bitIndex!0 (size!4616 (buf!5142 (_2!9717 lt!334621))) (currentByte!9702 (_2!9717 lt!334621)) (currentBit!9697 (_2!9717 lt!334621)))))))

(declare-fun b!212132 () Bool)

(assert (=> b!212132 (= e!144578 e!144579)))

(declare-fun res!178156 () Bool)

(assert (=> b!212132 (=> (not res!178156) (not e!144579))))

(assert (=> b!212132 (= res!178156 (and (= (_2!9716 lt!334619) lt!333426) (= (_1!9716 lt!334619) (_2!9717 lt!334621))))))

(assert (=> b!212132 (= lt!334619 (readBitPure!0 (readerFrom!0 (_2!9717 lt!334621) (currentBit!9697 thiss!1204) (currentByte!9702 thiss!1204))))))

(declare-fun b!212131 () Bool)

(declare-fun res!178155 () Bool)

(assert (=> b!212131 (=> (not res!178155) (not e!144578))))

(assert (=> b!212131 (= res!178155 (isPrefixOf!0 thiss!1204 (_2!9717 lt!334621)))))

(assert (= (and d!71955 res!178154) b!212130))

(assert (= (and b!212130 res!178157) b!212131))

(assert (= (and b!212131 res!178155) b!212132))

(assert (= (and b!212132 res!178156) b!212133))

(declare-fun m!327145 () Bool)

(assert (=> d!71955 m!327145))

(declare-fun m!327147 () Bool)

(assert (=> d!71955 m!327147))

(declare-fun m!327149 () Bool)

(assert (=> b!212132 m!327149))

(assert (=> b!212132 m!327149))

(declare-fun m!327151 () Bool)

(assert (=> b!212132 m!327151))

(declare-fun m!327153 () Bool)

(assert (=> b!212130 m!327153))

(assert (=> b!212130 m!326319))

(declare-fun m!327155 () Bool)

(assert (=> b!212133 m!327155))

(assert (=> b!212133 m!327153))

(declare-fun m!327157 () Bool)

(assert (=> b!212131 m!327157))

(assert (=> b!211692 d!71955))

(check-sat (not d!71857) (not b!212120) (not b!212132) (not d!71851) (not b!212028) (not b!212118) (not b!212099) (not b!212051) (not d!71859) (not b!212026) (not d!71919) (not b!212027) (not d!71943) (not d!71933) (not bm!3339) (not d!71869) (not d!71937) (not d!71913) (not b!212130) (not d!71935) (not d!71929) (not d!71939) (not b!212065) (not d!71907) (not b!212102) (not b!212043) (not d!71863) (not d!71925) (not b!212109) (not d!71917) (not b!212131) (not b!212110) (not b!212111) (not d!71867) (not d!71847) (not d!71947) (not b!212105) (not b!212133) (not d!71915) (not d!71955) (not d!71855) (not d!71949) (not b!212044) (not b!212053) (not b!212041) (not b!212103) (not b!212025) (not d!71945) (not d!71927) (not d!71921) (not d!71909) (not b!212042) (not b!212063) (not d!71911) (not b!212104) (not d!71931) (not d!71865) (not b!212057) (not b!212107))
