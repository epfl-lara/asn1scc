; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17634 () Bool)

(assert start!17634)

(declare-fun b!85055 () Bool)

(declare-fun res!69790 () Bool)

(declare-fun e!56703 () Bool)

(assert (=> b!85055 (=> (not res!69790) (not e!56703))))

(declare-datatypes ((array!4037 0))(
  ( (array!4038 (arr!2461 (Array (_ BitVec 32) (_ BitVec 8))) (size!1824 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3210 0))(
  ( (BitStream!3211 (buf!2214 array!4037) (currentByte!4402 (_ BitVec 32)) (currentBit!4397 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3210)

(declare-fun thiss!1151 () BitStream!3210)

(declare-fun i!576 () (_ BitVec 32))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!85055 (= res!69790 (= (bitIndex!0 (size!1824 (buf!2214 thiss!1152)) (currentByte!4402 thiss!1152) (currentBit!4397 thiss!1152)) (bvadd (bitIndex!0 (size!1824 (buf!2214 thiss!1151)) (currentByte!4402 thiss!1151) (currentBit!4397 thiss!1151)) ((_ sign_extend 32) i!576))))))

(declare-fun b!85056 () Bool)

(assert (=> b!85056 (= e!56703 (and (bvsle ((_ sign_extend 32) (size!1824 (buf!2214 thiss!1152))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4402 thiss!1152)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4397 thiss!1152)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!1824 (buf!2214 thiss!1152))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4402 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4397 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!85057 () Bool)

(declare-fun res!69789 () Bool)

(assert (=> b!85057 (=> (not res!69789) (not e!56703))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!85057 (= res!69789 (invariant!0 (currentBit!4397 thiss!1152) (currentByte!4402 thiss!1152) (size!1824 (buf!2214 thiss!1152))))))

(declare-fun b!85058 () Bool)

(declare-fun res!69786 () Bool)

(assert (=> b!85058 (=> (not res!69786) (not e!56703))))

(assert (=> b!85058 (= res!69786 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!85059 () Bool)

(declare-fun res!69784 () Bool)

(assert (=> b!85059 (=> (not res!69784) (not e!56703))))

(assert (=> b!85059 (= res!69784 (invariant!0 (currentBit!4397 thiss!1151) (currentByte!4402 thiss!1151) (size!1824 (buf!2214 thiss!1151))))))

(declare-fun b!85060 () Bool)

(declare-fun res!69788 () Bool)

(assert (=> b!85060 (=> (not res!69788) (not e!56703))))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!85060 (= res!69788 (and (bvsle i!576 nBits!336) (= (size!1824 (buf!2214 thiss!1152)) (size!1824 (buf!2214 thiss!1151)))))))

(declare-fun res!69787 () Bool)

(assert (=> start!17634 (=> (not res!69787) (not e!56703))))

(assert (=> start!17634 (= res!69787 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17634 e!56703))

(assert (=> start!17634 true))

(declare-fun e!56699 () Bool)

(declare-fun inv!12 (BitStream!3210) Bool)

(assert (=> start!17634 (and (inv!12 thiss!1151) e!56699)))

(declare-fun e!56701 () Bool)

(assert (=> start!17634 (and (inv!12 thiss!1152) e!56701)))

(declare-fun b!85061 () Bool)

(declare-fun array_inv!1670 (array!4037) Bool)

(assert (=> b!85061 (= e!56699 (array_inv!1670 (buf!2214 thiss!1151)))))

(declare-fun b!85062 () Bool)

(assert (=> b!85062 (= e!56701 (array_inv!1670 (buf!2214 thiss!1152)))))

(declare-fun b!85063 () Bool)

(declare-fun res!69785 () Bool)

(assert (=> b!85063 (=> (not res!69785) (not e!56703))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!85063 (= res!69785 (validate_offset_bits!1 ((_ sign_extend 32) (size!1824 (buf!2214 thiss!1151))) ((_ sign_extend 32) (currentByte!4402 thiss!1151)) ((_ sign_extend 32) (currentBit!4397 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(assert (= (and start!17634 res!69787) b!85063))

(assert (= (and b!85063 res!69785) b!85059))

(assert (= (and b!85059 res!69784) b!85058))

(assert (= (and b!85058 res!69786) b!85057))

(assert (= (and b!85057 res!69789) b!85060))

(assert (= (and b!85060 res!69788) b!85055))

(assert (= (and b!85055 res!69790) b!85056))

(assert (= start!17634 b!85061))

(assert (= start!17634 b!85062))

(declare-fun m!131357 () Bool)

(assert (=> start!17634 m!131357))

(declare-fun m!131359 () Bool)

(assert (=> start!17634 m!131359))

(declare-fun m!131361 () Bool)

(assert (=> b!85055 m!131361))

(declare-fun m!131363 () Bool)

(assert (=> b!85055 m!131363))

(declare-fun m!131365 () Bool)

(assert (=> b!85059 m!131365))

(declare-fun m!131367 () Bool)

(assert (=> b!85063 m!131367))

(declare-fun m!131369 () Bool)

(assert (=> b!85062 m!131369))

(declare-fun m!131371 () Bool)

(assert (=> b!85057 m!131371))

(declare-fun m!131373 () Bool)

(assert (=> b!85061 m!131373))

(check-sat (not b!85055) (not b!85059) (not b!85062) (not b!85061) (not start!17634) (not b!85063) (not b!85057))
(check-sat)
(get-model)

(declare-fun d!27254 () Bool)

(assert (=> d!27254 (= (invariant!0 (currentBit!4397 thiss!1151) (currentByte!4402 thiss!1151) (size!1824 (buf!2214 thiss!1151))) (and (bvsge (currentBit!4397 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4397 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4402 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4402 thiss!1151) (size!1824 (buf!2214 thiss!1151))) (and (= (currentBit!4397 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4402 thiss!1151) (size!1824 (buf!2214 thiss!1151)))))))))

(assert (=> b!85059 d!27254))

(declare-fun d!27256 () Bool)

(assert (=> d!27256 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4397 thiss!1151) (currentByte!4402 thiss!1151) (size!1824 (buf!2214 thiss!1151))))))

(declare-fun bs!6749 () Bool)

(assert (= bs!6749 d!27256))

(assert (=> bs!6749 m!131365))

(assert (=> start!17634 d!27256))

(declare-fun d!27258 () Bool)

(assert (=> d!27258 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4397 thiss!1152) (currentByte!4402 thiss!1152) (size!1824 (buf!2214 thiss!1152))))))

(declare-fun bs!6750 () Bool)

(assert (= bs!6750 d!27258))

(assert (=> bs!6750 m!131371))

(assert (=> start!17634 d!27258))

(declare-fun d!27260 () Bool)

(declare-fun e!56727 () Bool)

(assert (=> d!27260 e!56727))

(declare-fun res!69829 () Bool)

(assert (=> d!27260 (=> (not res!69829) (not e!56727))))

(declare-fun lt!134607 () (_ BitVec 64))

(declare-fun lt!134608 () (_ BitVec 64))

(declare-fun lt!134605 () (_ BitVec 64))

(assert (=> d!27260 (= res!69829 (= lt!134607 (bvsub lt!134608 lt!134605)))))

(assert (=> d!27260 (or (= (bvand lt!134608 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134605 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134608 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134608 lt!134605) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27260 (= lt!134605 (remainingBits!0 ((_ sign_extend 32) (size!1824 (buf!2214 thiss!1152))) ((_ sign_extend 32) (currentByte!4402 thiss!1152)) ((_ sign_extend 32) (currentBit!4397 thiss!1152))))))

(declare-fun lt!134606 () (_ BitVec 64))

(declare-fun lt!134609 () (_ BitVec 64))

(assert (=> d!27260 (= lt!134608 (bvmul lt!134606 lt!134609))))

(assert (=> d!27260 (or (= lt!134606 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134609 (bvsdiv (bvmul lt!134606 lt!134609) lt!134606)))))

(assert (=> d!27260 (= lt!134609 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27260 (= lt!134606 ((_ sign_extend 32) (size!1824 (buf!2214 thiss!1152))))))

(assert (=> d!27260 (= lt!134607 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4402 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4397 thiss!1152))))))

(assert (=> d!27260 (invariant!0 (currentBit!4397 thiss!1152) (currentByte!4402 thiss!1152) (size!1824 (buf!2214 thiss!1152)))))

(assert (=> d!27260 (= (bitIndex!0 (size!1824 (buf!2214 thiss!1152)) (currentByte!4402 thiss!1152) (currentBit!4397 thiss!1152)) lt!134607)))

(declare-fun b!85107 () Bool)

(declare-fun res!69828 () Bool)

(assert (=> b!85107 (=> (not res!69828) (not e!56727))))

(assert (=> b!85107 (= res!69828 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134607))))

(declare-fun b!85108 () Bool)

(declare-fun lt!134610 () (_ BitVec 64))

(assert (=> b!85108 (= e!56727 (bvsle lt!134607 (bvmul lt!134610 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!85108 (or (= lt!134610 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134610 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134610)))))

(assert (=> b!85108 (= lt!134610 ((_ sign_extend 32) (size!1824 (buf!2214 thiss!1152))))))

(assert (= (and d!27260 res!69829) b!85107))

(assert (= (and b!85107 res!69828) b!85108))

(declare-fun m!131397 () Bool)

(assert (=> d!27260 m!131397))

(assert (=> d!27260 m!131371))

(assert (=> b!85055 d!27260))

(declare-fun d!27276 () Bool)

(declare-fun e!56728 () Bool)

(assert (=> d!27276 e!56728))

(declare-fun res!69831 () Bool)

(assert (=> d!27276 (=> (not res!69831) (not e!56728))))

(declare-fun lt!134611 () (_ BitVec 64))

(declare-fun lt!134614 () (_ BitVec 64))

(declare-fun lt!134613 () (_ BitVec 64))

(assert (=> d!27276 (= res!69831 (= lt!134613 (bvsub lt!134614 lt!134611)))))

(assert (=> d!27276 (or (= (bvand lt!134614 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134611 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134614 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134614 lt!134611) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27276 (= lt!134611 (remainingBits!0 ((_ sign_extend 32) (size!1824 (buf!2214 thiss!1151))) ((_ sign_extend 32) (currentByte!4402 thiss!1151)) ((_ sign_extend 32) (currentBit!4397 thiss!1151))))))

(declare-fun lt!134612 () (_ BitVec 64))

(declare-fun lt!134615 () (_ BitVec 64))

(assert (=> d!27276 (= lt!134614 (bvmul lt!134612 lt!134615))))

(assert (=> d!27276 (or (= lt!134612 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134615 (bvsdiv (bvmul lt!134612 lt!134615) lt!134612)))))

(assert (=> d!27276 (= lt!134615 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27276 (= lt!134612 ((_ sign_extend 32) (size!1824 (buf!2214 thiss!1151))))))

(assert (=> d!27276 (= lt!134613 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4402 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4397 thiss!1151))))))

(assert (=> d!27276 (invariant!0 (currentBit!4397 thiss!1151) (currentByte!4402 thiss!1151) (size!1824 (buf!2214 thiss!1151)))))

(assert (=> d!27276 (= (bitIndex!0 (size!1824 (buf!2214 thiss!1151)) (currentByte!4402 thiss!1151) (currentBit!4397 thiss!1151)) lt!134613)))

(declare-fun b!85109 () Bool)

(declare-fun res!69830 () Bool)

(assert (=> b!85109 (=> (not res!69830) (not e!56728))))

(assert (=> b!85109 (= res!69830 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134613))))

(declare-fun b!85110 () Bool)

(declare-fun lt!134616 () (_ BitVec 64))

(assert (=> b!85110 (= e!56728 (bvsle lt!134613 (bvmul lt!134616 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!85110 (or (= lt!134616 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134616 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134616)))))

(assert (=> b!85110 (= lt!134616 ((_ sign_extend 32) (size!1824 (buf!2214 thiss!1151))))))

(assert (= (and d!27276 res!69831) b!85109))

(assert (= (and b!85109 res!69830) b!85110))

(declare-fun m!131399 () Bool)

(assert (=> d!27276 m!131399))

(assert (=> d!27276 m!131365))

(assert (=> b!85055 d!27276))

(declare-fun d!27280 () Bool)

(assert (=> d!27280 (= (array_inv!1670 (buf!2214 thiss!1151)) (bvsge (size!1824 (buf!2214 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!85061 d!27280))

(declare-fun d!27288 () Bool)

(assert (=> d!27288 (= (invariant!0 (currentBit!4397 thiss!1152) (currentByte!4402 thiss!1152) (size!1824 (buf!2214 thiss!1152))) (and (bvsge (currentBit!4397 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4397 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4402 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4402 thiss!1152) (size!1824 (buf!2214 thiss!1152))) (and (= (currentBit!4397 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4402 thiss!1152) (size!1824 (buf!2214 thiss!1152)))))))))

(assert (=> b!85057 d!27288))

(declare-fun d!27290 () Bool)

(assert (=> d!27290 (= (array_inv!1670 (buf!2214 thiss!1152)) (bvsge (size!1824 (buf!2214 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!85062 d!27290))

(declare-fun d!27292 () Bool)

(assert (=> d!27292 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1824 (buf!2214 thiss!1151))) ((_ sign_extend 32) (currentByte!4402 thiss!1151)) ((_ sign_extend 32) (currentBit!4397 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1824 (buf!2214 thiss!1151))) ((_ sign_extend 32) (currentByte!4402 thiss!1151)) ((_ sign_extend 32) (currentBit!4397 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6755 () Bool)

(assert (= bs!6755 d!27292))

(assert (=> bs!6755 m!131399))

(assert (=> b!85063 d!27292))

(check-sat (not d!27292) (not d!27256) (not d!27276) (not d!27258) (not d!27260))
