; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10306 () Bool)

(assert start!10306)

(declare-fun b!52024 () Bool)

(declare-fun res!43478 () Bool)

(declare-fun e!34327 () Bool)

(assert (=> b!52024 (=> (not res!43478) (not e!34327))))

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((array!2370 0))(
  ( (array!2371 (arr!1617 (Array (_ BitVec 32) (_ BitVec 8))) (size!1081 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1866 0))(
  ( (BitStream!1867 (buf!1437 array!2370) (currentByte!2972 (_ BitVec 32)) (currentBit!2967 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1866)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52024 (= res!43478 (validate_offset_bits!1 ((_ sign_extend 32) (size!1081 (buf!1437 thiss!1379))) ((_ sign_extend 32) (currentByte!2972 thiss!1379)) ((_ sign_extend 32) (currentBit!2967 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52027 () Bool)

(declare-fun e!34328 () Bool)

(declare-fun array_inv!986 (array!2370) Bool)

(assert (=> b!52027 (= e!34328 (array_inv!986 (buf!1437 thiss!1379)))))

(declare-fun res!43479 () Bool)

(assert (=> start!10306 (=> (not res!43479) (not e!34327))))

(declare-fun srcBuffer!2 () array!2370)

(assert (=> start!10306 (= res!43479 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1081 srcBuffer!2))))))))

(assert (=> start!10306 e!34327))

(assert (=> start!10306 true))

(assert (=> start!10306 (array_inv!986 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1866) Bool)

(assert (=> start!10306 (and (inv!12 thiss!1379) e!34328)))

(declare-fun b!52026 () Bool)

(declare-fun e!34326 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!52026 (= e!34326 (invariant!0 (currentBit!2967 thiss!1379) (currentByte!2972 thiss!1379) (size!1081 (buf!1437 thiss!1379))))))

(declare-fun b!52025 () Bool)

(assert (=> b!52025 (= e!34327 (not e!34326))))

(declare-fun res!43477 () Bool)

(assert (=> b!52025 (=> res!43477 e!34326)))

(declare-fun lt!81141 () (_ BitVec 64))

(assert (=> b!52025 (= res!43477 (not (= lt!81141 (bvsub (bvadd lt!81141 to!314) i!635))))))

(declare-fun isPrefixOf!0 (BitStream!1866 BitStream!1866) Bool)

(assert (=> b!52025 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3584 0))(
  ( (Unit!3585) )
))
(declare-fun lt!81142 () Unit!3584)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1866) Unit!3584)

(assert (=> b!52025 (= lt!81142 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52025 (= lt!81141 (bitIndex!0 (size!1081 (buf!1437 thiss!1379)) (currentByte!2972 thiss!1379) (currentBit!2967 thiss!1379)))))

(assert (= (and start!10306 res!43479) b!52024))

(assert (= (and b!52024 res!43478) b!52025))

(assert (= (and b!52025 (not res!43477)) b!52026))

(assert (= start!10306 b!52027))

(declare-fun m!82213 () Bool)

(assert (=> start!10306 m!82213))

(declare-fun m!82215 () Bool)

(assert (=> start!10306 m!82215))

(declare-fun m!82217 () Bool)

(assert (=> b!52026 m!82217))

(declare-fun m!82219 () Bool)

(assert (=> b!52027 m!82219))

(declare-fun m!82221 () Bool)

(assert (=> b!52024 m!82221))

(declare-fun m!82223 () Bool)

(assert (=> b!52025 m!82223))

(declare-fun m!82225 () Bool)

(assert (=> b!52025 m!82225))

(declare-fun m!82227 () Bool)

(assert (=> b!52025 m!82227))

(check-sat (not b!52026) (not b!52025) (not b!52024) (not start!10306) (not b!52027))
(check-sat)
(get-model)

(declare-fun d!16556 () Bool)

(assert (=> d!16556 (= (invariant!0 (currentBit!2967 thiss!1379) (currentByte!2972 thiss!1379) (size!1081 (buf!1437 thiss!1379))) (and (bvsge (currentBit!2967 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!2967 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!2972 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!2972 thiss!1379) (size!1081 (buf!1437 thiss!1379))) (and (= (currentBit!2967 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!2972 thiss!1379) (size!1081 (buf!1437 thiss!1379)))))))))

(assert (=> b!52026 d!16556))

(declare-fun d!16558 () Bool)

(declare-fun res!43497 () Bool)

(declare-fun e!34349 () Bool)

(assert (=> d!16558 (=> (not res!43497) (not e!34349))))

(assert (=> d!16558 (= res!43497 (= (size!1081 (buf!1437 thiss!1379)) (size!1081 (buf!1437 thiss!1379))))))

(assert (=> d!16558 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!34349)))

(declare-fun b!52046 () Bool)

(declare-fun res!43495 () Bool)

(assert (=> b!52046 (=> (not res!43495) (not e!34349))))

(assert (=> b!52046 (= res!43495 (bvsle (bitIndex!0 (size!1081 (buf!1437 thiss!1379)) (currentByte!2972 thiss!1379) (currentBit!2967 thiss!1379)) (bitIndex!0 (size!1081 (buf!1437 thiss!1379)) (currentByte!2972 thiss!1379) (currentBit!2967 thiss!1379))))))

(declare-fun b!52047 () Bool)

(declare-fun e!34348 () Bool)

(assert (=> b!52047 (= e!34349 e!34348)))

(declare-fun res!43496 () Bool)

(assert (=> b!52047 (=> res!43496 e!34348)))

(assert (=> b!52047 (= res!43496 (= (size!1081 (buf!1437 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!52048 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2370 array!2370 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52048 (= e!34348 (arrayBitRangesEq!0 (buf!1437 thiss!1379) (buf!1437 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1081 (buf!1437 thiss!1379)) (currentByte!2972 thiss!1379) (currentBit!2967 thiss!1379))))))

(assert (= (and d!16558 res!43497) b!52046))

(assert (= (and b!52046 res!43495) b!52047))

(assert (= (and b!52047 (not res!43496)) b!52048))

(assert (=> b!52046 m!82227))

(assert (=> b!52046 m!82227))

(assert (=> b!52048 m!82227))

(assert (=> b!52048 m!82227))

(declare-fun m!82245 () Bool)

(assert (=> b!52048 m!82245))

(assert (=> b!52025 d!16558))

(declare-fun d!16560 () Bool)

(assert (=> d!16560 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!81151 () Unit!3584)

(declare-fun choose!11 (BitStream!1866) Unit!3584)

(assert (=> d!16560 (= lt!81151 (choose!11 thiss!1379))))

(assert (=> d!16560 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!81151)))

(declare-fun bs!4145 () Bool)

(assert (= bs!4145 d!16560))

(assert (=> bs!4145 m!82223))

(declare-fun m!82247 () Bool)

(assert (=> bs!4145 m!82247))

(assert (=> b!52025 d!16560))

(declare-fun d!16562 () Bool)

(declare-fun e!34352 () Bool)

(assert (=> d!16562 e!34352))

(declare-fun res!43502 () Bool)

(assert (=> d!16562 (=> (not res!43502) (not e!34352))))

(declare-fun lt!81164 () (_ BitVec 64))

(declare-fun lt!81166 () (_ BitVec 64))

(declare-fun lt!81169 () (_ BitVec 64))

(assert (=> d!16562 (= res!43502 (= lt!81164 (bvsub lt!81169 lt!81166)))))

(assert (=> d!16562 (or (= (bvand lt!81169 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!81166 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!81169 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!81169 lt!81166) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!16562 (= lt!81166 (remainingBits!0 ((_ sign_extend 32) (size!1081 (buf!1437 thiss!1379))) ((_ sign_extend 32) (currentByte!2972 thiss!1379)) ((_ sign_extend 32) (currentBit!2967 thiss!1379))))))

(declare-fun lt!81167 () (_ BitVec 64))

(declare-fun lt!81165 () (_ BitVec 64))

(assert (=> d!16562 (= lt!81169 (bvmul lt!81167 lt!81165))))

(assert (=> d!16562 (or (= lt!81167 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!81165 (bvsdiv (bvmul lt!81167 lt!81165) lt!81167)))))

(assert (=> d!16562 (= lt!81165 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16562 (= lt!81167 ((_ sign_extend 32) (size!1081 (buf!1437 thiss!1379))))))

(assert (=> d!16562 (= lt!81164 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2972 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2967 thiss!1379))))))

(assert (=> d!16562 (invariant!0 (currentBit!2967 thiss!1379) (currentByte!2972 thiss!1379) (size!1081 (buf!1437 thiss!1379)))))

(assert (=> d!16562 (= (bitIndex!0 (size!1081 (buf!1437 thiss!1379)) (currentByte!2972 thiss!1379) (currentBit!2967 thiss!1379)) lt!81164)))

(declare-fun b!52053 () Bool)

(declare-fun res!43503 () Bool)

(assert (=> b!52053 (=> (not res!43503) (not e!34352))))

(assert (=> b!52053 (= res!43503 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!81164))))

(declare-fun b!52054 () Bool)

(declare-fun lt!81168 () (_ BitVec 64))

(assert (=> b!52054 (= e!34352 (bvsle lt!81164 (bvmul lt!81168 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!52054 (or (= lt!81168 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!81168 #b0000000000000000000000000000000000000000000000000000000000001000) lt!81168)))))

(assert (=> b!52054 (= lt!81168 ((_ sign_extend 32) (size!1081 (buf!1437 thiss!1379))))))

(assert (= (and d!16562 res!43502) b!52053))

(assert (= (and b!52053 res!43503) b!52054))

(declare-fun m!82249 () Bool)

(assert (=> d!16562 m!82249))

(assert (=> d!16562 m!82217))

(assert (=> b!52025 d!16562))

(declare-fun d!16574 () Bool)

(assert (=> d!16574 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1081 (buf!1437 thiss!1379))) ((_ sign_extend 32) (currentByte!2972 thiss!1379)) ((_ sign_extend 32) (currentBit!2967 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1081 (buf!1437 thiss!1379))) ((_ sign_extend 32) (currentByte!2972 thiss!1379)) ((_ sign_extend 32) (currentBit!2967 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4147 () Bool)

(assert (= bs!4147 d!16574))

(assert (=> bs!4147 m!82249))

(assert (=> b!52024 d!16574))

(declare-fun d!16576 () Bool)

(assert (=> d!16576 (= (array_inv!986 srcBuffer!2) (bvsge (size!1081 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!10306 d!16576))

(declare-fun d!16578 () Bool)

(assert (=> d!16578 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2967 thiss!1379) (currentByte!2972 thiss!1379) (size!1081 (buf!1437 thiss!1379))))))

(declare-fun bs!4148 () Bool)

(assert (= bs!4148 d!16578))

(assert (=> bs!4148 m!82217))

(assert (=> start!10306 d!16578))

(declare-fun d!16580 () Bool)

(assert (=> d!16580 (= (array_inv!986 (buf!1437 thiss!1379)) (bvsge (size!1081 (buf!1437 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!52027 d!16580))

(check-sat (not d!16578) (not b!52046) (not d!16562) (not d!16560) (not d!16574) (not b!52048))
