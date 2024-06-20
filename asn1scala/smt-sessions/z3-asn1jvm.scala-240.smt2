; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4746 () Bool)

(assert start!4746)

(declare-fun res!16462 () Bool)

(declare-fun e!12215 () Bool)

(assert (=> start!4746 (=> (not res!16462) (not e!12215))))

(declare-datatypes ((array!1319 0))(
  ( (array!1320 (arr!998 (Array (_ BitVec 32) (_ BitVec 8))) (size!557 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1319)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!4746 (= res!16462 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!557 srcBuffer!2))))))))

(assert (=> start!4746 e!12215))

(assert (=> start!4746 true))

(declare-fun array_inv!527 (array!1319) Bool)

(assert (=> start!4746 (array_inv!527 srcBuffer!2)))

(declare-datatypes ((BitStream!948 0))(
  ( (BitStream!949 (buf!857 array!1319) (currentByte!2126 (_ BitVec 32)) (currentBit!2121 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!948)

(declare-fun e!12214 () Bool)

(declare-fun inv!12 (BitStream!948) Bool)

(assert (=> start!4746 (and (inv!12 thiss!1379) e!12214)))

(declare-fun b!18804 () Bool)

(declare-fun res!16463 () Bool)

(assert (=> b!18804 (=> (not res!16463) (not e!12215))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18804 (= res!16463 (validate_offset_bits!1 ((_ sign_extend 32) (size!557 (buf!857 thiss!1379))) ((_ sign_extend 32) (currentByte!2126 thiss!1379)) ((_ sign_extend 32) (currentBit!2121 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!18805 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!18805 (= e!12215 (not (invariant!0 (currentBit!2121 thiss!1379) (currentByte!2126 thiss!1379) (size!557 (buf!857 thiss!1379)))))))

(declare-fun b!18806 () Bool)

(assert (=> b!18806 (= e!12214 (array_inv!527 (buf!857 thiss!1379)))))

(assert (= (and start!4746 res!16462) b!18804))

(assert (= (and b!18804 res!16463) b!18805))

(assert (= start!4746 b!18806))

(declare-fun m!25259 () Bool)

(assert (=> start!4746 m!25259))

(declare-fun m!25261 () Bool)

(assert (=> start!4746 m!25261))

(declare-fun m!25263 () Bool)

(assert (=> b!18804 m!25263))

(declare-fun m!25265 () Bool)

(assert (=> b!18805 m!25265))

(declare-fun m!25267 () Bool)

(assert (=> b!18806 m!25267))

(check-sat (not b!18806) (not start!4746) (not b!18805) (not b!18804))
(check-sat)
(get-model)

(declare-fun d!6244 () Bool)

(assert (=> d!6244 (= (array_inv!527 (buf!857 thiss!1379)) (bvsge (size!557 (buf!857 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!18806 d!6244))

(declare-fun d!6246 () Bool)

(assert (=> d!6246 (= (array_inv!527 srcBuffer!2) (bvsge (size!557 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!4746 d!6246))

(declare-fun d!6248 () Bool)

(assert (=> d!6248 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2121 thiss!1379) (currentByte!2126 thiss!1379) (size!557 (buf!857 thiss!1379))))))

(declare-fun bs!1803 () Bool)

(assert (= bs!1803 d!6248))

(assert (=> bs!1803 m!25265))

(assert (=> start!4746 d!6248))

(declare-fun d!6250 () Bool)

(assert (=> d!6250 (= (invariant!0 (currentBit!2121 thiss!1379) (currentByte!2126 thiss!1379) (size!557 (buf!857 thiss!1379))) (and (bvsge (currentBit!2121 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!2121 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!2126 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!2126 thiss!1379) (size!557 (buf!857 thiss!1379))) (and (= (currentBit!2121 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!2126 thiss!1379) (size!557 (buf!857 thiss!1379)))))))))

(assert (=> b!18805 d!6250))

(declare-fun d!6252 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!6252 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!557 (buf!857 thiss!1379))) ((_ sign_extend 32) (currentByte!2126 thiss!1379)) ((_ sign_extend 32) (currentBit!2121 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!557 (buf!857 thiss!1379))) ((_ sign_extend 32) (currentByte!2126 thiss!1379)) ((_ sign_extend 32) (currentBit!2121 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!1804 () Bool)

(assert (= bs!1804 d!6252))

(declare-fun m!25279 () Bool)

(assert (=> bs!1804 m!25279))

(assert (=> b!18804 d!6252))

(check-sat (not d!6252) (not d!6248))
(check-sat)
