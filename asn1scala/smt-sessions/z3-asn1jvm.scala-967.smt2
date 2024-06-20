; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27308 () Bool)

(assert start!27308)

(declare-fun b!140245 () Bool)

(declare-fun res!116923 () Bool)

(declare-fun e!93476 () Bool)

(assert (=> b!140245 (=> (not res!116923) (not e!93476))))

(declare-datatypes ((array!6401 0))(
  ( (array!6402 (arr!3604 (Array (_ BitVec 32) (_ BitVec 8))) (size!2897 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5052 0))(
  ( (BitStream!5053 (buf!3318 array!6401) (currentByte!6160 (_ BitVec 32)) (currentBit!6155 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5052)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140245 (= res!116923 (invariant!0 (currentBit!6155 thiss!1634) (currentByte!6160 thiss!1634) (size!2897 (buf!3318 thiss!1634))))))

(declare-fun b!140246 () Bool)

(declare-fun res!116925 () Bool)

(assert (=> b!140246 (=> (not res!116925) (not e!93476))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!140246 (= res!116925 (bvslt from!447 to!404))))

(declare-fun res!116924 () Bool)

(assert (=> start!27308 (=> (not res!116924) (not e!93476))))

(declare-fun arr!237 () array!6401)

(assert (=> start!27308 (= res!116924 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2897 arr!237))))))

(assert (=> start!27308 e!93476))

(assert (=> start!27308 true))

(declare-fun array_inv!2686 (array!6401) Bool)

(assert (=> start!27308 (array_inv!2686 arr!237)))

(declare-fun e!93477 () Bool)

(declare-fun inv!12 (BitStream!5052) Bool)

(assert (=> start!27308 (and (inv!12 thiss!1634) e!93477)))

(declare-fun b!140247 () Bool)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!140247 (= e!93476 (not (validate_offset_byte!0 ((_ sign_extend 32) (size!2897 (buf!3318 thiss!1634))) ((_ sign_extend 32) (currentByte!6160 thiss!1634)) ((_ sign_extend 32) (currentBit!6155 thiss!1634)))))))

(declare-fun b!140248 () Bool)

(declare-fun res!116926 () Bool)

(assert (=> b!140248 (=> (not res!116926) (not e!93476))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140248 (= res!116926 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2897 (buf!3318 thiss!1634))) ((_ sign_extend 32) (currentByte!6160 thiss!1634)) ((_ sign_extend 32) (currentBit!6155 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!140249 () Bool)

(assert (=> b!140249 (= e!93477 (array_inv!2686 (buf!3318 thiss!1634)))))

(assert (= (and start!27308 res!116924) b!140248))

(assert (= (and b!140248 res!116926) b!140246))

(assert (= (and b!140246 res!116925) b!140245))

(assert (= (and b!140245 res!116923) b!140247))

(assert (= start!27308 b!140249))

(declare-fun m!216035 () Bool)

(assert (=> b!140245 m!216035))

(declare-fun m!216037 () Bool)

(assert (=> b!140248 m!216037))

(declare-fun m!216039 () Bool)

(assert (=> start!27308 m!216039))

(declare-fun m!216041 () Bool)

(assert (=> start!27308 m!216041))

(declare-fun m!216043 () Bool)

(assert (=> b!140247 m!216043))

(declare-fun m!216045 () Bool)

(assert (=> b!140249 m!216045))

(check-sat (not b!140249) (not b!140245) (not b!140248) (not start!27308) (not b!140247))
(check-sat)
(get-model)

(declare-fun d!45262 () Bool)

(assert (=> d!45262 (= (invariant!0 (currentBit!6155 thiss!1634) (currentByte!6160 thiss!1634) (size!2897 (buf!3318 thiss!1634))) (and (bvsge (currentBit!6155 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6155 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6160 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6160 thiss!1634) (size!2897 (buf!3318 thiss!1634))) (and (= (currentBit!6155 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6160 thiss!1634) (size!2897 (buf!3318 thiss!1634)))))))))

(assert (=> b!140245 d!45262))

(declare-fun d!45270 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!45270 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!2897 (buf!3318 thiss!1634))) ((_ sign_extend 32) (currentByte!6160 thiss!1634)) ((_ sign_extend 32) (currentBit!6155 thiss!1634))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2897 (buf!3318 thiss!1634))) ((_ sign_extend 32) (currentByte!6160 thiss!1634)) ((_ sign_extend 32) (currentBit!6155 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!11099 () Bool)

(assert (= bs!11099 d!45270))

(declare-fun m!216061 () Bool)

(assert (=> bs!11099 m!216061))

(assert (=> b!140247 d!45270))

(declare-fun d!45274 () Bool)

(assert (=> d!45274 (= (array_inv!2686 arr!237) (bvsge (size!2897 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!27308 d!45274))

(declare-fun d!45276 () Bool)

(assert (=> d!45276 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6155 thiss!1634) (currentByte!6160 thiss!1634) (size!2897 (buf!3318 thiss!1634))))))

(declare-fun bs!11100 () Bool)

(assert (= bs!11100 d!45276))

(assert (=> bs!11100 m!216035))

(assert (=> start!27308 d!45276))

(declare-fun d!45280 () Bool)

(assert (=> d!45280 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2897 (buf!3318 thiss!1634))) ((_ sign_extend 32) (currentByte!6160 thiss!1634)) ((_ sign_extend 32) (currentBit!6155 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2897 (buf!3318 thiss!1634))) ((_ sign_extend 32) (currentByte!6160 thiss!1634)) ((_ sign_extend 32) (currentBit!6155 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11102 () Bool)

(assert (= bs!11102 d!45280))

(assert (=> bs!11102 m!216061))

(assert (=> b!140248 d!45280))

(declare-fun d!45284 () Bool)

(assert (=> d!45284 (= (array_inv!2686 (buf!3318 thiss!1634)) (bvsge (size!2897 (buf!3318 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!140249 d!45284))

(check-sat (not d!45280) (not d!45270) (not d!45276))
(check-sat)
