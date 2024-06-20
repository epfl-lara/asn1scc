; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14294 () Bool)

(assert start!14294)

(declare-fun res!61382 () Bool)

(declare-fun e!48515 () Bool)

(assert (=> start!14294 (=> (not res!61382) (not e!48515))))

(declare-datatypes ((array!3015 0))(
  ( (array!3016 (arr!2004 (Array (_ BitVec 32) (_ BitVec 8))) (size!1410 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!3015)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!14294 (= res!61382 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1410 srcBuffer!2))))))))

(assert (=> start!14294 e!48515))

(assert (=> start!14294 true))

(declare-fun array_inv!1256 (array!3015) Bool)

(assert (=> start!14294 (array_inv!1256 srcBuffer!2)))

(declare-datatypes ((BitStream!2394 0))(
  ( (BitStream!2395 (buf!1791 array!3015) (currentByte!3529 (_ BitVec 32)) (currentBit!3524 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2394)

(declare-fun e!48516 () Bool)

(declare-fun inv!12 (BitStream!2394) Bool)

(assert (=> start!14294 (and (inv!12 thiss!1379) e!48516)))

(declare-fun b!74258 () Bool)

(declare-fun res!61383 () Bool)

(assert (=> b!74258 (=> (not res!61383) (not e!48515))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74258 (= res!61383 (validate_offset_bits!1 ((_ sign_extend 32) (size!1410 (buf!1791 thiss!1379))) ((_ sign_extend 32) (currentByte!3529 thiss!1379)) ((_ sign_extend 32) (currentBit!3524 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun lt!119583 () (_ BitVec 64))

(declare-fun b!74259 () Bool)

(assert (=> b!74259 (= e!48515 (not (or (bvslt i!635 to!314) (let ((bdg!3624 (bvadd lt!119583 to!314))) (let ((bdg!3625 (bvand bdg!3624 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (= bdg!3625 (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= bdg!3625 (bvand (bvsub bdg!3624 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun isPrefixOf!0 (BitStream!2394 BitStream!2394) Bool)

(assert (=> b!74259 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4897 0))(
  ( (Unit!4898) )
))
(declare-fun lt!119584 () Unit!4897)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2394) Unit!4897)

(assert (=> b!74259 (= lt!119584 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!74259 (= lt!119583 (bitIndex!0 (size!1410 (buf!1791 thiss!1379)) (currentByte!3529 thiss!1379) (currentBit!3524 thiss!1379)))))

(declare-fun b!74260 () Bool)

(assert (=> b!74260 (= e!48516 (array_inv!1256 (buf!1791 thiss!1379)))))

(assert (= (and start!14294 res!61382) b!74258))

(assert (= (and b!74258 res!61383) b!74259))

(assert (= start!14294 b!74260))

(declare-fun m!119211 () Bool)

(assert (=> start!14294 m!119211))

(declare-fun m!119213 () Bool)

(assert (=> start!14294 m!119213))

(declare-fun m!119215 () Bool)

(assert (=> b!74258 m!119215))

(declare-fun m!119217 () Bool)

(assert (=> b!74259 m!119217))

(declare-fun m!119219 () Bool)

(assert (=> b!74259 m!119219))

(declare-fun m!119221 () Bool)

(assert (=> b!74259 m!119221))

(declare-fun m!119223 () Bool)

(assert (=> b!74260 m!119223))

(check-sat (not b!74258) (not b!74260) (not b!74259) (not start!14294))
(check-sat)
(get-model)

(declare-fun d!23600 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!23600 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1410 (buf!1791 thiss!1379))) ((_ sign_extend 32) (currentByte!3529 thiss!1379)) ((_ sign_extend 32) (currentBit!3524 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1410 (buf!1791 thiss!1379))) ((_ sign_extend 32) (currentByte!3529 thiss!1379)) ((_ sign_extend 32) (currentBit!3524 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5670 () Bool)

(assert (= bs!5670 d!23600))

(declare-fun m!119239 () Bool)

(assert (=> bs!5670 m!119239))

(assert (=> b!74258 d!23600))

(declare-fun d!23602 () Bool)

(assert (=> d!23602 (= (array_inv!1256 (buf!1791 thiss!1379)) (bvsge (size!1410 (buf!1791 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!74260 d!23602))

(declare-fun d!23604 () Bool)

(declare-fun res!61396 () Bool)

(declare-fun e!48535 () Bool)

(assert (=> d!23604 (=> (not res!61396) (not e!48535))))

(assert (=> d!23604 (= res!61396 (= (size!1410 (buf!1791 thiss!1379)) (size!1410 (buf!1791 thiss!1379))))))

(assert (=> d!23604 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!48535)))

(declare-fun b!74276 () Bool)

(declare-fun res!61398 () Bool)

(assert (=> b!74276 (=> (not res!61398) (not e!48535))))

(assert (=> b!74276 (= res!61398 (bvsle (bitIndex!0 (size!1410 (buf!1791 thiss!1379)) (currentByte!3529 thiss!1379) (currentBit!3524 thiss!1379)) (bitIndex!0 (size!1410 (buf!1791 thiss!1379)) (currentByte!3529 thiss!1379) (currentBit!3524 thiss!1379))))))

(declare-fun b!74277 () Bool)

(declare-fun e!48536 () Bool)

(assert (=> b!74277 (= e!48535 e!48536)))

(declare-fun res!61397 () Bool)

(assert (=> b!74277 (=> res!61397 e!48536)))

(assert (=> b!74277 (= res!61397 (= (size!1410 (buf!1791 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!74278 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3015 array!3015 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74278 (= e!48536 (arrayBitRangesEq!0 (buf!1791 thiss!1379) (buf!1791 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1410 (buf!1791 thiss!1379)) (currentByte!3529 thiss!1379) (currentBit!3524 thiss!1379))))))

(assert (= (and d!23604 res!61396) b!74276))

(assert (= (and b!74276 res!61398) b!74277))

(assert (= (and b!74277 (not res!61397)) b!74278))

(assert (=> b!74276 m!119221))

(assert (=> b!74276 m!119221))

(assert (=> b!74278 m!119221))

(assert (=> b!74278 m!119221))

(declare-fun m!119241 () Bool)

(assert (=> b!74278 m!119241))

(assert (=> b!74259 d!23604))

(declare-fun d!23606 () Bool)

(assert (=> d!23606 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!119593 () Unit!4897)

(declare-fun choose!11 (BitStream!2394) Unit!4897)

(assert (=> d!23606 (= lt!119593 (choose!11 thiss!1379))))

(assert (=> d!23606 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!119593)))

(declare-fun bs!5672 () Bool)

(assert (= bs!5672 d!23606))

(assert (=> bs!5672 m!119217))

(declare-fun m!119243 () Bool)

(assert (=> bs!5672 m!119243))

(assert (=> b!74259 d!23606))

(declare-fun d!23608 () Bool)

(declare-fun e!48545 () Bool)

(assert (=> d!23608 e!48545))

(declare-fun res!61412 () Bool)

(assert (=> d!23608 (=> (not res!61412) (not e!48545))))

(declare-fun lt!119614 () (_ BitVec 64))

(declare-fun lt!119613 () (_ BitVec 64))

(declare-fun lt!119611 () (_ BitVec 64))

(assert (=> d!23608 (= res!61412 (= lt!119611 (bvsub lt!119613 lt!119614)))))

(assert (=> d!23608 (or (= (bvand lt!119613 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!119614 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!119613 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!119613 lt!119614) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23608 (= lt!119614 (remainingBits!0 ((_ sign_extend 32) (size!1410 (buf!1791 thiss!1379))) ((_ sign_extend 32) (currentByte!3529 thiss!1379)) ((_ sign_extend 32) (currentBit!3524 thiss!1379))))))

(declare-fun lt!119610 () (_ BitVec 64))

(declare-fun lt!119612 () (_ BitVec 64))

(assert (=> d!23608 (= lt!119613 (bvmul lt!119610 lt!119612))))

(assert (=> d!23608 (or (= lt!119610 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!119612 (bvsdiv (bvmul lt!119610 lt!119612) lt!119610)))))

(assert (=> d!23608 (= lt!119612 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23608 (= lt!119610 ((_ sign_extend 32) (size!1410 (buf!1791 thiss!1379))))))

(assert (=> d!23608 (= lt!119611 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3529 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3524 thiss!1379))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!23608 (invariant!0 (currentBit!3524 thiss!1379) (currentByte!3529 thiss!1379) (size!1410 (buf!1791 thiss!1379)))))

(assert (=> d!23608 (= (bitIndex!0 (size!1410 (buf!1791 thiss!1379)) (currentByte!3529 thiss!1379) (currentBit!3524 thiss!1379)) lt!119611)))

(declare-fun b!74292 () Bool)

(declare-fun res!61413 () Bool)

(assert (=> b!74292 (=> (not res!61413) (not e!48545))))

(assert (=> b!74292 (= res!61413 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!119611))))

(declare-fun b!74293 () Bool)

(declare-fun lt!119609 () (_ BitVec 64))

(assert (=> b!74293 (= e!48545 (bvsle lt!119611 (bvmul lt!119609 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!74293 (or (= lt!119609 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!119609 #b0000000000000000000000000000000000000000000000000000000000001000) lt!119609)))))

(assert (=> b!74293 (= lt!119609 ((_ sign_extend 32) (size!1410 (buf!1791 thiss!1379))))))

(assert (= (and d!23608 res!61412) b!74292))

(assert (= (and b!74292 res!61413) b!74293))

(assert (=> d!23608 m!119239))

(declare-fun m!119251 () Bool)

(assert (=> d!23608 m!119251))

(assert (=> b!74259 d!23608))

(declare-fun d!23622 () Bool)

(assert (=> d!23622 (= (array_inv!1256 srcBuffer!2) (bvsge (size!1410 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!14294 d!23622))

(declare-fun d!23624 () Bool)

(assert (=> d!23624 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3524 thiss!1379) (currentByte!3529 thiss!1379) (size!1410 (buf!1791 thiss!1379))))))

(declare-fun bs!5676 () Bool)

(assert (= bs!5676 d!23624))

(assert (=> bs!5676 m!119251))

(assert (=> start!14294 d!23624))

(check-sat (not d!23624) (not b!74276) (not d!23608) (not b!74278) (not d!23606) (not d!23600))
