; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18320 () Bool)

(assert start!18320)

(declare-fun b!90889 () Bool)

(declare-fun res!74984 () Bool)

(declare-fun e!59807 () Bool)

(assert (=> b!90889 (=> (not res!74984) (not e!59807))))

(declare-datatypes ((array!4255 0))(
  ( (array!4256 (arr!2555 (Array (_ BitVec 32) (_ BitVec 8))) (size!1918 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3398 0))(
  ( (BitStream!3399 (buf!2308 array!4255) (currentByte!4589 (_ BitVec 32)) (currentBit!4584 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3398)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!90889 (= res!74984 (invariant!0 (currentBit!4584 thiss!1151) (currentByte!4589 thiss!1151) (size!1918 (buf!2308 thiss!1151))))))

(declare-fun b!90890 () Bool)

(declare-fun e!59801 () Bool)

(declare-datatypes ((tuple2!7566 0))(
  ( (tuple2!7567 (_1!4028 BitStream!3398) (_2!4028 Bool)) )
))
(declare-fun lt!137449 () tuple2!7566)

(declare-fun lt!137451 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!90890 (= e!59801 (= (bitIndex!0 (size!1918 (buf!2308 (_1!4028 lt!137449))) (currentByte!4589 (_1!4028 lt!137449)) (currentBit!4584 (_1!4028 lt!137449))) lt!137451))))

(declare-fun b!90891 () Bool)

(declare-fun e!59804 () Bool)

(assert (=> b!90891 (= e!59807 e!59804)))

(declare-fun res!74985 () Bool)

(assert (=> b!90891 (=> (not res!74985) (not e!59804))))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun lt!137452 () (_ BitVec 64))

(declare-fun lt!137450 () (_ BitVec 64))

(assert (=> b!90891 (= res!74985 (= lt!137452 (bvadd lt!137450 ((_ sign_extend 32) i!576))))))

(declare-fun thiss!1152 () BitStream!3398)

(assert (=> b!90891 (= lt!137452 (bitIndex!0 (size!1918 (buf!2308 thiss!1152)) (currentByte!4589 thiss!1152) (currentBit!4584 thiss!1152)))))

(assert (=> b!90891 (= lt!137450 (bitIndex!0 (size!1918 (buf!2308 thiss!1151)) (currentByte!4589 thiss!1151) (currentBit!4584 thiss!1151)))))

(declare-fun b!90892 () Bool)

(declare-fun e!59806 () Bool)

(assert (=> b!90892 (= e!59804 (not e!59806))))

(declare-fun res!74987 () Bool)

(assert (=> b!90892 (=> res!74987 e!59806)))

(declare-datatypes ((Unit!5828 0))(
  ( (Unit!5829) )
))
(declare-datatypes ((tuple2!7568 0))(
  ( (tuple2!7569 (_1!4029 Unit!5828) (_2!4029 BitStream!3398)) )
))
(declare-fun lt!137453 () tuple2!7568)

(assert (=> b!90892 (= res!74987 (not (invariant!0 (currentBit!4584 (_2!4029 lt!137453)) (currentByte!4589 (_2!4029 lt!137453)) (size!1918 (buf!2308 (_2!4029 lt!137453))))))))

(declare-fun e!59799 () Bool)

(assert (=> b!90892 e!59799))

(declare-fun res!74982 () Bool)

(assert (=> b!90892 (=> (not res!74982) (not e!59799))))

(assert (=> b!90892 (= res!74982 (= (size!1918 (buf!2308 thiss!1152)) (size!1918 (buf!2308 (_2!4029 lt!137453)))))))

(declare-fun lt!137454 () Bool)

(declare-fun appendBit!0 (BitStream!3398 Bool) tuple2!7568)

(assert (=> b!90892 (= lt!137453 (appendBit!0 thiss!1152 lt!137454))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!90892 (= lt!137454 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!90893 () Bool)

(declare-fun res!74991 () Bool)

(assert (=> b!90893 (=> (not res!74991) (not e!59807))))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!90893 (= res!74991 (and (bvsle i!576 nBits!336) (= (size!1918 (buf!2308 thiss!1152)) (size!1918 (buf!2308 thiss!1151)))))))

(declare-fun b!90894 () Bool)

(assert (=> b!90894 (= e!59806 (or (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (bvslt (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000) (not (= (size!1918 (buf!2308 (_2!4029 lt!137453))) (size!1918 (buf!2308 thiss!1151)))) (let ((bdg!4255 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))) (let ((bdg!4256 (bvand lt!137450 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (not (= bdg!4256 (bvand bdg!4255 #b1000000000000000000000000000000000000000000000000000000000000000))) (= bdg!4256 (bvand (bvadd lt!137450 bdg!4255) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!90895 () Bool)

(declare-fun e!59808 () Bool)

(assert (=> b!90895 (= e!59799 e!59808)))

(declare-fun res!74988 () Bool)

(assert (=> b!90895 (=> (not res!74988) (not e!59808))))

(assert (=> b!90895 (= res!74988 (= lt!137451 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!137452)))))

(assert (=> b!90895 (= lt!137451 (bitIndex!0 (size!1918 (buf!2308 (_2!4029 lt!137453))) (currentByte!4589 (_2!4029 lt!137453)) (currentBit!4584 (_2!4029 lt!137453))))))

(declare-fun b!90896 () Bool)

(assert (=> b!90896 (= e!59808 e!59801)))

(declare-fun res!74994 () Bool)

(assert (=> b!90896 (=> (not res!74994) (not e!59801))))

(assert (=> b!90896 (= res!74994 (and (= (_2!4028 lt!137449) lt!137454) (= (_1!4028 lt!137449) (_2!4029 lt!137453))))))

(declare-fun readBitPure!0 (BitStream!3398) tuple2!7566)

(declare-fun readerFrom!0 (BitStream!3398 (_ BitVec 32) (_ BitVec 32)) BitStream!3398)

(assert (=> b!90896 (= lt!137449 (readBitPure!0 (readerFrom!0 (_2!4029 lt!137453) (currentBit!4584 thiss!1152) (currentByte!4589 thiss!1152))))))

(declare-fun b!90897 () Bool)

(declare-fun res!74983 () Bool)

(assert (=> b!90897 (=> (not res!74983) (not e!59807))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!90897 (= res!74983 (validate_offset_bits!1 ((_ sign_extend 32) (size!1918 (buf!2308 thiss!1151))) ((_ sign_extend 32) (currentByte!4589 thiss!1151)) ((_ sign_extend 32) (currentBit!4584 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun res!74995 () Bool)

(assert (=> start!18320 (=> (not res!74995) (not e!59807))))

(assert (=> start!18320 (= res!74995 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18320 e!59807))

(declare-fun e!59800 () Bool)

(declare-fun inv!12 (BitStream!3398) Bool)

(assert (=> start!18320 (and (inv!12 thiss!1152) e!59800)))

(declare-fun e!59803 () Bool)

(assert (=> start!18320 (and (inv!12 thiss!1151) e!59803)))

(assert (=> start!18320 true))

(declare-fun b!90898 () Bool)

(declare-fun res!74989 () Bool)

(assert (=> b!90898 (=> (not res!74989) (not e!59807))))

(assert (=> b!90898 (= res!74989 (invariant!0 (currentBit!4584 thiss!1152) (currentByte!4589 thiss!1152) (size!1918 (buf!2308 thiss!1152))))))

(declare-fun b!90899 () Bool)

(declare-fun array_inv!1764 (array!4255) Bool)

(assert (=> b!90899 (= e!59800 (array_inv!1764 (buf!2308 thiss!1152)))))

(declare-fun b!90900 () Bool)

(declare-fun res!74993 () Bool)

(assert (=> b!90900 (=> (not res!74993) (not e!59808))))

(declare-fun isPrefixOf!0 (BitStream!3398 BitStream!3398) Bool)

(assert (=> b!90900 (= res!74993 (isPrefixOf!0 thiss!1152 (_2!4029 lt!137453)))))

(declare-fun b!90901 () Bool)

(assert (=> b!90901 (= e!59803 (array_inv!1764 (buf!2308 thiss!1151)))))

(declare-fun b!90902 () Bool)

(declare-fun res!74992 () Bool)

(assert (=> b!90902 (=> (not res!74992) (not e!59804))))

(assert (=> b!90902 (= res!74992 (bvslt i!576 nBits!336))))

(declare-fun b!90903 () Bool)

(declare-fun res!74986 () Bool)

(assert (=> b!90903 (=> (not res!74986) (not e!59804))))

(assert (=> b!90903 (= res!74986 (validate_offset_bits!1 ((_ sign_extend 32) (size!1918 (buf!2308 thiss!1152))) ((_ sign_extend 32) (currentByte!4589 thiss!1152)) ((_ sign_extend 32) (currentBit!4584 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!90904 () Bool)

(declare-fun res!74990 () Bool)

(assert (=> b!90904 (=> (not res!74990) (not e!59807))))

(assert (=> b!90904 (= res!74990 (bvsge i!576 #b00000000000000000000000000000000))))

(assert (= (and start!18320 res!74995) b!90897))

(assert (= (and b!90897 res!74983) b!90889))

(assert (= (and b!90889 res!74984) b!90904))

(assert (= (and b!90904 res!74990) b!90898))

(assert (= (and b!90898 res!74989) b!90893))

(assert (= (and b!90893 res!74991) b!90891))

(assert (= (and b!90891 res!74985) b!90903))

(assert (= (and b!90903 res!74986) b!90902))

(assert (= (and b!90902 res!74992) b!90892))

(assert (= (and b!90892 res!74982) b!90895))

(assert (= (and b!90895 res!74988) b!90900))

(assert (= (and b!90900 res!74993) b!90896))

(assert (= (and b!90896 res!74994) b!90890))

(assert (= (and b!90892 (not res!74987)) b!90894))

(assert (= start!18320 b!90899))

(assert (= start!18320 b!90901))

(declare-fun m!135205 () Bool)

(assert (=> b!90901 m!135205))

(declare-fun m!135207 () Bool)

(assert (=> b!90895 m!135207))

(declare-fun m!135209 () Bool)

(assert (=> b!90890 m!135209))

(declare-fun m!135211 () Bool)

(assert (=> b!90892 m!135211))

(declare-fun m!135213 () Bool)

(assert (=> b!90892 m!135213))

(declare-fun m!135215 () Bool)

(assert (=> start!18320 m!135215))

(declare-fun m!135217 () Bool)

(assert (=> start!18320 m!135217))

(declare-fun m!135219 () Bool)

(assert (=> b!90897 m!135219))

(declare-fun m!135221 () Bool)

(assert (=> b!90891 m!135221))

(declare-fun m!135223 () Bool)

(assert (=> b!90891 m!135223))

(declare-fun m!135225 () Bool)

(assert (=> b!90889 m!135225))

(declare-fun m!135227 () Bool)

(assert (=> b!90899 m!135227))

(declare-fun m!135229 () Bool)

(assert (=> b!90898 m!135229))

(declare-fun m!135231 () Bool)

(assert (=> b!90903 m!135231))

(declare-fun m!135233 () Bool)

(assert (=> b!90896 m!135233))

(assert (=> b!90896 m!135233))

(declare-fun m!135235 () Bool)

(assert (=> b!90896 m!135235))

(declare-fun m!135237 () Bool)

(assert (=> b!90900 m!135237))

(push 1)

(assert (not b!90898))

(assert (not start!18320))

(assert (not b!90897))

(assert (not b!90892))

(assert (not b!90901))

(assert (not b!90900))

(assert (not b!90889))

(assert (not b!90896))

(assert (not b!90890))

(assert (not b!90903))

(assert (not b!90891))

(assert (not b!90895))

(assert (not b!90899))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!28288 () Bool)

(assert (=> d!28288 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4584 thiss!1152) (currentByte!4589 thiss!1152) (size!1918 (buf!2308 thiss!1152))))))

(declare-fun bs!6988 () Bool)

(assert (= bs!6988 d!28288))

(assert (=> bs!6988 m!135229))

(assert (=> start!18320 d!28288))

(declare-fun d!28290 () Bool)

(assert (=> d!28290 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4584 thiss!1151) (currentByte!4589 thiss!1151) (size!1918 (buf!2308 thiss!1151))))))

(declare-fun bs!6989 () Bool)

(assert (= bs!6989 d!28290))

(assert (=> bs!6989 m!135225))

(assert (=> start!18320 d!28290))

(declare-fun d!28292 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!28292 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1918 (buf!2308 thiss!1152))) ((_ sign_extend 32) (currentByte!4589 thiss!1152)) ((_ sign_extend 32) (currentBit!4584 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1918 (buf!2308 thiss!1152))) ((_ sign_extend 32) (currentByte!4589 thiss!1152)) ((_ sign_extend 32) (currentBit!4584 thiss!1152))) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun bs!6990 () Bool)

(assert (= bs!6990 d!28292))

(declare-fun m!135249 () Bool)

(assert (=> bs!6990 m!135249))

(assert (=> b!90903 d!28292))

(declare-fun d!28294 () Bool)

(assert (=> d!28294 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1918 (buf!2308 thiss!1151))) ((_ sign_extend 32) (currentByte!4589 thiss!1151)) ((_ sign_extend 32) (currentBit!4584 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1918 (buf!2308 thiss!1151))) ((_ sign_extend 32) (currentByte!4589 thiss!1151)) ((_ sign_extend 32) (currentBit!4584 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6991 () Bool)

(assert (= bs!6991 d!28294))

(declare-fun m!135253 () Bool)

(assert (=> bs!6991 m!135253))

(assert (=> b!90897 d!28294))

(declare-fun d!28298 () Bool)

(declare-fun e!59827 () Bool)

(assert (=> d!28298 e!59827))

(declare-fun res!75027 () Bool)

(assert (=> d!28298 (=> (not res!75027) (not e!59827))))

(declare-fun lt!137516 () (_ BitVec 64))

(declare-fun lt!137515 () (_ BitVec 64))

(declare-fun lt!137513 () (_ BitVec 64))

(assert (=> d!28298 (= res!75027 (= lt!137515 (bvsub lt!137516 lt!137513)))))

(assert (=> d!28298 (or (= (bvand lt!137516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137513 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137516 lt!137513) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28298 (= lt!137513 (remainingBits!0 ((_ sign_extend 32) (size!1918 (buf!2308 (_2!4029 lt!137453)))) ((_ sign_extend 32) (currentByte!4589 (_2!4029 lt!137453))) ((_ sign_extend 32) (currentBit!4584 (_2!4029 lt!137453)))))))

(declare-fun lt!137517 () (_ BitVec 64))

(declare-fun lt!137514 () (_ BitVec 64))

(assert (=> d!28298 (= lt!137516 (bvmul lt!137517 lt!137514))))

(assert (=> d!28298 (or (= lt!137517 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137514 (bvsdiv (bvmul lt!137517 lt!137514) lt!137517)))))

(assert (=> d!28298 (= lt!137514 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28298 (= lt!137517 ((_ sign_extend 32) (size!1918 (buf!2308 (_2!4029 lt!137453)))))))

(assert (=> d!28298 (= lt!137515 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4589 (_2!4029 lt!137453))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4584 (_2!4029 lt!137453)))))))

(assert (=> d!28298 (invariant!0 (currentBit!4584 (_2!4029 lt!137453)) (currentByte!4589 (_2!4029 lt!137453)) (size!1918 (buf!2308 (_2!4029 lt!137453))))))

(assert (=> d!28298 (= (bitIndex!0 (size!1918 (buf!2308 (_2!4029 lt!137453))) (currentByte!4589 (_2!4029 lt!137453)) (currentBit!4584 (_2!4029 lt!137453))) lt!137515)))

(declare-fun b!90935 () Bool)

(declare-fun res!75028 () Bool)

(assert (=> b!90935 (=> (not res!75028) (not e!59827))))

(assert (=> b!90935 (= res!75028 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137515))))

(declare-fun b!90936 () Bool)

(declare-fun lt!137512 () (_ BitVec 64))

(assert (=> b!90936 (= e!59827 (bvsle lt!137515 (bvmul lt!137512 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90936 (or (= lt!137512 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137512 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137512)))))

(assert (=> b!90936 (= lt!137512 ((_ sign_extend 32) (size!1918 (buf!2308 (_2!4029 lt!137453)))))))

(assert (= (and d!28298 res!75027) b!90935))

(assert (= (and b!90935 res!75028) b!90936))

(declare-fun m!135257 () Bool)

(assert (=> d!28298 m!135257))

(assert (=> d!28298 m!135211))

(assert (=> b!90895 d!28298))

(declare-fun d!28304 () Bool)

(declare-datatypes ((tuple2!7572 0))(
  ( (tuple2!7573 (_1!4031 Bool) (_2!4031 BitStream!3398)) )
))
(declare-fun lt!137520 () tuple2!7572)

(declare-fun readBit!0 (BitStream!3398) tuple2!7572)

(assert (=> d!28304 (= lt!137520 (readBit!0 (readerFrom!0 (_2!4029 lt!137453) (currentBit!4584 thiss!1152) (currentByte!4589 thiss!1152))))))

(assert (=> d!28304 (= (readBitPure!0 (readerFrom!0 (_2!4029 lt!137453) (currentBit!4584 thiss!1152) (currentByte!4589 thiss!1152))) (tuple2!7567 (_2!4031 lt!137520) (_1!4031 lt!137520)))))

(declare-fun bs!6992 () Bool)

(assert (= bs!6992 d!28304))

(assert (=> bs!6992 m!135233))

(declare-fun m!135259 () Bool)

(assert (=> bs!6992 m!135259))

(assert (=> b!90896 d!28304))

(declare-fun d!28306 () Bool)

(declare-fun e!59834 () Bool)

(assert (=> d!28306 e!59834))

(declare-fun res!75040 () Bool)

(assert (=> d!28306 (=> (not res!75040) (not e!59834))))

(assert (=> d!28306 (= res!75040 (invariant!0 (currentBit!4584 (_2!4029 lt!137453)) (currentByte!4589 (_2!4029 lt!137453)) (size!1918 (buf!2308 (_2!4029 lt!137453)))))))

(assert (=> d!28306 (= (readerFrom!0 (_2!4029 lt!137453) (currentBit!4584 thiss!1152) (currentByte!4589 thiss!1152)) (BitStream!3399 (buf!2308 (_2!4029 lt!137453)) (currentByte!4589 thiss!1152) (currentBit!4584 thiss!1152)))))

(declare-fun b!90949 () Bool)

(assert (=> b!90949 (= e!59834 (invariant!0 (currentBit!4584 thiss!1152) (currentByte!4589 thiss!1152) (size!1918 (buf!2308 (_2!4029 lt!137453)))))))

(assert (= (and d!28306 res!75040) b!90949))

(assert (=> d!28306 m!135211))

(declare-fun m!135261 () Bool)

(assert (=> b!90949 m!135261))

(assert (=> b!90896 d!28306))

(declare-fun d!28308 () Bool)

(assert (=> d!28308 (= (array_inv!1764 (buf!2308 thiss!1152)) (bvsge (size!1918 (buf!2308 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!90899 d!28308))

(declare-fun d!28310 () Bool)

(declare-fun res!75070 () Bool)

(declare-fun e!59850 () Bool)

(assert (=> d!28310 (=> (not res!75070) (not e!59850))))

(assert (=> d!28310 (= res!75070 (= (size!1918 (buf!2308 thiss!1152)) (size!1918 (buf!2308 (_2!4029 lt!137453)))))))

(assert (=> d!28310 (= (isPrefixOf!0 thiss!1152 (_2!4029 lt!137453)) e!59850)))

(declare-fun b!90978 () Bool)

(declare-fun res!75069 () Bool)

(assert (=> b!90978 (=> (not res!75069) (not e!59850))))

(assert (=> b!90978 (= res!75069 (bvsle (bitIndex!0 (size!1918 (buf!2308 thiss!1152)) (currentByte!4589 thiss!1152) (currentBit!4584 thiss!1152)) (bitIndex!0 (size!1918 (buf!2308 (_2!4029 lt!137453))) (currentByte!4589 (_2!4029 lt!137453)) (currentBit!4584 (_2!4029 lt!137453)))))))

(declare-fun b!90979 () Bool)

(declare-fun e!59851 () Bool)

(assert (=> b!90979 (= e!59850 e!59851)))

(declare-fun res!75071 () Bool)

(assert (=> b!90979 (=> res!75071 e!59851)))

(assert (=> b!90979 (= res!75071 (= (size!1918 (buf!2308 thiss!1152)) #b00000000000000000000000000000000))))

(declare-fun b!90980 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4255 array!4255 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!90980 (= e!59851 (arrayBitRangesEq!0 (buf!2308 thiss!1152) (buf!2308 (_2!4029 lt!137453)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1918 (buf!2308 thiss!1152)) (currentByte!4589 thiss!1152) (currentBit!4584 thiss!1152))))))

(assert (= (and d!28310 res!75070) b!90978))

(assert (= (and b!90978 res!75069) b!90979))

(assert (= (and b!90979 (not res!75071)) b!90980))

(assert (=> b!90978 m!135221))

(assert (=> b!90978 m!135207))

(assert (=> b!90980 m!135221))

(assert (=> b!90980 m!135221))

(declare-fun m!135297 () Bool)

(assert (=> b!90980 m!135297))

(assert (=> b!90900 d!28310))

(declare-fun d!28328 () Bool)

(assert (=> d!28328 (= (invariant!0 (currentBit!4584 thiss!1151) (currentByte!4589 thiss!1151) (size!1918 (buf!2308 thiss!1151))) (and (bvsge (currentBit!4584 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4584 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4589 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4589 thiss!1151) (size!1918 (buf!2308 thiss!1151))) (and (= (currentBit!4584 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4589 thiss!1151) (size!1918 (buf!2308 thiss!1151)))))))))

(assert (=> b!90889 d!28328))

(declare-fun d!28340 () Bool)

(assert (=> d!28340 (= (invariant!0 (currentBit!4584 thiss!1152) (currentByte!4589 thiss!1152) (size!1918 (buf!2308 thiss!1152))) (and (bvsge (currentBit!4584 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4584 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4589 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4589 thiss!1152) (size!1918 (buf!2308 thiss!1152))) (and (= (currentBit!4584 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4589 thiss!1152) (size!1918 (buf!2308 thiss!1152)))))))))

(assert (=> b!90898 d!28340))

(declare-fun d!28342 () Bool)

(declare-fun e!59853 () Bool)

(assert (=> d!28342 e!59853))

(declare-fun res!75074 () Bool)

(assert (=> d!28342 (=> (not res!75074) (not e!59853))))

(declare-fun lt!137572 () (_ BitVec 64))

(declare-fun lt!137573 () (_ BitVec 64))

(declare-fun lt!137570 () (_ BitVec 64))

(assert (=> d!28342 (= res!75074 (= lt!137572 (bvsub lt!137573 lt!137570)))))

(assert (=> d!28342 (or (= (bvand lt!137573 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137570 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137573 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137573 lt!137570) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28342 (= lt!137570 (remainingBits!0 ((_ sign_extend 32) (size!1918 (buf!2308 thiss!1152))) ((_ sign_extend 32) (currentByte!4589 thiss!1152)) ((_ sign_extend 32) (currentBit!4584 thiss!1152))))))

(declare-fun lt!137574 () (_ BitVec 64))

(declare-fun lt!137571 () (_ BitVec 64))

(assert (=> d!28342 (= lt!137573 (bvmul lt!137574 lt!137571))))

(assert (=> d!28342 (or (= lt!137574 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137571 (bvsdiv (bvmul lt!137574 lt!137571) lt!137574)))))

(assert (=> d!28342 (= lt!137571 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28342 (= lt!137574 ((_ sign_extend 32) (size!1918 (buf!2308 thiss!1152))))))

(assert (=> d!28342 (= lt!137572 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4589 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4584 thiss!1152))))))

(assert (=> d!28342 (invariant!0 (currentBit!4584 thiss!1152) (currentByte!4589 thiss!1152) (size!1918 (buf!2308 thiss!1152)))))

(assert (=> d!28342 (= (bitIndex!0 (size!1918 (buf!2308 thiss!1152)) (currentByte!4589 thiss!1152) (currentBit!4584 thiss!1152)) lt!137572)))

(declare-fun b!90983 () Bool)

(declare-fun res!75075 () Bool)

(assert (=> b!90983 (=> (not res!75075) (not e!59853))))

(assert (=> b!90983 (= res!75075 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137572))))

(declare-fun b!90984 () Bool)

(declare-fun lt!137569 () (_ BitVec 64))

(assert (=> b!90984 (= e!59853 (bvsle lt!137572 (bvmul lt!137569 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90984 (or (= lt!137569 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137569 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137569)))))

(assert (=> b!90984 (= lt!137569 ((_ sign_extend 32) (size!1918 (buf!2308 thiss!1152))))))

(assert (= (and d!28342 res!75074) b!90983))

(assert (= (and b!90983 res!75075) b!90984))

(assert (=> d!28342 m!135249))

(assert (=> d!28342 m!135229))

(assert (=> b!90891 d!28342))

(declare-fun d!28344 () Bool)

(declare-fun e!59854 () Bool)

(assert (=> d!28344 e!59854))

(declare-fun res!75076 () Bool)

(assert (=> d!28344 (=> (not res!75076) (not e!59854))))

(declare-fun lt!137578 () (_ BitVec 64))

(declare-fun lt!137576 () (_ BitVec 64))

(declare-fun lt!137579 () (_ BitVec 64))

(assert (=> d!28344 (= res!75076 (= lt!137578 (bvsub lt!137579 lt!137576)))))

(assert (=> d!28344 (or (= (bvand lt!137579 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137576 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137579 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137579 lt!137576) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28344 (= lt!137576 (remainingBits!0 ((_ sign_extend 32) (size!1918 (buf!2308 thiss!1151))) ((_ sign_extend 32) (currentByte!4589 thiss!1151)) ((_ sign_extend 32) (currentBit!4584 thiss!1151))))))

(declare-fun lt!137580 () (_ BitVec 64))

(declare-fun lt!137577 () (_ BitVec 64))

(assert (=> d!28344 (= lt!137579 (bvmul lt!137580 lt!137577))))

(assert (=> d!28344 (or (= lt!137580 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137577 (bvsdiv (bvmul lt!137580 lt!137577) lt!137580)))))

(assert (=> d!28344 (= lt!137577 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28344 (= lt!137580 ((_ sign_extend 32) (size!1918 (buf!2308 thiss!1151))))))

(assert (=> d!28344 (= lt!137578 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4589 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4584 thiss!1151))))))

(assert (=> d!28344 (invariant!0 (currentBit!4584 thiss!1151) (currentByte!4589 thiss!1151) (size!1918 (buf!2308 thiss!1151)))))

(assert (=> d!28344 (= (bitIndex!0 (size!1918 (buf!2308 thiss!1151)) (currentByte!4589 thiss!1151) (currentBit!4584 thiss!1151)) lt!137578)))

(declare-fun b!90985 () Bool)

(declare-fun res!75077 () Bool)

(assert (=> b!90985 (=> (not res!75077) (not e!59854))))

(assert (=> b!90985 (= res!75077 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137578))))

(declare-fun b!90986 () Bool)

(declare-fun lt!137575 () (_ BitVec 64))

(assert (=> b!90986 (= e!59854 (bvsle lt!137578 (bvmul lt!137575 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90986 (or (= lt!137575 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137575 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137575)))))

(assert (=> b!90986 (= lt!137575 ((_ sign_extend 32) (size!1918 (buf!2308 thiss!1151))))))

(assert (= (and d!28344 res!75076) b!90985))

(assert (= (and b!90985 res!75077) b!90986))

(assert (=> d!28344 m!135253))

(assert (=> d!28344 m!135225))

(assert (=> b!90891 d!28344))

(declare-fun d!28346 () Bool)

(assert (=> d!28346 (= (invariant!0 (currentBit!4584 (_2!4029 lt!137453)) (currentByte!4589 (_2!4029 lt!137453)) (size!1918 (buf!2308 (_2!4029 lt!137453)))) (and (bvsge (currentBit!4584 (_2!4029 lt!137453)) #b00000000000000000000000000000000) (bvslt (currentBit!4584 (_2!4029 lt!137453)) #b00000000000000000000000000001000) (bvsge (currentByte!4589 (_2!4029 lt!137453)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4589 (_2!4029 lt!137453)) (size!1918 (buf!2308 (_2!4029 lt!137453)))) (and (= (currentBit!4584 (_2!4029 lt!137453)) #b00000000000000000000000000000000) (= (currentByte!4589 (_2!4029 lt!137453)) (size!1918 (buf!2308 (_2!4029 lt!137453))))))))))

(assert (=> b!90892 d!28346))

(declare-fun b!91012 () Bool)

(declare-fun e!59870 () Bool)

(declare-fun e!59869 () Bool)

(assert (=> b!91012 (= e!59870 e!59869)))

(declare-fun res!75102 () Bool)

(assert (=> b!91012 (=> (not res!75102) (not e!59869))))

(declare-fun lt!137598 () tuple2!7568)

(declare-fun lt!137600 () tuple2!7566)

(assert (=> b!91012 (= res!75102 (and (= (_2!4028 lt!137600) lt!137454) (= (_1!4028 lt!137600) (_2!4029 lt!137598))))))

(assert (=> b!91012 (= lt!137600 (readBitPure!0 (readerFrom!0 (_2!4029 lt!137598) (currentBit!4584 thiss!1152) (currentByte!4589 thiss!1152))))))

(declare-fun b!91013 () Bool)

(assert (=> b!91013 (= e!59869 (= (bitIndex!0 (size!1918 (buf!2308 (_1!4028 lt!137600))) (currentByte!4589 (_1!4028 lt!137600)) (currentBit!4584 (_1!4028 lt!137600))) (bitIndex!0 (size!1918 (buf!2308 (_2!4029 lt!137598))) (currentByte!4589 (_2!4029 lt!137598)) (currentBit!4584 (_2!4029 lt!137598)))))))

(declare-fun b!91010 () Bool)

(declare-fun res!75103 () Bool)

(assert (=> b!91010 (=> (not res!75103) (not e!59870))))

(declare-fun lt!137601 () (_ BitVec 64))

(declare-fun lt!137599 () (_ BitVec 64))

(assert (=> b!91010 (= res!75103 (= (bitIndex!0 (size!1918 (buf!2308 (_2!4029 lt!137598))) (currentByte!4589 (_2!4029 lt!137598)) (currentBit!4584 (_2!4029 lt!137598))) (bvadd lt!137601 lt!137599)))))

(assert (=> b!91010 (or (not (= (bvand lt!137601 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137599 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!137601 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!137601 lt!137599) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!91010 (= lt!137599 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!91010 (= lt!137601 (bitIndex!0 (size!1918 (buf!2308 thiss!1152)) (currentByte!4589 thiss!1152) (currentBit!4584 thiss!1152)))))

(declare-fun d!28348 () Bool)

(assert (=> d!28348 e!59870))

(declare-fun res!75101 () Bool)

(assert (=> d!28348 (=> (not res!75101) (not e!59870))))

(assert (=> d!28348 (= res!75101 (= (size!1918 (buf!2308 thiss!1152)) (size!1918 (buf!2308 (_2!4029 lt!137598)))))))

(declare-fun choose!16 (BitStream!3398 Bool) tuple2!7568)

(assert (=> d!28348 (= lt!137598 (choose!16 thiss!1152 lt!137454))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!28348 (validate_offset_bit!0 ((_ sign_extend 32) (size!1918 (buf!2308 thiss!1152))) ((_ sign_extend 32) (currentByte!4589 thiss!1152)) ((_ sign_extend 32) (currentBit!4584 thiss!1152)))))

(assert (=> d!28348 (= (appendBit!0 thiss!1152 lt!137454) lt!137598)))

(declare-fun b!91011 () Bool)

(declare-fun res!75104 () Bool)

(assert (=> b!91011 (=> (not res!75104) (not e!59870))))

(assert (=> b!91011 (= res!75104 (isPrefixOf!0 thiss!1152 (_2!4029 lt!137598)))))

(assert (= (and d!28348 res!75101) b!91010))

(assert (= (and b!91010 res!75103) b!91011))

(assert (= (and b!91011 res!75104) b!91012))

(assert (= (and b!91012 res!75102) b!91013))

(declare-fun m!135311 () Bool)

(assert (=> b!91011 m!135311))

(declare-fun m!135313 () Bool)

(assert (=> b!91012 m!135313))

(assert (=> b!91012 m!135313))

(declare-fun m!135315 () Bool)

(assert (=> b!91012 m!135315))

(declare-fun m!135317 () Bool)

(assert (=> d!28348 m!135317))

(declare-fun m!135319 () Bool)

(assert (=> d!28348 m!135319))

(declare-fun m!135321 () Bool)

(assert (=> b!91013 m!135321))

(declare-fun m!135323 () Bool)

(assert (=> b!91013 m!135323))

(assert (=> b!91010 m!135323))

(assert (=> b!91010 m!135221))

(assert (=> b!90892 d!28348))

(declare-fun d!28362 () Bool)

(declare-fun e!59871 () Bool)

(assert (=> d!28362 e!59871))

(declare-fun res!75105 () Bool)

(assert (=> d!28362 (=> (not res!75105) (not e!59871))))

(declare-fun lt!137606 () (_ BitVec 64))

(declare-fun lt!137605 () (_ BitVec 64))

(declare-fun lt!137603 () (_ BitVec 64))

(assert (=> d!28362 (= res!75105 (= lt!137605 (bvsub lt!137606 lt!137603)))))

(assert (=> d!28362 (or (= (bvand lt!137606 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137603 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137606 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137606 lt!137603) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28362 (= lt!137603 (remainingBits!0 ((_ sign_extend 32) (size!1918 (buf!2308 (_1!4028 lt!137449)))) ((_ sign_extend 32) (currentByte!4589 (_1!4028 lt!137449))) ((_ sign_extend 32) (currentBit!4584 (_1!4028 lt!137449)))))))

(declare-fun lt!137607 () (_ BitVec 64))

(declare-fun lt!137604 () (_ BitVec 64))

(assert (=> d!28362 (= lt!137606 (bvmul lt!137607 lt!137604))))

(assert (=> d!28362 (or (= lt!137607 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137604 (bvsdiv (bvmul lt!137607 lt!137604) lt!137607)))))

(assert (=> d!28362 (= lt!137604 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28362 (= lt!137607 ((_ sign_extend 32) (size!1918 (buf!2308 (_1!4028 lt!137449)))))))

(assert (=> d!28362 (= lt!137605 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4589 (_1!4028 lt!137449))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4584 (_1!4028 lt!137449)))))))

(assert (=> d!28362 (invariant!0 (currentBit!4584 (_1!4028 lt!137449)) (currentByte!4589 (_1!4028 lt!137449)) (size!1918 (buf!2308 (_1!4028 lt!137449))))))

(assert (=> d!28362 (= (bitIndex!0 (size!1918 (buf!2308 (_1!4028 lt!137449))) (currentByte!4589 (_1!4028 lt!137449)) (currentBit!4584 (_1!4028 lt!137449))) lt!137605)))

(declare-fun b!91014 () Bool)

(declare-fun res!75106 () Bool)

(assert (=> b!91014 (=> (not res!75106) (not e!59871))))

(assert (=> b!91014 (= res!75106 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137605))))

(declare-fun b!91015 () Bool)

(declare-fun lt!137602 () (_ BitVec 64))

(assert (=> b!91015 (= e!59871 (bvsle lt!137605 (bvmul lt!137602 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!91015 (or (= lt!137602 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137602 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137602)))))

(assert (=> b!91015 (= lt!137602 ((_ sign_extend 32) (size!1918 (buf!2308 (_1!4028 lt!137449)))))))

(assert (= (and d!28362 res!75105) b!91014))

(assert (= (and b!91014 res!75106) b!91015))

(declare-fun m!135325 () Bool)

(assert (=> d!28362 m!135325))

(declare-fun m!135327 () Bool)

(assert (=> d!28362 m!135327))

(assert (=> b!90890 d!28362))

(declare-fun d!28364 () Bool)

(assert (=> d!28364 (= (array_inv!1764 (buf!2308 thiss!1151)) (bvsge (size!1918 (buf!2308 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!90901 d!28364))

(push 1)

(assert (not d!28288))

(assert (not b!91013))

(assert (not d!28348))

(assert (not b!91010))

(assert (not d!28292))

(assert (not b!90949))

(assert (not b!91011))

(assert (not d!28362))

(assert (not d!28294))

(assert (not d!28290))

(assert (not d!28342))

(assert (not b!91012))

(assert (not d!28306))

(assert (not d!28344))

(assert (not d!28298))

(assert (not d!28304))

(assert (not b!90978))

(assert (not b!90980))

(check-sat)

(pop 1)

(push 1)

(check-sat)

