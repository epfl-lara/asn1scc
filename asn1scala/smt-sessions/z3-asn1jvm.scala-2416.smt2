; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61578 () Bool)

(assert start!61578)

(declare-fun b!276608 () Bool)

(declare-fun e!196544 () Bool)

(declare-datatypes ((array!15831 0))(
  ( (array!15832 (arr!7847 (Array (_ BitVec 32) (_ BitVec 8))) (size!6854 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12522 0))(
  ( (BitStream!12523 (buf!7322 array!15831) (currentByte!13551 (_ BitVec 32)) (currentBit!13546 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12522)

(declare-fun array_inv!6578 (array!15831) Bool)

(assert (=> b!276608 (= e!196544 (array_inv!6578 (buf!7322 bs1!11)))))

(declare-fun b!276609 () Bool)

(declare-fun res!229806 () Bool)

(declare-fun e!196540 () Bool)

(assert (=> b!276609 (=> (not res!229806) (not e!196540))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276609 (= res!229806 (validate_offset_bit!0 ((_ sign_extend 32) (size!6854 (buf!7322 bs1!11))) ((_ sign_extend 32) (currentByte!13551 bs1!11)) ((_ sign_extend 32) (currentBit!13546 bs1!11))))))

(declare-fun res!229807 () Bool)

(assert (=> start!61578 (=> (not res!229807) (not e!196540))))

(declare-fun bs2!19 () BitStream!12522)

(assert (=> start!61578 (= res!229807 (= (size!6854 (buf!7322 bs1!11)) (size!6854 (buf!7322 bs2!19))))))

(assert (=> start!61578 e!196540))

(declare-fun inv!12 (BitStream!12522) Bool)

(assert (=> start!61578 (and (inv!12 bs1!11) e!196544)))

(declare-fun e!196542 () Bool)

(assert (=> start!61578 (and (inv!12 bs2!19) e!196542)))

(declare-fun lt!414759 () (_ BitVec 64))

(declare-fun e!196539 () Bool)

(declare-fun b!276610 () Bool)

(declare-fun lt!414758 () (_ BitVec 64))

(assert (=> b!276610 (= e!196539 (not (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!414759) (bvsgt lt!414759 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6854 (buf!7322 bs1!11))))) (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414758) (bvslt lt!414758 lt!414759)))))))

(declare-datatypes ((tuple2!22556 0))(
  ( (tuple2!22557 (_1!12325 BitStream!12522) (_2!12325 Bool)) )
))
(declare-fun lt!414756 () tuple2!22556)

(declare-fun readBitPure!0 (BitStream!12522) tuple2!22556)

(assert (=> b!276610 (= lt!414756 (readBitPure!0 (BitStream!12523 (buf!7322 bs2!19) (currentByte!13551 bs1!11) (currentBit!13546 bs1!11))))))

(declare-fun lt!414757 () tuple2!22556)

(assert (=> b!276610 (= lt!414757 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276610 (invariant!0 (currentBit!13546 bs1!11) (currentByte!13551 bs1!11) (size!6854 (buf!7322 bs2!19)))))

(declare-fun b!276611 () Bool)

(assert (=> b!276611 (= e!196542 (array_inv!6578 (buf!7322 bs2!19)))))

(declare-fun b!276612 () Bool)

(assert (=> b!276612 (= e!196540 e!196539)))

(declare-fun res!229805 () Bool)

(assert (=> b!276612 (=> (not res!229805) (not e!196539))))

(declare-fun arrayBitRangesEq!0 (array!15831 array!15831 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276612 (= res!229805 (arrayBitRangesEq!0 (buf!7322 bs1!11) (buf!7322 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414759))))

(assert (=> b!276612 (= lt!414759 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!414758))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!276612 (= lt!414758 (bitIndex!0 (size!6854 (buf!7322 bs1!11)) (currentByte!13551 bs1!11) (currentBit!13546 bs1!11)))))

(assert (= (and start!61578 res!229807) b!276609))

(assert (= (and b!276609 res!229806) b!276612))

(assert (= (and b!276612 res!229805) b!276610))

(assert (= start!61578 b!276608))

(assert (= start!61578 b!276611))

(declare-fun m!409645 () Bool)

(assert (=> b!276611 m!409645))

(declare-fun m!409647 () Bool)

(assert (=> b!276608 m!409647))

(declare-fun m!409649 () Bool)

(assert (=> b!276609 m!409649))

(declare-fun m!409651 () Bool)

(assert (=> start!61578 m!409651))

(declare-fun m!409653 () Bool)

(assert (=> start!61578 m!409653))

(declare-fun m!409655 () Bool)

(assert (=> b!276612 m!409655))

(declare-fun m!409657 () Bool)

(assert (=> b!276612 m!409657))

(declare-fun m!409659 () Bool)

(assert (=> b!276610 m!409659))

(declare-fun m!409661 () Bool)

(assert (=> b!276610 m!409661))

(declare-fun m!409663 () Bool)

(assert (=> b!276610 m!409663))

(check-sat (not start!61578) (not b!276610) (not b!276609) (not b!276608) (not b!276612) (not b!276611))
(check-sat)
(get-model)

(declare-fun d!95282 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!95282 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6854 (buf!7322 bs1!11))) ((_ sign_extend 32) (currentByte!13551 bs1!11)) ((_ sign_extend 32) (currentBit!13546 bs1!11))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6854 (buf!7322 bs1!11))) ((_ sign_extend 32) (currentByte!13551 bs1!11)) ((_ sign_extend 32) (currentBit!13546 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!24034 () Bool)

(assert (= bs!24034 d!95282))

(declare-fun m!409693 () Bool)

(assert (=> bs!24034 m!409693))

(assert (=> b!276609 d!95282))

(declare-fun d!95290 () Bool)

(assert (=> d!95290 (= (array_inv!6578 (buf!7322 bs1!11)) (bvsge (size!6854 (buf!7322 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!276608 d!95290))

(declare-fun e!196616 () Bool)

(declare-datatypes ((tuple4!538 0))(
  ( (tuple4!539 (_1!12330 (_ BitVec 32)) (_2!12330 (_ BitVec 32)) (_3!1049 (_ BitVec 32)) (_4!269 (_ BitVec 32))) )
))
(declare-fun lt!414832 () tuple4!538)

(declare-fun lt!414830 () (_ BitVec 32))

(declare-fun b!276694 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276694 (= e!196616 (byteRangesEq!0 (select (arr!7847 (buf!7322 bs1!11)) (_4!269 lt!414832)) (select (arr!7847 (buf!7322 bs2!19)) (_4!269 lt!414832)) #b00000000000000000000000000000000 lt!414830))))

(declare-fun b!276695 () Bool)

(declare-fun e!196621 () Bool)

(declare-fun e!196617 () Bool)

(assert (=> b!276695 (= e!196621 e!196617)))

(declare-fun res!229871 () Bool)

(declare-fun call!4463 () Bool)

(assert (=> b!276695 (= res!229871 call!4463)))

(assert (=> b!276695 (=> (not res!229871) (not e!196617))))

(declare-fun b!276696 () Bool)

(declare-fun e!196618 () Bool)

(declare-fun e!196620 () Bool)

(assert (=> b!276696 (= e!196618 e!196620)))

(declare-fun res!229867 () Bool)

(assert (=> b!276696 (=> (not res!229867) (not e!196620))))

(declare-fun e!196619 () Bool)

(assert (=> b!276696 (= res!229867 e!196619)))

(declare-fun res!229868 () Bool)

(assert (=> b!276696 (=> res!229868 e!196619)))

(assert (=> b!276696 (= res!229868 (bvsge (_1!12330 lt!414832) (_2!12330 lt!414832)))))

(assert (=> b!276696 (= lt!414830 ((_ extract 31 0) (bvsrem lt!414759 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!414831 () (_ BitVec 32))

(assert (=> b!276696 (= lt!414831 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!538)

(assert (=> b!276696 (= lt!414832 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!414759))))

(declare-fun b!276697 () Bool)

(assert (=> b!276697 (= e!196621 call!4463)))

(declare-fun bm!4460 () Bool)

(declare-fun c!12648 () Bool)

(assert (=> bm!4460 (= call!4463 (byteRangesEq!0 (select (arr!7847 (buf!7322 bs1!11)) (_3!1049 lt!414832)) (select (arr!7847 (buf!7322 bs2!19)) (_3!1049 lt!414832)) lt!414831 (ite c!12648 lt!414830 #b00000000000000000000000000001000)))))

(declare-fun b!276699 () Bool)

(declare-fun res!229870 () Bool)

(assert (=> b!276699 (= res!229870 (= lt!414830 #b00000000000000000000000000000000))))

(assert (=> b!276699 (=> res!229870 e!196616)))

(assert (=> b!276699 (= e!196617 e!196616)))

(declare-fun b!276700 () Bool)

(declare-fun arrayRangesEq!1162 (array!15831 array!15831 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276700 (= e!196619 (arrayRangesEq!1162 (buf!7322 bs1!11) (buf!7322 bs2!19) (_1!12330 lt!414832) (_2!12330 lt!414832)))))

(declare-fun d!95294 () Bool)

(declare-fun res!229869 () Bool)

(assert (=> d!95294 (=> res!229869 e!196618)))

(assert (=> d!95294 (= res!229869 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!414759))))

(assert (=> d!95294 (= (arrayBitRangesEq!0 (buf!7322 bs1!11) (buf!7322 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414759) e!196618)))

(declare-fun b!276698 () Bool)

(assert (=> b!276698 (= e!196620 e!196621)))

(assert (=> b!276698 (= c!12648 (= (_3!1049 lt!414832) (_4!269 lt!414832)))))

(assert (= (and d!95294 (not res!229869)) b!276696))

(assert (= (and b!276696 (not res!229868)) b!276700))

(assert (= (and b!276696 res!229867) b!276698))

(assert (= (and b!276698 c!12648) b!276697))

(assert (= (and b!276698 (not c!12648)) b!276695))

(assert (= (and b!276695 res!229871) b!276699))

(assert (= (and b!276699 (not res!229870)) b!276694))

(assert (= (or b!276697 b!276695) bm!4460))

(declare-fun m!409729 () Bool)

(assert (=> b!276694 m!409729))

(declare-fun m!409731 () Bool)

(assert (=> b!276694 m!409731))

(assert (=> b!276694 m!409729))

(assert (=> b!276694 m!409731))

(declare-fun m!409733 () Bool)

(assert (=> b!276694 m!409733))

(declare-fun m!409735 () Bool)

(assert (=> b!276696 m!409735))

(declare-fun m!409737 () Bool)

(assert (=> bm!4460 m!409737))

(declare-fun m!409739 () Bool)

(assert (=> bm!4460 m!409739))

(assert (=> bm!4460 m!409737))

(assert (=> bm!4460 m!409739))

(declare-fun m!409741 () Bool)

(assert (=> bm!4460 m!409741))

(declare-fun m!409743 () Bool)

(assert (=> b!276700 m!409743))

(assert (=> b!276612 d!95294))

(declare-fun d!95302 () Bool)

(declare-fun e!196625 () Bool)

(assert (=> d!95302 e!196625))

(declare-fun res!229878 () Bool)

(assert (=> d!95302 (=> (not res!229878) (not e!196625))))

(declare-fun lt!414860 () (_ BitVec 64))

(declare-fun lt!414855 () (_ BitVec 64))

(declare-fun lt!414859 () (_ BitVec 64))

(assert (=> d!95302 (= res!229878 (= lt!414855 (bvsub lt!414860 lt!414859)))))

(assert (=> d!95302 (or (= (bvand lt!414860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414859 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414860 lt!414859) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!95302 (= lt!414859 (remainingBits!0 ((_ sign_extend 32) (size!6854 (buf!7322 bs1!11))) ((_ sign_extend 32) (currentByte!13551 bs1!11)) ((_ sign_extend 32) (currentBit!13546 bs1!11))))))

(declare-fun lt!414856 () (_ BitVec 64))

(declare-fun lt!414858 () (_ BitVec 64))

(assert (=> d!95302 (= lt!414860 (bvmul lt!414856 lt!414858))))

(assert (=> d!95302 (or (= lt!414856 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!414858 (bvsdiv (bvmul lt!414856 lt!414858) lt!414856)))))

(assert (=> d!95302 (= lt!414858 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95302 (= lt!414856 ((_ sign_extend 32) (size!6854 (buf!7322 bs1!11))))))

(assert (=> d!95302 (= lt!414855 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13551 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13546 bs1!11))))))

(assert (=> d!95302 (invariant!0 (currentBit!13546 bs1!11) (currentByte!13551 bs1!11) (size!6854 (buf!7322 bs1!11)))))

(assert (=> d!95302 (= (bitIndex!0 (size!6854 (buf!7322 bs1!11)) (currentByte!13551 bs1!11) (currentBit!13546 bs1!11)) lt!414855)))

(declare-fun b!276707 () Bool)

(declare-fun res!229879 () Bool)

(assert (=> b!276707 (=> (not res!229879) (not e!196625))))

(assert (=> b!276707 (= res!229879 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414855))))

(declare-fun b!276708 () Bool)

(declare-fun lt!414857 () (_ BitVec 64))

(assert (=> b!276708 (= e!196625 (bvsle lt!414855 (bvmul lt!414857 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276708 (or (= lt!414857 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!414857 #b0000000000000000000000000000000000000000000000000000000000001000) lt!414857)))))

(assert (=> b!276708 (= lt!414857 ((_ sign_extend 32) (size!6854 (buf!7322 bs1!11))))))

(assert (= (and d!95302 res!229878) b!276707))

(assert (= (and b!276707 res!229879) b!276708))

(assert (=> d!95302 m!409693))

(declare-fun m!409755 () Bool)

(assert (=> d!95302 m!409755))

(assert (=> b!276612 d!95302))

(declare-fun d!95320 () Bool)

(assert (=> d!95320 (= (inv!12 bs1!11) (invariant!0 (currentBit!13546 bs1!11) (currentByte!13551 bs1!11) (size!6854 (buf!7322 bs1!11))))))

(declare-fun bs!24041 () Bool)

(assert (= bs!24041 d!95320))

(assert (=> bs!24041 m!409755))

(assert (=> start!61578 d!95320))

(declare-fun d!95322 () Bool)

(assert (=> d!95322 (= (inv!12 bs2!19) (invariant!0 (currentBit!13546 bs2!19) (currentByte!13551 bs2!19) (size!6854 (buf!7322 bs2!19))))))

(declare-fun bs!24042 () Bool)

(assert (= bs!24042 d!95322))

(declare-fun m!409757 () Bool)

(assert (=> bs!24042 m!409757))

(assert (=> start!61578 d!95322))

(declare-fun d!95324 () Bool)

(assert (=> d!95324 (= (array_inv!6578 (buf!7322 bs2!19)) (bvsge (size!6854 (buf!7322 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!276611 d!95324))

(declare-fun d!95326 () Bool)

(declare-datatypes ((tuple2!22564 0))(
  ( (tuple2!22565 (_1!12332 Bool) (_2!12332 BitStream!12522)) )
))
(declare-fun lt!414863 () tuple2!22564)

(declare-fun readBit!0 (BitStream!12522) tuple2!22564)

(assert (=> d!95326 (= lt!414863 (readBit!0 (BitStream!12523 (buf!7322 bs2!19) (currentByte!13551 bs1!11) (currentBit!13546 bs1!11))))))

(assert (=> d!95326 (= (readBitPure!0 (BitStream!12523 (buf!7322 bs2!19) (currentByte!13551 bs1!11) (currentBit!13546 bs1!11))) (tuple2!22557 (_2!12332 lt!414863) (_1!12332 lt!414863)))))

(declare-fun bs!24043 () Bool)

(assert (= bs!24043 d!95326))

(declare-fun m!409759 () Bool)

(assert (=> bs!24043 m!409759))

(assert (=> b!276610 d!95326))

(declare-fun d!95328 () Bool)

(declare-fun lt!414864 () tuple2!22564)

(assert (=> d!95328 (= lt!414864 (readBit!0 bs1!11))))

(assert (=> d!95328 (= (readBitPure!0 bs1!11) (tuple2!22557 (_2!12332 lt!414864) (_1!12332 lt!414864)))))

(declare-fun bs!24044 () Bool)

(assert (= bs!24044 d!95328))

(declare-fun m!409761 () Bool)

(assert (=> bs!24044 m!409761))

(assert (=> b!276610 d!95328))

(declare-fun d!95330 () Bool)

(assert (=> d!95330 (= (invariant!0 (currentBit!13546 bs1!11) (currentByte!13551 bs1!11) (size!6854 (buf!7322 bs2!19))) (and (bvsge (currentBit!13546 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13546 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13551 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13551 bs1!11) (size!6854 (buf!7322 bs2!19))) (and (= (currentBit!13546 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13551 bs1!11) (size!6854 (buf!7322 bs2!19)))))))))

(assert (=> b!276610 d!95330))

(check-sat (not b!276700) (not d!95326) (not d!95320) (not bm!4460) (not d!95328) (not b!276696) (not d!95302) (not b!276694) (not d!95322) (not d!95282))
(check-sat)
