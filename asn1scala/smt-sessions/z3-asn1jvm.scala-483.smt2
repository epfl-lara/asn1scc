; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14252 () Bool)

(assert start!14252)

(declare-fun res!61319 () Bool)

(declare-fun e!48454 () Bool)

(assert (=> start!14252 (=> (not res!61319) (not e!48454))))

(declare-datatypes ((array!3006 0))(
  ( (array!3007 (arr!2001 (Array (_ BitVec 32) (_ BitVec 8))) (size!1407 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!3006)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!14252 (= res!61319 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1407 srcBuffer!2))))))))

(assert (=> start!14252 e!48454))

(assert (=> start!14252 true))

(declare-fun array_inv!1253 (array!3006) Bool)

(assert (=> start!14252 (array_inv!1253 srcBuffer!2)))

(declare-datatypes ((BitStream!2388 0))(
  ( (BitStream!2389 (buf!1788 array!3006) (currentByte!3520 (_ BitVec 32)) (currentBit!3515 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2388)

(declare-fun e!48455 () Bool)

(declare-fun inv!12 (BitStream!2388) Bool)

(assert (=> start!14252 (and (inv!12 thiss!1379) e!48455)))

(declare-fun b!74186 () Bool)

(declare-fun res!61320 () Bool)

(assert (=> b!74186 (=> (not res!61320) (not e!48454))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74186 (= res!61320 (validate_offset_bits!1 ((_ sign_extend 32) (size!1407 (buf!1788 thiss!1379))) ((_ sign_extend 32) (currentByte!3520 thiss!1379)) ((_ sign_extend 32) (currentBit!3515 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun lt!119503 () (_ BitVec 64))

(declare-fun b!74187 () Bool)

(assert (=> b!74187 (= e!48454 (not (or (bvslt i!635 to!314) (let ((bdg!3621 (bvand lt!119503 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (not (= bdg!3621 (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= bdg!3621 (bvand (bvadd lt!119503 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun isPrefixOf!0 (BitStream!2388 BitStream!2388) Bool)

(assert (=> b!74187 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4891 0))(
  ( (Unit!4892) )
))
(declare-fun lt!119502 () Unit!4891)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2388) Unit!4891)

(assert (=> b!74187 (= lt!119502 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!74187 (= lt!119503 (bitIndex!0 (size!1407 (buf!1788 thiss!1379)) (currentByte!3520 thiss!1379) (currentBit!3515 thiss!1379)))))

(declare-fun b!74188 () Bool)

(assert (=> b!74188 (= e!48455 (array_inv!1253 (buf!1788 thiss!1379)))))

(assert (= (and start!14252 res!61319) b!74186))

(assert (= (and b!74186 res!61320) b!74187))

(assert (= start!14252 b!74188))

(declare-fun m!119145 () Bool)

(assert (=> start!14252 m!119145))

(declare-fun m!119147 () Bool)

(assert (=> start!14252 m!119147))

(declare-fun m!119149 () Bool)

(assert (=> b!74186 m!119149))

(declare-fun m!119151 () Bool)

(assert (=> b!74187 m!119151))

(declare-fun m!119153 () Bool)

(assert (=> b!74187 m!119153))

(declare-fun m!119155 () Bool)

(assert (=> b!74187 m!119155))

(declare-fun m!119157 () Bool)

(assert (=> b!74188 m!119157))

(check-sat (not b!74186) (not b!74187) (not start!14252) (not b!74188))
(check-sat)
(get-model)

(declare-fun d!23556 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!23556 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1407 (buf!1788 thiss!1379))) ((_ sign_extend 32) (currentByte!3520 thiss!1379)) ((_ sign_extend 32) (currentBit!3515 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1407 (buf!1788 thiss!1379))) ((_ sign_extend 32) (currentByte!3520 thiss!1379)) ((_ sign_extend 32) (currentBit!3515 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5655 () Bool)

(assert (= bs!5655 d!23556))

(declare-fun m!119173 () Bool)

(assert (=> bs!5655 m!119173))

(assert (=> b!74186 d!23556))

(declare-fun d!23558 () Bool)

(declare-fun res!61334 () Bool)

(declare-fun e!48473 () Bool)

(assert (=> d!23558 (=> (not res!61334) (not e!48473))))

(assert (=> d!23558 (= res!61334 (= (size!1407 (buf!1788 thiss!1379)) (size!1407 (buf!1788 thiss!1379))))))

(assert (=> d!23558 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!48473)))

(declare-fun b!74204 () Bool)

(declare-fun res!61335 () Bool)

(assert (=> b!74204 (=> (not res!61335) (not e!48473))))

(assert (=> b!74204 (= res!61335 (bvsle (bitIndex!0 (size!1407 (buf!1788 thiss!1379)) (currentByte!3520 thiss!1379) (currentBit!3515 thiss!1379)) (bitIndex!0 (size!1407 (buf!1788 thiss!1379)) (currentByte!3520 thiss!1379) (currentBit!3515 thiss!1379))))))

(declare-fun b!74205 () Bool)

(declare-fun e!48472 () Bool)

(assert (=> b!74205 (= e!48473 e!48472)))

(declare-fun res!61333 () Bool)

(assert (=> b!74205 (=> res!61333 e!48472)))

(assert (=> b!74205 (= res!61333 (= (size!1407 (buf!1788 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!74206 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3006 array!3006 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74206 (= e!48472 (arrayBitRangesEq!0 (buf!1788 thiss!1379) (buf!1788 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1407 (buf!1788 thiss!1379)) (currentByte!3520 thiss!1379) (currentBit!3515 thiss!1379))))))

(assert (= (and d!23558 res!61334) b!74204))

(assert (= (and b!74204 res!61335) b!74205))

(assert (= (and b!74205 (not res!61333)) b!74206))

(assert (=> b!74204 m!119155))

(assert (=> b!74204 m!119155))

(assert (=> b!74206 m!119155))

(assert (=> b!74206 m!119155))

(declare-fun m!119175 () Bool)

(assert (=> b!74206 m!119175))

(assert (=> b!74187 d!23558))

(declare-fun d!23560 () Bool)

(assert (=> d!23560 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!119512 () Unit!4891)

(declare-fun choose!11 (BitStream!2388) Unit!4891)

(assert (=> d!23560 (= lt!119512 (choose!11 thiss!1379))))

(assert (=> d!23560 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!119512)))

(declare-fun bs!5657 () Bool)

(assert (= bs!5657 d!23560))

(assert (=> bs!5657 m!119151))

(declare-fun m!119177 () Bool)

(assert (=> bs!5657 m!119177))

(assert (=> b!74187 d!23560))

(declare-fun d!23562 () Bool)

(declare-fun e!48482 () Bool)

(assert (=> d!23562 e!48482))

(declare-fun res!61350 () Bool)

(assert (=> d!23562 (=> (not res!61350) (not e!48482))))

(declare-fun lt!119532 () (_ BitVec 64))

(declare-fun lt!119528 () (_ BitVec 64))

(declare-fun lt!119533 () (_ BitVec 64))

(assert (=> d!23562 (= res!61350 (= lt!119533 (bvsub lt!119532 lt!119528)))))

(assert (=> d!23562 (or (= (bvand lt!119532 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!119528 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!119532 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!119532 lt!119528) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23562 (= lt!119528 (remainingBits!0 ((_ sign_extend 32) (size!1407 (buf!1788 thiss!1379))) ((_ sign_extend 32) (currentByte!3520 thiss!1379)) ((_ sign_extend 32) (currentBit!3515 thiss!1379))))))

(declare-fun lt!119530 () (_ BitVec 64))

(declare-fun lt!119531 () (_ BitVec 64))

(assert (=> d!23562 (= lt!119532 (bvmul lt!119530 lt!119531))))

(assert (=> d!23562 (or (= lt!119530 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!119531 (bvsdiv (bvmul lt!119530 lt!119531) lt!119530)))))

(assert (=> d!23562 (= lt!119531 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23562 (= lt!119530 ((_ sign_extend 32) (size!1407 (buf!1788 thiss!1379))))))

(assert (=> d!23562 (= lt!119533 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3520 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3515 thiss!1379))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!23562 (invariant!0 (currentBit!3515 thiss!1379) (currentByte!3520 thiss!1379) (size!1407 (buf!1788 thiss!1379)))))

(assert (=> d!23562 (= (bitIndex!0 (size!1407 (buf!1788 thiss!1379)) (currentByte!3520 thiss!1379) (currentBit!3515 thiss!1379)) lt!119533)))

(declare-fun b!74220 () Bool)

(declare-fun res!61349 () Bool)

(assert (=> b!74220 (=> (not res!61349) (not e!48482))))

(assert (=> b!74220 (= res!61349 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!119533))))

(declare-fun b!74221 () Bool)

(declare-fun lt!119529 () (_ BitVec 64))

(assert (=> b!74221 (= e!48482 (bvsle lt!119533 (bvmul lt!119529 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!74221 (or (= lt!119529 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!119529 #b0000000000000000000000000000000000000000000000000000000000001000) lt!119529)))))

(assert (=> b!74221 (= lt!119529 ((_ sign_extend 32) (size!1407 (buf!1788 thiss!1379))))))

(assert (= (and d!23562 res!61350) b!74220))

(assert (= (and b!74220 res!61349) b!74221))

(assert (=> d!23562 m!119173))

(declare-fun m!119185 () Bool)

(assert (=> d!23562 m!119185))

(assert (=> b!74187 d!23562))

(declare-fun d!23572 () Bool)

(assert (=> d!23572 (= (array_inv!1253 srcBuffer!2) (bvsge (size!1407 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!14252 d!23572))

(declare-fun d!23574 () Bool)

(assert (=> d!23574 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3515 thiss!1379) (currentByte!3520 thiss!1379) (size!1407 (buf!1788 thiss!1379))))))

(declare-fun bs!5661 () Bool)

(assert (= bs!5661 d!23574))

(assert (=> bs!5661 m!119185))

(assert (=> start!14252 d!23574))

(declare-fun d!23576 () Bool)

(assert (=> d!23576 (= (array_inv!1253 (buf!1788 thiss!1379)) (bvsge (size!1407 (buf!1788 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!74188 d!23576))

(check-sat (not b!74206) (not d!23574) (not d!23556) (not b!74204) (not d!23560) (not d!23562))
