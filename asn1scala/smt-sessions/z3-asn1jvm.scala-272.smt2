; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5382 () Bool)

(assert start!5382)

(declare-fun b!21761 () Bool)

(declare-fun res!18792 () Bool)

(declare-fun e!14765 () Bool)

(assert (=> b!21761 (=> res!18792 e!14765)))

(declare-datatypes ((array!1531 0))(
  ( (array!1532 (arr!1103 (Array (_ BitVec 32) (_ BitVec 8))) (size!653 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1140 0))(
  ( (BitStream!1141 (buf!968 array!1531) (currentByte!2269 (_ BitVec 32)) (currentBit!2264 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1900 0))(
  ( (Unit!1901) )
))
(declare-datatypes ((tuple2!2554 0))(
  ( (tuple2!2555 (_1!1362 Unit!1900) (_2!1362 BitStream!1140)) )
))
(declare-fun lt!31413 () tuple2!2554)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!21761 (= res!18792 (not (invariant!0 (currentBit!2264 (_2!1362 lt!31413)) (currentByte!2269 (_2!1362 lt!31413)) (size!653 (buf!968 (_2!1362 lt!31413))))))))

(declare-fun b!21762 () Bool)

(declare-fun e!14766 () Bool)

(assert (=> b!21762 (= e!14766 e!14765)))

(declare-fun res!18796 () Bool)

(assert (=> b!21762 (=> res!18796 e!14765)))

(declare-fun lt!31416 () tuple2!2554)

(declare-fun isPrefixOf!0 (BitStream!1140 BitStream!1140) Bool)

(assert (=> b!21762 (= res!18796 (not (isPrefixOf!0 (_2!1362 lt!31416) (_2!1362 lt!31413))))))

(declare-fun thiss!1379 () BitStream!1140)

(assert (=> b!21762 (isPrefixOf!0 thiss!1379 (_2!1362 lt!31413))))

(declare-fun lt!31414 () Unit!1900)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1140 BitStream!1140 BitStream!1140) Unit!1900)

(assert (=> b!21762 (= lt!31414 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1362 lt!31416) (_2!1362 lt!31413)))))

(declare-fun srcBuffer!2 () array!1531)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1140 array!1531 (_ BitVec 64) (_ BitVec 64)) tuple2!2554)

(assert (=> b!21762 (= lt!31413 (appendBitsMSBFirstLoop!0 (_2!1362 lt!31416) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!14762 () Bool)

(assert (=> b!21762 e!14762))

(declare-fun res!18794 () Bool)

(assert (=> b!21762 (=> (not res!18794) (not e!14762))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!21762 (= res!18794 (validate_offset_bits!1 ((_ sign_extend 32) (size!653 (buf!968 (_2!1362 lt!31416)))) ((_ sign_extend 32) (currentByte!2269 thiss!1379)) ((_ sign_extend 32) (currentBit!2264 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!31410 () Unit!1900)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1140 array!1531 (_ BitVec 64)) Unit!1900)

(assert (=> b!21762 (= lt!31410 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!968 (_2!1362 lt!31416)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2556 0))(
  ( (tuple2!2557 (_1!1363 BitStream!1140) (_2!1363 BitStream!1140)) )
))
(declare-fun lt!31415 () tuple2!2556)

(declare-fun reader!0 (BitStream!1140 BitStream!1140) tuple2!2556)

(assert (=> b!21762 (= lt!31415 (reader!0 thiss!1379 (_2!1362 lt!31416)))))

(declare-fun b!21763 () Bool)

(declare-fun e!14768 () Bool)

(assert (=> b!21763 (= e!14768 e!14766)))

(declare-fun res!18797 () Bool)

(assert (=> b!21763 (=> res!18797 e!14766)))

(assert (=> b!21763 (= res!18797 (not (isPrefixOf!0 thiss!1379 (_2!1362 lt!31416))))))

(assert (=> b!21763 (validate_offset_bits!1 ((_ sign_extend 32) (size!653 (buf!968 (_2!1362 lt!31416)))) ((_ sign_extend 32) (currentByte!2269 (_2!1362 lt!31416))) ((_ sign_extend 32) (currentBit!2264 (_2!1362 lt!31416))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!31411 () Unit!1900)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1140 BitStream!1140 (_ BitVec 64) (_ BitVec 64)) Unit!1900)

(assert (=> b!21763 (= lt!31411 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1362 lt!31416) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1140 (_ BitVec 8) (_ BitVec 32)) tuple2!2554)

(assert (=> b!21763 (= lt!31416 (appendBitFromByte!0 thiss!1379 (select (arr!1103 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!21764 () Bool)

(declare-fun res!18799 () Bool)

(assert (=> b!21764 (=> res!18799 e!14765)))

(assert (=> b!21764 (= res!18799 (not (= (size!653 (buf!968 thiss!1379)) (size!653 (buf!968 (_2!1362 lt!31413))))))))

(declare-fun b!21765 () Bool)

(declare-fun res!18793 () Bool)

(assert (=> b!21765 (=> res!18793 e!14765)))

(declare-fun lt!31412 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!21765 (= res!18793 (not (= (bitIndex!0 (size!653 (buf!968 (_2!1362 lt!31413))) (currentByte!2269 (_2!1362 lt!31413)) (currentBit!2264 (_2!1362 lt!31413))) (bvsub (bvadd lt!31412 to!314) i!635))))))

(declare-fun b!21766 () Bool)

(assert (=> b!21766 (= e!14765 (invariant!0 (currentBit!2264 thiss!1379) (currentByte!2269 thiss!1379) (size!653 (buf!968 thiss!1379))))))

(assert (=> b!21766 (= (size!653 (buf!968 (_2!1362 lt!31413))) (size!653 (buf!968 thiss!1379)))))

(declare-fun res!18800 () Bool)

(declare-fun e!14764 () Bool)

(assert (=> start!5382 (=> (not res!18800) (not e!14764))))

(assert (=> start!5382 (= res!18800 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!653 srcBuffer!2))))))))

(assert (=> start!5382 e!14764))

(assert (=> start!5382 true))

(declare-fun array_inv!623 (array!1531) Bool)

(assert (=> start!5382 (array_inv!623 srcBuffer!2)))

(declare-fun e!14769 () Bool)

(declare-fun inv!12 (BitStream!1140) Bool)

(assert (=> start!5382 (and (inv!12 thiss!1379) e!14769)))

(declare-fun b!21767 () Bool)

(declare-datatypes ((List!271 0))(
  ( (Nil!268) (Cons!267 (h!386 Bool) (t!1021 List!271)) )
))
(declare-fun head!108 (List!271) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1140 array!1531 (_ BitVec 64) (_ BitVec 64)) List!271)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1140 BitStream!1140 (_ BitVec 64)) List!271)

(assert (=> b!21767 (= e!14762 (= (head!108 (byteArrayBitContentToList!0 (_2!1362 lt!31416) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!108 (bitStreamReadBitsIntoList!0 (_2!1362 lt!31416) (_1!1363 lt!31415) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!21768 () Bool)

(assert (=> b!21768 (= e!14764 (not e!14768))))

(declare-fun res!18798 () Bool)

(assert (=> b!21768 (=> res!18798 e!14768)))

(assert (=> b!21768 (= res!18798 (bvsge i!635 to!314))))

(assert (=> b!21768 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!31417 () Unit!1900)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1140) Unit!1900)

(assert (=> b!21768 (= lt!31417 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!21768 (= lt!31412 (bitIndex!0 (size!653 (buf!968 thiss!1379)) (currentByte!2269 thiss!1379) (currentBit!2264 thiss!1379)))))

(declare-fun b!21769 () Bool)

(declare-fun res!18795 () Bool)

(assert (=> b!21769 (=> (not res!18795) (not e!14764))))

(assert (=> b!21769 (= res!18795 (validate_offset_bits!1 ((_ sign_extend 32) (size!653 (buf!968 thiss!1379))) ((_ sign_extend 32) (currentByte!2269 thiss!1379)) ((_ sign_extend 32) (currentBit!2264 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!21770 () Bool)

(assert (=> b!21770 (= e!14769 (array_inv!623 (buf!968 thiss!1379)))))

(assert (= (and start!5382 res!18800) b!21769))

(assert (= (and b!21769 res!18795) b!21768))

(assert (= (and b!21768 (not res!18798)) b!21763))

(assert (= (and b!21763 (not res!18797)) b!21762))

(assert (= (and b!21762 res!18794) b!21767))

(assert (= (and b!21762 (not res!18796)) b!21765))

(assert (= (and b!21765 (not res!18793)) b!21761))

(assert (= (and b!21761 (not res!18792)) b!21764))

(assert (= (and b!21764 (not res!18799)) b!21766))

(assert (= start!5382 b!21770))

(declare-fun m!30157 () Bool)

(assert (=> b!21762 m!30157))

(declare-fun m!30159 () Bool)

(assert (=> b!21762 m!30159))

(declare-fun m!30161 () Bool)

(assert (=> b!21762 m!30161))

(declare-fun m!30163 () Bool)

(assert (=> b!21762 m!30163))

(declare-fun m!30165 () Bool)

(assert (=> b!21762 m!30165))

(declare-fun m!30167 () Bool)

(assert (=> b!21762 m!30167))

(declare-fun m!30169 () Bool)

(assert (=> b!21762 m!30169))

(declare-fun m!30171 () Bool)

(assert (=> start!5382 m!30171))

(declare-fun m!30173 () Bool)

(assert (=> start!5382 m!30173))

(declare-fun m!30175 () Bool)

(assert (=> b!21761 m!30175))

(declare-fun m!30177 () Bool)

(assert (=> b!21763 m!30177))

(declare-fun m!30179 () Bool)

(assert (=> b!21763 m!30179))

(declare-fun m!30181 () Bool)

(assert (=> b!21763 m!30181))

(declare-fun m!30183 () Bool)

(assert (=> b!21763 m!30183))

(declare-fun m!30185 () Bool)

(assert (=> b!21763 m!30185))

(assert (=> b!21763 m!30181))

(declare-fun m!30187 () Bool)

(assert (=> b!21766 m!30187))

(declare-fun m!30189 () Bool)

(assert (=> b!21770 m!30189))

(declare-fun m!30191 () Bool)

(assert (=> b!21765 m!30191))

(declare-fun m!30193 () Bool)

(assert (=> b!21769 m!30193))

(declare-fun m!30195 () Bool)

(assert (=> b!21768 m!30195))

(declare-fun m!30197 () Bool)

(assert (=> b!21768 m!30197))

(declare-fun m!30199 () Bool)

(assert (=> b!21768 m!30199))

(declare-fun m!30201 () Bool)

(assert (=> b!21767 m!30201))

(assert (=> b!21767 m!30201))

(declare-fun m!30203 () Bool)

(assert (=> b!21767 m!30203))

(declare-fun m!30205 () Bool)

(assert (=> b!21767 m!30205))

(assert (=> b!21767 m!30205))

(declare-fun m!30207 () Bool)

(assert (=> b!21767 m!30207))

(check-sat (not b!21762) (not b!21765) (not b!21763) (not b!21767) (not start!5382) (not b!21768) (not b!21766) (not b!21769) (not b!21770) (not b!21761))
(check-sat)
(get-model)

(declare-fun d!6924 () Bool)

(declare-fun e!14799 () Bool)

(assert (=> d!6924 e!14799))

(declare-fun res!18832 () Bool)

(assert (=> d!6924 (=> (not res!18832) (not e!14799))))

(declare-fun lt!31458 () (_ BitVec 64))

(declare-fun lt!31454 () (_ BitVec 64))

(declare-fun lt!31457 () (_ BitVec 64))

(assert (=> d!6924 (= res!18832 (= lt!31454 (bvsub lt!31458 lt!31457)))))

(assert (=> d!6924 (or (= (bvand lt!31458 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!31457 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!31458 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!31458 lt!31457) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!6924 (= lt!31457 (remainingBits!0 ((_ sign_extend 32) (size!653 (buf!968 (_2!1362 lt!31413)))) ((_ sign_extend 32) (currentByte!2269 (_2!1362 lt!31413))) ((_ sign_extend 32) (currentBit!2264 (_2!1362 lt!31413)))))))

(declare-fun lt!31455 () (_ BitVec 64))

(declare-fun lt!31459 () (_ BitVec 64))

(assert (=> d!6924 (= lt!31458 (bvmul lt!31455 lt!31459))))

(assert (=> d!6924 (or (= lt!31455 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!31459 (bvsdiv (bvmul lt!31455 lt!31459) lt!31455)))))

(assert (=> d!6924 (= lt!31459 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!6924 (= lt!31455 ((_ sign_extend 32) (size!653 (buf!968 (_2!1362 lt!31413)))))))

(assert (=> d!6924 (= lt!31454 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2269 (_2!1362 lt!31413))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2264 (_2!1362 lt!31413)))))))

(assert (=> d!6924 (invariant!0 (currentBit!2264 (_2!1362 lt!31413)) (currentByte!2269 (_2!1362 lt!31413)) (size!653 (buf!968 (_2!1362 lt!31413))))))

(assert (=> d!6924 (= (bitIndex!0 (size!653 (buf!968 (_2!1362 lt!31413))) (currentByte!2269 (_2!1362 lt!31413)) (currentBit!2264 (_2!1362 lt!31413))) lt!31454)))

(declare-fun b!21811 () Bool)

(declare-fun res!18833 () Bool)

(assert (=> b!21811 (=> (not res!18833) (not e!14799))))

(assert (=> b!21811 (= res!18833 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!31454))))

(declare-fun b!21812 () Bool)

(declare-fun lt!31456 () (_ BitVec 64))

(assert (=> b!21812 (= e!14799 (bvsle lt!31454 (bvmul lt!31456 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!21812 (or (= lt!31456 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!31456 #b0000000000000000000000000000000000000000000000000000000000001000) lt!31456)))))

(assert (=> b!21812 (= lt!31456 ((_ sign_extend 32) (size!653 (buf!968 (_2!1362 lt!31413)))))))

(assert (= (and d!6924 res!18832) b!21811))

(assert (= (and b!21811 res!18833) b!21812))

(declare-fun m!30265 () Bool)

(assert (=> d!6924 m!30265))

(assert (=> d!6924 m!30175))

(assert (=> b!21765 d!6924))

(declare-fun d!6934 () Bool)

(assert (=> d!6934 (= (array_inv!623 (buf!968 thiss!1379)) (bvsge (size!653 (buf!968 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!21770 d!6934))

(declare-fun d!6936 () Bool)

(assert (=> d!6936 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!653 (buf!968 thiss!1379))) ((_ sign_extend 32) (currentByte!2269 thiss!1379)) ((_ sign_extend 32) (currentBit!2264 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!653 (buf!968 thiss!1379))) ((_ sign_extend 32) (currentByte!2269 thiss!1379)) ((_ sign_extend 32) (currentBit!2264 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2030 () Bool)

(assert (= bs!2030 d!6936))

(declare-fun m!30267 () Bool)

(assert (=> bs!2030 m!30267))

(assert (=> b!21769 d!6936))

(declare-fun d!6938 () Bool)

(declare-fun res!18842 () Bool)

(declare-fun e!14811 () Bool)

(assert (=> d!6938 (=> (not res!18842) (not e!14811))))

(assert (=> d!6938 (= res!18842 (= (size!653 (buf!968 thiss!1379)) (size!653 (buf!968 (_2!1362 lt!31416)))))))

(assert (=> d!6938 (= (isPrefixOf!0 thiss!1379 (_2!1362 lt!31416)) e!14811)))

(declare-fun b!21831 () Bool)

(declare-fun res!18840 () Bool)

(assert (=> b!21831 (=> (not res!18840) (not e!14811))))

(assert (=> b!21831 (= res!18840 (bvsle (bitIndex!0 (size!653 (buf!968 thiss!1379)) (currentByte!2269 thiss!1379) (currentBit!2264 thiss!1379)) (bitIndex!0 (size!653 (buf!968 (_2!1362 lt!31416))) (currentByte!2269 (_2!1362 lt!31416)) (currentBit!2264 (_2!1362 lt!31416)))))))

(declare-fun b!21832 () Bool)

(declare-fun e!14810 () Bool)

(assert (=> b!21832 (= e!14811 e!14810)))

(declare-fun res!18841 () Bool)

(assert (=> b!21832 (=> res!18841 e!14810)))

(assert (=> b!21832 (= res!18841 (= (size!653 (buf!968 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!21833 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1531 array!1531 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!21833 (= e!14810 (arrayBitRangesEq!0 (buf!968 thiss!1379) (buf!968 (_2!1362 lt!31416)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!653 (buf!968 thiss!1379)) (currentByte!2269 thiss!1379) (currentBit!2264 thiss!1379))))))

(assert (= (and d!6938 res!18842) b!21831))

(assert (= (and b!21831 res!18840) b!21832))

(assert (= (and b!21832 (not res!18841)) b!21833))

(assert (=> b!21831 m!30199))

(declare-fun m!30277 () Bool)

(assert (=> b!21831 m!30277))

(assert (=> b!21833 m!30199))

(assert (=> b!21833 m!30199))

(declare-fun m!30279 () Bool)

(assert (=> b!21833 m!30279))

(assert (=> b!21763 d!6938))

(declare-fun d!6944 () Bool)

(assert (=> d!6944 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!653 (buf!968 (_2!1362 lt!31416)))) ((_ sign_extend 32) (currentByte!2269 (_2!1362 lt!31416))) ((_ sign_extend 32) (currentBit!2264 (_2!1362 lt!31416))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!653 (buf!968 (_2!1362 lt!31416)))) ((_ sign_extend 32) (currentByte!2269 (_2!1362 lt!31416))) ((_ sign_extend 32) (currentBit!2264 (_2!1362 lt!31416)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!2031 () Bool)

(assert (= bs!2031 d!6944))

(declare-fun m!30281 () Bool)

(assert (=> bs!2031 m!30281))

(assert (=> b!21763 d!6944))

(declare-fun d!6946 () Bool)

(declare-fun e!14820 () Bool)

(assert (=> d!6946 e!14820))

(declare-fun res!18854 () Bool)

(assert (=> d!6946 (=> (not res!18854) (not e!14820))))

(assert (=> d!6946 (= res!18854 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!31474 () Unit!1900)

(declare-fun choose!27 (BitStream!1140 BitStream!1140 (_ BitVec 64) (_ BitVec 64)) Unit!1900)

(assert (=> d!6946 (= lt!31474 (choose!27 thiss!1379 (_2!1362 lt!31416) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!6946 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!6946 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1362 lt!31416) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!31474)))

(declare-fun b!21845 () Bool)

(assert (=> b!21845 (= e!14820 (validate_offset_bits!1 ((_ sign_extend 32) (size!653 (buf!968 (_2!1362 lt!31416)))) ((_ sign_extend 32) (currentByte!2269 (_2!1362 lt!31416))) ((_ sign_extend 32) (currentBit!2264 (_2!1362 lt!31416))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!6946 res!18854) b!21845))

(declare-fun m!30287 () Bool)

(assert (=> d!6946 m!30287))

(assert (=> b!21845 m!30177))

(assert (=> b!21763 d!6946))

(declare-fun b!21914 () Bool)

(declare-fun e!14856 () Bool)

(declare-datatypes ((tuple2!2572 0))(
  ( (tuple2!2573 (_1!1371 BitStream!1140) (_2!1371 Bool)) )
))
(declare-fun lt!31645 () tuple2!2572)

(declare-fun lt!31649 () tuple2!2554)

(assert (=> b!21914 (= e!14856 (= (bitIndex!0 (size!653 (buf!968 (_1!1371 lt!31645))) (currentByte!2269 (_1!1371 lt!31645)) (currentBit!2264 (_1!1371 lt!31645))) (bitIndex!0 (size!653 (buf!968 (_2!1362 lt!31649))) (currentByte!2269 (_2!1362 lt!31649)) (currentBit!2264 (_2!1362 lt!31649)))))))

(declare-fun b!21915 () Bool)

(declare-fun e!14857 () Bool)

(assert (=> b!21915 (= e!14857 e!14856)))

(declare-fun res!18911 () Bool)

(assert (=> b!21915 (=> (not res!18911) (not e!14856))))

(declare-fun lt!31652 () (_ BitVec 8))

(assert (=> b!21915 (= res!18911 (and (= (_2!1371 lt!31645) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1103 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!31652)) #b00000000000000000000000000000000))) (= (_1!1371 lt!31645) (_2!1362 lt!31649))))))

(declare-datatypes ((tuple2!2574 0))(
  ( (tuple2!2575 (_1!1372 array!1531) (_2!1372 BitStream!1140)) )
))
(declare-fun lt!31647 () tuple2!2574)

(declare-fun lt!31644 () BitStream!1140)

(declare-fun readBits!0 (BitStream!1140 (_ BitVec 64)) tuple2!2574)

(assert (=> b!21915 (= lt!31647 (readBits!0 lt!31644 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1140) tuple2!2572)

(assert (=> b!21915 (= lt!31645 (readBitPure!0 lt!31644))))

(declare-fun readerFrom!0 (BitStream!1140 (_ BitVec 32) (_ BitVec 32)) BitStream!1140)

(assert (=> b!21915 (= lt!31644 (readerFrom!0 (_2!1362 lt!31649) (currentBit!2264 thiss!1379) (currentByte!2269 thiss!1379)))))

(declare-fun b!21916 () Bool)

(declare-fun res!18917 () Bool)

(assert (=> b!21916 (=> (not res!18917) (not e!14857))))

(assert (=> b!21916 (= res!18917 (isPrefixOf!0 thiss!1379 (_2!1362 lt!31649)))))

(declare-fun b!21917 () Bool)

(declare-fun res!18910 () Bool)

(declare-fun e!14855 () Bool)

(assert (=> b!21917 (=> (not res!18910) (not e!14855))))

(declare-fun lt!31648 () tuple2!2554)

(assert (=> b!21917 (= res!18910 (= (bitIndex!0 (size!653 (buf!968 (_2!1362 lt!31648))) (currentByte!2269 (_2!1362 lt!31648)) (currentBit!2264 (_2!1362 lt!31648))) (bvadd (bitIndex!0 (size!653 (buf!968 thiss!1379)) (currentByte!2269 thiss!1379) (currentBit!2264 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!21918 () Bool)

(declare-fun res!18912 () Bool)

(assert (=> b!21918 (=> (not res!18912) (not e!14857))))

(declare-fun lt!31651 () (_ BitVec 64))

(declare-fun lt!31653 () (_ BitVec 64))

(assert (=> b!21918 (= res!18912 (= (bitIndex!0 (size!653 (buf!968 (_2!1362 lt!31649))) (currentByte!2269 (_2!1362 lt!31649)) (currentBit!2264 (_2!1362 lt!31649))) (bvadd lt!31653 lt!31651)))))

(assert (=> b!21918 (or (not (= (bvand lt!31653 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!31651 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!31653 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!31653 lt!31651) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21918 (= lt!31651 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!21918 (= lt!31653 (bitIndex!0 (size!653 (buf!968 thiss!1379)) (currentByte!2269 thiss!1379) (currentBit!2264 thiss!1379)))))

(declare-fun d!6952 () Bool)

(assert (=> d!6952 e!14857))

(declare-fun res!18913 () Bool)

(assert (=> d!6952 (=> (not res!18913) (not e!14857))))

(assert (=> d!6952 (= res!18913 (= (size!653 (buf!968 (_2!1362 lt!31649))) (size!653 (buf!968 thiss!1379))))))

(declare-fun lt!31643 () array!1531)

(assert (=> d!6952 (= lt!31652 (select (arr!1103 lt!31643) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!6952 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!653 lt!31643)))))

(assert (=> d!6952 (= lt!31643 (array!1532 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!31646 () tuple2!2554)

(assert (=> d!6952 (= lt!31649 (tuple2!2555 (_1!1362 lt!31646) (_2!1362 lt!31646)))))

(assert (=> d!6952 (= lt!31646 lt!31648)))

(assert (=> d!6952 e!14855))

(declare-fun res!18915 () Bool)

(assert (=> d!6952 (=> (not res!18915) (not e!14855))))

(assert (=> d!6952 (= res!18915 (= (size!653 (buf!968 thiss!1379)) (size!653 (buf!968 (_2!1362 lt!31648)))))))

(declare-fun lt!31650 () Bool)

(declare-fun appendBit!0 (BitStream!1140 Bool) tuple2!2554)

(assert (=> d!6952 (= lt!31648 (appendBit!0 thiss!1379 lt!31650))))

(assert (=> d!6952 (= lt!31650 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1103 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!6952 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!6952 (= (appendBitFromByte!0 thiss!1379 (select (arr!1103 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!31649)))

(declare-fun b!21919 () Bool)

(declare-fun res!18914 () Bool)

(assert (=> b!21919 (=> (not res!18914) (not e!14855))))

(assert (=> b!21919 (= res!18914 (isPrefixOf!0 thiss!1379 (_2!1362 lt!31648)))))

(declare-fun b!21920 () Bool)

(declare-fun e!14854 () Bool)

(declare-fun lt!31654 () tuple2!2572)

(assert (=> b!21920 (= e!14854 (= (bitIndex!0 (size!653 (buf!968 (_1!1371 lt!31654))) (currentByte!2269 (_1!1371 lt!31654)) (currentBit!2264 (_1!1371 lt!31654))) (bitIndex!0 (size!653 (buf!968 (_2!1362 lt!31648))) (currentByte!2269 (_2!1362 lt!31648)) (currentBit!2264 (_2!1362 lt!31648)))))))

(declare-fun b!21921 () Bool)

(assert (=> b!21921 (= e!14855 e!14854)))

(declare-fun res!18916 () Bool)

(assert (=> b!21921 (=> (not res!18916) (not e!14854))))

(assert (=> b!21921 (= res!18916 (and (= (_2!1371 lt!31654) lt!31650) (= (_1!1371 lt!31654) (_2!1362 lt!31648))))))

(assert (=> b!21921 (= lt!31654 (readBitPure!0 (readerFrom!0 (_2!1362 lt!31648) (currentBit!2264 thiss!1379) (currentByte!2269 thiss!1379))))))

(assert (= (and d!6952 res!18915) b!21917))

(assert (= (and b!21917 res!18910) b!21919))

(assert (= (and b!21919 res!18914) b!21921))

(assert (= (and b!21921 res!18916) b!21920))

(assert (= (and d!6952 res!18913) b!21918))

(assert (= (and b!21918 res!18912) b!21916))

(assert (= (and b!21916 res!18917) b!21915))

(assert (= (and b!21915 res!18911) b!21914))

(declare-fun m!30359 () Bool)

(assert (=> b!21914 m!30359))

(declare-fun m!30361 () Bool)

(assert (=> b!21914 m!30361))

(declare-fun m!30363 () Bool)

(assert (=> b!21921 m!30363))

(assert (=> b!21921 m!30363))

(declare-fun m!30365 () Bool)

(assert (=> b!21921 m!30365))

(declare-fun m!30367 () Bool)

(assert (=> b!21915 m!30367))

(declare-fun m!30369 () Bool)

(assert (=> b!21915 m!30369))

(declare-fun m!30371 () Bool)

(assert (=> b!21915 m!30371))

(declare-fun m!30373 () Bool)

(assert (=> b!21917 m!30373))

(assert (=> b!21917 m!30199))

(assert (=> b!21918 m!30361))

(assert (=> b!21918 m!30199))

(declare-fun m!30375 () Bool)

(assert (=> b!21920 m!30375))

(assert (=> b!21920 m!30373))

(declare-fun m!30377 () Bool)

(assert (=> b!21916 m!30377))

(declare-fun m!30379 () Bool)

(assert (=> d!6952 m!30379))

(declare-fun m!30381 () Bool)

(assert (=> d!6952 m!30381))

(declare-fun m!30383 () Bool)

(assert (=> d!6952 m!30383))

(declare-fun m!30385 () Bool)

(assert (=> b!21919 m!30385))

(assert (=> b!21763 d!6952))

(declare-fun d!6980 () Bool)

(declare-fun res!18920 () Bool)

(declare-fun e!14859 () Bool)

(assert (=> d!6980 (=> (not res!18920) (not e!14859))))

(assert (=> d!6980 (= res!18920 (= (size!653 (buf!968 thiss!1379)) (size!653 (buf!968 thiss!1379))))))

(assert (=> d!6980 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!14859)))

(declare-fun b!21922 () Bool)

(declare-fun res!18918 () Bool)

(assert (=> b!21922 (=> (not res!18918) (not e!14859))))

(assert (=> b!21922 (= res!18918 (bvsle (bitIndex!0 (size!653 (buf!968 thiss!1379)) (currentByte!2269 thiss!1379) (currentBit!2264 thiss!1379)) (bitIndex!0 (size!653 (buf!968 thiss!1379)) (currentByte!2269 thiss!1379) (currentBit!2264 thiss!1379))))))

(declare-fun b!21923 () Bool)

(declare-fun e!14858 () Bool)

(assert (=> b!21923 (= e!14859 e!14858)))

(declare-fun res!18919 () Bool)

(assert (=> b!21923 (=> res!18919 e!14858)))

(assert (=> b!21923 (= res!18919 (= (size!653 (buf!968 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!21924 () Bool)

(assert (=> b!21924 (= e!14858 (arrayBitRangesEq!0 (buf!968 thiss!1379) (buf!968 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!653 (buf!968 thiss!1379)) (currentByte!2269 thiss!1379) (currentBit!2264 thiss!1379))))))

(assert (= (and d!6980 res!18920) b!21922))

(assert (= (and b!21922 res!18918) b!21923))

(assert (= (and b!21923 (not res!18919)) b!21924))

(assert (=> b!21922 m!30199))

(assert (=> b!21922 m!30199))

(assert (=> b!21924 m!30199))

(assert (=> b!21924 m!30199))

(declare-fun m!30387 () Bool)

(assert (=> b!21924 m!30387))

(assert (=> b!21768 d!6980))

(declare-fun d!6982 () Bool)

(assert (=> d!6982 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!31657 () Unit!1900)

(declare-fun choose!11 (BitStream!1140) Unit!1900)

(assert (=> d!6982 (= lt!31657 (choose!11 thiss!1379))))

(assert (=> d!6982 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!31657)))

(declare-fun bs!2040 () Bool)

(assert (= bs!2040 d!6982))

(assert (=> bs!2040 m!30195))

(declare-fun m!30389 () Bool)

(assert (=> bs!2040 m!30389))

(assert (=> b!21768 d!6982))

(declare-fun d!6984 () Bool)

(declare-fun e!14860 () Bool)

(assert (=> d!6984 e!14860))

(declare-fun res!18921 () Bool)

(assert (=> d!6984 (=> (not res!18921) (not e!14860))))

(declare-fun lt!31658 () (_ BitVec 64))

(declare-fun lt!31661 () (_ BitVec 64))

(declare-fun lt!31662 () (_ BitVec 64))

(assert (=> d!6984 (= res!18921 (= lt!31658 (bvsub lt!31662 lt!31661)))))

(assert (=> d!6984 (or (= (bvand lt!31662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!31661 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!31662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!31662 lt!31661) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!6984 (= lt!31661 (remainingBits!0 ((_ sign_extend 32) (size!653 (buf!968 thiss!1379))) ((_ sign_extend 32) (currentByte!2269 thiss!1379)) ((_ sign_extend 32) (currentBit!2264 thiss!1379))))))

(declare-fun lt!31659 () (_ BitVec 64))

(declare-fun lt!31663 () (_ BitVec 64))

(assert (=> d!6984 (= lt!31662 (bvmul lt!31659 lt!31663))))

(assert (=> d!6984 (or (= lt!31659 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!31663 (bvsdiv (bvmul lt!31659 lt!31663) lt!31659)))))

(assert (=> d!6984 (= lt!31663 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!6984 (= lt!31659 ((_ sign_extend 32) (size!653 (buf!968 thiss!1379))))))

(assert (=> d!6984 (= lt!31658 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2269 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2264 thiss!1379))))))

(assert (=> d!6984 (invariant!0 (currentBit!2264 thiss!1379) (currentByte!2269 thiss!1379) (size!653 (buf!968 thiss!1379)))))

(assert (=> d!6984 (= (bitIndex!0 (size!653 (buf!968 thiss!1379)) (currentByte!2269 thiss!1379) (currentBit!2264 thiss!1379)) lt!31658)))

(declare-fun b!21925 () Bool)

(declare-fun res!18922 () Bool)

(assert (=> b!21925 (=> (not res!18922) (not e!14860))))

(assert (=> b!21925 (= res!18922 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!31658))))

(declare-fun b!21926 () Bool)

(declare-fun lt!31660 () (_ BitVec 64))

(assert (=> b!21926 (= e!14860 (bvsle lt!31658 (bvmul lt!31660 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!21926 (or (= lt!31660 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!31660 #b0000000000000000000000000000000000000000000000000000000000001000) lt!31660)))))

(assert (=> b!21926 (= lt!31660 ((_ sign_extend 32) (size!653 (buf!968 thiss!1379))))))

(assert (= (and d!6984 res!18921) b!21925))

(assert (= (and b!21925 res!18922) b!21926))

(assert (=> d!6984 m!30267))

(assert (=> d!6984 m!30187))

(assert (=> b!21768 d!6984))

(declare-fun d!6986 () Bool)

(assert (=> d!6986 (= (head!108 (byteArrayBitContentToList!0 (_2!1362 lt!31416) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!386 (byteArrayBitContentToList!0 (_2!1362 lt!31416) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!21767 d!6986))

(declare-fun d!6988 () Bool)

(declare-fun c!1567 () Bool)

(assert (=> d!6988 (= c!1567 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!14863 () List!271)

(assert (=> d!6988 (= (byteArrayBitContentToList!0 (_2!1362 lt!31416) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!14863)))

(declare-fun b!21931 () Bool)

(assert (=> b!21931 (= e!14863 Nil!268)))

(declare-fun b!21932 () Bool)

(assert (=> b!21932 (= e!14863 (Cons!267 (not (= (bvand ((_ sign_extend 24) (select (arr!1103 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1362 lt!31416) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!6988 c!1567) b!21931))

(assert (= (and d!6988 (not c!1567)) b!21932))

(assert (=> b!21932 m!30181))

(assert (=> b!21932 m!30383))

(declare-fun m!30391 () Bool)

(assert (=> b!21932 m!30391))

(assert (=> b!21767 d!6988))

(declare-fun d!6990 () Bool)

(assert (=> d!6990 (= (head!108 (bitStreamReadBitsIntoList!0 (_2!1362 lt!31416) (_1!1363 lt!31415) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!386 (bitStreamReadBitsIntoList!0 (_2!1362 lt!31416) (_1!1363 lt!31415) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!21767 d!6990))

(declare-fun b!21943 () Bool)

(declare-fun e!14868 () Bool)

(declare-fun lt!31671 () List!271)

(declare-fun isEmpty!60 (List!271) Bool)

(assert (=> b!21943 (= e!14868 (isEmpty!60 lt!31671))))

(declare-fun lt!31670 () (_ BitVec 64))

(declare-datatypes ((tuple2!2578 0))(
  ( (tuple2!2579 (_1!1374 List!271) (_2!1374 BitStream!1140)) )
))
(declare-fun e!14869 () tuple2!2578)

(declare-datatypes ((tuple2!2580 0))(
  ( (tuple2!2581 (_1!1375 Bool) (_2!1375 BitStream!1140)) )
))
(declare-fun lt!31672 () tuple2!2580)

(declare-fun b!21942 () Bool)

(assert (=> b!21942 (= e!14869 (tuple2!2579 (Cons!267 (_1!1375 lt!31672) (bitStreamReadBitsIntoList!0 (_2!1362 lt!31416) (_2!1375 lt!31672) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!31670))) (_2!1375 lt!31672)))))

(declare-fun readBit!0 (BitStream!1140) tuple2!2580)

(assert (=> b!21942 (= lt!31672 (readBit!0 (_1!1363 lt!31415)))))

(assert (=> b!21942 (= lt!31670 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!6992 () Bool)

(assert (=> d!6992 e!14868))

(declare-fun c!1573 () Bool)

(assert (=> d!6992 (= c!1573 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!6992 (= lt!31671 (_1!1374 e!14869))))

(declare-fun c!1572 () Bool)

(assert (=> d!6992 (= c!1572 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!6992 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!6992 (= (bitStreamReadBitsIntoList!0 (_2!1362 lt!31416) (_1!1363 lt!31415) #b0000000000000000000000000000000000000000000000000000000000000001) lt!31671)))

(declare-fun b!21944 () Bool)

(declare-fun length!55 (List!271) Int)

(assert (=> b!21944 (= e!14868 (> (length!55 lt!31671) 0))))

(declare-fun b!21941 () Bool)

(assert (=> b!21941 (= e!14869 (tuple2!2579 Nil!268 (_1!1363 lt!31415)))))

(assert (= (and d!6992 c!1572) b!21941))

(assert (= (and d!6992 (not c!1572)) b!21942))

(assert (= (and d!6992 c!1573) b!21943))

(assert (= (and d!6992 (not c!1573)) b!21944))

