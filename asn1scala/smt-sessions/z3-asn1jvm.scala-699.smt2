; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19640 () Bool)

(assert start!19640)

(declare-fun b!98041 () Bool)

(declare-fun res!80434 () Bool)

(declare-fun e!64171 () Bool)

(assert (=> b!98041 (=> (not res!80434) (not e!64171))))

(declare-datatypes ((array!4593 0))(
  ( (array!4594 (arr!2692 (Array (_ BitVec 32) (_ BitVec 8))) (size!2099 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3672 0))(
  ( (BitStream!3673 (buf!2450 array!4593) (currentByte!4874 (_ BitVec 32)) (currentBit!4869 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3672)

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!98041 (= res!80434 (validate_offset_bits!1 ((_ sign_extend 32) (size!2099 (buf!2450 thiss!1288))) ((_ sign_extend 32) (currentByte!4874 thiss!1288)) ((_ sign_extend 32) (currentBit!4869 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!98042 () Bool)

(declare-fun res!80432 () Bool)

(assert (=> b!98042 (=> (not res!80432) (not e!64171))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!98042 (= res!80432 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun b!98043 () Bool)

(declare-fun e!64172 () Bool)

(declare-fun array_inv!1901 (array!4593) Bool)

(assert (=> b!98043 (= e!64172 (array_inv!1901 (buf!2450 thiss!1288)))))

(declare-fun b!98045 () Bool)

(declare-fun res!80435 () Bool)

(assert (=> b!98045 (=> (not res!80435) (not e!64171))))

(declare-datatypes ((Unit!5989 0))(
  ( (Unit!5990) )
))
(declare-datatypes ((tuple2!7878 0))(
  ( (tuple2!7879 (_1!4191 Unit!5989) (_2!4191 BitStream!3672)) )
))
(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3672 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7878)

(assert (=> b!98045 (= res!80435 (= (size!2099 (buf!2450 thiss!1288)) (size!2099 (buf!2450 (_2!4191 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))))))

(declare-fun res!80433 () Bool)

(assert (=> start!19640 (=> (not res!80433) (not e!64171))))

(assert (=> start!19640 (= res!80433 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19640 e!64171))

(assert (=> start!19640 true))

(declare-fun inv!12 (BitStream!3672) Bool)

(assert (=> start!19640 (and (inv!12 thiss!1288) e!64172)))

(declare-fun lt!142060 () (_ BitVec 64))

(declare-fun b!98044 () Bool)

(declare-fun lt!142059 () (_ BitVec 64))

(assert (=> b!98044 (= e!64171 (and (= lt!142059 (bvand ((_ sign_extend 32) nBits!388) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!142059 (bvand (bvadd lt!142060 ((_ sign_extend 32) nBits!388)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!98044 (= lt!142059 (bvand lt!142060 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!98044 (= lt!142060 (bitIndex!0 (size!2099 (buf!2450 thiss!1288)) (currentByte!4874 thiss!1288) (currentBit!4869 thiss!1288)))))

(assert (= (and start!19640 res!80433) b!98041))

(assert (= (and b!98041 res!80434) b!98042))

(assert (= (and b!98042 res!80432) b!98045))

(assert (= (and b!98045 res!80435) b!98044))

(assert (= start!19640 b!98043))

(declare-fun m!142477 () Bool)

(assert (=> b!98045 m!142477))

(declare-fun m!142479 () Bool)

(assert (=> b!98043 m!142479))

(declare-fun m!142481 () Bool)

(assert (=> b!98041 m!142481))

(declare-fun m!142483 () Bool)

(assert (=> b!98044 m!142483))

(declare-fun m!142485 () Bool)

(assert (=> b!98042 m!142485))

(declare-fun m!142487 () Bool)

(assert (=> start!19640 m!142487))

(check-sat (not b!98045) (not b!98041) (not b!98044) (not start!19640) (not b!98043) (not b!98042))
(check-sat)
(get-model)

(declare-fun d!30750 () Bool)

(declare-fun e!64185 () Bool)

(assert (=> d!30750 e!64185))

(declare-fun res!80452 () Bool)

(assert (=> d!30750 (=> (not res!80452) (not e!64185))))

(declare-fun lt!142079 () (_ BitVec 64))

(declare-fun lt!142083 () (_ BitVec 64))

(declare-fun lt!142080 () (_ BitVec 64))

(assert (=> d!30750 (= res!80452 (= lt!142083 (bvsub lt!142079 lt!142080)))))

(assert (=> d!30750 (or (= (bvand lt!142079 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!142080 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!142079 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!142079 lt!142080) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!30750 (= lt!142080 (remainingBits!0 ((_ sign_extend 32) (size!2099 (buf!2450 thiss!1288))) ((_ sign_extend 32) (currentByte!4874 thiss!1288)) ((_ sign_extend 32) (currentBit!4869 thiss!1288))))))

(declare-fun lt!142082 () (_ BitVec 64))

(declare-fun lt!142081 () (_ BitVec 64))

(assert (=> d!30750 (= lt!142079 (bvmul lt!142082 lt!142081))))

(assert (=> d!30750 (or (= lt!142082 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!142081 (bvsdiv (bvmul lt!142082 lt!142081) lt!142082)))))

(assert (=> d!30750 (= lt!142081 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30750 (= lt!142082 ((_ sign_extend 32) (size!2099 (buf!2450 thiss!1288))))))

(assert (=> d!30750 (= lt!142083 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4874 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4869 thiss!1288))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!30750 (invariant!0 (currentBit!4869 thiss!1288) (currentByte!4874 thiss!1288) (size!2099 (buf!2450 thiss!1288)))))

(assert (=> d!30750 (= (bitIndex!0 (size!2099 (buf!2450 thiss!1288)) (currentByte!4874 thiss!1288) (currentBit!4869 thiss!1288)) lt!142083)))

(declare-fun b!98065 () Bool)

(declare-fun res!80453 () Bool)

(assert (=> b!98065 (=> (not res!80453) (not e!64185))))

(assert (=> b!98065 (= res!80453 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!142083))))

(declare-fun b!98066 () Bool)

(declare-fun lt!142084 () (_ BitVec 64))

(assert (=> b!98066 (= e!64185 (bvsle lt!142083 (bvmul lt!142084 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98066 (or (= lt!142084 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!142084 #b0000000000000000000000000000000000000000000000000000000000001000) lt!142084)))))

(assert (=> b!98066 (= lt!142084 ((_ sign_extend 32) (size!2099 (buf!2450 thiss!1288))))))

(assert (= (and d!30750 res!80452) b!98065))

(assert (= (and b!98065 res!80453) b!98066))

(declare-fun m!142505 () Bool)

(assert (=> d!30750 m!142505))

(declare-fun m!142507 () Bool)

(assert (=> d!30750 m!142507))

(assert (=> b!98044 d!30750))

(declare-fun b!98131 () Bool)

(declare-datatypes ((tuple2!7882 0))(
  ( (tuple2!7883 (_1!4193 BitStream!3672) (_2!4193 BitStream!3672)) )
))
(declare-fun lt!142323 () tuple2!7882)

(declare-fun e!64221 () Bool)

(declare-datatypes ((tuple2!7884 0))(
  ( (tuple2!7885 (_1!4194 BitStream!3672) (_2!4194 (_ BitVec 64))) )
))
(declare-fun lt!142345 () tuple2!7884)

(assert (=> b!98131 (= e!64221 (and (= (_2!4194 lt!142345) v!196) (= (_1!4194 lt!142345) (_2!4193 lt!142323))))))

(declare-fun lt!142303 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3672 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!7884)

(assert (=> b!98131 (= lt!142345 (readNLeastSignificantBitsLoopPure!0 (_1!4193 lt!142323) nBits!388 #b00000000000000000000000000000000 lt!142303))))

(declare-fun lt!142336 () Unit!5989)

(declare-fun lt!142310 () Unit!5989)

(assert (=> b!98131 (= lt!142336 lt!142310)))

(declare-fun lt!142331 () tuple2!7878)

(declare-fun lt!142329 () (_ BitVec 64))

(assert (=> b!98131 (validate_offset_bits!1 ((_ sign_extend 32) (size!2099 (buf!2450 (_2!4191 lt!142331)))) ((_ sign_extend 32) (currentByte!4874 thiss!1288)) ((_ sign_extend 32) (currentBit!4869 thiss!1288)) lt!142329)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3672 array!4593 (_ BitVec 64)) Unit!5989)

(assert (=> b!98131 (= lt!142310 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2450 (_2!4191 lt!142331)) lt!142329))))

(declare-fun e!64222 () Bool)

(assert (=> b!98131 e!64222))

(declare-fun res!80503 () Bool)

(assert (=> b!98131 (=> (not res!80503) (not e!64222))))

(assert (=> b!98131 (= res!80503 (and (= (size!2099 (buf!2450 thiss!1288)) (size!2099 (buf!2450 (_2!4191 lt!142331)))) (bvsge lt!142329 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98131 (= lt!142329 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(assert (=> b!98131 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!98131 (= lt!142303 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(assert (=> b!98131 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!3672 BitStream!3672) tuple2!7882)

(assert (=> b!98131 (= lt!142323 (reader!0 thiss!1288 (_2!4191 lt!142331)))))

(declare-fun b!98132 () Bool)

(declare-datatypes ((tuple2!7886 0))(
  ( (tuple2!7887 (_1!4195 BitStream!3672) (_2!4195 Bool)) )
))
(declare-fun lt!142328 () tuple2!7886)

(declare-fun lt!142344 () tuple2!7878)

(declare-fun readBitPure!0 (BitStream!3672) tuple2!7886)

(declare-fun readerFrom!0 (BitStream!3672 (_ BitVec 32) (_ BitVec 32)) BitStream!3672)

(assert (=> b!98132 (= lt!142328 (readBitPure!0 (readerFrom!0 (_2!4191 lt!142344) (currentBit!4869 thiss!1288) (currentByte!4874 thiss!1288))))))

(declare-fun lt!142316 () Bool)

(declare-fun res!80509 () Bool)

(assert (=> b!98132 (= res!80509 (and (= (_2!4195 lt!142328) lt!142316) (= (_1!4195 lt!142328) (_2!4191 lt!142344))))))

(declare-fun e!64224 () Bool)

(assert (=> b!98132 (=> (not res!80509) (not e!64224))))

(declare-fun e!64223 () Bool)

(assert (=> b!98132 (= e!64223 e!64224)))

(declare-fun b!98133 () Bool)

(declare-fun res!80502 () Bool)

(declare-fun isPrefixOf!0 (BitStream!3672 BitStream!3672) Bool)

(assert (=> b!98133 (= res!80502 (isPrefixOf!0 thiss!1288 (_2!4191 lt!142344)))))

(assert (=> b!98133 (=> (not res!80502) (not e!64223))))

(declare-fun call!1218 () Bool)

(declare-fun bm!1215 () Bool)

(declare-fun c!6206 () Bool)

(declare-fun lt!142342 () BitStream!3672)

(declare-fun lt!142335 () tuple2!7878)

(assert (=> bm!1215 (= call!1218 (isPrefixOf!0 (ite c!6206 thiss!1288 lt!142342) (ite c!6206 (_2!4191 lt!142335) lt!142342)))))

(declare-fun b!98134 () Bool)

(assert (=> b!98134 (= e!64224 (= (bitIndex!0 (size!2099 (buf!2450 (_1!4195 lt!142328))) (currentByte!4874 (_1!4195 lt!142328)) (currentBit!4869 (_1!4195 lt!142328))) (bitIndex!0 (size!2099 (buf!2450 (_2!4191 lt!142344))) (currentByte!4874 (_2!4191 lt!142344)) (currentBit!4869 (_2!4191 lt!142344)))))))

(declare-fun b!98135 () Bool)

(declare-fun e!64226 () (_ BitVec 64))

(assert (=> b!98135 (= e!64226 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!98136 () Bool)

(declare-fun res!80505 () Bool)

(assert (=> b!98136 (=> (not res!80505) (not e!64221))))

(assert (=> b!98136 (= res!80505 (isPrefixOf!0 thiss!1288 (_2!4191 lt!142331)))))

(declare-fun b!98137 () Bool)

(declare-fun e!64220 () tuple2!7878)

(declare-fun lt!142338 () Unit!5989)

(assert (=> b!98137 (= e!64220 (tuple2!7879 lt!142338 thiss!1288))))

(assert (=> b!98137 (= lt!142342 thiss!1288)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3672) Unit!5989)

(assert (=> b!98137 (= lt!142338 (lemmaIsPrefixRefl!0 lt!142342))))

(assert (=> b!98137 call!1218))

(declare-fun b!98138 () Bool)

(assert (=> b!98138 (= e!64226 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!98139 () Bool)

(declare-fun e!64225 () Bool)

(declare-fun lt!142313 () tuple2!7886)

(declare-fun lt!142339 () tuple2!7886)

(assert (=> b!98139 (= e!64225 (= (_2!4195 lt!142313) (_2!4195 lt!142339)))))

(declare-fun b!98140 () Bool)

(declare-fun res!80506 () Bool)

(assert (=> b!98140 (= res!80506 (= (bitIndex!0 (size!2099 (buf!2450 (_2!4191 lt!142344))) (currentByte!4874 (_2!4191 lt!142344)) (currentBit!4869 (_2!4191 lt!142344))) (bvadd (bitIndex!0 (size!2099 (buf!2450 thiss!1288)) (currentByte!4874 thiss!1288) (currentBit!4869 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!98140 (=> (not res!80506) (not e!64223))))

(declare-fun d!30762 () Bool)

(assert (=> d!30762 e!64221))

(declare-fun res!80507 () Bool)

(assert (=> d!30762 (=> (not res!80507) (not e!64221))))

(assert (=> d!30762 (= res!80507 (= (size!2099 (buf!2450 thiss!1288)) (size!2099 (buf!2450 (_2!4191 lt!142331)))))))

(assert (=> d!30762 (= lt!142331 e!64220)))

(assert (=> d!30762 (= c!6206 (bvslt #b00000000000000000000000000000000 nBits!388))))

(assert (=> d!30762 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!388) (bvsle nBits!388 #b00000000000000000000000001000000))))

(assert (=> d!30762 (= (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000) lt!142331)))

(declare-fun b!98141 () Bool)

(declare-fun res!80508 () Bool)

(assert (=> b!98141 (=> (not res!80508) (not e!64221))))

(declare-fun lt!142320 () (_ BitVec 64))

(declare-fun lt!142343 () (_ BitVec 64))

(assert (=> b!98141 (= res!80508 (= (bitIndex!0 (size!2099 (buf!2450 (_2!4191 lt!142331))) (currentByte!4874 (_2!4191 lt!142331)) (currentBit!4869 (_2!4191 lt!142331))) (bvadd lt!142320 lt!142343)))))

(assert (=> b!98141 (or (not (= (bvand lt!142320 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!142343 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!142320 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!142320 lt!142343) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98141 (= lt!142343 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(assert (=> b!98141 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!98141 (= lt!142320 (bitIndex!0 (size!2099 (buf!2450 thiss!1288)) (currentByte!4874 thiss!1288) (currentBit!4869 thiss!1288)))))

(declare-fun b!98142 () Bool)

(assert (=> b!98142 (= e!64222 (validate_offset_bits!1 ((_ sign_extend 32) (size!2099 (buf!2450 thiss!1288))) ((_ sign_extend 32) (currentByte!4874 thiss!1288)) ((_ sign_extend 32) (currentBit!4869 thiss!1288)) lt!142329))))

(declare-fun b!98143 () Bool)

(declare-fun Unit!5993 () Unit!5989)

(assert (=> b!98143 (= e!64220 (tuple2!7879 Unit!5993 (_2!4191 lt!142335)))))

(assert (=> b!98143 (= lt!142316 (not (= (bvand v!196 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun appendBit!0 (BitStream!3672 Bool) tuple2!7878)

(assert (=> b!98143 (= lt!142344 (appendBit!0 thiss!1288 lt!142316))))

(declare-fun res!80504 () Bool)

(assert (=> b!98143 (= res!80504 (= (size!2099 (buf!2450 thiss!1288)) (size!2099 (buf!2450 (_2!4191 lt!142344)))))))

(assert (=> b!98143 (=> (not res!80504) (not e!64223))))

(assert (=> b!98143 e!64223))

(declare-fun lt!142301 () tuple2!7878)

(assert (=> b!98143 (= lt!142301 lt!142344)))

(assert (=> b!98143 (= lt!142335 (appendNLeastSignificantBitsLoop!0 (_2!4191 lt!142301) v!196 nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!142304 () Unit!5989)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3672 BitStream!3672 BitStream!3672) Unit!5989)

(assert (=> b!98143 (= lt!142304 (lemmaIsPrefixTransitive!0 thiss!1288 (_2!4191 lt!142301) (_2!4191 lt!142335)))))

(assert (=> b!98143 call!1218))

(declare-fun lt!142317 () Unit!5989)

(assert (=> b!98143 (= lt!142317 lt!142304)))

(assert (=> b!98143 (invariant!0 (currentBit!4869 thiss!1288) (currentByte!4874 thiss!1288) (size!2099 (buf!2450 (_2!4191 lt!142301))))))

(declare-fun lt!142319 () BitStream!3672)

(assert (=> b!98143 (= lt!142319 (BitStream!3673 (buf!2450 (_2!4191 lt!142301)) (currentByte!4874 thiss!1288) (currentBit!4869 thiss!1288)))))

(assert (=> b!98143 (invariant!0 (currentBit!4869 lt!142319) (currentByte!4874 lt!142319) (size!2099 (buf!2450 (_2!4191 lt!142335))))))

(declare-fun lt!142332 () BitStream!3672)

(assert (=> b!98143 (= lt!142332 (BitStream!3673 (buf!2450 (_2!4191 lt!142335)) (currentByte!4874 lt!142319) (currentBit!4869 lt!142319)))))

(assert (=> b!98143 (= lt!142313 (readBitPure!0 lt!142319))))

(assert (=> b!98143 (= lt!142339 (readBitPure!0 lt!142332))))

(declare-fun lt!142307 () Unit!5989)

(declare-fun readBitPrefixLemma!0 (BitStream!3672 BitStream!3672) Unit!5989)

(assert (=> b!98143 (= lt!142307 (readBitPrefixLemma!0 lt!142319 (_2!4191 lt!142335)))))

(declare-fun res!80510 () Bool)

(assert (=> b!98143 (= res!80510 (= (bitIndex!0 (size!2099 (buf!2450 (_1!4195 lt!142313))) (currentByte!4874 (_1!4195 lt!142313)) (currentBit!4869 (_1!4195 lt!142313))) (bitIndex!0 (size!2099 (buf!2450 (_1!4195 lt!142339))) (currentByte!4874 (_1!4195 lt!142339)) (currentBit!4869 (_1!4195 lt!142339)))))))

(assert (=> b!98143 (=> (not res!80510) (not e!64225))))

(assert (=> b!98143 e!64225))

(declare-fun lt!142341 () Unit!5989)

(assert (=> b!98143 (= lt!142341 lt!142307)))

(declare-fun lt!142333 () tuple2!7882)

(assert (=> b!98143 (= lt!142333 (reader!0 thiss!1288 (_2!4191 lt!142335)))))

(declare-fun lt!142327 () tuple2!7882)

(assert (=> b!98143 (= lt!142327 (reader!0 (_2!4191 lt!142301) (_2!4191 lt!142335)))))

(declare-fun lt!142326 () tuple2!7886)

(assert (=> b!98143 (= lt!142326 (readBitPure!0 (_1!4193 lt!142333)))))

(assert (=> b!98143 (= (_2!4195 lt!142326) lt!142316)))

(declare-fun lt!142318 () Unit!5989)

(declare-fun Unit!5994 () Unit!5989)

(assert (=> b!98143 (= lt!142318 Unit!5994)))

(declare-fun lt!142330 () (_ BitVec 64))

(assert (=> b!98143 (= lt!142330 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(declare-fun lt!142325 () (_ BitVec 64))

(assert (=> b!98143 (= lt!142325 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(declare-fun lt!142324 () Unit!5989)

(assert (=> b!98143 (= lt!142324 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2450 (_2!4191 lt!142335)) lt!142325))))

(assert (=> b!98143 (validate_offset_bits!1 ((_ sign_extend 32) (size!2099 (buf!2450 (_2!4191 lt!142335)))) ((_ sign_extend 32) (currentByte!4874 thiss!1288)) ((_ sign_extend 32) (currentBit!4869 thiss!1288)) lt!142325)))

(declare-fun lt!142321 () Unit!5989)

(assert (=> b!98143 (= lt!142321 lt!142324)))

(declare-fun lt!142312 () tuple2!7884)

(assert (=> b!98143 (= lt!142312 (readNLeastSignificantBitsLoopPure!0 (_1!4193 lt!142333) nBits!388 #b00000000000000000000000000000000 lt!142330))))

(declare-fun lt!142306 () (_ BitVec 64))

(assert (=> b!98143 (= lt!142306 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000000) #b00000000000000000000000000000001)))))

(declare-fun lt!142315 () Unit!5989)

(assert (=> b!98143 (= lt!142315 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4191 lt!142301) (buf!2450 (_2!4191 lt!142335)) lt!142306))))

(assert (=> b!98143 (validate_offset_bits!1 ((_ sign_extend 32) (size!2099 (buf!2450 (_2!4191 lt!142335)))) ((_ sign_extend 32) (currentByte!4874 (_2!4191 lt!142301))) ((_ sign_extend 32) (currentBit!4869 (_2!4191 lt!142301))) lt!142306)))

(declare-fun lt!142305 () Unit!5989)

(assert (=> b!98143 (= lt!142305 lt!142315)))

(declare-fun lt!142322 () tuple2!7884)

(assert (=> b!98143 (= lt!142322 (readNLeastSignificantBitsLoopPure!0 (_1!4193 lt!142327) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!142330 (ite (_2!4195 lt!142326) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!142308 () tuple2!7884)

(assert (=> b!98143 (= lt!142308 (readNLeastSignificantBitsLoopPure!0 (_1!4193 lt!142333) nBits!388 #b00000000000000000000000000000000 lt!142330))))

(declare-fun c!6207 () Bool)

(assert (=> b!98143 (= c!6207 (_2!4195 (readBitPure!0 (_1!4193 lt!142333))))))

(declare-fun lt!142337 () tuple2!7884)

(declare-fun withMovedBitIndex!0 (BitStream!3672 (_ BitVec 64)) BitStream!3672)

(assert (=> b!98143 (= lt!142337 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4193 lt!142333) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!142330 e!64226)))))

(declare-fun lt!142309 () Unit!5989)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3672 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!5989)

(assert (=> b!98143 (= lt!142309 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4193 lt!142333) nBits!388 #b00000000000000000000000000000000 lt!142330))))

(assert (=> b!98143 (and (= (_2!4194 lt!142308) (_2!4194 lt!142337)) (= (_1!4194 lt!142308) (_1!4194 lt!142337)))))

(declare-fun lt!142311 () Unit!5989)

(assert (=> b!98143 (= lt!142311 lt!142309)))

(assert (=> b!98143 (= (_1!4193 lt!142333) (withMovedBitIndex!0 (_2!4193 lt!142333) (bvsub (bitIndex!0 (size!2099 (buf!2450 thiss!1288)) (currentByte!4874 thiss!1288) (currentBit!4869 thiss!1288)) (bitIndex!0 (size!2099 (buf!2450 (_2!4191 lt!142335))) (currentByte!4874 (_2!4191 lt!142335)) (currentBit!4869 (_2!4191 lt!142335))))))))

(declare-fun lt!142302 () Unit!5989)

(declare-fun Unit!5996 () Unit!5989)

(assert (=> b!98143 (= lt!142302 Unit!5996)))

(assert (=> b!98143 (= (_1!4193 lt!142327) (withMovedBitIndex!0 (_2!4193 lt!142327) (bvsub (bitIndex!0 (size!2099 (buf!2450 (_2!4191 lt!142301))) (currentByte!4874 (_2!4191 lt!142301)) (currentBit!4869 (_2!4191 lt!142301))) (bitIndex!0 (size!2099 (buf!2450 (_2!4191 lt!142335))) (currentByte!4874 (_2!4191 lt!142335)) (currentBit!4869 (_2!4191 lt!142335))))))))

(declare-fun lt!142340 () Unit!5989)

(declare-fun Unit!5997 () Unit!5989)

(assert (=> b!98143 (= lt!142340 Unit!5997)))

(assert (=> b!98143 (= (bitIndex!0 (size!2099 (buf!2450 thiss!1288)) (currentByte!4874 thiss!1288) (currentBit!4869 thiss!1288)) (bvsub (bitIndex!0 (size!2099 (buf!2450 (_2!4191 lt!142301))) (currentByte!4874 (_2!4191 lt!142301)) (currentBit!4869 (_2!4191 lt!142301))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!142334 () Unit!5989)

(declare-fun Unit!5998 () Unit!5989)

(assert (=> b!98143 (= lt!142334 Unit!5998)))

(assert (=> b!98143 (= (_2!4194 lt!142312) (_2!4194 lt!142322))))

(declare-fun lt!142314 () Unit!5989)

(declare-fun Unit!5999 () Unit!5989)

(assert (=> b!98143 (= lt!142314 Unit!5999)))

(assert (=> b!98143 (= (_1!4194 lt!142312) (_2!4193 lt!142333))))

(assert (= (and d!30762 c!6206) b!98143))

(assert (= (and d!30762 (not c!6206)) b!98137))

(assert (= (and b!98143 res!80504) b!98140))

(assert (= (and b!98140 res!80506) b!98133))

(assert (= (and b!98133 res!80502) b!98132))

(assert (= (and b!98132 res!80509) b!98134))

(assert (= (and b!98143 res!80510) b!98139))

(assert (= (and b!98143 c!6207) b!98138))

(assert (= (and b!98143 (not c!6207)) b!98135))

(assert (= (or b!98143 b!98137) bm!1215))

(assert (= (and d!30762 res!80507) b!98141))

(assert (= (and b!98141 res!80508) b!98136))

(assert (= (and b!98136 res!80505) b!98131))

(assert (= (and b!98131 res!80503) b!98142))

(declare-fun m!142513 () Bool)

(assert (=> b!98134 m!142513))

(declare-fun m!142515 () Bool)

(assert (=> b!98134 m!142515))

(assert (=> b!98140 m!142515))

(assert (=> b!98140 m!142483))

(declare-fun m!142517 () Bool)

(assert (=> b!98132 m!142517))

(assert (=> b!98132 m!142517))

(declare-fun m!142519 () Bool)

(assert (=> b!98132 m!142519))

(declare-fun m!142521 () Bool)

(assert (=> b!98131 m!142521))

(declare-fun m!142523 () Bool)

(assert (=> b!98131 m!142523))

(declare-fun m!142525 () Bool)

(assert (=> b!98131 m!142525))

(declare-fun m!142527 () Bool)

(assert (=> b!98131 m!142527))

(declare-fun m!142529 () Bool)

(assert (=> b!98131 m!142529))

(declare-fun m!142531 () Bool)

(assert (=> b!98141 m!142531))

(assert (=> b!98141 m!142483))

(declare-fun m!142533 () Bool)

(assert (=> b!98143 m!142533))

(declare-fun m!142535 () Bool)

(assert (=> b!98143 m!142535))

(declare-fun m!142537 () Bool)

(assert (=> b!98143 m!142537))

(declare-fun m!142539 () Bool)

(assert (=> b!98143 m!142539))

(declare-fun m!142541 () Bool)

(assert (=> b!98143 m!142541))

(declare-fun m!142543 () Bool)

(assert (=> b!98143 m!142543))

(declare-fun m!142545 () Bool)

(assert (=> b!98143 m!142545))

(assert (=> b!98143 m!142483))

(declare-fun m!142547 () Bool)

(assert (=> b!98143 m!142547))

(assert (=> b!98143 m!142525))

(declare-fun m!142549 () Bool)

(assert (=> b!98143 m!142549))

(declare-fun m!142551 () Bool)

(assert (=> b!98143 m!142551))

(declare-fun m!142553 () Bool)

(assert (=> b!98143 m!142553))

(declare-fun m!142555 () Bool)

(assert (=> b!98143 m!142555))

(assert (=> b!98143 m!142537))

(declare-fun m!142557 () Bool)

(assert (=> b!98143 m!142557))

(declare-fun m!142559 () Bool)

(assert (=> b!98143 m!142559))

(declare-fun m!142561 () Bool)

(assert (=> b!98143 m!142561))

(declare-fun m!142563 () Bool)

(assert (=> b!98143 m!142563))

(declare-fun m!142565 () Bool)

(assert (=> b!98143 m!142565))

(declare-fun m!142567 () Bool)

(assert (=> b!98143 m!142567))

(declare-fun m!142569 () Bool)

(assert (=> b!98143 m!142569))

(declare-fun m!142571 () Bool)

(assert (=> b!98143 m!142571))

(declare-fun m!142573 () Bool)

(assert (=> b!98143 m!142573))

(declare-fun m!142575 () Bool)

(assert (=> b!98143 m!142575))

(declare-fun m!142577 () Bool)

(assert (=> b!98143 m!142577))

(declare-fun m!142579 () Bool)

(assert (=> b!98143 m!142579))

(declare-fun m!142581 () Bool)

(assert (=> b!98143 m!142581))

(declare-fun m!142583 () Bool)

(assert (=> b!98143 m!142583))

(declare-fun m!142585 () Bool)

(assert (=> b!98137 m!142585))

(declare-fun m!142587 () Bool)

(assert (=> b!98142 m!142587))

(declare-fun m!142589 () Bool)

(assert (=> b!98133 m!142589))

(declare-fun m!142591 () Bool)

(assert (=> b!98136 m!142591))

(declare-fun m!142593 () Bool)

(assert (=> bm!1215 m!142593))

(assert (=> b!98045 d!30762))

(declare-fun d!30778 () Bool)

(assert (=> d!30778 (= (array_inv!1901 (buf!2450 thiss!1288)) (bvsge (size!2099 (buf!2450 thiss!1288)) #b00000000000000000000000000000000))))

(assert (=> b!98043 d!30778))

(declare-fun d!30780 () Bool)

(assert (=> d!30780 (= (onesLSBLong!0 nBits!388) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!388))))))

(assert (=> b!98042 d!30780))

(declare-fun d!30782 () Bool)

(assert (=> d!30782 (= (inv!12 thiss!1288) (invariant!0 (currentBit!4869 thiss!1288) (currentByte!4874 thiss!1288) (size!2099 (buf!2450 thiss!1288))))))

(declare-fun bs!7533 () Bool)

(assert (= bs!7533 d!30782))

(assert (=> bs!7533 m!142507))

(assert (=> start!19640 d!30782))

(declare-fun d!30784 () Bool)

(assert (=> d!30784 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2099 (buf!2450 thiss!1288))) ((_ sign_extend 32) (currentByte!4874 thiss!1288)) ((_ sign_extend 32) (currentBit!4869 thiss!1288)) ((_ sign_extend 32) nBits!388)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2099 (buf!2450 thiss!1288))) ((_ sign_extend 32) (currentByte!4874 thiss!1288)) ((_ sign_extend 32) (currentBit!4869 thiss!1288))) ((_ sign_extend 32) nBits!388)))))

(declare-fun bs!7534 () Bool)

(assert (= bs!7534 d!30784))

(assert (=> bs!7534 m!142505))

(assert (=> b!98041 d!30784))

(check-sat (not b!98134) (not b!98142) (not bm!1215) (not b!98131) (not b!98141) (not b!98136) (not d!30782) (not b!98140) (not b!98132) (not b!98143) (not b!98133) (not b!98137) (not d!30784) (not d!30750))
