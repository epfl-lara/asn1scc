; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27010 () Bool)

(assert start!27010)

(declare-fun res!115971 () Bool)

(declare-fun e!92636 () Bool)

(assert (=> start!27010 (=> (not res!115971) (not e!92636))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6326 0))(
  ( (array!6327 (arr!3559 (Array (_ BitVec 32) (_ BitVec 8))) (size!2864 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6326)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!27010 (= res!115971 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2864 arr!237))))))

(assert (=> start!27010 e!92636))

(assert (=> start!27010 true))

(declare-fun array_inv!2653 (array!6326) Bool)

(assert (=> start!27010 (array_inv!2653 arr!237)))

(declare-datatypes ((BitStream!4992 0))(
  ( (BitStream!4993 (buf!3277 array!6326) (currentByte!6101 (_ BitVec 32)) (currentBit!6096 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4992)

(declare-fun e!92635 () Bool)

(declare-fun inv!12 (BitStream!4992) Bool)

(assert (=> start!27010 (and (inv!12 thiss!1634) e!92635)))

(declare-fun b!139118 () Bool)

(assert (=> b!139118 (= e!92635 (array_inv!2653 (buf!3277 thiss!1634)))))

(declare-fun b!139119 () Bool)

(declare-fun res!115974 () Bool)

(assert (=> b!139119 (=> (not res!115974) (not e!92636))))

(assert (=> b!139119 (= res!115974 (bvsge from!447 to!404))))

(declare-datatypes ((tuple2!12178 0))(
  ( (tuple2!12179 (_1!6415 BitStream!4992) (_2!6415 BitStream!4992)) )
))
(declare-fun lt!216855 () tuple2!12178)

(declare-fun e!92633 () Bool)

(declare-fun b!139120 () Bool)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139120 (= e!92633 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2864 (buf!3277 (_1!6415 lt!216855)))) ((_ sign_extend 32) (currentByte!6101 (_1!6415 lt!216855))) ((_ sign_extend 32) (currentBit!6096 (_1!6415 lt!216855))) (bvsub to!404 from!447)))))

(declare-fun lt!216858 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!139120 (validate_offset_bits!1 ((_ sign_extend 32) (size!2864 (buf!3277 thiss!1634))) ((_ sign_extend 32) (currentByte!6101 thiss!1634)) ((_ sign_extend 32) (currentBit!6096 thiss!1634)) lt!216858)))

(declare-datatypes ((Unit!8684 0))(
  ( (Unit!8685) )
))
(declare-fun lt!216857 () Unit!8684)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4992 array!6326 (_ BitVec 64)) Unit!8684)

(assert (=> b!139120 (= lt!216857 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3277 thiss!1634) lt!216858))))

(declare-fun reader!0 (BitStream!4992 BitStream!4992) tuple2!12178)

(assert (=> b!139120 (= lt!216855 (reader!0 thiss!1634 thiss!1634))))

(declare-fun b!139121 () Bool)

(assert (=> b!139121 (= e!92636 (not e!92633))))

(declare-fun res!115973 () Bool)

(assert (=> b!139121 (=> res!115973 e!92633)))

(declare-fun lt!216856 () (_ BitVec 64))

(assert (=> b!139121 (= res!115973 (not (= lt!216856 (bvadd lt!216856 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!216858)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!139121 (= lt!216856 (bitIndex!0 (size!2864 (buf!3277 thiss!1634)) (currentByte!6101 thiss!1634) (currentBit!6096 thiss!1634)))))

(assert (=> b!139121 (= lt!216858 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun isPrefixOf!0 (BitStream!4992 BitStream!4992) Bool)

(assert (=> b!139121 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!216854 () Unit!8684)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4992) Unit!8684)

(assert (=> b!139121 (= lt!216854 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!139122 () Bool)

(declare-fun res!115972 () Bool)

(assert (=> b!139122 (=> (not res!115972) (not e!92636))))

(assert (=> b!139122 (= res!115972 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2864 (buf!3277 thiss!1634))) ((_ sign_extend 32) (currentByte!6101 thiss!1634)) ((_ sign_extend 32) (currentBit!6096 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!27010 res!115971) b!139122))

(assert (= (and b!139122 res!115972) b!139119))

(assert (= (and b!139119 res!115974) b!139121))

(assert (= (and b!139121 (not res!115973)) b!139120))

(assert (= start!27010 b!139118))

(declare-fun m!214067 () Bool)

(assert (=> b!139120 m!214067))

(declare-fun m!214069 () Bool)

(assert (=> b!139120 m!214069))

(declare-fun m!214071 () Bool)

(assert (=> b!139120 m!214071))

(declare-fun m!214073 () Bool)

(assert (=> b!139120 m!214073))

(declare-fun m!214075 () Bool)

(assert (=> start!27010 m!214075))

(declare-fun m!214077 () Bool)

(assert (=> start!27010 m!214077))

(declare-fun m!214079 () Bool)

(assert (=> b!139118 m!214079))

(declare-fun m!214081 () Bool)

(assert (=> b!139122 m!214081))

(declare-fun m!214083 () Bool)

(assert (=> b!139121 m!214083))

(declare-fun m!214085 () Bool)

(assert (=> b!139121 m!214085))

(declare-fun m!214087 () Bool)

(assert (=> b!139121 m!214087))

(check-sat (not b!139118) (not b!139121) (not start!27010) (not b!139120) (not b!139122))
(check-sat)
(get-model)

(declare-fun d!44709 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!44709 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2864 (buf!3277 thiss!1634))) ((_ sign_extend 32) (currentByte!6101 thiss!1634)) ((_ sign_extend 32) (currentBit!6096 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2864 (buf!3277 thiss!1634))) ((_ sign_extend 32) (currentByte!6101 thiss!1634)) ((_ sign_extend 32) (currentBit!6096 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10940 () Bool)

(assert (= bs!10940 d!44709))

(declare-fun m!214115 () Bool)

(assert (=> bs!10940 m!214115))

(assert (=> b!139122 d!44709))

(declare-fun d!44713 () Bool)

(assert (=> d!44713 (= (array_inv!2653 arr!237) (bvsge (size!2864 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!27010 d!44713))

(declare-fun d!44715 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!44715 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6096 thiss!1634) (currentByte!6101 thiss!1634) (size!2864 (buf!3277 thiss!1634))))))

(declare-fun bs!10942 () Bool)

(assert (= bs!10942 d!44715))

(declare-fun m!214119 () Bool)

(assert (=> bs!10942 m!214119))

(assert (=> start!27010 d!44715))

(declare-fun d!44719 () Bool)

(assert (=> d!44719 (= (array_inv!2653 (buf!3277 thiss!1634)) (bvsge (size!2864 (buf!3277 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!139118 d!44719))

(declare-fun d!44721 () Bool)

(assert (=> d!44721 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2864 (buf!3277 (_1!6415 lt!216855)))) ((_ sign_extend 32) (currentByte!6101 (_1!6415 lt!216855))) ((_ sign_extend 32) (currentBit!6096 (_1!6415 lt!216855))) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2864 (buf!3277 (_1!6415 lt!216855)))) ((_ sign_extend 32) (currentByte!6101 (_1!6415 lt!216855))) ((_ sign_extend 32) (currentBit!6096 (_1!6415 lt!216855)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10943 () Bool)

(assert (= bs!10943 d!44721))

(declare-fun m!214121 () Bool)

(assert (=> bs!10943 m!214121))

(assert (=> b!139120 d!44721))

(declare-fun d!44723 () Bool)

(assert (=> d!44723 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2864 (buf!3277 thiss!1634))) ((_ sign_extend 32) (currentByte!6101 thiss!1634)) ((_ sign_extend 32) (currentBit!6096 thiss!1634)) lt!216858) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2864 (buf!3277 thiss!1634))) ((_ sign_extend 32) (currentByte!6101 thiss!1634)) ((_ sign_extend 32) (currentBit!6096 thiss!1634))) lt!216858))))

(declare-fun bs!10944 () Bool)

(assert (= bs!10944 d!44723))

(assert (=> bs!10944 m!214115))

(assert (=> b!139120 d!44723))

(declare-fun d!44725 () Bool)

(assert (=> d!44725 (validate_offset_bits!1 ((_ sign_extend 32) (size!2864 (buf!3277 thiss!1634))) ((_ sign_extend 32) (currentByte!6101 thiss!1634)) ((_ sign_extend 32) (currentBit!6096 thiss!1634)) lt!216858)))

(declare-fun lt!216891 () Unit!8684)

(declare-fun choose!9 (BitStream!4992 array!6326 (_ BitVec 64) BitStream!4992) Unit!8684)

(assert (=> d!44725 (= lt!216891 (choose!9 thiss!1634 (buf!3277 thiss!1634) lt!216858 (BitStream!4993 (buf!3277 thiss!1634) (currentByte!6101 thiss!1634) (currentBit!6096 thiss!1634))))))

(assert (=> d!44725 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3277 thiss!1634) lt!216858) lt!216891)))

(declare-fun bs!10946 () Bool)

(assert (= bs!10946 d!44725))

(assert (=> bs!10946 m!214069))

(declare-fun m!214125 () Bool)

(assert (=> bs!10946 m!214125))

(assert (=> b!139120 d!44725))

(declare-fun lt!217018 () (_ BitVec 64))

(declare-fun lt!217005 () tuple2!12178)

(declare-fun b!139179 () Bool)

(declare-fun e!92672 () Bool)

(declare-fun lt!217017 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4992 (_ BitVec 64)) BitStream!4992)

(assert (=> b!139179 (= e!92672 (= (_1!6415 lt!217005) (withMovedBitIndex!0 (_2!6415 lt!217005) (bvsub lt!217018 lt!217017))))))

(assert (=> b!139179 (or (= (bvand lt!217018 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!217017 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!217018 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!217018 lt!217017) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!139179 (= lt!217017 (bitIndex!0 (size!2864 (buf!3277 thiss!1634)) (currentByte!6101 thiss!1634) (currentBit!6096 thiss!1634)))))

(assert (=> b!139179 (= lt!217018 (bitIndex!0 (size!2864 (buf!3277 thiss!1634)) (currentByte!6101 thiss!1634) (currentBit!6096 thiss!1634)))))

(declare-fun b!139180 () Bool)

(declare-fun res!116019 () Bool)

(assert (=> b!139180 (=> (not res!116019) (not e!92672))))

(assert (=> b!139180 (= res!116019 (isPrefixOf!0 (_2!6415 lt!217005) thiss!1634))))

(declare-fun b!139181 () Bool)

(declare-fun res!116017 () Bool)

(assert (=> b!139181 (=> (not res!116017) (not e!92672))))

(assert (=> b!139181 (= res!116017 (isPrefixOf!0 (_1!6415 lt!217005) thiss!1634))))

(declare-fun b!139182 () Bool)

(declare-fun e!92673 () Unit!8684)

(declare-fun Unit!8689 () Unit!8684)

(assert (=> b!139182 (= e!92673 Unit!8689)))

(declare-fun b!139178 () Bool)

(declare-fun lt!217010 () Unit!8684)

(assert (=> b!139178 (= e!92673 lt!217010)))

(declare-fun lt!217022 () (_ BitVec 64))

(assert (=> b!139178 (= lt!217022 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217019 () (_ BitVec 64))

(assert (=> b!139178 (= lt!217019 (bitIndex!0 (size!2864 (buf!3277 thiss!1634)) (currentByte!6101 thiss!1634) (currentBit!6096 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6326 array!6326 (_ BitVec 64) (_ BitVec 64)) Unit!8684)

(assert (=> b!139178 (= lt!217010 (arrayBitRangesEqSymmetric!0 (buf!3277 thiss!1634) (buf!3277 thiss!1634) lt!217022 lt!217019))))

(declare-fun arrayBitRangesEq!0 (array!6326 array!6326 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!139178 (arrayBitRangesEq!0 (buf!3277 thiss!1634) (buf!3277 thiss!1634) lt!217022 lt!217019)))

(declare-fun d!44729 () Bool)

(assert (=> d!44729 e!92672))

(declare-fun res!116018 () Bool)

(assert (=> d!44729 (=> (not res!116018) (not e!92672))))

(assert (=> d!44729 (= res!116018 (isPrefixOf!0 (_1!6415 lt!217005) (_2!6415 lt!217005)))))

(declare-fun lt!217020 () BitStream!4992)

(assert (=> d!44729 (= lt!217005 (tuple2!12179 lt!217020 thiss!1634))))

(declare-fun lt!217009 () Unit!8684)

(declare-fun lt!217015 () Unit!8684)

(assert (=> d!44729 (= lt!217009 lt!217015)))

(assert (=> d!44729 (isPrefixOf!0 lt!217020 thiss!1634)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4992 BitStream!4992 BitStream!4992) Unit!8684)

(assert (=> d!44729 (= lt!217015 (lemmaIsPrefixTransitive!0 lt!217020 thiss!1634 thiss!1634))))

(declare-fun lt!217006 () Unit!8684)

(declare-fun lt!217012 () Unit!8684)

(assert (=> d!44729 (= lt!217006 lt!217012)))

(assert (=> d!44729 (isPrefixOf!0 lt!217020 thiss!1634)))

(assert (=> d!44729 (= lt!217012 (lemmaIsPrefixTransitive!0 lt!217020 thiss!1634 thiss!1634))))

(declare-fun lt!217008 () Unit!8684)

(assert (=> d!44729 (= lt!217008 e!92673)))

(declare-fun c!7756 () Bool)

(assert (=> d!44729 (= c!7756 (not (= (size!2864 (buf!3277 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!217016 () Unit!8684)

(declare-fun lt!217023 () Unit!8684)

(assert (=> d!44729 (= lt!217016 lt!217023)))

(assert (=> d!44729 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!44729 (= lt!217023 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun lt!217004 () Unit!8684)

(declare-fun lt!217014 () Unit!8684)

(assert (=> d!44729 (= lt!217004 lt!217014)))

(assert (=> d!44729 (= lt!217014 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun lt!217013 () Unit!8684)

(declare-fun lt!217021 () Unit!8684)

(assert (=> d!44729 (= lt!217013 lt!217021)))

(assert (=> d!44729 (isPrefixOf!0 lt!217020 lt!217020)))

(assert (=> d!44729 (= lt!217021 (lemmaIsPrefixRefl!0 lt!217020))))

(declare-fun lt!217007 () Unit!8684)

(declare-fun lt!217011 () Unit!8684)

(assert (=> d!44729 (= lt!217007 lt!217011)))

(assert (=> d!44729 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!44729 (= lt!217011 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!44729 (= lt!217020 (BitStream!4993 (buf!3277 thiss!1634) (currentByte!6101 thiss!1634) (currentBit!6096 thiss!1634)))))

(assert (=> d!44729 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!44729 (= (reader!0 thiss!1634 thiss!1634) lt!217005)))

(assert (= (and d!44729 c!7756) b!139178))

(assert (= (and d!44729 (not c!7756)) b!139182))

(assert (= (and d!44729 res!116018) b!139181))

(assert (= (and b!139181 res!116017) b!139180))

(assert (= (and b!139180 res!116019) b!139179))

(declare-fun m!214157 () Bool)

(assert (=> d!44729 m!214157))

(declare-fun m!214159 () Bool)

(assert (=> d!44729 m!214159))

(assert (=> d!44729 m!214085))

(assert (=> d!44729 m!214085))

(assert (=> d!44729 m!214157))

(declare-fun m!214161 () Bool)

(assert (=> d!44729 m!214161))

(declare-fun m!214163 () Bool)

(assert (=> d!44729 m!214163))

(declare-fun m!214165 () Bool)

(assert (=> d!44729 m!214165))

(assert (=> d!44729 m!214085))

(assert (=> d!44729 m!214087))

(assert (=> d!44729 m!214087))

(assert (=> b!139178 m!214083))

(declare-fun m!214167 () Bool)

(assert (=> b!139178 m!214167))

(declare-fun m!214169 () Bool)

(assert (=> b!139178 m!214169))

(declare-fun m!214171 () Bool)

(assert (=> b!139179 m!214171))

(assert (=> b!139179 m!214083))

(assert (=> b!139179 m!214083))

(declare-fun m!214173 () Bool)

(assert (=> b!139180 m!214173))

(declare-fun m!214175 () Bool)

(assert (=> b!139181 m!214175))

(assert (=> b!139120 d!44729))

(declare-fun d!44749 () Bool)

(declare-fun e!92679 () Bool)

(assert (=> d!44749 e!92679))

(declare-fun res!116030 () Bool)

(assert (=> d!44749 (=> (not res!116030) (not e!92679))))

(declare-fun lt!217058 () (_ BitVec 64))

(declare-fun lt!217057 () (_ BitVec 64))

(declare-fun lt!217055 () (_ BitVec 64))

(assert (=> d!44749 (= res!116030 (= lt!217055 (bvsub lt!217058 lt!217057)))))

(assert (=> d!44749 (or (= (bvand lt!217058 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!217057 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!217058 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!217058 lt!217057) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44749 (= lt!217057 (remainingBits!0 ((_ sign_extend 32) (size!2864 (buf!3277 thiss!1634))) ((_ sign_extend 32) (currentByte!6101 thiss!1634)) ((_ sign_extend 32) (currentBit!6096 thiss!1634))))))

(declare-fun lt!217059 () (_ BitVec 64))

(declare-fun lt!217054 () (_ BitVec 64))

(assert (=> d!44749 (= lt!217058 (bvmul lt!217059 lt!217054))))

(assert (=> d!44749 (or (= lt!217059 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!217054 (bvsdiv (bvmul lt!217059 lt!217054) lt!217059)))))

(assert (=> d!44749 (= lt!217054 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44749 (= lt!217059 ((_ sign_extend 32) (size!2864 (buf!3277 thiss!1634))))))

(assert (=> d!44749 (= lt!217055 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6101 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6096 thiss!1634))))))

(assert (=> d!44749 (invariant!0 (currentBit!6096 thiss!1634) (currentByte!6101 thiss!1634) (size!2864 (buf!3277 thiss!1634)))))

(assert (=> d!44749 (= (bitIndex!0 (size!2864 (buf!3277 thiss!1634)) (currentByte!6101 thiss!1634) (currentBit!6096 thiss!1634)) lt!217055)))

(declare-fun b!139193 () Bool)

(declare-fun res!116031 () Bool)

(assert (=> b!139193 (=> (not res!116031) (not e!92679))))

(assert (=> b!139193 (= res!116031 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!217055))))

(declare-fun b!139194 () Bool)

(declare-fun lt!217056 () (_ BitVec 64))

(assert (=> b!139194 (= e!92679 (bvsle lt!217055 (bvmul lt!217056 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!139194 (or (= lt!217056 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!217056 #b0000000000000000000000000000000000000000000000000000000000001000) lt!217056)))))

(assert (=> b!139194 (= lt!217056 ((_ sign_extend 32) (size!2864 (buf!3277 thiss!1634))))))

(assert (= (and d!44749 res!116030) b!139193))

(assert (= (and b!139193 res!116031) b!139194))

(assert (=> d!44749 m!214115))

(assert (=> d!44749 m!214119))

(assert (=> b!139121 d!44749))

(declare-fun d!44753 () Bool)

(declare-fun res!116047 () Bool)

(declare-fun e!92690 () Bool)

(assert (=> d!44753 (=> (not res!116047) (not e!92690))))

(assert (=> d!44753 (= res!116047 (= (size!2864 (buf!3277 thiss!1634)) (size!2864 (buf!3277 thiss!1634))))))

(assert (=> d!44753 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!92690)))

(declare-fun b!139210 () Bool)

(declare-fun res!116049 () Bool)

(assert (=> b!139210 (=> (not res!116049) (not e!92690))))

(assert (=> b!139210 (= res!116049 (bvsle (bitIndex!0 (size!2864 (buf!3277 thiss!1634)) (currentByte!6101 thiss!1634) (currentBit!6096 thiss!1634)) (bitIndex!0 (size!2864 (buf!3277 thiss!1634)) (currentByte!6101 thiss!1634) (currentBit!6096 thiss!1634))))))

(declare-fun b!139211 () Bool)

(declare-fun e!92691 () Bool)

(assert (=> b!139211 (= e!92690 e!92691)))

(declare-fun res!116048 () Bool)

(assert (=> b!139211 (=> res!116048 e!92691)))

(assert (=> b!139211 (= res!116048 (= (size!2864 (buf!3277 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!139212 () Bool)

(assert (=> b!139212 (= e!92691 (arrayBitRangesEq!0 (buf!3277 thiss!1634) (buf!3277 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2864 (buf!3277 thiss!1634)) (currentByte!6101 thiss!1634) (currentBit!6096 thiss!1634))))))

(assert (= (and d!44753 res!116047) b!139210))

(assert (= (and b!139210 res!116049) b!139211))

(assert (= (and b!139211 (not res!116048)) b!139212))

(assert (=> b!139210 m!214083))

(assert (=> b!139210 m!214083))

(assert (=> b!139212 m!214083))

(assert (=> b!139212 m!214083))

(declare-fun m!214181 () Bool)

(assert (=> b!139212 m!214181))

(assert (=> b!139121 d!44753))

(declare-fun d!44757 () Bool)

(assert (=> d!44757 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!217105 () Unit!8684)

(declare-fun choose!11 (BitStream!4992) Unit!8684)

(assert (=> d!44757 (= lt!217105 (choose!11 thiss!1634))))

(assert (=> d!44757 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!217105)))

(declare-fun bs!10957 () Bool)

(assert (= bs!10957 d!44757))

(assert (=> bs!10957 m!214085))

(declare-fun m!214185 () Bool)

(assert (=> bs!10957 m!214185))

(assert (=> b!139121 d!44757))

(check-sat (not d!44749) (not d!44715) (not d!44709) (not d!44721) (not d!44757) (not d!44723) (not b!139179) (not d!44729) (not b!139178) (not b!139210) (not b!139212) (not b!139180) (not d!44725) (not b!139181))
(check-sat)
