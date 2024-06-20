; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38616 () Bool)

(assert start!38616)

(declare-fun b!173675 () Bool)

(declare-fun e!121210 () Bool)

(declare-datatypes ((array!9350 0))(
  ( (array!9351 (arr!5056 (Array (_ BitVec 32) (_ BitVec 8))) (size!4126 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7360 0))(
  ( (BitStream!7361 (buf!4557 array!9350) (currentByte!8656 (_ BitVec 32)) (currentBit!8651 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7360)

(declare-fun array_inv!3867 (array!9350) Bool)

(assert (=> b!173675 (= e!121210 (array_inv!3867 (buf!4557 thiss!1187)))))

(declare-fun b!173676 () Bool)

(declare-fun res!143843 () Bool)

(declare-fun e!121209 () Bool)

(assert (=> b!173676 (=> (not res!143843) (not e!121209))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun v!186 () (_ BitVec 64))

(declare-datatypes ((Unit!12451 0))(
  ( (Unit!12452) )
))
(declare-datatypes ((tuple2!14962 0))(
  ( (tuple2!14963 (_1!8123 Unit!12451) (_2!8123 BitStream!7360)) )
))
(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7360 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14962)

(assert (=> b!173676 (= res!143843 (= (size!4126 (buf!4557 (_2!8123 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000)))) (size!4126 (buf!4557 thiss!1187))))))

(declare-fun b!173677 () Bool)

(declare-fun lt!267511 () (_ BitVec 64))

(declare-fun lt!267512 () (_ BitVec 64))

(assert (=> b!173677 (= e!121209 (and (= lt!267512 (bvand ((_ sign_extend 32) nBits!340) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!267512 (bvand (bvadd lt!267511 ((_ sign_extend 32) nBits!340)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!173677 (= lt!267512 (bvand lt!267511 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!173677 (= lt!267511 (bitIndex!0 (size!4126 (buf!4557 thiss!1187)) (currentByte!8656 thiss!1187) (currentBit!8651 thiss!1187)))))

(declare-fun b!173678 () Bool)

(declare-fun res!143842 () Bool)

(assert (=> b!173678 (=> (not res!143842) (not e!121209))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!173678 (= res!143842 (validate_offset_bits!1 ((_ sign_extend 32) (size!4126 (buf!4557 thiss!1187))) ((_ sign_extend 32) (currentByte!8656 thiss!1187)) ((_ sign_extend 32) (currentBit!8651 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun res!143844 () Bool)

(assert (=> start!38616 (=> (not res!143844) (not e!121209))))

(assert (=> start!38616 (= res!143844 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38616 e!121209))

(assert (=> start!38616 true))

(declare-fun inv!12 (BitStream!7360) Bool)

(assert (=> start!38616 (and (inv!12 thiss!1187) e!121210)))

(declare-fun b!173679 () Bool)

(declare-fun res!143841 () Bool)

(assert (=> b!173679 (=> (not res!143841) (not e!121209))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!173679 (= res!143841 (invariant!0 (currentBit!8651 thiss!1187) (currentByte!8656 thiss!1187) (size!4126 (buf!4557 thiss!1187))))))

(assert (= (and start!38616 res!143844) b!173678))

(assert (= (and b!173678 res!143842) b!173679))

(assert (= (and b!173679 res!143841) b!173676))

(assert (= (and b!173676 res!143843) b!173677))

(assert (= start!38616 b!173675))

(declare-fun m!272943 () Bool)

(assert (=> b!173675 m!272943))

(declare-fun m!272945 () Bool)

(assert (=> b!173679 m!272945))

(declare-fun m!272947 () Bool)

(assert (=> b!173677 m!272947))

(declare-fun m!272949 () Bool)

(assert (=> b!173678 m!272949))

(declare-fun m!272951 () Bool)

(assert (=> b!173676 m!272951))

(declare-fun m!272953 () Bool)

(assert (=> start!38616 m!272953))

(push 1)

(assert (not b!173676))

(assert (not start!38616))

(assert (not b!173677))

(assert (not b!173679))

(assert (not b!173678))

(assert (not b!173675))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!61315 () Bool)

(declare-fun e!121231 () Bool)

(assert (=> d!61315 e!121231))

(declare-fun res!143873 () Bool)

(assert (=> d!61315 (=> (not res!143873) (not e!121231))))

(declare-fun lt!267538 () (_ BitVec 64))

(declare-fun lt!267542 () (_ BitVec 64))

(declare-fun lt!267541 () (_ BitVec 64))

(assert (=> d!61315 (= res!143873 (= lt!267538 (bvsub lt!267542 lt!267541)))))

(assert (=> d!61315 (or (= (bvand lt!267542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!267541 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!267542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!267542 lt!267541) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!61315 (= lt!267541 (remainingBits!0 ((_ sign_extend 32) (size!4126 (buf!4557 thiss!1187))) ((_ sign_extend 32) (currentByte!8656 thiss!1187)) ((_ sign_extend 32) (currentBit!8651 thiss!1187))))))

(declare-fun lt!267539 () (_ BitVec 64))

(declare-fun lt!267540 () (_ BitVec 64))

(assert (=> d!61315 (= lt!267542 (bvmul lt!267539 lt!267540))))

(assert (=> d!61315 (or (= lt!267539 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!267540 (bvsdiv (bvmul lt!267539 lt!267540) lt!267539)))))

(assert (=> d!61315 (= lt!267540 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61315 (= lt!267539 ((_ sign_extend 32) (size!4126 (buf!4557 thiss!1187))))))

(assert (=> d!61315 (= lt!267538 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8656 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8651 thiss!1187))))))

(assert (=> d!61315 (invariant!0 (currentBit!8651 thiss!1187) (currentByte!8656 thiss!1187) (size!4126 (buf!4557 thiss!1187)))))

(assert (=> d!61315 (= (bitIndex!0 (size!4126 (buf!4557 thiss!1187)) (currentByte!8656 thiss!1187) (currentBit!8651 thiss!1187)) lt!267538)))

(declare-fun b!173714 () Bool)

(declare-fun res!143874 () Bool)

(assert (=> b!173714 (=> (not res!143874) (not e!121231))))

(assert (=> b!173714 (= res!143874 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!267538))))

(declare-fun b!173715 () Bool)

(declare-fun lt!267537 () (_ BitVec 64))

(assert (=> b!173715 (= e!121231 (bvsle lt!267538 (bvmul lt!267537 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!173715 (or (= lt!267537 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!267537 #b0000000000000000000000000000000000000000000000000000000000001000) lt!267537)))))

(assert (=> b!173715 (= lt!267537 ((_ sign_extend 32) (size!4126 (buf!4557 thiss!1187))))))

(assert (= (and d!61315 res!143873) b!173714))

(assert (= (and b!173714 res!143874) b!173715))

(declare-fun m!272981 () Bool)

(assert (=> d!61315 m!272981))

(assert (=> d!61315 m!272945))

(assert (=> b!173677 d!61315))

(declare-fun b!173796 () Bool)

(declare-fun e!121278 () Bool)

(declare-datatypes ((tuple2!14970 0))(
  ( (tuple2!14971 (_1!8127 BitStream!7360) (_2!8127 Bool)) )
))
(declare-fun lt!267861 () tuple2!14970)

(declare-fun lt!267828 () tuple2!14962)

(assert (=> b!173796 (= e!121278 (= (bitIndex!0 (size!4126 (buf!4557 (_1!8127 lt!267861))) (currentByte!8656 (_1!8127 lt!267861)) (currentBit!8651 (_1!8127 lt!267861))) (bitIndex!0 (size!4126 (buf!4557 (_2!8123 lt!267828))) (currentByte!8656 (_2!8123 lt!267828)) (currentBit!8651 (_2!8123 lt!267828)))))))

(declare-fun b!173797 () Bool)

(declare-fun e!121279 () (_ BitVec 64))

(assert (=> b!173797 (= e!121279 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun b!173798 () Bool)

(declare-fun e!121277 () Bool)

(declare-datatypes ((tuple2!14972 0))(
  ( (tuple2!14973 (_1!8128 BitStream!7360) (_2!8128 (_ BitVec 64))) )
))
(declare-fun lt!267831 () tuple2!14972)

(declare-datatypes ((tuple2!14974 0))(
  ( (tuple2!14975 (_1!8129 BitStream!7360) (_2!8129 BitStream!7360)) )
))
(declare-fun lt!267876 () tuple2!14974)

(assert (=> b!173798 (= e!121277 (= (_1!8128 lt!267831) (_2!8129 lt!267876)))))

(declare-fun b!173799 () Bool)

(declare-fun e!121282 () Bool)

(declare-fun lt!267853 () tuple2!14972)

(declare-fun lt!267854 () tuple2!14974)

(assert (=> b!173799 (= e!121282 (= (_1!8128 lt!267853) (_2!8129 lt!267854)))))

(declare-fun b!173800 () Bool)

(declare-fun res!143944 () Bool)

(assert (=> b!173800 (= res!143944 (= (bitIndex!0 (size!4126 (buf!4557 (_2!8123 lt!267828))) (currentByte!8656 (_2!8123 lt!267828)) (currentBit!8651 (_2!8123 lt!267828))) (bvadd (bitIndex!0 (size!4126 (buf!4557 thiss!1187)) (currentByte!8656 thiss!1187) (currentBit!8651 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!121283 () Bool)

(assert (=> b!173800 (=> (not res!143944) (not e!121283))))

(declare-fun d!61329 () Bool)

(declare-fun e!121281 () Bool)

(assert (=> d!61329 e!121281))

(declare-fun res!143941 () Bool)

(assert (=> d!61329 (=> (not res!143941) (not e!121281))))

(declare-fun lt!267863 () tuple2!14962)

(assert (=> d!61329 (= res!143941 (invariant!0 (currentBit!8651 (_2!8123 lt!267863)) (currentByte!8656 (_2!8123 lt!267863)) (size!4126 (buf!4557 (_2!8123 lt!267863)))))))

(declare-fun e!121285 () tuple2!14962)

(assert (=> d!61329 (= lt!267863 e!121285)))

(declare-fun c!9143 () Bool)

(assert (=> d!61329 (= c!9143 (= #b00000000000000000000000000000000 nBits!340))))

(assert (=> d!61329 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000))))

(assert (=> d!61329 (= (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000) lt!267863)))

(declare-fun b!173801 () Bool)

(assert (=> b!173801 (= e!121281 e!121282)))

(declare-fun res!143936 () Bool)

(assert (=> b!173801 (=> (not res!143936) (not e!121282))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!173801 (= res!143936 (= (_2!8128 lt!267853) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7360 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!14972)

(assert (=> b!173801 (= lt!267853 (readNBitsLSBFirstsLoopPure!0 (_1!8129 lt!267854) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun lt!267825 () Unit!12451)

(declare-fun lt!267832 () Unit!12451)

(assert (=> b!173801 (= lt!267825 lt!267832)))

(declare-fun lt!267872 () (_ BitVec 64))

(assert (=> b!173801 (validate_offset_bits!1 ((_ sign_extend 32) (size!4126 (buf!4557 (_2!8123 lt!267863)))) ((_ sign_extend 32) (currentByte!8656 thiss!1187)) ((_ sign_extend 32) (currentBit!8651 thiss!1187)) lt!267872)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7360 array!9350 (_ BitVec 64)) Unit!12451)

(assert (=> b!173801 (= lt!267832 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4557 (_2!8123 lt!267863)) lt!267872))))

(declare-fun e!121284 () Bool)

(assert (=> b!173801 e!121284))

(declare-fun res!143935 () Bool)

(assert (=> b!173801 (=> (not res!143935) (not e!121284))))

(assert (=> b!173801 (= res!143935 (and (= (size!4126 (buf!4557 thiss!1187)) (size!4126 (buf!4557 (_2!8123 lt!267863)))) (bvsge lt!267872 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173801 (= lt!267872 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(assert (=> b!173801 (or (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand (bvsub nBits!340 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!7360 BitStream!7360) tuple2!14974)

(assert (=> b!173801 (= lt!267854 (reader!0 thiss!1187 (_2!8123 lt!267863)))))

(declare-fun b!173802 () Bool)

(declare-fun Unit!12457 () Unit!12451)

(assert (=> b!173802 (= e!121285 (tuple2!14963 Unit!12457 thiss!1187))))

(declare-fun lt!267835 () Unit!12451)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7360) Unit!12451)

(assert (=> b!173802 (= lt!267835 (lemmaIsPrefixRefl!0 thiss!1187))))

(declare-fun call!2873 () Bool)

(assert (=> b!173802 call!2873))

(declare-fun lt!267867 () Unit!12451)

(assert (=> b!173802 (= lt!267867 lt!267835)))

(declare-fun b!173803 () Bool)

(declare-fun res!143937 () Bool)

(assert (=> b!173803 (=> (not res!143937) (not e!121281))))

(declare-fun isPrefixOf!0 (BitStream!7360 BitStream!7360) Bool)

(assert (=> b!173803 (= res!143937 (isPrefixOf!0 thiss!1187 (_2!8123 lt!267863)))))

(declare-fun b!173804 () Bool)

(declare-fun res!143946 () Bool)

(assert (=> b!173804 (=> (not res!143946) (not e!121281))))

(declare-fun lt!267865 () (_ BitVec 64))

(declare-fun lt!267871 () (_ BitVec 64))

(assert (=> b!173804 (= res!143946 (= (bitIndex!0 (size!4126 (buf!4557 (_2!8123 lt!267863))) (currentByte!8656 (_2!8123 lt!267863)) (currentBit!8651 (_2!8123 lt!267863))) (bvsub lt!267865 lt!267871)))))

(assert (=> b!173804 (or (= (bvand lt!267865 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!267871 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!267865 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!267865 lt!267871) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173804 (= lt!267871 ((_ sign_extend 32) #b00000000000000000000000000000000))))

(declare-fun lt!267849 () (_ BitVec 64))

(declare-fun lt!267842 () (_ BitVec 64))

(assert (=> b!173804 (= lt!267865 (bvadd lt!267849 lt!267842))))

(assert (=> b!173804 (or (not (= (bvand lt!267849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!267842 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!267849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!267849 lt!267842) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173804 (= lt!267842 ((_ sign_extend 32) nBits!340))))

(assert (=> b!173804 (= lt!267849 (bitIndex!0 (size!4126 (buf!4557 thiss!1187)) (currentByte!8656 thiss!1187) (currentBit!8651 thiss!1187)))))

(declare-fun b!173805 () Bool)

(declare-fun res!143942 () Bool)

(assert (=> b!173805 (=> (not res!143942) (not e!121281))))

(assert (=> b!173805 (= res!143942 (= (size!4126 (buf!4557 thiss!1187)) (size!4126 (buf!4557 (_2!8123 lt!267863)))))))

(declare-fun b!173806 () Bool)

(declare-fun readBitPure!0 (BitStream!7360) tuple2!14970)

(declare-fun readerFrom!0 (BitStream!7360 (_ BitVec 32) (_ BitVec 32)) BitStream!7360)

(assert (=> b!173806 (= lt!267861 (readBitPure!0 (readerFrom!0 (_2!8123 lt!267828) (currentBit!8651 thiss!1187) (currentByte!8656 thiss!1187))))))

(declare-fun res!143945 () Bool)

(declare-fun lt!267833 () Bool)

(assert (=> b!173806 (= res!143945 (and (= (_2!8127 lt!267861) lt!267833) (= (_1!8127 lt!267861) (_2!8123 lt!267828))))))

(assert (=> b!173806 (=> (not res!143945) (not e!121278))))

(assert (=> b!173806 (= e!121283 e!121278)))

(declare-fun b!173807 () Bool)

(declare-fun res!143938 () Bool)

(assert (=> b!173807 (= res!143938 (isPrefixOf!0 thiss!1187 (_2!8123 lt!267828)))))

(assert (=> b!173807 (=> (not res!143938) (not e!121283))))

(declare-fun b!173808 () Bool)

(assert (=> b!173808 (= e!121279 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!267824 () tuple2!14962)

(declare-fun bm!2870 () Bool)

(assert (=> bm!2870 (= call!2873 (isPrefixOf!0 thiss!1187 (ite c!9143 thiss!1187 (_2!8123 lt!267824))))))

(declare-fun b!173809 () Bool)

(assert (=> b!173809 (= e!121284 (validate_offset_bits!1 ((_ sign_extend 32) (size!4126 (buf!4557 thiss!1187))) ((_ sign_extend 32) (currentByte!8656 thiss!1187)) ((_ sign_extend 32) (currentBit!8651 thiss!1187)) lt!267872))))

(declare-fun b!173810 () Bool)

(assert (=> b!173810 (= e!121285 (tuple2!14963 (_1!8123 lt!267824) (_2!8123 lt!267824)))))

(assert (=> b!173810 (= lt!267833 (not (= (bvand v!186 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun appendBit!0 (BitStream!7360 Bool) tuple2!14962)

(assert (=> b!173810 (= lt!267828 (appendBit!0 thiss!1187 lt!267833))))

(declare-fun res!143943 () Bool)

(assert (=> b!173810 (= res!143943 (= (size!4126 (buf!4557 thiss!1187)) (size!4126 (buf!4557 (_2!8123 lt!267828)))))))

(assert (=> b!173810 (=> (not res!143943) (not e!121283))))

(assert (=> b!173810 e!121283))

(declare-fun lt!267841 () tuple2!14962)

(assert (=> b!173810 (= lt!267841 lt!267828)))

(assert (=> b!173810 (= lt!267824 (appendBitsLSBFirstLoopTR!0 (_2!8123 lt!267841) v!186 nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!267864 () Unit!12451)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7360 BitStream!7360 BitStream!7360) Unit!12451)

(assert (=> b!173810 (= lt!267864 (lemmaIsPrefixTransitive!0 thiss!1187 (_2!8123 lt!267841) (_2!8123 lt!267824)))))

(assert (=> b!173810 call!2873))

(declare-fun lt!267827 () Unit!12451)

(assert (=> b!173810 (= lt!267827 lt!267864)))

(assert (=> b!173810 (invariant!0 (currentBit!8651 thiss!1187) (currentByte!8656 thiss!1187) (size!4126 (buf!4557 (_2!8123 lt!267841))))))

(declare-fun lt!267834 () BitStream!7360)

(assert (=> b!173810 (= lt!267834 (BitStream!7361 (buf!4557 (_2!8123 lt!267841)) (currentByte!8656 thiss!1187) (currentBit!8651 thiss!1187)))))

(assert (=> b!173810 (invariant!0 (currentBit!8651 lt!267834) (currentByte!8656 lt!267834) (size!4126 (buf!4557 (_2!8123 lt!267824))))))

(declare-fun lt!267838 () BitStream!7360)

(assert (=> b!173810 (= lt!267838 (BitStream!7361 (buf!4557 (_2!8123 lt!267824)) (currentByte!8656 lt!267834) (currentBit!8651 lt!267834)))))

(declare-fun lt!267866 () tuple2!14970)

(assert (=> b!173810 (= lt!267866 (readBitPure!0 lt!267834))))

(declare-fun lt!267875 () tuple2!14970)

(assert (=> b!173810 (= lt!267875 (readBitPure!0 lt!267838))))

(declare-fun lt!267859 () Unit!12451)

(declare-fun readBitPrefixLemma!0 (BitStream!7360 BitStream!7360) Unit!12451)

(assert (=> b!173810 (= lt!267859 (readBitPrefixLemma!0 lt!267834 (_2!8123 lt!267824)))))

(declare-fun res!143939 () Bool)

(assert (=> b!173810 (= res!143939 (= (bitIndex!0 (size!4126 (buf!4557 (_1!8127 lt!267866))) (currentByte!8656 (_1!8127 lt!267866)) (currentBit!8651 (_1!8127 lt!267866))) (bitIndex!0 (size!4126 (buf!4557 (_1!8127 lt!267875))) (currentByte!8656 (_1!8127 lt!267875)) (currentBit!8651 (_1!8127 lt!267875)))))))

(declare-fun e!121280 () Bool)

(assert (=> b!173810 (=> (not res!143939) (not e!121280))))

(assert (=> b!173810 e!121280))

(declare-fun lt!267860 () Unit!12451)

(assert (=> b!173810 (= lt!267860 lt!267859)))

(declare-fun lt!267836 () tuple2!14974)

(assert (=> b!173810 (= lt!267836 (reader!0 thiss!1187 (_2!8123 lt!267824)))))

(declare-fun lt!267829 () tuple2!14974)

(assert (=> b!173810 (= lt!267829 (reader!0 (_2!8123 lt!267841) (_2!8123 lt!267824)))))

(declare-fun lt!267851 () tuple2!14970)

(assert (=> b!173810 (= lt!267851 (readBitPure!0 (_1!8129 lt!267836)))))

(assert (=> b!173810 (= (_2!8127 lt!267851) lt!267833)))

(declare-fun lt!267877 () Unit!12451)

(declare-fun Unit!12461 () Unit!12451)

(assert (=> b!173810 (= lt!267877 Unit!12461)))

(declare-fun lt!267870 () (_ BitVec 64))

(assert (=> b!173810 (= lt!267870 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000)))))

(declare-fun lt!267843 () (_ BitVec 64))

(assert (=> b!173810 (= lt!267843 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(declare-fun lt!267837 () Unit!12451)

(assert (=> b!173810 (= lt!267837 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4557 (_2!8123 lt!267824)) lt!267843))))

(assert (=> b!173810 (validate_offset_bits!1 ((_ sign_extend 32) (size!4126 (buf!4557 (_2!8123 lt!267824)))) ((_ sign_extend 32) (currentByte!8656 thiss!1187)) ((_ sign_extend 32) (currentBit!8651 thiss!1187)) lt!267843)))

(declare-fun lt!267878 () Unit!12451)

(assert (=> b!173810 (= lt!267878 lt!267837)))

(declare-fun lt!267856 () tuple2!14972)

(assert (=> b!173810 (= lt!267856 (readNBitsLSBFirstsLoopPure!0 (_1!8129 lt!267836) nBits!340 #b00000000000000000000000000000000 lt!267870))))

(declare-fun lt!267844 () (_ BitVec 64))

(assert (=> b!173810 (= lt!267844 ((_ sign_extend 32) (bvsub (bvsub nBits!340 #b00000000000000000000000000000000) #b00000000000000000000000000000001)))))

(declare-fun lt!267826 () Unit!12451)

(assert (=> b!173810 (= lt!267826 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8123 lt!267841) (buf!4557 (_2!8123 lt!267824)) lt!267844))))

(assert (=> b!173810 (validate_offset_bits!1 ((_ sign_extend 32) (size!4126 (buf!4557 (_2!8123 lt!267824)))) ((_ sign_extend 32) (currentByte!8656 (_2!8123 lt!267841))) ((_ sign_extend 32) (currentBit!8651 (_2!8123 lt!267841))) lt!267844)))

(declare-fun lt!267855 () Unit!12451)

(assert (=> b!173810 (= lt!267855 lt!267826)))

(declare-fun lt!267857 () tuple2!14972)

(assert (=> b!173810 (= lt!267857 (readNBitsLSBFirstsLoopPure!0 (_1!8129 lt!267829) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!267870 (ite (_2!8127 lt!267851) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!267847 () tuple2!14972)

(assert (=> b!173810 (= lt!267847 (readNBitsLSBFirstsLoopPure!0 (_1!8129 lt!267836) nBits!340 #b00000000000000000000000000000000 lt!267870))))

(declare-fun c!9144 () Bool)

(assert (=> b!173810 (= c!9144 (_2!8127 (readBitPure!0 (_1!8129 lt!267836))))))

(declare-fun lt!267874 () tuple2!14972)

(declare-fun withMovedBitIndex!0 (BitStream!7360 (_ BitVec 64)) BitStream!7360)

(assert (=> b!173810 (= lt!267874 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8129 lt!267836) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!267870 e!121279)))))

(declare-fun lt!267869 () Unit!12451)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7360 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!12451)

(assert (=> b!173810 (= lt!267869 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8129 lt!267836) nBits!340 #b00000000000000000000000000000000 lt!267870))))

(assert (=> b!173810 (and (= (_2!8128 lt!267847) (_2!8128 lt!267874)) (= (_1!8128 lt!267847) (_1!8128 lt!267874)))))

(declare-fun lt!267873 () Unit!12451)

(assert (=> b!173810 (= lt!267873 lt!267869)))

(assert (=> b!173810 (= (_1!8129 lt!267836) (withMovedBitIndex!0 (_2!8129 lt!267836) (bvsub (bitIndex!0 (size!4126 (buf!4557 thiss!1187)) (currentByte!8656 thiss!1187) (currentBit!8651 thiss!1187)) (bitIndex!0 (size!4126 (buf!4557 (_2!8123 lt!267824))) (currentByte!8656 (_2!8123 lt!267824)) (currentBit!8651 (_2!8123 lt!267824))))))))

(declare-fun lt!267850 () Unit!12451)

(declare-fun Unit!12468 () Unit!12451)

(assert (=> b!173810 (= lt!267850 Unit!12468)))

(assert (=> b!173810 (= (_1!8129 lt!267829) (withMovedBitIndex!0 (_2!8129 lt!267829) (bvsub (bitIndex!0 (size!4126 (buf!4557 (_2!8123 lt!267841))) (currentByte!8656 (_2!8123 lt!267841)) (currentBit!8651 (_2!8123 lt!267841))) (bitIndex!0 (size!4126 (buf!4557 (_2!8123 lt!267824))) (currentByte!8656 (_2!8123 lt!267824)) (currentBit!8651 (_2!8123 lt!267824))))))))

(declare-fun lt!267840 () Unit!12451)

(declare-fun Unit!12469 () Unit!12451)

(assert (=> b!173810 (= lt!267840 Unit!12469)))

(assert (=> b!173810 (= (bitIndex!0 (size!4126 (buf!4557 thiss!1187)) (currentByte!8656 thiss!1187) (currentBit!8651 thiss!1187)) (bvsub (bitIndex!0 (size!4126 (buf!4557 (_2!8123 lt!267841))) (currentByte!8656 (_2!8123 lt!267841)) (currentBit!8651 (_2!8123 lt!267841))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!267845 () Unit!12451)

(declare-fun Unit!12470 () Unit!12451)

(assert (=> b!173810 (= lt!267845 Unit!12470)))

(assert (=> b!173810 (= (_2!8128 lt!267856) (_2!8128 lt!267857))))

(declare-fun lt!267862 () Unit!12451)

(declare-fun Unit!12472 () Unit!12451)

(assert (=> b!173810 (= lt!267862 Unit!12472)))

(assert (=> b!173810 (invariant!0 (currentBit!8651 (_2!8123 lt!267824)) (currentByte!8656 (_2!8123 lt!267824)) (size!4126 (buf!4557 (_2!8123 lt!267824))))))

(declare-fun lt!267868 () Unit!12451)

(declare-fun Unit!12473 () Unit!12451)

(assert (=> b!173810 (= lt!267868 Unit!12473)))

(assert (=> b!173810 (= (size!4126 (buf!4557 thiss!1187)) (size!4126 (buf!4557 (_2!8123 lt!267824))))))

(declare-fun lt!267852 () Unit!12451)

(declare-fun Unit!12474 () Unit!12451)

(assert (=> b!173810 (= lt!267852 Unit!12474)))

(assert (=> b!173810 (= (bitIndex!0 (size!4126 (buf!4557 (_2!8123 lt!267824))) (currentByte!8656 (_2!8123 lt!267824)) (currentBit!8651 (_2!8123 lt!267824))) (bvsub (bvadd (bitIndex!0 (size!4126 (buf!4557 thiss!1187)) (currentByte!8656 thiss!1187) (currentBit!8651 thiss!1187)) ((_ sign_extend 32) nBits!340)) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!267830 () Unit!12451)

(declare-fun Unit!12475 () Unit!12451)

(assert (=> b!173810 (= lt!267830 Unit!12475)))

(declare-fun lt!267839 () Unit!12451)

(declare-fun Unit!12476 () Unit!12451)

(assert (=> b!173810 (= lt!267839 Unit!12476)))

(assert (=> b!173810 (= lt!267876 (reader!0 thiss!1187 (_2!8123 lt!267824)))))

(declare-fun lt!267823 () (_ BitVec 64))

(assert (=> b!173810 (= lt!267823 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(declare-fun lt!267846 () Unit!12451)

(assert (=> b!173810 (= lt!267846 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4557 (_2!8123 lt!267824)) lt!267823))))

(assert (=> b!173810 (validate_offset_bits!1 ((_ sign_extend 32) (size!4126 (buf!4557 (_2!8123 lt!267824)))) ((_ sign_extend 32) (currentByte!8656 thiss!1187)) ((_ sign_extend 32) (currentBit!8651 thiss!1187)) lt!267823)))

(declare-fun lt!267848 () Unit!12451)

(assert (=> b!173810 (= lt!267848 lt!267846)))

(assert (=> b!173810 (= lt!267831 (readNBitsLSBFirstsLoopPure!0 (_1!8129 lt!267876) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun res!143940 () Bool)

(assert (=> b!173810 (= res!143940 (= (_2!8128 lt!267831) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(assert (=> b!173810 (=> (not res!143940) (not e!121277))))

(assert (=> b!173810 e!121277))

(declare-fun lt!267858 () Unit!12451)

(declare-fun Unit!12477 () Unit!12451)

(assert (=> b!173810 (= lt!267858 Unit!12477)))

(declare-fun b!173811 () Bool)

(assert (=> b!173811 (= e!121280 (= (_2!8127 lt!267866) (_2!8127 lt!267875)))))

(assert (= (and d!61329 c!9143) b!173802))

(assert (= (and d!61329 (not c!9143)) b!173810))

(assert (= (and b!173810 res!143943) b!173800))

(assert (= (and b!173800 res!143944) b!173807))

(assert (= (and b!173807 res!143938) b!173806))

(assert (= (and b!173806 res!143945) b!173796))

(assert (= (and b!173810 res!143939) b!173811))

(assert (= (and b!173810 c!9144) b!173797))

(assert (= (and b!173810 (not c!9144)) b!173808))

(assert (= (and b!173810 res!143940) b!173798))

(assert (= (or b!173802 b!173810) bm!2870))

(assert (= (and d!61329 res!143941) b!173805))

(assert (= (and b!173805 res!143942) b!173804))

(assert (= (and b!173804 res!143946) b!173803))

(assert (= (and b!173803 res!143937) b!173801))

(assert (= (and b!173801 res!143935) b!173809))

(assert (= (and b!173801 res!143936) b!173799))

(declare-fun m!273077 () Bool)

(assert (=> b!173809 m!273077))

(declare-fun m!273079 () Bool)

(assert (=> b!173807 m!273079))

(declare-fun m!273081 () Bool)

(assert (=> d!61329 m!273081))

(declare-fun m!273083 () Bool)

(assert (=> b!173810 m!273083))

(declare-fun m!273085 () Bool)

(assert (=> b!173810 m!273085))

(declare-fun m!273087 () Bool)

(assert (=> b!173810 m!273087))

(declare-fun m!273089 () Bool)

(assert (=> b!173810 m!273089))

(declare-fun m!273091 () Bool)

(assert (=> b!173810 m!273091))

(declare-fun m!273093 () Bool)

(assert (=> b!173810 m!273093))

(declare-fun m!273095 () Bool)

(assert (=> b!173810 m!273095))

(assert (=> b!173810 m!272947))

(declare-fun m!273097 () Bool)

(assert (=> b!173810 m!273097))

(declare-fun m!273099 () Bool)

(assert (=> b!173810 m!273099))

(declare-fun m!273101 () Bool)

(assert (=> b!173810 m!273101))

(declare-fun m!273103 () Bool)

(assert (=> b!173810 m!273103))

(declare-fun m!273105 () Bool)

(assert (=> b!173810 m!273105))

(declare-fun m!273107 () Bool)

(assert (=> b!173810 m!273107))

(declare-fun m!273109 () Bool)

(assert (=> b!173810 m!273109))

(declare-fun m!273111 () Bool)

(assert (=> b!173810 m!273111))

(declare-fun m!273113 () Bool)

(assert (=> b!173810 m!273113))

(declare-fun m!273115 () Bool)

(assert (=> b!173810 m!273115))

(declare-fun m!273117 () Bool)

(assert (=> b!173810 m!273117))

(assert (=> b!173810 m!273087))

(declare-fun m!273119 () Bool)

(assert (=> b!173810 m!273119))

(declare-fun m!273121 () Bool)

(assert (=> b!173810 m!273121))

(declare-fun m!273123 () Bool)

(assert (=> b!173810 m!273123))

(declare-fun m!273125 () Bool)

(assert (=> b!173810 m!273125))

(declare-fun m!273127 () Bool)

(assert (=> b!173810 m!273127))

(declare-fun m!273129 () Bool)

(assert (=> b!173810 m!273129))

(declare-fun m!273131 () Bool)

(assert (=> b!173810 m!273131))

(declare-fun m!273133 () Bool)

(assert (=> b!173810 m!273133))

(declare-fun m!273135 () Bool)

(assert (=> b!173810 m!273135))

(declare-fun m!273137 () Bool)

(assert (=> b!173810 m!273137))

(declare-fun m!273139 () Bool)

(assert (=> b!173810 m!273139))

(declare-fun m!273141 () Bool)

(assert (=> b!173810 m!273141))

(declare-fun m!273143 () Bool)

(assert (=> b!173810 m!273143))

(declare-fun m!273145 () Bool)

(assert (=> b!173810 m!273145))

(declare-fun m!273147 () Bool)

(assert (=> b!173806 m!273147))

(assert (=> b!173806 m!273147))

(declare-fun m!273149 () Bool)

(assert (=> b!173806 m!273149))

(declare-fun m!273151 () Bool)

(assert (=> b!173804 m!273151))

(assert (=> b!173804 m!272947))

(declare-fun m!273153 () Bool)

(assert (=> b!173802 m!273153))

(declare-fun m!273155 () Bool)

(assert (=> b!173803 m!273155))

(declare-fun m!273157 () Bool)

(assert (=> bm!2870 m!273157))

(declare-fun m!273159 () Bool)

(assert (=> b!173801 m!273159))

(declare-fun m!273161 () Bool)

(assert (=> b!173801 m!273161))

(declare-fun m!273163 () Bool)

(assert (=> b!173801 m!273163))

(assert (=> b!173801 m!273125))

(assert (=> b!173801 m!273133))

(declare-fun m!273165 () Bool)

(assert (=> b!173801 m!273165))

(declare-fun m!273167 () Bool)

(assert (=> b!173796 m!273167))

(declare-fun m!273169 () Bool)

(assert (=> b!173796 m!273169))

(assert (=> b!173800 m!273169))

(assert (=> b!173800 m!272947))

(assert (=> b!173676 d!61329))

(declare-fun d!61335 () Bool)

(assert (=> d!61335 (= (inv!12 thiss!1187) (invariant!0 (currentBit!8651 thiss!1187) (currentByte!8656 thiss!1187) (size!4126 (buf!4557 thiss!1187))))))

(declare-fun bs!15280 () Bool)

(assert (= bs!15280 d!61335))

(assert (=> bs!15280 m!272945))

(assert (=> start!38616 d!61335))

(declare-fun d!61337 () Bool)

(assert (=> d!61337 (= (array_inv!3867 (buf!4557 thiss!1187)) (bvsge (size!4126 (buf!4557 thiss!1187)) #b00000000000000000000000000000000))))

(assert (=> b!173675 d!61337))

(declare-fun d!61339 () Bool)

(assert (=> d!61339 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4126 (buf!4557 thiss!1187))) ((_ sign_extend 32) (currentByte!8656 thiss!1187)) ((_ sign_extend 32) (currentBit!8651 thiss!1187)) ((_ sign_extend 32) nBits!340)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4126 (buf!4557 thiss!1187))) ((_ sign_extend 32) (currentByte!8656 thiss!1187)) ((_ sign_extend 32) (currentBit!8651 thiss!1187))) ((_ sign_extend 32) nBits!340)))))

(declare-fun bs!15281 () Bool)

(assert (= bs!15281 d!61339))

(assert (=> bs!15281 m!272981))

(assert (=> b!173678 d!61339))

(declare-fun d!61341 () Bool)

(assert (=> d!61341 (= (invariant!0 (currentBit!8651 thiss!1187) (currentByte!8656 thiss!1187) (size!4126 (buf!4557 thiss!1187))) (and (bvsge (currentBit!8651 thiss!1187) #b00000000000000000000000000000000) (bvslt (currentBit!8651 thiss!1187) #b00000000000000000000000000001000) (bvsge (currentByte!8656 thiss!1187) #b00000000000000000000000000000000) (or (bvslt (currentByte!8656 thiss!1187) (size!4126 (buf!4557 thiss!1187))) (and (= (currentBit!8651 thiss!1187) #b00000000000000000000000000000000) (= (currentByte!8656 thiss!1187) (size!4126 (buf!4557 thiss!1187)))))))))

(assert (=> b!173679 d!61341))

(push 1)

(assert (not b!173803))

(assert (not b!173806))

(assert (not bm!2870))

(assert (not d!61335))

(assert (not b!173809))

(assert (not b!173804))

(assert (not b!173796))

(assert (not b!173810))

(assert (not b!173800))

(assert (not d!61315))

(assert (not b!173802))

(assert (not d!61329))

(assert (not b!173807))

(assert (not b!173801))

(assert (not d!61339))

(check-sat)

(pop 1)

(push 1)

(check-sat)

