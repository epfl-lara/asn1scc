; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42102 () Bool)

(assert start!42102)

(declare-fun b!198693 () Bool)

(declare-fun res!166333 () Bool)

(declare-fun e!136402 () Bool)

(assert (=> b!198693 (=> res!166333 e!136402)))

(declare-datatypes ((array!10116 0))(
  ( (array!10117 (arr!5388 (Array (_ BitVec 32) (_ BitVec 8))) (size!4458 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8024 0))(
  ( (BitStream!8025 (buf!4950 array!10116) (currentByte!9297 (_ BitVec 32)) (currentBit!9292 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14062 0))(
  ( (Unit!14063) )
))
(declare-datatypes ((tuple2!17124 0))(
  ( (tuple2!17125 (_1!9210 Unit!14062) (_2!9210 BitStream!8024)) )
))
(declare-fun lt!309690 () tuple2!17124)

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!309682 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun thiss!1204 () BitStream!8024)

(declare-fun lt!309677 () (_ BitVec 64))

(assert (=> b!198693 (= res!166333 (or (not (= (size!4458 (buf!4950 (_2!9210 lt!309690))) (size!4458 (buf!4950 thiss!1204)))) (not (= lt!309677 (bvsub (bvadd lt!309682 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!198694 () Bool)

(declare-fun e!136397 () Bool)

(declare-datatypes ((tuple2!17126 0))(
  ( (tuple2!17127 (_1!9211 BitStream!8024) (_2!9211 Bool)) )
))
(declare-fun lt!309695 () tuple2!17126)

(declare-fun lt!309692 () tuple2!17126)

(assert (=> b!198694 (= e!136397 (= (_2!9211 lt!309695) (_2!9211 lt!309692)))))

(declare-fun b!198695 () Bool)

(declare-fun e!136399 () Bool)

(declare-fun e!136396 () Bool)

(assert (=> b!198695 (= e!136399 (not e!136396))))

(declare-fun res!166330 () Bool)

(assert (=> b!198695 (=> res!166330 e!136396)))

(declare-fun lt!309685 () (_ BitVec 64))

(assert (=> b!198695 (= res!166330 (not (= lt!309685 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!309682))))))

(declare-fun lt!309686 () tuple2!17124)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!198695 (= lt!309685 (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))))))

(assert (=> b!198695 (= lt!309682 (bitIndex!0 (size!4458 (buf!4950 thiss!1204)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)))))

(declare-fun e!136406 () Bool)

(assert (=> b!198695 e!136406))

(declare-fun res!166328 () Bool)

(assert (=> b!198695 (=> (not res!166328) (not e!136406))))

(assert (=> b!198695 (= res!166328 (= (size!4458 (buf!4950 thiss!1204)) (size!4458 (buf!4950 (_2!9210 lt!309686)))))))

(declare-fun lt!309698 () Bool)

(declare-fun appendBit!0 (BitStream!8024 Bool) tuple2!17124)

(assert (=> b!198695 (= lt!309686 (appendBit!0 thiss!1204 lt!309698))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!309697 () (_ BitVec 64))

(assert (=> b!198695 (= lt!309698 (not (= (bvand v!189 lt!309697) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198695 (= lt!309697 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!198696 () Bool)

(declare-fun res!166347 () Bool)

(declare-fun e!136401 () Bool)

(assert (=> b!198696 (=> (not res!166347) (not e!136401))))

(declare-datatypes ((tuple2!17128 0))(
  ( (tuple2!17129 (_1!9212 BitStream!8024) (_2!9212 BitStream!8024)) )
))
(declare-fun lt!309700 () tuple2!17128)

(declare-fun withMovedBitIndex!0 (BitStream!8024 (_ BitVec 64)) BitStream!8024)

(assert (=> b!198696 (= res!166347 (= (_1!9212 lt!309700) (withMovedBitIndex!0 (_2!9212 lt!309700) (bvsub lt!309685 lt!309677))))))

(declare-fun b!198698 () Bool)

(declare-fun e!136394 () Bool)

(declare-fun lt!309699 () BitStream!8024)

(assert (=> b!198698 (= e!136394 (= (_1!9212 lt!309700) lt!309699))))

(assert (=> b!198698 e!136401))

(declare-fun res!166340 () Bool)

(assert (=> b!198698 (=> (not res!166340) (not e!136401))))

(declare-datatypes ((tuple2!17130 0))(
  ( (tuple2!17131 (_1!9213 BitStream!8024) (_2!9213 (_ BitVec 64))) )
))
(declare-fun lt!309678 () tuple2!17130)

(declare-fun lt!309694 () tuple2!17130)

(assert (=> b!198698 (= res!166340 (and (= (_2!9213 lt!309678) (_2!9213 lt!309694)) (= (_1!9213 lt!309678) (_1!9213 lt!309694))))))

(declare-fun lt!309674 () (_ BitVec 64))

(declare-fun lt!309684 () tuple2!17128)

(declare-fun lt!309679 () Unit!14062)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8024 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14062)

(assert (=> b!198698 (= lt!309679 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9212 lt!309684) nBits!348 i!590 lt!309674))))

(declare-fun lt!309673 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8024 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17130)

(assert (=> b!198698 (= lt!309694 (readNBitsLSBFirstsLoopPure!0 lt!309699 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!309673))))

(assert (=> b!198698 (= lt!309699 (withMovedBitIndex!0 (_1!9212 lt!309684) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!198699 () Bool)

(declare-fun e!136403 () Bool)

(declare-fun lt!309681 () tuple2!17126)

(declare-fun lt!309687 () (_ BitVec 64))

(assert (=> b!198699 (= e!136403 (= (bitIndex!0 (size!4458 (buf!4950 (_1!9211 lt!309681))) (currentByte!9297 (_1!9211 lt!309681)) (currentBit!9292 (_1!9211 lt!309681))) lt!309687))))

(declare-fun b!198700 () Bool)

(declare-fun res!166341 () Bool)

(assert (=> b!198700 (=> (not res!166341) (not e!136399))))

(assert (=> b!198700 (= res!166341 (not (= i!590 nBits!348)))))

(declare-fun b!198701 () Bool)

(declare-fun res!166342 () Bool)

(assert (=> b!198701 (=> (not res!166342) (not e!136401))))

(assert (=> b!198701 (= res!166342 (= (_1!9212 lt!309684) (withMovedBitIndex!0 (_2!9212 lt!309684) (bvsub lt!309682 lt!309677))))))

(declare-fun b!198702 () Bool)

(declare-fun res!166339 () Bool)

(assert (=> b!198702 (=> res!166339 e!136402)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!198702 (= res!166339 (not (invariant!0 (currentBit!9292 (_2!9210 lt!309690)) (currentByte!9297 (_2!9210 lt!309690)) (size!4458 (buf!4950 (_2!9210 lt!309690))))))))

(declare-fun b!198703 () Bool)

(declare-fun res!166345 () Bool)

(assert (=> b!198703 (=> res!166345 e!136402)))

(declare-fun isPrefixOf!0 (BitStream!8024 BitStream!8024) Bool)

(assert (=> b!198703 (= res!166345 (not (isPrefixOf!0 (_2!9210 lt!309686) (_2!9210 lt!309690))))))

(declare-fun b!198704 () Bool)

(declare-fun e!136395 () Bool)

(assert (=> b!198704 (= e!136395 e!136399)))

(declare-fun res!166335 () Bool)

(assert (=> b!198704 (=> (not res!166335) (not e!136399))))

(declare-fun lt!309680 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!198704 (= res!166335 (validate_offset_bits!1 ((_ sign_extend 32) (size!4458 (buf!4950 thiss!1204))) ((_ sign_extend 32) (currentByte!9297 thiss!1204)) ((_ sign_extend 32) (currentBit!9292 thiss!1204)) lt!309680))))

(assert (=> b!198704 (= lt!309680 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!198705 () Bool)

(declare-fun e!136400 () Bool)

(declare-fun array_inv!4199 (array!10116) Bool)

(assert (=> b!198705 (= e!136400 (array_inv!4199 (buf!4950 thiss!1204)))))

(declare-fun b!198706 () Bool)

(declare-fun e!136404 () Bool)

(assert (=> b!198706 (= e!136404 (invariant!0 (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204) (size!4458 (buf!4950 (_2!9210 lt!309690)))))))

(declare-fun b!198707 () Bool)

(assert (=> b!198707 (= e!136401 (= lt!309682 (bvsub lt!309685 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!198697 () Bool)

(assert (=> b!198697 (= e!136402 e!136394)))

(declare-fun res!166334 () Bool)

(assert (=> b!198697 (=> res!166334 e!136394)))

(assert (=> b!198697 (= res!166334 (not (= (_1!9213 (readNBitsLSBFirstsLoopPure!0 (_1!9212 lt!309700) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!309673)) (_2!9212 lt!309700))))))

(declare-fun lt!309683 () (_ BitVec 64))

(assert (=> b!198697 (validate_offset_bits!1 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!309690)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309686))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309686))) lt!309683)))

(declare-fun lt!309691 () Unit!14062)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8024 array!10116 (_ BitVec 64)) Unit!14062)

(assert (=> b!198697 (= lt!309691 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9210 lt!309686) (buf!4950 (_2!9210 lt!309690)) lt!309683))))

(assert (=> b!198697 (= lt!309683 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!309676 () tuple2!17126)

(assert (=> b!198697 (= lt!309673 (bvor lt!309674 (ite (_2!9211 lt!309676) lt!309697 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198697 (= lt!309678 (readNBitsLSBFirstsLoopPure!0 (_1!9212 lt!309684) nBits!348 i!590 lt!309674))))

(assert (=> b!198697 (validate_offset_bits!1 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!309690)))) ((_ sign_extend 32) (currentByte!9297 thiss!1204)) ((_ sign_extend 32) (currentBit!9292 thiss!1204)) lt!309680)))

(declare-fun lt!309696 () Unit!14062)

(assert (=> b!198697 (= lt!309696 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4950 (_2!9210 lt!309690)) lt!309680))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!198697 (= lt!309674 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!198697 (= (_2!9211 lt!309676) lt!309698)))

(declare-fun readBitPure!0 (BitStream!8024) tuple2!17126)

(assert (=> b!198697 (= lt!309676 (readBitPure!0 (_1!9212 lt!309684)))))

(declare-fun reader!0 (BitStream!8024 BitStream!8024) tuple2!17128)

(assert (=> b!198697 (= lt!309700 (reader!0 (_2!9210 lt!309686) (_2!9210 lt!309690)))))

(assert (=> b!198697 (= lt!309684 (reader!0 thiss!1204 (_2!9210 lt!309690)))))

(assert (=> b!198697 e!136397))

(declare-fun res!166343 () Bool)

(assert (=> b!198697 (=> (not res!166343) (not e!136397))))

(assert (=> b!198697 (= res!166343 (= (bitIndex!0 (size!4458 (buf!4950 (_1!9211 lt!309695))) (currentByte!9297 (_1!9211 lt!309695)) (currentBit!9292 (_1!9211 lt!309695))) (bitIndex!0 (size!4458 (buf!4950 (_1!9211 lt!309692))) (currentByte!9297 (_1!9211 lt!309692)) (currentBit!9292 (_1!9211 lt!309692)))))))

(declare-fun lt!309689 () Unit!14062)

(declare-fun lt!309693 () BitStream!8024)

(declare-fun readBitPrefixLemma!0 (BitStream!8024 BitStream!8024) Unit!14062)

(assert (=> b!198697 (= lt!309689 (readBitPrefixLemma!0 lt!309693 (_2!9210 lt!309690)))))

(assert (=> b!198697 (= lt!309692 (readBitPure!0 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204))))))

(assert (=> b!198697 (= lt!309695 (readBitPure!0 lt!309693))))

(assert (=> b!198697 e!136404))

(declare-fun res!166331 () Bool)

(assert (=> b!198697 (=> (not res!166331) (not e!136404))))

(assert (=> b!198697 (= res!166331 (invariant!0 (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204) (size!4458 (buf!4950 (_2!9210 lt!309686)))))))

(assert (=> b!198697 (= lt!309693 (BitStream!8025 (buf!4950 (_2!9210 lt!309686)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)))))

(declare-fun res!166332 () Bool)

(assert (=> start!42102 (=> (not res!166332) (not e!136395))))

(assert (=> start!42102 (= res!166332 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42102 e!136395))

(assert (=> start!42102 true))

(declare-fun inv!12 (BitStream!8024) Bool)

(assert (=> start!42102 (and (inv!12 thiss!1204) e!136400)))

(declare-fun b!198708 () Bool)

(assert (=> b!198708 (= e!136396 e!136402)))

(declare-fun res!166336 () Bool)

(assert (=> b!198708 (=> res!166336 e!136402)))

(assert (=> b!198708 (= res!166336 (not (= lt!309677 (bvsub (bvsub (bvadd lt!309685 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!198708 (= lt!309677 (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309690))) (currentByte!9297 (_2!9210 lt!309690)) (currentBit!9292 (_2!9210 lt!309690))))))

(assert (=> b!198708 (isPrefixOf!0 thiss!1204 (_2!9210 lt!309690))))

(declare-fun lt!309688 () Unit!14062)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8024 BitStream!8024 BitStream!8024) Unit!14062)

(assert (=> b!198708 (= lt!309688 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9210 lt!309686) (_2!9210 lt!309690)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8024 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17124)

(assert (=> b!198708 (= lt!309690 (appendBitsLSBFirstLoopTR!0 (_2!9210 lt!309686) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!198709 () Bool)

(declare-fun res!166329 () Bool)

(declare-fun e!136405 () Bool)

(assert (=> b!198709 (=> (not res!166329) (not e!136405))))

(assert (=> b!198709 (= res!166329 (isPrefixOf!0 thiss!1204 (_2!9210 lt!309686)))))

(declare-fun b!198710 () Bool)

(assert (=> b!198710 (= e!136406 e!136405)))

(declare-fun res!166338 () Bool)

(assert (=> b!198710 (=> (not res!166338) (not e!136405))))

(declare-fun lt!309675 () (_ BitVec 64))

(assert (=> b!198710 (= res!166338 (= lt!309687 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!309675)))))

(assert (=> b!198710 (= lt!309687 (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))))))

(assert (=> b!198710 (= lt!309675 (bitIndex!0 (size!4458 (buf!4950 thiss!1204)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)))))

(declare-fun b!198711 () Bool)

(declare-fun res!166344 () Bool)

(assert (=> b!198711 (=> res!166344 e!136402)))

(assert (=> b!198711 (= res!166344 (not (isPrefixOf!0 thiss!1204 (_2!9210 lt!309686))))))

(declare-fun b!198712 () Bool)

(declare-fun res!166346 () Bool)

(assert (=> b!198712 (=> (not res!166346) (not e!136399))))

(assert (=> b!198712 (= res!166346 (invariant!0 (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204) (size!4458 (buf!4950 thiss!1204))))))

(declare-fun b!198713 () Bool)

(assert (=> b!198713 (= e!136405 e!136403)))

(declare-fun res!166337 () Bool)

(assert (=> b!198713 (=> (not res!166337) (not e!136403))))

(assert (=> b!198713 (= res!166337 (and (= (_2!9211 lt!309681) lt!309698) (= (_1!9211 lt!309681) (_2!9210 lt!309686))))))

(declare-fun readerFrom!0 (BitStream!8024 (_ BitVec 32) (_ BitVec 32)) BitStream!8024)

(assert (=> b!198713 (= lt!309681 (readBitPure!0 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204))))))

(assert (= (and start!42102 res!166332) b!198704))

(assert (= (and b!198704 res!166335) b!198712))

(assert (= (and b!198712 res!166346) b!198700))

(assert (= (and b!198700 res!166341) b!198695))

(assert (= (and b!198695 res!166328) b!198710))

(assert (= (and b!198710 res!166338) b!198709))

(assert (= (and b!198709 res!166329) b!198713))

(assert (= (and b!198713 res!166337) b!198699))

(assert (= (and b!198695 (not res!166330)) b!198708))

(assert (= (and b!198708 (not res!166336)) b!198702))

(assert (= (and b!198702 (not res!166339)) b!198693))

(assert (= (and b!198693 (not res!166333)) b!198703))

(assert (= (and b!198703 (not res!166345)) b!198711))

(assert (= (and b!198711 (not res!166344)) b!198697))

(assert (= (and b!198697 res!166331) b!198706))

(assert (= (and b!198697 res!166343) b!198694))

(assert (= (and b!198697 (not res!166334)) b!198698))

(assert (= (and b!198698 res!166340) b!198701))

(assert (= (and b!198701 res!166342) b!198696))

(assert (= (and b!198696 res!166347) b!198707))

(assert (= start!42102 b!198705))

(declare-fun m!307651 () Bool)

(assert (=> b!198706 m!307651))

(declare-fun m!307653 () Bool)

(assert (=> b!198708 m!307653))

(declare-fun m!307655 () Bool)

(assert (=> b!198708 m!307655))

(declare-fun m!307657 () Bool)

(assert (=> b!198708 m!307657))

(declare-fun m!307659 () Bool)

(assert (=> b!198708 m!307659))

(declare-fun m!307661 () Bool)

(assert (=> b!198697 m!307661))

(declare-fun m!307663 () Bool)

(assert (=> b!198697 m!307663))

(declare-fun m!307665 () Bool)

(assert (=> b!198697 m!307665))

(declare-fun m!307667 () Bool)

(assert (=> b!198697 m!307667))

(declare-fun m!307669 () Bool)

(assert (=> b!198697 m!307669))

(declare-fun m!307671 () Bool)

(assert (=> b!198697 m!307671))

(declare-fun m!307673 () Bool)

(assert (=> b!198697 m!307673))

(declare-fun m!307675 () Bool)

(assert (=> b!198697 m!307675))

(declare-fun m!307677 () Bool)

(assert (=> b!198697 m!307677))

(declare-fun m!307679 () Bool)

(assert (=> b!198697 m!307679))

(declare-fun m!307681 () Bool)

(assert (=> b!198697 m!307681))

(declare-fun m!307683 () Bool)

(assert (=> b!198697 m!307683))

(declare-fun m!307685 () Bool)

(assert (=> b!198697 m!307685))

(declare-fun m!307687 () Bool)

(assert (=> b!198697 m!307687))

(declare-fun m!307689 () Bool)

(assert (=> b!198697 m!307689))

(declare-fun m!307691 () Bool)

(assert (=> b!198697 m!307691))

(declare-fun m!307693 () Bool)

(assert (=> b!198702 m!307693))

(declare-fun m!307695 () Bool)

(assert (=> b!198701 m!307695))

(declare-fun m!307697 () Bool)

(assert (=> b!198698 m!307697))

(declare-fun m!307699 () Bool)

(assert (=> b!198698 m!307699))

(declare-fun m!307701 () Bool)

(assert (=> b!198698 m!307701))

(declare-fun m!307703 () Bool)

(assert (=> b!198705 m!307703))

(declare-fun m!307705 () Bool)

(assert (=> start!42102 m!307705))

(declare-fun m!307707 () Bool)

(assert (=> b!198704 m!307707))

(declare-fun m!307709 () Bool)

(assert (=> b!198709 m!307709))

(declare-fun m!307711 () Bool)

(assert (=> b!198713 m!307711))

(assert (=> b!198713 m!307711))

(declare-fun m!307713 () Bool)

(assert (=> b!198713 m!307713))

(assert (=> b!198711 m!307709))

(declare-fun m!307715 () Bool)

(assert (=> b!198699 m!307715))

(declare-fun m!307717 () Bool)

(assert (=> b!198703 m!307717))

(declare-fun m!307719 () Bool)

(assert (=> b!198710 m!307719))

(declare-fun m!307721 () Bool)

(assert (=> b!198710 m!307721))

(declare-fun m!307723 () Bool)

(assert (=> b!198696 m!307723))

(assert (=> b!198695 m!307719))

(assert (=> b!198695 m!307721))

(declare-fun m!307725 () Bool)

(assert (=> b!198695 m!307725))

(declare-fun m!307727 () Bool)

(assert (=> b!198712 m!307727))

(push 1)

(assert (not start!42102))

(assert (not b!198705))

(assert (not b!198708))

(assert (not b!198698))

(assert (not b!198701))

(assert (not b!198711))

(assert (not b!198712))

(assert (not b!198702))

(assert (not b!198703))

(assert (not b!198697))

(assert (not b!198696))

(assert (not b!198710))

(assert (not b!198709))

(assert (not b!198695))

(assert (not b!198699))

(assert (not b!198706))

(assert (not b!198704))

(assert (not b!198713))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!67595 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!67595 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4458 (buf!4950 thiss!1204))) ((_ sign_extend 32) (currentByte!9297 thiss!1204)) ((_ sign_extend 32) (currentBit!9292 thiss!1204)) lt!309680) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 thiss!1204))) ((_ sign_extend 32) (currentByte!9297 thiss!1204)) ((_ sign_extend 32) (currentBit!9292 thiss!1204))) lt!309680))))

(declare-fun bs!16723 () Bool)

(assert (= bs!16723 d!67595))

(declare-fun m!307891 () Bool)

(assert (=> bs!16723 m!307891))

(assert (=> b!198704 d!67595))

(declare-fun d!67597 () Bool)

(declare-datatypes ((tuple2!17140 0))(
  ( (tuple2!17141 (_1!9218 Bool) (_2!9218 BitStream!8024)) )
))
(declare-fun lt!309931 () tuple2!17140)

(declare-fun readBit!0 (BitStream!8024) tuple2!17140)

(assert (=> d!67597 (= lt!309931 (readBit!0 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204))))))

(assert (=> d!67597 (= (readBitPure!0 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204))) (tuple2!17127 (_2!9218 lt!309931) (_1!9218 lt!309931)))))

(declare-fun bs!16725 () Bool)

(assert (= bs!16725 d!67597))

(assert (=> bs!16725 m!307711))

(declare-fun m!307905 () Bool)

(assert (=> bs!16725 m!307905))

(assert (=> b!198713 d!67597))

(declare-fun d!67603 () Bool)

(declare-fun e!136458 () Bool)

(assert (=> d!67603 e!136458))

(declare-fun res!166426 () Bool)

(assert (=> d!67603 (=> (not res!166426) (not e!136458))))

(assert (=> d!67603 (= res!166426 (invariant!0 (currentBit!9292 (_2!9210 lt!309686)) (currentByte!9297 (_2!9210 lt!309686)) (size!4458 (buf!4950 (_2!9210 lt!309686)))))))

(assert (=> d!67603 (= (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204)) (BitStream!8025 (buf!4950 (_2!9210 lt!309686)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)))))

(declare-fun b!198798 () Bool)

(assert (=> b!198798 (= e!136458 (invariant!0 (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204) (size!4458 (buf!4950 (_2!9210 lt!309686)))))))

(assert (= (and d!67603 res!166426) b!198798))

(declare-fun m!307907 () Bool)

(assert (=> d!67603 m!307907))

(assert (=> b!198798 m!307689))

(assert (=> b!198713 d!67603))

(declare-fun d!67605 () Bool)

(declare-fun res!166435 () Bool)

(declare-fun e!136463 () Bool)

(assert (=> d!67605 (=> (not res!166435) (not e!136463))))

(assert (=> d!67605 (= res!166435 (= (size!4458 (buf!4950 (_2!9210 lt!309686))) (size!4458 (buf!4950 (_2!9210 lt!309690)))))))

(assert (=> d!67605 (= (isPrefixOf!0 (_2!9210 lt!309686) (_2!9210 lt!309690)) e!136463)))

(declare-fun b!198805 () Bool)

(declare-fun res!166433 () Bool)

(assert (=> b!198805 (=> (not res!166433) (not e!136463))))

(assert (=> b!198805 (= res!166433 (bvsle (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309690))) (currentByte!9297 (_2!9210 lt!309690)) (currentBit!9292 (_2!9210 lt!309690)))))))

(declare-fun b!198806 () Bool)

(declare-fun e!136464 () Bool)

(assert (=> b!198806 (= e!136463 e!136464)))

(declare-fun res!166434 () Bool)

(assert (=> b!198806 (=> res!166434 e!136464)))

(assert (=> b!198806 (= res!166434 (= (size!4458 (buf!4950 (_2!9210 lt!309686))) #b00000000000000000000000000000000))))

(declare-fun b!198807 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10116 array!10116 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!198807 (= e!136464 (arrayBitRangesEq!0 (buf!4950 (_2!9210 lt!309686)) (buf!4950 (_2!9210 lt!309690)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686)))))))

(assert (= (and d!67605 res!166435) b!198805))

(assert (= (and b!198805 res!166433) b!198806))

(assert (= (and b!198806 (not res!166434)) b!198807))

(assert (=> b!198805 m!307719))

(assert (=> b!198805 m!307653))

(assert (=> b!198807 m!307719))

(assert (=> b!198807 m!307719))

(declare-fun m!307909 () Bool)

(assert (=> b!198807 m!307909))

(assert (=> b!198703 d!67605))

(declare-fun d!67607 () Bool)

(declare-fun e!136467 () Bool)

(assert (=> d!67607 e!136467))

(declare-fun res!166438 () Bool)

(assert (=> d!67607 (=> (not res!166438) (not e!136467))))

(declare-fun lt!309936 () BitStream!8024)

(declare-fun lt!309937 () (_ BitVec 64))

(assert (=> d!67607 (= res!166438 (= (bvadd lt!309937 (bvsub lt!309685 lt!309677)) (bitIndex!0 (size!4458 (buf!4950 lt!309936)) (currentByte!9297 lt!309936) (currentBit!9292 lt!309936))))))

(assert (=> d!67607 (or (not (= (bvand lt!309937 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309685 lt!309677) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!309937 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!309937 (bvsub lt!309685 lt!309677)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67607 (= lt!309937 (bitIndex!0 (size!4458 (buf!4950 (_2!9212 lt!309700))) (currentByte!9297 (_2!9212 lt!309700)) (currentBit!9292 (_2!9212 lt!309700))))))

(declare-fun moveBitIndex!0 (BitStream!8024 (_ BitVec 64)) tuple2!17124)

(assert (=> d!67607 (= lt!309936 (_2!9210 (moveBitIndex!0 (_2!9212 lt!309700) (bvsub lt!309685 lt!309677))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8024 (_ BitVec 64)) Bool)

(assert (=> d!67607 (moveBitIndexPrecond!0 (_2!9212 lt!309700) (bvsub lt!309685 lt!309677))))

(assert (=> d!67607 (= (withMovedBitIndex!0 (_2!9212 lt!309700) (bvsub lt!309685 lt!309677)) lt!309936)))

(declare-fun b!198810 () Bool)

(assert (=> b!198810 (= e!136467 (= (size!4458 (buf!4950 (_2!9212 lt!309700))) (size!4458 (buf!4950 lt!309936))))))

(assert (= (and d!67607 res!166438) b!198810))

(declare-fun m!307911 () Bool)

(assert (=> d!67607 m!307911))

(declare-fun m!307913 () Bool)

(assert (=> d!67607 m!307913))

(declare-fun m!307915 () Bool)

(assert (=> d!67607 m!307915))

(declare-fun m!307917 () Bool)

(assert (=> d!67607 m!307917))

(assert (=> b!198696 d!67607))

(declare-fun d!67609 () Bool)

(assert (=> d!67609 (= (array_inv!4199 (buf!4950 thiss!1204)) (bvsge (size!4458 (buf!4950 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!198705 d!67609))

(declare-fun d!67611 () Bool)

(declare-fun e!136476 () Bool)

(assert (=> d!67611 e!136476))

(declare-fun res!166453 () Bool)

(assert (=> d!67611 (=> (not res!166453) (not e!136476))))

(declare-fun lt!310011 () (_ BitVec 64))

(declare-fun lt!310015 () (_ BitVec 64))

(declare-fun lt!310014 () (_ BitVec 64))

(assert (=> d!67611 (= res!166453 (= lt!310015 (bvsub lt!310014 lt!310011)))))

(assert (=> d!67611 (or (= (bvand lt!310014 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310011 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!310014 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!310014 lt!310011) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67611 (= lt!310011 (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!309686)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309686))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309686)))))))

(declare-fun lt!310010 () (_ BitVec 64))

(declare-fun lt!310013 () (_ BitVec 64))

(assert (=> d!67611 (= lt!310014 (bvmul lt!310010 lt!310013))))

(assert (=> d!67611 (or (= lt!310010 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!310013 (bvsdiv (bvmul lt!310010 lt!310013) lt!310010)))))

(assert (=> d!67611 (= lt!310013 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67611 (= lt!310010 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!309686)))))))

(assert (=> d!67611 (= lt!310015 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309686))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309686)))))))

(assert (=> d!67611 (invariant!0 (currentBit!9292 (_2!9210 lt!309686)) (currentByte!9297 (_2!9210 lt!309686)) (size!4458 (buf!4950 (_2!9210 lt!309686))))))

(assert (=> d!67611 (= (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))) lt!310015)))

(declare-fun b!198830 () Bool)

(declare-fun res!166452 () Bool)

(assert (=> b!198830 (=> (not res!166452) (not e!136476))))

(assert (=> b!198830 (= res!166452 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!310015))))

(declare-fun b!198831 () Bool)

(declare-fun lt!310012 () (_ BitVec 64))

(assert (=> b!198831 (= e!136476 (bvsle lt!310015 (bvmul lt!310012 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198831 (or (= lt!310012 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!310012 #b0000000000000000000000000000000000000000000000000000000000001000) lt!310012)))))

(assert (=> b!198831 (= lt!310012 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!309686)))))))

(assert (= (and d!67611 res!166453) b!198830))

(assert (= (and b!198830 res!166452) b!198831))

(declare-fun m!307949 () Bool)

(assert (=> d!67611 m!307949))

(assert (=> d!67611 m!307907))

(assert (=> b!198695 d!67611))

(declare-fun d!67615 () Bool)

(declare-fun e!136477 () Bool)

(assert (=> d!67615 e!136477))

(declare-fun res!166455 () Bool)

(assert (=> d!67615 (=> (not res!166455) (not e!136477))))

(declare-fun lt!310021 () (_ BitVec 64))

(declare-fun lt!310020 () (_ BitVec 64))

(declare-fun lt!310017 () (_ BitVec 64))

(assert (=> d!67615 (= res!166455 (= lt!310021 (bvsub lt!310020 lt!310017)))))

(assert (=> d!67615 (or (= (bvand lt!310020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310017 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!310020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!310020 lt!310017) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67615 (= lt!310017 (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 thiss!1204))) ((_ sign_extend 32) (currentByte!9297 thiss!1204)) ((_ sign_extend 32) (currentBit!9292 thiss!1204))))))

(declare-fun lt!310016 () (_ BitVec 64))

(declare-fun lt!310019 () (_ BitVec 64))

(assert (=> d!67615 (= lt!310020 (bvmul lt!310016 lt!310019))))

(assert (=> d!67615 (or (= lt!310016 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!310019 (bvsdiv (bvmul lt!310016 lt!310019) lt!310016)))))

(assert (=> d!67615 (= lt!310019 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67615 (= lt!310016 ((_ sign_extend 32) (size!4458 (buf!4950 thiss!1204))))))

(assert (=> d!67615 (= lt!310021 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 thiss!1204))))))

(assert (=> d!67615 (invariant!0 (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204) (size!4458 (buf!4950 thiss!1204)))))

(assert (=> d!67615 (= (bitIndex!0 (size!4458 (buf!4950 thiss!1204)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)) lt!310021)))

(declare-fun b!198832 () Bool)

(declare-fun res!166454 () Bool)

(assert (=> b!198832 (=> (not res!166454) (not e!136477))))

(assert (=> b!198832 (= res!166454 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!310021))))

(declare-fun b!198833 () Bool)

(declare-fun lt!310018 () (_ BitVec 64))

(assert (=> b!198833 (= e!136477 (bvsle lt!310021 (bvmul lt!310018 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198833 (or (= lt!310018 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!310018 #b0000000000000000000000000000000000000000000000000000000000001000) lt!310018)))))

(assert (=> b!198833 (= lt!310018 ((_ sign_extend 32) (size!4458 (buf!4950 thiss!1204))))))

(assert (= (and d!67615 res!166455) b!198832))

(assert (= (and b!198832 res!166454) b!198833))

(assert (=> d!67615 m!307891))

(assert (=> d!67615 m!307727))

(assert (=> b!198695 d!67615))

(declare-fun b!198862 () Bool)

(declare-fun res!166483 () Bool)

(declare-fun e!136493 () Bool)

(assert (=> b!198862 (=> (not res!166483) (not e!136493))))

(declare-fun lt!310074 () tuple2!17124)

(assert (=> b!198862 (= res!166483 (isPrefixOf!0 thiss!1204 (_2!9210 lt!310074)))))

(declare-fun b!198864 () Bool)

(declare-fun e!136492 () Bool)

(declare-fun lt!310075 () tuple2!17126)

(assert (=> b!198864 (= e!136492 (= (bitIndex!0 (size!4458 (buf!4950 (_1!9211 lt!310075))) (currentByte!9297 (_1!9211 lt!310075)) (currentBit!9292 (_1!9211 lt!310075))) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310074))) (currentByte!9297 (_2!9210 lt!310074)) (currentBit!9292 (_2!9210 lt!310074)))))))

(declare-fun b!198863 () Bool)

(assert (=> b!198863 (= e!136493 e!136492)))

(declare-fun res!166480 () Bool)

(assert (=> b!198863 (=> (not res!166480) (not e!136492))))

(assert (=> b!198863 (= res!166480 (and (= (_2!9211 lt!310075) lt!309698) (= (_1!9211 lt!310075) (_2!9210 lt!310074))))))

(assert (=> b!198863 (= lt!310075 (readBitPure!0 (readerFrom!0 (_2!9210 lt!310074) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204))))))

(declare-fun b!198861 () Bool)

(declare-fun res!166481 () Bool)

(assert (=> b!198861 (=> (not res!166481) (not e!136493))))

(declare-fun lt!310076 () (_ BitVec 64))

(declare-fun lt!310073 () (_ BitVec 64))

(assert (=> b!198861 (= res!166481 (= (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310074))) (currentByte!9297 (_2!9210 lt!310074)) (currentBit!9292 (_2!9210 lt!310074))) (bvadd lt!310073 lt!310076)))))

(assert (=> b!198861 (or (not (= (bvand lt!310073 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310076 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!310073 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!310073 lt!310076) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198861 (= lt!310076 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!198861 (= lt!310073 (bitIndex!0 (size!4458 (buf!4950 thiss!1204)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)))))

(declare-fun d!67617 () Bool)

(assert (=> d!67617 e!136493))

(declare-fun res!166482 () Bool)

(assert (=> d!67617 (=> (not res!166482) (not e!136493))))

(assert (=> d!67617 (= res!166482 (= (size!4458 (buf!4950 thiss!1204)) (size!4458 (buf!4950 (_2!9210 lt!310074)))))))

(declare-fun choose!16 (BitStream!8024 Bool) tuple2!17124)

(assert (=> d!67617 (= lt!310074 (choose!16 thiss!1204 lt!309698))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!67617 (validate_offset_bit!0 ((_ sign_extend 32) (size!4458 (buf!4950 thiss!1204))) ((_ sign_extend 32) (currentByte!9297 thiss!1204)) ((_ sign_extend 32) (currentBit!9292 thiss!1204)))))

(assert (=> d!67617 (= (appendBit!0 thiss!1204 lt!309698) lt!310074)))

(assert (= (and d!67617 res!166482) b!198861))

(assert (= (and b!198861 res!166481) b!198862))

(assert (= (and b!198862 res!166483) b!198863))

(assert (= (and b!198863 res!166480) b!198864))

(declare-fun m!308001 () Bool)

(assert (=> b!198863 m!308001))

(assert (=> b!198863 m!308001))

(declare-fun m!308003 () Bool)

(assert (=> b!198863 m!308003))

(declare-fun m!308005 () Bool)

(assert (=> d!67617 m!308005))

(declare-fun m!308007 () Bool)

(assert (=> d!67617 m!308007))

(declare-fun m!308009 () Bool)

(assert (=> b!198862 m!308009))

(declare-fun m!308011 () Bool)

(assert (=> b!198864 m!308011))

(declare-fun m!308013 () Bool)

(assert (=> b!198864 m!308013))

(assert (=> b!198861 m!308013))

(assert (=> b!198861 m!307721))

(assert (=> b!198695 d!67617))

(declare-fun d!67645 () Bool)

(assert (=> d!67645 (= (invariant!0 (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204) (size!4458 (buf!4950 (_2!9210 lt!309690)))) (and (bvsge (currentBit!9292 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9292 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9297 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9297 thiss!1204) (size!4458 (buf!4950 (_2!9210 lt!309690)))) (and (= (currentBit!9292 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9297 thiss!1204) (size!4458 (buf!4950 (_2!9210 lt!309690))))))))))

(assert (=> b!198706 d!67645))

(declare-fun d!67647 () Bool)

(declare-fun res!166486 () Bool)

(declare-fun e!136494 () Bool)

(assert (=> d!67647 (=> (not res!166486) (not e!136494))))

(assert (=> d!67647 (= res!166486 (= (size!4458 (buf!4950 thiss!1204)) (size!4458 (buf!4950 (_2!9210 lt!309686)))))))

(assert (=> d!67647 (= (isPrefixOf!0 thiss!1204 (_2!9210 lt!309686)) e!136494)))

(declare-fun b!198865 () Bool)

(declare-fun res!166484 () Bool)

(assert (=> b!198865 (=> (not res!166484) (not e!136494))))

(assert (=> b!198865 (= res!166484 (bvsle (bitIndex!0 (size!4458 (buf!4950 thiss!1204)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686)))))))

(declare-fun b!198866 () Bool)

(declare-fun e!136495 () Bool)

(assert (=> b!198866 (= e!136494 e!136495)))

(declare-fun res!166485 () Bool)

(assert (=> b!198866 (=> res!166485 e!136495)))

(assert (=> b!198866 (= res!166485 (= (size!4458 (buf!4950 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!198867 () Bool)

(assert (=> b!198867 (= e!136495 (arrayBitRangesEq!0 (buf!4950 thiss!1204) (buf!4950 (_2!9210 lt!309686)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4458 (buf!4950 thiss!1204)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204))))))

(assert (= (and d!67647 res!166486) b!198865))

(assert (= (and b!198865 res!166484) b!198866))

(assert (= (and b!198866 (not res!166485)) b!198867))

(assert (=> b!198865 m!307721))

(assert (=> b!198865 m!307719))

(assert (=> b!198867 m!307721))

(assert (=> b!198867 m!307721))

(declare-fun m!308015 () Bool)

(assert (=> b!198867 m!308015))

(assert (=> b!198709 d!67647))

(declare-fun d!67649 () Bool)

(declare-fun e!136496 () Bool)

(assert (=> d!67649 e!136496))

(declare-fun res!166488 () Bool)

(assert (=> d!67649 (=> (not res!166488) (not e!136496))))

(declare-fun lt!310082 () (_ BitVec 64))

(declare-fun lt!310078 () (_ BitVec 64))

(declare-fun lt!310081 () (_ BitVec 64))

(assert (=> d!67649 (= res!166488 (= lt!310082 (bvsub lt!310081 lt!310078)))))

(assert (=> d!67649 (or (= (bvand lt!310081 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310078 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!310081 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!310081 lt!310078) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67649 (= lt!310078 (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!309681)))) ((_ sign_extend 32) (currentByte!9297 (_1!9211 lt!309681))) ((_ sign_extend 32) (currentBit!9292 (_1!9211 lt!309681)))))))

(declare-fun lt!310077 () (_ BitVec 64))

(declare-fun lt!310080 () (_ BitVec 64))

(assert (=> d!67649 (= lt!310081 (bvmul lt!310077 lt!310080))))

(assert (=> d!67649 (or (= lt!310077 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!310080 (bvsdiv (bvmul lt!310077 lt!310080) lt!310077)))))

(assert (=> d!67649 (= lt!310080 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67649 (= lt!310077 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!309681)))))))

(assert (=> d!67649 (= lt!310082 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 (_1!9211 lt!309681))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 (_1!9211 lt!309681)))))))

(assert (=> d!67649 (invariant!0 (currentBit!9292 (_1!9211 lt!309681)) (currentByte!9297 (_1!9211 lt!309681)) (size!4458 (buf!4950 (_1!9211 lt!309681))))))

(assert (=> d!67649 (= (bitIndex!0 (size!4458 (buf!4950 (_1!9211 lt!309681))) (currentByte!9297 (_1!9211 lt!309681)) (currentBit!9292 (_1!9211 lt!309681))) lt!310082)))

(declare-fun b!198868 () Bool)

(declare-fun res!166487 () Bool)

(assert (=> b!198868 (=> (not res!166487) (not e!136496))))

(assert (=> b!198868 (= res!166487 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!310082))))

(declare-fun b!198869 () Bool)

(declare-fun lt!310079 () (_ BitVec 64))

(assert (=> b!198869 (= e!136496 (bvsle lt!310082 (bvmul lt!310079 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198869 (or (= lt!310079 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!310079 #b0000000000000000000000000000000000000000000000000000000000001000) lt!310079)))))

(assert (=> b!198869 (= lt!310079 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!309681)))))))

(assert (= (and d!67649 res!166488) b!198868))

(assert (= (and b!198868 res!166487) b!198869))

(declare-fun m!308017 () Bool)

(assert (=> d!67649 m!308017))

(declare-fun m!308019 () Bool)

(assert (=> d!67649 m!308019))

(assert (=> b!198699 d!67649))

(assert (=> b!198710 d!67611))

(assert (=> b!198710 d!67615))

(declare-fun d!67651 () Bool)

(declare-fun e!136497 () Bool)

(assert (=> d!67651 e!136497))

(declare-fun res!166490 () Bool)

(assert (=> d!67651 (=> (not res!166490) (not e!136497))))

(declare-fun lt!310087 () (_ BitVec 64))

(declare-fun lt!310084 () (_ BitVec 64))

(declare-fun lt!310088 () (_ BitVec 64))

(assert (=> d!67651 (= res!166490 (= lt!310088 (bvsub lt!310087 lt!310084)))))

(assert (=> d!67651 (or (= (bvand lt!310087 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310084 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!310087 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!310087 lt!310084) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67651 (= lt!310084 (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!309695)))) ((_ sign_extend 32) (currentByte!9297 (_1!9211 lt!309695))) ((_ sign_extend 32) (currentBit!9292 (_1!9211 lt!309695)))))))

(declare-fun lt!310083 () (_ BitVec 64))

(declare-fun lt!310086 () (_ BitVec 64))

(assert (=> d!67651 (= lt!310087 (bvmul lt!310083 lt!310086))))

(assert (=> d!67651 (or (= lt!310083 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!310086 (bvsdiv (bvmul lt!310083 lt!310086) lt!310083)))))

(assert (=> d!67651 (= lt!310086 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67651 (= lt!310083 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!309695)))))))

(assert (=> d!67651 (= lt!310088 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 (_1!9211 lt!309695))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 (_1!9211 lt!309695)))))))

(assert (=> d!67651 (invariant!0 (currentBit!9292 (_1!9211 lt!309695)) (currentByte!9297 (_1!9211 lt!309695)) (size!4458 (buf!4950 (_1!9211 lt!309695))))))

(assert (=> d!67651 (= (bitIndex!0 (size!4458 (buf!4950 (_1!9211 lt!309695))) (currentByte!9297 (_1!9211 lt!309695)) (currentBit!9292 (_1!9211 lt!309695))) lt!310088)))

(declare-fun b!198870 () Bool)

(declare-fun res!166489 () Bool)

(assert (=> b!198870 (=> (not res!166489) (not e!136497))))

(assert (=> b!198870 (= res!166489 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!310088))))

(declare-fun b!198871 () Bool)

(declare-fun lt!310085 () (_ BitVec 64))

(assert (=> b!198871 (= e!136497 (bvsle lt!310088 (bvmul lt!310085 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198871 (or (= lt!310085 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!310085 #b0000000000000000000000000000000000000000000000000000000000001000) lt!310085)))))

(assert (=> b!198871 (= lt!310085 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!309695)))))))

(assert (= (and d!67651 res!166490) b!198870))

(assert (= (and b!198870 res!166489) b!198871))

(declare-fun m!308021 () Bool)

(assert (=> d!67651 m!308021))

(declare-fun m!308023 () Bool)

(assert (=> d!67651 m!308023))

(assert (=> b!198697 d!67651))

(declare-fun d!67653 () Bool)

(assert (=> d!67653 (validate_offset_bits!1 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!309690)))) ((_ sign_extend 32) (currentByte!9297 thiss!1204)) ((_ sign_extend 32) (currentBit!9292 thiss!1204)) lt!309680)))

(declare-fun lt!310091 () Unit!14062)

(declare-fun choose!9 (BitStream!8024 array!10116 (_ BitVec 64) BitStream!8024) Unit!14062)

(assert (=> d!67653 (= lt!310091 (choose!9 thiss!1204 (buf!4950 (_2!9210 lt!309690)) lt!309680 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204))))))

(assert (=> d!67653 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4950 (_2!9210 lt!309690)) lt!309680) lt!310091)))

(declare-fun bs!16734 () Bool)

(assert (= bs!16734 d!67653))

(assert (=> bs!16734 m!307669))

(declare-fun m!308025 () Bool)

(assert (=> bs!16734 m!308025))

(assert (=> b!198697 d!67653))

(declare-fun lt!310150 () tuple2!17128)

(declare-fun lt!310133 () (_ BitVec 64))

(declare-fun b!198882 () Bool)

(declare-fun lt!310146 () (_ BitVec 64))

(declare-fun e!136503 () Bool)

(assert (=> b!198882 (= e!136503 (= (_1!9212 lt!310150) (withMovedBitIndex!0 (_2!9212 lt!310150) (bvsub lt!310133 lt!310146))))))

(assert (=> b!198882 (or (= (bvand lt!310133 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310146 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!310133 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!310133 lt!310146) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198882 (= lt!310146 (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309690))) (currentByte!9297 (_2!9210 lt!309690)) (currentBit!9292 (_2!9210 lt!309690))))))

(assert (=> b!198882 (= lt!310133 (bitIndex!0 (size!4458 (buf!4950 thiss!1204)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)))))

(declare-fun b!198883 () Bool)

(declare-fun e!136502 () Unit!14062)

(declare-fun Unit!14090 () Unit!14062)

(assert (=> b!198883 (= e!136502 Unit!14090)))

(declare-fun b!198884 () Bool)

(declare-fun lt!310147 () Unit!14062)

(assert (=> b!198884 (= e!136502 lt!310147)))

(declare-fun lt!310151 () (_ BitVec 64))

(assert (=> b!198884 (= lt!310151 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!310135 () (_ BitVec 64))

(assert (=> b!198884 (= lt!310135 (bitIndex!0 (size!4458 (buf!4950 thiss!1204)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10116 array!10116 (_ BitVec 64) (_ BitVec 64)) Unit!14062)

(assert (=> b!198884 (= lt!310147 (arrayBitRangesEqSymmetric!0 (buf!4950 thiss!1204) (buf!4950 (_2!9210 lt!309690)) lt!310151 lt!310135))))

(assert (=> b!198884 (arrayBitRangesEq!0 (buf!4950 (_2!9210 lt!309690)) (buf!4950 thiss!1204) lt!310151 lt!310135)))

(declare-fun b!198885 () Bool)

(declare-fun res!166497 () Bool)

(assert (=> b!198885 (=> (not res!166497) (not e!136503))))

(assert (=> b!198885 (= res!166497 (isPrefixOf!0 (_1!9212 lt!310150) thiss!1204))))

(declare-fun b!198886 () Bool)

(declare-fun res!166499 () Bool)

(assert (=> b!198886 (=> (not res!166499) (not e!136503))))

(assert (=> b!198886 (= res!166499 (isPrefixOf!0 (_2!9212 lt!310150) (_2!9210 lt!309690)))))

(declare-fun d!67655 () Bool)

(assert (=> d!67655 e!136503))

(declare-fun res!166498 () Bool)

(assert (=> d!67655 (=> (not res!166498) (not e!136503))))

(assert (=> d!67655 (= res!166498 (isPrefixOf!0 (_1!9212 lt!310150) (_2!9212 lt!310150)))))

(declare-fun lt!310139 () BitStream!8024)

(assert (=> d!67655 (= lt!310150 (tuple2!17129 lt!310139 (_2!9210 lt!309690)))))

(declare-fun lt!310138 () Unit!14062)

(declare-fun lt!310140 () Unit!14062)

(assert (=> d!67655 (= lt!310138 lt!310140)))

(assert (=> d!67655 (isPrefixOf!0 lt!310139 (_2!9210 lt!309690))))

(assert (=> d!67655 (= lt!310140 (lemmaIsPrefixTransitive!0 lt!310139 (_2!9210 lt!309690) (_2!9210 lt!309690)))))

(declare-fun lt!310144 () Unit!14062)

(declare-fun lt!310148 () Unit!14062)

(assert (=> d!67655 (= lt!310144 lt!310148)))

(assert (=> d!67655 (isPrefixOf!0 lt!310139 (_2!9210 lt!309690))))

(assert (=> d!67655 (= lt!310148 (lemmaIsPrefixTransitive!0 lt!310139 thiss!1204 (_2!9210 lt!309690)))))

(declare-fun lt!310145 () Unit!14062)

(assert (=> d!67655 (= lt!310145 e!136502)))

(declare-fun c!9900 () Bool)

(assert (=> d!67655 (= c!9900 (not (= (size!4458 (buf!4950 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!310149 () Unit!14062)

(declare-fun lt!310132 () Unit!14062)

(assert (=> d!67655 (= lt!310149 lt!310132)))

(assert (=> d!67655 (isPrefixOf!0 (_2!9210 lt!309690) (_2!9210 lt!309690))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8024) Unit!14062)

(assert (=> d!67655 (= lt!310132 (lemmaIsPrefixRefl!0 (_2!9210 lt!309690)))))

(declare-fun lt!310136 () Unit!14062)

(declare-fun lt!310134 () Unit!14062)

(assert (=> d!67655 (= lt!310136 lt!310134)))

(assert (=> d!67655 (= lt!310134 (lemmaIsPrefixRefl!0 (_2!9210 lt!309690)))))

(declare-fun lt!310137 () Unit!14062)

(declare-fun lt!310141 () Unit!14062)

(assert (=> d!67655 (= lt!310137 lt!310141)))

(assert (=> d!67655 (isPrefixOf!0 lt!310139 lt!310139)))

(assert (=> d!67655 (= lt!310141 (lemmaIsPrefixRefl!0 lt!310139))))

(declare-fun lt!310142 () Unit!14062)

(declare-fun lt!310143 () Unit!14062)

(assert (=> d!67655 (= lt!310142 lt!310143)))

(assert (=> d!67655 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!67655 (= lt!310143 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!67655 (= lt!310139 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)))))

(assert (=> d!67655 (isPrefixOf!0 thiss!1204 (_2!9210 lt!309690))))

(assert (=> d!67655 (= (reader!0 thiss!1204 (_2!9210 lt!309690)) lt!310150)))

(assert (= (and d!67655 c!9900) b!198884))

(assert (= (and d!67655 (not c!9900)) b!198883))

(assert (= (and d!67655 res!166498) b!198885))

(assert (= (and b!198885 res!166497) b!198886))

(assert (= (and b!198886 res!166499) b!198882))

(declare-fun m!308027 () Bool)

(assert (=> b!198885 m!308027))

(declare-fun m!308029 () Bool)

(assert (=> b!198886 m!308029))

(assert (=> b!198884 m!307721))

(declare-fun m!308031 () Bool)

(assert (=> b!198884 m!308031))

(declare-fun m!308033 () Bool)

(assert (=> b!198884 m!308033))

(declare-fun m!308035 () Bool)

(assert (=> d!67655 m!308035))

(declare-fun m!308037 () Bool)

(assert (=> d!67655 m!308037))

(declare-fun m!308039 () Bool)

(assert (=> d!67655 m!308039))

(declare-fun m!308041 () Bool)

(assert (=> d!67655 m!308041))

(declare-fun m!308043 () Bool)

(assert (=> d!67655 m!308043))

(declare-fun m!308045 () Bool)

(assert (=> d!67655 m!308045))

(declare-fun m!308047 () Bool)

(assert (=> d!67655 m!308047))

(assert (=> d!67655 m!307655))

(declare-fun m!308049 () Bool)

(assert (=> d!67655 m!308049))

(declare-fun m!308051 () Bool)

(assert (=> d!67655 m!308051))

(declare-fun m!308053 () Bool)

(assert (=> d!67655 m!308053))

(declare-fun m!308055 () Bool)

(assert (=> b!198882 m!308055))

(assert (=> b!198882 m!307653))

(assert (=> b!198882 m!307721))

(assert (=> b!198697 d!67655))

(declare-fun d!67657 () Bool)

(assert (=> d!67657 (= (invariant!0 (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204) (size!4458 (buf!4950 (_2!9210 lt!309686)))) (and (bvsge (currentBit!9292 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9292 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9297 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9297 thiss!1204) (size!4458 (buf!4950 (_2!9210 lt!309686)))) (and (= (currentBit!9292 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9297 thiss!1204) (size!4458 (buf!4950 (_2!9210 lt!309686))))))))))

(assert (=> b!198697 d!67657))

(declare-fun d!67659 () Bool)

(assert (=> d!67659 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!198697 d!67659))

(declare-fun d!67661 () Bool)

(assert (=> d!67661 (validate_offset_bits!1 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!309690)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309686))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309686))) lt!309683)))

(declare-fun lt!310152 () Unit!14062)

(assert (=> d!67661 (= lt!310152 (choose!9 (_2!9210 lt!309686) (buf!4950 (_2!9210 lt!309690)) lt!309683 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686)))))))

(assert (=> d!67661 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9210 lt!309686) (buf!4950 (_2!9210 lt!309690)) lt!309683) lt!310152)))

(declare-fun bs!16735 () Bool)

(assert (= bs!16735 d!67661))

(assert (=> bs!16735 m!307665))

(declare-fun m!308057 () Bool)

(assert (=> bs!16735 m!308057))

(assert (=> b!198697 d!67661))

(declare-fun d!67663 () Bool)

(assert (=> d!67663 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!309690)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309686))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309686))) lt!309683) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!309690)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309686))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309686)))) lt!309683))))

(declare-fun bs!16736 () Bool)

(assert (= bs!16736 d!67663))

(declare-fun m!308059 () Bool)

(assert (=> bs!16736 m!308059))

(assert (=> b!198697 d!67663))

(declare-fun d!67665 () Bool)

(declare-fun lt!310153 () tuple2!17140)

(assert (=> d!67665 (= lt!310153 (readBit!0 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204))))))

(assert (=> d!67665 (= (readBitPure!0 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204))) (tuple2!17127 (_2!9218 lt!310153) (_1!9218 lt!310153)))))

(declare-fun bs!16737 () Bool)

(assert (= bs!16737 d!67665))

(declare-fun m!308061 () Bool)

(assert (=> bs!16737 m!308061))

(assert (=> b!198697 d!67665))

(declare-fun d!67667 () Bool)

(declare-fun e!136506 () Bool)

(assert (=> d!67667 e!136506))

(declare-fun res!166502 () Bool)

(assert (=> d!67667 (=> (not res!166502) (not e!136506))))

(declare-fun lt!310162 () tuple2!17126)

(declare-fun lt!310163 () tuple2!17126)

(assert (=> d!67667 (= res!166502 (= (bitIndex!0 (size!4458 (buf!4950 (_1!9211 lt!310162))) (currentByte!9297 (_1!9211 lt!310162)) (currentBit!9292 (_1!9211 lt!310162))) (bitIndex!0 (size!4458 (buf!4950 (_1!9211 lt!310163))) (currentByte!9297 (_1!9211 lt!310163)) (currentBit!9292 (_1!9211 lt!310163)))))))

(declare-fun lt!310165 () Unit!14062)

(declare-fun lt!310164 () BitStream!8024)

(declare-fun choose!50 (BitStream!8024 BitStream!8024 BitStream!8024 tuple2!17126 tuple2!17126 BitStream!8024 Bool tuple2!17126 tuple2!17126 BitStream!8024 Bool) Unit!14062)

(assert (=> d!67667 (= lt!310165 (choose!50 lt!309693 (_2!9210 lt!309690) lt!310164 lt!310162 (tuple2!17127 (_1!9211 lt!310162) (_2!9211 lt!310162)) (_1!9211 lt!310162) (_2!9211 lt!310162) lt!310163 (tuple2!17127 (_1!9211 lt!310163) (_2!9211 lt!310163)) (_1!9211 lt!310163) (_2!9211 lt!310163)))))

(assert (=> d!67667 (= lt!310163 (readBitPure!0 lt!310164))))

(assert (=> d!67667 (= lt!310162 (readBitPure!0 lt!309693))))

(assert (=> d!67667 (= lt!310164 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 lt!309693) (currentBit!9292 lt!309693)))))

(assert (=> d!67667 (invariant!0 (currentBit!9292 lt!309693) (currentByte!9297 lt!309693) (size!4458 (buf!4950 (_2!9210 lt!309690))))))

(assert (=> d!67667 (= (readBitPrefixLemma!0 lt!309693 (_2!9210 lt!309690)) lt!310165)))

(declare-fun b!198889 () Bool)

(assert (=> b!198889 (= e!136506 (= (_2!9211 lt!310162) (_2!9211 lt!310163)))))

(assert (= (and d!67667 res!166502) b!198889))

(declare-fun m!308063 () Bool)

(assert (=> d!67667 m!308063))

(declare-fun m!308065 () Bool)

(assert (=> d!67667 m!308065))

(declare-fun m!308067 () Bool)

(assert (=> d!67667 m!308067))

(assert (=> d!67667 m!307679))

(declare-fun m!308069 () Bool)

(assert (=> d!67667 m!308069))

(declare-fun m!308071 () Bool)

(assert (=> d!67667 m!308071))

(assert (=> b!198697 d!67667))

(declare-datatypes ((tuple2!17142 0))(
  ( (tuple2!17143 (_1!9219 (_ BitVec 64)) (_2!9219 BitStream!8024)) )
))
(declare-fun lt!310168 () tuple2!17142)

(declare-fun d!67669 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8024 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17142)

(assert (=> d!67669 (= lt!310168 (readNBitsLSBFirstsLoop!0 (_1!9212 lt!309684) nBits!348 i!590 lt!309674))))

(assert (=> d!67669 (= (readNBitsLSBFirstsLoopPure!0 (_1!9212 lt!309684) nBits!348 i!590 lt!309674) (tuple2!17131 (_2!9219 lt!310168) (_1!9219 lt!310168)))))

(declare-fun bs!16738 () Bool)

(assert (= bs!16738 d!67669))

(declare-fun m!308073 () Bool)

(assert (=> bs!16738 m!308073))

(assert (=> b!198697 d!67669))

(declare-fun d!67671 () Bool)

(declare-fun lt!310169 () tuple2!17140)

(assert (=> d!67671 (= lt!310169 (readBit!0 (_1!9212 lt!309684)))))

(assert (=> d!67671 (= (readBitPure!0 (_1!9212 lt!309684)) (tuple2!17127 (_2!9218 lt!310169) (_1!9218 lt!310169)))))

(declare-fun bs!16739 () Bool)

(assert (= bs!16739 d!67671))

(declare-fun m!308075 () Bool)

(assert (=> bs!16739 m!308075))

(assert (=> b!198697 d!67671))

(declare-fun lt!310184 () (_ BitVec 64))

(declare-fun lt!310188 () tuple2!17128)

(declare-fun b!198890 () Bool)

(declare-fun e!136508 () Bool)

(declare-fun lt!310171 () (_ BitVec 64))

(assert (=> b!198890 (= e!136508 (= (_1!9212 lt!310188) (withMovedBitIndex!0 (_2!9212 lt!310188) (bvsub lt!310171 lt!310184))))))

(assert (=> b!198890 (or (= (bvand lt!310171 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310184 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!310171 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!310171 lt!310184) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198890 (= lt!310184 (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309690))) (currentByte!9297 (_2!9210 lt!309690)) (currentBit!9292 (_2!9210 lt!309690))))))

(assert (=> b!198890 (= lt!310171 (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))))))

(declare-fun b!198891 () Bool)

(declare-fun e!136507 () Unit!14062)

(declare-fun Unit!14091 () Unit!14062)

(assert (=> b!198891 (= e!136507 Unit!14091)))

(declare-fun b!198892 () Bool)

(declare-fun lt!310185 () Unit!14062)

(assert (=> b!198892 (= e!136507 lt!310185)))

(declare-fun lt!310189 () (_ BitVec 64))

(assert (=> b!198892 (= lt!310189 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!310173 () (_ BitVec 64))

(assert (=> b!198892 (= lt!310173 (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))))))

(assert (=> b!198892 (= lt!310185 (arrayBitRangesEqSymmetric!0 (buf!4950 (_2!9210 lt!309686)) (buf!4950 (_2!9210 lt!309690)) lt!310189 lt!310173))))

(assert (=> b!198892 (arrayBitRangesEq!0 (buf!4950 (_2!9210 lt!309690)) (buf!4950 (_2!9210 lt!309686)) lt!310189 lt!310173)))

(declare-fun b!198893 () Bool)

(declare-fun res!166503 () Bool)

(assert (=> b!198893 (=> (not res!166503) (not e!136508))))

(assert (=> b!198893 (= res!166503 (isPrefixOf!0 (_1!9212 lt!310188) (_2!9210 lt!309686)))))

(declare-fun b!198894 () Bool)

(declare-fun res!166505 () Bool)

(assert (=> b!198894 (=> (not res!166505) (not e!136508))))

(assert (=> b!198894 (= res!166505 (isPrefixOf!0 (_2!9212 lt!310188) (_2!9210 lt!309690)))))

(declare-fun d!67673 () Bool)

(assert (=> d!67673 e!136508))

(declare-fun res!166504 () Bool)

(assert (=> d!67673 (=> (not res!166504) (not e!136508))))

(assert (=> d!67673 (= res!166504 (isPrefixOf!0 (_1!9212 lt!310188) (_2!9212 lt!310188)))))

(declare-fun lt!310177 () BitStream!8024)

(assert (=> d!67673 (= lt!310188 (tuple2!17129 lt!310177 (_2!9210 lt!309690)))))

(declare-fun lt!310176 () Unit!14062)

(declare-fun lt!310178 () Unit!14062)

(assert (=> d!67673 (= lt!310176 lt!310178)))

(assert (=> d!67673 (isPrefixOf!0 lt!310177 (_2!9210 lt!309690))))

(assert (=> d!67673 (= lt!310178 (lemmaIsPrefixTransitive!0 lt!310177 (_2!9210 lt!309690) (_2!9210 lt!309690)))))

(declare-fun lt!310182 () Unit!14062)

(declare-fun lt!310186 () Unit!14062)

(assert (=> d!67673 (= lt!310182 lt!310186)))

(assert (=> d!67673 (isPrefixOf!0 lt!310177 (_2!9210 lt!309690))))

(assert (=> d!67673 (= lt!310186 (lemmaIsPrefixTransitive!0 lt!310177 (_2!9210 lt!309686) (_2!9210 lt!309690)))))

(declare-fun lt!310183 () Unit!14062)

(assert (=> d!67673 (= lt!310183 e!136507)))

(declare-fun c!9901 () Bool)

(assert (=> d!67673 (= c!9901 (not (= (size!4458 (buf!4950 (_2!9210 lt!309686))) #b00000000000000000000000000000000)))))

(declare-fun lt!310187 () Unit!14062)

(declare-fun lt!310170 () Unit!14062)

(assert (=> d!67673 (= lt!310187 lt!310170)))

(assert (=> d!67673 (isPrefixOf!0 (_2!9210 lt!309690) (_2!9210 lt!309690))))

(assert (=> d!67673 (= lt!310170 (lemmaIsPrefixRefl!0 (_2!9210 lt!309690)))))

(declare-fun lt!310174 () Unit!14062)

(declare-fun lt!310172 () Unit!14062)

(assert (=> d!67673 (= lt!310174 lt!310172)))

(assert (=> d!67673 (= lt!310172 (lemmaIsPrefixRefl!0 (_2!9210 lt!309690)))))

(declare-fun lt!310175 () Unit!14062)

(declare-fun lt!310179 () Unit!14062)

(assert (=> d!67673 (= lt!310175 lt!310179)))

(assert (=> d!67673 (isPrefixOf!0 lt!310177 lt!310177)))

(assert (=> d!67673 (= lt!310179 (lemmaIsPrefixRefl!0 lt!310177))))

(declare-fun lt!310180 () Unit!14062)

(declare-fun lt!310181 () Unit!14062)

(assert (=> d!67673 (= lt!310180 lt!310181)))

(assert (=> d!67673 (isPrefixOf!0 (_2!9210 lt!309686) (_2!9210 lt!309686))))

(assert (=> d!67673 (= lt!310181 (lemmaIsPrefixRefl!0 (_2!9210 lt!309686)))))

(assert (=> d!67673 (= lt!310177 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))))))

(assert (=> d!67673 (isPrefixOf!0 (_2!9210 lt!309686) (_2!9210 lt!309690))))

(assert (=> d!67673 (= (reader!0 (_2!9210 lt!309686) (_2!9210 lt!309690)) lt!310188)))

(assert (= (and d!67673 c!9901) b!198892))

(assert (= (and d!67673 (not c!9901)) b!198891))

(assert (= (and d!67673 res!166504) b!198893))

(assert (= (and b!198893 res!166503) b!198894))

(assert (= (and b!198894 res!166505) b!198890))

(declare-fun m!308077 () Bool)

(assert (=> b!198893 m!308077))

(declare-fun m!308079 () Bool)

(assert (=> b!198894 m!308079))

(assert (=> b!198892 m!307719))

(declare-fun m!308081 () Bool)

(assert (=> b!198892 m!308081))

(declare-fun m!308083 () Bool)

(assert (=> b!198892 m!308083))

(assert (=> d!67673 m!308035))

(assert (=> d!67673 m!308037))

(declare-fun m!308085 () Bool)

(assert (=> d!67673 m!308085))

(declare-fun m!308087 () Bool)

(assert (=> d!67673 m!308087))

(declare-fun m!308089 () Bool)

(assert (=> d!67673 m!308089))

(declare-fun m!308091 () Bool)

(assert (=> d!67673 m!308091))

(declare-fun m!308093 () Bool)

(assert (=> d!67673 m!308093))

(assert (=> d!67673 m!307717))

(declare-fun m!308095 () Bool)

(assert (=> d!67673 m!308095))

(declare-fun m!308097 () Bool)

(assert (=> d!67673 m!308097))

(declare-fun m!308099 () Bool)

(assert (=> d!67673 m!308099))

(declare-fun m!308101 () Bool)

(assert (=> b!198890 m!308101))

(assert (=> b!198890 m!307653))

(assert (=> b!198890 m!307719))

(assert (=> b!198697 d!67673))

(declare-fun d!67675 () Bool)

(declare-fun e!136509 () Bool)

(assert (=> d!67675 e!136509))

(declare-fun res!166507 () Bool)

(assert (=> d!67675 (=> (not res!166507) (not e!136509))))

(declare-fun lt!310194 () (_ BitVec 64))

(declare-fun lt!310195 () (_ BitVec 64))

(declare-fun lt!310191 () (_ BitVec 64))

(assert (=> d!67675 (= res!166507 (= lt!310195 (bvsub lt!310194 lt!310191)))))

(assert (=> d!67675 (or (= (bvand lt!310194 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310191 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!310194 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!310194 lt!310191) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67675 (= lt!310191 (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!309692)))) ((_ sign_extend 32) (currentByte!9297 (_1!9211 lt!309692))) ((_ sign_extend 32) (currentBit!9292 (_1!9211 lt!309692)))))))

(declare-fun lt!310190 () (_ BitVec 64))

(declare-fun lt!310193 () (_ BitVec 64))

(assert (=> d!67675 (= lt!310194 (bvmul lt!310190 lt!310193))))

(assert (=> d!67675 (or (= lt!310190 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!310193 (bvsdiv (bvmul lt!310190 lt!310193) lt!310190)))))

(assert (=> d!67675 (= lt!310193 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67675 (= lt!310190 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!309692)))))))

(assert (=> d!67675 (= lt!310195 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 (_1!9211 lt!309692))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 (_1!9211 lt!309692)))))))

(assert (=> d!67675 (invariant!0 (currentBit!9292 (_1!9211 lt!309692)) (currentByte!9297 (_1!9211 lt!309692)) (size!4458 (buf!4950 (_1!9211 lt!309692))))))

(assert (=> d!67675 (= (bitIndex!0 (size!4458 (buf!4950 (_1!9211 lt!309692))) (currentByte!9297 (_1!9211 lt!309692)) (currentBit!9292 (_1!9211 lt!309692))) lt!310195)))

(declare-fun b!198895 () Bool)

(declare-fun res!166506 () Bool)

(assert (=> b!198895 (=> (not res!166506) (not e!136509))))

(assert (=> b!198895 (= res!166506 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!310195))))

(declare-fun b!198896 () Bool)

(declare-fun lt!310192 () (_ BitVec 64))

(assert (=> b!198896 (= e!136509 (bvsle lt!310195 (bvmul lt!310192 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198896 (or (= lt!310192 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!310192 #b0000000000000000000000000000000000000000000000000000000000001000) lt!310192)))))

(assert (=> b!198896 (= lt!310192 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!309692)))))))

(assert (= (and d!67675 res!166507) b!198895))

(assert (= (and b!198895 res!166506) b!198896))

(declare-fun m!308103 () Bool)

(assert (=> d!67675 m!308103))

(declare-fun m!308105 () Bool)

(assert (=> d!67675 m!308105))

(assert (=> b!198697 d!67675))

(declare-fun d!67677 () Bool)

(declare-fun lt!310196 () tuple2!17140)

(assert (=> d!67677 (= lt!310196 (readBit!0 lt!309693))))

(assert (=> d!67677 (= (readBitPure!0 lt!309693) (tuple2!17127 (_2!9218 lt!310196) (_1!9218 lt!310196)))))

(declare-fun bs!16740 () Bool)

(assert (= bs!16740 d!67677))

(declare-fun m!308107 () Bool)

(assert (=> bs!16740 m!308107))

(assert (=> b!198697 d!67677))

(declare-fun d!67679 () Bool)

(declare-fun lt!310197 () tuple2!17142)

(assert (=> d!67679 (= lt!310197 (readNBitsLSBFirstsLoop!0 (_1!9212 lt!309700) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!309673))))

(assert (=> d!67679 (= (readNBitsLSBFirstsLoopPure!0 (_1!9212 lt!309700) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!309673) (tuple2!17131 (_2!9219 lt!310197) (_1!9219 lt!310197)))))

(declare-fun bs!16741 () Bool)

(assert (= bs!16741 d!67679))

(declare-fun m!308109 () Bool)

(assert (=> bs!16741 m!308109))

(assert (=> b!198697 d!67679))

(declare-fun d!67681 () Bool)

(assert (=> d!67681 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!309690)))) ((_ sign_extend 32) (currentByte!9297 thiss!1204)) ((_ sign_extend 32) (currentBit!9292 thiss!1204)) lt!309680) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!309690)))) ((_ sign_extend 32) (currentByte!9297 thiss!1204)) ((_ sign_extend 32) (currentBit!9292 thiss!1204))) lt!309680))))

(declare-fun bs!16742 () Bool)

(assert (= bs!16742 d!67681))

(declare-fun m!308111 () Bool)

(assert (=> bs!16742 m!308111))

(assert (=> b!198697 d!67681))

(declare-fun d!67683 () Bool)

(declare-fun e!136510 () Bool)

(assert (=> d!67683 e!136510))

(declare-fun res!166509 () Bool)

(assert (=> d!67683 (=> (not res!166509) (not e!136510))))

(declare-fun lt!310199 () (_ BitVec 64))

(declare-fun lt!310203 () (_ BitVec 64))

(declare-fun lt!310202 () (_ BitVec 64))

(assert (=> d!67683 (= res!166509 (= lt!310203 (bvsub lt!310202 lt!310199)))))

(assert (=> d!67683 (or (= (bvand lt!310202 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310199 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!310202 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!310202 lt!310199) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67683 (= lt!310199 (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!309690)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309690))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309690)))))))

(declare-fun lt!310198 () (_ BitVec 64))

(declare-fun lt!310201 () (_ BitVec 64))

(assert (=> d!67683 (= lt!310202 (bvmul lt!310198 lt!310201))))

(assert (=> d!67683 (or (= lt!310198 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!310201 (bvsdiv (bvmul lt!310198 lt!310201) lt!310198)))))

(assert (=> d!67683 (= lt!310201 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67683 (= lt!310198 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!309690)))))))

(assert (=> d!67683 (= lt!310203 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309690))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309690)))))))

(assert (=> d!67683 (invariant!0 (currentBit!9292 (_2!9210 lt!309690)) (currentByte!9297 (_2!9210 lt!309690)) (size!4458 (buf!4950 (_2!9210 lt!309690))))))

(assert (=> d!67683 (= (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309690))) (currentByte!9297 (_2!9210 lt!309690)) (currentBit!9292 (_2!9210 lt!309690))) lt!310203)))

(declare-fun b!198897 () Bool)

(declare-fun res!166508 () Bool)

(assert (=> b!198897 (=> (not res!166508) (not e!136510))))

(assert (=> b!198897 (= res!166508 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!310203))))

(declare-fun b!198898 () Bool)

(declare-fun lt!310200 () (_ BitVec 64))

(assert (=> b!198898 (= e!136510 (bvsle lt!310203 (bvmul lt!310200 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198898 (or (= lt!310200 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!310200 #b0000000000000000000000000000000000000000000000000000000000001000) lt!310200)))))

(assert (=> b!198898 (= lt!310200 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!309690)))))))

(assert (= (and d!67683 res!166509) b!198897))

(assert (= (and b!198897 res!166508) b!198898))

(declare-fun m!308113 () Bool)

(assert (=> d!67683 m!308113))

(assert (=> d!67683 m!307693))

(assert (=> b!198708 d!67683))

(declare-fun d!67685 () Bool)

(declare-fun res!166512 () Bool)

(declare-fun e!136511 () Bool)

(assert (=> d!67685 (=> (not res!166512) (not e!136511))))

(assert (=> d!67685 (= res!166512 (= (size!4458 (buf!4950 thiss!1204)) (size!4458 (buf!4950 (_2!9210 lt!309690)))))))

(assert (=> d!67685 (= (isPrefixOf!0 thiss!1204 (_2!9210 lt!309690)) e!136511)))

(declare-fun b!198899 () Bool)

(declare-fun res!166510 () Bool)

(assert (=> b!198899 (=> (not res!166510) (not e!136511))))

(assert (=> b!198899 (= res!166510 (bvsle (bitIndex!0 (size!4458 (buf!4950 thiss!1204)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309690))) (currentByte!9297 (_2!9210 lt!309690)) (currentBit!9292 (_2!9210 lt!309690)))))))

(declare-fun b!198900 () Bool)

(declare-fun e!136512 () Bool)

(assert (=> b!198900 (= e!136511 e!136512)))

(declare-fun res!166511 () Bool)

(assert (=> b!198900 (=> res!166511 e!136512)))

(assert (=> b!198900 (= res!166511 (= (size!4458 (buf!4950 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!198901 () Bool)

(assert (=> b!198901 (= e!136512 (arrayBitRangesEq!0 (buf!4950 thiss!1204) (buf!4950 (_2!9210 lt!309690)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4458 (buf!4950 thiss!1204)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204))))))

(assert (= (and d!67685 res!166512) b!198899))

(assert (= (and b!198899 res!166510) b!198900))

(assert (= (and b!198900 (not res!166511)) b!198901))

(assert (=> b!198899 m!307721))

(assert (=> b!198899 m!307653))

(assert (=> b!198901 m!307721))

(assert (=> b!198901 m!307721))

(declare-fun m!308115 () Bool)

(assert (=> b!198901 m!308115))

(assert (=> b!198708 d!67685))

(declare-fun d!67687 () Bool)

(assert (=> d!67687 (isPrefixOf!0 thiss!1204 (_2!9210 lt!309690))))

(declare-fun lt!310206 () Unit!14062)

(declare-fun choose!30 (BitStream!8024 BitStream!8024 BitStream!8024) Unit!14062)

(assert (=> d!67687 (= lt!310206 (choose!30 thiss!1204 (_2!9210 lt!309686) (_2!9210 lt!309690)))))

(assert (=> d!67687 (isPrefixOf!0 thiss!1204 (_2!9210 lt!309686))))

(assert (=> d!67687 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9210 lt!309686) (_2!9210 lt!309690)) lt!310206)))

(declare-fun bs!16743 () Bool)

(assert (= bs!16743 d!67687))

(assert (=> bs!16743 m!307655))

(declare-fun m!308117 () Bool)

(assert (=> bs!16743 m!308117))

(assert (=> bs!16743 m!307709))

(assert (=> b!198708 d!67687))

(declare-fun b!199065 () Bool)

(declare-fun e!136613 () (_ BitVec 64))

(assert (=> b!199065 (= e!136613 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!199066 () Bool)

(declare-fun e!136611 () Bool)

(declare-fun lt!310765 () (_ BitVec 64))

(assert (=> b!199066 (= e!136611 (validate_offset_bits!1 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!309686)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309686))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309686))) lt!310765))))

(declare-fun b!199067 () Bool)

(declare-fun e!136608 () Bool)

(declare-fun lt!310749 () tuple2!17130)

(declare-fun lt!310762 () tuple2!17128)

(assert (=> b!199067 (= e!136608 (= (_1!9213 lt!310749) (_2!9212 lt!310762)))))

(declare-fun b!199068 () Bool)

(declare-fun res!166650 () Bool)

(declare-fun call!3143 () Bool)

(assert (=> b!199068 (= res!166650 call!3143)))

(declare-fun e!136606 () Bool)

(assert (=> b!199068 (=> (not res!166650) (not e!136606))))

(declare-fun b!199069 () Bool)

(declare-fun e!136609 () tuple2!17124)

(declare-fun lt!310750 () tuple2!17124)

(assert (=> b!199069 (= e!136609 (tuple2!17125 (_1!9210 lt!310750) (_2!9210 lt!310750)))))

(declare-fun lt!310760 () Bool)

(assert (=> b!199069 (= lt!310760 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!310754 () tuple2!17124)

(assert (=> b!199069 (= lt!310754 (appendBit!0 (_2!9210 lt!309686) lt!310760))))

(declare-fun res!166648 () Bool)

(assert (=> b!199069 (= res!166648 (= (size!4458 (buf!4950 (_2!9210 lt!309686))) (size!4458 (buf!4950 (_2!9210 lt!310754)))))))

(assert (=> b!199069 (=> (not res!166648) (not e!136606))))

(assert (=> b!199069 e!136606))

(declare-fun lt!310742 () tuple2!17124)

(assert (=> b!199069 (= lt!310742 lt!310754)))

(assert (=> b!199069 (= lt!310750 (appendBitsLSBFirstLoopTR!0 (_2!9210 lt!310742) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!310722 () Unit!14062)

(assert (=> b!199069 (= lt!310722 (lemmaIsPrefixTransitive!0 (_2!9210 lt!309686) (_2!9210 lt!310742) (_2!9210 lt!310750)))))

(assert (=> b!199069 (isPrefixOf!0 (_2!9210 lt!309686) (_2!9210 lt!310750))))

(declare-fun lt!310771 () Unit!14062)

(assert (=> b!199069 (= lt!310771 lt!310722)))

(assert (=> b!199069 (invariant!0 (currentBit!9292 (_2!9210 lt!309686)) (currentByte!9297 (_2!9210 lt!309686)) (size!4458 (buf!4950 (_2!9210 lt!310742))))))

(declare-fun lt!310763 () BitStream!8024)

(assert (=> b!199069 (= lt!310763 (BitStream!8025 (buf!4950 (_2!9210 lt!310742)) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))))))

(assert (=> b!199069 (invariant!0 (currentBit!9292 lt!310763) (currentByte!9297 lt!310763) (size!4458 (buf!4950 (_2!9210 lt!310750))))))

(declare-fun lt!310738 () BitStream!8024)

(assert (=> b!199069 (= lt!310738 (BitStream!8025 (buf!4950 (_2!9210 lt!310750)) (currentByte!9297 lt!310763) (currentBit!9292 lt!310763)))))

(declare-fun lt!310721 () tuple2!17126)

(assert (=> b!199069 (= lt!310721 (readBitPure!0 lt!310763))))

(declare-fun lt!310743 () tuple2!17126)

(assert (=> b!199069 (= lt!310743 (readBitPure!0 lt!310738))))

(declare-fun lt!310747 () Unit!14062)

(assert (=> b!199069 (= lt!310747 (readBitPrefixLemma!0 lt!310763 (_2!9210 lt!310750)))))

(declare-fun res!166647 () Bool)

(assert (=> b!199069 (= res!166647 (= (bitIndex!0 (size!4458 (buf!4950 (_1!9211 lt!310721))) (currentByte!9297 (_1!9211 lt!310721)) (currentBit!9292 (_1!9211 lt!310721))) (bitIndex!0 (size!4458 (buf!4950 (_1!9211 lt!310743))) (currentByte!9297 (_1!9211 lt!310743)) (currentBit!9292 (_1!9211 lt!310743)))))))

(declare-fun e!136614 () Bool)

(assert (=> b!199069 (=> (not res!166647) (not e!136614))))

(assert (=> b!199069 e!136614))

(declare-fun lt!310720 () Unit!14062)

(assert (=> b!199069 (= lt!310720 lt!310747)))

(declare-fun lt!310756 () tuple2!17128)

(assert (=> b!199069 (= lt!310756 (reader!0 (_2!9210 lt!309686) (_2!9210 lt!310750)))))

(declare-fun lt!310772 () tuple2!17128)

(assert (=> b!199069 (= lt!310772 (reader!0 (_2!9210 lt!310742) (_2!9210 lt!310750)))))

(declare-fun lt!310769 () tuple2!17126)

(assert (=> b!199069 (= lt!310769 (readBitPure!0 (_1!9212 lt!310756)))))

(assert (=> b!199069 (= (_2!9211 lt!310769) lt!310760)))

(declare-fun lt!310748 () Unit!14062)

(declare-fun Unit!14092 () Unit!14062)

(assert (=> b!199069 (= lt!310748 Unit!14092)))

(declare-fun lt!310724 () (_ BitVec 64))

(assert (=> b!199069 (= lt!310724 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!310733 () (_ BitVec 64))

(assert (=> b!199069 (= lt!310733 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!310759 () Unit!14062)

(assert (=> b!199069 (= lt!310759 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9210 lt!309686) (buf!4950 (_2!9210 lt!310750)) lt!310733))))

(assert (=> b!199069 (validate_offset_bits!1 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310750)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309686))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309686))) lt!310733)))

(declare-fun lt!310726 () Unit!14062)

(assert (=> b!199069 (= lt!310726 lt!310759)))

(declare-fun lt!310758 () tuple2!17130)

(assert (=> b!199069 (= lt!310758 (readNBitsLSBFirstsLoopPure!0 (_1!9212 lt!310756) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!310724))))

(declare-fun lt!310728 () (_ BitVec 64))

(assert (=> b!199069 (= lt!310728 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!310767 () Unit!14062)

(assert (=> b!199069 (= lt!310767 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9210 lt!310742) (buf!4950 (_2!9210 lt!310750)) lt!310728))))

(assert (=> b!199069 (validate_offset_bits!1 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310750)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!310742))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!310742))) lt!310728)))

(declare-fun lt!310753 () Unit!14062)

(assert (=> b!199069 (= lt!310753 lt!310767)))

(declare-fun lt!310757 () tuple2!17130)

(assert (=> b!199069 (= lt!310757 (readNBitsLSBFirstsLoopPure!0 (_1!9212 lt!310772) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!310724 (ite (_2!9211 lt!310769) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!310768 () tuple2!17130)

(assert (=> b!199069 (= lt!310768 (readNBitsLSBFirstsLoopPure!0 (_1!9212 lt!310756) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!310724))))

(declare-fun c!9918 () Bool)

(assert (=> b!199069 (= c!9918 (_2!9211 (readBitPure!0 (_1!9212 lt!310756))))))

(declare-fun lt!310770 () tuple2!17130)

(assert (=> b!199069 (= lt!310770 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9212 lt!310756) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!310724 e!136613)))))

(declare-fun lt!310731 () Unit!14062)

(assert (=> b!199069 (= lt!310731 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9212 lt!310756) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!310724))))

(assert (=> b!199069 (and (= (_2!9213 lt!310768) (_2!9213 lt!310770)) (= (_1!9213 lt!310768) (_1!9213 lt!310770)))))

(declare-fun lt!310744 () Unit!14062)

(assert (=> b!199069 (= lt!310744 lt!310731)))

(assert (=> b!199069 (= (_1!9212 lt!310756) (withMovedBitIndex!0 (_2!9212 lt!310756) (bvsub (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310750))) (currentByte!9297 (_2!9210 lt!310750)) (currentBit!9292 (_2!9210 lt!310750))))))))

(declare-fun lt!310774 () Unit!14062)

(declare-fun Unit!14093 () Unit!14062)

(assert (=> b!199069 (= lt!310774 Unit!14093)))

(assert (=> b!199069 (= (_1!9212 lt!310772) (withMovedBitIndex!0 (_2!9212 lt!310772) (bvsub (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310742))) (currentByte!9297 (_2!9210 lt!310742)) (currentBit!9292 (_2!9210 lt!310742))) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310750))) (currentByte!9297 (_2!9210 lt!310750)) (currentBit!9292 (_2!9210 lt!310750))))))))

(declare-fun lt!310752 () Unit!14062)

(declare-fun Unit!14094 () Unit!14062)

(assert (=> b!199069 (= lt!310752 Unit!14094)))

(assert (=> b!199069 (= (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))) (bvsub (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310742))) (currentByte!9297 (_2!9210 lt!310742)) (currentBit!9292 (_2!9210 lt!310742))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!310723 () Unit!14062)

(declare-fun Unit!14095 () Unit!14062)

(assert (=> b!199069 (= lt!310723 Unit!14095)))

(assert (=> b!199069 (= (_2!9213 lt!310758) (_2!9213 lt!310757))))

(declare-fun lt!310741 () Unit!14062)

(declare-fun Unit!14096 () Unit!14062)

(assert (=> b!199069 (= lt!310741 Unit!14096)))

(assert (=> b!199069 (invariant!0 (currentBit!9292 (_2!9210 lt!310750)) (currentByte!9297 (_2!9210 lt!310750)) (size!4458 (buf!4950 (_2!9210 lt!310750))))))

(declare-fun lt!310751 () Unit!14062)

(declare-fun Unit!14097 () Unit!14062)

(assert (=> b!199069 (= lt!310751 Unit!14097)))

(assert (=> b!199069 (= (size!4458 (buf!4950 (_2!9210 lt!309686))) (size!4458 (buf!4950 (_2!9210 lt!310750))))))

(declare-fun lt!310736 () Unit!14062)

(declare-fun Unit!14098 () Unit!14062)

(assert (=> b!199069 (= lt!310736 Unit!14098)))

(assert (=> b!199069 (= (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310750))) (currentByte!9297 (_2!9210 lt!310750)) (currentBit!9292 (_2!9210 lt!310750))) (bvsub (bvadd (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!310735 () Unit!14062)

(declare-fun Unit!14099 () Unit!14062)

(assert (=> b!199069 (= lt!310735 Unit!14099)))

(declare-fun lt!310732 () Unit!14062)

(declare-fun Unit!14100 () Unit!14062)

(assert (=> b!199069 (= lt!310732 Unit!14100)))

(declare-fun lt!310740 () tuple2!17128)

(assert (=> b!199069 (= lt!310740 (reader!0 (_2!9210 lt!309686) (_2!9210 lt!310750)))))

(declare-fun lt!310729 () (_ BitVec 64))

(assert (=> b!199069 (= lt!310729 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!310755 () Unit!14062)

(assert (=> b!199069 (= lt!310755 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9210 lt!309686) (buf!4950 (_2!9210 lt!310750)) lt!310729))))

(assert (=> b!199069 (validate_offset_bits!1 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310750)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309686))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309686))) lt!310729)))

(declare-fun lt!310766 () Unit!14062)

(assert (=> b!199069 (= lt!310766 lt!310755)))

(declare-fun lt!310739 () tuple2!17130)

(assert (=> b!199069 (= lt!310739 (readNBitsLSBFirstsLoopPure!0 (_1!9212 lt!310740) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!166649 () Bool)

(assert (=> b!199069 (= res!166649 (= (_2!9213 lt!310739) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!136612 () Bool)

(assert (=> b!199069 (=> (not res!166649) (not e!136612))))

(assert (=> b!199069 e!136612))

(declare-fun lt!310761 () Unit!14062)

(declare-fun Unit!14101 () Unit!14062)

(assert (=> b!199069 (= lt!310761 Unit!14101)))

(declare-fun b!199070 () Bool)

(assert (=> b!199070 (= e!136613 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!199071 () Bool)

(declare-fun res!166651 () Bool)

(assert (=> b!199071 (= res!166651 (= (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310754))) (currentByte!9297 (_2!9210 lt!310754)) (currentBit!9292 (_2!9210 lt!310754))) (bvadd (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!199071 (=> (not res!166651) (not e!136606))))

(declare-fun d!67689 () Bool)

(declare-fun e!136610 () Bool)

(assert (=> d!67689 e!136610))

(declare-fun res!166643 () Bool)

(assert (=> d!67689 (=> (not res!166643) (not e!136610))))

(declare-fun lt!310730 () tuple2!17124)

(assert (=> d!67689 (= res!166643 (invariant!0 (currentBit!9292 (_2!9210 lt!310730)) (currentByte!9297 (_2!9210 lt!310730)) (size!4458 (buf!4950 (_2!9210 lt!310730)))))))

(assert (=> d!67689 (= lt!310730 e!136609)))

(declare-fun c!9919 () Bool)

(assert (=> d!67689 (= c!9919 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!67689 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!67689 (= (appendBitsLSBFirstLoopTR!0 (_2!9210 lt!309686) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!310730)))

(declare-fun bm!3140 () Bool)

(assert (=> bm!3140 (= call!3143 (isPrefixOf!0 (_2!9210 lt!309686) (ite c!9919 (_2!9210 lt!309686) (_2!9210 lt!310754))))))

(declare-fun b!199072 () Bool)

(assert (=> b!199072 (= e!136610 e!136608)))

(declare-fun res!166652 () Bool)

(assert (=> b!199072 (=> (not res!166652) (not e!136608))))

(assert (=> b!199072 (= res!166652 (= (_2!9213 lt!310749) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!199072 (= lt!310749 (readNBitsLSBFirstsLoopPure!0 (_1!9212 lt!310762) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!310764 () Unit!14062)

(declare-fun lt!310734 () Unit!14062)

(assert (=> b!199072 (= lt!310764 lt!310734)))

(assert (=> b!199072 (validate_offset_bits!1 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310730)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309686))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309686))) lt!310765)))

(assert (=> b!199072 (= lt!310734 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9210 lt!309686) (buf!4950 (_2!9210 lt!310730)) lt!310765))))

(assert (=> b!199072 e!136611))

(declare-fun res!166653 () Bool)

(assert (=> b!199072 (=> (not res!166653) (not e!136611))))

(assert (=> b!199072 (= res!166653 (and (= (size!4458 (buf!4950 (_2!9210 lt!309686))) (size!4458 (buf!4950 (_2!9210 lt!310730)))) (bvsge lt!310765 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199072 (= lt!310765 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!199072 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!199072 (= lt!310762 (reader!0 (_2!9210 lt!309686) (_2!9210 lt!310730)))))

(declare-fun b!199073 () Bool)

(declare-fun e!136607 () Bool)

(declare-fun lt!310727 () tuple2!17126)

(assert (=> b!199073 (= e!136607 (= (bitIndex!0 (size!4458 (buf!4950 (_1!9211 lt!310727))) (currentByte!9297 (_1!9211 lt!310727)) (currentBit!9292 (_1!9211 lt!310727))) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310754))) (currentByte!9297 (_2!9210 lt!310754)) (currentBit!9292 (_2!9210 lt!310754)))))))

(declare-fun b!199074 () Bool)

(assert (=> b!199074 (= e!136612 (= (_1!9213 lt!310739) (_2!9212 lt!310740)))))

(declare-fun b!199075 () Bool)

(assert (=> b!199075 (= e!136614 (= (_2!9211 lt!310721) (_2!9211 lt!310743)))))

(declare-fun b!199076 () Bool)

(declare-fun res!166646 () Bool)

(assert (=> b!199076 (=> (not res!166646) (not e!136610))))

(assert (=> b!199076 (= res!166646 (isPrefixOf!0 (_2!9210 lt!309686) (_2!9210 lt!310730)))))

(declare-fun b!199077 () Bool)

(assert (=> b!199077 (= lt!310727 (readBitPure!0 (readerFrom!0 (_2!9210 lt!310754) (currentBit!9292 (_2!9210 lt!309686)) (currentByte!9297 (_2!9210 lt!309686)))))))

(declare-fun res!166644 () Bool)

(assert (=> b!199077 (= res!166644 (and (= (_2!9211 lt!310727) lt!310760) (= (_1!9211 lt!310727) (_2!9210 lt!310754))))))

(assert (=> b!199077 (=> (not res!166644) (not e!136607))))

(assert (=> b!199077 (= e!136606 e!136607)))

(declare-fun b!199078 () Bool)

(declare-fun res!166645 () Bool)

(assert (=> b!199078 (=> (not res!166645) (not e!136610))))

(declare-fun lt!310737 () (_ BitVec 64))

(declare-fun lt!310775 () (_ BitVec 64))

(assert (=> b!199078 (= res!166645 (= (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310730))) (currentByte!9297 (_2!9210 lt!310730)) (currentBit!9292 (_2!9210 lt!310730))) (bvsub lt!310737 lt!310775)))))

(assert (=> b!199078 (or (= (bvand lt!310737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310775 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!310737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!310737 lt!310775) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199078 (= lt!310775 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!310745 () (_ BitVec 64))

(declare-fun lt!310725 () (_ BitVec 64))

(assert (=> b!199078 (= lt!310737 (bvadd lt!310745 lt!310725))))

(assert (=> b!199078 (or (not (= (bvand lt!310745 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!310725 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!310745 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!310745 lt!310725) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199078 (= lt!310725 ((_ sign_extend 32) nBits!348))))

(assert (=> b!199078 (= lt!310745 (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))))))

(declare-fun b!199079 () Bool)

(declare-fun Unit!14102 () Unit!14062)

(assert (=> b!199079 (= e!136609 (tuple2!17125 Unit!14102 (_2!9210 lt!309686)))))

(declare-fun lt!310773 () Unit!14062)

(assert (=> b!199079 (= lt!310773 (lemmaIsPrefixRefl!0 (_2!9210 lt!309686)))))

(assert (=> b!199079 call!3143))

(declare-fun lt!310746 () Unit!14062)

(assert (=> b!199079 (= lt!310746 lt!310773)))

(declare-fun b!199080 () Bool)

(declare-fun res!166654 () Bool)

(assert (=> b!199080 (=> (not res!166654) (not e!136610))))

(assert (=> b!199080 (= res!166654 (= (size!4458 (buf!4950 (_2!9210 lt!309686))) (size!4458 (buf!4950 (_2!9210 lt!310730)))))))

(assert (= (and d!67689 c!9919) b!199079))

(assert (= (and d!67689 (not c!9919)) b!199069))

(assert (= (and b!199069 res!166648) b!199071))

(assert (= (and b!199071 res!166651) b!199068))

(assert (= (and b!199068 res!166650) b!199077))

(assert (= (and b!199077 res!166644) b!199073))

(assert (= (and b!199069 res!166647) b!199075))

(assert (= (and b!199069 c!9918) b!199065))

(assert (= (and b!199069 (not c!9918)) b!199070))

(assert (= (and b!199069 res!166649) b!199074))

(assert (= (or b!199079 b!199068) bm!3140))

(assert (= (and d!67689 res!166643) b!199080))

(assert (= (and b!199080 res!166654) b!199078))

(assert (= (and b!199078 res!166645) b!199076))

(assert (= (and b!199076 res!166646) b!199072))

(assert (= (and b!199072 res!166653) b!199066))

(assert (= (and b!199072 res!166652) b!199067))

(declare-fun m!308365 () Bool)

(assert (=> b!199073 m!308365))

(declare-fun m!308367 () Bool)

(assert (=> b!199073 m!308367))

(declare-fun m!308369 () Bool)

(assert (=> b!199069 m!308369))

(declare-fun m!308371 () Bool)

(assert (=> b!199069 m!308371))

(declare-fun m!308373 () Bool)

(assert (=> b!199069 m!308373))

(declare-fun m!308375 () Bool)

(assert (=> b!199069 m!308375))

(declare-fun m!308377 () Bool)

(assert (=> b!199069 m!308377))

(declare-fun m!308379 () Bool)

(assert (=> b!199069 m!308379))

(declare-fun m!308381 () Bool)

(assert (=> b!199069 m!308381))

(declare-fun m!308383 () Bool)

(assert (=> b!199069 m!308383))

(declare-fun m!308385 () Bool)

(assert (=> b!199069 m!308385))

(declare-fun m!308387 () Bool)

(assert (=> b!199069 m!308387))

(declare-fun m!308389 () Bool)

(assert (=> b!199069 m!308389))

(declare-fun m!308391 () Bool)

(assert (=> b!199069 m!308391))

(declare-fun m!308393 () Bool)

(assert (=> b!199069 m!308393))

(declare-fun m!308395 () Bool)

(assert (=> b!199069 m!308395))

(declare-fun m!308397 () Bool)

(assert (=> b!199069 m!308397))

(declare-fun m!308399 () Bool)

(assert (=> b!199069 m!308399))

(declare-fun m!308401 () Bool)

(assert (=> b!199069 m!308401))

(declare-fun m!308403 () Bool)

(assert (=> b!199069 m!308403))

(assert (=> b!199069 m!308401))

(declare-fun m!308405 () Bool)

(assert (=> b!199069 m!308405))

(declare-fun m!308407 () Bool)

(assert (=> b!199069 m!308407))

(declare-fun m!308409 () Bool)

(assert (=> b!199069 m!308409))

(declare-fun m!308411 () Bool)

(assert (=> b!199069 m!308411))

(declare-fun m!308413 () Bool)

(assert (=> b!199069 m!308413))

(assert (=> b!199069 m!307719))

(declare-fun m!308415 () Bool)

(assert (=> b!199069 m!308415))

(declare-fun m!308417 () Bool)

(assert (=> b!199069 m!308417))

(declare-fun m!308419 () Bool)

(assert (=> b!199069 m!308419))

(declare-fun m!308421 () Bool)

(assert (=> b!199069 m!308421))

(declare-fun m!308423 () Bool)

(assert (=> b!199069 m!308423))

(declare-fun m!308425 () Bool)

(assert (=> b!199069 m!308425))

(declare-fun m!308427 () Bool)

(assert (=> b!199069 m!308427))

(declare-fun m!308429 () Bool)

(assert (=> b!199069 m!308429))

(declare-fun m!308431 () Bool)

(assert (=> b!199069 m!308431))

(declare-fun m!308433 () Bool)

(assert (=> b!199069 m!308433))

(declare-fun m!308435 () Bool)

(assert (=> d!67689 m!308435))

(assert (=> b!199071 m!308367))

(assert (=> b!199071 m!307719))

(declare-fun m!308437 () Bool)

(assert (=> b!199072 m!308437))

(assert (=> b!199072 m!308403))

(declare-fun m!308439 () Bool)

(assert (=> b!199072 m!308439))

(declare-fun m!308441 () Bool)

(assert (=> b!199072 m!308441))

(assert (=> b!199072 m!308423))

(declare-fun m!308443 () Bool)

(assert (=> b!199072 m!308443))

(declare-fun m!308445 () Bool)

(assert (=> b!199076 m!308445))

(assert (=> b!199079 m!308093))

(declare-fun m!308447 () Bool)

(assert (=> b!199077 m!308447))

(assert (=> b!199077 m!308447))

(declare-fun m!308449 () Bool)

(assert (=> b!199077 m!308449))

(declare-fun m!308451 () Bool)

(assert (=> b!199078 m!308451))

(assert (=> b!199078 m!307719))

(declare-fun m!308453 () Bool)

(assert (=> bm!3140 m!308453))

(declare-fun m!308455 () Bool)

(assert (=> b!199066 m!308455))

(assert (=> b!198708 d!67689))

(declare-fun d!67737 () Bool)

(declare-fun lt!310789 () tuple2!17130)

(declare-fun lt!310792 () tuple2!17130)

(assert (=> d!67737 (and (= (_2!9213 lt!310789) (_2!9213 lt!310792)) (= (_1!9213 lt!310789) (_1!9213 lt!310792)))))

(declare-fun lt!310791 () (_ BitVec 64))

(declare-fun lt!310793 () BitStream!8024)

(declare-fun lt!310788 () Bool)

(declare-fun lt!310790 () Unit!14062)

(declare-fun choose!56 (BitStream!8024 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!17130 tuple2!17130 BitStream!8024 (_ BitVec 64) Bool BitStream!8024 (_ BitVec 64) tuple2!17130 tuple2!17130 BitStream!8024 (_ BitVec 64)) Unit!14062)

(assert (=> d!67737 (= lt!310790 (choose!56 (_1!9212 lt!309684) nBits!348 i!590 lt!309674 lt!310789 (tuple2!17131 (_1!9213 lt!310789) (_2!9213 lt!310789)) (_1!9213 lt!310789) (_2!9213 lt!310789) lt!310788 lt!310793 lt!310791 lt!310792 (tuple2!17131 (_1!9213 lt!310792) (_2!9213 lt!310792)) (_1!9213 lt!310792) (_2!9213 lt!310792)))))

(assert (=> d!67737 (= lt!310792 (readNBitsLSBFirstsLoopPure!0 lt!310793 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!310791))))

(assert (=> d!67737 (= lt!310791 (bvor lt!309674 (ite lt!310788 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67737 (= lt!310793 (withMovedBitIndex!0 (_1!9212 lt!309684) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!67737 (= lt!310788 (_2!9211 (readBitPure!0 (_1!9212 lt!309684))))))

(assert (=> d!67737 (= lt!310789 (readNBitsLSBFirstsLoopPure!0 (_1!9212 lt!309684) nBits!348 i!590 lt!309674))))

(assert (=> d!67737 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9212 lt!309684) nBits!348 i!590 lt!309674) lt!310790)))

(declare-fun bs!16752 () Bool)

(assert (= bs!16752 d!67737))

(assert (=> bs!16752 m!307701))

(declare-fun m!308457 () Bool)

(assert (=> bs!16752 m!308457))

(declare-fun m!308459 () Bool)

(assert (=> bs!16752 m!308459))

(assert (=> bs!16752 m!307675))

(assert (=> bs!16752 m!307685))

(assert (=> b!198698 d!67737))

(declare-fun d!67739 () Bool)

(declare-fun lt!310794 () tuple2!17142)

(assert (=> d!67739 (= lt!310794 (readNBitsLSBFirstsLoop!0 lt!309699 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!309673))))

(assert (=> d!67739 (= (readNBitsLSBFirstsLoopPure!0 lt!309699 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!309673) (tuple2!17131 (_2!9219 lt!310794) (_1!9219 lt!310794)))))

(declare-fun bs!16753 () Bool)

(assert (= bs!16753 d!67739))

(declare-fun m!308461 () Bool)

(assert (=> bs!16753 m!308461))

(assert (=> b!198698 d!67739))

(declare-fun d!67741 () Bool)

(declare-fun e!136615 () Bool)

(assert (=> d!67741 e!136615))

(declare-fun res!166655 () Bool)

(assert (=> d!67741 (=> (not res!166655) (not e!136615))))

(declare-fun lt!310796 () (_ BitVec 64))

(declare-fun lt!310795 () BitStream!8024)

(assert (=> d!67741 (= res!166655 (= (bvadd lt!310796 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4458 (buf!4950 lt!310795)) (currentByte!9297 lt!310795) (currentBit!9292 lt!310795))))))

(assert (=> d!67741 (or (not (= (bvand lt!310796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!310796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!310796 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67741 (= lt!310796 (bitIndex!0 (size!4458 (buf!4950 (_1!9212 lt!309684))) (currentByte!9297 (_1!9212 lt!309684)) (currentBit!9292 (_1!9212 lt!309684))))))

(assert (=> d!67741 (= lt!310795 (_2!9210 (moveBitIndex!0 (_1!9212 lt!309684) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!67741 (moveBitIndexPrecond!0 (_1!9212 lt!309684) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!67741 (= (withMovedBitIndex!0 (_1!9212 lt!309684) #b0000000000000000000000000000000000000000000000000000000000000001) lt!310795)))

(declare-fun b!199081 () Bool)

(assert (=> b!199081 (= e!136615 (= (size!4458 (buf!4950 (_1!9212 lt!309684))) (size!4458 (buf!4950 lt!310795))))))

(assert (= (and d!67741 res!166655) b!199081))

(declare-fun m!308463 () Bool)

(assert (=> d!67741 m!308463))

(declare-fun m!308465 () Bool)

(assert (=> d!67741 m!308465))

(declare-fun m!308467 () Bool)

(assert (=> d!67741 m!308467))

(declare-fun m!308469 () Bool)

(assert (=> d!67741 m!308469))

(assert (=> b!198698 d!67741))

(declare-fun d!67743 () Bool)

(declare-fun e!136616 () Bool)

(assert (=> d!67743 e!136616))

(declare-fun res!166656 () Bool)

(assert (=> d!67743 (=> (not res!166656) (not e!136616))))

(declare-fun lt!310798 () (_ BitVec 64))

(declare-fun lt!310797 () BitStream!8024)

(assert (=> d!67743 (= res!166656 (= (bvadd lt!310798 (bvsub lt!309682 lt!309677)) (bitIndex!0 (size!4458 (buf!4950 lt!310797)) (currentByte!9297 lt!310797) (currentBit!9292 lt!310797))))))

(assert (=> d!67743 (or (not (= (bvand lt!310798 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309682 lt!309677) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!310798 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!310798 (bvsub lt!309682 lt!309677)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67743 (= lt!310798 (bitIndex!0 (size!4458 (buf!4950 (_2!9212 lt!309684))) (currentByte!9297 (_2!9212 lt!309684)) (currentBit!9292 (_2!9212 lt!309684))))))

(assert (=> d!67743 (= lt!310797 (_2!9210 (moveBitIndex!0 (_2!9212 lt!309684) (bvsub lt!309682 lt!309677))))))

(assert (=> d!67743 (moveBitIndexPrecond!0 (_2!9212 lt!309684) (bvsub lt!309682 lt!309677))))

(assert (=> d!67743 (= (withMovedBitIndex!0 (_2!9212 lt!309684) (bvsub lt!309682 lt!309677)) lt!310797)))

(declare-fun b!199082 () Bool)

(assert (=> b!199082 (= e!136616 (= (size!4458 (buf!4950 (_2!9212 lt!309684))) (size!4458 (buf!4950 lt!310797))))))

(assert (= (and d!67743 res!166656) b!199082))

(declare-fun m!308471 () Bool)

(assert (=> d!67743 m!308471))

(declare-fun m!308473 () Bool)

(assert (=> d!67743 m!308473))

(declare-fun m!308475 () Bool)

(assert (=> d!67743 m!308475))

(declare-fun m!308477 () Bool)

(assert (=> d!67743 m!308477))

(assert (=> b!198701 d!67743))

(declare-fun d!67745 () Bool)

(assert (=> d!67745 (= (invariant!0 (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204) (size!4458 (buf!4950 thiss!1204))) (and (bvsge (currentBit!9292 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9292 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9297 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9297 thiss!1204) (size!4458 (buf!4950 thiss!1204))) (and (= (currentBit!9292 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9297 thiss!1204) (size!4458 (buf!4950 thiss!1204)))))))))

(assert (=> b!198712 d!67745))

(declare-fun d!67747 () Bool)

(assert (=> d!67747 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204) (size!4458 (buf!4950 thiss!1204))))))

(declare-fun bs!16754 () Bool)

(assert (= bs!16754 d!67747))

(assert (=> bs!16754 m!307727))

(assert (=> start!42102 d!67747))

(declare-fun d!67749 () Bool)

(assert (=> d!67749 (= (invariant!0 (currentBit!9292 (_2!9210 lt!309690)) (currentByte!9297 (_2!9210 lt!309690)) (size!4458 (buf!4950 (_2!9210 lt!309690)))) (and (bvsge (currentBit!9292 (_2!9210 lt!309690)) #b00000000000000000000000000000000) (bvslt (currentBit!9292 (_2!9210 lt!309690)) #b00000000000000000000000000001000) (bvsge (currentByte!9297 (_2!9210 lt!309690)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9297 (_2!9210 lt!309690)) (size!4458 (buf!4950 (_2!9210 lt!309690)))) (and (= (currentBit!9292 (_2!9210 lt!309690)) #b00000000000000000000000000000000) (= (currentByte!9297 (_2!9210 lt!309690)) (size!4458 (buf!4950 (_2!9210 lt!309690))))))))))

(assert (=> b!198702 d!67749))

(assert (=> b!198711 d!67647))

(push 1)

(assert (not b!199072))

(assert (not b!198798))

(assert (not b!198901))

(assert (not d!67661))

(assert (not b!198884))

(assert (not d!67673))

(assert (not b!198885))

(assert (not d!67663))

(assert (not b!198894))

(assert (not d!67677))

(assert (not b!198863))

(assert (not d!67615))

(assert (not d!67743))

(assert (not d!67597))

(assert (not b!198864))

(assert (not d!67671))

(assert (not b!199073))

(assert (not d!67603))

(assert (not b!198890))

(assert (not b!199077))

(assert (not b!198899))

(assert (not b!198807))

(assert (not d!67595))

(assert (not d!67683))

(assert (not b!198893))

(assert (not b!198886))

(assert (not d!67653))

(assert (not d!67667))

(assert (not b!199071))

(assert (not d!67741))

(assert (not d!67655))

(assert (not d!67611))

(assert (not d!67649))

(assert (not d!67651))

(assert (not b!199078))

(assert (not b!199069))

(assert (not d!67739))

(assert (not b!199079))

(assert (not b!198867))

(assert (not d!67687))

(assert (not b!198892))

(assert (not d!67689))

(assert (not d!67747))

(assert (not d!67679))

(assert (not b!199066))

(assert (not bm!3140))

(assert (not b!198865))

(assert (not b!198861))

(assert (not d!67737))

(assert (not d!67681))

(assert (not b!198882))

(assert (not d!67675))

(assert (not b!198862))

(assert (not d!67669))

(assert (not b!198805))

(assert (not d!67617))

(assert (not d!67665))

(assert (not b!199076))

(assert (not d!67607))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!68003 () Bool)

(declare-fun e!136799 () Bool)

(assert (=> d!68003 e!136799))

(declare-fun res!166873 () Bool)

(assert (=> d!68003 (=> (not res!166873) (not e!136799))))

(declare-fun increaseBitIndex!0 (BitStream!8024) tuple2!17124)

(assert (=> d!68003 (= res!166873 (= (buf!4950 (_2!9210 (increaseBitIndex!0 (_1!9212 lt!309684)))) (buf!4950 (_1!9212 lt!309684))))))

(declare-fun lt!311238 () Bool)

(assert (=> d!68003 (= lt!311238 (not (= (bvand ((_ sign_extend 24) (select (arr!5388 (buf!4950 (_1!9212 lt!309684))) (currentByte!9297 (_1!9212 lt!309684)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9292 (_1!9212 lt!309684))))) #b00000000000000000000000000000000)))))

(declare-fun lt!311236 () tuple2!17140)

(assert (=> d!68003 (= lt!311236 (tuple2!17141 (not (= (bvand ((_ sign_extend 24) (select (arr!5388 (buf!4950 (_1!9212 lt!309684))) (currentByte!9297 (_1!9212 lt!309684)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9292 (_1!9212 lt!309684))))) #b00000000000000000000000000000000)) (_2!9210 (increaseBitIndex!0 (_1!9212 lt!309684)))))))

(assert (=> d!68003 (validate_offset_bit!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9212 lt!309684)))) ((_ sign_extend 32) (currentByte!9297 (_1!9212 lt!309684))) ((_ sign_extend 32) (currentBit!9292 (_1!9212 lt!309684))))))

(assert (=> d!68003 (= (readBit!0 (_1!9212 lt!309684)) lt!311236)))

(declare-fun b!199344 () Bool)

(declare-fun lt!311239 () (_ BitVec 64))

(declare-fun lt!311234 () (_ BitVec 64))

(assert (=> b!199344 (= e!136799 (= (bitIndex!0 (size!4458 (buf!4950 (_2!9210 (increaseBitIndex!0 (_1!9212 lt!309684))))) (currentByte!9297 (_2!9210 (increaseBitIndex!0 (_1!9212 lt!309684)))) (currentBit!9292 (_2!9210 (increaseBitIndex!0 (_1!9212 lt!309684))))) (bvadd lt!311234 lt!311239)))))

(assert (=> b!199344 (or (not (= (bvand lt!311234 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311239 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311234 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311234 lt!311239) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199344 (= lt!311239 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!199344 (= lt!311234 (bitIndex!0 (size!4458 (buf!4950 (_1!9212 lt!309684))) (currentByte!9297 (_1!9212 lt!309684)) (currentBit!9292 (_1!9212 lt!309684))))))

(declare-fun lt!311235 () Bool)

(assert (=> b!199344 (= lt!311235 (not (= (bvand ((_ sign_extend 24) (select (arr!5388 (buf!4950 (_1!9212 lt!309684))) (currentByte!9297 (_1!9212 lt!309684)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9292 (_1!9212 lt!309684))))) #b00000000000000000000000000000000)))))

(declare-fun lt!311237 () Bool)

(assert (=> b!199344 (= lt!311237 (not (= (bvand ((_ sign_extend 24) (select (arr!5388 (buf!4950 (_1!9212 lt!309684))) (currentByte!9297 (_1!9212 lt!309684)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9292 (_1!9212 lt!309684))))) #b00000000000000000000000000000000)))))

(declare-fun lt!311233 () Bool)

(assert (=> b!199344 (= lt!311233 (not (= (bvand ((_ sign_extend 24) (select (arr!5388 (buf!4950 (_1!9212 lt!309684))) (currentByte!9297 (_1!9212 lt!309684)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9292 (_1!9212 lt!309684))))) #b00000000000000000000000000000000)))))

(assert (= (and d!68003 res!166873) b!199344))

(declare-fun m!309071 () Bool)

(assert (=> d!68003 m!309071))

(declare-fun m!309073 () Bool)

(assert (=> d!68003 m!309073))

(declare-fun m!309075 () Bool)

(assert (=> d!68003 m!309075))

(declare-fun m!309077 () Bool)

(assert (=> d!68003 m!309077))

(assert (=> b!199344 m!308465))

(assert (=> b!199344 m!309075))

(declare-fun m!309079 () Bool)

(assert (=> b!199344 m!309079))

(assert (=> b!199344 m!309071))

(assert (=> b!199344 m!309073))

(assert (=> d!67671 d!68003))

(declare-fun d!68005 () Bool)

(declare-fun res!166876 () Bool)

(declare-fun e!136800 () Bool)

(assert (=> d!68005 (=> (not res!166876) (not e!136800))))

(assert (=> d!68005 (= res!166876 (= (size!4458 (buf!4950 (_2!9212 lt!310150))) (size!4458 (buf!4950 (_2!9210 lt!309690)))))))

(assert (=> d!68005 (= (isPrefixOf!0 (_2!9212 lt!310150) (_2!9210 lt!309690)) e!136800)))

(declare-fun b!199345 () Bool)

(declare-fun res!166874 () Bool)

(assert (=> b!199345 (=> (not res!166874) (not e!136800))))

(assert (=> b!199345 (= res!166874 (bvsle (bitIndex!0 (size!4458 (buf!4950 (_2!9212 lt!310150))) (currentByte!9297 (_2!9212 lt!310150)) (currentBit!9292 (_2!9212 lt!310150))) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309690))) (currentByte!9297 (_2!9210 lt!309690)) (currentBit!9292 (_2!9210 lt!309690)))))))

(declare-fun b!199346 () Bool)

(declare-fun e!136801 () Bool)

(assert (=> b!199346 (= e!136800 e!136801)))

(declare-fun res!166875 () Bool)

(assert (=> b!199346 (=> res!166875 e!136801)))

(assert (=> b!199346 (= res!166875 (= (size!4458 (buf!4950 (_2!9212 lt!310150))) #b00000000000000000000000000000000))))

(declare-fun b!199347 () Bool)

(assert (=> b!199347 (= e!136801 (arrayBitRangesEq!0 (buf!4950 (_2!9212 lt!310150)) (buf!4950 (_2!9210 lt!309690)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4458 (buf!4950 (_2!9212 lt!310150))) (currentByte!9297 (_2!9212 lt!310150)) (currentBit!9292 (_2!9212 lt!310150)))))))

(assert (= (and d!68005 res!166876) b!199345))

(assert (= (and b!199345 res!166874) b!199346))

(assert (= (and b!199346 (not res!166875)) b!199347))

(declare-fun m!309081 () Bool)

(assert (=> b!199345 m!309081))

(assert (=> b!199345 m!307653))

(assert (=> b!199347 m!309081))

(assert (=> b!199347 m!309081))

(declare-fun m!309083 () Bool)

(assert (=> b!199347 m!309083))

(assert (=> b!198886 d!68005))

(declare-fun d!68007 () Bool)

(assert (=> d!68007 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!309686)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309686))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309686))) lt!310765) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!309686)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309686))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309686)))) lt!310765))))

(declare-fun bs!16795 () Bool)

(assert (= bs!16795 d!68007))

(assert (=> bs!16795 m!307949))

(assert (=> b!199066 d!68007))

(declare-fun d!68009 () Bool)

(assert (=> d!68009 (= (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!309692)))) ((_ sign_extend 32) (currentByte!9297 (_1!9211 lt!309692))) ((_ sign_extend 32) (currentBit!9292 (_1!9211 lt!309692)))) (bvsub (bvmul ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!309692)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 (_1!9211 lt!309692))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 (_1!9211 lt!309692))))))))

(assert (=> d!67675 d!68009))

(declare-fun d!68011 () Bool)

(assert (=> d!68011 (= (invariant!0 (currentBit!9292 (_1!9211 lt!309692)) (currentByte!9297 (_1!9211 lt!309692)) (size!4458 (buf!4950 (_1!9211 lt!309692)))) (and (bvsge (currentBit!9292 (_1!9211 lt!309692)) #b00000000000000000000000000000000) (bvslt (currentBit!9292 (_1!9211 lt!309692)) #b00000000000000000000000000001000) (bvsge (currentByte!9297 (_1!9211 lt!309692)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9297 (_1!9211 lt!309692)) (size!4458 (buf!4950 (_1!9211 lt!309692)))) (and (= (currentBit!9292 (_1!9211 lt!309692)) #b00000000000000000000000000000000) (= (currentByte!9297 (_1!9211 lt!309692)) (size!4458 (buf!4950 (_1!9211 lt!309692))))))))))

(assert (=> d!67675 d!68011))

(declare-fun b!199362 () Bool)

(declare-fun res!166889 () Bool)

(declare-fun e!136810 () Bool)

(assert (=> b!199362 (=> (not res!166889) (not e!136810))))

(declare-fun lt!311255 () tuple2!17142)

(assert (=> b!199362 (= res!166889 (= (bvand (_1!9219 lt!311255) (onesLSBLong!0 nBits!348)) (_1!9219 lt!311255)))))

(declare-fun b!199363 () Bool)

(declare-fun res!166888 () Bool)

(assert (=> b!199363 (=> (not res!166888) (not e!136810))))

(assert (=> b!199363 (= res!166888 (= (bvand (_1!9219 lt!311255) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))) (bvand lt!309673 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun b!199364 () Bool)

(declare-fun res!166891 () Bool)

(assert (=> b!199364 (=> (not res!166891) (not e!136810))))

(declare-fun lt!311256 () (_ BitVec 64))

(declare-fun lt!311257 () (_ BitVec 64))

(assert (=> b!199364 (= res!166891 (= (bitIndex!0 (size!4458 (buf!4950 (_2!9219 lt!311255))) (currentByte!9297 (_2!9219 lt!311255)) (currentBit!9292 (_2!9219 lt!311255))) (bvadd lt!311256 lt!311257)))))

(assert (=> b!199364 (or (not (= (bvand lt!311256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311257 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311256 lt!311257) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199364 (= lt!311257 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!199364 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!199364 (= lt!311256 (bitIndex!0 (size!4458 (buf!4950 (_1!9212 lt!309700))) (currentByte!9297 (_1!9212 lt!309700)) (currentBit!9292 (_1!9212 lt!309700))))))

(declare-fun b!199366 () Bool)

(declare-fun e!136808 () tuple2!17142)

(assert (=> b!199366 (= e!136808 (tuple2!17143 lt!309673 (_1!9212 lt!309700)))))

(declare-fun b!199367 () Bool)

(declare-fun e!136809 () Bool)

(assert (=> b!199367 (= e!136810 e!136809)))

(declare-fun res!166887 () Bool)

(assert (=> b!199367 (=> res!166887 e!136809)))

(assert (=> b!199367 (= res!166887 (not (bvslt (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-fun b!199368 () Bool)

(declare-fun lt!311253 () tuple2!17142)

(assert (=> b!199368 (= e!136808 (tuple2!17143 (_1!9219 lt!311253) (_2!9219 lt!311253)))))

(declare-fun lt!311252 () tuple2!17140)

(assert (=> b!199368 (= lt!311252 (readBit!0 (_1!9212 lt!309700)))))

(assert (=> b!199368 (= lt!311253 (readNBitsLSBFirstsLoop!0 (_2!9218 lt!311252) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!309673 (ite (_1!9218 lt!311252) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!199365 () Bool)

(declare-fun lt!311254 () (_ BitVec 64))

(assert (=> b!199365 (= e!136809 (= (= (bvand (bvlshr (_1!9219 lt!311255) lt!311254) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!9211 (readBitPure!0 (_1!9212 lt!309700)))))))

(assert (=> b!199365 (and (bvsge lt!311254 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!311254 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!199365 (= lt!311254 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun d!68013 () Bool)

(assert (=> d!68013 e!136810))

(declare-fun res!166890 () Bool)

(assert (=> d!68013 (=> (not res!166890) (not e!136810))))

(assert (=> d!68013 (= res!166890 (= (buf!4950 (_2!9219 lt!311255)) (buf!4950 (_1!9212 lt!309700))))))

(assert (=> d!68013 (= lt!311255 e!136808)))

(declare-fun c!9942 () Bool)

(assert (=> d!68013 (= c!9942 (= nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (=> d!68013 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsle (bvadd #b00000000000000000000000000000001 i!590) nBits!348) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!68013 (= (readNBitsLSBFirstsLoop!0 (_1!9212 lt!309700) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!309673) lt!311255)))

(assert (= (and d!68013 c!9942) b!199366))

(assert (= (and d!68013 (not c!9942)) b!199368))

(assert (= (and d!68013 res!166890) b!199364))

(assert (= (and b!199364 res!166891) b!199363))

(assert (= (and b!199363 res!166888) b!199362))

(assert (= (and b!199362 res!166889) b!199367))

(assert (= (and b!199367 (not res!166887)) b!199365))

(declare-fun m!309085 () Bool)

(assert (=> b!199365 m!309085))

(declare-fun m!309087 () Bool)

(assert (=> b!199368 m!309087))

(declare-fun m!309089 () Bool)

(assert (=> b!199368 m!309089))

(assert (=> b!199363 m!308423))

(declare-fun m!309091 () Bool)

(assert (=> b!199364 m!309091))

(declare-fun m!309093 () Bool)

(assert (=> b!199364 m!309093))

(assert (=> b!199362 m!308403))

(assert (=> d!67679 d!68013))

(declare-fun d!68015 () Bool)

(declare-fun e!136811 () Bool)

(assert (=> d!68015 e!136811))

(declare-fun res!166893 () Bool)

(assert (=> d!68015 (=> (not res!166893) (not e!136811))))

(declare-fun lt!311263 () (_ BitVec 64))

(declare-fun lt!311259 () (_ BitVec 64))

(declare-fun lt!311262 () (_ BitVec 64))

(assert (=> d!68015 (= res!166893 (= lt!311263 (bvsub lt!311262 lt!311259)))))

(assert (=> d!68015 (or (= (bvand lt!311262 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311259 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311262 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311262 lt!311259) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68015 (= lt!311259 (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 lt!310795))) ((_ sign_extend 32) (currentByte!9297 lt!310795)) ((_ sign_extend 32) (currentBit!9292 lt!310795))))))

(declare-fun lt!311258 () (_ BitVec 64))

(declare-fun lt!311261 () (_ BitVec 64))

(assert (=> d!68015 (= lt!311262 (bvmul lt!311258 lt!311261))))

(assert (=> d!68015 (or (= lt!311258 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311261 (bvsdiv (bvmul lt!311258 lt!311261) lt!311258)))))

(assert (=> d!68015 (= lt!311261 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68015 (= lt!311258 ((_ sign_extend 32) (size!4458 (buf!4950 lt!310795))))))

(assert (=> d!68015 (= lt!311263 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 lt!310795)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 lt!310795))))))

(assert (=> d!68015 (invariant!0 (currentBit!9292 lt!310795) (currentByte!9297 lt!310795) (size!4458 (buf!4950 lt!310795)))))

(assert (=> d!68015 (= (bitIndex!0 (size!4458 (buf!4950 lt!310795)) (currentByte!9297 lt!310795) (currentBit!9292 lt!310795)) lt!311263)))

(declare-fun b!199369 () Bool)

(declare-fun res!166892 () Bool)

(assert (=> b!199369 (=> (not res!166892) (not e!136811))))

(assert (=> b!199369 (= res!166892 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311263))))

(declare-fun b!199370 () Bool)

(declare-fun lt!311260 () (_ BitVec 64))

(assert (=> b!199370 (= e!136811 (bvsle lt!311263 (bvmul lt!311260 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199370 (or (= lt!311260 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311260 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311260)))))

(assert (=> b!199370 (= lt!311260 ((_ sign_extend 32) (size!4458 (buf!4950 lt!310795))))))

(assert (= (and d!68015 res!166893) b!199369))

(assert (= (and b!199369 res!166892) b!199370))

(declare-fun m!309095 () Bool)

(assert (=> d!68015 m!309095))

(declare-fun m!309097 () Bool)

(assert (=> d!68015 m!309097))

(assert (=> d!67741 d!68015))

(declare-fun d!68017 () Bool)

(declare-fun e!136812 () Bool)

(assert (=> d!68017 e!136812))

(declare-fun res!166895 () Bool)

(assert (=> d!68017 (=> (not res!166895) (not e!136812))))

(declare-fun lt!311269 () (_ BitVec 64))

(declare-fun lt!311265 () (_ BitVec 64))

(declare-fun lt!311268 () (_ BitVec 64))

(assert (=> d!68017 (= res!166895 (= lt!311269 (bvsub lt!311268 lt!311265)))))

(assert (=> d!68017 (or (= (bvand lt!311268 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311265 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311268 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311268 lt!311265) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68017 (= lt!311265 (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9212 lt!309684)))) ((_ sign_extend 32) (currentByte!9297 (_1!9212 lt!309684))) ((_ sign_extend 32) (currentBit!9292 (_1!9212 lt!309684)))))))

(declare-fun lt!311264 () (_ BitVec 64))

(declare-fun lt!311267 () (_ BitVec 64))

(assert (=> d!68017 (= lt!311268 (bvmul lt!311264 lt!311267))))

(assert (=> d!68017 (or (= lt!311264 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311267 (bvsdiv (bvmul lt!311264 lt!311267) lt!311264)))))

(assert (=> d!68017 (= lt!311267 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68017 (= lt!311264 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9212 lt!309684)))))))

(assert (=> d!68017 (= lt!311269 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 (_1!9212 lt!309684))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 (_1!9212 lt!309684)))))))

(assert (=> d!68017 (invariant!0 (currentBit!9292 (_1!9212 lt!309684)) (currentByte!9297 (_1!9212 lt!309684)) (size!4458 (buf!4950 (_1!9212 lt!309684))))))

(assert (=> d!68017 (= (bitIndex!0 (size!4458 (buf!4950 (_1!9212 lt!309684))) (currentByte!9297 (_1!9212 lt!309684)) (currentBit!9292 (_1!9212 lt!309684))) lt!311269)))

(declare-fun b!199371 () Bool)

(declare-fun res!166894 () Bool)

(assert (=> b!199371 (=> (not res!166894) (not e!136812))))

(assert (=> b!199371 (= res!166894 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311269))))

(declare-fun b!199372 () Bool)

(declare-fun lt!311266 () (_ BitVec 64))

(assert (=> b!199372 (= e!136812 (bvsle lt!311269 (bvmul lt!311266 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199372 (or (= lt!311266 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311266 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311266)))))

(assert (=> b!199372 (= lt!311266 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9212 lt!309684)))))))

(assert (= (and d!68017 res!166895) b!199371))

(assert (= (and b!199371 res!166894) b!199372))

(declare-fun m!309099 () Bool)

(assert (=> d!68017 m!309099))

(declare-fun m!309101 () Bool)

(assert (=> d!68017 m!309101))

(assert (=> d!67741 d!68017))

(declare-fun d!68019 () Bool)

(declare-fun lt!311285 () (_ BitVec 32))

(assert (=> d!68019 (= lt!311285 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!311286 () (_ BitVec 32))

(assert (=> d!68019 (= lt!311286 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!136817 () Bool)

(assert (=> d!68019 e!136817))

(declare-fun res!166900 () Bool)

(assert (=> d!68019 (=> (not res!166900) (not e!136817))))

(assert (=> d!68019 (= res!166900 (moveBitIndexPrecond!0 (_1!9212 lt!309684) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!14135 () Unit!14062)

(declare-fun Unit!14136 () Unit!14062)

(declare-fun Unit!14137 () Unit!14062)

(assert (=> d!68019 (= (moveBitIndex!0 (_1!9212 lt!309684) #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!9292 (_1!9212 lt!309684)) lt!311285) #b00000000000000000000000000000000) (tuple2!17125 Unit!14135 (BitStream!8025 (buf!4950 (_1!9212 lt!309684)) (bvsub (bvadd (currentByte!9297 (_1!9212 lt!309684)) lt!311286) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!311285 (currentBit!9292 (_1!9212 lt!309684))))) (ite (bvsge (bvadd (currentBit!9292 (_1!9212 lt!309684)) lt!311285) #b00000000000000000000000000001000) (tuple2!17125 Unit!14136 (BitStream!8025 (buf!4950 (_1!9212 lt!309684)) (bvadd (currentByte!9297 (_1!9212 lt!309684)) lt!311286 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9292 (_1!9212 lt!309684)) lt!311285) #b00000000000000000000000000001000))) (tuple2!17125 Unit!14137 (BitStream!8025 (buf!4950 (_1!9212 lt!309684)) (bvadd (currentByte!9297 (_1!9212 lt!309684)) lt!311286) (bvadd (currentBit!9292 (_1!9212 lt!309684)) lt!311285))))))))

(declare-fun b!199377 () Bool)

(declare-fun e!136818 () Bool)

(assert (=> b!199377 (= e!136817 e!136818)))

(declare-fun res!166901 () Bool)

(assert (=> b!199377 (=> (not res!166901) (not e!136818))))

(declare-fun lt!311284 () (_ BitVec 64))

(declare-fun lt!311287 () tuple2!17124)

(assert (=> b!199377 (= res!166901 (= (bvadd lt!311284 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!311287))) (currentByte!9297 (_2!9210 lt!311287)) (currentBit!9292 (_2!9210 lt!311287)))))))

(assert (=> b!199377 (or (not (= (bvand lt!311284 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311284 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311284 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199377 (= lt!311284 (bitIndex!0 (size!4458 (buf!4950 (_1!9212 lt!309684))) (currentByte!9297 (_1!9212 lt!309684)) (currentBit!9292 (_1!9212 lt!309684))))))

(declare-fun lt!311282 () (_ BitVec 32))

(declare-fun lt!311283 () (_ BitVec 32))

(declare-fun Unit!14138 () Unit!14062)

(declare-fun Unit!14139 () Unit!14062)

(declare-fun Unit!14140 () Unit!14062)

(assert (=> b!199377 (= lt!311287 (ite (bvslt (bvadd (currentBit!9292 (_1!9212 lt!309684)) lt!311283) #b00000000000000000000000000000000) (tuple2!17125 Unit!14138 (BitStream!8025 (buf!4950 (_1!9212 lt!309684)) (bvsub (bvadd (currentByte!9297 (_1!9212 lt!309684)) lt!311282) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!311283 (currentBit!9292 (_1!9212 lt!309684))))) (ite (bvsge (bvadd (currentBit!9292 (_1!9212 lt!309684)) lt!311283) #b00000000000000000000000000001000) (tuple2!17125 Unit!14139 (BitStream!8025 (buf!4950 (_1!9212 lt!309684)) (bvadd (currentByte!9297 (_1!9212 lt!309684)) lt!311282 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9292 (_1!9212 lt!309684)) lt!311283) #b00000000000000000000000000001000))) (tuple2!17125 Unit!14140 (BitStream!8025 (buf!4950 (_1!9212 lt!309684)) (bvadd (currentByte!9297 (_1!9212 lt!309684)) lt!311282) (bvadd (currentBit!9292 (_1!9212 lt!309684)) lt!311283))))))))

(assert (=> b!199377 (= lt!311283 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199377 (= lt!311282 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!199378 () Bool)

(assert (=> b!199378 (= e!136818 (and (= (size!4458 (buf!4950 (_1!9212 lt!309684))) (size!4458 (buf!4950 (_2!9210 lt!311287)))) (= (buf!4950 (_1!9212 lt!309684)) (buf!4950 (_2!9210 lt!311287)))))))

(assert (= (and d!68019 res!166900) b!199377))

(assert (= (and b!199377 res!166901) b!199378))

(assert (=> d!68019 m!308469))

(declare-fun m!309103 () Bool)

(assert (=> b!199377 m!309103))

(assert (=> b!199377 m!308465))

(assert (=> d!67741 d!68019))

(declare-fun d!68023 () Bool)

(declare-fun res!166904 () Bool)

(declare-fun e!136821 () Bool)

(assert (=> d!68023 (=> (not res!166904) (not e!136821))))

(assert (=> d!68023 (= res!166904 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9212 lt!309684))))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9212 lt!309684))))))))))

(assert (=> d!68023 (= (moveBitIndexPrecond!0 (_1!9212 lt!309684) #b0000000000000000000000000000000000000000000000000000000000000001) e!136821)))

(declare-fun b!199382 () Bool)

(declare-fun lt!311290 () (_ BitVec 64))

(assert (=> b!199382 (= e!136821 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311290) (bvsle lt!311290 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9212 lt!309684))))))))))

(assert (=> b!199382 (= lt!311290 (bvadd (bitIndex!0 (size!4458 (buf!4950 (_1!9212 lt!309684))) (currentByte!9297 (_1!9212 lt!309684)) (currentBit!9292 (_1!9212 lt!309684))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!68023 res!166904) b!199382))

(assert (=> b!199382 m!308465))

(assert (=> d!67741 d!68023))

(declare-fun d!68025 () Bool)

(assert (=> d!68025 (= (invariant!0 (currentBit!9292 (_2!9210 lt!309686)) (currentByte!9297 (_2!9210 lt!309686)) (size!4458 (buf!4950 (_2!9210 lt!309686)))) (and (bvsge (currentBit!9292 (_2!9210 lt!309686)) #b00000000000000000000000000000000) (bvslt (currentBit!9292 (_2!9210 lt!309686)) #b00000000000000000000000000001000) (bvsge (currentByte!9297 (_2!9210 lt!309686)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9297 (_2!9210 lt!309686)) (size!4458 (buf!4950 (_2!9210 lt!309686)))) (and (= (currentBit!9292 (_2!9210 lt!309686)) #b00000000000000000000000000000000) (= (currentByte!9297 (_2!9210 lt!309686)) (size!4458 (buf!4950 (_2!9210 lt!309686))))))))))

(assert (=> d!67603 d!68025))

(declare-fun d!68027 () Bool)

(declare-fun res!166917 () Bool)

(declare-fun e!136837 () Bool)

(assert (=> d!68027 (=> res!166917 e!136837)))

(assert (=> d!68027 (= res!166917 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4458 (buf!4950 thiss!1204)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204))))))

(assert (=> d!68027 (= (arrayBitRangesEq!0 (buf!4950 thiss!1204) (buf!4950 (_2!9210 lt!309690)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4458 (buf!4950 thiss!1204)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204))) e!136837)))

(declare-fun b!199397 () Bool)

(declare-fun e!136839 () Bool)

(declare-fun e!136838 () Bool)

(assert (=> b!199397 (= e!136839 e!136838)))

(declare-fun res!166916 () Bool)

(declare-fun call!3154 () Bool)

(assert (=> b!199397 (= res!166916 call!3154)))

(assert (=> b!199397 (=> (not res!166916) (not e!136838))))

(declare-fun b!199398 () Bool)

(declare-fun e!136836 () Bool)

(assert (=> b!199398 (= e!136836 e!136839)))

(declare-fun c!9945 () Bool)

(declare-datatypes ((tuple4!266 0))(
  ( (tuple4!267 (_1!9221 (_ BitVec 32)) (_2!9221 (_ BitVec 32)) (_3!649 (_ BitVec 32)) (_4!133 (_ BitVec 32))) )
))
(declare-fun lt!311297 () tuple4!266)

(assert (=> b!199398 (= c!9945 (= (_3!649 lt!311297) (_4!133 lt!311297)))))

(declare-fun e!136835 () Bool)

(declare-fun b!199399 () Bool)

(declare-fun arrayRangesEq!695 (array!10116 array!10116 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!199399 (= e!136835 (arrayRangesEq!695 (buf!4950 thiss!1204) (buf!4950 (_2!9210 lt!309690)) (_1!9221 lt!311297) (_2!9221 lt!311297)))))

(declare-fun e!136834 () Bool)

(declare-fun b!199400 () Bool)

(declare-fun lt!311299 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!199400 (= e!136834 (byteRangesEq!0 (select (arr!5388 (buf!4950 thiss!1204)) (_4!133 lt!311297)) (select (arr!5388 (buf!4950 (_2!9210 lt!309690))) (_4!133 lt!311297)) #b00000000000000000000000000000000 lt!311299))))

(declare-fun bm!3151 () Bool)

(declare-fun lt!311298 () (_ BitVec 32))

(assert (=> bm!3151 (= call!3154 (byteRangesEq!0 (select (arr!5388 (buf!4950 thiss!1204)) (_3!649 lt!311297)) (select (arr!5388 (buf!4950 (_2!9210 lt!309690))) (_3!649 lt!311297)) lt!311298 (ite c!9945 lt!311299 #b00000000000000000000000000001000)))))

(declare-fun b!199401 () Bool)

(assert (=> b!199401 (= e!136837 e!136836)))

(declare-fun res!166919 () Bool)

(assert (=> b!199401 (=> (not res!166919) (not e!136836))))

(assert (=> b!199401 (= res!166919 e!136835)))

(declare-fun res!166915 () Bool)

(assert (=> b!199401 (=> res!166915 e!136835)))

(assert (=> b!199401 (= res!166915 (bvsge (_1!9221 lt!311297) (_2!9221 lt!311297)))))

(assert (=> b!199401 (= lt!311299 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4458 (buf!4950 thiss!1204)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199401 (= lt!311298 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!266)

(assert (=> b!199401 (= lt!311297 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4458 (buf!4950 thiss!1204)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204))))))

(declare-fun b!199402 () Bool)

(declare-fun res!166918 () Bool)

(assert (=> b!199402 (= res!166918 (= lt!311299 #b00000000000000000000000000000000))))

(assert (=> b!199402 (=> res!166918 e!136834)))

(assert (=> b!199402 (= e!136838 e!136834)))

(declare-fun b!199403 () Bool)

(assert (=> b!199403 (= e!136839 call!3154)))

(assert (= (and d!68027 (not res!166917)) b!199401))

(assert (= (and b!199401 (not res!166915)) b!199399))

(assert (= (and b!199401 res!166919) b!199398))

(assert (= (and b!199398 c!9945) b!199403))

(assert (= (and b!199398 (not c!9945)) b!199397))

(assert (= (and b!199397 res!166916) b!199402))

(assert (= (and b!199402 (not res!166918)) b!199400))

(assert (= (or b!199403 b!199397) bm!3151))

(declare-fun m!309105 () Bool)

(assert (=> b!199399 m!309105))

(declare-fun m!309107 () Bool)

(assert (=> b!199400 m!309107))

(declare-fun m!309109 () Bool)

(assert (=> b!199400 m!309109))

(assert (=> b!199400 m!309107))

(assert (=> b!199400 m!309109))

(declare-fun m!309111 () Bool)

(assert (=> b!199400 m!309111))

(declare-fun m!309113 () Bool)

(assert (=> bm!3151 m!309113))

(declare-fun m!309115 () Bool)

(assert (=> bm!3151 m!309115))

(assert (=> bm!3151 m!309113))

(assert (=> bm!3151 m!309115))

(declare-fun m!309117 () Bool)

(assert (=> bm!3151 m!309117))

(assert (=> b!199401 m!307721))

(declare-fun m!309119 () Bool)

(assert (=> b!199401 m!309119))

(assert (=> b!198901 d!68027))

(assert (=> b!198901 d!67615))

(declare-fun d!68029 () Bool)

(assert (=> d!68029 (= (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 thiss!1204))) ((_ sign_extend 32) (currentByte!9297 thiss!1204)) ((_ sign_extend 32) (currentBit!9292 thiss!1204))) (bvsub (bvmul ((_ sign_extend 32) (size!4458 (buf!4950 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 thiss!1204)))))))

(assert (=> d!67615 d!68029))

(assert (=> d!67615 d!67745))

(declare-fun d!68031 () Bool)

(declare-fun e!136840 () Bool)

(assert (=> d!68031 e!136840))

(declare-fun res!166921 () Bool)

(assert (=> d!68031 (=> (not res!166921) (not e!136840))))

(declare-fun lt!311304 () (_ BitVec 64))

(declare-fun lt!311305 () (_ BitVec 64))

(declare-fun lt!311301 () (_ BitVec 64))

(assert (=> d!68031 (= res!166921 (= lt!311305 (bvsub lt!311304 lt!311301)))))

(assert (=> d!68031 (or (= (bvand lt!311304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311301 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311304 lt!311301) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68031 (= lt!311301 (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 lt!310797))) ((_ sign_extend 32) (currentByte!9297 lt!310797)) ((_ sign_extend 32) (currentBit!9292 lt!310797))))))

(declare-fun lt!311300 () (_ BitVec 64))

(declare-fun lt!311303 () (_ BitVec 64))

(assert (=> d!68031 (= lt!311304 (bvmul lt!311300 lt!311303))))

(assert (=> d!68031 (or (= lt!311300 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311303 (bvsdiv (bvmul lt!311300 lt!311303) lt!311300)))))

(assert (=> d!68031 (= lt!311303 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68031 (= lt!311300 ((_ sign_extend 32) (size!4458 (buf!4950 lt!310797))))))

(assert (=> d!68031 (= lt!311305 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 lt!310797)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 lt!310797))))))

(assert (=> d!68031 (invariant!0 (currentBit!9292 lt!310797) (currentByte!9297 lt!310797) (size!4458 (buf!4950 lt!310797)))))

(assert (=> d!68031 (= (bitIndex!0 (size!4458 (buf!4950 lt!310797)) (currentByte!9297 lt!310797) (currentBit!9292 lt!310797)) lt!311305)))

(declare-fun b!199404 () Bool)

(declare-fun res!166920 () Bool)

(assert (=> b!199404 (=> (not res!166920) (not e!136840))))

(assert (=> b!199404 (= res!166920 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311305))))

(declare-fun b!199405 () Bool)

(declare-fun lt!311302 () (_ BitVec 64))

(assert (=> b!199405 (= e!136840 (bvsle lt!311305 (bvmul lt!311302 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199405 (or (= lt!311302 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311302 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311302)))))

(assert (=> b!199405 (= lt!311302 ((_ sign_extend 32) (size!4458 (buf!4950 lt!310797))))))

(assert (= (and d!68031 res!166921) b!199404))

(assert (= (and b!199404 res!166920) b!199405))

(declare-fun m!309121 () Bool)

(assert (=> d!68031 m!309121))

(declare-fun m!309123 () Bool)

(assert (=> d!68031 m!309123))

(assert (=> d!67743 d!68031))

(declare-fun d!68033 () Bool)

(declare-fun e!136841 () Bool)

(assert (=> d!68033 e!136841))

(declare-fun res!166923 () Bool)

(assert (=> d!68033 (=> (not res!166923) (not e!136841))))

(declare-fun lt!311310 () (_ BitVec 64))

(declare-fun lt!311307 () (_ BitVec 64))

(declare-fun lt!311311 () (_ BitVec 64))

(assert (=> d!68033 (= res!166923 (= lt!311311 (bvsub lt!311310 lt!311307)))))

(assert (=> d!68033 (or (= (bvand lt!311310 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311307 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311310 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311310 lt!311307) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68033 (= lt!311307 (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9212 lt!309684)))) ((_ sign_extend 32) (currentByte!9297 (_2!9212 lt!309684))) ((_ sign_extend 32) (currentBit!9292 (_2!9212 lt!309684)))))))

(declare-fun lt!311306 () (_ BitVec 64))

(declare-fun lt!311309 () (_ BitVec 64))

(assert (=> d!68033 (= lt!311310 (bvmul lt!311306 lt!311309))))

(assert (=> d!68033 (or (= lt!311306 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311309 (bvsdiv (bvmul lt!311306 lt!311309) lt!311306)))))

(assert (=> d!68033 (= lt!311309 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68033 (= lt!311306 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9212 lt!309684)))))))

(assert (=> d!68033 (= lt!311311 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 (_2!9212 lt!309684))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 (_2!9212 lt!309684)))))))

(assert (=> d!68033 (invariant!0 (currentBit!9292 (_2!9212 lt!309684)) (currentByte!9297 (_2!9212 lt!309684)) (size!4458 (buf!4950 (_2!9212 lt!309684))))))

(assert (=> d!68033 (= (bitIndex!0 (size!4458 (buf!4950 (_2!9212 lt!309684))) (currentByte!9297 (_2!9212 lt!309684)) (currentBit!9292 (_2!9212 lt!309684))) lt!311311)))

(declare-fun b!199406 () Bool)

(declare-fun res!166922 () Bool)

(assert (=> b!199406 (=> (not res!166922) (not e!136841))))

(assert (=> b!199406 (= res!166922 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311311))))

(declare-fun b!199407 () Bool)

(declare-fun lt!311308 () (_ BitVec 64))

(assert (=> b!199407 (= e!136841 (bvsle lt!311311 (bvmul lt!311308 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199407 (or (= lt!311308 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311308 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311308)))))

(assert (=> b!199407 (= lt!311308 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9212 lt!309684)))))))

(assert (= (and d!68033 res!166923) b!199406))

(assert (= (and b!199406 res!166922) b!199407))

(declare-fun m!309125 () Bool)

(assert (=> d!68033 m!309125))

(declare-fun m!309127 () Bool)

(assert (=> d!68033 m!309127))

(assert (=> d!67743 d!68033))

(declare-fun d!68035 () Bool)

(declare-fun lt!311315 () (_ BitVec 32))

(assert (=> d!68035 (= lt!311315 ((_ extract 31 0) (bvsrem (bvsub lt!309682 lt!309677) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!311316 () (_ BitVec 32))

(assert (=> d!68035 (= lt!311316 ((_ extract 31 0) (bvsdiv (bvsub lt!309682 lt!309677) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!136842 () Bool)

(assert (=> d!68035 e!136842))

(declare-fun res!166924 () Bool)

(assert (=> d!68035 (=> (not res!166924) (not e!136842))))

(assert (=> d!68035 (= res!166924 (moveBitIndexPrecond!0 (_2!9212 lt!309684) (bvsub lt!309682 lt!309677)))))

(declare-fun Unit!14141 () Unit!14062)

(declare-fun Unit!14142 () Unit!14062)

(declare-fun Unit!14143 () Unit!14062)

(assert (=> d!68035 (= (moveBitIndex!0 (_2!9212 lt!309684) (bvsub lt!309682 lt!309677)) (ite (bvslt (bvadd (currentBit!9292 (_2!9212 lt!309684)) lt!311315) #b00000000000000000000000000000000) (tuple2!17125 Unit!14141 (BitStream!8025 (buf!4950 (_2!9212 lt!309684)) (bvsub (bvadd (currentByte!9297 (_2!9212 lt!309684)) lt!311316) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!311315 (currentBit!9292 (_2!9212 lt!309684))))) (ite (bvsge (bvadd (currentBit!9292 (_2!9212 lt!309684)) lt!311315) #b00000000000000000000000000001000) (tuple2!17125 Unit!14142 (BitStream!8025 (buf!4950 (_2!9212 lt!309684)) (bvadd (currentByte!9297 (_2!9212 lt!309684)) lt!311316 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9292 (_2!9212 lt!309684)) lt!311315) #b00000000000000000000000000001000))) (tuple2!17125 Unit!14143 (BitStream!8025 (buf!4950 (_2!9212 lt!309684)) (bvadd (currentByte!9297 (_2!9212 lt!309684)) lt!311316) (bvadd (currentBit!9292 (_2!9212 lt!309684)) lt!311315))))))))

(declare-fun b!199408 () Bool)

(declare-fun e!136843 () Bool)

(assert (=> b!199408 (= e!136842 e!136843)))

(declare-fun res!166925 () Bool)

(assert (=> b!199408 (=> (not res!166925) (not e!136843))))

(declare-fun lt!311317 () tuple2!17124)

(declare-fun lt!311314 () (_ BitVec 64))

(assert (=> b!199408 (= res!166925 (= (bvadd lt!311314 (bvsub lt!309682 lt!309677)) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!311317))) (currentByte!9297 (_2!9210 lt!311317)) (currentBit!9292 (_2!9210 lt!311317)))))))

(assert (=> b!199408 (or (not (= (bvand lt!311314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309682 lt!309677) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311314 (bvsub lt!309682 lt!309677)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199408 (= lt!311314 (bitIndex!0 (size!4458 (buf!4950 (_2!9212 lt!309684))) (currentByte!9297 (_2!9212 lt!309684)) (currentBit!9292 (_2!9212 lt!309684))))))

(declare-fun lt!311313 () (_ BitVec 32))

(declare-fun lt!311312 () (_ BitVec 32))

(declare-fun Unit!14144 () Unit!14062)

(declare-fun Unit!14145 () Unit!14062)

(declare-fun Unit!14146 () Unit!14062)

(assert (=> b!199408 (= lt!311317 (ite (bvslt (bvadd (currentBit!9292 (_2!9212 lt!309684)) lt!311313) #b00000000000000000000000000000000) (tuple2!17125 Unit!14144 (BitStream!8025 (buf!4950 (_2!9212 lt!309684)) (bvsub (bvadd (currentByte!9297 (_2!9212 lt!309684)) lt!311312) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!311313 (currentBit!9292 (_2!9212 lt!309684))))) (ite (bvsge (bvadd (currentBit!9292 (_2!9212 lt!309684)) lt!311313) #b00000000000000000000000000001000) (tuple2!17125 Unit!14145 (BitStream!8025 (buf!4950 (_2!9212 lt!309684)) (bvadd (currentByte!9297 (_2!9212 lt!309684)) lt!311312 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9292 (_2!9212 lt!309684)) lt!311313) #b00000000000000000000000000001000))) (tuple2!17125 Unit!14146 (BitStream!8025 (buf!4950 (_2!9212 lt!309684)) (bvadd (currentByte!9297 (_2!9212 lt!309684)) lt!311312) (bvadd (currentBit!9292 (_2!9212 lt!309684)) lt!311313))))))))

(assert (=> b!199408 (= lt!311313 ((_ extract 31 0) (bvsrem (bvsub lt!309682 lt!309677) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199408 (= lt!311312 ((_ extract 31 0) (bvsdiv (bvsub lt!309682 lt!309677) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!199409 () Bool)

(assert (=> b!199409 (= e!136843 (and (= (size!4458 (buf!4950 (_2!9212 lt!309684))) (size!4458 (buf!4950 (_2!9210 lt!311317)))) (= (buf!4950 (_2!9212 lt!309684)) (buf!4950 (_2!9210 lt!311317)))))))

(assert (= (and d!68035 res!166924) b!199408))

(assert (= (and b!199408 res!166925) b!199409))

(assert (=> d!68035 m!308477))

(declare-fun m!309129 () Bool)

(assert (=> b!199408 m!309129))

(assert (=> b!199408 m!308473))

(assert (=> d!67743 d!68035))

(declare-fun d!68037 () Bool)

(declare-fun res!166926 () Bool)

(declare-fun e!136844 () Bool)

(assert (=> d!68037 (=> (not res!166926) (not e!136844))))

(assert (=> d!68037 (= res!166926 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9212 lt!309684))))) (bvsub lt!309682 lt!309677)) (bvsle (bvsub lt!309682 lt!309677) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9212 lt!309684))))))))))

(assert (=> d!68037 (= (moveBitIndexPrecond!0 (_2!9212 lt!309684) (bvsub lt!309682 lt!309677)) e!136844)))

(declare-fun b!199410 () Bool)

(declare-fun lt!311318 () (_ BitVec 64))

(assert (=> b!199410 (= e!136844 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311318) (bvsle lt!311318 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9212 lt!309684))))))))))

(assert (=> b!199410 (= lt!311318 (bvadd (bitIndex!0 (size!4458 (buf!4950 (_2!9212 lt!309684))) (currentByte!9297 (_2!9212 lt!309684)) (currentBit!9292 (_2!9212 lt!309684))) (bvsub lt!309682 lt!309677)))))

(assert (= (and d!68037 res!166926) b!199410))

(assert (=> b!199410 m!308473))

(assert (=> d!67743 d!68037))

(declare-fun d!68039 () Bool)

(declare-fun e!136845 () Bool)

(assert (=> d!68039 e!136845))

(declare-fun res!166927 () Bool)

(assert (=> d!68039 (=> (not res!166927) (not e!136845))))

(declare-fun lt!311320 () (_ BitVec 64))

(declare-fun lt!311319 () BitStream!8024)

(assert (=> d!68039 (= res!166927 (= (bvadd lt!311320 (bvsub lt!310133 lt!310146)) (bitIndex!0 (size!4458 (buf!4950 lt!311319)) (currentByte!9297 lt!311319) (currentBit!9292 lt!311319))))))

(assert (=> d!68039 (or (not (= (bvand lt!311320 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!310133 lt!310146) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311320 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311320 (bvsub lt!310133 lt!310146)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68039 (= lt!311320 (bitIndex!0 (size!4458 (buf!4950 (_2!9212 lt!310150))) (currentByte!9297 (_2!9212 lt!310150)) (currentBit!9292 (_2!9212 lt!310150))))))

(assert (=> d!68039 (= lt!311319 (_2!9210 (moveBitIndex!0 (_2!9212 lt!310150) (bvsub lt!310133 lt!310146))))))

(assert (=> d!68039 (moveBitIndexPrecond!0 (_2!9212 lt!310150) (bvsub lt!310133 lt!310146))))

(assert (=> d!68039 (= (withMovedBitIndex!0 (_2!9212 lt!310150) (bvsub lt!310133 lt!310146)) lt!311319)))

(declare-fun b!199411 () Bool)

(assert (=> b!199411 (= e!136845 (= (size!4458 (buf!4950 (_2!9212 lt!310150))) (size!4458 (buf!4950 lt!311319))))))

(assert (= (and d!68039 res!166927) b!199411))

(declare-fun m!309131 () Bool)

(assert (=> d!68039 m!309131))

(assert (=> d!68039 m!309081))

(declare-fun m!309133 () Bool)

(assert (=> d!68039 m!309133))

(declare-fun m!309135 () Bool)

(assert (=> d!68039 m!309135))

(assert (=> b!198882 d!68039))

(assert (=> b!198882 d!67683))

(assert (=> b!198882 d!67615))

(declare-fun b!199412 () Bool)

(declare-fun res!166930 () Bool)

(declare-fun e!136848 () Bool)

(assert (=> b!199412 (=> (not res!166930) (not e!136848))))

(declare-fun lt!311324 () tuple2!17142)

(assert (=> b!199412 (= res!166930 (= (bvand (_1!9219 lt!311324) (onesLSBLong!0 nBits!348)) (_1!9219 lt!311324)))))

(declare-fun b!199413 () Bool)

(declare-fun res!166929 () Bool)

(assert (=> b!199413 (=> (not res!166929) (not e!136848))))

(assert (=> b!199413 (= res!166929 (= (bvand (_1!9219 lt!311324) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))) (bvand lt!309673 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun b!199414 () Bool)

(declare-fun res!166932 () Bool)

(assert (=> b!199414 (=> (not res!166932) (not e!136848))))

(declare-fun lt!311326 () (_ BitVec 64))

(declare-fun lt!311325 () (_ BitVec 64))

(assert (=> b!199414 (= res!166932 (= (bitIndex!0 (size!4458 (buf!4950 (_2!9219 lt!311324))) (currentByte!9297 (_2!9219 lt!311324)) (currentBit!9292 (_2!9219 lt!311324))) (bvadd lt!311325 lt!311326)))))

(assert (=> b!199414 (or (not (= (bvand lt!311325 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311326 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311325 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311325 lt!311326) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199414 (= lt!311326 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!199414 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!199414 (= lt!311325 (bitIndex!0 (size!4458 (buf!4950 lt!309699)) (currentByte!9297 lt!309699) (currentBit!9292 lt!309699)))))

(declare-fun b!199416 () Bool)

(declare-fun e!136846 () tuple2!17142)

(assert (=> b!199416 (= e!136846 (tuple2!17143 lt!309673 lt!309699))))

(declare-fun b!199417 () Bool)

(declare-fun e!136847 () Bool)

(assert (=> b!199417 (= e!136848 e!136847)))

(declare-fun res!166928 () Bool)

(assert (=> b!199417 (=> res!166928 e!136847)))

(assert (=> b!199417 (= res!166928 (not (bvslt (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-fun b!199418 () Bool)

(declare-fun lt!311322 () tuple2!17142)

(assert (=> b!199418 (= e!136846 (tuple2!17143 (_1!9219 lt!311322) (_2!9219 lt!311322)))))

(declare-fun lt!311321 () tuple2!17140)

(assert (=> b!199418 (= lt!311321 (readBit!0 lt!309699))))

(assert (=> b!199418 (= lt!311322 (readNBitsLSBFirstsLoop!0 (_2!9218 lt!311321) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!309673 (ite (_1!9218 lt!311321) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!199415 () Bool)

(declare-fun lt!311323 () (_ BitVec 64))

(assert (=> b!199415 (= e!136847 (= (= (bvand (bvlshr (_1!9219 lt!311324) lt!311323) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!9211 (readBitPure!0 lt!309699))))))

(assert (=> b!199415 (and (bvsge lt!311323 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!311323 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!199415 (= lt!311323 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun d!68041 () Bool)

(assert (=> d!68041 e!136848))

(declare-fun res!166931 () Bool)

(assert (=> d!68041 (=> (not res!166931) (not e!136848))))

(assert (=> d!68041 (= res!166931 (= (buf!4950 (_2!9219 lt!311324)) (buf!4950 lt!309699)))))

(assert (=> d!68041 (= lt!311324 e!136846)))

(declare-fun c!9946 () Bool)

(assert (=> d!68041 (= c!9946 (= nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (=> d!68041 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsle (bvadd #b00000000000000000000000000000001 i!590) nBits!348) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!68041 (= (readNBitsLSBFirstsLoop!0 lt!309699 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!309673) lt!311324)))

(assert (= (and d!68041 c!9946) b!199416))

(assert (= (and d!68041 (not c!9946)) b!199418))

(assert (= (and d!68041 res!166931) b!199414))

(assert (= (and b!199414 res!166932) b!199413))

(assert (= (and b!199413 res!166929) b!199412))

(assert (= (and b!199412 res!166930) b!199417))

(assert (= (and b!199417 (not res!166928)) b!199415))

(declare-fun m!309137 () Bool)

(assert (=> b!199415 m!309137))

(declare-fun m!309139 () Bool)

(assert (=> b!199418 m!309139))

(declare-fun m!309141 () Bool)

(assert (=> b!199418 m!309141))

(assert (=> b!199413 m!308423))

(declare-fun m!309143 () Bool)

(assert (=> b!199414 m!309143))

(declare-fun m!309145 () Bool)

(assert (=> b!199414 m!309145))

(assert (=> b!199412 m!308403))

(assert (=> d!67739 d!68041))

(assert (=> b!198884 d!67615))

(declare-fun d!68043 () Bool)

(assert (=> d!68043 (arrayBitRangesEq!0 (buf!4950 (_2!9210 lt!309690)) (buf!4950 thiss!1204) lt!310151 lt!310135)))

(declare-fun lt!311329 () Unit!14062)

(declare-fun choose!8 (array!10116 array!10116 (_ BitVec 64) (_ BitVec 64)) Unit!14062)

(assert (=> d!68043 (= lt!311329 (choose!8 (buf!4950 thiss!1204) (buf!4950 (_2!9210 lt!309690)) lt!310151 lt!310135))))

(assert (=> d!68043 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!310151) (bvsle lt!310151 lt!310135))))

(assert (=> d!68043 (= (arrayBitRangesEqSymmetric!0 (buf!4950 thiss!1204) (buf!4950 (_2!9210 lt!309690)) lt!310151 lt!310135) lt!311329)))

(declare-fun bs!16796 () Bool)

(assert (= bs!16796 d!68043))

(assert (=> bs!16796 m!308033))

(declare-fun m!309147 () Bool)

(assert (=> bs!16796 m!309147))

(assert (=> b!198884 d!68043))

(declare-fun d!68045 () Bool)

(declare-fun res!166935 () Bool)

(declare-fun e!136852 () Bool)

(assert (=> d!68045 (=> res!166935 e!136852)))

(assert (=> d!68045 (= res!166935 (bvsge lt!310151 lt!310135))))

(assert (=> d!68045 (= (arrayBitRangesEq!0 (buf!4950 (_2!9210 lt!309690)) (buf!4950 thiss!1204) lt!310151 lt!310135) e!136852)))

(declare-fun b!199419 () Bool)

(declare-fun e!136854 () Bool)

(declare-fun e!136853 () Bool)

(assert (=> b!199419 (= e!136854 e!136853)))

(declare-fun res!166934 () Bool)

(declare-fun call!3155 () Bool)

(assert (=> b!199419 (= res!166934 call!3155)))

(assert (=> b!199419 (=> (not res!166934) (not e!136853))))

(declare-fun b!199420 () Bool)

(declare-fun e!136851 () Bool)

(assert (=> b!199420 (= e!136851 e!136854)))

(declare-fun c!9947 () Bool)

(declare-fun lt!311330 () tuple4!266)

(assert (=> b!199420 (= c!9947 (= (_3!649 lt!311330) (_4!133 lt!311330)))))

(declare-fun b!199421 () Bool)

(declare-fun e!136850 () Bool)

(assert (=> b!199421 (= e!136850 (arrayRangesEq!695 (buf!4950 (_2!9210 lt!309690)) (buf!4950 thiss!1204) (_1!9221 lt!311330) (_2!9221 lt!311330)))))

(declare-fun lt!311332 () (_ BitVec 32))

(declare-fun e!136849 () Bool)

(declare-fun b!199422 () Bool)

(assert (=> b!199422 (= e!136849 (byteRangesEq!0 (select (arr!5388 (buf!4950 (_2!9210 lt!309690))) (_4!133 lt!311330)) (select (arr!5388 (buf!4950 thiss!1204)) (_4!133 lt!311330)) #b00000000000000000000000000000000 lt!311332))))

(declare-fun lt!311331 () (_ BitVec 32))

(declare-fun bm!3152 () Bool)

(assert (=> bm!3152 (= call!3155 (byteRangesEq!0 (select (arr!5388 (buf!4950 (_2!9210 lt!309690))) (_3!649 lt!311330)) (select (arr!5388 (buf!4950 thiss!1204)) (_3!649 lt!311330)) lt!311331 (ite c!9947 lt!311332 #b00000000000000000000000000001000)))))

(declare-fun b!199423 () Bool)

(assert (=> b!199423 (= e!136852 e!136851)))

(declare-fun res!166937 () Bool)

(assert (=> b!199423 (=> (not res!166937) (not e!136851))))

(assert (=> b!199423 (= res!166937 e!136850)))

(declare-fun res!166933 () Bool)

(assert (=> b!199423 (=> res!166933 e!136850)))

(assert (=> b!199423 (= res!166933 (bvsge (_1!9221 lt!311330) (_2!9221 lt!311330)))))

(assert (=> b!199423 (= lt!311332 ((_ extract 31 0) (bvsrem lt!310135 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199423 (= lt!311331 ((_ extract 31 0) (bvsrem lt!310151 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199423 (= lt!311330 (arrayBitIndices!0 lt!310151 lt!310135))))

(declare-fun b!199424 () Bool)

(declare-fun res!166936 () Bool)

(assert (=> b!199424 (= res!166936 (= lt!311332 #b00000000000000000000000000000000))))

(assert (=> b!199424 (=> res!166936 e!136849)))

(assert (=> b!199424 (= e!136853 e!136849)))

(declare-fun b!199425 () Bool)

(assert (=> b!199425 (= e!136854 call!3155)))

(assert (= (and d!68045 (not res!166935)) b!199423))

(assert (= (and b!199423 (not res!166933)) b!199421))

(assert (= (and b!199423 res!166937) b!199420))

(assert (= (and b!199420 c!9947) b!199425))

(assert (= (and b!199420 (not c!9947)) b!199419))

(assert (= (and b!199419 res!166934) b!199424))

(assert (= (and b!199424 (not res!166936)) b!199422))

(assert (= (or b!199425 b!199419) bm!3152))

(declare-fun m!309149 () Bool)

(assert (=> b!199421 m!309149))

(declare-fun m!309151 () Bool)

(assert (=> b!199422 m!309151))

(declare-fun m!309153 () Bool)

(assert (=> b!199422 m!309153))

(assert (=> b!199422 m!309151))

(assert (=> b!199422 m!309153))

(declare-fun m!309155 () Bool)

(assert (=> b!199422 m!309155))

(declare-fun m!309157 () Bool)

(assert (=> bm!3152 m!309157))

(declare-fun m!309159 () Bool)

(assert (=> bm!3152 m!309159))

(assert (=> bm!3152 m!309157))

(assert (=> bm!3152 m!309159))

(declare-fun m!309161 () Bool)

(assert (=> bm!3152 m!309161))

(declare-fun m!309163 () Bool)

(assert (=> b!199423 m!309163))

(assert (=> b!198884 d!68045))

(declare-fun d!68047 () Bool)

(declare-fun e!136855 () Bool)

(assert (=> d!68047 e!136855))

(declare-fun res!166938 () Bool)

(assert (=> d!68047 (=> (not res!166938) (not e!136855))))

(assert (=> d!68047 (= res!166938 (= (buf!4950 (_2!9210 (increaseBitIndex!0 lt!309693))) (buf!4950 lt!309693)))))

(declare-fun lt!311338 () Bool)

(assert (=> d!68047 (= lt!311338 (not (= (bvand ((_ sign_extend 24) (select (arr!5388 (buf!4950 lt!309693)) (currentByte!9297 lt!309693))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9292 lt!309693)))) #b00000000000000000000000000000000)))))

(declare-fun lt!311336 () tuple2!17140)

(assert (=> d!68047 (= lt!311336 (tuple2!17141 (not (= (bvand ((_ sign_extend 24) (select (arr!5388 (buf!4950 lt!309693)) (currentByte!9297 lt!309693))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9292 lt!309693)))) #b00000000000000000000000000000000)) (_2!9210 (increaseBitIndex!0 lt!309693))))))

(assert (=> d!68047 (validate_offset_bit!0 ((_ sign_extend 32) (size!4458 (buf!4950 lt!309693))) ((_ sign_extend 32) (currentByte!9297 lt!309693)) ((_ sign_extend 32) (currentBit!9292 lt!309693)))))

(assert (=> d!68047 (= (readBit!0 lt!309693) lt!311336)))

(declare-fun lt!311339 () (_ BitVec 64))

(declare-fun lt!311334 () (_ BitVec 64))

(declare-fun b!199426 () Bool)

(assert (=> b!199426 (= e!136855 (= (bitIndex!0 (size!4458 (buf!4950 (_2!9210 (increaseBitIndex!0 lt!309693)))) (currentByte!9297 (_2!9210 (increaseBitIndex!0 lt!309693))) (currentBit!9292 (_2!9210 (increaseBitIndex!0 lt!309693)))) (bvadd lt!311334 lt!311339)))))

(assert (=> b!199426 (or (not (= (bvand lt!311334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311339 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311334 lt!311339) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199426 (= lt!311339 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!199426 (= lt!311334 (bitIndex!0 (size!4458 (buf!4950 lt!309693)) (currentByte!9297 lt!309693) (currentBit!9292 lt!309693)))))

(declare-fun lt!311335 () Bool)

(assert (=> b!199426 (= lt!311335 (not (= (bvand ((_ sign_extend 24) (select (arr!5388 (buf!4950 lt!309693)) (currentByte!9297 lt!309693))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9292 lt!309693)))) #b00000000000000000000000000000000)))))

(declare-fun lt!311337 () Bool)

(assert (=> b!199426 (= lt!311337 (not (= (bvand ((_ sign_extend 24) (select (arr!5388 (buf!4950 lt!309693)) (currentByte!9297 lt!309693))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9292 lt!309693)))) #b00000000000000000000000000000000)))))

(declare-fun lt!311333 () Bool)

(assert (=> b!199426 (= lt!311333 (not (= (bvand ((_ sign_extend 24) (select (arr!5388 (buf!4950 lt!309693)) (currentByte!9297 lt!309693))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9292 lt!309693)))) #b00000000000000000000000000000000)))))

(assert (= (and d!68047 res!166938) b!199426))

(declare-fun m!309165 () Bool)

(assert (=> d!68047 m!309165))

(declare-fun m!309167 () Bool)

(assert (=> d!68047 m!309167))

(declare-fun m!309169 () Bool)

(assert (=> d!68047 m!309169))

(declare-fun m!309171 () Bool)

(assert (=> d!68047 m!309171))

(declare-fun m!309173 () Bool)

(assert (=> b!199426 m!309173))

(assert (=> b!199426 m!309169))

(declare-fun m!309175 () Bool)

(assert (=> b!199426 m!309175))

(assert (=> b!199426 m!309165))

(assert (=> b!199426 m!309167))

(assert (=> d!67677 d!68047))

(assert (=> d!67687 d!67685))

(declare-fun d!68049 () Bool)

(assert (=> d!68049 (isPrefixOf!0 thiss!1204 (_2!9210 lt!309690))))

(assert (=> d!68049 true))

(declare-fun _$15!300 () Unit!14062)

(assert (=> d!68049 (= (choose!30 thiss!1204 (_2!9210 lt!309686) (_2!9210 lt!309690)) _$15!300)))

(declare-fun bs!16797 () Bool)

(assert (= bs!16797 d!68049))

(assert (=> bs!16797 m!307655))

(assert (=> d!67687 d!68049))

(assert (=> d!67687 d!67647))

(assert (=> b!198798 d!67657))

(declare-fun d!68051 () Bool)

(assert (=> d!68051 (= (invariant!0 (currentBit!9292 (_2!9210 lt!310730)) (currentByte!9297 (_2!9210 lt!310730)) (size!4458 (buf!4950 (_2!9210 lt!310730)))) (and (bvsge (currentBit!9292 (_2!9210 lt!310730)) #b00000000000000000000000000000000) (bvslt (currentBit!9292 (_2!9210 lt!310730)) #b00000000000000000000000000001000) (bvsge (currentByte!9297 (_2!9210 lt!310730)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9297 (_2!9210 lt!310730)) (size!4458 (buf!4950 (_2!9210 lt!310730)))) (and (= (currentBit!9292 (_2!9210 lt!310730)) #b00000000000000000000000000000000) (= (currentByte!9297 (_2!9210 lt!310730)) (size!4458 (buf!4950 (_2!9210 lt!310730))))))))))

(assert (=> d!67689 d!68051))

(declare-fun d!68053 () Bool)

(declare-fun res!166941 () Bool)

(declare-fun e!136856 () Bool)

(assert (=> d!68053 (=> (not res!166941) (not e!136856))))

(assert (=> d!68053 (= res!166941 (= (size!4458 (buf!4950 (_2!9210 lt!309686))) (size!4458 (buf!4950 (_2!9210 lt!310730)))))))

(assert (=> d!68053 (= (isPrefixOf!0 (_2!9210 lt!309686) (_2!9210 lt!310730)) e!136856)))

(declare-fun b!199427 () Bool)

(declare-fun res!166939 () Bool)

(assert (=> b!199427 (=> (not res!166939) (not e!136856))))

(assert (=> b!199427 (= res!166939 (bvsle (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310730))) (currentByte!9297 (_2!9210 lt!310730)) (currentBit!9292 (_2!9210 lt!310730)))))))

(declare-fun b!199428 () Bool)

(declare-fun e!136857 () Bool)

(assert (=> b!199428 (= e!136856 e!136857)))

(declare-fun res!166940 () Bool)

(assert (=> b!199428 (=> res!166940 e!136857)))

(assert (=> b!199428 (= res!166940 (= (size!4458 (buf!4950 (_2!9210 lt!309686))) #b00000000000000000000000000000000))))

(declare-fun b!199429 () Bool)

(assert (=> b!199429 (= e!136857 (arrayBitRangesEq!0 (buf!4950 (_2!9210 lt!309686)) (buf!4950 (_2!9210 lt!310730)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686)))))))

(assert (= (and d!68053 res!166941) b!199427))

(assert (= (and b!199427 res!166939) b!199428))

(assert (= (and b!199428 (not res!166940)) b!199429))

(assert (=> b!199427 m!307719))

(assert (=> b!199427 m!308451))

(assert (=> b!199429 m!307719))

(assert (=> b!199429 m!307719))

(declare-fun m!309177 () Bool)

(assert (=> b!199429 m!309177))

(assert (=> b!199076 d!68053))

(declare-fun d!68055 () Bool)

(declare-fun lt!311340 () tuple2!17140)

(assert (=> d!68055 (= lt!311340 (readBit!0 (readerFrom!0 (_2!9210 lt!310074) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204))))))

(assert (=> d!68055 (= (readBitPure!0 (readerFrom!0 (_2!9210 lt!310074) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204))) (tuple2!17127 (_2!9218 lt!311340) (_1!9218 lt!311340)))))

(declare-fun bs!16798 () Bool)

(assert (= bs!16798 d!68055))

(assert (=> bs!16798 m!308001))

(declare-fun m!309179 () Bool)

(assert (=> bs!16798 m!309179))

(assert (=> b!198863 d!68055))

(declare-fun d!68057 () Bool)

(declare-fun e!136858 () Bool)

(assert (=> d!68057 e!136858))

(declare-fun res!166942 () Bool)

(assert (=> d!68057 (=> (not res!166942) (not e!136858))))

(assert (=> d!68057 (= res!166942 (invariant!0 (currentBit!9292 (_2!9210 lt!310074)) (currentByte!9297 (_2!9210 lt!310074)) (size!4458 (buf!4950 (_2!9210 lt!310074)))))))

(assert (=> d!68057 (= (readerFrom!0 (_2!9210 lt!310074) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204)) (BitStream!8025 (buf!4950 (_2!9210 lt!310074)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)))))

(declare-fun b!199430 () Bool)

(assert (=> b!199430 (= e!136858 (invariant!0 (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204) (size!4458 (buf!4950 (_2!9210 lt!310074)))))))

(assert (= (and d!68057 res!166942) b!199430))

(declare-fun m!309181 () Bool)

(assert (=> d!68057 m!309181))

(declare-fun m!309183 () Bool)

(assert (=> b!199430 m!309183))

(assert (=> b!198863 d!68057))

(declare-fun d!68059 () Bool)

(assert (=> d!68059 (= (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!309690)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309690))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309690)))) (bvsub (bvmul ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!309690)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309690))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309690))))))))

(assert (=> d!67683 d!68059))

(assert (=> d!67683 d!67749))

(assert (=> b!198899 d!67615))

(assert (=> b!198899 d!67683))

(assert (=> d!67747 d!67745))

(declare-fun d!68061 () Bool)

(declare-fun e!136859 () Bool)

(assert (=> d!68061 e!136859))

(declare-fun res!166944 () Bool)

(assert (=> d!68061 (=> (not res!166944) (not e!136859))))

(declare-fun lt!311342 () (_ BitVec 64))

(declare-fun lt!311345 () (_ BitVec 64))

(declare-fun lt!311346 () (_ BitVec 64))

(assert (=> d!68061 (= res!166944 (= lt!311346 (bvsub lt!311345 lt!311342)))))

(assert (=> d!68061 (or (= (bvand lt!311345 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311342 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311345 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311345 lt!311342) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68061 (= lt!311342 (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310730)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!310730))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!310730)))))))

(declare-fun lt!311341 () (_ BitVec 64))

(declare-fun lt!311344 () (_ BitVec 64))

(assert (=> d!68061 (= lt!311345 (bvmul lt!311341 lt!311344))))

(assert (=> d!68061 (or (= lt!311341 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311344 (bvsdiv (bvmul lt!311341 lt!311344) lt!311341)))))

(assert (=> d!68061 (= lt!311344 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68061 (= lt!311341 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310730)))))))

(assert (=> d!68061 (= lt!311346 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!310730))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!310730)))))))

(assert (=> d!68061 (invariant!0 (currentBit!9292 (_2!9210 lt!310730)) (currentByte!9297 (_2!9210 lt!310730)) (size!4458 (buf!4950 (_2!9210 lt!310730))))))

(assert (=> d!68061 (= (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310730))) (currentByte!9297 (_2!9210 lt!310730)) (currentBit!9292 (_2!9210 lt!310730))) lt!311346)))

(declare-fun b!199431 () Bool)

(declare-fun res!166943 () Bool)

(assert (=> b!199431 (=> (not res!166943) (not e!136859))))

(assert (=> b!199431 (= res!166943 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311346))))

(declare-fun b!199432 () Bool)

(declare-fun lt!311343 () (_ BitVec 64))

(assert (=> b!199432 (= e!136859 (bvsle lt!311346 (bvmul lt!311343 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199432 (or (= lt!311343 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311343 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311343)))))

(assert (=> b!199432 (= lt!311343 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310730)))))))

(assert (= (and d!68061 res!166944) b!199431))

(assert (= (and b!199431 res!166943) b!199432))

(declare-fun m!309185 () Bool)

(assert (=> d!68061 m!309185))

(assert (=> d!68061 m!308435))

(assert (=> b!199078 d!68061))

(assert (=> b!199078 d!67611))

(declare-fun d!68063 () Bool)

(declare-fun res!166947 () Bool)

(declare-fun e!136860 () Bool)

(assert (=> d!68063 (=> (not res!166947) (not e!136860))))

(assert (=> d!68063 (= res!166947 (= (size!4458 (buf!4950 (_1!9212 lt!310188))) (size!4458 (buf!4950 (_2!9210 lt!309686)))))))

(assert (=> d!68063 (= (isPrefixOf!0 (_1!9212 lt!310188) (_2!9210 lt!309686)) e!136860)))

(declare-fun b!199433 () Bool)

(declare-fun res!166945 () Bool)

(assert (=> b!199433 (=> (not res!166945) (not e!136860))))

(assert (=> b!199433 (= res!166945 (bvsle (bitIndex!0 (size!4458 (buf!4950 (_1!9212 lt!310188))) (currentByte!9297 (_1!9212 lt!310188)) (currentBit!9292 (_1!9212 lt!310188))) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686)))))))

(declare-fun b!199434 () Bool)

(declare-fun e!136861 () Bool)

(assert (=> b!199434 (= e!136860 e!136861)))

(declare-fun res!166946 () Bool)

(assert (=> b!199434 (=> res!166946 e!136861)))

(assert (=> b!199434 (= res!166946 (= (size!4458 (buf!4950 (_1!9212 lt!310188))) #b00000000000000000000000000000000))))

(declare-fun b!199435 () Bool)

(assert (=> b!199435 (= e!136861 (arrayBitRangesEq!0 (buf!4950 (_1!9212 lt!310188)) (buf!4950 (_2!9210 lt!309686)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4458 (buf!4950 (_1!9212 lt!310188))) (currentByte!9297 (_1!9212 lt!310188)) (currentBit!9292 (_1!9212 lt!310188)))))))

(assert (= (and d!68063 res!166947) b!199433))

(assert (= (and b!199433 res!166945) b!199434))

(assert (= (and b!199434 (not res!166946)) b!199435))

(declare-fun m!309187 () Bool)

(assert (=> b!199433 m!309187))

(assert (=> b!199433 m!307719))

(assert (=> b!199435 m!309187))

(assert (=> b!199435 m!309187))

(declare-fun m!309189 () Bool)

(assert (=> b!199435 m!309189))

(assert (=> b!198893 d!68063))

(declare-fun d!68065 () Bool)

(assert (=> d!68065 (= (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!309681)))) ((_ sign_extend 32) (currentByte!9297 (_1!9211 lt!309681))) ((_ sign_extend 32) (currentBit!9292 (_1!9211 lt!309681)))) (bvsub (bvmul ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!309681)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 (_1!9211 lt!309681))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 (_1!9211 lt!309681))))))))

(assert (=> d!67649 d!68065))

(declare-fun d!68067 () Bool)

(assert (=> d!68067 (= (invariant!0 (currentBit!9292 (_1!9211 lt!309681)) (currentByte!9297 (_1!9211 lt!309681)) (size!4458 (buf!4950 (_1!9211 lt!309681)))) (and (bvsge (currentBit!9292 (_1!9211 lt!309681)) #b00000000000000000000000000000000) (bvslt (currentBit!9292 (_1!9211 lt!309681)) #b00000000000000000000000000001000) (bvsge (currentByte!9297 (_1!9211 lt!309681)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9297 (_1!9211 lt!309681)) (size!4458 (buf!4950 (_1!9211 lt!309681)))) (and (= (currentBit!9292 (_1!9211 lt!309681)) #b00000000000000000000000000000000) (= (currentByte!9297 (_1!9211 lt!309681)) (size!4458 (buf!4950 (_1!9211 lt!309681))))))))))

(assert (=> d!67649 d!68067))

(declare-fun d!68069 () Bool)

(declare-fun e!136862 () Bool)

(assert (=> d!68069 e!136862))

(declare-fun res!166949 () Bool)

(assert (=> d!68069 (=> (not res!166949) (not e!136862))))

(declare-fun lt!311352 () (_ BitVec 64))

(declare-fun lt!311351 () (_ BitVec 64))

(declare-fun lt!311348 () (_ BitVec 64))

(assert (=> d!68069 (= res!166949 (= lt!311352 (bvsub lt!311351 lt!311348)))))

(assert (=> d!68069 (or (= (bvand lt!311351 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311348 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311351 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311351 lt!311348) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68069 (= lt!311348 (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310754)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!310754))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!310754)))))))

(declare-fun lt!311347 () (_ BitVec 64))

(declare-fun lt!311350 () (_ BitVec 64))

(assert (=> d!68069 (= lt!311351 (bvmul lt!311347 lt!311350))))

(assert (=> d!68069 (or (= lt!311347 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311350 (bvsdiv (bvmul lt!311347 lt!311350) lt!311347)))))

(assert (=> d!68069 (= lt!311350 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68069 (= lt!311347 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310754)))))))

(assert (=> d!68069 (= lt!311352 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!310754))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!310754)))))))

(assert (=> d!68069 (invariant!0 (currentBit!9292 (_2!9210 lt!310754)) (currentByte!9297 (_2!9210 lt!310754)) (size!4458 (buf!4950 (_2!9210 lt!310754))))))

(assert (=> d!68069 (= (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310754))) (currentByte!9297 (_2!9210 lt!310754)) (currentBit!9292 (_2!9210 lt!310754))) lt!311352)))

(declare-fun b!199436 () Bool)

(declare-fun res!166948 () Bool)

(assert (=> b!199436 (=> (not res!166948) (not e!136862))))

(assert (=> b!199436 (= res!166948 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311352))))

(declare-fun b!199437 () Bool)

(declare-fun lt!311349 () (_ BitVec 64))

(assert (=> b!199437 (= e!136862 (bvsle lt!311352 (bvmul lt!311349 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199437 (or (= lt!311349 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311349 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311349)))))

(assert (=> b!199437 (= lt!311349 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310754)))))))

(assert (= (and d!68069 res!166949) b!199436))

(assert (= (and b!199436 res!166948) b!199437))

(declare-fun m!309191 () Bool)

(assert (=> d!68069 m!309191))

(declare-fun m!309193 () Bool)

(assert (=> d!68069 m!309193))

(assert (=> b!199071 d!68069))

(assert (=> b!199071 d!67611))

(declare-fun d!68071 () Bool)

(declare-fun e!136863 () Bool)

(assert (=> d!68071 e!136863))

(declare-fun res!166951 () Bool)

(assert (=> d!68071 (=> (not res!166951) (not e!136863))))

(declare-fun lt!311358 () (_ BitVec 64))

(declare-fun lt!311357 () (_ BitVec 64))

(declare-fun lt!311354 () (_ BitVec 64))

(assert (=> d!68071 (= res!166951 (= lt!311358 (bvsub lt!311357 lt!311354)))))

(assert (=> d!68071 (or (= (bvand lt!311357 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311354 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311357 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311357 lt!311354) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68071 (= lt!311354 (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 lt!309936))) ((_ sign_extend 32) (currentByte!9297 lt!309936)) ((_ sign_extend 32) (currentBit!9292 lt!309936))))))

(declare-fun lt!311353 () (_ BitVec 64))

(declare-fun lt!311356 () (_ BitVec 64))

(assert (=> d!68071 (= lt!311357 (bvmul lt!311353 lt!311356))))

(assert (=> d!68071 (or (= lt!311353 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311356 (bvsdiv (bvmul lt!311353 lt!311356) lt!311353)))))

(assert (=> d!68071 (= lt!311356 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68071 (= lt!311353 ((_ sign_extend 32) (size!4458 (buf!4950 lt!309936))))))

(assert (=> d!68071 (= lt!311358 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 lt!309936)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 lt!309936))))))

(assert (=> d!68071 (invariant!0 (currentBit!9292 lt!309936) (currentByte!9297 lt!309936) (size!4458 (buf!4950 lt!309936)))))

(assert (=> d!68071 (= (bitIndex!0 (size!4458 (buf!4950 lt!309936)) (currentByte!9297 lt!309936) (currentBit!9292 lt!309936)) lt!311358)))

(declare-fun b!199438 () Bool)

(declare-fun res!166950 () Bool)

(assert (=> b!199438 (=> (not res!166950) (not e!136863))))

(assert (=> b!199438 (= res!166950 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311358))))

(declare-fun b!199439 () Bool)

(declare-fun lt!311355 () (_ BitVec 64))

(assert (=> b!199439 (= e!136863 (bvsle lt!311358 (bvmul lt!311355 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199439 (or (= lt!311355 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311355 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311355)))))

(assert (=> b!199439 (= lt!311355 ((_ sign_extend 32) (size!4458 (buf!4950 lt!309936))))))

(assert (= (and d!68071 res!166951) b!199438))

(assert (= (and b!199438 res!166950) b!199439))

(declare-fun m!309195 () Bool)

(assert (=> d!68071 m!309195))

(declare-fun m!309197 () Bool)

(assert (=> d!68071 m!309197))

(assert (=> d!67607 d!68071))

(declare-fun d!68073 () Bool)

(declare-fun e!136864 () Bool)

(assert (=> d!68073 e!136864))

(declare-fun res!166953 () Bool)

(assert (=> d!68073 (=> (not res!166953) (not e!136864))))

(declare-fun lt!311360 () (_ BitVec 64))

(declare-fun lt!311363 () (_ BitVec 64))

(declare-fun lt!311364 () (_ BitVec 64))

(assert (=> d!68073 (= res!166953 (= lt!311364 (bvsub lt!311363 lt!311360)))))

(assert (=> d!68073 (or (= (bvand lt!311363 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311360 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311363 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311363 lt!311360) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68073 (= lt!311360 (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9212 lt!309700)))) ((_ sign_extend 32) (currentByte!9297 (_2!9212 lt!309700))) ((_ sign_extend 32) (currentBit!9292 (_2!9212 lt!309700)))))))

(declare-fun lt!311359 () (_ BitVec 64))

(declare-fun lt!311362 () (_ BitVec 64))

(assert (=> d!68073 (= lt!311363 (bvmul lt!311359 lt!311362))))

(assert (=> d!68073 (or (= lt!311359 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311362 (bvsdiv (bvmul lt!311359 lt!311362) lt!311359)))))

(assert (=> d!68073 (= lt!311362 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68073 (= lt!311359 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9212 lt!309700)))))))

(assert (=> d!68073 (= lt!311364 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 (_2!9212 lt!309700))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 (_2!9212 lt!309700)))))))

(assert (=> d!68073 (invariant!0 (currentBit!9292 (_2!9212 lt!309700)) (currentByte!9297 (_2!9212 lt!309700)) (size!4458 (buf!4950 (_2!9212 lt!309700))))))

(assert (=> d!68073 (= (bitIndex!0 (size!4458 (buf!4950 (_2!9212 lt!309700))) (currentByte!9297 (_2!9212 lt!309700)) (currentBit!9292 (_2!9212 lt!309700))) lt!311364)))

(declare-fun b!199440 () Bool)

(declare-fun res!166952 () Bool)

(assert (=> b!199440 (=> (not res!166952) (not e!136864))))

(assert (=> b!199440 (= res!166952 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311364))))

(declare-fun b!199441 () Bool)

(declare-fun lt!311361 () (_ BitVec 64))

(assert (=> b!199441 (= e!136864 (bvsle lt!311364 (bvmul lt!311361 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199441 (or (= lt!311361 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311361 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311361)))))

(assert (=> b!199441 (= lt!311361 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9212 lt!309700)))))))

(assert (= (and d!68073 res!166953) b!199440))

(assert (= (and b!199440 res!166952) b!199441))

(declare-fun m!309199 () Bool)

(assert (=> d!68073 m!309199))

(declare-fun m!309201 () Bool)

(assert (=> d!68073 m!309201))

(assert (=> d!67607 d!68073))

(declare-fun d!68075 () Bool)

(declare-fun lt!311368 () (_ BitVec 32))

(assert (=> d!68075 (= lt!311368 ((_ extract 31 0) (bvsrem (bvsub lt!309685 lt!309677) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!311369 () (_ BitVec 32))

(assert (=> d!68075 (= lt!311369 ((_ extract 31 0) (bvsdiv (bvsub lt!309685 lt!309677) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!136865 () Bool)

(assert (=> d!68075 e!136865))

(declare-fun res!166954 () Bool)

(assert (=> d!68075 (=> (not res!166954) (not e!136865))))

(assert (=> d!68075 (= res!166954 (moveBitIndexPrecond!0 (_2!9212 lt!309700) (bvsub lt!309685 lt!309677)))))

(declare-fun Unit!14147 () Unit!14062)

(declare-fun Unit!14148 () Unit!14062)

(declare-fun Unit!14149 () Unit!14062)

(assert (=> d!68075 (= (moveBitIndex!0 (_2!9212 lt!309700) (bvsub lt!309685 lt!309677)) (ite (bvslt (bvadd (currentBit!9292 (_2!9212 lt!309700)) lt!311368) #b00000000000000000000000000000000) (tuple2!17125 Unit!14147 (BitStream!8025 (buf!4950 (_2!9212 lt!309700)) (bvsub (bvadd (currentByte!9297 (_2!9212 lt!309700)) lt!311369) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!311368 (currentBit!9292 (_2!9212 lt!309700))))) (ite (bvsge (bvadd (currentBit!9292 (_2!9212 lt!309700)) lt!311368) #b00000000000000000000000000001000) (tuple2!17125 Unit!14148 (BitStream!8025 (buf!4950 (_2!9212 lt!309700)) (bvadd (currentByte!9297 (_2!9212 lt!309700)) lt!311369 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9292 (_2!9212 lt!309700)) lt!311368) #b00000000000000000000000000001000))) (tuple2!17125 Unit!14149 (BitStream!8025 (buf!4950 (_2!9212 lt!309700)) (bvadd (currentByte!9297 (_2!9212 lt!309700)) lt!311369) (bvadd (currentBit!9292 (_2!9212 lt!309700)) lt!311368))))))))

(declare-fun b!199442 () Bool)

(declare-fun e!136866 () Bool)

(assert (=> b!199442 (= e!136865 e!136866)))

(declare-fun res!166955 () Bool)

(assert (=> b!199442 (=> (not res!166955) (not e!136866))))

(declare-fun lt!311367 () (_ BitVec 64))

(declare-fun lt!311370 () tuple2!17124)

(assert (=> b!199442 (= res!166955 (= (bvadd lt!311367 (bvsub lt!309685 lt!309677)) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!311370))) (currentByte!9297 (_2!9210 lt!311370)) (currentBit!9292 (_2!9210 lt!311370)))))))

(assert (=> b!199442 (or (not (= (bvand lt!311367 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309685 lt!309677) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311367 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311367 (bvsub lt!309685 lt!309677)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199442 (= lt!311367 (bitIndex!0 (size!4458 (buf!4950 (_2!9212 lt!309700))) (currentByte!9297 (_2!9212 lt!309700)) (currentBit!9292 (_2!9212 lt!309700))))))

(declare-fun lt!311365 () (_ BitVec 32))

(declare-fun lt!311366 () (_ BitVec 32))

(declare-fun Unit!14150 () Unit!14062)

(declare-fun Unit!14151 () Unit!14062)

(declare-fun Unit!14152 () Unit!14062)

(assert (=> b!199442 (= lt!311370 (ite (bvslt (bvadd (currentBit!9292 (_2!9212 lt!309700)) lt!311366) #b00000000000000000000000000000000) (tuple2!17125 Unit!14150 (BitStream!8025 (buf!4950 (_2!9212 lt!309700)) (bvsub (bvadd (currentByte!9297 (_2!9212 lt!309700)) lt!311365) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!311366 (currentBit!9292 (_2!9212 lt!309700))))) (ite (bvsge (bvadd (currentBit!9292 (_2!9212 lt!309700)) lt!311366) #b00000000000000000000000000001000) (tuple2!17125 Unit!14151 (BitStream!8025 (buf!4950 (_2!9212 lt!309700)) (bvadd (currentByte!9297 (_2!9212 lt!309700)) lt!311365 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9292 (_2!9212 lt!309700)) lt!311366) #b00000000000000000000000000001000))) (tuple2!17125 Unit!14152 (BitStream!8025 (buf!4950 (_2!9212 lt!309700)) (bvadd (currentByte!9297 (_2!9212 lt!309700)) lt!311365) (bvadd (currentBit!9292 (_2!9212 lt!309700)) lt!311366))))))))

(assert (=> b!199442 (= lt!311366 ((_ extract 31 0) (bvsrem (bvsub lt!309685 lt!309677) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199442 (= lt!311365 ((_ extract 31 0) (bvsdiv (bvsub lt!309685 lt!309677) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!199443 () Bool)

(assert (=> b!199443 (= e!136866 (and (= (size!4458 (buf!4950 (_2!9212 lt!309700))) (size!4458 (buf!4950 (_2!9210 lt!311370)))) (= (buf!4950 (_2!9212 lt!309700)) (buf!4950 (_2!9210 lt!311370)))))))

(assert (= (and d!68075 res!166954) b!199442))

(assert (= (and b!199442 res!166955) b!199443))

(assert (=> d!68075 m!307917))

(declare-fun m!309203 () Bool)

(assert (=> b!199442 m!309203))

(assert (=> b!199442 m!307913))

(assert (=> d!67607 d!68075))

(declare-fun d!68077 () Bool)

(declare-fun res!166956 () Bool)

(declare-fun e!136867 () Bool)

(assert (=> d!68077 (=> (not res!166956) (not e!136867))))

(assert (=> d!68077 (= res!166956 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9212 lt!309700))))) (bvsub lt!309685 lt!309677)) (bvsle (bvsub lt!309685 lt!309677) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9212 lt!309700))))))))))

(assert (=> d!68077 (= (moveBitIndexPrecond!0 (_2!9212 lt!309700) (bvsub lt!309685 lt!309677)) e!136867)))

(declare-fun b!199444 () Bool)

(declare-fun lt!311371 () (_ BitVec 64))

(assert (=> b!199444 (= e!136867 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311371) (bvsle lt!311371 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9212 lt!309700))))))))))

(assert (=> b!199444 (= lt!311371 (bvadd (bitIndex!0 (size!4458 (buf!4950 (_2!9212 lt!309700))) (currentByte!9297 (_2!9212 lt!309700)) (currentBit!9292 (_2!9212 lt!309700))) (bvsub lt!309685 lt!309677)))))

(assert (= (and d!68077 res!166956) b!199444))

(assert (=> b!199444 m!307913))

(assert (=> d!67607 d!68077))

(declare-fun lt!311372 () tuple2!17142)

(declare-fun d!68079 () Bool)

(assert (=> d!68079 (= lt!311372 (readNBitsLSBFirstsLoop!0 (_1!9212 lt!310762) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(assert (=> d!68079 (= (readNBitsLSBFirstsLoopPure!0 (_1!9212 lt!310762) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))) (tuple2!17131 (_2!9219 lt!311372) (_1!9219 lt!311372)))))

(declare-fun bs!16799 () Bool)

(assert (= bs!16799 d!68079))

(declare-fun m!309205 () Bool)

(assert (=> bs!16799 m!309205))

(assert (=> b!199072 d!68079))

(declare-fun d!68081 () Bool)

(assert (=> d!68081 (= (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!590)))))))

(assert (=> b!199072 d!68081))

(declare-fun b!199445 () Bool)

(declare-fun lt!311374 () (_ BitVec 64))

(declare-fun lt!311387 () (_ BitVec 64))

(declare-fun e!136869 () Bool)

(declare-fun lt!311391 () tuple2!17128)

(assert (=> b!199445 (= e!136869 (= (_1!9212 lt!311391) (withMovedBitIndex!0 (_2!9212 lt!311391) (bvsub lt!311374 lt!311387))))))

(assert (=> b!199445 (or (= (bvand lt!311374 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311387 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311374 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311374 lt!311387) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199445 (= lt!311387 (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310730))) (currentByte!9297 (_2!9210 lt!310730)) (currentBit!9292 (_2!9210 lt!310730))))))

(assert (=> b!199445 (= lt!311374 (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))))))

(declare-fun b!199446 () Bool)

(declare-fun e!136868 () Unit!14062)

(declare-fun Unit!14153 () Unit!14062)

(assert (=> b!199446 (= e!136868 Unit!14153)))

(declare-fun b!199447 () Bool)

(declare-fun lt!311388 () Unit!14062)

(assert (=> b!199447 (= e!136868 lt!311388)))

(declare-fun lt!311392 () (_ BitVec 64))

(assert (=> b!199447 (= lt!311392 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!311376 () (_ BitVec 64))

(assert (=> b!199447 (= lt!311376 (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))))))

(assert (=> b!199447 (= lt!311388 (arrayBitRangesEqSymmetric!0 (buf!4950 (_2!9210 lt!309686)) (buf!4950 (_2!9210 lt!310730)) lt!311392 lt!311376))))

(assert (=> b!199447 (arrayBitRangesEq!0 (buf!4950 (_2!9210 lt!310730)) (buf!4950 (_2!9210 lt!309686)) lt!311392 lt!311376)))

(declare-fun b!199448 () Bool)

(declare-fun res!166957 () Bool)

(assert (=> b!199448 (=> (not res!166957) (not e!136869))))

(assert (=> b!199448 (= res!166957 (isPrefixOf!0 (_1!9212 lt!311391) (_2!9210 lt!309686)))))

(declare-fun b!199449 () Bool)

(declare-fun res!166959 () Bool)

(assert (=> b!199449 (=> (not res!166959) (not e!136869))))

(assert (=> b!199449 (= res!166959 (isPrefixOf!0 (_2!9212 lt!311391) (_2!9210 lt!310730)))))

(declare-fun d!68083 () Bool)

(assert (=> d!68083 e!136869))

(declare-fun res!166958 () Bool)

(assert (=> d!68083 (=> (not res!166958) (not e!136869))))

(assert (=> d!68083 (= res!166958 (isPrefixOf!0 (_1!9212 lt!311391) (_2!9212 lt!311391)))))

(declare-fun lt!311380 () BitStream!8024)

(assert (=> d!68083 (= lt!311391 (tuple2!17129 lt!311380 (_2!9210 lt!310730)))))

(declare-fun lt!311379 () Unit!14062)

(declare-fun lt!311381 () Unit!14062)

(assert (=> d!68083 (= lt!311379 lt!311381)))

(assert (=> d!68083 (isPrefixOf!0 lt!311380 (_2!9210 lt!310730))))

(assert (=> d!68083 (= lt!311381 (lemmaIsPrefixTransitive!0 lt!311380 (_2!9210 lt!310730) (_2!9210 lt!310730)))))

(declare-fun lt!311385 () Unit!14062)

(declare-fun lt!311389 () Unit!14062)

(assert (=> d!68083 (= lt!311385 lt!311389)))

(assert (=> d!68083 (isPrefixOf!0 lt!311380 (_2!9210 lt!310730))))

(assert (=> d!68083 (= lt!311389 (lemmaIsPrefixTransitive!0 lt!311380 (_2!9210 lt!309686) (_2!9210 lt!310730)))))

(declare-fun lt!311386 () Unit!14062)

(assert (=> d!68083 (= lt!311386 e!136868)))

(declare-fun c!9948 () Bool)

(assert (=> d!68083 (= c!9948 (not (= (size!4458 (buf!4950 (_2!9210 lt!309686))) #b00000000000000000000000000000000)))))

(declare-fun lt!311390 () Unit!14062)

(declare-fun lt!311373 () Unit!14062)

(assert (=> d!68083 (= lt!311390 lt!311373)))

(assert (=> d!68083 (isPrefixOf!0 (_2!9210 lt!310730) (_2!9210 lt!310730))))

(assert (=> d!68083 (= lt!311373 (lemmaIsPrefixRefl!0 (_2!9210 lt!310730)))))

(declare-fun lt!311377 () Unit!14062)

(declare-fun lt!311375 () Unit!14062)

(assert (=> d!68083 (= lt!311377 lt!311375)))

(assert (=> d!68083 (= lt!311375 (lemmaIsPrefixRefl!0 (_2!9210 lt!310730)))))

(declare-fun lt!311378 () Unit!14062)

(declare-fun lt!311382 () Unit!14062)

(assert (=> d!68083 (= lt!311378 lt!311382)))

(assert (=> d!68083 (isPrefixOf!0 lt!311380 lt!311380)))

(assert (=> d!68083 (= lt!311382 (lemmaIsPrefixRefl!0 lt!311380))))

(declare-fun lt!311383 () Unit!14062)

(declare-fun lt!311384 () Unit!14062)

(assert (=> d!68083 (= lt!311383 lt!311384)))

(assert (=> d!68083 (isPrefixOf!0 (_2!9210 lt!309686) (_2!9210 lt!309686))))

(assert (=> d!68083 (= lt!311384 (lemmaIsPrefixRefl!0 (_2!9210 lt!309686)))))

(assert (=> d!68083 (= lt!311380 (BitStream!8025 (buf!4950 (_2!9210 lt!310730)) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))))))

(assert (=> d!68083 (isPrefixOf!0 (_2!9210 lt!309686) (_2!9210 lt!310730))))

(assert (=> d!68083 (= (reader!0 (_2!9210 lt!309686) (_2!9210 lt!310730)) lt!311391)))

(assert (= (and d!68083 c!9948) b!199447))

(assert (= (and d!68083 (not c!9948)) b!199446))

(assert (= (and d!68083 res!166958) b!199448))

(assert (= (and b!199448 res!166957) b!199449))

(assert (= (and b!199449 res!166959) b!199445))

(declare-fun m!309207 () Bool)

(assert (=> b!199448 m!309207))

(declare-fun m!309209 () Bool)

(assert (=> b!199449 m!309209))

(assert (=> b!199447 m!307719))

(declare-fun m!309211 () Bool)

(assert (=> b!199447 m!309211))

(declare-fun m!309213 () Bool)

(assert (=> b!199447 m!309213))

(declare-fun m!309215 () Bool)

(assert (=> d!68083 m!309215))

(declare-fun m!309217 () Bool)

(assert (=> d!68083 m!309217))

(declare-fun m!309219 () Bool)

(assert (=> d!68083 m!309219))

(declare-fun m!309221 () Bool)

(assert (=> d!68083 m!309221))

(declare-fun m!309223 () Bool)

(assert (=> d!68083 m!309223))

(declare-fun m!309225 () Bool)

(assert (=> d!68083 m!309225))

(assert (=> d!68083 m!308093))

(assert (=> d!68083 m!308445))

(declare-fun m!309227 () Bool)

(assert (=> d!68083 m!309227))

(declare-fun m!309229 () Bool)

(assert (=> d!68083 m!309229))

(assert (=> d!68083 m!308099))

(declare-fun m!309231 () Bool)

(assert (=> b!199445 m!309231))

(assert (=> b!199445 m!308451))

(assert (=> b!199445 m!307719))

(assert (=> b!199072 d!68083))

(declare-fun d!68085 () Bool)

(assert (=> d!68085 (validate_offset_bits!1 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310730)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309686))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309686))) lt!310765)))

(declare-fun lt!311393 () Unit!14062)

(assert (=> d!68085 (= lt!311393 (choose!9 (_2!9210 lt!309686) (buf!4950 (_2!9210 lt!310730)) lt!310765 (BitStream!8025 (buf!4950 (_2!9210 lt!310730)) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686)))))))

(assert (=> d!68085 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9210 lt!309686) (buf!4950 (_2!9210 lt!310730)) lt!310765) lt!311393)))

(declare-fun bs!16800 () Bool)

(assert (= bs!16800 d!68085))

(assert (=> bs!16800 m!308437))

(declare-fun m!309233 () Bool)

(assert (=> bs!16800 m!309233))

(assert (=> b!199072 d!68085))

(declare-fun d!68087 () Bool)

(assert (=> d!68087 (= (onesLSBLong!0 nBits!348) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!348))))))

(assert (=> b!199072 d!68087))

(declare-fun d!68089 () Bool)

(assert (=> d!68089 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310730)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309686))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309686))) lt!310765) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310730)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309686))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309686)))) lt!310765))))

(declare-fun bs!16801 () Bool)

(assert (= bs!16801 d!68089))

(declare-fun m!309235 () Bool)

(assert (=> bs!16801 m!309235))

(assert (=> b!199072 d!68089))

(declare-fun b!199450 () Bool)

(declare-fun res!166962 () Bool)

(declare-fun e!136872 () Bool)

(assert (=> b!199450 (=> (not res!166962) (not e!136872))))

(declare-fun lt!311397 () tuple2!17142)

(assert (=> b!199450 (= res!166962 (= (bvand (_1!9219 lt!311397) (onesLSBLong!0 nBits!348)) (_1!9219 lt!311397)))))

(declare-fun b!199451 () Bool)

(declare-fun res!166961 () Bool)

(assert (=> b!199451 (=> (not res!166961) (not e!136872))))

(assert (=> b!199451 (= res!166961 (= (bvand (_1!9219 lt!311397) (onesLSBLong!0 i!590)) (bvand lt!309674 (onesLSBLong!0 i!590))))))

(declare-fun b!199452 () Bool)

(declare-fun res!166964 () Bool)

(assert (=> b!199452 (=> (not res!166964) (not e!136872))))

(declare-fun lt!311399 () (_ BitVec 64))

(declare-fun lt!311398 () (_ BitVec 64))

(assert (=> b!199452 (= res!166964 (= (bitIndex!0 (size!4458 (buf!4950 (_2!9219 lt!311397))) (currentByte!9297 (_2!9219 lt!311397)) (currentBit!9292 (_2!9219 lt!311397))) (bvadd lt!311398 lt!311399)))))

(assert (=> b!199452 (or (not (= (bvand lt!311398 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311399 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311398 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311398 lt!311399) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199452 (= lt!311399 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (=> b!199452 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand i!590 #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 i!590) #b10000000000000000000000000000000)))))

(assert (=> b!199452 (= lt!311398 (bitIndex!0 (size!4458 (buf!4950 (_1!9212 lt!309684))) (currentByte!9297 (_1!9212 lt!309684)) (currentBit!9292 (_1!9212 lt!309684))))))

(declare-fun b!199454 () Bool)

(declare-fun e!136870 () tuple2!17142)

(assert (=> b!199454 (= e!136870 (tuple2!17143 lt!309674 (_1!9212 lt!309684)))))

(declare-fun b!199455 () Bool)

(declare-fun e!136871 () Bool)

(assert (=> b!199455 (= e!136872 e!136871)))

(declare-fun res!166960 () Bool)

(assert (=> b!199455 (=> res!166960 e!136871)))

(assert (=> b!199455 (= res!166960 (not (bvslt i!590 nBits!348)))))

(declare-fun b!199456 () Bool)

(declare-fun lt!311395 () tuple2!17142)

(assert (=> b!199456 (= e!136870 (tuple2!17143 (_1!9219 lt!311395) (_2!9219 lt!311395)))))

(declare-fun lt!311394 () tuple2!17140)

(assert (=> b!199456 (= lt!311394 (readBit!0 (_1!9212 lt!309684)))))

(assert (=> b!199456 (= lt!311395 (readNBitsLSBFirstsLoop!0 (_2!9218 lt!311394) nBits!348 (bvadd i!590 #b00000000000000000000000000000001) (bvor lt!309674 (ite (_1!9218 lt!311394) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!311396 () (_ BitVec 64))

(declare-fun b!199453 () Bool)

(assert (=> b!199453 (= e!136871 (= (= (bvand (bvlshr (_1!9219 lt!311397) lt!311396) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!9211 (readBitPure!0 (_1!9212 lt!309684)))))))

(assert (=> b!199453 (and (bvsge lt!311396 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!311396 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!199453 (= lt!311396 ((_ sign_extend 32) i!590))))

(declare-fun d!68091 () Bool)

(assert (=> d!68091 e!136872))

(declare-fun res!166963 () Bool)

(assert (=> d!68091 (=> (not res!166963) (not e!136872))))

(assert (=> d!68091 (= res!166963 (= (buf!4950 (_2!9219 lt!311397)) (buf!4950 (_1!9212 lt!309684))))))

(assert (=> d!68091 (= lt!311397 e!136870)))

(declare-fun c!9949 () Bool)

(assert (=> d!68091 (= c!9949 (= nBits!348 i!590))))

(assert (=> d!68091 (and (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!68091 (= (readNBitsLSBFirstsLoop!0 (_1!9212 lt!309684) nBits!348 i!590 lt!309674) lt!311397)))

(assert (= (and d!68091 c!9949) b!199454))

(assert (= (and d!68091 (not c!9949)) b!199456))

(assert (= (and d!68091 res!166963) b!199452))

(assert (= (and b!199452 res!166964) b!199451))

(assert (= (and b!199451 res!166961) b!199450))

(assert (= (and b!199450 res!166962) b!199455))

(assert (= (and b!199455 (not res!166960)) b!199453))

(assert (=> b!199453 m!307675))

(assert (=> b!199456 m!308075))

(declare-fun m!309237 () Bool)

(assert (=> b!199456 m!309237))

(assert (=> b!199451 m!307681))

(declare-fun m!309239 () Bool)

(assert (=> b!199452 m!309239))

(assert (=> b!199452 m!308465))

(assert (=> b!199450 m!308403))

(assert (=> d!67669 d!68091))

(declare-fun d!68093 () Bool)

(declare-fun e!136873 () Bool)

(assert (=> d!68093 e!136873))

(declare-fun res!166966 () Bool)

(assert (=> d!68093 (=> (not res!166966) (not e!136873))))

(declare-fun lt!311404 () (_ BitVec 64))

(declare-fun lt!311405 () (_ BitVec 64))

(declare-fun lt!311401 () (_ BitVec 64))

(assert (=> d!68093 (= res!166966 (= lt!311405 (bvsub lt!311404 lt!311401)))))

(assert (=> d!68093 (or (= (bvand lt!311404 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311401 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311404 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311404 lt!311401) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68093 (= lt!311401 (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310074)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!310074))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!310074)))))))

(declare-fun lt!311400 () (_ BitVec 64))

(declare-fun lt!311403 () (_ BitVec 64))

(assert (=> d!68093 (= lt!311404 (bvmul lt!311400 lt!311403))))

(assert (=> d!68093 (or (= lt!311400 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311403 (bvsdiv (bvmul lt!311400 lt!311403) lt!311400)))))

(assert (=> d!68093 (= lt!311403 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68093 (= lt!311400 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310074)))))))

(assert (=> d!68093 (= lt!311405 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!310074))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!310074)))))))

(assert (=> d!68093 (invariant!0 (currentBit!9292 (_2!9210 lt!310074)) (currentByte!9297 (_2!9210 lt!310074)) (size!4458 (buf!4950 (_2!9210 lt!310074))))))

(assert (=> d!68093 (= (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310074))) (currentByte!9297 (_2!9210 lt!310074)) (currentBit!9292 (_2!9210 lt!310074))) lt!311405)))

(declare-fun b!199457 () Bool)

(declare-fun res!166965 () Bool)

(assert (=> b!199457 (=> (not res!166965) (not e!136873))))

(assert (=> b!199457 (= res!166965 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311405))))

(declare-fun b!199458 () Bool)

(declare-fun lt!311402 () (_ BitVec 64))

(assert (=> b!199458 (= e!136873 (bvsle lt!311405 (bvmul lt!311402 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199458 (or (= lt!311402 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311402 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311402)))))

(assert (=> b!199458 (= lt!311402 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310074)))))))

(assert (= (and d!68093 res!166966) b!199457))

(assert (= (and b!199457 res!166965) b!199458))

(declare-fun m!309241 () Bool)

(assert (=> d!68093 m!309241))

(assert (=> d!68093 m!309181))

(assert (=> b!198861 d!68093))

(assert (=> b!198861 d!67615))

(declare-fun b!199470 () Bool)

(declare-fun res!166978 () Bool)

(declare-fun e!136883 () Bool)

(assert (=> b!199470 (=> (not res!166978) (not e!136883))))

(declare-fun _$19!165 () tuple2!17124)

(assert (=> b!199470 (= res!166978 (isPrefixOf!0 thiss!1204 (_2!9210 _$19!165)))))

(declare-fun d!68095 () Bool)

(assert (=> d!68095 e!136883))

(declare-fun res!166977 () Bool)

(assert (=> d!68095 (=> (not res!166977) (not e!136883))))

(assert (=> d!68095 (= res!166977 (= (size!4458 (buf!4950 thiss!1204)) (size!4458 (buf!4950 (_2!9210 _$19!165)))))))

(declare-fun e!136884 () Bool)

(assert (=> d!68095 (and (inv!12 (_2!9210 _$19!165)) e!136884)))

(assert (=> d!68095 (= (choose!16 thiss!1204 lt!309698) _$19!165)))

(declare-fun b!199471 () Bool)

(declare-fun e!136882 () Bool)

(declare-fun lt!311408 () tuple2!17126)

(assert (=> b!199471 (= e!136882 (= (bitIndex!0 (size!4458 (buf!4950 (_1!9211 lt!311408))) (currentByte!9297 (_1!9211 lt!311408)) (currentBit!9292 (_1!9211 lt!311408))) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 _$19!165))) (currentByte!9297 (_2!9210 _$19!165)) (currentBit!9292 (_2!9210 _$19!165)))))))

(declare-fun b!199472 () Bool)

(declare-fun res!166975 () Bool)

(assert (=> b!199472 (=> (not res!166975) (not e!136883))))

(assert (=> b!199472 (= res!166975 (= (bitIndex!0 (size!4458 (buf!4950 (_2!9210 _$19!165))) (currentByte!9297 (_2!9210 _$19!165)) (currentBit!9292 (_2!9210 _$19!165))) (bvadd (bitIndex!0 (size!4458 (buf!4950 thiss!1204)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!199473 () Bool)

(assert (=> b!199473 (= e!136883 e!136882)))

(declare-fun res!166976 () Bool)

(assert (=> b!199473 (=> (not res!166976) (not e!136882))))

(assert (=> b!199473 (= res!166976 (and (= (_2!9211 lt!311408) lt!309698) (= (_1!9211 lt!311408) (_2!9210 _$19!165))))))

(assert (=> b!199473 (= lt!311408 (readBitPure!0 (readerFrom!0 (_2!9210 _$19!165) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204))))))

(declare-fun b!199474 () Bool)

(assert (=> b!199474 (= e!136884 (array_inv!4199 (buf!4950 (_2!9210 _$19!165))))))

(assert (= d!68095 b!199474))

(assert (= (and d!68095 res!166977) b!199472))

(assert (= (and b!199472 res!166975) b!199470))

(assert (= (and b!199470 res!166978) b!199473))

(assert (= (and b!199473 res!166976) b!199471))

(declare-fun m!309243 () Bool)

(assert (=> b!199470 m!309243))

(declare-fun m!309245 () Bool)

(assert (=> b!199471 m!309245))

(declare-fun m!309247 () Bool)

(assert (=> b!199471 m!309247))

(declare-fun m!309249 () Bool)

(assert (=> d!68095 m!309249))

(assert (=> b!199472 m!309247))

(assert (=> b!199472 m!307721))

(declare-fun m!309251 () Bool)

(assert (=> b!199474 m!309251))

(declare-fun m!309253 () Bool)

(assert (=> b!199473 m!309253))

(assert (=> b!199473 m!309253))

(declare-fun m!309255 () Bool)

(assert (=> b!199473 m!309255))

(assert (=> d!67617 d!68095))

(declare-fun d!68097 () Bool)

(assert (=> d!68097 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4458 (buf!4950 thiss!1204))) ((_ sign_extend 32) (currentByte!9297 thiss!1204)) ((_ sign_extend 32) (currentBit!9292 thiss!1204))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 thiss!1204))) ((_ sign_extend 32) (currentByte!9297 thiss!1204)) ((_ sign_extend 32) (currentBit!9292 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!16802 () Bool)

(assert (= bs!16802 d!68097))

(assert (=> bs!16802 m!307891))

(assert (=> d!67617 d!68097))

(declare-fun d!68099 () Bool)

(declare-fun res!166981 () Bool)

(declare-fun e!136889 () Bool)

(assert (=> d!68099 (=> res!166981 e!136889)))

(assert (=> d!68099 (= res!166981 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686)))))))

(assert (=> d!68099 (= (arrayBitRangesEq!0 (buf!4950 (_2!9210 lt!309686)) (buf!4950 (_2!9210 lt!309690)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686)))) e!136889)))

(declare-fun b!199475 () Bool)

(declare-fun e!136891 () Bool)

(declare-fun e!136890 () Bool)

(assert (=> b!199475 (= e!136891 e!136890)))

(declare-fun res!166980 () Bool)

(declare-fun call!3156 () Bool)

(assert (=> b!199475 (= res!166980 call!3156)))

(assert (=> b!199475 (=> (not res!166980) (not e!136890))))

(declare-fun b!199476 () Bool)

(declare-fun e!136888 () Bool)

(assert (=> b!199476 (= e!136888 e!136891)))

(declare-fun c!9950 () Bool)

(declare-fun lt!311409 () tuple4!266)

(assert (=> b!199476 (= c!9950 (= (_3!649 lt!311409) (_4!133 lt!311409)))))

(declare-fun b!199477 () Bool)

(declare-fun e!136887 () Bool)

(assert (=> b!199477 (= e!136887 (arrayRangesEq!695 (buf!4950 (_2!9210 lt!309686)) (buf!4950 (_2!9210 lt!309690)) (_1!9221 lt!311409) (_2!9221 lt!311409)))))

(declare-fun b!199478 () Bool)

(declare-fun lt!311411 () (_ BitVec 32))

(declare-fun e!136886 () Bool)

(assert (=> b!199478 (= e!136886 (byteRangesEq!0 (select (arr!5388 (buf!4950 (_2!9210 lt!309686))) (_4!133 lt!311409)) (select (arr!5388 (buf!4950 (_2!9210 lt!309690))) (_4!133 lt!311409)) #b00000000000000000000000000000000 lt!311411))))

(declare-fun bm!3153 () Bool)

(declare-fun lt!311410 () (_ BitVec 32))

(assert (=> bm!3153 (= call!3156 (byteRangesEq!0 (select (arr!5388 (buf!4950 (_2!9210 lt!309686))) (_3!649 lt!311409)) (select (arr!5388 (buf!4950 (_2!9210 lt!309690))) (_3!649 lt!311409)) lt!311410 (ite c!9950 lt!311411 #b00000000000000000000000000001000)))))

(declare-fun b!199479 () Bool)

(assert (=> b!199479 (= e!136889 e!136888)))

(declare-fun res!166983 () Bool)

(assert (=> b!199479 (=> (not res!166983) (not e!136888))))

(assert (=> b!199479 (= res!166983 e!136887)))

(declare-fun res!166979 () Bool)

(assert (=> b!199479 (=> res!166979 e!136887)))

(assert (=> b!199479 (= res!166979 (bvsge (_1!9221 lt!311409) (_2!9221 lt!311409)))))

(assert (=> b!199479 (= lt!311411 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199479 (= lt!311410 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199479 (= lt!311409 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686)))))))

(declare-fun b!199480 () Bool)

(declare-fun res!166982 () Bool)

(assert (=> b!199480 (= res!166982 (= lt!311411 #b00000000000000000000000000000000))))

(assert (=> b!199480 (=> res!166982 e!136886)))

(assert (=> b!199480 (= e!136890 e!136886)))

(declare-fun b!199481 () Bool)

(assert (=> b!199481 (= e!136891 call!3156)))

(assert (= (and d!68099 (not res!166981)) b!199479))

(assert (= (and b!199479 (not res!166979)) b!199477))

(assert (= (and b!199479 res!166983) b!199476))

(assert (= (and b!199476 c!9950) b!199481))

(assert (= (and b!199476 (not c!9950)) b!199475))

(assert (= (and b!199475 res!166980) b!199480))

(assert (= (and b!199480 (not res!166982)) b!199478))

(assert (= (or b!199481 b!199475) bm!3153))

(declare-fun m!309257 () Bool)

(assert (=> b!199477 m!309257))

(declare-fun m!309259 () Bool)

(assert (=> b!199478 m!309259))

(declare-fun m!309261 () Bool)

(assert (=> b!199478 m!309261))

(assert (=> b!199478 m!309259))

(assert (=> b!199478 m!309261))

(declare-fun m!309263 () Bool)

(assert (=> b!199478 m!309263))

(declare-fun m!309265 () Bool)

(assert (=> bm!3153 m!309265))

(declare-fun m!309267 () Bool)

(assert (=> bm!3153 m!309267))

(assert (=> bm!3153 m!309265))

(assert (=> bm!3153 m!309267))

(declare-fun m!309269 () Bool)

(assert (=> bm!3153 m!309269))

(assert (=> b!199479 m!307719))

(declare-fun m!309271 () Bool)

(assert (=> b!199479 m!309271))

(assert (=> b!198807 d!68099))

(assert (=> b!198807 d!67611))

(declare-fun d!68101 () Bool)

(declare-fun res!166986 () Bool)

(declare-fun e!136895 () Bool)

(assert (=> d!68101 (=> res!166986 e!136895)))

(assert (=> d!68101 (= res!166986 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4458 (buf!4950 thiss!1204)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204))))))

(assert (=> d!68101 (= (arrayBitRangesEq!0 (buf!4950 thiss!1204) (buf!4950 (_2!9210 lt!309686)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4458 (buf!4950 thiss!1204)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204))) e!136895)))

(declare-fun b!199482 () Bool)

(declare-fun e!136897 () Bool)

(declare-fun e!136896 () Bool)

(assert (=> b!199482 (= e!136897 e!136896)))

(declare-fun res!166985 () Bool)

(declare-fun call!3157 () Bool)

(assert (=> b!199482 (= res!166985 call!3157)))

(assert (=> b!199482 (=> (not res!166985) (not e!136896))))

(declare-fun b!199483 () Bool)

(declare-fun e!136894 () Bool)

(assert (=> b!199483 (= e!136894 e!136897)))

(declare-fun c!9951 () Bool)

(declare-fun lt!311412 () tuple4!266)

(assert (=> b!199483 (= c!9951 (= (_3!649 lt!311412) (_4!133 lt!311412)))))

(declare-fun e!136893 () Bool)

(declare-fun b!199484 () Bool)

(assert (=> b!199484 (= e!136893 (arrayRangesEq!695 (buf!4950 thiss!1204) (buf!4950 (_2!9210 lt!309686)) (_1!9221 lt!311412) (_2!9221 lt!311412)))))

(declare-fun b!199485 () Bool)

(declare-fun lt!311414 () (_ BitVec 32))

(declare-fun e!136892 () Bool)

(assert (=> b!199485 (= e!136892 (byteRangesEq!0 (select (arr!5388 (buf!4950 thiss!1204)) (_4!133 lt!311412)) (select (arr!5388 (buf!4950 (_2!9210 lt!309686))) (_4!133 lt!311412)) #b00000000000000000000000000000000 lt!311414))))

(declare-fun lt!311413 () (_ BitVec 32))

(declare-fun bm!3154 () Bool)

(assert (=> bm!3154 (= call!3157 (byteRangesEq!0 (select (arr!5388 (buf!4950 thiss!1204)) (_3!649 lt!311412)) (select (arr!5388 (buf!4950 (_2!9210 lt!309686))) (_3!649 lt!311412)) lt!311413 (ite c!9951 lt!311414 #b00000000000000000000000000001000)))))

(declare-fun b!199486 () Bool)

(assert (=> b!199486 (= e!136895 e!136894)))

(declare-fun res!166988 () Bool)

(assert (=> b!199486 (=> (not res!166988) (not e!136894))))

(assert (=> b!199486 (= res!166988 e!136893)))

(declare-fun res!166984 () Bool)

(assert (=> b!199486 (=> res!166984 e!136893)))

(assert (=> b!199486 (= res!166984 (bvsge (_1!9221 lt!311412) (_2!9221 lt!311412)))))

(assert (=> b!199486 (= lt!311414 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4458 (buf!4950 thiss!1204)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199486 (= lt!311413 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199486 (= lt!311412 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4458 (buf!4950 thiss!1204)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204))))))

(declare-fun b!199487 () Bool)

(declare-fun res!166987 () Bool)

(assert (=> b!199487 (= res!166987 (= lt!311414 #b00000000000000000000000000000000))))

(assert (=> b!199487 (=> res!166987 e!136892)))

(assert (=> b!199487 (= e!136896 e!136892)))

(declare-fun b!199488 () Bool)

(assert (=> b!199488 (= e!136897 call!3157)))

(assert (= (and d!68101 (not res!166986)) b!199486))

(assert (= (and b!199486 (not res!166984)) b!199484))

(assert (= (and b!199486 res!166988) b!199483))

(assert (= (and b!199483 c!9951) b!199488))

(assert (= (and b!199483 (not c!9951)) b!199482))

(assert (= (and b!199482 res!166985) b!199487))

(assert (= (and b!199487 (not res!166987)) b!199485))

(assert (= (or b!199488 b!199482) bm!3154))

(declare-fun m!309273 () Bool)

(assert (=> b!199484 m!309273))

(declare-fun m!309275 () Bool)

(assert (=> b!199485 m!309275))

(declare-fun m!309277 () Bool)

(assert (=> b!199485 m!309277))

(assert (=> b!199485 m!309275))

(assert (=> b!199485 m!309277))

(declare-fun m!309279 () Bool)

(assert (=> b!199485 m!309279))

(declare-fun m!309281 () Bool)

(assert (=> bm!3154 m!309281))

(declare-fun m!309283 () Bool)

(assert (=> bm!3154 m!309283))

(assert (=> bm!3154 m!309281))

(assert (=> bm!3154 m!309283))

(declare-fun m!309285 () Bool)

(assert (=> bm!3154 m!309285))

(assert (=> b!199486 m!307721))

(assert (=> b!199486 m!309119))

(assert (=> b!198867 d!68101))

(assert (=> b!198867 d!67615))

(declare-fun d!68103 () Bool)

(assert (=> d!68103 (= (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!309695)))) ((_ sign_extend 32) (currentByte!9297 (_1!9211 lt!309695))) ((_ sign_extend 32) (currentBit!9292 (_1!9211 lt!309695)))) (bvsub (bvmul ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!309695)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 (_1!9211 lt!309695))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 (_1!9211 lt!309695))))))))

(assert (=> d!67651 d!68103))

(declare-fun d!68105 () Bool)

(assert (=> d!68105 (= (invariant!0 (currentBit!9292 (_1!9211 lt!309695)) (currentByte!9297 (_1!9211 lt!309695)) (size!4458 (buf!4950 (_1!9211 lt!309695)))) (and (bvsge (currentBit!9292 (_1!9211 lt!309695)) #b00000000000000000000000000000000) (bvslt (currentBit!9292 (_1!9211 lt!309695)) #b00000000000000000000000000001000) (bvsge (currentByte!9297 (_1!9211 lt!309695)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9297 (_1!9211 lt!309695)) (size!4458 (buf!4950 (_1!9211 lt!309695)))) (and (= (currentBit!9292 (_1!9211 lt!309695)) #b00000000000000000000000000000000) (= (currentByte!9297 (_1!9211 lt!309695)) (size!4458 (buf!4950 (_1!9211 lt!309695))))))))))

(assert (=> d!67651 d!68105))

(declare-fun d!68107 () Bool)

(assert (=> d!68107 (= (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!309690)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309686))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309686)))) (bvsub (bvmul ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!309690)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309686))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309686))))))))

(assert (=> d!67663 d!68107))

(assert (=> d!67737 d!67741))

(declare-fun d!68109 () Bool)

(declare-fun lt!311420 () tuple2!17130)

(declare-fun lt!311419 () tuple2!17130)

(assert (=> d!68109 (and (= (_2!9213 lt!311420) (_2!9213 lt!311419)) (= (_1!9213 lt!311420) (_1!9213 lt!311419)))))

(declare-fun e!136900 () (_ BitVec 64))

(assert (=> d!68109 (= lt!311419 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9212 lt!309684) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd i!590 #b00000000000000000000000000000001) (bvor lt!309674 e!136900)))))

(declare-fun c!9954 () Bool)

(assert (=> d!68109 (= c!9954 (_2!9211 (readBitPure!0 (_1!9212 lt!309684))))))

(assert (=> d!68109 (= lt!311420 (readNBitsLSBFirstsLoopPure!0 (_1!9212 lt!309684) nBits!348 i!590 lt!309674))))

(assert (=> d!68109 true))

(declare-fun _$10!31 () Unit!14062)

(assert (=> d!68109 (= (choose!56 (_1!9212 lt!309684) nBits!348 i!590 lt!309674 lt!310789 (tuple2!17131 (_1!9213 lt!310789) (_2!9213 lt!310789)) (_1!9213 lt!310789) (_2!9213 lt!310789) lt!310788 lt!310793 lt!310791 lt!310792 (tuple2!17131 (_1!9213 lt!310792) (_2!9213 lt!310792)) (_1!9213 lt!310792) (_2!9213 lt!310792)) _$10!31)))

(declare-fun b!199493 () Bool)

(assert (=> b!199493 (= e!136900 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!199494 () Bool)

(assert (=> b!199494 (= e!136900 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and d!68109 c!9954) b!199493))

(assert (= (and d!68109 (not c!9954)) b!199494))

(assert (=> d!68109 m!307701))

(assert (=> d!68109 m!307701))

(declare-fun m!309287 () Bool)

(assert (=> d!68109 m!309287))

(assert (=> d!68109 m!307675))

(assert (=> d!68109 m!307685))

(assert (=> d!67737 d!68109))

(declare-fun d!68111 () Bool)

(declare-fun lt!311421 () tuple2!17142)

(assert (=> d!68111 (= lt!311421 (readNBitsLSBFirstsLoop!0 lt!310793 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!310791))))

(assert (=> d!68111 (= (readNBitsLSBFirstsLoopPure!0 lt!310793 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!310791) (tuple2!17131 (_2!9219 lt!311421) (_1!9219 lt!311421)))))

(declare-fun bs!16804 () Bool)

(assert (= bs!16804 d!68111))

(declare-fun m!309289 () Bool)

(assert (=> bs!16804 m!309289))

(assert (=> d!67737 d!68111))

(assert (=> d!67737 d!67669))

(assert (=> d!67737 d!67671))

(declare-fun d!68113 () Bool)

(assert (=> d!68113 (validate_offset_bits!1 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310750)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309686))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309686))) lt!310729)))

(declare-fun lt!311422 () Unit!14062)

(assert (=> d!68113 (= lt!311422 (choose!9 (_2!9210 lt!309686) (buf!4950 (_2!9210 lt!310750)) lt!310729 (BitStream!8025 (buf!4950 (_2!9210 lt!310750)) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686)))))))

(assert (=> d!68113 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9210 lt!309686) (buf!4950 (_2!9210 lt!310750)) lt!310729) lt!311422)))

(declare-fun bs!16805 () Bool)

(assert (= bs!16805 d!68113))

(assert (=> bs!16805 m!308433))

(declare-fun m!309291 () Bool)

(assert (=> bs!16805 m!309291))

(assert (=> b!199069 d!68113))

(declare-fun lt!311423 () tuple2!17142)

(declare-fun d!68115 () Bool)

(assert (=> d!68115 (= lt!311423 (readNBitsLSBFirstsLoop!0 (_1!9212 lt!310772) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!310724 (ite (_2!9211 lt!310769) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!68115 (= (readNBitsLSBFirstsLoopPure!0 (_1!9212 lt!310772) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!310724 (ite (_2!9211 lt!310769) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!17131 (_2!9219 lt!311423) (_1!9219 lt!311423)))))

(declare-fun bs!16806 () Bool)

(assert (= bs!16806 d!68115))

(declare-fun m!309293 () Bool)

(assert (=> bs!16806 m!309293))

(assert (=> b!199069 d!68115))

(declare-fun d!68117 () Bool)

(declare-fun res!166991 () Bool)

(declare-fun e!136901 () Bool)

(assert (=> d!68117 (=> (not res!166991) (not e!136901))))

(assert (=> d!68117 (= res!166991 (= (size!4458 (buf!4950 (_2!9210 lt!309686))) (size!4458 (buf!4950 (_2!9210 lt!310750)))))))

(assert (=> d!68117 (= (isPrefixOf!0 (_2!9210 lt!309686) (_2!9210 lt!310750)) e!136901)))

(declare-fun b!199495 () Bool)

(declare-fun res!166989 () Bool)

(assert (=> b!199495 (=> (not res!166989) (not e!136901))))

(assert (=> b!199495 (= res!166989 (bvsle (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310750))) (currentByte!9297 (_2!9210 lt!310750)) (currentBit!9292 (_2!9210 lt!310750)))))))

(declare-fun b!199496 () Bool)

(declare-fun e!136902 () Bool)

(assert (=> b!199496 (= e!136901 e!136902)))

(declare-fun res!166990 () Bool)

(assert (=> b!199496 (=> res!166990 e!136902)))

(assert (=> b!199496 (= res!166990 (= (size!4458 (buf!4950 (_2!9210 lt!309686))) #b00000000000000000000000000000000))))

(declare-fun b!199497 () Bool)

(assert (=> b!199497 (= e!136902 (arrayBitRangesEq!0 (buf!4950 (_2!9210 lt!309686)) (buf!4950 (_2!9210 lt!310750)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686)))))))

(assert (= (and d!68117 res!166991) b!199495))

(assert (= (and b!199495 res!166989) b!199496))

(assert (= (and b!199496 (not res!166990)) b!199497))

(assert (=> b!199495 m!307719))

(assert (=> b!199495 m!308413))

(assert (=> b!199497 m!307719))

(assert (=> b!199497 m!307719))

(declare-fun m!309295 () Bool)

(assert (=> b!199497 m!309295))

(assert (=> b!199069 d!68117))

(declare-fun lt!311442 () tuple2!17128)

(declare-fun b!199498 () Bool)

(declare-fun lt!311425 () (_ BitVec 64))

(declare-fun lt!311438 () (_ BitVec 64))

(declare-fun e!136904 () Bool)

(assert (=> b!199498 (= e!136904 (= (_1!9212 lt!311442) (withMovedBitIndex!0 (_2!9212 lt!311442) (bvsub lt!311425 lt!311438))))))

(assert (=> b!199498 (or (= (bvand lt!311425 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311438 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311425 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311425 lt!311438) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199498 (= lt!311438 (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310750))) (currentByte!9297 (_2!9210 lt!310750)) (currentBit!9292 (_2!9210 lt!310750))))))

(assert (=> b!199498 (= lt!311425 (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310742))) (currentByte!9297 (_2!9210 lt!310742)) (currentBit!9292 (_2!9210 lt!310742))))))

(declare-fun b!199499 () Bool)

(declare-fun e!136903 () Unit!14062)

(declare-fun Unit!14154 () Unit!14062)

(assert (=> b!199499 (= e!136903 Unit!14154)))

(declare-fun b!199500 () Bool)

(declare-fun lt!311439 () Unit!14062)

(assert (=> b!199500 (= e!136903 lt!311439)))

(declare-fun lt!311443 () (_ BitVec 64))

(assert (=> b!199500 (= lt!311443 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!311427 () (_ BitVec 64))

(assert (=> b!199500 (= lt!311427 (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310742))) (currentByte!9297 (_2!9210 lt!310742)) (currentBit!9292 (_2!9210 lt!310742))))))

(assert (=> b!199500 (= lt!311439 (arrayBitRangesEqSymmetric!0 (buf!4950 (_2!9210 lt!310742)) (buf!4950 (_2!9210 lt!310750)) lt!311443 lt!311427))))

(assert (=> b!199500 (arrayBitRangesEq!0 (buf!4950 (_2!9210 lt!310750)) (buf!4950 (_2!9210 lt!310742)) lt!311443 lt!311427)))

(declare-fun b!199501 () Bool)

(declare-fun res!166992 () Bool)

(assert (=> b!199501 (=> (not res!166992) (not e!136904))))

(assert (=> b!199501 (= res!166992 (isPrefixOf!0 (_1!9212 lt!311442) (_2!9210 lt!310742)))))

(declare-fun b!199502 () Bool)

(declare-fun res!166994 () Bool)

(assert (=> b!199502 (=> (not res!166994) (not e!136904))))

(assert (=> b!199502 (= res!166994 (isPrefixOf!0 (_2!9212 lt!311442) (_2!9210 lt!310750)))))

(declare-fun d!68119 () Bool)

(assert (=> d!68119 e!136904))

(declare-fun res!166993 () Bool)

(assert (=> d!68119 (=> (not res!166993) (not e!136904))))

(assert (=> d!68119 (= res!166993 (isPrefixOf!0 (_1!9212 lt!311442) (_2!9212 lt!311442)))))

(declare-fun lt!311431 () BitStream!8024)

(assert (=> d!68119 (= lt!311442 (tuple2!17129 lt!311431 (_2!9210 lt!310750)))))

(declare-fun lt!311430 () Unit!14062)

(declare-fun lt!311432 () Unit!14062)

(assert (=> d!68119 (= lt!311430 lt!311432)))

(assert (=> d!68119 (isPrefixOf!0 lt!311431 (_2!9210 lt!310750))))

(assert (=> d!68119 (= lt!311432 (lemmaIsPrefixTransitive!0 lt!311431 (_2!9210 lt!310750) (_2!9210 lt!310750)))))

(declare-fun lt!311436 () Unit!14062)

(declare-fun lt!311440 () Unit!14062)

(assert (=> d!68119 (= lt!311436 lt!311440)))

(assert (=> d!68119 (isPrefixOf!0 lt!311431 (_2!9210 lt!310750))))

(assert (=> d!68119 (= lt!311440 (lemmaIsPrefixTransitive!0 lt!311431 (_2!9210 lt!310742) (_2!9210 lt!310750)))))

(declare-fun lt!311437 () Unit!14062)

(assert (=> d!68119 (= lt!311437 e!136903)))

(declare-fun c!9955 () Bool)

(assert (=> d!68119 (= c!9955 (not (= (size!4458 (buf!4950 (_2!9210 lt!310742))) #b00000000000000000000000000000000)))))

(declare-fun lt!311441 () Unit!14062)

(declare-fun lt!311424 () Unit!14062)

(assert (=> d!68119 (= lt!311441 lt!311424)))

(assert (=> d!68119 (isPrefixOf!0 (_2!9210 lt!310750) (_2!9210 lt!310750))))

(assert (=> d!68119 (= lt!311424 (lemmaIsPrefixRefl!0 (_2!9210 lt!310750)))))

(declare-fun lt!311428 () Unit!14062)

(declare-fun lt!311426 () Unit!14062)

(assert (=> d!68119 (= lt!311428 lt!311426)))

(assert (=> d!68119 (= lt!311426 (lemmaIsPrefixRefl!0 (_2!9210 lt!310750)))))

(declare-fun lt!311429 () Unit!14062)

(declare-fun lt!311433 () Unit!14062)

(assert (=> d!68119 (= lt!311429 lt!311433)))

(assert (=> d!68119 (isPrefixOf!0 lt!311431 lt!311431)))

(assert (=> d!68119 (= lt!311433 (lemmaIsPrefixRefl!0 lt!311431))))

(declare-fun lt!311434 () Unit!14062)

(declare-fun lt!311435 () Unit!14062)

(assert (=> d!68119 (= lt!311434 lt!311435)))

(assert (=> d!68119 (isPrefixOf!0 (_2!9210 lt!310742) (_2!9210 lt!310742))))

(assert (=> d!68119 (= lt!311435 (lemmaIsPrefixRefl!0 (_2!9210 lt!310742)))))

(assert (=> d!68119 (= lt!311431 (BitStream!8025 (buf!4950 (_2!9210 lt!310750)) (currentByte!9297 (_2!9210 lt!310742)) (currentBit!9292 (_2!9210 lt!310742))))))

(assert (=> d!68119 (isPrefixOf!0 (_2!9210 lt!310742) (_2!9210 lt!310750))))

(assert (=> d!68119 (= (reader!0 (_2!9210 lt!310742) (_2!9210 lt!310750)) lt!311442)))

(assert (= (and d!68119 c!9955) b!199500))

(assert (= (and d!68119 (not c!9955)) b!199499))

(assert (= (and d!68119 res!166993) b!199501))

(assert (= (and b!199501 res!166992) b!199502))

(assert (= (and b!199502 res!166994) b!199498))

(declare-fun m!309297 () Bool)

(assert (=> b!199501 m!309297))

(declare-fun m!309299 () Bool)

(assert (=> b!199502 m!309299))

(assert (=> b!199500 m!308383))

(declare-fun m!309301 () Bool)

(assert (=> b!199500 m!309301))

(declare-fun m!309303 () Bool)

(assert (=> b!199500 m!309303))

(declare-fun m!309305 () Bool)

(assert (=> d!68119 m!309305))

(declare-fun m!309307 () Bool)

(assert (=> d!68119 m!309307))

(declare-fun m!309309 () Bool)

(assert (=> d!68119 m!309309))

(declare-fun m!309311 () Bool)

(assert (=> d!68119 m!309311))

(declare-fun m!309313 () Bool)

(assert (=> d!68119 m!309313))

(declare-fun m!309315 () Bool)

(assert (=> d!68119 m!309315))

(declare-fun m!309317 () Bool)

(assert (=> d!68119 m!309317))

(declare-fun m!309319 () Bool)

(assert (=> d!68119 m!309319))

(declare-fun m!309321 () Bool)

(assert (=> d!68119 m!309321))

(declare-fun m!309323 () Bool)

(assert (=> d!68119 m!309323))

(declare-fun m!309325 () Bool)

(assert (=> d!68119 m!309325))

(declare-fun m!309327 () Bool)

(assert (=> b!199498 m!309327))

(assert (=> b!199498 m!308413))

(assert (=> b!199498 m!308383))

(assert (=> b!199069 d!68119))

(declare-fun d!68121 () Bool)

(declare-fun e!136905 () Bool)

(assert (=> d!68121 e!136905))

(declare-fun res!166995 () Bool)

(assert (=> d!68121 (=> (not res!166995) (not e!136905))))

(declare-fun lt!311445 () (_ BitVec 64))

(declare-fun lt!311444 () BitStream!8024)

(assert (=> d!68121 (= res!166995 (= (bvadd lt!311445 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4458 (buf!4950 lt!311444)) (currentByte!9297 lt!311444) (currentBit!9292 lt!311444))))))

(assert (=> d!68121 (or (not (= (bvand lt!311445 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311445 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311445 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68121 (= lt!311445 (bitIndex!0 (size!4458 (buf!4950 (_1!9212 lt!310756))) (currentByte!9297 (_1!9212 lt!310756)) (currentBit!9292 (_1!9212 lt!310756))))))

(assert (=> d!68121 (= lt!311444 (_2!9210 (moveBitIndex!0 (_1!9212 lt!310756) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!68121 (moveBitIndexPrecond!0 (_1!9212 lt!310756) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!68121 (= (withMovedBitIndex!0 (_1!9212 lt!310756) #b0000000000000000000000000000000000000000000000000000000000000001) lt!311444)))

(declare-fun b!199503 () Bool)

(assert (=> b!199503 (= e!136905 (= (size!4458 (buf!4950 (_1!9212 lt!310756))) (size!4458 (buf!4950 lt!311444))))))

(assert (= (and d!68121 res!166995) b!199503))

(declare-fun m!309329 () Bool)

(assert (=> d!68121 m!309329))

(declare-fun m!309331 () Bool)

(assert (=> d!68121 m!309331))

(declare-fun m!309333 () Bool)

(assert (=> d!68121 m!309333))

(declare-fun m!309335 () Bool)

(assert (=> d!68121 m!309335))

(assert (=> b!199069 d!68121))

(declare-fun d!68123 () Bool)

(declare-fun lt!311446 () tuple2!17142)

(assert (=> d!68123 (= lt!311446 (readNBitsLSBFirstsLoop!0 (_1!9212 lt!310756) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!310724))))

(assert (=> d!68123 (= (readNBitsLSBFirstsLoopPure!0 (_1!9212 lt!310756) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!310724) (tuple2!17131 (_2!9219 lt!311446) (_1!9219 lt!311446)))))

(declare-fun bs!16807 () Bool)

(assert (= bs!16807 d!68123))

(declare-fun m!309337 () Bool)

(assert (=> bs!16807 m!309337))

(assert (=> b!199069 d!68123))

(declare-fun d!68125 () Bool)

(declare-fun e!136906 () Bool)

(assert (=> d!68125 e!136906))

(declare-fun res!166996 () Bool)

(assert (=> d!68125 (=> (not res!166996) (not e!136906))))

(declare-fun lt!311447 () tuple2!17126)

(declare-fun lt!311448 () tuple2!17126)

(assert (=> d!68125 (= res!166996 (= (bitIndex!0 (size!4458 (buf!4950 (_1!9211 lt!311447))) (currentByte!9297 (_1!9211 lt!311447)) (currentBit!9292 (_1!9211 lt!311447))) (bitIndex!0 (size!4458 (buf!4950 (_1!9211 lt!311448))) (currentByte!9297 (_1!9211 lt!311448)) (currentBit!9292 (_1!9211 lt!311448)))))))

(declare-fun lt!311449 () BitStream!8024)

(declare-fun lt!311450 () Unit!14062)

(assert (=> d!68125 (= lt!311450 (choose!50 lt!310763 (_2!9210 lt!310750) lt!311449 lt!311447 (tuple2!17127 (_1!9211 lt!311447) (_2!9211 lt!311447)) (_1!9211 lt!311447) (_2!9211 lt!311447) lt!311448 (tuple2!17127 (_1!9211 lt!311448) (_2!9211 lt!311448)) (_1!9211 lt!311448) (_2!9211 lt!311448)))))

(assert (=> d!68125 (= lt!311448 (readBitPure!0 lt!311449))))

(assert (=> d!68125 (= lt!311447 (readBitPure!0 lt!310763))))

(assert (=> d!68125 (= lt!311449 (BitStream!8025 (buf!4950 (_2!9210 lt!310750)) (currentByte!9297 lt!310763) (currentBit!9292 lt!310763)))))

(assert (=> d!68125 (invariant!0 (currentBit!9292 lt!310763) (currentByte!9297 lt!310763) (size!4458 (buf!4950 (_2!9210 lt!310750))))))

(assert (=> d!68125 (= (readBitPrefixLemma!0 lt!310763 (_2!9210 lt!310750)) lt!311450)))

(declare-fun b!199504 () Bool)

(assert (=> b!199504 (= e!136906 (= (_2!9211 lt!311447) (_2!9211 lt!311448)))))

(assert (= (and d!68125 res!166996) b!199504))

(declare-fun m!309339 () Bool)

(assert (=> d!68125 m!309339))

(declare-fun m!309341 () Bool)

(assert (=> d!68125 m!309341))

(declare-fun m!309343 () Bool)

(assert (=> d!68125 m!309343))

(assert (=> d!68125 m!308393))

(assert (=> d!68125 m!308371))

(declare-fun m!309345 () Bool)

(assert (=> d!68125 m!309345))

(assert (=> b!199069 d!68125))

(declare-fun d!68127 () Bool)

(declare-fun lt!311451 () tuple2!17142)

(assert (=> d!68127 (= lt!311451 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!9212 lt!310756) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!310724 e!136613)))))

(assert (=> d!68127 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9212 lt!310756) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!310724 e!136613)) (tuple2!17131 (_2!9219 lt!311451) (_1!9219 lt!311451)))))

(declare-fun bs!16808 () Bool)

(assert (= bs!16808 d!68127))

(assert (=> bs!16808 m!308401))

(declare-fun m!309347 () Bool)

(assert (=> bs!16808 m!309347))

(assert (=> b!199069 d!68127))

(assert (=> b!199069 d!67611))

(declare-fun d!68129 () Bool)

(assert (=> d!68129 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310750)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309686))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309686))) lt!310733) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310750)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309686))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309686)))) lt!310733))))

(declare-fun bs!16809 () Bool)

(assert (= bs!16809 d!68129))

(declare-fun m!309349 () Bool)

(assert (=> bs!16809 m!309349))

(assert (=> b!199069 d!68129))

(declare-fun d!68131 () Bool)

(assert (=> d!68131 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310750)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!310742))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!310742))) lt!310728) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310750)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!310742))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!310742)))) lt!310728))))

(declare-fun bs!16810 () Bool)

(assert (= bs!16810 d!68131))

(declare-fun m!309351 () Bool)

(assert (=> bs!16810 m!309351))

(assert (=> b!199069 d!68131))

(declare-fun d!68133 () Bool)

(assert (=> d!68133 (validate_offset_bits!1 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310750)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309686))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309686))) lt!310733)))

(declare-fun lt!311452 () Unit!14062)

(assert (=> d!68133 (= lt!311452 (choose!9 (_2!9210 lt!309686) (buf!4950 (_2!9210 lt!310750)) lt!310733 (BitStream!8025 (buf!4950 (_2!9210 lt!310750)) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686)))))))

(assert (=> d!68133 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9210 lt!309686) (buf!4950 (_2!9210 lt!310750)) lt!310733) lt!311452)))

(declare-fun bs!16811 () Bool)

(assert (= bs!16811 d!68133))

(assert (=> bs!16811 m!308425))

(declare-fun m!309353 () Bool)

(assert (=> bs!16811 m!309353))

(assert (=> b!199069 d!68133))

(declare-fun lt!311454 () (_ BitVec 64))

(declare-fun b!199505 () Bool)

(declare-fun lt!311467 () (_ BitVec 64))

(declare-fun lt!311471 () tuple2!17128)

(declare-fun e!136908 () Bool)

(assert (=> b!199505 (= e!136908 (= (_1!9212 lt!311471) (withMovedBitIndex!0 (_2!9212 lt!311471) (bvsub lt!311454 lt!311467))))))

(assert (=> b!199505 (or (= (bvand lt!311454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311467 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311454 lt!311467) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199505 (= lt!311467 (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310750))) (currentByte!9297 (_2!9210 lt!310750)) (currentBit!9292 (_2!9210 lt!310750))))))

(assert (=> b!199505 (= lt!311454 (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))))))

(declare-fun b!199506 () Bool)

(declare-fun e!136907 () Unit!14062)

(declare-fun Unit!14155 () Unit!14062)

(assert (=> b!199506 (= e!136907 Unit!14155)))

(declare-fun b!199507 () Bool)

(declare-fun lt!311468 () Unit!14062)

(assert (=> b!199507 (= e!136907 lt!311468)))

(declare-fun lt!311472 () (_ BitVec 64))

(assert (=> b!199507 (= lt!311472 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!311456 () (_ BitVec 64))

(assert (=> b!199507 (= lt!311456 (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))))))

(assert (=> b!199507 (= lt!311468 (arrayBitRangesEqSymmetric!0 (buf!4950 (_2!9210 lt!309686)) (buf!4950 (_2!9210 lt!310750)) lt!311472 lt!311456))))

(assert (=> b!199507 (arrayBitRangesEq!0 (buf!4950 (_2!9210 lt!310750)) (buf!4950 (_2!9210 lt!309686)) lt!311472 lt!311456)))

(declare-fun b!199508 () Bool)

(declare-fun res!166997 () Bool)

(assert (=> b!199508 (=> (not res!166997) (not e!136908))))

(assert (=> b!199508 (= res!166997 (isPrefixOf!0 (_1!9212 lt!311471) (_2!9210 lt!309686)))))

(declare-fun b!199509 () Bool)

(declare-fun res!166999 () Bool)

(assert (=> b!199509 (=> (not res!166999) (not e!136908))))

(assert (=> b!199509 (= res!166999 (isPrefixOf!0 (_2!9212 lt!311471) (_2!9210 lt!310750)))))

(declare-fun d!68135 () Bool)

(assert (=> d!68135 e!136908))

(declare-fun res!166998 () Bool)

(assert (=> d!68135 (=> (not res!166998) (not e!136908))))

(assert (=> d!68135 (= res!166998 (isPrefixOf!0 (_1!9212 lt!311471) (_2!9212 lt!311471)))))

(declare-fun lt!311460 () BitStream!8024)

(assert (=> d!68135 (= lt!311471 (tuple2!17129 lt!311460 (_2!9210 lt!310750)))))

(declare-fun lt!311459 () Unit!14062)

(declare-fun lt!311461 () Unit!14062)

(assert (=> d!68135 (= lt!311459 lt!311461)))

(assert (=> d!68135 (isPrefixOf!0 lt!311460 (_2!9210 lt!310750))))

(assert (=> d!68135 (= lt!311461 (lemmaIsPrefixTransitive!0 lt!311460 (_2!9210 lt!310750) (_2!9210 lt!310750)))))

(declare-fun lt!311465 () Unit!14062)

(declare-fun lt!311469 () Unit!14062)

(assert (=> d!68135 (= lt!311465 lt!311469)))

(assert (=> d!68135 (isPrefixOf!0 lt!311460 (_2!9210 lt!310750))))

(assert (=> d!68135 (= lt!311469 (lemmaIsPrefixTransitive!0 lt!311460 (_2!9210 lt!309686) (_2!9210 lt!310750)))))

(declare-fun lt!311466 () Unit!14062)

(assert (=> d!68135 (= lt!311466 e!136907)))

(declare-fun c!9956 () Bool)

(assert (=> d!68135 (= c!9956 (not (= (size!4458 (buf!4950 (_2!9210 lt!309686))) #b00000000000000000000000000000000)))))

(declare-fun lt!311470 () Unit!14062)

(declare-fun lt!311453 () Unit!14062)

(assert (=> d!68135 (= lt!311470 lt!311453)))

(assert (=> d!68135 (isPrefixOf!0 (_2!9210 lt!310750) (_2!9210 lt!310750))))

(assert (=> d!68135 (= lt!311453 (lemmaIsPrefixRefl!0 (_2!9210 lt!310750)))))

(declare-fun lt!311457 () Unit!14062)

(declare-fun lt!311455 () Unit!14062)

(assert (=> d!68135 (= lt!311457 lt!311455)))

(assert (=> d!68135 (= lt!311455 (lemmaIsPrefixRefl!0 (_2!9210 lt!310750)))))

(declare-fun lt!311458 () Unit!14062)

(declare-fun lt!311462 () Unit!14062)

(assert (=> d!68135 (= lt!311458 lt!311462)))

(assert (=> d!68135 (isPrefixOf!0 lt!311460 lt!311460)))

(assert (=> d!68135 (= lt!311462 (lemmaIsPrefixRefl!0 lt!311460))))

(declare-fun lt!311463 () Unit!14062)

(declare-fun lt!311464 () Unit!14062)

(assert (=> d!68135 (= lt!311463 lt!311464)))

(assert (=> d!68135 (isPrefixOf!0 (_2!9210 lt!309686) (_2!9210 lt!309686))))

(assert (=> d!68135 (= lt!311464 (lemmaIsPrefixRefl!0 (_2!9210 lt!309686)))))

(assert (=> d!68135 (= lt!311460 (BitStream!8025 (buf!4950 (_2!9210 lt!310750)) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))))))

(assert (=> d!68135 (isPrefixOf!0 (_2!9210 lt!309686) (_2!9210 lt!310750))))

(assert (=> d!68135 (= (reader!0 (_2!9210 lt!309686) (_2!9210 lt!310750)) lt!311471)))

(assert (= (and d!68135 c!9956) b!199507))

(assert (= (and d!68135 (not c!9956)) b!199506))

(assert (= (and d!68135 res!166998) b!199508))

(assert (= (and b!199508 res!166997) b!199509))

(assert (= (and b!199509 res!166999) b!199505))

(declare-fun m!309355 () Bool)

(assert (=> b!199508 m!309355))

(declare-fun m!309357 () Bool)

(assert (=> b!199509 m!309357))

(assert (=> b!199507 m!307719))

(declare-fun m!309359 () Bool)

(assert (=> b!199507 m!309359))

(declare-fun m!309361 () Bool)

(assert (=> b!199507 m!309361))

(assert (=> d!68135 m!309305))

(assert (=> d!68135 m!309307))

(declare-fun m!309363 () Bool)

(assert (=> d!68135 m!309363))

(declare-fun m!309365 () Bool)

(assert (=> d!68135 m!309365))

(declare-fun m!309367 () Bool)

(assert (=> d!68135 m!309367))

(declare-fun m!309369 () Bool)

(assert (=> d!68135 m!309369))

(assert (=> d!68135 m!308093))

(assert (=> d!68135 m!308429))

(declare-fun m!309371 () Bool)

(assert (=> d!68135 m!309371))

(declare-fun m!309373 () Bool)

(assert (=> d!68135 m!309373))

(assert (=> d!68135 m!308099))

(declare-fun m!309375 () Bool)

(assert (=> b!199505 m!309375))

(assert (=> b!199505 m!308413))

(assert (=> b!199505 m!307719))

(assert (=> b!199069 d!68135))

(declare-fun b!199511 () Bool)

(declare-fun res!167003 () Bool)

(declare-fun e!136910 () Bool)

(assert (=> b!199511 (=> (not res!167003) (not e!136910))))

(declare-fun lt!311474 () tuple2!17124)

(assert (=> b!199511 (= res!167003 (isPrefixOf!0 (_2!9210 lt!309686) (_2!9210 lt!311474)))))

(declare-fun b!199513 () Bool)

(declare-fun e!136909 () Bool)

(declare-fun lt!311475 () tuple2!17126)

(assert (=> b!199513 (= e!136909 (= (bitIndex!0 (size!4458 (buf!4950 (_1!9211 lt!311475))) (currentByte!9297 (_1!9211 lt!311475)) (currentBit!9292 (_1!9211 lt!311475))) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!311474))) (currentByte!9297 (_2!9210 lt!311474)) (currentBit!9292 (_2!9210 lt!311474)))))))

(declare-fun b!199512 () Bool)

(assert (=> b!199512 (= e!136910 e!136909)))

(declare-fun res!167000 () Bool)

(assert (=> b!199512 (=> (not res!167000) (not e!136909))))

(assert (=> b!199512 (= res!167000 (and (= (_2!9211 lt!311475) lt!310760) (= (_1!9211 lt!311475) (_2!9210 lt!311474))))))

(assert (=> b!199512 (= lt!311475 (readBitPure!0 (readerFrom!0 (_2!9210 lt!311474) (currentBit!9292 (_2!9210 lt!309686)) (currentByte!9297 (_2!9210 lt!309686)))))))

(declare-fun b!199510 () Bool)

(declare-fun res!167001 () Bool)

(assert (=> b!199510 (=> (not res!167001) (not e!136910))))

(declare-fun lt!311473 () (_ BitVec 64))

(declare-fun lt!311476 () (_ BitVec 64))

(assert (=> b!199510 (= res!167001 (= (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!311474))) (currentByte!9297 (_2!9210 lt!311474)) (currentBit!9292 (_2!9210 lt!311474))) (bvadd lt!311473 lt!311476)))))

(assert (=> b!199510 (or (not (= (bvand lt!311473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311476 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311473 lt!311476) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199510 (= lt!311476 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!199510 (= lt!311473 (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))))))

(declare-fun d!68137 () Bool)

(assert (=> d!68137 e!136910))

(declare-fun res!167002 () Bool)

(assert (=> d!68137 (=> (not res!167002) (not e!136910))))

(assert (=> d!68137 (= res!167002 (= (size!4458 (buf!4950 (_2!9210 lt!309686))) (size!4458 (buf!4950 (_2!9210 lt!311474)))))))

(assert (=> d!68137 (= lt!311474 (choose!16 (_2!9210 lt!309686) lt!310760))))

(assert (=> d!68137 (validate_offset_bit!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!309686)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309686))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309686))))))

(assert (=> d!68137 (= (appendBit!0 (_2!9210 lt!309686) lt!310760) lt!311474)))

(assert (= (and d!68137 res!167002) b!199510))

(assert (= (and b!199510 res!167001) b!199511))

(assert (= (and b!199511 res!167003) b!199512))

(assert (= (and b!199512 res!167000) b!199513))

(declare-fun m!309377 () Bool)

(assert (=> b!199512 m!309377))

(assert (=> b!199512 m!309377))

(declare-fun m!309379 () Bool)

(assert (=> b!199512 m!309379))

(declare-fun m!309381 () Bool)

(assert (=> d!68137 m!309381))

(declare-fun m!309383 () Bool)

(assert (=> d!68137 m!309383))

(declare-fun m!309385 () Bool)

(assert (=> b!199511 m!309385))

(declare-fun m!309387 () Bool)

(assert (=> b!199513 m!309387))

(declare-fun m!309389 () Bool)

(assert (=> b!199513 m!309389))

(assert (=> b!199510 m!309389))

(assert (=> b!199510 m!307719))

(assert (=> b!199069 d!68137))

(declare-fun d!68139 () Bool)

(assert (=> d!68139 (= (invariant!0 (currentBit!9292 lt!310763) (currentByte!9297 lt!310763) (size!4458 (buf!4950 (_2!9210 lt!310750)))) (and (bvsge (currentBit!9292 lt!310763) #b00000000000000000000000000000000) (bvslt (currentBit!9292 lt!310763) #b00000000000000000000000000001000) (bvsge (currentByte!9297 lt!310763) #b00000000000000000000000000000000) (or (bvslt (currentByte!9297 lt!310763) (size!4458 (buf!4950 (_2!9210 lt!310750)))) (and (= (currentBit!9292 lt!310763) #b00000000000000000000000000000000) (= (currentByte!9297 lt!310763) (size!4458 (buf!4950 (_2!9210 lt!310750))))))))))

(assert (=> b!199069 d!68139))

(declare-fun d!68141 () Bool)

(declare-fun e!136911 () Bool)

(assert (=> d!68141 e!136911))

(declare-fun res!167005 () Bool)

(assert (=> d!68141 (=> (not res!167005) (not e!136911))))

(declare-fun lt!311481 () (_ BitVec 64))

(declare-fun lt!311482 () (_ BitVec 64))

(declare-fun lt!311478 () (_ BitVec 64))

(assert (=> d!68141 (= res!167005 (= lt!311482 (bvsub lt!311481 lt!311478)))))

(assert (=> d!68141 (or (= (bvand lt!311481 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311478 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311481 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311481 lt!311478) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68141 (= lt!311478 (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!310743)))) ((_ sign_extend 32) (currentByte!9297 (_1!9211 lt!310743))) ((_ sign_extend 32) (currentBit!9292 (_1!9211 lt!310743)))))))

(declare-fun lt!311477 () (_ BitVec 64))

(declare-fun lt!311480 () (_ BitVec 64))

(assert (=> d!68141 (= lt!311481 (bvmul lt!311477 lt!311480))))

(assert (=> d!68141 (or (= lt!311477 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311480 (bvsdiv (bvmul lt!311477 lt!311480) lt!311477)))))

(assert (=> d!68141 (= lt!311480 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68141 (= lt!311477 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!310743)))))))

(assert (=> d!68141 (= lt!311482 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 (_1!9211 lt!310743))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 (_1!9211 lt!310743)))))))

(assert (=> d!68141 (invariant!0 (currentBit!9292 (_1!9211 lt!310743)) (currentByte!9297 (_1!9211 lt!310743)) (size!4458 (buf!4950 (_1!9211 lt!310743))))))

(assert (=> d!68141 (= (bitIndex!0 (size!4458 (buf!4950 (_1!9211 lt!310743))) (currentByte!9297 (_1!9211 lt!310743)) (currentBit!9292 (_1!9211 lt!310743))) lt!311482)))

(declare-fun b!199514 () Bool)

(declare-fun res!167004 () Bool)

(assert (=> b!199514 (=> (not res!167004) (not e!136911))))

(assert (=> b!199514 (= res!167004 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311482))))

(declare-fun b!199515 () Bool)

(declare-fun lt!311479 () (_ BitVec 64))

(assert (=> b!199515 (= e!136911 (bvsle lt!311482 (bvmul lt!311479 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199515 (or (= lt!311479 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311479 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311479)))))

(assert (=> b!199515 (= lt!311479 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!310743)))))))

(assert (= (and d!68141 res!167005) b!199514))

(assert (= (and b!199514 res!167004) b!199515))

(declare-fun m!309391 () Bool)

(assert (=> d!68141 m!309391))

(declare-fun m!309393 () Bool)

(assert (=> d!68141 m!309393))

(assert (=> b!199069 d!68141))

(declare-fun d!68143 () Bool)

(declare-fun e!136912 () Bool)

(assert (=> d!68143 e!136912))

(declare-fun res!167006 () Bool)

(assert (=> d!68143 (=> (not res!167006) (not e!136912))))

(declare-fun lt!311484 () (_ BitVec 64))

(declare-fun lt!311483 () BitStream!8024)

(assert (=> d!68143 (= res!167006 (= (bvadd lt!311484 (bvsub (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310742))) (currentByte!9297 (_2!9210 lt!310742)) (currentBit!9292 (_2!9210 lt!310742))) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310750))) (currentByte!9297 (_2!9210 lt!310750)) (currentBit!9292 (_2!9210 lt!310750))))) (bitIndex!0 (size!4458 (buf!4950 lt!311483)) (currentByte!9297 lt!311483) (currentBit!9292 lt!311483))))))

(assert (=> d!68143 (or (not (= (bvand lt!311484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310742))) (currentByte!9297 (_2!9210 lt!310742)) (currentBit!9292 (_2!9210 lt!310742))) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310750))) (currentByte!9297 (_2!9210 lt!310750)) (currentBit!9292 (_2!9210 lt!310750)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311484 (bvsub (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310742))) (currentByte!9297 (_2!9210 lt!310742)) (currentBit!9292 (_2!9210 lt!310742))) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310750))) (currentByte!9297 (_2!9210 lt!310750)) (currentBit!9292 (_2!9210 lt!310750))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68143 (= lt!311484 (bitIndex!0 (size!4458 (buf!4950 (_2!9212 lt!310772))) (currentByte!9297 (_2!9212 lt!310772)) (currentBit!9292 (_2!9212 lt!310772))))))

(assert (=> d!68143 (= lt!311483 (_2!9210 (moveBitIndex!0 (_2!9212 lt!310772) (bvsub (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310742))) (currentByte!9297 (_2!9210 lt!310742)) (currentBit!9292 (_2!9210 lt!310742))) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310750))) (currentByte!9297 (_2!9210 lt!310750)) (currentBit!9292 (_2!9210 lt!310750)))))))))

(assert (=> d!68143 (moveBitIndexPrecond!0 (_2!9212 lt!310772) (bvsub (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310742))) (currentByte!9297 (_2!9210 lt!310742)) (currentBit!9292 (_2!9210 lt!310742))) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310750))) (currentByte!9297 (_2!9210 lt!310750)) (currentBit!9292 (_2!9210 lt!310750)))))))

(assert (=> d!68143 (= (withMovedBitIndex!0 (_2!9212 lt!310772) (bvsub (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310742))) (currentByte!9297 (_2!9210 lt!310742)) (currentBit!9292 (_2!9210 lt!310742))) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310750))) (currentByte!9297 (_2!9210 lt!310750)) (currentBit!9292 (_2!9210 lt!310750))))) lt!311483)))

(declare-fun b!199516 () Bool)

(assert (=> b!199516 (= e!136912 (= (size!4458 (buf!4950 (_2!9212 lt!310772))) (size!4458 (buf!4950 lt!311483))))))

(assert (= (and d!68143 res!167006) b!199516))

(declare-fun m!309395 () Bool)

(assert (=> d!68143 m!309395))

(declare-fun m!309397 () Bool)

(assert (=> d!68143 m!309397))

(declare-fun m!309399 () Bool)

(assert (=> d!68143 m!309399))

(declare-fun m!309401 () Bool)

(assert (=> d!68143 m!309401))

(assert (=> b!199069 d!68143))

(assert (=> b!199069 d!68081))

(declare-fun d!68145 () Bool)

(declare-fun lt!311485 () tuple2!17140)

(assert (=> d!68145 (= lt!311485 (readBit!0 lt!310738))))

(assert (=> d!68145 (= (readBitPure!0 lt!310738) (tuple2!17127 (_2!9218 lt!311485) (_1!9218 lt!311485)))))

(declare-fun bs!16812 () Bool)

(assert (= bs!16812 d!68145))

(declare-fun m!309403 () Bool)

(assert (=> bs!16812 m!309403))

(assert (=> b!199069 d!68145))

(declare-fun d!68147 () Bool)

(assert (=> d!68147 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310750)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309686))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309686))) lt!310729) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310750)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309686))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309686)))) lt!310729))))

(declare-fun bs!16813 () Bool)

(assert (= bs!16813 d!68147))

(assert (=> bs!16813 m!309349))

(assert (=> b!199069 d!68147))

(declare-fun d!68149 () Bool)

(declare-fun lt!311487 () tuple2!17130)

(declare-fun lt!311490 () tuple2!17130)

(assert (=> d!68149 (and (= (_2!9213 lt!311487) (_2!9213 lt!311490)) (= (_1!9213 lt!311487) (_1!9213 lt!311490)))))

(declare-fun lt!311486 () Bool)

(declare-fun lt!311489 () (_ BitVec 64))

(declare-fun lt!311488 () Unit!14062)

(declare-fun lt!311491 () BitStream!8024)

(assert (=> d!68149 (= lt!311488 (choose!56 (_1!9212 lt!310756) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!310724 lt!311487 (tuple2!17131 (_1!9213 lt!311487) (_2!9213 lt!311487)) (_1!9213 lt!311487) (_2!9213 lt!311487) lt!311486 lt!311491 lt!311489 lt!311490 (tuple2!17131 (_1!9213 lt!311490) (_2!9213 lt!311490)) (_1!9213 lt!311490) (_2!9213 lt!311490)))))

(assert (=> d!68149 (= lt!311490 (readNBitsLSBFirstsLoopPure!0 lt!311491 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!311489))))

(assert (=> d!68149 (= lt!311489 (bvor lt!310724 (ite lt!311486 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68149 (= lt!311491 (withMovedBitIndex!0 (_1!9212 lt!310756) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!68149 (= lt!311486 (_2!9211 (readBitPure!0 (_1!9212 lt!310756))))))

(assert (=> d!68149 (= lt!311487 (readNBitsLSBFirstsLoopPure!0 (_1!9212 lt!310756) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!310724))))

(assert (=> d!68149 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9212 lt!310756) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!310724) lt!311488)))

(declare-fun bs!16814 () Bool)

(assert (= bs!16814 d!68149))

(assert (=> bs!16814 m!308401))

(declare-fun m!309405 () Bool)

(assert (=> bs!16814 m!309405))

(declare-fun m!309407 () Bool)

(assert (=> bs!16814 m!309407))

(assert (=> bs!16814 m!308419))

(assert (=> bs!16814 m!308391))

(assert (=> b!199069 d!68149))

(declare-fun d!68151 () Bool)

(declare-fun e!136913 () Bool)

(assert (=> d!68151 e!136913))

(declare-fun res!167007 () Bool)

(assert (=> d!68151 (=> (not res!167007) (not e!136913))))

(declare-fun lt!311492 () BitStream!8024)

(declare-fun lt!311493 () (_ BitVec 64))

(assert (=> d!68151 (= res!167007 (= (bvadd lt!311493 (bvsub (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310750))) (currentByte!9297 (_2!9210 lt!310750)) (currentBit!9292 (_2!9210 lt!310750))))) (bitIndex!0 (size!4458 (buf!4950 lt!311492)) (currentByte!9297 lt!311492) (currentBit!9292 lt!311492))))))

(assert (=> d!68151 (or (not (= (bvand lt!311493 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310750))) (currentByte!9297 (_2!9210 lt!310750)) (currentBit!9292 (_2!9210 lt!310750)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311493 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311493 (bvsub (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310750))) (currentByte!9297 (_2!9210 lt!310750)) (currentBit!9292 (_2!9210 lt!310750))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68151 (= lt!311493 (bitIndex!0 (size!4458 (buf!4950 (_2!9212 lt!310756))) (currentByte!9297 (_2!9212 lt!310756)) (currentBit!9292 (_2!9212 lt!310756))))))

(assert (=> d!68151 (= lt!311492 (_2!9210 (moveBitIndex!0 (_2!9212 lt!310756) (bvsub (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310750))) (currentByte!9297 (_2!9210 lt!310750)) (currentBit!9292 (_2!9210 lt!310750)))))))))

(assert (=> d!68151 (moveBitIndexPrecond!0 (_2!9212 lt!310756) (bvsub (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310750))) (currentByte!9297 (_2!9210 lt!310750)) (currentBit!9292 (_2!9210 lt!310750)))))))

(assert (=> d!68151 (= (withMovedBitIndex!0 (_2!9212 lt!310756) (bvsub (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310750))) (currentByte!9297 (_2!9210 lt!310750)) (currentBit!9292 (_2!9210 lt!310750))))) lt!311492)))

(declare-fun b!199517 () Bool)

(assert (=> b!199517 (= e!136913 (= (size!4458 (buf!4950 (_2!9212 lt!310756))) (size!4458 (buf!4950 lt!311492))))))

(assert (= (and d!68151 res!167007) b!199517))

(declare-fun m!309409 () Bool)

(assert (=> d!68151 m!309409))

(declare-fun m!309411 () Bool)

(assert (=> d!68151 m!309411))

(declare-fun m!309413 () Bool)

(assert (=> d!68151 m!309413))

(declare-fun m!309415 () Bool)

(assert (=> d!68151 m!309415))

(assert (=> b!199069 d!68151))

(declare-fun d!68153 () Bool)

(declare-fun e!136914 () Bool)

(assert (=> d!68153 e!136914))

(declare-fun res!167009 () Bool)

(assert (=> d!68153 (=> (not res!167009) (not e!136914))))

(declare-fun lt!311495 () (_ BitVec 64))

(declare-fun lt!311499 () (_ BitVec 64))

(declare-fun lt!311498 () (_ BitVec 64))

(assert (=> d!68153 (= res!167009 (= lt!311499 (bvsub lt!311498 lt!311495)))))

(assert (=> d!68153 (or (= (bvand lt!311498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311495 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311498 lt!311495) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68153 (= lt!311495 (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310750)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!310750))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!310750)))))))

(declare-fun lt!311494 () (_ BitVec 64))

(declare-fun lt!311497 () (_ BitVec 64))

(assert (=> d!68153 (= lt!311498 (bvmul lt!311494 lt!311497))))

(assert (=> d!68153 (or (= lt!311494 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311497 (bvsdiv (bvmul lt!311494 lt!311497) lt!311494)))))

(assert (=> d!68153 (= lt!311497 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68153 (= lt!311494 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310750)))))))

(assert (=> d!68153 (= lt!311499 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!310750))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!310750)))))))

(assert (=> d!68153 (invariant!0 (currentBit!9292 (_2!9210 lt!310750)) (currentByte!9297 (_2!9210 lt!310750)) (size!4458 (buf!4950 (_2!9210 lt!310750))))))

(assert (=> d!68153 (= (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310750))) (currentByte!9297 (_2!9210 lt!310750)) (currentBit!9292 (_2!9210 lt!310750))) lt!311499)))

(declare-fun b!199518 () Bool)

(declare-fun res!167008 () Bool)

(assert (=> b!199518 (=> (not res!167008) (not e!136914))))

(assert (=> b!199518 (= res!167008 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311499))))

(declare-fun b!199519 () Bool)

(declare-fun lt!311496 () (_ BitVec 64))

(assert (=> b!199519 (= e!136914 (bvsle lt!311499 (bvmul lt!311496 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199519 (or (= lt!311496 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311496 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311496)))))

(assert (=> b!199519 (= lt!311496 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310750)))))))

(assert (= (and d!68153 res!167009) b!199518))

(assert (= (and b!199518 res!167008) b!199519))

(declare-fun m!309417 () Bool)

(assert (=> d!68153 m!309417))

(assert (=> d!68153 m!308431))

(assert (=> b!199069 d!68153))

(declare-fun d!68155 () Bool)

(assert (=> d!68155 (= (invariant!0 (currentBit!9292 (_2!9210 lt!309686)) (currentByte!9297 (_2!9210 lt!309686)) (size!4458 (buf!4950 (_2!9210 lt!310742)))) (and (bvsge (currentBit!9292 (_2!9210 lt!309686)) #b00000000000000000000000000000000) (bvslt (currentBit!9292 (_2!9210 lt!309686)) #b00000000000000000000000000001000) (bvsge (currentByte!9297 (_2!9210 lt!309686)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9297 (_2!9210 lt!309686)) (size!4458 (buf!4950 (_2!9210 lt!310742)))) (and (= (currentBit!9292 (_2!9210 lt!309686)) #b00000000000000000000000000000000) (= (currentByte!9297 (_2!9210 lt!309686)) (size!4458 (buf!4950 (_2!9210 lt!310742))))))))))

(assert (=> b!199069 d!68155))

(declare-fun d!68157 () Bool)

(assert (=> d!68157 (validate_offset_bits!1 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310750)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!310742))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!310742))) lt!310728)))

(declare-fun lt!311500 () Unit!14062)

(assert (=> d!68157 (= lt!311500 (choose!9 (_2!9210 lt!310742) (buf!4950 (_2!9210 lt!310750)) lt!310728 (BitStream!8025 (buf!4950 (_2!9210 lt!310750)) (currentByte!9297 (_2!9210 lt!310742)) (currentBit!9292 (_2!9210 lt!310742)))))))

(assert (=> d!68157 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9210 lt!310742) (buf!4950 (_2!9210 lt!310750)) lt!310728) lt!311500)))

(declare-fun bs!16815 () Bool)

(assert (= bs!16815 d!68157))

(assert (=> bs!16815 m!308397))

(declare-fun m!309419 () Bool)

(assert (=> bs!16815 m!309419))

(assert (=> b!199069 d!68157))

(declare-fun d!68159 () Bool)

(declare-fun e!136915 () Bool)

(assert (=> d!68159 e!136915))

(declare-fun res!167011 () Bool)

(assert (=> d!68159 (=> (not res!167011) (not e!136915))))

(declare-fun lt!311506 () (_ BitVec 64))

(declare-fun lt!311502 () (_ BitVec 64))

(declare-fun lt!311505 () (_ BitVec 64))

(assert (=> d!68159 (= res!167011 (= lt!311506 (bvsub lt!311505 lt!311502)))))

(assert (=> d!68159 (or (= (bvand lt!311505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311502 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311505 lt!311502) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68159 (= lt!311502 (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!310721)))) ((_ sign_extend 32) (currentByte!9297 (_1!9211 lt!310721))) ((_ sign_extend 32) (currentBit!9292 (_1!9211 lt!310721)))))))

(declare-fun lt!311501 () (_ BitVec 64))

(declare-fun lt!311504 () (_ BitVec 64))

(assert (=> d!68159 (= lt!311505 (bvmul lt!311501 lt!311504))))

(assert (=> d!68159 (or (= lt!311501 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311504 (bvsdiv (bvmul lt!311501 lt!311504) lt!311501)))))

(assert (=> d!68159 (= lt!311504 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68159 (= lt!311501 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!310721)))))))

(assert (=> d!68159 (= lt!311506 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 (_1!9211 lt!310721))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 (_1!9211 lt!310721)))))))

(assert (=> d!68159 (invariant!0 (currentBit!9292 (_1!9211 lt!310721)) (currentByte!9297 (_1!9211 lt!310721)) (size!4458 (buf!4950 (_1!9211 lt!310721))))))

(assert (=> d!68159 (= (bitIndex!0 (size!4458 (buf!4950 (_1!9211 lt!310721))) (currentByte!9297 (_1!9211 lt!310721)) (currentBit!9292 (_1!9211 lt!310721))) lt!311506)))

(declare-fun b!199520 () Bool)

(declare-fun res!167010 () Bool)

(assert (=> b!199520 (=> (not res!167010) (not e!136915))))

(assert (=> b!199520 (= res!167010 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311506))))

(declare-fun b!199521 () Bool)

(declare-fun lt!311503 () (_ BitVec 64))

(assert (=> b!199521 (= e!136915 (bvsle lt!311506 (bvmul lt!311503 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199521 (or (= lt!311503 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311503 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311503)))))

(assert (=> b!199521 (= lt!311503 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!310721)))))))

(assert (= (and d!68159 res!167011) b!199520))

(assert (= (and b!199520 res!167010) b!199521))

(declare-fun m!309421 () Bool)

(assert (=> d!68159 m!309421))

(declare-fun m!309423 () Bool)

(assert (=> d!68159 m!309423))

(assert (=> b!199069 d!68159))

(declare-fun d!68161 () Bool)

(declare-fun lt!311507 () tuple2!17142)

(assert (=> d!68161 (= lt!311507 (readNBitsLSBFirstsLoop!0 (_1!9212 lt!310740) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(assert (=> d!68161 (= (readNBitsLSBFirstsLoopPure!0 (_1!9212 lt!310740) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))) (tuple2!17131 (_2!9219 lt!311507) (_1!9219 lt!311507)))))

(declare-fun bs!16816 () Bool)

(assert (= bs!16816 d!68161))

(declare-fun m!309425 () Bool)

(assert (=> bs!16816 m!309425))

(assert (=> b!199069 d!68161))

(assert (=> b!199069 d!68087))

(declare-fun b!199522 () Bool)

(declare-fun e!136923 () (_ BitVec 64))

(assert (=> b!199522 (= e!136923 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun b!199523 () Bool)

(declare-fun e!136921 () Bool)

(declare-fun lt!311553 () (_ BitVec 64))

(assert (=> b!199523 (= e!136921 (validate_offset_bits!1 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310742)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!310742))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!310742))) lt!311553))))

(declare-fun b!199524 () Bool)

(declare-fun e!136918 () Bool)

(declare-fun lt!311537 () tuple2!17130)

(declare-fun lt!311550 () tuple2!17128)

(assert (=> b!199524 (= e!136918 (= (_1!9213 lt!311537) (_2!9212 lt!311550)))))

(declare-fun b!199525 () Bool)

(declare-fun res!167019 () Bool)

(declare-fun call!3158 () Bool)

(assert (=> b!199525 (= res!167019 call!3158)))

(declare-fun e!136916 () Bool)

(assert (=> b!199525 (=> (not res!167019) (not e!136916))))

(declare-fun b!199526 () Bool)

(declare-fun e!136919 () tuple2!17124)

(declare-fun lt!311538 () tuple2!17124)

(assert (=> b!199526 (= e!136919 (tuple2!17125 (_1!9210 lt!311538) (_2!9210 lt!311538)))))

(declare-fun lt!311548 () Bool)

(assert (=> b!199526 (= lt!311548 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!311542 () tuple2!17124)

(assert (=> b!199526 (= lt!311542 (appendBit!0 (_2!9210 lt!310742) lt!311548))))

(declare-fun res!167017 () Bool)

(assert (=> b!199526 (= res!167017 (= (size!4458 (buf!4950 (_2!9210 lt!310742))) (size!4458 (buf!4950 (_2!9210 lt!311542)))))))

(assert (=> b!199526 (=> (not res!167017) (not e!136916))))

(assert (=> b!199526 e!136916))

(declare-fun lt!311530 () tuple2!17124)

(assert (=> b!199526 (= lt!311530 lt!311542)))

(assert (=> b!199526 (= lt!311538 (appendBitsLSBFirstLoopTR!0 (_2!9210 lt!311530) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!311510 () Unit!14062)

(assert (=> b!199526 (= lt!311510 (lemmaIsPrefixTransitive!0 (_2!9210 lt!310742) (_2!9210 lt!311530) (_2!9210 lt!311538)))))

(assert (=> b!199526 (isPrefixOf!0 (_2!9210 lt!310742) (_2!9210 lt!311538))))

(declare-fun lt!311559 () Unit!14062)

(assert (=> b!199526 (= lt!311559 lt!311510)))

(assert (=> b!199526 (invariant!0 (currentBit!9292 (_2!9210 lt!310742)) (currentByte!9297 (_2!9210 lt!310742)) (size!4458 (buf!4950 (_2!9210 lt!311530))))))

(declare-fun lt!311551 () BitStream!8024)

(assert (=> b!199526 (= lt!311551 (BitStream!8025 (buf!4950 (_2!9210 lt!311530)) (currentByte!9297 (_2!9210 lt!310742)) (currentBit!9292 (_2!9210 lt!310742))))))

(assert (=> b!199526 (invariant!0 (currentBit!9292 lt!311551) (currentByte!9297 lt!311551) (size!4458 (buf!4950 (_2!9210 lt!311538))))))

(declare-fun lt!311526 () BitStream!8024)

(assert (=> b!199526 (= lt!311526 (BitStream!8025 (buf!4950 (_2!9210 lt!311538)) (currentByte!9297 lt!311551) (currentBit!9292 lt!311551)))))

(declare-fun lt!311509 () tuple2!17126)

(assert (=> b!199526 (= lt!311509 (readBitPure!0 lt!311551))))

(declare-fun lt!311531 () tuple2!17126)

(assert (=> b!199526 (= lt!311531 (readBitPure!0 lt!311526))))

(declare-fun lt!311535 () Unit!14062)

(assert (=> b!199526 (= lt!311535 (readBitPrefixLemma!0 lt!311551 (_2!9210 lt!311538)))))

(declare-fun res!167016 () Bool)

(assert (=> b!199526 (= res!167016 (= (bitIndex!0 (size!4458 (buf!4950 (_1!9211 lt!311509))) (currentByte!9297 (_1!9211 lt!311509)) (currentBit!9292 (_1!9211 lt!311509))) (bitIndex!0 (size!4458 (buf!4950 (_1!9211 lt!311531))) (currentByte!9297 (_1!9211 lt!311531)) (currentBit!9292 (_1!9211 lt!311531)))))))

(declare-fun e!136924 () Bool)

(assert (=> b!199526 (=> (not res!167016) (not e!136924))))

(assert (=> b!199526 e!136924))

(declare-fun lt!311508 () Unit!14062)

(assert (=> b!199526 (= lt!311508 lt!311535)))

(declare-fun lt!311544 () tuple2!17128)

(assert (=> b!199526 (= lt!311544 (reader!0 (_2!9210 lt!310742) (_2!9210 lt!311538)))))

(declare-fun lt!311560 () tuple2!17128)

(assert (=> b!199526 (= lt!311560 (reader!0 (_2!9210 lt!311530) (_2!9210 lt!311538)))))

(declare-fun lt!311557 () tuple2!17126)

(assert (=> b!199526 (= lt!311557 (readBitPure!0 (_1!9212 lt!311544)))))

(assert (=> b!199526 (= (_2!9211 lt!311557) lt!311548)))

(declare-fun lt!311536 () Unit!14062)

(declare-fun Unit!14156 () Unit!14062)

(assert (=> b!199526 (= lt!311536 Unit!14156)))

(declare-fun lt!311512 () (_ BitVec 64))

(assert (=> b!199526 (= lt!311512 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!311521 () (_ BitVec 64))

(assert (=> b!199526 (= lt!311521 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!311547 () Unit!14062)

(assert (=> b!199526 (= lt!311547 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9210 lt!310742) (buf!4950 (_2!9210 lt!311538)) lt!311521))))

(assert (=> b!199526 (validate_offset_bits!1 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!311538)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!310742))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!310742))) lt!311521)))

(declare-fun lt!311514 () Unit!14062)

(assert (=> b!199526 (= lt!311514 lt!311547)))

(declare-fun lt!311546 () tuple2!17130)

(assert (=> b!199526 (= lt!311546 (readNBitsLSBFirstsLoopPure!0 (_1!9212 lt!311544) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!311512))))

(declare-fun lt!311516 () (_ BitVec 64))

(assert (=> b!199526 (= lt!311516 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(declare-fun lt!311555 () Unit!14062)

(assert (=> b!199526 (= lt!311555 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9210 lt!311530) (buf!4950 (_2!9210 lt!311538)) lt!311516))))

(assert (=> b!199526 (validate_offset_bits!1 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!311538)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!311530))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!311530))) lt!311516)))

(declare-fun lt!311541 () Unit!14062)

(assert (=> b!199526 (= lt!311541 lt!311555)))

(declare-fun lt!311545 () tuple2!17130)

(assert (=> b!199526 (= lt!311545 (readNBitsLSBFirstsLoopPure!0 (_1!9212 lt!311560) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!311512 (ite (_2!9211 lt!311557) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!311556 () tuple2!17130)

(assert (=> b!199526 (= lt!311556 (readNBitsLSBFirstsLoopPure!0 (_1!9212 lt!311544) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!311512))))

(declare-fun c!9957 () Bool)

(assert (=> b!199526 (= c!9957 (_2!9211 (readBitPure!0 (_1!9212 lt!311544))))))

(declare-fun lt!311558 () tuple2!17130)

(assert (=> b!199526 (= lt!311558 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9212 lt!311544) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!311512 e!136923)))))

(declare-fun lt!311519 () Unit!14062)

(assert (=> b!199526 (= lt!311519 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9212 lt!311544) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!311512))))

(assert (=> b!199526 (and (= (_2!9213 lt!311556) (_2!9213 lt!311558)) (= (_1!9213 lt!311556) (_1!9213 lt!311558)))))

(declare-fun lt!311532 () Unit!14062)

(assert (=> b!199526 (= lt!311532 lt!311519)))

(assert (=> b!199526 (= (_1!9212 lt!311544) (withMovedBitIndex!0 (_2!9212 lt!311544) (bvsub (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310742))) (currentByte!9297 (_2!9210 lt!310742)) (currentBit!9292 (_2!9210 lt!310742))) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!311538))) (currentByte!9297 (_2!9210 lt!311538)) (currentBit!9292 (_2!9210 lt!311538))))))))

(declare-fun lt!311562 () Unit!14062)

(declare-fun Unit!14157 () Unit!14062)

(assert (=> b!199526 (= lt!311562 Unit!14157)))

(assert (=> b!199526 (= (_1!9212 lt!311560) (withMovedBitIndex!0 (_2!9212 lt!311560) (bvsub (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!311530))) (currentByte!9297 (_2!9210 lt!311530)) (currentBit!9292 (_2!9210 lt!311530))) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!311538))) (currentByte!9297 (_2!9210 lt!311538)) (currentBit!9292 (_2!9210 lt!311538))))))))

(declare-fun lt!311540 () Unit!14062)

(declare-fun Unit!14158 () Unit!14062)

(assert (=> b!199526 (= lt!311540 Unit!14158)))

(assert (=> b!199526 (= (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310742))) (currentByte!9297 (_2!9210 lt!310742)) (currentBit!9292 (_2!9210 lt!310742))) (bvsub (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!311530))) (currentByte!9297 (_2!9210 lt!311530)) (currentBit!9292 (_2!9210 lt!311530))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!311511 () Unit!14062)

(declare-fun Unit!14159 () Unit!14062)

(assert (=> b!199526 (= lt!311511 Unit!14159)))

(assert (=> b!199526 (= (_2!9213 lt!311546) (_2!9213 lt!311545))))

(declare-fun lt!311529 () Unit!14062)

(declare-fun Unit!14160 () Unit!14062)

(assert (=> b!199526 (= lt!311529 Unit!14160)))

(assert (=> b!199526 (invariant!0 (currentBit!9292 (_2!9210 lt!311538)) (currentByte!9297 (_2!9210 lt!311538)) (size!4458 (buf!4950 (_2!9210 lt!311538))))))

(declare-fun lt!311539 () Unit!14062)

(declare-fun Unit!14161 () Unit!14062)

(assert (=> b!199526 (= lt!311539 Unit!14161)))

(assert (=> b!199526 (= (size!4458 (buf!4950 (_2!9210 lt!310742))) (size!4458 (buf!4950 (_2!9210 lt!311538))))))

(declare-fun lt!311524 () Unit!14062)

(declare-fun Unit!14162 () Unit!14062)

(assert (=> b!199526 (= lt!311524 Unit!14162)))

(assert (=> b!199526 (= (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!311538))) (currentByte!9297 (_2!9210 lt!311538)) (currentBit!9292 (_2!9210 lt!311538))) (bvsub (bvadd (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310742))) (currentByte!9297 (_2!9210 lt!310742)) (currentBit!9292 (_2!9210 lt!310742))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!311523 () Unit!14062)

(declare-fun Unit!14163 () Unit!14062)

(assert (=> b!199526 (= lt!311523 Unit!14163)))

(declare-fun lt!311520 () Unit!14062)

(declare-fun Unit!14164 () Unit!14062)

(assert (=> b!199526 (= lt!311520 Unit!14164)))

(declare-fun lt!311528 () tuple2!17128)

(assert (=> b!199526 (= lt!311528 (reader!0 (_2!9210 lt!310742) (_2!9210 lt!311538)))))

(declare-fun lt!311517 () (_ BitVec 64))

(assert (=> b!199526 (= lt!311517 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!311543 () Unit!14062)

(assert (=> b!199526 (= lt!311543 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9210 lt!310742) (buf!4950 (_2!9210 lt!311538)) lt!311517))))

(assert (=> b!199526 (validate_offset_bits!1 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!311538)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!310742))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!310742))) lt!311517)))

(declare-fun lt!311554 () Unit!14062)

(assert (=> b!199526 (= lt!311554 lt!311543)))

(declare-fun lt!311527 () tuple2!17130)

(assert (=> b!199526 (= lt!311527 (readNBitsLSBFirstsLoopPure!0 (_1!9212 lt!311528) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))))

(declare-fun res!167018 () Bool)

(assert (=> b!199526 (= res!167018 (= (_2!9213 lt!311527) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!136922 () Bool)

(assert (=> b!199526 (=> (not res!167018) (not e!136922))))

(assert (=> b!199526 e!136922))

(declare-fun lt!311549 () Unit!14062)

(declare-fun Unit!14165 () Unit!14062)

(assert (=> b!199526 (= lt!311549 Unit!14165)))

(declare-fun b!199527 () Bool)

(assert (=> b!199527 (= e!136923 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!199528 () Bool)

(declare-fun res!167020 () Bool)

(assert (=> b!199528 (= res!167020 (= (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!311542))) (currentByte!9297 (_2!9210 lt!311542)) (currentBit!9292 (_2!9210 lt!311542))) (bvadd (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310742))) (currentByte!9297 (_2!9210 lt!310742)) (currentBit!9292 (_2!9210 lt!310742))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!199528 (=> (not res!167020) (not e!136916))))

(declare-fun d!68163 () Bool)

(declare-fun e!136920 () Bool)

(assert (=> d!68163 e!136920))

(declare-fun res!167012 () Bool)

(assert (=> d!68163 (=> (not res!167012) (not e!136920))))

(declare-fun lt!311518 () tuple2!17124)

(assert (=> d!68163 (= res!167012 (invariant!0 (currentBit!9292 (_2!9210 lt!311518)) (currentByte!9297 (_2!9210 lt!311518)) (size!4458 (buf!4950 (_2!9210 lt!311518)))))))

(assert (=> d!68163 (= lt!311518 e!136919)))

(declare-fun c!9958 () Bool)

(assert (=> d!68163 (= c!9958 (= (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) nBits!348))))

(assert (=> d!68163 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!68163 (= (appendBitsLSBFirstLoopTR!0 (_2!9210 lt!310742) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)) lt!311518)))

(declare-fun bm!3155 () Bool)

(assert (=> bm!3155 (= call!3158 (isPrefixOf!0 (_2!9210 lt!310742) (ite c!9958 (_2!9210 lt!310742) (_2!9210 lt!311542))))))

(declare-fun b!199529 () Bool)

(assert (=> b!199529 (= e!136920 e!136918)))

(declare-fun res!167021 () Bool)

(assert (=> b!199529 (=> (not res!167021) (not e!136918))))

(assert (=> b!199529 (= res!167021 (= (_2!9213 lt!311537) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!199529 (= lt!311537 (readNBitsLSBFirstsLoopPure!0 (_1!9212 lt!311550) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))))

(declare-fun lt!311552 () Unit!14062)

(declare-fun lt!311522 () Unit!14062)

(assert (=> b!199529 (= lt!311552 lt!311522)))

(assert (=> b!199529 (validate_offset_bits!1 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!311518)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!310742))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!310742))) lt!311553)))

(assert (=> b!199529 (= lt!311522 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9210 lt!310742) (buf!4950 (_2!9210 lt!311518)) lt!311553))))

(assert (=> b!199529 e!136921))

(declare-fun res!167022 () Bool)

(assert (=> b!199529 (=> (not res!167022) (not e!136921))))

(assert (=> b!199529 (= res!167022 (and (= (size!4458 (buf!4950 (_2!9210 lt!310742))) (size!4458 (buf!4950 (_2!9210 lt!311518)))) (bvsge lt!311553 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199529 (= lt!311553 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(assert (=> b!199529 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!199529 (= lt!311550 (reader!0 (_2!9210 lt!310742) (_2!9210 lt!311518)))))

(declare-fun b!199530 () Bool)

(declare-fun e!136917 () Bool)

(declare-fun lt!311515 () tuple2!17126)

(assert (=> b!199530 (= e!136917 (= (bitIndex!0 (size!4458 (buf!4950 (_1!9211 lt!311515))) (currentByte!9297 (_1!9211 lt!311515)) (currentBit!9292 (_1!9211 lt!311515))) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!311542))) (currentByte!9297 (_2!9210 lt!311542)) (currentBit!9292 (_2!9210 lt!311542)))))))

(declare-fun b!199531 () Bool)

(assert (=> b!199531 (= e!136922 (= (_1!9213 lt!311527) (_2!9212 lt!311528)))))

(declare-fun b!199532 () Bool)

(assert (=> b!199532 (= e!136924 (= (_2!9211 lt!311509) (_2!9211 lt!311531)))))

(declare-fun b!199533 () Bool)

(declare-fun res!167015 () Bool)

(assert (=> b!199533 (=> (not res!167015) (not e!136920))))

(assert (=> b!199533 (= res!167015 (isPrefixOf!0 (_2!9210 lt!310742) (_2!9210 lt!311518)))))

(declare-fun b!199534 () Bool)

(assert (=> b!199534 (= lt!311515 (readBitPure!0 (readerFrom!0 (_2!9210 lt!311542) (currentBit!9292 (_2!9210 lt!310742)) (currentByte!9297 (_2!9210 lt!310742)))))))

(declare-fun res!167013 () Bool)

(assert (=> b!199534 (= res!167013 (and (= (_2!9211 lt!311515) lt!311548) (= (_1!9211 lt!311515) (_2!9210 lt!311542))))))

(assert (=> b!199534 (=> (not res!167013) (not e!136917))))

(assert (=> b!199534 (= e!136916 e!136917)))

(declare-fun b!199535 () Bool)

(declare-fun res!167014 () Bool)

(assert (=> b!199535 (=> (not res!167014) (not e!136920))))

(declare-fun lt!311563 () (_ BitVec 64))

(declare-fun lt!311525 () (_ BitVec 64))

(assert (=> b!199535 (= res!167014 (= (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!311518))) (currentByte!9297 (_2!9210 lt!311518)) (currentBit!9292 (_2!9210 lt!311518))) (bvsub lt!311525 lt!311563)))))

(assert (=> b!199535 (or (= (bvand lt!311525 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311563 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311525 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311525 lt!311563) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199535 (= lt!311563 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!311533 () (_ BitVec 64))

(declare-fun lt!311513 () (_ BitVec 64))

(assert (=> b!199535 (= lt!311525 (bvadd lt!311533 lt!311513))))

(assert (=> b!199535 (or (not (= (bvand lt!311533 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311513 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311533 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311533 lt!311513) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199535 (= lt!311513 ((_ sign_extend 32) nBits!348))))

(assert (=> b!199535 (= lt!311533 (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310742))) (currentByte!9297 (_2!9210 lt!310742)) (currentBit!9292 (_2!9210 lt!310742))))))

(declare-fun b!199536 () Bool)

(declare-fun Unit!14166 () Unit!14062)

(assert (=> b!199536 (= e!136919 (tuple2!17125 Unit!14166 (_2!9210 lt!310742)))))

(declare-fun lt!311561 () Unit!14062)

(assert (=> b!199536 (= lt!311561 (lemmaIsPrefixRefl!0 (_2!9210 lt!310742)))))

(assert (=> b!199536 call!3158))

(declare-fun lt!311534 () Unit!14062)

(assert (=> b!199536 (= lt!311534 lt!311561)))

(declare-fun b!199537 () Bool)

(declare-fun res!167023 () Bool)

(assert (=> b!199537 (=> (not res!167023) (not e!136920))))

(assert (=> b!199537 (= res!167023 (= (size!4458 (buf!4950 (_2!9210 lt!310742))) (size!4458 (buf!4950 (_2!9210 lt!311518)))))))

(assert (= (and d!68163 c!9958) b!199536))

(assert (= (and d!68163 (not c!9958)) b!199526))

(assert (= (and b!199526 res!167017) b!199528))

(assert (= (and b!199528 res!167020) b!199525))

(assert (= (and b!199525 res!167019) b!199534))

(assert (= (and b!199534 res!167013) b!199530))

(assert (= (and b!199526 res!167016) b!199532))

(assert (= (and b!199526 c!9957) b!199522))

(assert (= (and b!199526 (not c!9957)) b!199527))

(assert (= (and b!199526 res!167018) b!199531))

(assert (= (or b!199536 b!199525) bm!3155))

(assert (= (and d!68163 res!167012) b!199537))

(assert (= (and b!199537 res!167023) b!199535))

(assert (= (and b!199535 res!167014) b!199533))

(assert (= (and b!199533 res!167015) b!199529))

(assert (= (and b!199529 res!167022) b!199523))

(assert (= (and b!199529 res!167021) b!199524))

(declare-fun m!309427 () Bool)

(assert (=> b!199530 m!309427))

(declare-fun m!309429 () Bool)

(assert (=> b!199530 m!309429))

(declare-fun m!309431 () Bool)

(assert (=> b!199526 m!309431))

(declare-fun m!309433 () Bool)

(assert (=> b!199526 m!309433))

(declare-fun m!309435 () Bool)

(assert (=> b!199526 m!309435))

(declare-fun m!309437 () Bool)

(assert (=> b!199526 m!309437))

(declare-fun m!309439 () Bool)

(assert (=> b!199526 m!309439))

(declare-fun m!309441 () Bool)

(assert (=> b!199526 m!309441))

(declare-fun m!309443 () Bool)

(assert (=> b!199526 m!309443))

(declare-fun m!309445 () Bool)

(assert (=> b!199526 m!309445))

(declare-fun m!309447 () Bool)

(assert (=> b!199526 m!309447))

(declare-fun m!309449 () Bool)

(assert (=> b!199526 m!309449))

(declare-fun m!309451 () Bool)

(assert (=> b!199526 m!309451))

(declare-fun m!309453 () Bool)

(assert (=> b!199526 m!309453))

(declare-fun m!309455 () Bool)

(assert (=> b!199526 m!309455))

(declare-fun m!309457 () Bool)

(assert (=> b!199526 m!309457))

(declare-fun m!309459 () Bool)

(assert (=> b!199526 m!309459))

(declare-fun m!309461 () Bool)

(assert (=> b!199526 m!309461))

(declare-fun m!309463 () Bool)

(assert (=> b!199526 m!309463))

(assert (=> b!199526 m!308403))

(assert (=> b!199526 m!309463))

(declare-fun m!309465 () Bool)

(assert (=> b!199526 m!309465))

(declare-fun m!309467 () Bool)

(assert (=> b!199526 m!309467))

(declare-fun m!309469 () Bool)

(assert (=> b!199526 m!309469))

(declare-fun m!309471 () Bool)

(assert (=> b!199526 m!309471))

(declare-fun m!309473 () Bool)

(assert (=> b!199526 m!309473))

(assert (=> b!199526 m!308383))

(declare-fun m!309475 () Bool)

(assert (=> b!199526 m!309475))

(declare-fun m!309477 () Bool)

(assert (=> b!199526 m!309477))

(declare-fun m!309479 () Bool)

(assert (=> b!199526 m!309479))

(declare-fun m!309481 () Bool)

(assert (=> b!199526 m!309481))

(declare-fun m!309483 () Bool)

(assert (=> b!199526 m!309483))

(declare-fun m!309485 () Bool)

(assert (=> b!199526 m!309485))

(declare-fun m!309487 () Bool)

(assert (=> b!199526 m!309487))

(declare-fun m!309489 () Bool)

(assert (=> b!199526 m!309489))

(declare-fun m!309491 () Bool)

(assert (=> b!199526 m!309491))

(declare-fun m!309493 () Bool)

(assert (=> b!199526 m!309493))

(declare-fun m!309495 () Bool)

(assert (=> d!68163 m!309495))

(assert (=> b!199528 m!309429))

(assert (=> b!199528 m!308383))

(declare-fun m!309497 () Bool)

(assert (=> b!199529 m!309497))

(assert (=> b!199529 m!308403))

(declare-fun m!309499 () Bool)

(assert (=> b!199529 m!309499))

(declare-fun m!309501 () Bool)

(assert (=> b!199529 m!309501))

(assert (=> b!199529 m!309483))

(declare-fun m!309503 () Bool)

(assert (=> b!199529 m!309503))

(declare-fun m!309505 () Bool)

(assert (=> b!199533 m!309505))

(assert (=> b!199536 m!309317))

(declare-fun m!309507 () Bool)

(assert (=> b!199534 m!309507))

(assert (=> b!199534 m!309507))

(declare-fun m!309509 () Bool)

(assert (=> b!199534 m!309509))

(declare-fun m!309511 () Bool)

(assert (=> b!199535 m!309511))

(assert (=> b!199535 m!308383))

(declare-fun m!309513 () Bool)

(assert (=> bm!3155 m!309513))

(declare-fun m!309515 () Bool)

(assert (=> b!199523 m!309515))

(assert (=> b!199069 d!68163))

(declare-fun d!68165 () Bool)

(declare-fun e!136925 () Bool)

(assert (=> d!68165 e!136925))

(declare-fun res!167025 () Bool)

(assert (=> d!68165 (=> (not res!167025) (not e!136925))))

(declare-fun lt!311565 () (_ BitVec 64))

(declare-fun lt!311569 () (_ BitVec 64))

(declare-fun lt!311568 () (_ BitVec 64))

(assert (=> d!68165 (= res!167025 (= lt!311569 (bvsub lt!311568 lt!311565)))))

(assert (=> d!68165 (or (= (bvand lt!311568 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311565 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311568 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311568 lt!311565) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68165 (= lt!311565 (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310742)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!310742))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!310742)))))))

(declare-fun lt!311564 () (_ BitVec 64))

(declare-fun lt!311567 () (_ BitVec 64))

(assert (=> d!68165 (= lt!311568 (bvmul lt!311564 lt!311567))))

(assert (=> d!68165 (or (= lt!311564 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311567 (bvsdiv (bvmul lt!311564 lt!311567) lt!311564)))))

(assert (=> d!68165 (= lt!311567 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68165 (= lt!311564 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310742)))))))

(assert (=> d!68165 (= lt!311569 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!310742))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!310742)))))))

(assert (=> d!68165 (invariant!0 (currentBit!9292 (_2!9210 lt!310742)) (currentByte!9297 (_2!9210 lt!310742)) (size!4458 (buf!4950 (_2!9210 lt!310742))))))

(assert (=> d!68165 (= (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310742))) (currentByte!9297 (_2!9210 lt!310742)) (currentBit!9292 (_2!9210 lt!310742))) lt!311569)))

(declare-fun b!199538 () Bool)

(declare-fun res!167024 () Bool)

(assert (=> b!199538 (=> (not res!167024) (not e!136925))))

(assert (=> b!199538 (= res!167024 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311569))))

(declare-fun b!199539 () Bool)

(declare-fun lt!311566 () (_ BitVec 64))

(assert (=> b!199539 (= e!136925 (bvsle lt!311569 (bvmul lt!311566 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199539 (or (= lt!311566 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311566 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311566)))))

(assert (=> b!199539 (= lt!311566 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!310742)))))))

(assert (= (and d!68165 res!167025) b!199538))

(assert (= (and b!199538 res!167024) b!199539))

(declare-fun m!309517 () Bool)

(assert (=> d!68165 m!309517))

(declare-fun m!309519 () Bool)

(assert (=> d!68165 m!309519))

(assert (=> b!199069 d!68165))

(declare-fun d!68167 () Bool)

(assert (=> d!68167 (= (invariant!0 (currentBit!9292 (_2!9210 lt!310750)) (currentByte!9297 (_2!9210 lt!310750)) (size!4458 (buf!4950 (_2!9210 lt!310750)))) (and (bvsge (currentBit!9292 (_2!9210 lt!310750)) #b00000000000000000000000000000000) (bvslt (currentBit!9292 (_2!9210 lt!310750)) #b00000000000000000000000000001000) (bvsge (currentByte!9297 (_2!9210 lt!310750)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9297 (_2!9210 lt!310750)) (size!4458 (buf!4950 (_2!9210 lt!310750)))) (and (= (currentBit!9292 (_2!9210 lt!310750)) #b00000000000000000000000000000000) (= (currentByte!9297 (_2!9210 lt!310750)) (size!4458 (buf!4950 (_2!9210 lt!310750))))))))))

(assert (=> b!199069 d!68167))

(declare-fun d!68169 () Bool)

(assert (=> d!68169 (isPrefixOf!0 (_2!9210 lt!309686) (_2!9210 lt!310750))))

(declare-fun lt!311570 () Unit!14062)

(assert (=> d!68169 (= lt!311570 (choose!30 (_2!9210 lt!309686) (_2!9210 lt!310742) (_2!9210 lt!310750)))))

(assert (=> d!68169 (isPrefixOf!0 (_2!9210 lt!309686) (_2!9210 lt!310742))))

(assert (=> d!68169 (= (lemmaIsPrefixTransitive!0 (_2!9210 lt!309686) (_2!9210 lt!310742) (_2!9210 lt!310750)) lt!311570)))

(declare-fun bs!16817 () Bool)

(assert (= bs!16817 d!68169))

(assert (=> bs!16817 m!308429))

(declare-fun m!309521 () Bool)

(assert (=> bs!16817 m!309521))

(declare-fun m!309523 () Bool)

(assert (=> bs!16817 m!309523))

(assert (=> b!199069 d!68169))

(declare-fun d!68171 () Bool)

(declare-fun lt!311571 () tuple2!17140)

(assert (=> d!68171 (= lt!311571 (readBit!0 (_1!9212 lt!310756)))))

(assert (=> d!68171 (= (readBitPure!0 (_1!9212 lt!310756)) (tuple2!17127 (_2!9218 lt!311571) (_1!9218 lt!311571)))))

(declare-fun bs!16818 () Bool)

(assert (= bs!16818 d!68171))

(declare-fun m!309525 () Bool)

(assert (=> bs!16818 m!309525))

(assert (=> b!199069 d!68171))

(declare-fun d!68173 () Bool)

(declare-fun lt!311572 () tuple2!17140)

(assert (=> d!68173 (= lt!311572 (readBit!0 lt!310763))))

(assert (=> d!68173 (= (readBitPure!0 lt!310763) (tuple2!17127 (_2!9218 lt!311572) (_1!9218 lt!311572)))))

(declare-fun bs!16819 () Bool)

(assert (= bs!16819 d!68173))

(declare-fun m!309527 () Bool)

(assert (=> bs!16819 m!309527))

(assert (=> b!199069 d!68173))

(declare-fun d!68175 () Bool)

(declare-fun res!167028 () Bool)

(declare-fun e!136926 () Bool)

(assert (=> d!68175 (=> (not res!167028) (not e!136926))))

(assert (=> d!68175 (= res!167028 (= (size!4458 (buf!4950 (_2!9212 lt!310188))) (size!4458 (buf!4950 (_2!9210 lt!309690)))))))

(assert (=> d!68175 (= (isPrefixOf!0 (_2!9212 lt!310188) (_2!9210 lt!309690)) e!136926)))

(declare-fun b!199540 () Bool)

(declare-fun res!167026 () Bool)

(assert (=> b!199540 (=> (not res!167026) (not e!136926))))

(assert (=> b!199540 (= res!167026 (bvsle (bitIndex!0 (size!4458 (buf!4950 (_2!9212 lt!310188))) (currentByte!9297 (_2!9212 lt!310188)) (currentBit!9292 (_2!9212 lt!310188))) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309690))) (currentByte!9297 (_2!9210 lt!309690)) (currentBit!9292 (_2!9210 lt!309690)))))))

(declare-fun b!199541 () Bool)

(declare-fun e!136927 () Bool)

(assert (=> b!199541 (= e!136926 e!136927)))

(declare-fun res!167027 () Bool)

(assert (=> b!199541 (=> res!167027 e!136927)))

(assert (=> b!199541 (= res!167027 (= (size!4458 (buf!4950 (_2!9212 lt!310188))) #b00000000000000000000000000000000))))

(declare-fun b!199542 () Bool)

(assert (=> b!199542 (= e!136927 (arrayBitRangesEq!0 (buf!4950 (_2!9212 lt!310188)) (buf!4950 (_2!9210 lt!309690)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4458 (buf!4950 (_2!9212 lt!310188))) (currentByte!9297 (_2!9212 lt!310188)) (currentBit!9292 (_2!9212 lt!310188)))))))

(assert (= (and d!68175 res!167028) b!199540))

(assert (= (and b!199540 res!167026) b!199541))

(assert (= (and b!199541 (not res!167027)) b!199542))

(declare-fun m!309529 () Bool)

(assert (=> b!199540 m!309529))

(assert (=> b!199540 m!307653))

(assert (=> b!199542 m!309529))

(assert (=> b!199542 m!309529))

(declare-fun m!309531 () Bool)

(assert (=> b!199542 m!309531))

(assert (=> b!198894 d!68175))

(assert (=> d!67595 d!68029))

(assert (=> d!67653 d!67681))

(declare-fun d!68177 () Bool)

(assert (=> d!68177 (validate_offset_bits!1 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!309690)))) ((_ sign_extend 32) (currentByte!9297 thiss!1204)) ((_ sign_extend 32) (currentBit!9292 thiss!1204)) lt!309680)))

(assert (=> d!68177 true))

(declare-fun _$6!379 () Unit!14062)

(assert (=> d!68177 (= (choose!9 thiss!1204 (buf!4950 (_2!9210 lt!309690)) lt!309680 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204))) _$6!379)))

(declare-fun bs!16820 () Bool)

(assert (= bs!16820 d!68177))

(assert (=> bs!16820 m!307669))

(assert (=> d!67653 d!68177))

(assert (=> d!67661 d!67663))

(declare-fun d!68179 () Bool)

(assert (=> d!68179 (validate_offset_bits!1 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!309690)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309686))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309686))) lt!309683)))

(assert (=> d!68179 true))

(declare-fun _$6!380 () Unit!14062)

(assert (=> d!68179 (= (choose!9 (_2!9210 lt!309686) (buf!4950 (_2!9210 lt!309690)) lt!309683 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686)))) _$6!380)))

(declare-fun bs!16821 () Bool)

(assert (= bs!16821 d!68179))

(assert (=> bs!16821 m!307665))

(assert (=> d!67661 d!68179))

(declare-fun d!68181 () Bool)

(assert (=> d!68181 (= (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!309686)))) ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309686))) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309686)))) (bvsub (bvmul ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!309686)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 (_2!9210 lt!309686))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 (_2!9210 lt!309686))))))))

(assert (=> d!67611 d!68181))

(assert (=> d!67611 d!68025))

(declare-fun d!68183 () Bool)

(declare-fun e!136928 () Bool)

(assert (=> d!68183 e!136928))

(declare-fun res!167029 () Bool)

(assert (=> d!68183 (=> (not res!167029) (not e!136928))))

(assert (=> d!68183 (= res!167029 (= (buf!4950 (_2!9210 (increaseBitIndex!0 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204))))) (buf!4950 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204)))))))

(declare-fun lt!311578 () Bool)

(assert (=> d!68183 (= lt!311578 (not (= (bvand ((_ sign_extend 24) (select (arr!5388 (buf!4950 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204)))) (currentByte!9297 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9292 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!311576 () tuple2!17140)

(assert (=> d!68183 (= lt!311576 (tuple2!17141 (not (= (bvand ((_ sign_extend 24) (select (arr!5388 (buf!4950 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204)))) (currentByte!9297 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9292 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204)))))) #b00000000000000000000000000000000)) (_2!9210 (increaseBitIndex!0 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204))))))))

(assert (=> d!68183 (validate_offset_bit!0 ((_ sign_extend 32) (size!4458 (buf!4950 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204))))) ((_ sign_extend 32) (currentByte!9297 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204)))) ((_ sign_extend 32) (currentBit!9292 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204)))))))

(assert (=> d!68183 (= (readBit!0 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204))) lt!311576)))

(declare-fun lt!311579 () (_ BitVec 64))

(declare-fun lt!311574 () (_ BitVec 64))

(declare-fun b!199543 () Bool)

(assert (=> b!199543 (= e!136928 (= (bitIndex!0 (size!4458 (buf!4950 (_2!9210 (increaseBitIndex!0 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204)))))) (currentByte!9297 (_2!9210 (increaseBitIndex!0 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204))))) (currentBit!9292 (_2!9210 (increaseBitIndex!0 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204)))))) (bvadd lt!311574 lt!311579)))))

(assert (=> b!199543 (or (not (= (bvand lt!311574 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311579 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311574 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311574 lt!311579) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199543 (= lt!311579 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!199543 (= lt!311574 (bitIndex!0 (size!4458 (buf!4950 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204)))) (currentByte!9297 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204))) (currentBit!9292 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204)))))))

(declare-fun lt!311575 () Bool)

(assert (=> b!199543 (= lt!311575 (not (= (bvand ((_ sign_extend 24) (select (arr!5388 (buf!4950 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204)))) (currentByte!9297 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9292 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!311577 () Bool)

(assert (=> b!199543 (= lt!311577 (not (= (bvand ((_ sign_extend 24) (select (arr!5388 (buf!4950 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204)))) (currentByte!9297 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9292 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!311573 () Bool)

(assert (=> b!199543 (= lt!311573 (not (= (bvand ((_ sign_extend 24) (select (arr!5388 (buf!4950 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204)))) (currentByte!9297 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9292 (readerFrom!0 (_2!9210 lt!309686) (currentBit!9292 thiss!1204) (currentByte!9297 thiss!1204)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!68183 res!167029) b!199543))

(assert (=> d!68183 m!307711))

(declare-fun m!309533 () Bool)

(assert (=> d!68183 m!309533))

(declare-fun m!309535 () Bool)

(assert (=> d!68183 m!309535))

(declare-fun m!309537 () Bool)

(assert (=> d!68183 m!309537))

(declare-fun m!309539 () Bool)

(assert (=> d!68183 m!309539))

(declare-fun m!309541 () Bool)

(assert (=> b!199543 m!309541))

(assert (=> b!199543 m!309537))

(declare-fun m!309543 () Bool)

(assert (=> b!199543 m!309543))

(assert (=> b!199543 m!307711))

(assert (=> b!199543 m!309533))

(assert (=> b!199543 m!309535))

(assert (=> d!67597 d!68183))

(assert (=> b!198805 d!67611))

(assert (=> b!198805 d!67683))

(assert (=> b!198865 d!67615))

(assert (=> b!198865 d!67611))

(declare-fun d!68185 () Bool)

(declare-fun res!167032 () Bool)

(declare-fun e!136929 () Bool)

(assert (=> d!68185 (=> (not res!167032) (not e!136929))))

(assert (=> d!68185 (= res!167032 (= (size!4458 (buf!4950 (_1!9212 lt!310150))) (size!4458 (buf!4950 thiss!1204))))))

(assert (=> d!68185 (= (isPrefixOf!0 (_1!9212 lt!310150) thiss!1204) e!136929)))

(declare-fun b!199544 () Bool)

(declare-fun res!167030 () Bool)

(assert (=> b!199544 (=> (not res!167030) (not e!136929))))

(assert (=> b!199544 (= res!167030 (bvsle (bitIndex!0 (size!4458 (buf!4950 (_1!9212 lt!310150))) (currentByte!9297 (_1!9212 lt!310150)) (currentBit!9292 (_1!9212 lt!310150))) (bitIndex!0 (size!4458 (buf!4950 thiss!1204)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204))))))

(declare-fun b!199545 () Bool)

(declare-fun e!136930 () Bool)

(assert (=> b!199545 (= e!136929 e!136930)))

(declare-fun res!167031 () Bool)

(assert (=> b!199545 (=> res!167031 e!136930)))

(assert (=> b!199545 (= res!167031 (= (size!4458 (buf!4950 (_1!9212 lt!310150))) #b00000000000000000000000000000000))))

(declare-fun b!199546 () Bool)

(assert (=> b!199546 (= e!136930 (arrayBitRangesEq!0 (buf!4950 (_1!9212 lt!310150)) (buf!4950 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4458 (buf!4950 (_1!9212 lt!310150))) (currentByte!9297 (_1!9212 lt!310150)) (currentBit!9292 (_1!9212 lt!310150)))))))

(assert (= (and d!68185 res!167032) b!199544))

(assert (= (and b!199544 res!167030) b!199545))

(assert (= (and b!199545 (not res!167031)) b!199546))

(declare-fun m!309545 () Bool)

(assert (=> b!199544 m!309545))

(assert (=> b!199544 m!307721))

(assert (=> b!199546 m!309545))

(assert (=> b!199546 m!309545))

(declare-fun m!309547 () Bool)

(assert (=> b!199546 m!309547))

(assert (=> b!198885 d!68185))

(declare-fun d!68187 () Bool)

(declare-fun res!167035 () Bool)

(declare-fun e!136931 () Bool)

(assert (=> d!68187 (=> (not res!167035) (not e!136931))))

(assert (=> d!68187 (= res!167035 (= (size!4458 (buf!4950 thiss!1204)) (size!4458 (buf!4950 (_2!9210 lt!310074)))))))

(assert (=> d!68187 (= (isPrefixOf!0 thiss!1204 (_2!9210 lt!310074)) e!136931)))

(declare-fun b!199547 () Bool)

(declare-fun res!167033 () Bool)

(assert (=> b!199547 (=> (not res!167033) (not e!136931))))

(assert (=> b!199547 (= res!167033 (bvsle (bitIndex!0 (size!4458 (buf!4950 thiss!1204)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!310074))) (currentByte!9297 (_2!9210 lt!310074)) (currentBit!9292 (_2!9210 lt!310074)))))))

(declare-fun b!199548 () Bool)

(declare-fun e!136932 () Bool)

(assert (=> b!199548 (= e!136931 e!136932)))

(declare-fun res!167034 () Bool)

(assert (=> b!199548 (=> res!167034 e!136932)))

(assert (=> b!199548 (= res!167034 (= (size!4458 (buf!4950 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!199549 () Bool)

(assert (=> b!199549 (= e!136932 (arrayBitRangesEq!0 (buf!4950 thiss!1204) (buf!4950 (_2!9210 lt!310074)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4458 (buf!4950 thiss!1204)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204))))))

(assert (= (and d!68187 res!167035) b!199547))

(assert (= (and b!199547 res!167033) b!199548))

(assert (= (and b!199548 (not res!167034)) b!199549))

(assert (=> b!199547 m!307721))

(assert (=> b!199547 m!308013))

(assert (=> b!199549 m!307721))

(assert (=> b!199549 m!307721))

(declare-fun m!309549 () Bool)

(assert (=> b!199549 m!309549))

(assert (=> b!198862 d!68187))

(declare-fun d!68189 () Bool)

(declare-fun e!136933 () Bool)

(assert (=> d!68189 e!136933))

(declare-fun res!167036 () Bool)

(assert (=> d!68189 (=> (not res!167036) (not e!136933))))

(declare-fun lt!311581 () (_ BitVec 64))

(declare-fun lt!311580 () BitStream!8024)

(assert (=> d!68189 (= res!167036 (= (bvadd lt!311581 (bvsub lt!310171 lt!310184)) (bitIndex!0 (size!4458 (buf!4950 lt!311580)) (currentByte!9297 lt!311580) (currentBit!9292 lt!311580))))))

(assert (=> d!68189 (or (not (= (bvand lt!311581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!310171 lt!310184) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311581 (bvsub lt!310171 lt!310184)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68189 (= lt!311581 (bitIndex!0 (size!4458 (buf!4950 (_2!9212 lt!310188))) (currentByte!9297 (_2!9212 lt!310188)) (currentBit!9292 (_2!9212 lt!310188))))))

(assert (=> d!68189 (= lt!311580 (_2!9210 (moveBitIndex!0 (_2!9212 lt!310188) (bvsub lt!310171 lt!310184))))))

(assert (=> d!68189 (moveBitIndexPrecond!0 (_2!9212 lt!310188) (bvsub lt!310171 lt!310184))))

(assert (=> d!68189 (= (withMovedBitIndex!0 (_2!9212 lt!310188) (bvsub lt!310171 lt!310184)) lt!311580)))

(declare-fun b!199550 () Bool)

(assert (=> b!199550 (= e!136933 (= (size!4458 (buf!4950 (_2!9212 lt!310188))) (size!4458 (buf!4950 lt!311580))))))

(assert (= (and d!68189 res!167036) b!199550))

(declare-fun m!309551 () Bool)

(assert (=> d!68189 m!309551))

(assert (=> d!68189 m!309529))

(declare-fun m!309553 () Bool)

(assert (=> d!68189 m!309553))

(declare-fun m!309555 () Bool)

(assert (=> d!68189 m!309555))

(assert (=> b!198890 d!68189))

(assert (=> b!198890 d!67683))

(assert (=> b!198890 d!67611))

(declare-fun d!68191 () Bool)

(declare-fun lt!311582 () tuple2!17140)

(assert (=> d!68191 (= lt!311582 (readBit!0 (readerFrom!0 (_2!9210 lt!310754) (currentBit!9292 (_2!9210 lt!309686)) (currentByte!9297 (_2!9210 lt!309686)))))))

(assert (=> d!68191 (= (readBitPure!0 (readerFrom!0 (_2!9210 lt!310754) (currentBit!9292 (_2!9210 lt!309686)) (currentByte!9297 (_2!9210 lt!309686)))) (tuple2!17127 (_2!9218 lt!311582) (_1!9218 lt!311582)))))

(declare-fun bs!16822 () Bool)

(assert (= bs!16822 d!68191))

(assert (=> bs!16822 m!308447))

(declare-fun m!309557 () Bool)

(assert (=> bs!16822 m!309557))

(assert (=> b!199077 d!68191))

(declare-fun d!68193 () Bool)

(declare-fun e!136934 () Bool)

(assert (=> d!68193 e!136934))

(declare-fun res!167037 () Bool)

(assert (=> d!68193 (=> (not res!167037) (not e!136934))))

(assert (=> d!68193 (= res!167037 (invariant!0 (currentBit!9292 (_2!9210 lt!310754)) (currentByte!9297 (_2!9210 lt!310754)) (size!4458 (buf!4950 (_2!9210 lt!310754)))))))

(assert (=> d!68193 (= (readerFrom!0 (_2!9210 lt!310754) (currentBit!9292 (_2!9210 lt!309686)) (currentByte!9297 (_2!9210 lt!309686))) (BitStream!8025 (buf!4950 (_2!9210 lt!310754)) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))))))

(declare-fun b!199551 () Bool)

(assert (=> b!199551 (= e!136934 (invariant!0 (currentBit!9292 (_2!9210 lt!309686)) (currentByte!9297 (_2!9210 lt!309686)) (size!4458 (buf!4950 (_2!9210 lt!310754)))))))

(assert (= (and d!68193 res!167037) b!199551))

(assert (=> d!68193 m!309193))

(declare-fun m!309559 () Bool)

(assert (=> b!199551 m!309559))

(assert (=> b!199077 d!68193))

(assert (=> b!198892 d!67611))

(declare-fun d!68195 () Bool)

(assert (=> d!68195 (arrayBitRangesEq!0 (buf!4950 (_2!9210 lt!309690)) (buf!4950 (_2!9210 lt!309686)) lt!310189 lt!310173)))

(declare-fun lt!311583 () Unit!14062)

(assert (=> d!68195 (= lt!311583 (choose!8 (buf!4950 (_2!9210 lt!309686)) (buf!4950 (_2!9210 lt!309690)) lt!310189 lt!310173))))

(assert (=> d!68195 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!310189) (bvsle lt!310189 lt!310173))))

(assert (=> d!68195 (= (arrayBitRangesEqSymmetric!0 (buf!4950 (_2!9210 lt!309686)) (buf!4950 (_2!9210 lt!309690)) lt!310189 lt!310173) lt!311583)))

(declare-fun bs!16823 () Bool)

(assert (= bs!16823 d!68195))

(assert (=> bs!16823 m!308083))

(declare-fun m!309561 () Bool)

(assert (=> bs!16823 m!309561))

(assert (=> b!198892 d!68195))

(declare-fun d!68197 () Bool)

(declare-fun res!167040 () Bool)

(declare-fun e!136938 () Bool)

(assert (=> d!68197 (=> res!167040 e!136938)))

(assert (=> d!68197 (= res!167040 (bvsge lt!310189 lt!310173))))

(assert (=> d!68197 (= (arrayBitRangesEq!0 (buf!4950 (_2!9210 lt!309690)) (buf!4950 (_2!9210 lt!309686)) lt!310189 lt!310173) e!136938)))

(declare-fun b!199552 () Bool)

(declare-fun e!136940 () Bool)

(declare-fun e!136939 () Bool)

(assert (=> b!199552 (= e!136940 e!136939)))

(declare-fun res!167039 () Bool)

(declare-fun call!3159 () Bool)

(assert (=> b!199552 (= res!167039 call!3159)))

(assert (=> b!199552 (=> (not res!167039) (not e!136939))))

(declare-fun b!199553 () Bool)

(declare-fun e!136937 () Bool)

(assert (=> b!199553 (= e!136937 e!136940)))

(declare-fun c!9959 () Bool)

(declare-fun lt!311584 () tuple4!266)

(assert (=> b!199553 (= c!9959 (= (_3!649 lt!311584) (_4!133 lt!311584)))))

(declare-fun b!199554 () Bool)

(declare-fun e!136936 () Bool)

(assert (=> b!199554 (= e!136936 (arrayRangesEq!695 (buf!4950 (_2!9210 lt!309690)) (buf!4950 (_2!9210 lt!309686)) (_1!9221 lt!311584) (_2!9221 lt!311584)))))

(declare-fun lt!311586 () (_ BitVec 32))

(declare-fun b!199555 () Bool)

(declare-fun e!136935 () Bool)

(assert (=> b!199555 (= e!136935 (byteRangesEq!0 (select (arr!5388 (buf!4950 (_2!9210 lt!309690))) (_4!133 lt!311584)) (select (arr!5388 (buf!4950 (_2!9210 lt!309686))) (_4!133 lt!311584)) #b00000000000000000000000000000000 lt!311586))))

(declare-fun bm!3156 () Bool)

(declare-fun lt!311585 () (_ BitVec 32))

(assert (=> bm!3156 (= call!3159 (byteRangesEq!0 (select (arr!5388 (buf!4950 (_2!9210 lt!309690))) (_3!649 lt!311584)) (select (arr!5388 (buf!4950 (_2!9210 lt!309686))) (_3!649 lt!311584)) lt!311585 (ite c!9959 lt!311586 #b00000000000000000000000000001000)))))

(declare-fun b!199556 () Bool)

(assert (=> b!199556 (= e!136938 e!136937)))

(declare-fun res!167042 () Bool)

(assert (=> b!199556 (=> (not res!167042) (not e!136937))))

(assert (=> b!199556 (= res!167042 e!136936)))

(declare-fun res!167038 () Bool)

(assert (=> b!199556 (=> res!167038 e!136936)))

(assert (=> b!199556 (= res!167038 (bvsge (_1!9221 lt!311584) (_2!9221 lt!311584)))))

(assert (=> b!199556 (= lt!311586 ((_ extract 31 0) (bvsrem lt!310173 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199556 (= lt!311585 ((_ extract 31 0) (bvsrem lt!310189 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199556 (= lt!311584 (arrayBitIndices!0 lt!310189 lt!310173))))

(declare-fun b!199557 () Bool)

(declare-fun res!167041 () Bool)

(assert (=> b!199557 (= res!167041 (= lt!311586 #b00000000000000000000000000000000))))

(assert (=> b!199557 (=> res!167041 e!136935)))

(assert (=> b!199557 (= e!136939 e!136935)))

(declare-fun b!199558 () Bool)

(assert (=> b!199558 (= e!136940 call!3159)))

(assert (= (and d!68197 (not res!167040)) b!199556))

(assert (= (and b!199556 (not res!167038)) b!199554))

(assert (= (and b!199556 res!167042) b!199553))

(assert (= (and b!199553 c!9959) b!199558))

(assert (= (and b!199553 (not c!9959)) b!199552))

(assert (= (and b!199552 res!167039) b!199557))

(assert (= (and b!199557 (not res!167041)) b!199555))

(assert (= (or b!199558 b!199552) bm!3156))

(declare-fun m!309563 () Bool)

(assert (=> b!199554 m!309563))

(declare-fun m!309565 () Bool)

(assert (=> b!199555 m!309565))

(declare-fun m!309567 () Bool)

(assert (=> b!199555 m!309567))

(assert (=> b!199555 m!309565))

(assert (=> b!199555 m!309567))

(declare-fun m!309569 () Bool)

(assert (=> b!199555 m!309569))

(declare-fun m!309571 () Bool)

(assert (=> bm!3156 m!309571))

(declare-fun m!309573 () Bool)

(assert (=> bm!3156 m!309573))

(assert (=> bm!3156 m!309571))

(assert (=> bm!3156 m!309573))

(declare-fun m!309575 () Bool)

(assert (=> bm!3156 m!309575))

(declare-fun m!309577 () Bool)

(assert (=> b!199556 m!309577))

(assert (=> b!198892 d!68197))

(declare-fun d!68199 () Bool)

(assert (=> d!68199 (= (invariant!0 (currentBit!9292 lt!309693) (currentByte!9297 lt!309693) (size!4458 (buf!4950 (_2!9210 lt!309690)))) (and (bvsge (currentBit!9292 lt!309693) #b00000000000000000000000000000000) (bvslt (currentBit!9292 lt!309693) #b00000000000000000000000000001000) (bvsge (currentByte!9297 lt!309693) #b00000000000000000000000000000000) (or (bvslt (currentByte!9297 lt!309693) (size!4458 (buf!4950 (_2!9210 lt!309690)))) (and (= (currentBit!9292 lt!309693) #b00000000000000000000000000000000) (= (currentByte!9297 lt!309693) (size!4458 (buf!4950 (_2!9210 lt!309690))))))))))

(assert (=> d!67667 d!68199))

(assert (=> d!67667 d!67677))

(declare-fun d!68201 () Bool)

(declare-fun e!136941 () Bool)

(assert (=> d!68201 e!136941))

(declare-fun res!167044 () Bool)

(assert (=> d!68201 (=> (not res!167044) (not e!136941))))

(declare-fun lt!311592 () (_ BitVec 64))

(declare-fun lt!311588 () (_ BitVec 64))

(declare-fun lt!311591 () (_ BitVec 64))

(assert (=> d!68201 (= res!167044 (= lt!311592 (bvsub lt!311591 lt!311588)))))

(assert (=> d!68201 (or (= (bvand lt!311591 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311588 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311591 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311591 lt!311588) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68201 (= lt!311588 (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!310162)))) ((_ sign_extend 32) (currentByte!9297 (_1!9211 lt!310162))) ((_ sign_extend 32) (currentBit!9292 (_1!9211 lt!310162)))))))

(declare-fun lt!311587 () (_ BitVec 64))

(declare-fun lt!311590 () (_ BitVec 64))

(assert (=> d!68201 (= lt!311591 (bvmul lt!311587 lt!311590))))

(assert (=> d!68201 (or (= lt!311587 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311590 (bvsdiv (bvmul lt!311587 lt!311590) lt!311587)))))

(assert (=> d!68201 (= lt!311590 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68201 (= lt!311587 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!310162)))))))

(assert (=> d!68201 (= lt!311592 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 (_1!9211 lt!310162))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 (_1!9211 lt!310162)))))))

(assert (=> d!68201 (invariant!0 (currentBit!9292 (_1!9211 lt!310162)) (currentByte!9297 (_1!9211 lt!310162)) (size!4458 (buf!4950 (_1!9211 lt!310162))))))

(assert (=> d!68201 (= (bitIndex!0 (size!4458 (buf!4950 (_1!9211 lt!310162))) (currentByte!9297 (_1!9211 lt!310162)) (currentBit!9292 (_1!9211 lt!310162))) lt!311592)))

(declare-fun b!199559 () Bool)

(declare-fun res!167043 () Bool)

(assert (=> b!199559 (=> (not res!167043) (not e!136941))))

(assert (=> b!199559 (= res!167043 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311592))))

(declare-fun b!199560 () Bool)

(declare-fun lt!311589 () (_ BitVec 64))

(assert (=> b!199560 (= e!136941 (bvsle lt!311592 (bvmul lt!311589 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199560 (or (= lt!311589 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311589 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311589)))))

(assert (=> b!199560 (= lt!311589 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!310162)))))))

(assert (= (and d!68201 res!167044) b!199559))

(assert (= (and b!199559 res!167043) b!199560))

(declare-fun m!309579 () Bool)

(assert (=> d!68201 m!309579))

(declare-fun m!309581 () Bool)

(assert (=> d!68201 m!309581))

(assert (=> d!67667 d!68201))

(declare-fun d!68203 () Bool)

(declare-fun e!136944 () Bool)

(assert (=> d!68203 e!136944))

(declare-fun res!167047 () Bool)

(assert (=> d!68203 (=> (not res!167047) (not e!136944))))

(declare-fun lt!311601 () tuple2!17126)

(declare-fun lt!311599 () tuple2!17126)

(assert (=> d!68203 (= res!167047 (= (bitIndex!0 (size!4458 (buf!4950 (_1!9211 lt!311601))) (currentByte!9297 (_1!9211 lt!311601)) (currentBit!9292 (_1!9211 lt!311601))) (bitIndex!0 (size!4458 (buf!4950 (_1!9211 lt!311599))) (currentByte!9297 (_1!9211 lt!311599)) (currentBit!9292 (_1!9211 lt!311599)))))))

(declare-fun lt!311600 () BitStream!8024)

(assert (=> d!68203 (= lt!311599 (readBitPure!0 lt!311600))))

(assert (=> d!68203 (= lt!311601 (readBitPure!0 lt!309693))))

(assert (=> d!68203 (= lt!311600 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 lt!309693) (currentBit!9292 lt!309693)))))

(assert (=> d!68203 (invariant!0 (currentBit!9292 lt!309693) (currentByte!9297 lt!309693) (size!4458 (buf!4950 (_2!9210 lt!309690))))))

(assert (=> d!68203 true))

(declare-fun _$9!81 () Unit!14062)

(assert (=> d!68203 (= (choose!50 lt!309693 (_2!9210 lt!309690) lt!310164 lt!310162 (tuple2!17127 (_1!9211 lt!310162) (_2!9211 lt!310162)) (_1!9211 lt!310162) (_2!9211 lt!310162) lt!310163 (tuple2!17127 (_1!9211 lt!310163) (_2!9211 lt!310163)) (_1!9211 lt!310163) (_2!9211 lt!310163)) _$9!81)))

(declare-fun b!199563 () Bool)

(assert (=> b!199563 (= e!136944 (= (_2!9211 lt!311601) (_2!9211 lt!311599)))))

(assert (= (and d!68203 res!167047) b!199563))

(assert (=> d!68203 m!307679))

(declare-fun m!309583 () Bool)

(assert (=> d!68203 m!309583))

(assert (=> d!68203 m!308069))

(declare-fun m!309585 () Bool)

(assert (=> d!68203 m!309585))

(declare-fun m!309587 () Bool)

(assert (=> d!68203 m!309587))

(assert (=> d!67667 d!68203))

(declare-fun d!68205 () Bool)

(declare-fun e!136945 () Bool)

(assert (=> d!68205 e!136945))

(declare-fun res!167049 () Bool)

(assert (=> d!68205 (=> (not res!167049) (not e!136945))))

(declare-fun lt!311603 () (_ BitVec 64))

(declare-fun lt!311606 () (_ BitVec 64))

(declare-fun lt!311607 () (_ BitVec 64))

(assert (=> d!68205 (= res!167049 (= lt!311607 (bvsub lt!311606 lt!311603)))))

(assert (=> d!68205 (or (= (bvand lt!311606 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311603 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311606 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311606 lt!311603) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68205 (= lt!311603 (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!310163)))) ((_ sign_extend 32) (currentByte!9297 (_1!9211 lt!310163))) ((_ sign_extend 32) (currentBit!9292 (_1!9211 lt!310163)))))))

(declare-fun lt!311602 () (_ BitVec 64))

(declare-fun lt!311605 () (_ BitVec 64))

(assert (=> d!68205 (= lt!311606 (bvmul lt!311602 lt!311605))))

(assert (=> d!68205 (or (= lt!311602 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311605 (bvsdiv (bvmul lt!311602 lt!311605) lt!311602)))))

(assert (=> d!68205 (= lt!311605 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68205 (= lt!311602 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!310163)))))))

(assert (=> d!68205 (= lt!311607 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 (_1!9211 lt!310163))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 (_1!9211 lt!310163)))))))

(assert (=> d!68205 (invariant!0 (currentBit!9292 (_1!9211 lt!310163)) (currentByte!9297 (_1!9211 lt!310163)) (size!4458 (buf!4950 (_1!9211 lt!310163))))))

(assert (=> d!68205 (= (bitIndex!0 (size!4458 (buf!4950 (_1!9211 lt!310163))) (currentByte!9297 (_1!9211 lt!310163)) (currentBit!9292 (_1!9211 lt!310163))) lt!311607)))

(declare-fun b!199564 () Bool)

(declare-fun res!167048 () Bool)

(assert (=> b!199564 (=> (not res!167048) (not e!136945))))

(assert (=> b!199564 (= res!167048 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311607))))

(declare-fun b!199565 () Bool)

(declare-fun lt!311604 () (_ BitVec 64))

(assert (=> b!199565 (= e!136945 (bvsle lt!311607 (bvmul lt!311604 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199565 (or (= lt!311604 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311604 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311604)))))

(assert (=> b!199565 (= lt!311604 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!310163)))))))

(assert (= (and d!68205 res!167049) b!199564))

(assert (= (and b!199564 res!167048) b!199565))

(declare-fun m!309589 () Bool)

(assert (=> d!68205 m!309589))

(declare-fun m!309591 () Bool)

(assert (=> d!68205 m!309591))

(assert (=> d!67667 d!68205))

(declare-fun d!68207 () Bool)

(declare-fun lt!311608 () tuple2!17140)

(assert (=> d!68207 (= lt!311608 (readBit!0 lt!310164))))

(assert (=> d!68207 (= (readBitPure!0 lt!310164) (tuple2!17127 (_2!9218 lt!311608) (_1!9218 lt!311608)))))

(declare-fun bs!16824 () Bool)

(assert (= bs!16824 d!68207))

(declare-fun m!309593 () Bool)

(assert (=> bs!16824 m!309593))

(assert (=> d!67667 d!68207))

(declare-fun d!68209 () Bool)

(declare-fun e!136946 () Bool)

(assert (=> d!68209 e!136946))

(declare-fun res!167051 () Bool)

(assert (=> d!68209 (=> (not res!167051) (not e!136946))))

(declare-fun lt!311613 () (_ BitVec 64))

(declare-fun lt!311614 () (_ BitVec 64))

(declare-fun lt!311610 () (_ BitVec 64))

(assert (=> d!68209 (= res!167051 (= lt!311614 (bvsub lt!311613 lt!311610)))))

(assert (=> d!68209 (or (= (bvand lt!311613 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311610 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311613 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311613 lt!311610) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68209 (= lt!311610 (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!310075)))) ((_ sign_extend 32) (currentByte!9297 (_1!9211 lt!310075))) ((_ sign_extend 32) (currentBit!9292 (_1!9211 lt!310075)))))))

(declare-fun lt!311609 () (_ BitVec 64))

(declare-fun lt!311612 () (_ BitVec 64))

(assert (=> d!68209 (= lt!311613 (bvmul lt!311609 lt!311612))))

(assert (=> d!68209 (or (= lt!311609 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311612 (bvsdiv (bvmul lt!311609 lt!311612) lt!311609)))))

(assert (=> d!68209 (= lt!311612 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68209 (= lt!311609 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!310075)))))))

(assert (=> d!68209 (= lt!311614 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 (_1!9211 lt!310075))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 (_1!9211 lt!310075)))))))

(assert (=> d!68209 (invariant!0 (currentBit!9292 (_1!9211 lt!310075)) (currentByte!9297 (_1!9211 lt!310075)) (size!4458 (buf!4950 (_1!9211 lt!310075))))))

(assert (=> d!68209 (= (bitIndex!0 (size!4458 (buf!4950 (_1!9211 lt!310075))) (currentByte!9297 (_1!9211 lt!310075)) (currentBit!9292 (_1!9211 lt!310075))) lt!311614)))

(declare-fun b!199566 () Bool)

(declare-fun res!167050 () Bool)

(assert (=> b!199566 (=> (not res!167050) (not e!136946))))

(assert (=> b!199566 (= res!167050 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311614))))

(declare-fun b!199567 () Bool)

(declare-fun lt!311611 () (_ BitVec 64))

(assert (=> b!199567 (= e!136946 (bvsle lt!311614 (bvmul lt!311611 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199567 (or (= lt!311611 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311611 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311611)))))

(assert (=> b!199567 (= lt!311611 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!310075)))))))

(assert (= (and d!68209 res!167051) b!199566))

(assert (= (and b!199566 res!167050) b!199567))

(declare-fun m!309595 () Bool)

(assert (=> d!68209 m!309595))

(declare-fun m!309597 () Bool)

(assert (=> d!68209 m!309597))

(assert (=> b!198864 d!68209))

(assert (=> b!198864 d!68093))

(declare-fun d!68211 () Bool)

(assert (=> d!68211 (isPrefixOf!0 (_2!9210 lt!309686) (_2!9210 lt!309686))))

(declare-fun lt!311617 () Unit!14062)

(declare-fun choose!11 (BitStream!8024) Unit!14062)

(assert (=> d!68211 (= lt!311617 (choose!11 (_2!9210 lt!309686)))))

(assert (=> d!68211 (= (lemmaIsPrefixRefl!0 (_2!9210 lt!309686)) lt!311617)))

(declare-fun bs!16826 () Bool)

(assert (= bs!16826 d!68211))

(assert (=> bs!16826 m!308099))

(declare-fun m!309599 () Bool)

(assert (=> bs!16826 m!309599))

(assert (=> b!199079 d!68211))

(declare-fun d!68213 () Bool)

(declare-fun e!136947 () Bool)

(assert (=> d!68213 e!136947))

(declare-fun res!167052 () Bool)

(assert (=> d!68213 (=> (not res!167052) (not e!136947))))

(assert (=> d!68213 (= res!167052 (= (buf!4950 (_2!9210 (increaseBitIndex!0 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204))))) (buf!4950 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)))))))

(declare-fun lt!311623 () Bool)

(assert (=> d!68213 (= lt!311623 (not (= (bvand ((_ sign_extend 24) (select (arr!5388 (buf!4950 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)))) (currentByte!9297 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9292 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!311621 () tuple2!17140)

(assert (=> d!68213 (= lt!311621 (tuple2!17141 (not (= (bvand ((_ sign_extend 24) (select (arr!5388 (buf!4950 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)))) (currentByte!9297 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9292 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)))))) #b00000000000000000000000000000000)) (_2!9210 (increaseBitIndex!0 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204))))))))

(assert (=> d!68213 (validate_offset_bit!0 ((_ sign_extend 32) (size!4458 (buf!4950 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204))))) ((_ sign_extend 32) (currentByte!9297 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)))) ((_ sign_extend 32) (currentBit!9292 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)))))))

(assert (=> d!68213 (= (readBit!0 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204))) lt!311621)))

(declare-fun lt!311619 () (_ BitVec 64))

(declare-fun lt!311624 () (_ BitVec 64))

(declare-fun b!199568 () Bool)

(assert (=> b!199568 (= e!136947 (= (bitIndex!0 (size!4458 (buf!4950 (_2!9210 (increaseBitIndex!0 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)))))) (currentByte!9297 (_2!9210 (increaseBitIndex!0 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204))))) (currentBit!9292 (_2!9210 (increaseBitIndex!0 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)))))) (bvadd lt!311619 lt!311624)))))

(assert (=> b!199568 (or (not (= (bvand lt!311619 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311624 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!311619 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!311619 lt!311624) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199568 (= lt!311624 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!199568 (= lt!311619 (bitIndex!0 (size!4458 (buf!4950 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)))) (currentByte!9297 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204))) (currentBit!9292 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)))))))

(declare-fun lt!311620 () Bool)

(assert (=> b!199568 (= lt!311620 (not (= (bvand ((_ sign_extend 24) (select (arr!5388 (buf!4950 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)))) (currentByte!9297 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9292 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!311622 () Bool)

(assert (=> b!199568 (= lt!311622 (not (= (bvand ((_ sign_extend 24) (select (arr!5388 (buf!4950 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)))) (currentByte!9297 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9292 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!311618 () Bool)

(assert (=> b!199568 (= lt!311618 (not (= (bvand ((_ sign_extend 24) (select (arr!5388 (buf!4950 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)))) (currentByte!9297 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9292 (BitStream!8025 (buf!4950 (_2!9210 lt!309690)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!68213 res!167052) b!199568))

(declare-fun m!309601 () Bool)

(assert (=> d!68213 m!309601))

(declare-fun m!309603 () Bool)

(assert (=> d!68213 m!309603))

(declare-fun m!309605 () Bool)

(assert (=> d!68213 m!309605))

(declare-fun m!309607 () Bool)

(assert (=> d!68213 m!309607))

(declare-fun m!309609 () Bool)

(assert (=> b!199568 m!309609))

(assert (=> b!199568 m!309605))

(declare-fun m!309611 () Bool)

(assert (=> b!199568 m!309611))

(assert (=> b!199568 m!309601))

(assert (=> b!199568 m!309603))

(assert (=> d!67665 d!68213))

(declare-fun d!68215 () Bool)

(declare-fun res!167055 () Bool)

(declare-fun e!136948 () Bool)

(assert (=> d!68215 (=> (not res!167055) (not e!136948))))

(assert (=> d!68215 (= res!167055 (= (size!4458 (buf!4950 (_2!9210 lt!309686))) (size!4458 (buf!4950 (ite c!9919 (_2!9210 lt!309686) (_2!9210 lt!310754))))))))

(assert (=> d!68215 (= (isPrefixOf!0 (_2!9210 lt!309686) (ite c!9919 (_2!9210 lt!309686) (_2!9210 lt!310754))) e!136948)))

(declare-fun b!199569 () Bool)

(declare-fun res!167053 () Bool)

(assert (=> b!199569 (=> (not res!167053) (not e!136948))))

(assert (=> b!199569 (= res!167053 (bvsle (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))) (bitIndex!0 (size!4458 (buf!4950 (ite c!9919 (_2!9210 lt!309686) (_2!9210 lt!310754)))) (currentByte!9297 (ite c!9919 (_2!9210 lt!309686) (_2!9210 lt!310754))) (currentBit!9292 (ite c!9919 (_2!9210 lt!309686) (_2!9210 lt!310754))))))))

(declare-fun b!199570 () Bool)

(declare-fun e!136949 () Bool)

(assert (=> b!199570 (= e!136948 e!136949)))

(declare-fun res!167054 () Bool)

(assert (=> b!199570 (=> res!167054 e!136949)))

(assert (=> b!199570 (= res!167054 (= (size!4458 (buf!4950 (_2!9210 lt!309686))) #b00000000000000000000000000000000))))

(declare-fun b!199571 () Bool)

(assert (=> b!199571 (= e!136949 (arrayBitRangesEq!0 (buf!4950 (_2!9210 lt!309686)) (buf!4950 (ite c!9919 (_2!9210 lt!309686) (_2!9210 lt!310754))) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686)))))))

(assert (= (and d!68215 res!167055) b!199569))

(assert (= (and b!199569 res!167053) b!199570))

(assert (= (and b!199570 (not res!167054)) b!199571))

(assert (=> b!199569 m!307719))

(declare-fun m!309613 () Bool)

(assert (=> b!199569 m!309613))

(assert (=> b!199571 m!307719))

(assert (=> b!199571 m!307719))

(declare-fun m!309615 () Bool)

(assert (=> b!199571 m!309615))

(assert (=> bm!3140 d!68215))

(assert (=> d!67673 d!68211))

(declare-fun d!68217 () Bool)

(declare-fun res!167058 () Bool)

(declare-fun e!136950 () Bool)

(assert (=> d!68217 (=> (not res!167058) (not e!136950))))

(assert (=> d!68217 (= res!167058 (= (size!4458 (buf!4950 lt!310177)) (size!4458 (buf!4950 (_2!9210 lt!309690)))))))

(assert (=> d!68217 (= (isPrefixOf!0 lt!310177 (_2!9210 lt!309690)) e!136950)))

(declare-fun b!199572 () Bool)

(declare-fun res!167056 () Bool)

(assert (=> b!199572 (=> (not res!167056) (not e!136950))))

(assert (=> b!199572 (= res!167056 (bvsle (bitIndex!0 (size!4458 (buf!4950 lt!310177)) (currentByte!9297 lt!310177) (currentBit!9292 lt!310177)) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309690))) (currentByte!9297 (_2!9210 lt!309690)) (currentBit!9292 (_2!9210 lt!309690)))))))

(declare-fun b!199573 () Bool)

(declare-fun e!136951 () Bool)

(assert (=> b!199573 (= e!136950 e!136951)))

(declare-fun res!167057 () Bool)

(assert (=> b!199573 (=> res!167057 e!136951)))

(assert (=> b!199573 (= res!167057 (= (size!4458 (buf!4950 lt!310177)) #b00000000000000000000000000000000))))

(declare-fun b!199574 () Bool)

(assert (=> b!199574 (= e!136951 (arrayBitRangesEq!0 (buf!4950 lt!310177) (buf!4950 (_2!9210 lt!309690)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4458 (buf!4950 lt!310177)) (currentByte!9297 lt!310177) (currentBit!9292 lt!310177))))))

(assert (= (and d!68217 res!167058) b!199572))

(assert (= (and b!199572 res!167056) b!199573))

(assert (= (and b!199573 (not res!167057)) b!199574))

(declare-fun m!309617 () Bool)

(assert (=> b!199572 m!309617))

(assert (=> b!199572 m!307653))

(assert (=> b!199574 m!309617))

(assert (=> b!199574 m!309617))

(declare-fun m!309619 () Bool)

(assert (=> b!199574 m!309619))

(assert (=> d!67673 d!68217))

(declare-fun d!68219 () Bool)

(assert (=> d!68219 (isPrefixOf!0 lt!310177 (_2!9210 lt!309690))))

(declare-fun lt!311625 () Unit!14062)

(assert (=> d!68219 (= lt!311625 (choose!30 lt!310177 (_2!9210 lt!309686) (_2!9210 lt!309690)))))

(assert (=> d!68219 (isPrefixOf!0 lt!310177 (_2!9210 lt!309686))))

(assert (=> d!68219 (= (lemmaIsPrefixTransitive!0 lt!310177 (_2!9210 lt!309686) (_2!9210 lt!309690)) lt!311625)))

(declare-fun bs!16827 () Bool)

(assert (= bs!16827 d!68219))

(assert (=> bs!16827 m!308087))

(declare-fun m!309621 () Bool)

(assert (=> bs!16827 m!309621))

(declare-fun m!309623 () Bool)

(assert (=> bs!16827 m!309623))

(assert (=> d!67673 d!68219))

(declare-fun d!68221 () Bool)

(assert (=> d!68221 (isPrefixOf!0 lt!310177 (_2!9210 lt!309690))))

(declare-fun lt!311626 () Unit!14062)

(assert (=> d!68221 (= lt!311626 (choose!30 lt!310177 (_2!9210 lt!309690) (_2!9210 lt!309690)))))

(assert (=> d!68221 (isPrefixOf!0 lt!310177 (_2!9210 lt!309690))))

(assert (=> d!68221 (= (lemmaIsPrefixTransitive!0 lt!310177 (_2!9210 lt!309690) (_2!9210 lt!309690)) lt!311626)))

(declare-fun bs!16828 () Bool)

(assert (= bs!16828 d!68221))

(assert (=> bs!16828 m!308087))

(declare-fun m!309625 () Bool)

(assert (=> bs!16828 m!309625))

(assert (=> bs!16828 m!308087))

(assert (=> d!67673 d!68221))

(declare-fun d!68223 () Bool)

(declare-fun res!167061 () Bool)

(declare-fun e!136952 () Bool)

(assert (=> d!68223 (=> (not res!167061) (not e!136952))))

(assert (=> d!68223 (= res!167061 (= (size!4458 (buf!4950 (_2!9210 lt!309686))) (size!4458 (buf!4950 (_2!9210 lt!309686)))))))

(assert (=> d!68223 (= (isPrefixOf!0 (_2!9210 lt!309686) (_2!9210 lt!309686)) e!136952)))

(declare-fun b!199575 () Bool)

(declare-fun res!167059 () Bool)

(assert (=> b!199575 (=> (not res!167059) (not e!136952))))

(assert (=> b!199575 (= res!167059 (bvsle (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686))) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686)))))))

(declare-fun b!199576 () Bool)

(declare-fun e!136953 () Bool)

(assert (=> b!199576 (= e!136952 e!136953)))

(declare-fun res!167060 () Bool)

(assert (=> b!199576 (=> res!167060 e!136953)))

(assert (=> b!199576 (= res!167060 (= (size!4458 (buf!4950 (_2!9210 lt!309686))) #b00000000000000000000000000000000))))

(declare-fun b!199577 () Bool)

(assert (=> b!199577 (= e!136953 (arrayBitRangesEq!0 (buf!4950 (_2!9210 lt!309686)) (buf!4950 (_2!9210 lt!309686)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309686))) (currentByte!9297 (_2!9210 lt!309686)) (currentBit!9292 (_2!9210 lt!309686)))))))

(assert (= (and d!68223 res!167061) b!199575))

(assert (= (and b!199575 res!167059) b!199576))

(assert (= (and b!199576 (not res!167060)) b!199577))

(assert (=> b!199575 m!307719))

(assert (=> b!199575 m!307719))

(assert (=> b!199577 m!307719))

(assert (=> b!199577 m!307719))

(declare-fun m!309627 () Bool)

(assert (=> b!199577 m!309627))

(assert (=> d!67673 d!68223))

(declare-fun d!68225 () Bool)

(declare-fun res!167064 () Bool)

(declare-fun e!136954 () Bool)

(assert (=> d!68225 (=> (not res!167064) (not e!136954))))

(assert (=> d!68225 (= res!167064 (= (size!4458 (buf!4950 (_1!9212 lt!310188))) (size!4458 (buf!4950 (_2!9212 lt!310188)))))))

(assert (=> d!68225 (= (isPrefixOf!0 (_1!9212 lt!310188) (_2!9212 lt!310188)) e!136954)))

(declare-fun b!199578 () Bool)

(declare-fun res!167062 () Bool)

(assert (=> b!199578 (=> (not res!167062) (not e!136954))))

(assert (=> b!199578 (= res!167062 (bvsle (bitIndex!0 (size!4458 (buf!4950 (_1!9212 lt!310188))) (currentByte!9297 (_1!9212 lt!310188)) (currentBit!9292 (_1!9212 lt!310188))) (bitIndex!0 (size!4458 (buf!4950 (_2!9212 lt!310188))) (currentByte!9297 (_2!9212 lt!310188)) (currentBit!9292 (_2!9212 lt!310188)))))))

(declare-fun b!199579 () Bool)

(declare-fun e!136955 () Bool)

(assert (=> b!199579 (= e!136954 e!136955)))

(declare-fun res!167063 () Bool)

(assert (=> b!199579 (=> res!167063 e!136955)))

(assert (=> b!199579 (= res!167063 (= (size!4458 (buf!4950 (_1!9212 lt!310188))) #b00000000000000000000000000000000))))

(declare-fun b!199580 () Bool)

(assert (=> b!199580 (= e!136955 (arrayBitRangesEq!0 (buf!4950 (_1!9212 lt!310188)) (buf!4950 (_2!9212 lt!310188)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4458 (buf!4950 (_1!9212 lt!310188))) (currentByte!9297 (_1!9212 lt!310188)) (currentBit!9292 (_1!9212 lt!310188)))))))

(assert (= (and d!68225 res!167064) b!199578))

(assert (= (and b!199578 res!167062) b!199579))

(assert (= (and b!199579 (not res!167063)) b!199580))

(assert (=> b!199578 m!309187))

(assert (=> b!199578 m!309529))

(assert (=> b!199580 m!309187))

(assert (=> b!199580 m!309187))

(declare-fun m!309629 () Bool)

(assert (=> b!199580 m!309629))

(assert (=> d!67673 d!68225))

(declare-fun d!68227 () Bool)

(declare-fun res!167067 () Bool)

(declare-fun e!136956 () Bool)

(assert (=> d!68227 (=> (not res!167067) (not e!136956))))

(assert (=> d!68227 (= res!167067 (= (size!4458 (buf!4950 lt!310177)) (size!4458 (buf!4950 lt!310177))))))

(assert (=> d!68227 (= (isPrefixOf!0 lt!310177 lt!310177) e!136956)))

(declare-fun b!199581 () Bool)

(declare-fun res!167065 () Bool)

(assert (=> b!199581 (=> (not res!167065) (not e!136956))))

(assert (=> b!199581 (= res!167065 (bvsle (bitIndex!0 (size!4458 (buf!4950 lt!310177)) (currentByte!9297 lt!310177) (currentBit!9292 lt!310177)) (bitIndex!0 (size!4458 (buf!4950 lt!310177)) (currentByte!9297 lt!310177) (currentBit!9292 lt!310177))))))

(declare-fun b!199582 () Bool)

(declare-fun e!136957 () Bool)

(assert (=> b!199582 (= e!136956 e!136957)))

(declare-fun res!167066 () Bool)

(assert (=> b!199582 (=> res!167066 e!136957)))

(assert (=> b!199582 (= res!167066 (= (size!4458 (buf!4950 lt!310177)) #b00000000000000000000000000000000))))

(declare-fun b!199583 () Bool)

(assert (=> b!199583 (= e!136957 (arrayBitRangesEq!0 (buf!4950 lt!310177) (buf!4950 lt!310177) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4458 (buf!4950 lt!310177)) (currentByte!9297 lt!310177) (currentBit!9292 lt!310177))))))

(assert (= (and d!68227 res!167067) b!199581))

(assert (= (and b!199581 res!167065) b!199582))

(assert (= (and b!199582 (not res!167066)) b!199583))

(assert (=> b!199581 m!309617))

(assert (=> b!199581 m!309617))

(assert (=> b!199583 m!309617))

(assert (=> b!199583 m!309617))

(declare-fun m!309631 () Bool)

(assert (=> b!199583 m!309631))

(assert (=> d!67673 d!68227))

(declare-fun d!68229 () Bool)

(assert (=> d!68229 (isPrefixOf!0 lt!310177 lt!310177)))

(declare-fun lt!311627 () Unit!14062)

(assert (=> d!68229 (= lt!311627 (choose!11 lt!310177))))

(assert (=> d!68229 (= (lemmaIsPrefixRefl!0 lt!310177) lt!311627)))

(declare-fun bs!16829 () Bool)

(assert (= bs!16829 d!68229))

(assert (=> bs!16829 m!308085))

(declare-fun m!309633 () Bool)

(assert (=> bs!16829 m!309633))

(assert (=> d!67673 d!68229))

(declare-fun d!68231 () Bool)

(declare-fun res!167070 () Bool)

(declare-fun e!136958 () Bool)

(assert (=> d!68231 (=> (not res!167070) (not e!136958))))

(assert (=> d!68231 (= res!167070 (= (size!4458 (buf!4950 (_2!9210 lt!309690))) (size!4458 (buf!4950 (_2!9210 lt!309690)))))))

(assert (=> d!68231 (= (isPrefixOf!0 (_2!9210 lt!309690) (_2!9210 lt!309690)) e!136958)))

(declare-fun b!199584 () Bool)

(declare-fun res!167068 () Bool)

(assert (=> b!199584 (=> (not res!167068) (not e!136958))))

(assert (=> b!199584 (= res!167068 (bvsle (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309690))) (currentByte!9297 (_2!9210 lt!309690)) (currentBit!9292 (_2!9210 lt!309690))) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309690))) (currentByte!9297 (_2!9210 lt!309690)) (currentBit!9292 (_2!9210 lt!309690)))))))

(declare-fun b!199585 () Bool)

(declare-fun e!136959 () Bool)

(assert (=> b!199585 (= e!136958 e!136959)))

(declare-fun res!167069 () Bool)

(assert (=> b!199585 (=> res!167069 e!136959)))

(assert (=> b!199585 (= res!167069 (= (size!4458 (buf!4950 (_2!9210 lt!309690))) #b00000000000000000000000000000000))))

(declare-fun b!199586 () Bool)

(assert (=> b!199586 (= e!136959 (arrayBitRangesEq!0 (buf!4950 (_2!9210 lt!309690)) (buf!4950 (_2!9210 lt!309690)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309690))) (currentByte!9297 (_2!9210 lt!309690)) (currentBit!9292 (_2!9210 lt!309690)))))))

(assert (= (and d!68231 res!167070) b!199584))

(assert (= (and b!199584 res!167068) b!199585))

(assert (= (and b!199585 (not res!167069)) b!199586))

(assert (=> b!199584 m!307653))

(assert (=> b!199584 m!307653))

(assert (=> b!199586 m!307653))

(assert (=> b!199586 m!307653))

(declare-fun m!309635 () Bool)

(assert (=> b!199586 m!309635))

(assert (=> d!67673 d!68231))

(assert (=> d!67673 d!67605))

(declare-fun d!68233 () Bool)

(assert (=> d!68233 (isPrefixOf!0 (_2!9210 lt!309690) (_2!9210 lt!309690))))

(declare-fun lt!311628 () Unit!14062)

(assert (=> d!68233 (= lt!311628 (choose!11 (_2!9210 lt!309690)))))

(assert (=> d!68233 (= (lemmaIsPrefixRefl!0 (_2!9210 lt!309690)) lt!311628)))

(declare-fun bs!16830 () Bool)

(assert (= bs!16830 d!68233))

(assert (=> bs!16830 m!308035))

(declare-fun m!309637 () Bool)

(assert (=> bs!16830 m!309637))

(assert (=> d!67673 d!68233))

(declare-fun d!68235 () Bool)

(declare-fun e!136960 () Bool)

(assert (=> d!68235 e!136960))

(declare-fun res!167072 () Bool)

(assert (=> d!68235 (=> (not res!167072) (not e!136960))))

(declare-fun lt!311634 () (_ BitVec 64))

(declare-fun lt!311633 () (_ BitVec 64))

(declare-fun lt!311630 () (_ BitVec 64))

(assert (=> d!68235 (= res!167072 (= lt!311634 (bvsub lt!311633 lt!311630)))))

(assert (=> d!68235 (or (= (bvand lt!311633 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!311630 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!311633 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!311633 lt!311630) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68235 (= lt!311630 (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!310727)))) ((_ sign_extend 32) (currentByte!9297 (_1!9211 lt!310727))) ((_ sign_extend 32) (currentBit!9292 (_1!9211 lt!310727)))))))

(declare-fun lt!311629 () (_ BitVec 64))

(declare-fun lt!311632 () (_ BitVec 64))

(assert (=> d!68235 (= lt!311633 (bvmul lt!311629 lt!311632))))

(assert (=> d!68235 (or (= lt!311629 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!311632 (bvsdiv (bvmul lt!311629 lt!311632) lt!311629)))))

(assert (=> d!68235 (= lt!311632 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68235 (= lt!311629 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!310727)))))))

(assert (=> d!68235 (= lt!311634 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 (_1!9211 lt!310727))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 (_1!9211 lt!310727)))))))

(assert (=> d!68235 (invariant!0 (currentBit!9292 (_1!9211 lt!310727)) (currentByte!9297 (_1!9211 lt!310727)) (size!4458 (buf!4950 (_1!9211 lt!310727))))))

(assert (=> d!68235 (= (bitIndex!0 (size!4458 (buf!4950 (_1!9211 lt!310727))) (currentByte!9297 (_1!9211 lt!310727)) (currentBit!9292 (_1!9211 lt!310727))) lt!311634)))

(declare-fun b!199587 () Bool)

(declare-fun res!167071 () Bool)

(assert (=> b!199587 (=> (not res!167071) (not e!136960))))

(assert (=> b!199587 (= res!167071 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!311634))))

(declare-fun b!199588 () Bool)

(declare-fun lt!311631 () (_ BitVec 64))

(assert (=> b!199588 (= e!136960 (bvsle lt!311634 (bvmul lt!311631 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!199588 (or (= lt!311631 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!311631 #b0000000000000000000000000000000000000000000000000000000000001000) lt!311631)))))

(assert (=> b!199588 (= lt!311631 ((_ sign_extend 32) (size!4458 (buf!4950 (_1!9211 lt!310727)))))))

(assert (= (and d!68235 res!167072) b!199587))

(assert (= (and b!199587 res!167071) b!199588))

(declare-fun m!309639 () Bool)

(assert (=> d!68235 m!309639))

(declare-fun m!309641 () Bool)

(assert (=> d!68235 m!309641))

(assert (=> b!199073 d!68235))

(assert (=> b!199073 d!68069))

(assert (=> d!67655 d!67685))

(declare-fun d!68237 () Bool)

(assert (=> d!68237 (isPrefixOf!0 lt!310139 lt!310139)))

(declare-fun lt!311635 () Unit!14062)

(assert (=> d!68237 (= lt!311635 (choose!11 lt!310139))))

(assert (=> d!68237 (= (lemmaIsPrefixRefl!0 lt!310139) lt!311635)))

(declare-fun bs!16831 () Bool)

(assert (= bs!16831 d!68237))

(assert (=> bs!16831 m!308039))

(declare-fun m!309643 () Bool)

(assert (=> bs!16831 m!309643))

(assert (=> d!67655 d!68237))

(declare-fun d!68239 () Bool)

(assert (=> d!68239 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!311636 () Unit!14062)

(assert (=> d!68239 (= lt!311636 (choose!11 thiss!1204))))

(assert (=> d!68239 (= (lemmaIsPrefixRefl!0 thiss!1204) lt!311636)))

(declare-fun bs!16832 () Bool)

(assert (= bs!16832 d!68239))

(assert (=> bs!16832 m!308053))

(declare-fun m!309645 () Bool)

(assert (=> bs!16832 m!309645))

(assert (=> d!67655 d!68239))

(declare-fun d!68241 () Bool)

(declare-fun res!167075 () Bool)

(declare-fun e!136961 () Bool)

(assert (=> d!68241 (=> (not res!167075) (not e!136961))))

(assert (=> d!68241 (= res!167075 (= (size!4458 (buf!4950 thiss!1204)) (size!4458 (buf!4950 thiss!1204))))))

(assert (=> d!68241 (= (isPrefixOf!0 thiss!1204 thiss!1204) e!136961)))

(declare-fun b!199589 () Bool)

(declare-fun res!167073 () Bool)

(assert (=> b!199589 (=> (not res!167073) (not e!136961))))

(assert (=> b!199589 (= res!167073 (bvsle (bitIndex!0 (size!4458 (buf!4950 thiss!1204)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204)) (bitIndex!0 (size!4458 (buf!4950 thiss!1204)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204))))))

(declare-fun b!199590 () Bool)

(declare-fun e!136962 () Bool)

(assert (=> b!199590 (= e!136961 e!136962)))

(declare-fun res!167074 () Bool)

(assert (=> b!199590 (=> res!167074 e!136962)))

(assert (=> b!199590 (= res!167074 (= (size!4458 (buf!4950 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!199591 () Bool)

(assert (=> b!199591 (= e!136962 (arrayBitRangesEq!0 (buf!4950 thiss!1204) (buf!4950 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4458 (buf!4950 thiss!1204)) (currentByte!9297 thiss!1204) (currentBit!9292 thiss!1204))))))

(assert (= (and d!68241 res!167075) b!199589))

(assert (= (and b!199589 res!167073) b!199590))

(assert (= (and b!199590 (not res!167074)) b!199591))

(assert (=> b!199589 m!307721))

(assert (=> b!199589 m!307721))

(assert (=> b!199591 m!307721))

(assert (=> b!199591 m!307721))

(declare-fun m!309647 () Bool)

(assert (=> b!199591 m!309647))

(assert (=> d!67655 d!68241))

(declare-fun d!68243 () Bool)

(assert (=> d!68243 (isPrefixOf!0 lt!310139 (_2!9210 lt!309690))))

(declare-fun lt!311637 () Unit!14062)

(assert (=> d!68243 (= lt!311637 (choose!30 lt!310139 (_2!9210 lt!309690) (_2!9210 lt!309690)))))

(assert (=> d!68243 (isPrefixOf!0 lt!310139 (_2!9210 lt!309690))))

(assert (=> d!68243 (= (lemmaIsPrefixTransitive!0 lt!310139 (_2!9210 lt!309690) (_2!9210 lt!309690)) lt!311637)))

(declare-fun bs!16833 () Bool)

(assert (= bs!16833 d!68243))

(assert (=> bs!16833 m!308041))

(declare-fun m!309649 () Bool)

(assert (=> bs!16833 m!309649))

(assert (=> bs!16833 m!308041))

(assert (=> d!67655 d!68243))

(declare-fun d!68245 () Bool)

(declare-fun res!167078 () Bool)

(declare-fun e!136963 () Bool)

(assert (=> d!68245 (=> (not res!167078) (not e!136963))))

(assert (=> d!68245 (= res!167078 (= (size!4458 (buf!4950 (_1!9212 lt!310150))) (size!4458 (buf!4950 (_2!9212 lt!310150)))))))

(assert (=> d!68245 (= (isPrefixOf!0 (_1!9212 lt!310150) (_2!9212 lt!310150)) e!136963)))

(declare-fun b!199592 () Bool)

(declare-fun res!167076 () Bool)

(assert (=> b!199592 (=> (not res!167076) (not e!136963))))

(assert (=> b!199592 (= res!167076 (bvsle (bitIndex!0 (size!4458 (buf!4950 (_1!9212 lt!310150))) (currentByte!9297 (_1!9212 lt!310150)) (currentBit!9292 (_1!9212 lt!310150))) (bitIndex!0 (size!4458 (buf!4950 (_2!9212 lt!310150))) (currentByte!9297 (_2!9212 lt!310150)) (currentBit!9292 (_2!9212 lt!310150)))))))

(declare-fun b!199593 () Bool)

(declare-fun e!136964 () Bool)

(assert (=> b!199593 (= e!136963 e!136964)))

(declare-fun res!167077 () Bool)

(assert (=> b!199593 (=> res!167077 e!136964)))

(assert (=> b!199593 (= res!167077 (= (size!4458 (buf!4950 (_1!9212 lt!310150))) #b00000000000000000000000000000000))))

(declare-fun b!199594 () Bool)

(assert (=> b!199594 (= e!136964 (arrayBitRangesEq!0 (buf!4950 (_1!9212 lt!310150)) (buf!4950 (_2!9212 lt!310150)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4458 (buf!4950 (_1!9212 lt!310150))) (currentByte!9297 (_1!9212 lt!310150)) (currentBit!9292 (_1!9212 lt!310150)))))))

(assert (= (and d!68245 res!167078) b!199592))

(assert (= (and b!199592 res!167076) b!199593))

(assert (= (and b!199593 (not res!167077)) b!199594))

(assert (=> b!199592 m!309545))

(assert (=> b!199592 m!309081))

(assert (=> b!199594 m!309545))

(assert (=> b!199594 m!309545))

(declare-fun m!309651 () Bool)

(assert (=> b!199594 m!309651))

(assert (=> d!67655 d!68245))

(declare-fun d!68247 () Bool)

(declare-fun res!167081 () Bool)

(declare-fun e!136965 () Bool)

(assert (=> d!68247 (=> (not res!167081) (not e!136965))))

(assert (=> d!68247 (= res!167081 (= (size!4458 (buf!4950 lt!310139)) (size!4458 (buf!4950 (_2!9210 lt!309690)))))))

(assert (=> d!68247 (= (isPrefixOf!0 lt!310139 (_2!9210 lt!309690)) e!136965)))

(declare-fun b!199595 () Bool)

(declare-fun res!167079 () Bool)

(assert (=> b!199595 (=> (not res!167079) (not e!136965))))

(assert (=> b!199595 (= res!167079 (bvsle (bitIndex!0 (size!4458 (buf!4950 lt!310139)) (currentByte!9297 lt!310139) (currentBit!9292 lt!310139)) (bitIndex!0 (size!4458 (buf!4950 (_2!9210 lt!309690))) (currentByte!9297 (_2!9210 lt!309690)) (currentBit!9292 (_2!9210 lt!309690)))))))

(declare-fun b!199596 () Bool)

(declare-fun e!136966 () Bool)

(assert (=> b!199596 (= e!136965 e!136966)))

(declare-fun res!167080 () Bool)

(assert (=> b!199596 (=> res!167080 e!136966)))

(assert (=> b!199596 (= res!167080 (= (size!4458 (buf!4950 lt!310139)) #b00000000000000000000000000000000))))

(declare-fun b!199597 () Bool)

(assert (=> b!199597 (= e!136966 (arrayBitRangesEq!0 (buf!4950 lt!310139) (buf!4950 (_2!9210 lt!309690)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4458 (buf!4950 lt!310139)) (currentByte!9297 lt!310139) (currentBit!9292 lt!310139))))))

(assert (= (and d!68247 res!167081) b!199595))

(assert (= (and b!199595 res!167079) b!199596))

(assert (= (and b!199596 (not res!167080)) b!199597))

(declare-fun m!309653 () Bool)

(assert (=> b!199595 m!309653))

(assert (=> b!199595 m!307653))

(assert (=> b!199597 m!309653))

(assert (=> b!199597 m!309653))

(declare-fun m!309655 () Bool)

(assert (=> b!199597 m!309655))

(assert (=> d!67655 d!68247))

(declare-fun d!68249 () Bool)

(declare-fun res!167084 () Bool)

(declare-fun e!136967 () Bool)

(assert (=> d!68249 (=> (not res!167084) (not e!136967))))

(assert (=> d!68249 (= res!167084 (= (size!4458 (buf!4950 lt!310139)) (size!4458 (buf!4950 lt!310139))))))

(assert (=> d!68249 (= (isPrefixOf!0 lt!310139 lt!310139) e!136967)))

(declare-fun b!199598 () Bool)

(declare-fun res!167082 () Bool)

(assert (=> b!199598 (=> (not res!167082) (not e!136967))))

(assert (=> b!199598 (= res!167082 (bvsle (bitIndex!0 (size!4458 (buf!4950 lt!310139)) (currentByte!9297 lt!310139) (currentBit!9292 lt!310139)) (bitIndex!0 (size!4458 (buf!4950 lt!310139)) (currentByte!9297 lt!310139) (currentBit!9292 lt!310139))))))

(declare-fun b!199599 () Bool)

(declare-fun e!136968 () Bool)

(assert (=> b!199599 (= e!136967 e!136968)))

(declare-fun res!167083 () Bool)

(assert (=> b!199599 (=> res!167083 e!136968)))

(assert (=> b!199599 (= res!167083 (= (size!4458 (buf!4950 lt!310139)) #b00000000000000000000000000000000))))

(declare-fun b!199600 () Bool)

(assert (=> b!199600 (= e!136968 (arrayBitRangesEq!0 (buf!4950 lt!310139) (buf!4950 lt!310139) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4458 (buf!4950 lt!310139)) (currentByte!9297 lt!310139) (currentBit!9292 lt!310139))))))

(assert (= (and d!68249 res!167084) b!199598))

(assert (= (and b!199598 res!167082) b!199599))

(assert (= (and b!199599 (not res!167083)) b!199600))

(assert (=> b!199598 m!309653))

(assert (=> b!199598 m!309653))

(assert (=> b!199600 m!309653))

(assert (=> b!199600 m!309653))

(declare-fun m!309657 () Bool)

(assert (=> b!199600 m!309657))

(assert (=> d!67655 d!68249))

(declare-fun d!68251 () Bool)

(assert (=> d!68251 (isPrefixOf!0 lt!310139 (_2!9210 lt!309690))))

(declare-fun lt!311638 () Unit!14062)

(assert (=> d!68251 (= lt!311638 (choose!30 lt!310139 thiss!1204 (_2!9210 lt!309690)))))

(assert (=> d!68251 (isPrefixOf!0 lt!310139 thiss!1204)))

(assert (=> d!68251 (= (lemmaIsPrefixTransitive!0 lt!310139 thiss!1204 (_2!9210 lt!309690)) lt!311638)))

(declare-fun bs!16834 () Bool)

(assert (= bs!16834 d!68251))

(assert (=> bs!16834 m!308041))

(declare-fun m!309659 () Bool)

(assert (=> bs!16834 m!309659))

(declare-fun m!309661 () Bool)

(assert (=> bs!16834 m!309661))

(assert (=> d!67655 d!68251))

(assert (=> d!67655 d!68231))

(assert (=> d!67655 d!68233))

(declare-fun d!68253 () Bool)

(assert (=> d!68253 (= (remainingBits!0 ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!309690)))) ((_ sign_extend 32) (currentByte!9297 thiss!1204)) ((_ sign_extend 32) (currentBit!9292 thiss!1204))) (bvsub (bvmul ((_ sign_extend 32) (size!4458 (buf!4950 (_2!9210 lt!309690)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9297 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9292 thiss!1204)))))))

(assert (=> d!67681 d!68253))

(push 1)

(assert (not d!68149))

(assert (not b!199526))

(assert (not b!199377))

(assert (not d!68141))

(assert (not bm!3156))

(assert (not b!199536))

(assert (not d!68057))

(assert (not b!199363))

(assert (not d!68205))

(assert (not bm!3153))

(assert (not b!199471))

(assert (not d!68201))

(assert (not d!68115))

(assert (not d!68177))

(assert (not d!68235))

(assert (not b!199510))

(assert (not b!199535))

(assert (not b!199410))

(assert (not d!68163))

(assert (not d!68195))

(assert (not b!199513))

(assert (not d!68165))

(assert (not b!199400))

(assert (not d!68207))

(assert (not b!199581))

(assert (not d!68169))

(assert (not b!199470))

(assert (not d!68093))

(assert (not d!68191))

(assert (not b!199485))

(assert (not d!68085))

(assert (not b!199479))

(assert (not b!199484))

(assert (not b!199583))

(assert (not d!68129))

(assert (not b!199512))

(assert (not d!68071))

(assert (not b!199430))

(assert (not b!199450))

(assert (not b!199486))

(assert (not d!68089))

(assert (not b!199544))

(assert (not b!199507))

(assert (not d!68049))

(assert (not b!199547))

(assert (not b!199498))

(assert (not d!68003))

(assert (not b!199421))

(assert (not d!68123))

(assert (not d!68119))

(assert (not b!199415))

(assert (not d!68143))

(assert (not b!199540))

(assert (not d!68213))

(assert (not d!68145))

(assert (not d!68189))

(assert (not b!199549))

(assert (not b!199502))

(assert (not b!199529))

(assert (not d!68015))

(assert (not d!68193))

(assert (not d!68125))

(assert (not b!199478))

(assert (not d!68157))

(assert (not b!199447))

(assert (not b!199594))

(assert (not d!68019))

(assert (not b!199433))

(assert (not b!199452))

(assert (not d!68079))

(assert (not d!68039))

(assert (not bm!3152))

(assert (not d!68127))

(assert (not d!68031))

(assert (not b!199427))

(assert (not b!199591))

(assert (not d!68033))

(assert (not b!199546))

(assert (not b!199554))

(assert (not b!199401))

(assert (not b!199528))

(assert (not d!68055))

(assert (not b!199413))

(assert (not b!199577))

(assert (not b!199362))

(assert (not d!68147))

(assert (not d!68035))

(assert (not b!199551))

(assert (not b!199456))

(assert (not b!199368))

(assert (not b!199568))

(assert (not d!68171))

(assert (not b!199592))

(assert (not d!68137))

(assert (not b!199569))

(assert (not d!68233))

(assert (not b!199595))

(assert (not d!68211))

(assert (not bm!3151))

(assert (not b!199534))

(assert (not b!199453))

(assert (not d!68239))

(assert (not d!68229))

(assert (not bm!3154))

(assert (not d!68073))

(assert (not d!68097))

(assert (not b!199586))

(assert (not b!199556))

(assert (not d!68135))

(assert (not d!68161))

(assert (not d!68111))

(assert (not d!68243))

(assert (not b!199347))

(assert (not d!68083))

(assert (not d!68203))

(assert (not b!199497))

(assert (not d!68109))

(assert (not b!199345))

(assert (not d!68095))

(assert (not b!199442))

(assert (not b!199445))

(assert (not b!199473))

(assert (not b!199344))

(assert (not b!199451))

(assert (not d!68219))

(assert (not d!68133))

(assert (not b!199508))

(assert (not b!199474))

(assert (not b!199542))

(assert (not b!199500))

(assert (not b!199598))

(assert (not b!199555))

(assert (not b!199429))

(assert (not b!199418))

(assert (not d!68047))

(assert (not b!199578))

(assert (not b!199575))

(assert (not d!68131))

(assert (not b!199543))

(assert (not d!68017))

(assert (not b!199511))

(assert (not d!68179))

(assert (not b!199423))

(assert (not b!199382))

(assert (not b!199444))

(assert (not b!199408))

(assert (not b!199533))

(assert (not d!68007))

(assert (not b!199435))

(assert (not b!199364))

(assert (not b!199449))

(assert (not b!199414))

(assert (not d!68251))

(assert (not d!68061))

(assert (not b!199501))

(assert (not d!68173))

(assert (not b!199597))

(assert (not d!68121))

(assert (not b!199571))

(assert (not b!199495))

(assert (not b!199426))

(assert (not d!68113))

(assert (not b!199399))

(assert (not b!199580))

(assert (not d!68209))

(assert (not b!199365))

(assert (not b!199572))

(assert (not d!68183))

(assert (not b!199574))

(assert (not b!199600))

(assert (not bm!3155))

(assert (not b!199505))

(assert (not b!199509))

(assert (not b!199412))

(assert (not d!68151))

(assert (not d!68043))

(assert (not d!68075))

(assert (not b!199448))

(assert (not b!199422))

(assert (not b!199523))

(assert (not b!199584))

(assert (not b!199477))

(assert (not d!68153))

(assert (not d!68069))

(assert (not b!199589))

(assert (not b!199530))

(assert (not b!199472))

(assert (not d!68221))

(assert (not d!68159))

(assert (not d!68237))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

