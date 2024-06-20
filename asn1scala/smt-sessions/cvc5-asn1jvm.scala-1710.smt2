; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47288 () Bool)

(assert start!47288)

(declare-fun b!225703 () Bool)

(declare-fun e!154145 () Bool)

(declare-fun e!154147 () Bool)

(assert (=> b!225703 (= e!154145 e!154147)))

(declare-fun res!189396 () Bool)

(assert (=> b!225703 (=> (not res!189396) (not e!154147))))

(declare-datatypes ((array!11249 0))(
  ( (array!11250 (arr!5893 (Array (_ BitVec 32) (_ BitVec 8))) (size!4936 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8968 0))(
  ( (BitStream!8969 (buf!5477 array!11249) (currentByte!10264 (_ BitVec 32)) (currentBit!10259 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8968)

(declare-datatypes ((tuple2!19310 0))(
  ( (tuple2!19311 (_1!10442 (_ BitVec 8)) (_2!10442 BitStream!8968)) )
))
(declare-fun lt!358773 () tuple2!19310)

(assert (=> b!225703 (= res!189396 (= (size!4936 (buf!5477 thiss!1870)) (size!4936 (buf!5477 (_2!10442 lt!358773)))))))

(declare-fun readByte!0 (BitStream!8968) tuple2!19310)

(assert (=> b!225703 (= lt!358773 (readByte!0 thiss!1870))))

(declare-fun b!225704 () Bool)

(declare-fun res!189395 () Bool)

(assert (=> b!225704 (=> (not res!189395) (not e!154145))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!225704 (= res!189395 (bvslt i!761 to!496))))

(declare-fun b!225705 () Bool)

(declare-fun res!189393 () Bool)

(assert (=> b!225705 (=> (not res!189393) (not e!154145))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225705 (= res!189393 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4936 (buf!5477 thiss!1870))) ((_ sign_extend 32) (currentByte!10264 thiss!1870)) ((_ sign_extend 32) (currentBit!10259 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!189394 () Bool)

(assert (=> start!47288 (=> (not res!189394) (not e!154145))))

(declare-fun arr!308 () array!11249)

(assert (=> start!47288 (= res!189394 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4936 arr!308))))))

(assert (=> start!47288 e!154145))

(assert (=> start!47288 true))

(declare-fun array_inv!4677 (array!11249) Bool)

(assert (=> start!47288 (array_inv!4677 arr!308)))

(declare-fun e!154144 () Bool)

(declare-fun inv!12 (BitStream!8968) Bool)

(assert (=> start!47288 (and (inv!12 thiss!1870) e!154144)))

(declare-fun b!225706 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225706 (= e!154147 (bvsgt #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4936 (buf!5477 (_2!10442 lt!358773))) (currentByte!10264 (_2!10442 lt!358773)) (currentBit!10259 (_2!10442 lt!358773)))))))

(declare-fun b!225707 () Bool)

(assert (=> b!225707 (= e!154144 (array_inv!4677 (buf!5477 thiss!1870)))))

(assert (= (and start!47288 res!189394) b!225705))

(assert (= (and b!225705 res!189393) b!225704))

(assert (= (and b!225704 res!189395) b!225703))

(assert (= (and b!225703 res!189396) b!225706))

(assert (= start!47288 b!225707))

(declare-fun m!346749 () Bool)

(assert (=> b!225703 m!346749))

(declare-fun m!346751 () Bool)

(assert (=> b!225707 m!346751))

(declare-fun m!346753 () Bool)

(assert (=> b!225706 m!346753))

(declare-fun m!346755 () Bool)

(assert (=> start!47288 m!346755))

(declare-fun m!346757 () Bool)

(assert (=> start!47288 m!346757))

(declare-fun m!346759 () Bool)

(assert (=> b!225705 m!346759))

(push 1)

(assert (not b!225705))

(assert (not b!225706))

(assert (not b!225707))

(assert (not start!47288))

(assert (not b!225703))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76596 () Bool)

(declare-fun e!154181 () Bool)

(assert (=> d!76596 e!154181))

(declare-fun res!189426 () Bool)

(assert (=> d!76596 (=> (not res!189426) (not e!154181))))

(declare-fun lt!358794 () (_ BitVec 64))

(declare-fun lt!358795 () (_ BitVec 64))

(declare-fun lt!358793 () (_ BitVec 64))

(assert (=> d!76596 (= res!189426 (= lt!358795 (bvsub lt!358794 lt!358793)))))

(assert (=> d!76596 (or (= (bvand lt!358794 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!358793 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!358794 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!358794 lt!358793) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76596 (= lt!358793 (remainingBits!0 ((_ sign_extend 32) (size!4936 (buf!5477 (_2!10442 lt!358773)))) ((_ sign_extend 32) (currentByte!10264 (_2!10442 lt!358773))) ((_ sign_extend 32) (currentBit!10259 (_2!10442 lt!358773)))))))

(declare-fun lt!358796 () (_ BitVec 64))

(declare-fun lt!358797 () (_ BitVec 64))

(assert (=> d!76596 (= lt!358794 (bvmul lt!358796 lt!358797))))

(assert (=> d!76596 (or (= lt!358796 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!358797 (bvsdiv (bvmul lt!358796 lt!358797) lt!358796)))))

(assert (=> d!76596 (= lt!358797 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76596 (= lt!358796 ((_ sign_extend 32) (size!4936 (buf!5477 (_2!10442 lt!358773)))))))

(assert (=> d!76596 (= lt!358795 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10264 (_2!10442 lt!358773))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10259 (_2!10442 lt!358773)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!76596 (invariant!0 (currentBit!10259 (_2!10442 lt!358773)) (currentByte!10264 (_2!10442 lt!358773)) (size!4936 (buf!5477 (_2!10442 lt!358773))))))

(assert (=> d!76596 (= (bitIndex!0 (size!4936 (buf!5477 (_2!10442 lt!358773))) (currentByte!10264 (_2!10442 lt!358773)) (currentBit!10259 (_2!10442 lt!358773))) lt!358795)))

(declare-fun b!225742 () Bool)

(declare-fun res!189427 () Bool)

(assert (=> b!225742 (=> (not res!189427) (not e!154181))))

(assert (=> b!225742 (= res!189427 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!358795))))

(declare-fun b!225743 () Bool)

(declare-fun lt!358792 () (_ BitVec 64))

(assert (=> b!225743 (= e!154181 (bvsle lt!358795 (bvmul lt!358792 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!225743 (or (= lt!358792 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!358792 #b0000000000000000000000000000000000000000000000000000000000001000) lt!358792)))))

(assert (=> b!225743 (= lt!358792 ((_ sign_extend 32) (size!4936 (buf!5477 (_2!10442 lt!358773)))))))

(assert (= (and d!76596 res!189426) b!225742))

(assert (= (and b!225742 res!189427) b!225743))

(declare-fun m!346787 () Bool)

(assert (=> d!76596 m!346787))

(declare-fun m!346789 () Bool)

(assert (=> d!76596 m!346789))

(assert (=> b!225706 d!76596))

(declare-fun d!76606 () Bool)

(assert (=> d!76606 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4936 (buf!5477 thiss!1870))) ((_ sign_extend 32) (currentByte!10264 thiss!1870)) ((_ sign_extend 32) (currentBit!10259 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4936 (buf!5477 thiss!1870))) ((_ sign_extend 32) (currentByte!10264 thiss!1870)) ((_ sign_extend 32) (currentBit!10259 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18723 () Bool)

(assert (= bs!18723 d!76606))

(declare-fun m!346791 () Bool)

(assert (=> bs!18723 m!346791))

(assert (=> b!225705 d!76606))

(declare-fun d!76608 () Bool)

(assert (=> d!76608 (= (array_inv!4677 arr!308) (bvsge (size!4936 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47288 d!76608))

(declare-fun d!76610 () Bool)

(assert (=> d!76610 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10259 thiss!1870) (currentByte!10264 thiss!1870) (size!4936 (buf!5477 thiss!1870))))))

(declare-fun bs!18724 () Bool)

(assert (= bs!18724 d!76610))

(declare-fun m!346793 () Bool)

(assert (=> bs!18724 m!346793))

(assert (=> start!47288 d!76610))

(declare-fun d!76612 () Bool)

(declare-fun lt!358863 () (_ BitVec 8))

(declare-fun lt!358864 () (_ BitVec 8))

(assert (=> d!76612 (= lt!358863 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5893 (buf!5477 thiss!1870)) (currentByte!10264 thiss!1870))) ((_ sign_extend 24) lt!358864))))))

(assert (=> d!76612 (= lt!358864 ((_ extract 7 0) (currentBit!10259 thiss!1870)))))

(declare-fun e!154198 () Bool)

(assert (=> d!76612 e!154198))

(declare-fun res!189448 () Bool)

(assert (=> d!76612 (=> (not res!189448) (not e!154198))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76612 (= res!189448 (validate_offset_bits!1 ((_ sign_extend 32) (size!4936 (buf!5477 thiss!1870))) ((_ sign_extend 32) (currentByte!10264 thiss!1870)) ((_ sign_extend 32) (currentBit!10259 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((Unit!16609 0))(
  ( (Unit!16610) )
))
(declare-datatypes ((tuple2!19318 0))(
  ( (tuple2!19319 (_1!10446 Unit!16609) (_2!10446 (_ BitVec 8))) )
))
(declare-fun Unit!16611 () Unit!16609)

(declare-fun Unit!16613 () Unit!16609)

(assert (=> d!76612 (= (readByte!0 thiss!1870) (tuple2!19311 (_2!10446 (ite (bvsgt ((_ sign_extend 24) lt!358864) #b00000000000000000000000000000000) (tuple2!19319 Unit!16611 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!358863) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5893 (buf!5477 thiss!1870)) (bvadd (currentByte!10264 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!358864)))))))) (tuple2!19319 Unit!16613 lt!358863))) (BitStream!8969 (buf!5477 thiss!1870) (bvadd (currentByte!10264 thiss!1870) #b00000000000000000000000000000001) (currentBit!10259 thiss!1870))))))

(declare-fun b!225760 () Bool)

(declare-fun e!154197 () Bool)

(assert (=> b!225760 (= e!154198 e!154197)))

(declare-fun res!189449 () Bool)

(assert (=> b!225760 (=> (not res!189449) (not e!154197))))

(declare-fun lt!358860 () tuple2!19310)

(assert (=> b!225760 (= res!189449 (= (buf!5477 (_2!10442 lt!358860)) (buf!5477 thiss!1870)))))

(declare-fun lt!358865 () (_ BitVec 8))

(declare-fun lt!358867 () (_ BitVec 8))

(declare-fun Unit!16615 () Unit!16609)

(declare-fun Unit!16616 () Unit!16609)

(assert (=> b!225760 (= lt!358860 (tuple2!19311 (_2!10446 (ite (bvsgt ((_ sign_extend 24) lt!358867) #b00000000000000000000000000000000) (tuple2!19319 Unit!16615 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!358865) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5893 (buf!5477 thiss!1870)) (bvadd (currentByte!10264 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!358867)))))))) (tuple2!19319 Unit!16616 lt!358865))) (BitStream!8969 (buf!5477 thiss!1870) (bvadd (currentByte!10264 thiss!1870) #b00000000000000000000000000000001) (currentBit!10259 thiss!1870))))))

(assert (=> b!225760 (= lt!358865 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5893 (buf!5477 thiss!1870)) (currentByte!10264 thiss!1870))) ((_ sign_extend 24) lt!358867))))))

(assert (=> b!225760 (= lt!358867 ((_ extract 7 0) (currentBit!10259 thiss!1870)))))

(declare-fun lt!358866 () (_ BitVec 64))

(declare-fun b!225761 () Bool)

(declare-fun lt!358862 () (_ BitVec 64))

(assert (=> b!225761 (= e!154197 (= (bitIndex!0 (size!4936 (buf!5477 (_2!10442 lt!358860))) (currentByte!10264 (_2!10442 lt!358860)) (currentBit!10259 (_2!10442 lt!358860))) (bvadd lt!358862 lt!358866)))))

(assert (=> b!225761 (or (not (= (bvand lt!358862 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!358866 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!358862 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!358862 lt!358866) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!225761 (= lt!358866 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!225761 (= lt!358862 (bitIndex!0 (size!4936 (buf!5477 thiss!1870)) (currentByte!10264 thiss!1870) (currentBit!10259 thiss!1870)))))

(assert (= (and d!76612 res!189448) b!225760))

(assert (= (and b!225760 res!189449) b!225761))

(declare-fun m!346813 () Bool)

(assert (=> d!76612 m!346813))

(declare-fun m!346815 () Bool)

(assert (=> d!76612 m!346815))

(declare-fun m!346817 () Bool)

(assert (=> d!76612 m!346817))

(assert (=> b!225760 m!346817))

(assert (=> b!225760 m!346813))

(declare-fun m!346819 () Bool)

(assert (=> b!225761 m!346819))

(declare-fun m!346821 () Bool)

(assert (=> b!225761 m!346821))

(assert (=> b!225703 d!76612))

(declare-fun d!76626 () Bool)

(assert (=> d!76626 (= (array_inv!4677 (buf!5477 thiss!1870)) (bvsge (size!4936 (buf!5477 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!225707 d!76626))

(push 1)

(assert (not d!76596))

(assert (not d!76606))

(assert (not d!76610))

(assert (not d!76612))

(assert (not b!225761))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76632 () Bool)

(assert (=> d!76632 (= (remainingBits!0 ((_ sign_extend 32) (size!4936 (buf!5477 (_2!10442 lt!358773)))) ((_ sign_extend 32) (currentByte!10264 (_2!10442 lt!358773))) ((_ sign_extend 32) (currentBit!10259 (_2!10442 lt!358773)))) (bvsub (bvmul ((_ sign_extend 32) (size!4936 (buf!5477 (_2!10442 lt!358773)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10264 (_2!10442 lt!358773))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10259 (_2!10442 lt!358773))))))))

(assert (=> d!76596 d!76632))

(declare-fun d!76634 () Bool)

(assert (=> d!76634 (= (invariant!0 (currentBit!10259 (_2!10442 lt!358773)) (currentByte!10264 (_2!10442 lt!358773)) (size!4936 (buf!5477 (_2!10442 lt!358773)))) (and (bvsge (currentBit!10259 (_2!10442 lt!358773)) #b00000000000000000000000000000000) (bvslt (currentBit!10259 (_2!10442 lt!358773)) #b00000000000000000000000000001000) (bvsge (currentByte!10264 (_2!10442 lt!358773)) #b00000000000000000000000000000000) (or (bvslt (currentByte!10264 (_2!10442 lt!358773)) (size!4936 (buf!5477 (_2!10442 lt!358773)))) (and (= (currentBit!10259 (_2!10442 lt!358773)) #b00000000000000000000000000000000) (= (currentByte!10264 (_2!10442 lt!358773)) (size!4936 (buf!5477 (_2!10442 lt!358773))))))))))

(assert (=> d!76596 d!76634))

(declare-fun d!76636 () Bool)

(assert (=> d!76636 (= (invariant!0 (currentBit!10259 thiss!1870) (currentByte!10264 thiss!1870) (size!4936 (buf!5477 thiss!1870))) (and (bvsge (currentBit!10259 thiss!1870) #b00000000000000000000000000000000) (bvslt (currentBit!10259 thiss!1870) #b00000000000000000000000000001000) (bvsge (currentByte!10264 thiss!1870) #b00000000000000000000000000000000) (or (bvslt (currentByte!10264 thiss!1870) (size!4936 (buf!5477 thiss!1870))) (and (= (currentBit!10259 thiss!1870) #b00000000000000000000000000000000) (= (currentByte!10264 thiss!1870) (size!4936 (buf!5477 thiss!1870)))))))))

(assert (=> d!76610 d!76636))

(declare-fun d!76638 () Bool)

(assert (=> d!76638 (= (remainingBits!0 ((_ sign_extend 32) (size!4936 (buf!5477 thiss!1870))) ((_ sign_extend 32) (currentByte!10264 thiss!1870)) ((_ sign_extend 32) (currentBit!10259 thiss!1870))) (bvsub (bvmul ((_ sign_extend 32) (size!4936 (buf!5477 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10264 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10259 thiss!1870)))))))

(assert (=> d!76606 d!76638))

(declare-fun d!76640 () Bool)

(assert (=> d!76640 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4936 (buf!5477 thiss!1870))) ((_ sign_extend 32) (currentByte!10264 thiss!1870)) ((_ sign_extend 32) (currentBit!10259 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4936 (buf!5477 thiss!1870))) ((_ sign_extend 32) (currentByte!10264 thiss!1870)) ((_ sign_extend 32) (currentBit!10259 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!18728 () Bool)

(assert (= bs!18728 d!76640))

(assert (=> bs!18728 m!346791))

(assert (=> d!76612 d!76640))

(declare-fun d!76642 () Bool)

(declare-fun e!154206 () Bool)

(assert (=> d!76642 e!154206))

(declare-fun res!189460 () Bool)

(assert (=> d!76642 (=> (not res!189460) (not e!154206))))

(declare-fun lt!358898 () (_ BitVec 64))

(declare-fun lt!358900 () (_ BitVec 64))

(declare-fun lt!358899 () (_ BitVec 64))

(assert (=> d!76642 (= res!189460 (= lt!358900 (bvsub lt!358899 lt!358898)))))

(assert (=> d!76642 (or (= (bvand lt!358899 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!358898 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!358899 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!358899 lt!358898) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76642 (= lt!358898 (remainingBits!0 ((_ sign_extend 32) (size!4936 (buf!5477 (_2!10442 lt!358860)))) ((_ sign_extend 32) (currentByte!10264 (_2!10442 lt!358860))) ((_ sign_extend 32) (currentBit!10259 (_2!10442 lt!358860)))))))

(declare-fun lt!358901 () (_ BitVec 64))

(declare-fun lt!358902 () (_ BitVec 64))

(assert (=> d!76642 (= lt!358899 (bvmul lt!358901 lt!358902))))

(assert (=> d!76642 (or (= lt!358901 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!358902 (bvsdiv (bvmul lt!358901 lt!358902) lt!358901)))))

(assert (=> d!76642 (= lt!358902 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76642 (= lt!358901 ((_ sign_extend 32) (size!4936 (buf!5477 (_2!10442 lt!358860)))))))

(assert (=> d!76642 (= lt!358900 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10264 (_2!10442 lt!358860))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10259 (_2!10442 lt!358860)))))))

(assert (=> d!76642 (invariant!0 (currentBit!10259 (_2!10442 lt!358860)) (currentByte!10264 (_2!10442 lt!358860)) (size!4936 (buf!5477 (_2!10442 lt!358860))))))

(assert (=> d!76642 (= (bitIndex!0 (size!4936 (buf!5477 (_2!10442 lt!358860))) (currentByte!10264 (_2!10442 lt!358860)) (currentBit!10259 (_2!10442 lt!358860))) lt!358900)))

(declare-fun b!225774 () Bool)

(declare-fun res!189461 () Bool)

(assert (=> b!225774 (=> (not res!189461) (not e!154206))))

(assert (=> b!225774 (= res!189461 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!358900))))

(declare-fun b!225775 () Bool)

(declare-fun lt!358897 () (_ BitVec 64))

(assert (=> b!225775 (= e!154206 (bvsle lt!358900 (bvmul lt!358897 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!225775 (or (= lt!358897 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!358897 #b0000000000000000000000000000000000000000000000000000000000001000) lt!358897)))))

(assert (=> b!225775 (= lt!358897 ((_ sign_extend 32) (size!4936 (buf!5477 (_2!10442 lt!358860)))))))

(assert (= (and d!76642 res!189460) b!225774))

(assert (= (and b!225774 res!189461) b!225775))

(declare-fun m!346839 () Bool)

(assert (=> d!76642 m!346839))

(declare-fun m!346841 () Bool)

(assert (=> d!76642 m!346841))

(assert (=> b!225761 d!76642))

(declare-fun d!76644 () Bool)

(declare-fun e!154207 () Bool)

(assert (=> d!76644 e!154207))

(declare-fun res!189462 () Bool)

(assert (=> d!76644 (=> (not res!189462) (not e!154207))))

(declare-fun lt!358906 () (_ BitVec 64))

(declare-fun lt!358905 () (_ BitVec 64))

(declare-fun lt!358904 () (_ BitVec 64))

(assert (=> d!76644 (= res!189462 (= lt!358906 (bvsub lt!358905 lt!358904)))))

(assert (=> d!76644 (or (= (bvand lt!358905 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!358904 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!358905 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!358905 lt!358904) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76644 (= lt!358904 (remainingBits!0 ((_ sign_extend 32) (size!4936 (buf!5477 thiss!1870))) ((_ sign_extend 32) (currentByte!10264 thiss!1870)) ((_ sign_extend 32) (currentBit!10259 thiss!1870))))))

(declare-fun lt!358907 () (_ BitVec 64))

(declare-fun lt!358908 () (_ BitVec 64))

(assert (=> d!76644 (= lt!358905 (bvmul lt!358907 lt!358908))))

(assert (=> d!76644 (or (= lt!358907 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!358908 (bvsdiv (bvmul lt!358907 lt!358908) lt!358907)))))

(assert (=> d!76644 (= lt!358908 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76644 (= lt!358907 ((_ sign_extend 32) (size!4936 (buf!5477 thiss!1870))))))

(assert (=> d!76644 (= lt!358906 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10264 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10259 thiss!1870))))))

(assert (=> d!76644 (invariant!0 (currentBit!10259 thiss!1870) (currentByte!10264 thiss!1870) (size!4936 (buf!5477 thiss!1870)))))

(assert (=> d!76644 (= (bitIndex!0 (size!4936 (buf!5477 thiss!1870)) (currentByte!10264 thiss!1870) (currentBit!10259 thiss!1870)) lt!358906)))

(declare-fun b!225776 () Bool)

(declare-fun res!189463 () Bool)

(assert (=> b!225776 (=> (not res!189463) (not e!154207))))

(assert (=> b!225776 (= res!189463 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!358906))))

(declare-fun b!225777 () Bool)

(declare-fun lt!358903 () (_ BitVec 64))

(assert (=> b!225777 (= e!154207 (bvsle lt!358906 (bvmul lt!358903 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!225777 (or (= lt!358903 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!358903 #b0000000000000000000000000000000000000000000000000000000000001000) lt!358903)))))

(assert (=> b!225777 (= lt!358903 ((_ sign_extend 32) (size!4936 (buf!5477 thiss!1870))))))

(assert (= (and d!76644 res!189462) b!225776))

(assert (= (and b!225776 res!189463) b!225777))

(assert (=> d!76644 m!346791))

(assert (=> d!76644 m!346793))

(assert (=> b!225761 d!76644))

(push 1)

(assert (not d!76642))

(assert (not d!76640))

(assert (not d!76644))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

