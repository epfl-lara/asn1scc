; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73322 () Bool)

(assert start!73322)

(declare-fun res!267051 () Bool)

(declare-fun e!234658 () Bool)

(assert (=> start!73322 (=> (not res!267051) (not e!234658))))

(declare-datatypes ((array!21041 0))(
  ( (array!21042 (arr!10225 (Array (_ BitVec 32) (_ BitVec 8))) (size!9133 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14428 0))(
  ( (BitStream!14429 (buf!8275 array!21041) (currentByte!15355 (_ BitVec 32)) (currentBit!15350 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14428)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73322 (= res!267051 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9133 (buf!8275 thiss!877))) ((_ sign_extend 32) (currentByte!15355 thiss!877)) ((_ sign_extend 32) (currentBit!15350 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73322 e!234658))

(declare-fun e!234659 () Bool)

(declare-fun inv!12 (BitStream!14428) Bool)

(assert (=> start!73322 (and (inv!12 thiss!877) e!234659)))

(declare-fun b!325430 () Bool)

(declare-fun res!267052 () Bool)

(assert (=> b!325430 (=> (not res!267052) (not e!234658))))

(assert (=> b!325430 (= res!267052 (bvsge (currentBit!15350 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!325431 () Bool)

(declare-fun lt!447836 () (_ BitVec 64))

(declare-fun lt!447835 () (_ BitVec 64))

(assert (=> b!325431 (= e!234658 (and (= lt!447836 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!447836 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!447835) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!325431 (= lt!447836 (bvand lt!447835 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!325431 (= lt!447835 (bitIndex!0 (size!9133 (buf!8275 thiss!877)) (currentByte!15355 thiss!877) (currentBit!15350 thiss!877)))))

(declare-fun b!325432 () Bool)

(declare-fun array_inv!8685 (array!21041) Bool)

(assert (=> b!325432 (= e!234659 (array_inv!8685 (buf!8275 thiss!877)))))

(assert (= (and start!73322 res!267051) b!325430))

(assert (= (and b!325430 res!267052) b!325431))

(assert (= start!73322 b!325432))

(declare-fun m!463435 () Bool)

(assert (=> start!73322 m!463435))

(declare-fun m!463437 () Bool)

(assert (=> start!73322 m!463437))

(declare-fun m!463439 () Bool)

(assert (=> b!325431 m!463439))

(declare-fun m!463441 () Bool)

(assert (=> b!325432 m!463441))

(push 1)

(assert (not b!325432))

(assert (not b!325431))

(assert (not start!73322))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107272 () Bool)

(assert (=> d!107272 (= (array_inv!8685 (buf!8275 thiss!877)) (bvsge (size!9133 (buf!8275 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325432 d!107272))

(declare-fun d!107274 () Bool)

(declare-fun e!234683 () Bool)

(assert (=> d!107274 e!234683))

(declare-fun res!267072 () Bool)

(assert (=> d!107274 (=> (not res!267072) (not e!234683))))

(declare-fun lt!447874 () (_ BitVec 64))

(declare-fun lt!447873 () (_ BitVec 64))

(declare-fun lt!447871 () (_ BitVec 64))

(assert (=> d!107274 (= res!267072 (= lt!447873 (bvsub lt!447871 lt!447874)))))

(assert (=> d!107274 (or (= (bvand lt!447871 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447874 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447871 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447871 lt!447874) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107274 (= lt!447874 (remainingBits!0 ((_ sign_extend 32) (size!9133 (buf!8275 thiss!877))) ((_ sign_extend 32) (currentByte!15355 thiss!877)) ((_ sign_extend 32) (currentBit!15350 thiss!877))))))

(declare-fun lt!447869 () (_ BitVec 64))

(declare-fun lt!447872 () (_ BitVec 64))

(assert (=> d!107274 (= lt!447871 (bvmul lt!447869 lt!447872))))

(assert (=> d!107274 (or (= lt!447869 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447872 (bvsdiv (bvmul lt!447869 lt!447872) lt!447869)))))

(assert (=> d!107274 (= lt!447872 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107274 (= lt!447869 ((_ sign_extend 32) (size!9133 (buf!8275 thiss!877))))))

(assert (=> d!107274 (= lt!447873 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15355 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15350 thiss!877))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107274 (invariant!0 (currentBit!15350 thiss!877) (currentByte!15355 thiss!877) (size!9133 (buf!8275 thiss!877)))))

(assert (=> d!107274 (= (bitIndex!0 (size!9133 (buf!8275 thiss!877)) (currentByte!15355 thiss!877) (currentBit!15350 thiss!877)) lt!447873)))

(declare-fun b!325455 () Bool)

(declare-fun res!267071 () Bool)

(assert (=> b!325455 (=> (not res!267071) (not e!234683))))

(assert (=> b!325455 (= res!267071 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447873))))

(declare-fun b!325456 () Bool)

(declare-fun lt!447870 () (_ BitVec 64))

(assert (=> b!325456 (= e!234683 (bvsle lt!447873 (bvmul lt!447870 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325456 (or (= lt!447870 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447870 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447870)))))

(assert (=> b!325456 (= lt!447870 ((_ sign_extend 32) (size!9133 (buf!8275 thiss!877))))))

(assert (= (and d!107274 res!267072) b!325455))

(assert (= (and b!325455 res!267071) b!325456))

(assert (=> d!107274 m!463435))

(declare-fun m!463463 () Bool)

(assert (=> d!107274 m!463463))

(assert (=> b!325431 d!107274))

(declare-fun d!107288 () Bool)

(assert (=> d!107288 (= (remainingBits!0 ((_ sign_extend 32) (size!9133 (buf!8275 thiss!877))) ((_ sign_extend 32) (currentByte!15355 thiss!877)) ((_ sign_extend 32) (currentBit!15350 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9133 (buf!8275 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15355 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15350 thiss!877)))))))

(assert (=> start!73322 d!107288))

(declare-fun d!107290 () Bool)

(assert (=> d!107290 (= (inv!12 thiss!877) (invariant!0 (currentBit!15350 thiss!877) (currentByte!15355 thiss!877) (size!9133 (buf!8275 thiss!877))))))

(declare-fun bs!28231 () Bool)

(assert (= bs!28231 d!107290))

(assert (=> bs!28231 m!463463))

(assert (=> start!73322 d!107290))

(push 1)

(assert (not d!107290))

(assert (not d!107274))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

