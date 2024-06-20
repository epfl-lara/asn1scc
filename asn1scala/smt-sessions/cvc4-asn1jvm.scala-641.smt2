; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18002 () Bool)

(assert start!18002)

(declare-fun lt!136220 () (_ BitVec 64))

(declare-fun e!58578 () Bool)

(declare-fun i!576 () (_ BitVec 32))

(declare-fun b!88518 () Bool)

(declare-fun lt!136221 () (_ BitVec 64))

(assert (=> b!88518 (= e!58578 (and (= lt!136221 (bvand ((_ sign_extend 32) i!576) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!136221 (bvand (bvadd lt!136220 ((_ sign_extend 32) i!576)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!88518 (= lt!136221 (bvand lt!136220 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!4168 0))(
  ( (array!4169 (arr!2519 (Array (_ BitVec 32) (_ BitVec 8))) (size!1882 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3326 0))(
  ( (BitStream!3327 (buf!2272 array!4168) (currentByte!4505 (_ BitVec 32)) (currentBit!4500 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3326)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!88518 (= lt!136220 (bitIndex!0 (size!1882 (buf!2272 thiss!1151)) (currentByte!4505 thiss!1151) (currentBit!4500 thiss!1151)))))

(declare-fun b!88519 () Bool)

(declare-fun res!72884 () Bool)

(assert (=> b!88519 (=> (not res!72884) (not e!58578))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!88519 (= res!72884 (invariant!0 (currentBit!4500 thiss!1151) (currentByte!4505 thiss!1151) (size!1882 (buf!2272 thiss!1151))))))

(declare-fun b!88520 () Bool)

(declare-fun res!72882 () Bool)

(assert (=> b!88520 (=> (not res!72882) (not e!58578))))

(assert (=> b!88520 (= res!72882 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!88521 () Bool)

(declare-fun res!72881 () Bool)

(assert (=> b!88521 (=> (not res!72881) (not e!58578))))

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88521 (= res!72881 (validate_offset_bits!1 ((_ sign_extend 32) (size!1882 (buf!2272 thiss!1151))) ((_ sign_extend 32) (currentByte!4505 thiss!1151)) ((_ sign_extend 32) (currentBit!4500 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!88522 () Bool)

(declare-fun e!58577 () Bool)

(declare-fun thiss!1152 () BitStream!3326)

(declare-fun array_inv!1728 (array!4168) Bool)

(assert (=> b!88522 (= e!58577 (array_inv!1728 (buf!2272 thiss!1152)))))

(declare-fun b!88523 () Bool)

(declare-fun res!72886 () Bool)

(assert (=> b!88523 (=> (not res!72886) (not e!58578))))

(assert (=> b!88523 (= res!72886 (and (bvsle i!576 nBits!336) (= (size!1882 (buf!2272 thiss!1152)) (size!1882 (buf!2272 thiss!1151)))))))

(declare-fun b!88524 () Bool)

(declare-fun res!72883 () Bool)

(assert (=> b!88524 (=> (not res!72883) (not e!58578))))

(assert (=> b!88524 (= res!72883 (invariant!0 (currentBit!4500 thiss!1152) (currentByte!4505 thiss!1152) (size!1882 (buf!2272 thiss!1152))))))

(declare-fun b!88525 () Bool)

(declare-fun e!58576 () Bool)

(assert (=> b!88525 (= e!58576 (array_inv!1728 (buf!2272 thiss!1151)))))

(declare-fun res!72885 () Bool)

(assert (=> start!18002 (=> (not res!72885) (not e!58578))))

(assert (=> start!18002 (= res!72885 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18002 e!58578))

(assert (=> start!18002 true))

(declare-fun inv!12 (BitStream!3326) Bool)

(assert (=> start!18002 (and (inv!12 thiss!1151) e!58576)))

(assert (=> start!18002 (and (inv!12 thiss!1152) e!58577)))

(assert (= (and start!18002 res!72885) b!88521))

(assert (= (and b!88521 res!72881) b!88519))

(assert (= (and b!88519 res!72884) b!88520))

(assert (= (and b!88520 res!72882) b!88524))

(assert (= (and b!88524 res!72883) b!88523))

(assert (= (and b!88523 res!72886) b!88518))

(assert (= start!18002 b!88525))

(assert (= start!18002 b!88522))

(declare-fun m!133669 () Bool)

(assert (=> b!88525 m!133669))

(declare-fun m!133671 () Bool)

(assert (=> b!88521 m!133671))

(declare-fun m!133673 () Bool)

(assert (=> b!88518 m!133673))

(declare-fun m!133675 () Bool)

(assert (=> b!88524 m!133675))

(declare-fun m!133677 () Bool)

(assert (=> b!88522 m!133677))

(declare-fun m!133679 () Bool)

(assert (=> start!18002 m!133679))

(declare-fun m!133681 () Bool)

(assert (=> start!18002 m!133681))

(declare-fun m!133683 () Bool)

(assert (=> b!88519 m!133683))

(push 1)

(assert (not b!88525))

(assert (not b!88524))

(assert (not b!88518))

(assert (not b!88519))

(assert (not b!88521))

(assert (not b!88522))

(assert (not start!18002))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27788 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27788 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1882 (buf!2272 thiss!1151))) ((_ sign_extend 32) (currentByte!4505 thiss!1151)) ((_ sign_extend 32) (currentBit!4500 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1882 (buf!2272 thiss!1151))) ((_ sign_extend 32) (currentByte!4505 thiss!1151)) ((_ sign_extend 32) (currentBit!4500 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6878 () Bool)

(assert (= bs!6878 d!27788))

(declare-fun m!133685 () Bool)

(assert (=> bs!6878 m!133685))

(assert (=> b!88521 d!27788))

(declare-fun d!27790 () Bool)

(assert (=> d!27790 (= (array_inv!1728 (buf!2272 thiss!1152)) (bvsge (size!1882 (buf!2272 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!88522 d!27790))

(declare-fun d!27792 () Bool)

(declare-fun e!58587 () Bool)

(assert (=> d!27792 e!58587))

(declare-fun res!72903 () Bool)

(assert (=> d!27792 (=> (not res!72903) (not e!58587))))

(declare-fun lt!136270 () (_ BitVec 64))

(declare-fun lt!136273 () (_ BitVec 64))

(declare-fun lt!136274 () (_ BitVec 64))

(assert (=> d!27792 (= res!72903 (= lt!136270 (bvsub lt!136274 lt!136273)))))

(assert (=> d!27792 (or (= (bvand lt!136274 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136273 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136274 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136274 lt!136273) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27792 (= lt!136273 (remainingBits!0 ((_ sign_extend 32) (size!1882 (buf!2272 thiss!1151))) ((_ sign_extend 32) (currentByte!4505 thiss!1151)) ((_ sign_extend 32) (currentBit!4500 thiss!1151))))))

(declare-fun lt!136272 () (_ BitVec 64))

(declare-fun lt!136275 () (_ BitVec 64))

(assert (=> d!27792 (= lt!136274 (bvmul lt!136272 lt!136275))))

(assert (=> d!27792 (or (= lt!136272 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136275 (bvsdiv (bvmul lt!136272 lt!136275) lt!136272)))))

(assert (=> d!27792 (= lt!136275 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27792 (= lt!136272 ((_ sign_extend 32) (size!1882 (buf!2272 thiss!1151))))))

(assert (=> d!27792 (= lt!136270 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4505 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4500 thiss!1151))))))

(assert (=> d!27792 (invariant!0 (currentBit!4500 thiss!1151) (currentByte!4505 thiss!1151) (size!1882 (buf!2272 thiss!1151)))))

(assert (=> d!27792 (= (bitIndex!0 (size!1882 (buf!2272 thiss!1151)) (currentByte!4505 thiss!1151) (currentBit!4500 thiss!1151)) lt!136270)))

(declare-fun b!88542 () Bool)

(declare-fun res!72904 () Bool)

(assert (=> b!88542 (=> (not res!72904) (not e!58587))))

(assert (=> b!88542 (= res!72904 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136270))))

(declare-fun b!88543 () Bool)

(declare-fun lt!136271 () (_ BitVec 64))

(assert (=> b!88543 (= e!58587 (bvsle lt!136270 (bvmul lt!136271 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!88543 (or (= lt!136271 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136271 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136271)))))

(assert (=> b!88543 (= lt!136271 ((_ sign_extend 32) (size!1882 (buf!2272 thiss!1151))))))

(assert (= (and d!27792 res!72903) b!88542))

(assert (= (and b!88542 res!72904) b!88543))

(assert (=> d!27792 m!133685))

(assert (=> d!27792 m!133683))

(assert (=> b!88518 d!27792))

(declare-fun d!27816 () Bool)

(assert (=> d!27816 (= (invariant!0 (currentBit!4500 thiss!1152) (currentByte!4505 thiss!1152) (size!1882 (buf!2272 thiss!1152))) (and (bvsge (currentBit!4500 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4500 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4505 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4505 thiss!1152) (size!1882 (buf!2272 thiss!1152))) (and (= (currentBit!4500 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4505 thiss!1152) (size!1882 (buf!2272 thiss!1152)))))))))

(assert (=> b!88524 d!27816))

(declare-fun d!27818 () Bool)

(assert (=> d!27818 (= (invariant!0 (currentBit!4500 thiss!1151) (currentByte!4505 thiss!1151) (size!1882 (buf!2272 thiss!1151))) (and (bvsge (currentBit!4500 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4500 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4505 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4505 thiss!1151) (size!1882 (buf!2272 thiss!1151))) (and (= (currentBit!4500 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4505 thiss!1151) (size!1882 (buf!2272 thiss!1151)))))))))

(assert (=> b!88519 d!27818))

(declare-fun d!27820 () Bool)

(assert (=> d!27820 (= (array_inv!1728 (buf!2272 thiss!1151)) (bvsge (size!1882 (buf!2272 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!88525 d!27820))

(declare-fun d!27822 () Bool)

(assert (=> d!27822 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4500 thiss!1151) (currentByte!4505 thiss!1151) (size!1882 (buf!2272 thiss!1151))))))

(declare-fun bs!6885 () Bool)

(assert (= bs!6885 d!27822))

(assert (=> bs!6885 m!133683))

(assert (=> start!18002 d!27822))

(declare-fun d!27824 () Bool)

(assert (=> d!27824 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4500 thiss!1152) (currentByte!4505 thiss!1152) (size!1882 (buf!2272 thiss!1152))))))

(declare-fun bs!6886 () Bool)

(assert (= bs!6886 d!27824))

(assert (=> bs!6886 m!133675))

(assert (=> start!18002 d!27824))

(push 1)

(assert (not d!27788))

(assert (not d!27822))

(assert (not d!27824))

(assert (not d!27792))

(check-sat)

(pop 1)

(push 1)

(check-sat)

